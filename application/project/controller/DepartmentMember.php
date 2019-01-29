<?php

namespace app\project\controller;

use app\common\Model\Member;
use app\common\Model\MemberAccount;
use controller\BasicApi;
use think\facade\Request;

/**
 * 部门成员
 */
class DepartmentMember extends BasicApi
{
    public function __construct()
    {
        parent::__construct();
        if (!$this->model) {
            $this->model = new \app\common\Model\DepartmentMember();
        }
    }

    /**
     * @throws \think\exception\DbException
     */
    public function index()
    {
        $organization_code = getCurrentOrganizationCode();
        $department_code = Request::post('departmentCode', '');
        $where = [];
        $where[] = ['organization_code', '=', $organization_code];
        $where[] = ['department_code', '=', $department_code];
        $list = $this->model->_list($where, 'is_owner desc');
        if ($list['list']) {
            foreach ($list['list'] as &$item) {
                $member = MemberAccount::where(['code' => $item['account_code']])->field('name,avatar,code,email')->find();
                !$member && $member = [];
                $member['is_owner'] = $item['is_owner'];
                $member['is_principal'] = $item['is_principal'];
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
        $department_code = Request::post('departmentCode', '');

        $orgCode = getCurrentOrganizationCode();
        if (!$keyword && !$department_code) {
            $this->success('');
        }
        if ($department_code) {//添加部门成员
            $departmentMemberIds = $this->model->where([['organization_code', '=', $orgCode], ['department_code', '=', $department_code]])->column('account_code');
        } else {
            //添加组织成员
            $departmentMemberIds = MemberAccount::where([['organization_code', '=', $orgCode]])->column('member_code');
        }
        //从当前组织的所有成员查询，判断是否已加入该组织/部门，并存储已加入组织/部门的成员的account_code
        $memberAccountList = MemberAccount::where([['name', 'like', "%{$keyword}%"], ['organization_code', '=', $orgCode], ['status', '=', 1]])->select()->toArray();
        $tempList = [];
        if ($memberAccountList) {
            foreach ($memberAccountList as $member) {
                $item = [];
                //添加组织时，存储member_code,添加部门时存储account_code
                $code = $department_code ? $member['code'] : $member['member_code'];
                $item['accountCode'] = $code;
                $item['avatar'] = $member['avatar'];
                $item['name'] = $member['name'];
                $item['email'] = $member['email'] ?? '未绑定邮箱';
                $item['joined'] = false;
                if (in_array($code, $departmentMemberIds)) {
                    $item['joined'] = true;
                    $departmentMemberIds[] = $member['code'];
                }
                $tempList[$item['accountCode']] = $item; //为了去重
            }
        }
        if (!$department_code) {
            //从平台查询
            $memberList = Member::where([['email', '=', "{$keyword}"]])->whereNotIn('code', $departmentMemberIds)->select()->toArray();
            if ($memberList) {
                foreach ($memberList as $member) {
                    $item = [];
                    $item['accountCode'] = $member['code'];
                    $item['avatar'] = $member['avatar'];
                    $item['name'] = $member['name'];
                    $item['email'] = $member['email'] ?? '未绑定邮箱';
                    $item['joined'] = false;
                    if (in_array($item['accountCode'], $departmentMemberIds)) {
                        $item['joined'] = true;
                    }
                    $tempList[$item['accountCode']] = $item; //为了去重
                }
            }
        }
        $this->success('', array_values($tempList));//数组下标重置
    }


    /**
     * 邀请成员
     */
    public function inviteMember()
    {
        //部门编号为空，则添加至组织
        $data = Request::only('accountCode,departmentCode');
        if (!$data['accountCode']) {
            $this->error('数据异常');
        }
        try {
            $this->model->inviteMember($data['accountCode'], $data['departmentCode']);
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
        $data = Request::only('accountCode,departmentCode');
        if (!$data['accountCode'] || !$data['departmentCode']) {
            $this->error('数据异常');
        }
        try {
            $this->model->removeMember($data['accountCode'], $data['departmentCode']);
        } catch (\Exception $e) {
            $this->error($e->getMessage(), $e->getCode());;
        }
        $this->success('');
    }
}
