<?php

namespace app\project\controller;

use app\common\Model\InviteLink;
use app\common\Model\Member;
use app\common\Model\MemberAccount;
use app\common\Model\Organization;
use controller\BasicApi;
use think\facade\Request;

/**
 * 项目成员
 */
class ProjectMember extends BasicApi
{
    public function __construct()
    {
        parent::__construct();
        if (!$this->model) {
            $this->model = new \app\common\Model\ProjectMember();
        }
    }

    /**
     * @throws \think\exception\DbException
     */
    public function index()
    {
        $project_code = Request::post('projectCode');
        $where = [];
        $where[] = ['project_code', '=', $project_code];
        $list = $this->model->_list($where, 'is_owner desc');
        if ($list['list']) {
            foreach ($list['list'] as &$item) {
                $member = Member::where(['code' => $item['member_code']])->field('name,avatar,code,email')->find();
                !$member && $member = [];
                $member['is_owner'] = $item['is_owner'];
                $item = $member;
            }
        }
        $this->success('', $list);
    }


    /**
     * 邀请成员查询
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public function searchInviteMember()
    {
        $keyword = trim(Request::post('keyword'));
        $code = trim(Request::post('projectCode'));
        if (!$code) {
            $this->error('请先选择项目');
        }
        $orgCode = getCurrentOrganizationCode();
        if (!$keyword) {
            $this->success('');
        }
        $project = \app\common\Model\Project::where(['code' => $code])->field('id')->find();
        //先找出项目所有成员
        $projectMemberIds = $this->model->where([['project_code', '=', $code]])->column('member_code');
        $tempList = [];
        //从当前组织的所有成员查询，判断是否已加入该项目，并存储已加入项目的成员的account_id
        $memberAccountList = MemberAccount::where([['name', 'like', "%{$keyword}%"], ['organization_code', '=', $orgCode]])->select()->toArray();
        if ($memberAccountList) {
            foreach ($memberAccountList as $member) {
                $item = [];
                $item['memberCode'] = $member['member_code'];
                $item['status'] = $member['status'];
                $item['avatar'] = $member['avatar'];
                $item['name'] = $member['name'];
                $item['email'] = $member['email'] ?? '未绑定邮箱';
                $item['joined'] = false;
                if (in_array($member['member_code'], $projectMemberIds)) {
                    $item['joined'] = true;
                    $projectMemberIds[] = $member['member_code'];
                }
                $tempList[$item['memberCode']] = $item; //为了去重
            }
        }
        //从平台查询
        $memberList = Member::where([['email', 'like', "%{$keyword}%"]])->whereNotIn('code', $projectMemberIds)->select()->toArray();
        if ($memberList) {
            foreach ($memberList as $member) {
                $item = [];
                $item['memberCode'] = $member['code'];
                $item['status'] = 1;
                $item['avatar'] = $member['avatar'];
                $item['name'] = $member['name'];
                $item['email'] = $member['email'] ?? '未绑定邮箱';
                $item['joined'] = false;
                if (in_array($item['memberCode'], $projectMemberIds)) {
                    $item['joined'] = true;
                }
                $tempList[$item['memberCode']] = $item; //为了去重
            }
        }
        $this->success('', array_values($tempList));//数组下标重置
    }

    /**
     * 通过邀请连接邀请成员
     */
    public function _joinByInviteLink()
    {
        $inviteCode = Request::param('inviteCode');
        $inviteLink = InviteLink::where(['code' => $inviteCode])->find();
        if (!$inviteLink || nowTime() >= $inviteLink['over_time']) {
            $this->error('该链接已失效');
        }
        if ($inviteLink['invite_type'] == 'project') {
            $project = \app\common\Model\Project::where(['code' => $inviteLink['source_code']])->find();
            if (!$project) {
                $this->error('该项目已失效');
            }
            try {
                $this->model->inviteMember(getCurrentMember()['code'], $project['code']);
            } catch (\Exception $e) {
                $this->error($e->getMessage(), $e->getCode());
            }
        }
        $currentOrganization = null;
        $list = MemberAccount::where(['member_code' => getCurrentMember()['code']])->order('id asc')->select()->toArray();
        $organizationList = [];
        if ($list) {
            foreach ($list as $item) {
                $organization = Organization::where(['code' => $item['organization_code']])->find();
                if ($organization) {
                    $organizationList[] = $organization;
                }
                $item['organization_code'] == $project['organization_code'] && $currentOrganization = $organization;
            }
        }
        $this->success('', ['organizationList' => $organizationList, 'currentOrganization' => $currentOrganization]);
    }

    /**
     * 邀请成员
     */
    public function inviteMember()
    {
        $data = Request::only('memberCode,projectCode');
        if (!$data['memberCode'] || !$data['projectCode']) {
            $this->error('数据异常');
        }
        try {
            $this->model->inviteMember($data['memberCode'], $data['projectCode']);
        } catch (\Exception $e) {
            $this->error($e->getMessage(), $e->getCode());;
        }
        $this->success('');
    }

    /**
     * 移除成员
     */
    public function removeMember()
    {
        $data = Request::only('memberCode,projectCode');
        if (!$data['memberCode'] || !$data['projectCode']) {
            $this->error('数据异常');
        }
        try {
            $this->model->removeMember($data['memberCode'], $data['projectCode']);
        } catch (\Exception $e) {
            $this->error($e->getMessage(), $e->getCode());;
        }
        $this->success('');
    }
}
