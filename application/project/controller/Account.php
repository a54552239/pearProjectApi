<?php

namespace app\project\controller;

use app\common\Model\Member;
use app\common\Model\MemberAccount;
use app\common\Model\Organization;
use app\common\Model\SystemConfig;
use controller\BasicApi;
use service\FileService;
use service\MessageService;
use service\NodeService;
use think\facade\Request;
use think\File;

/**
 * Class Account
 * @package app\project\controller
 */
class Account extends BasicApi
{

    public function __construct()
    {
        parent::__construct();
        if (!$this->model) {
            $this->model = new MemberAccount();
        }
    }

    /**
     * 账户列表
     * @return array|string
     * @throws \think\exception\DbException
     */
    public function index()
    {
        $currentOrganizationCode = getCurrentOrganizationCode();
        $where = [['organization_code', '=', $currentOrganizationCode]];
//        $where = [['organization_code', '=', $currentOrganizationCode], ['is_owner', '=', 0]];
        $params = Request::only('account,mobile,email,searchType,keyword');
        $departmentCode = Request::param('departmentCode');
        if (isset($params['keyword']) && $params['keyword']) {
            $where[] = ['name', 'like', "%{$params['keyword']}%"];
        }
        if (isset($params['searchType'])) {
            $searchType = $params['searchType'];
            switch ($searchType) {
                case 1:
                    $where[] = ['status', '=', 1];
                    break;
                case 2:
                    $where[] = ['department_code', '=', ''];
                    break;
                case 3:
                    $where[] = ['status', '=', 0];
                    break;
                case 4:
                    $where[] = ['status', '=', 1];
                    $where[] = ['department_code', 'like', "%{$departmentCode}%"];
                    break;
                default:
                    $where[] = ['status', '=', 1];

            }
        }
        foreach (['account', 'mobile', 'email'] as $key) {
            (isset($params[$key]) && $params[$key] !== '') && $where[] = [$key, 'like', "%{$params[$key]}%"];
        }
        if (isset($params['date']) && $params['date'] !== '') {
            list($start, $end) = explode('~', $params['date']);
            $where[] = ['last_login_time', 'between', ["{$start} 00:00:00", "{$end} 23:59:59"]];
        }
        $list = $this->model->_list($where, 'id asc');
        if ($list['list']) {
            $organizaionCode = getCurrentOrganizationCode();
            foreach ($list['list'] as &$item) {
                $memberInfo = Member::where(['code' => $item['member_code']])->field('id', true)->find();
                if ($memberInfo) {
                    $item['avatar'] = $memberInfo['avatar'];
                }
                $memberAccount = MemberAccount::where(['member_code' => $memberInfo['code'], 'organization_code' => $organizaionCode])->field('code,status,authorize')->find();
                $item['membar_account_code'] = $memberAccount ? $memberAccount['code'] : '';
                $departments = [];
                $departmentCodes = $item['department_code'];
                if ($departmentCodes) {
                    $departmentCodes = explode(',', $departmentCodes);
                    foreach ($departmentCodes as $departmentCode) {
                        $department = \app\common\Model\Department::where(['code' => $departmentCode])->field('name')->find();
                        $departments[] = $department['name'];
                    }
                }
                $item['departments'] = $departments ? implode(' - ', $departments) : '';
            }
            unset($item);
        }
        $list['authList'] = \app\common\Model\ProjectAuth::where(['status' => '1', 'organization_code' => $currentOrganizationCode])->select();
        $this->success('', $list);
    }

    public function read()
    {
        $code = Request::param('code');
        if (!$code) {
            $this->error("缺少参数");
        }
        $memberAccount = $this->model->where(['code' => $code])->field('id', true)->find();
        if ($memberAccount) {
            $departments = [];
            $departmentCodes = $memberAccount['department_code'];
            if ($departmentCodes) {
                $departmentCodes = explode(',', $departmentCodes);
                foreach ($departmentCodes as $departmentCode) {
                    $department = \app\common\Model\Department::where(['code' => $departmentCode])->field('name')->find();
                    $departments[] = $department['name'];
                }
            }
            $memberAccount['departments'] = $departments ? implode(' - ', $departments) : '';
        }
        $this->success('', $memberAccount);
    }

