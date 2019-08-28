<?php

namespace app\project\controller;

use app\common\Model\Member;
use app\common\Model\MemberAccount;
use controller\BasicApi;
use think\facade\Request;

/**
 * 任务成员
 */
class TaskMember extends BasicApi
{
    public function __construct()
    {
        parent::__construct();
        if (!$this->model) {
            $this->model = new \app\common\Model\TaskMember();
        }
    }

    /**
     * 任务成员
     * @throws \think\exception\DbException
     */
    public function index()
    {
        $taskCode = Request::post('taskCode');
        $where = [];
        $where[] = ['task_code', '=', $taskCode];
        $list = $this->model->_list($where, 'is_owner desc');
        if ($list['list']) {
            $organizaionCode = getCurrentOrganizationCode();
            foreach ($list['list'] as &$item) {
                $member = Member::where(['code' => $item['member_code']])->field('id,name,avatar,code')->find();
                !$member && $member = [];
                $memberAccount = MemberAccount::where(['member_code' => $member['code'], 'organization_code' => $organizaionCode])->field('code,status,authorize')->find();
                $member['membar_account_code'] = $memberAccount ? $memberAccount['code'] : '';
                $member['is_executor'] = $item['is_executor'];
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
        $projectId = $project['id'];
        //先找出项目所有成员
        $projectMemberIds = $this->model->where([['project_code', '=', $code]])->column('member_code');
        $tempList = [];
        //从当前组织的所有成员查询，判断是否已加入该项目，并存储已加入项目的成员的account_id
        $memberAccountList = MemberAccount::where([['name', 'like', "%{$keyword}%"], ['organization_code', '=', $orgCode]])->select()->toArray();
        if ($memberAccountList) {
            foreach ($memberAccountList as $member) {
                $item = [];
                $item['memberCode'] = $member['member_code'];
                $item['avatar'] = $member['avatar'];
                $item['name'] = $member['name'];
                $item['email'] = $member['email'] ?? '未绑定邮箱';
                $item['joined'] = false;
                if (in_array($member['member_code'], $projectMemberIds)) {
                    $item['joined'] = true;
                }
                $projectMemberIds[] = $member['member_code'];
                $tempList[$item['memberCode']] = $item; //为了去重
            }
        }
        //从平台查询
        $memberList = Member::where([['email', 'like', "%{$keyword}%"]])->whereNotIn('id', $projectMemberIds)->select()->toArray();
        if ($memberList) {
            foreach ($memberList as $member) {
                $item = [];
                $item['memberCode'] = $member['member_code'];
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
     * 邀请成员
     */
    public function inviteMember()
    {
        $data = Request::only('memberCode,taskCode');
        if (!$data['memberCode'] || !$data['taskCode']) {
            $this->error('数据异常');
        }
        try {
            $this->model->inviteMember($data['memberCode'], $data['taskCode']);
        } catch (\Exception $e) {
            $this->error($e->getMessage(), $e->getCode());;
        }
        $this->success('');
    }

    /**
     * 批量邀请成员
     */
    public function inviteMemberBatch()
    {
        $data = Request::only('memberCodes,taskCode');
        if (!$data['memberCodes'] || !$data['taskCode']) {
            $this->error('数据异常');
        }
        try {
            $this->model->inviteMemberBatch(json_decode($data['memberCodes']), $data['taskCode']);
        } catch (\Exception $e) {
            $this->error($e->getMessage(), $e->getCode());;
        }
        $this->success('');
    }
}
