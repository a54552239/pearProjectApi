<?php

namespace app\project\controller;

use app\common\Model\CommonModel;
use app\common\Model\Member;
use app\common\Model\MemberAccount;
use app\common\Model\Notify;
use app\common\Model\SourceLink;
use app\common\Model\SystemConfig;
use controller\BasicApi;
use service\FileService;
use service\NodeService;
use think\facade\Request;
use think\File;

/**
 * 应用入口控制器
 */
class Index extends BasicApi
{

    /**
     * 后台框架布局
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public function index()
    {
        $list = MemberAccount::getAuthMenuList();
        $this->success('', $list);
    }

    /**
     * 更换当前组织
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public function changeCurrentOrganization()
    {
        $organizationCode = Request::post('organizationCode');
        if ($organizationCode) {
            $member = getCurrentMember();
            $memberAccount = MemberAccount::where(['member_code' => $member['code'], 'organization_code' => $organizationCode])->find();
            $member = Member::where(['account' => $member['account']])->order('id asc')->find()->toArray();
            $member['account_id'] = $memberAccount['id'];
            $member['is_owner'] = $memberAccount['is_owner'];
            $member['authorize'] = $memberAccount['authorize'];
            setCurrentMember($member);
            !empty($member['authorize']) && NodeService::applyProjectAuthNode();
            setCurrentOrganizationCode($organizationCode);

            $list = MemberAccount::getAuthMenuList();
            $this->success('', $list);
        }
        $this->error('请选择组织');
    }

    /**
     * 系统信息
     */
    public function systemConfig()
    {
        $configModel = new SystemConfig();
        $this->success('', $configModel->info());

    }


    /**
     * 个人个信息
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
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
        $params = Request::only('mobile,mail,idcard,name,realname,avatar,id');
        $memberModel = new Member();
        $result = $memberModel->_edit($params, ['id' => Request::post('id')]);
        if ($result) {
            $this->success('基本信息更新成功');
        }
        $this->error("操作失败，请稍候再试！");
    }

    /**
     * 密码修改
     * @return array|string
     * @throws \think\Exception\DbException
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
     * @throws \OSS\Core\OssException
     * @throws \think\Exception
     * @throws \think\exception\PDOException
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
        } catch (\Exception $e) {
            $this->error($e->getMessage(), $e->getCode());;
        }
        $this->success('', $file);
    }
}