    /**
     * 授权管理
     * @return array|string
     */
    public function auth()
    {
        $params = Request::only('id,auth');
        $data = ['id' => $params['id']];
        if ($params['auth']) {
            //        //支持同时设置多个角色，默认关闭
            $data['authorize'] = intval($params['auth']);
//            $data['authorize'] = implode(',', json_decode($params['auth']));
        } else {
            $data['authorize'] = '';
        }
        $result = $this->model->_edit($data);
        if ($result) {
            $this->success('');
        }
        $this->error("操作失败，请稍候再试！");
    }

    /**
     * 通过邀请连接邀请成员
     */
    public function _joinByInviteLink()
    {
        $inviteCode = Request::param('inviteCode');
        $inviteLink = \app\common\Model\InviteLink::where(['code' => $inviteCode])->find();
        if (!$inviteLink || nowTime() >= $inviteLink['over_time']) {
            $this->error('该链接已失效');
        }
        if ($inviteLink['invite_type'] == 'organization') {
            $organization = \app\common\Model\Organization::where(['code' => $inviteLink['source_code']])->find();
            if (!$organization) {
                $this->error('该组织不存在');
            }
            $result = MemberAccount::inviteMember(getCurrentMember()['code'], $organization['code']);
            if (isError($result)) {
                $this->error($result['msg'], $result['errno']);
            }
        }
        $currentOrganization = null;
        $list = MemberAccount::where(['member_code' => getCurrentMember()['code']])->order('id asc')->select()->toArray();
        $organizationList = [];
        if ($list) {
            foreach ($list as $item) {
                $organizationInfo = Organization::where(['code' => $item['organization_code']])->find();
                if ($organizationInfo) {
                    $organizationList[] = $organizationInfo;
                }
            }
        }
        $this->success('', ['organizationList' => $organizationList, 'currentOrganization' => $organization]);
    }

    /**
     * 更新本团队内的头像和手机、邮箱
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public function _syncDetail()
    {
        $code = Request::post('code');
        $memberAccount = $this->model->where(['code' => $code])->find();
        $memberInfo = Member::where('code', $memberAccount['member_code'])->find();
        if (!$memberInfo) {
            $this->error("更新失败！");
        }
        $memberAccount->avatar = $memberInfo['avatar'];
        !$memberAccount->mobile && $memberAccount->mobile = $memberInfo['mobile'];
        !$memberAccount->email && $memberAccount->email = $memberInfo['email'];
        $memberAccount->save();
        $this->success('更新成功');
    }

    /**
     * 账户添加
     * @return array|string
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public function add()
    {
        //todo 权限判断

        $params = Request::only('account,mail,mobile,desc,password,realname,name');
        if ($params['password']) {
            $params['password'] = md5($params['password']);
        } else {
            unset($params['password']);
        }
        $member = getCurrentMember();
        $currentOrganizationCode = getCurrentOrganizationCode();
        $params['create_time'] = nowTime();
        $params['member_code'] = $member['code'];
        $params['organization_code'] = $currentOrganizationCode;
        $user = $this->model->where(['account' => $params['account'], 'member_code' => $member['code'], 'organization_code' => $currentOrganizationCode])->find();
        $user && $this->error("该账号已存在！");
        $result = $this->model->_add($params);
        if ($result) {
            $this->success('', $result);
        }
        $this->error("操作失败，请稍候再试！");
    }

    /**
     * 账户编辑
     * @return array|string
     */
    public function edit()
    {
        //todo 权限判断

        $params = Request::only('mobile,email,desc,name,position,code,description');
        $result = $this->model->_edit($params, ['code' => $params['code']]);
        if ($result) {
            $this->success('');
        }
        $this->error("操作失败，请稍候再试！");
    }

    /**
     * 删除账户
     */
    public function del()
    {
        try {
            $result = $this->model->del(Request::post('accountCode'));
        } catch (\Exception $e) {
            $this->error($e->getMessage(), $e->getCode());;
        }
        if ($result) {
            $this->success('', $result);
        }
        $this->error("账户删除失败，请稍候再试！");
    }

    /**
     * 账户禁用
     */
    public function forbid()
    {
        //todo 权限判断

        $params = Request::only('status,accountCode');
        $result = $this->model->_edit(['status' => $params['status']], ['code' => $params['accountCode']]);
        if ($result) {
            $this->success('');
        }
        $this->error("账户禁用失败，请稍候再试！");
    }

    /**
     * 账户恢复
     */
    public function resume()
    {
        //todo 权限判断

        $params = Request::only('status,accountCode');
        $result = $this->model->_edit(['status' => $params['status']], ['code' => $params['accountCode']]);
        if ($result) {
            $this->success('');
        }
        $this->error("账户启用失败，请稍候再试！");
    }

}
