<?php

namespace app\project\controller;

use app\common\Model\CommonModel;
use app\common\Model\Department;
use app\common\Model\Member;
use app\common\Model\MemberAccount;
use app\common\Model\SystemConfig;
use controller\BasicApi;
use Exception;
use OSS\Core\OssException;
use service\NodeService;
use think\db\exception\DataNotFoundException;
use think\db\exception\ModelNotFoundException;
use think\Exception\DbException;
use think\exception\PDOException;
use think\facade\Request;

/**
 * @title 项目管理
 * @description 接口说明
 * @group 接口分组
 */
class Index extends BasicApi
{

    /**
     * @title 用户菜单
     * @description 获取用户菜单列表
     * @return void :名称
     * @throws DataNotFoundException
     * @throws ModelNotFoundException
     * @throws DbException
     * @author PearProject
     * @url /project/index
     * @method GET
     */
    public function index()
    {
        $list = MemberAccount::getAuthMenuList();
        $this->success('', $list);
    }

    /**
     * 更换当前组织
     * @throws DataNotFoundException
     * @throws ModelNotFoundException
     * @throws DbException
     */
    public function changeCurrentOrganization()
    {
        $organizationCode = Request::post('organizationCode');
        if ($organizationCode) {
            $member = getCurrentMember();
            $memberAccount = MemberAccount::where(['member_code' => $member['code'], 'organization_code' => $organizationCode])->find();
            $member = Member::where(['account' => $member['account']])->order('id asc')->find()->toArray();

            $departments = [];
            $departmentCodes = $memberAccount['department_code'];
            if ($departmentCodes) {
                $departmentCodes = explode(',', $departmentCodes);
                foreach ($departmentCodes as $departmentCode) {
                    $department = Department::where(['code' => $departmentCode])->field('name')->find();
                    $departments[] = $department['name'];
                }
            }
            $member['position'] = $memberAccount['position'];
            $member['department'] = $departments ? implode(' - ', $departments) : '';
            $member['account_id'] = $memberAccount['id'];
            $member['is_owner'] = $memberAccount['is_owner'];
            $member['authorize'] = $memberAccount['authorize'];
            setCurrentMember($member);
            !empty($member['authorize']) && NodeService::applyProjectAuthNode();
            setCurrentOrganizationCode($organizationCode);

            $list = MemberAccount::getAuthMenuList();
            $this->success('', ['menuList' => $list, 'member' => $member]);
        }
        $this->error('请选择组织');
    }

    /**
     * 系统信息
     */
    public function systemConfig()
    {
        $configModel = new SystemConfig();
        $config = $configModel->info();
        $info = [
            'app_name' => $config['app_name'],
            'app_version' => $config['app_version'],
            'miitbeian' => $config['miitbeian'],
            'site_copy' => $config['site_copy'],
            'site_name' => $config['site_name'],
        ];
        $this->success('', $info);

    }

    /**
     * 个人个信息
     * @throws DataNotFoundException
     * @throws ModelNotFoundException
     * @throws DbException
     */
    public function info()
    {
        $this->success('', Member::find(session('project.id')));
    }

    /**
     * 个人资料修改
     * @return array|string
     */
    public function editPersonal()
    {
        $params = Request::only('mobile,mail,idcard,name,realname,avatar,code');
        $memberModel = new Member();
        $result = $memberModel->_edit($params, ['code' => $params['code']]);
        if (isset($params['avatar'])) {
//            $member = Member::get($params['id']);
            MemberAccount::update(['avatar' => $params['avatar']], ['member_code' => $params['code']]);
        }
        if ($result) {
            $this->success('基本信息更新成功');
        }
        $this->error("操作失败，请稍候再试！");
    }

    /**
     * 密码修改
     * @return array|string
     * @throws DbException
     */
    public function editPassword()
    {
        $memberModel = new Member();
        $params = Request::only('password,newPassword,confirmPassword,id');
        $member = $memberModel->field('password')->get($params['id'])->toArray();
        if (strlen($params['password']) < 6 || strlen($params['newPassword']) < 6 || strlen($params['confirmPassword']) < 6) {
            $this->error("密码必须包含6个字符");
        }
        if ($params['newPassword'] != $params['confirmPassword']) {
            $this->error("两次新密码不匹配");
        }
        $oldPassword = $member['password'];
        if ($params['password'] != $oldPassword) {
            $this->error("原密码不正确");
        }
        $result = $memberModel->_edit(['password' => $params['newPassword']], ['id' => $params['id']]);
        if ($result) {
            $this->success('密码修改成功');
        }
        $this->error("操作失败，请稍候再试！");
    }

    /**
     * @return void
     * @throws OssException
     * @throws \think\Exception
     * @throws PDOException
     */
    public function uploadImg()
    {
        $model = new CommonModel();
        $files = Request::file('image');
        $data = [
            'errno' => 0,
            'data' => []
        ];
        if ($files) {
            foreach ($files as $file) {
                $result = $model->_uploadImg($file, config('upload.base_path') . config('upload.image'));
                $data['data'][] = $result['url'];
            }
        }
        echo json_encode($data, JSON_UNESCAPED_UNICODE);
        die;
    }

    /**
     * 上传头像
     */
    public function uploadAvatar()
    {
        $accountModel = new MemberAccount();
        try {
            $file = $accountModel->uploadImg(Request::file('avatar'));
            $code = Request::param('code');
            $update = ['avatar' => $file['url']];
            Member::update($update, ['code' => $code]);
            MemberAccount::update($update, ['member_code' => $code]);
        } catch (Exception $e) {
            $this->error($e->getMessage(), $e->getCode());;
        }
        $this->success('', $file);
    }
}
