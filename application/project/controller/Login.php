<?php

namespace app\project\controller;

use app\common\Model\Member;
use app\common\Model\Organization;
use controller\BasicApi;
use service\LogService;
use service\NodeService;
use service\RandomService;
use think\Db;
use think\db\exception\DataNotFoundException;
use think\db\exception\ModelNotFoundException;
use think\exception\DbException;
use think\facade\Hook;
use think\facade\Log;
use think\facade\Request;
use think\facade\Validate;


/**
 * 系统登录控制器
 * class Order
 * @package app\admin\controller
 * @author Vilson
 */
class Login extends BasicApi
{

    /**
     * 控制器基础方法
     */
    public function initialize()
    {
    }

    /**
     * 用户登录
     * @return string
     * @throws \think\Exception
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     * @throws \think\exception\PDOException
     */
    public function index()
    {
//        if ($this->request->isGet()) {
//            var_dump(11);die;
//            return $this->fetch('', ['title' => '用户登录']);
//        }
        // 输入数据效验
//        $validate = Validate::make([
//            'account' => 'require|min:4',
//            'password' => 'require|min:4',
//        ], [
//            'account.require' => '登录账号不能为空！',
//            'account.min' => '登录账号长度不能少于4位有效字符！',
//            'password.require' => '登录密码不能为空！',
//            'password.min' => '登录密码长度不能少于4位有效字符！',
//        ]);
        $data = [
            'account' => $this->request->post('account', ''),
            'password' => $this->request->post('password', ''),
        ];
//        $validate->check($data) || $this->error($validate->getError());
        // 用户信息验证
        $mobile = $this->request->post('mobile', '');
        if ($mobile) {
            $member = \app\common\Model\Member::where(['mobile' => $mobile])->order('id asc')->find();
        } else {
            $member = \app\common\Model\Member::where(['account' => $data['account']])->whereOr(['email' => $data['account']])->order('id asc')->find();
        }
        empty($member) && $this->error('账号或密码错误', 201);
        $member = $member->toArray();
        empty($member['status']) && $this->error('账号已经被禁用');
        if (!$mobile) {
            $member['password'] !== $data['password'] && $this->error('账号或密码错误', 201);
        }
        // 更新登录信息
        Db::name('Member')->where(['id' => $member['id']])->update([
            'last_login_time' => Db::raw('now()'),
        ]);
        $list = \app\common\Model\MemberAccount::where(['member_code' => $member['code']])->order('id asc')->select()->toArray();
        $organizationList = [];
        if ($list) {
            foreach ($list as $item) {
                $organization = Organization::where(['code' => $item['organization_code']])->find();
                if ($organization) {
                    $organizationList[] = $organization;
                }
            }
        }
        $member['account_id'] = $list[0]['id'];
        $member['is_owner'] = $list[0]['is_owner'];
        $member['authorize'] = $list[0]['authorize'];
        $member['position'] = $list[0]['position'];
        $member['department'] = $list[0]['department'];

        session('member', $member);
        !empty($member['authorize']) && NodeService::applyProjectAuthNode();
        Log::write(json_encode($member), "member-login");
        $this->success('', ['member' => $member, 'organizationList' => $organizationList]);
    }

    public function getCaptcha()
    {
        $this->success('', RandomService::numeric(6));
    }

    public function register()
    {
        $data = Request::only('email,name,password,password2,mobile,captcha');
        $validate = Validate::make([
            'email' => 'require',
            'name' => 'require',
            'password' => 'require|min:6',
            'password2' => 'require|min:6',
            'mobile' => 'require|min:11',
            'captcha' => 'require|min:6',
        ], [
            'email.require' => '邮箱账号不能为空！',
            'name.require' => '姓名不能为空！',
            'password.require' => '登陆密码不能为空！',
            'password.min' => '登录密码长度不能少于6位有效字符！',
            'password2.require' => '确认密码不能为空！',
            'password2.min' => '确认密码长度不能少于6位有效字符！',
            'mobile.require' => '手机号码不能为空！',
            'mobile.min' => '手机号码格式有误',
            'captcha.require' => '验证码不能为空！',
            'captcha.min' => '验证码格式有误',
        ]);
        $validate->check($data) || $this->error($validate->getError());
        $member = Member::where(['email' => $data['email']])->field('id')->find();
        if ($member) {
            $this->error('该邮箱已被注册', 201);
        }
        $member = Member::where(['mobile' => $data['mobile']])->field('id')->find();
        if ($member) {
            $this->error('该手机已被注册', 202);
        }
        $memberData = [
            'email' => $data['email'],
            'name' => $data['name'],
            'account' => RandomService::alnumLowercase(),
            'avatar' => 'https://static.vilson.xyz/cover.png',
            'status' => 1,
            'code' => createUniqueCode('member'),
            'password' => $data['password'],
            'mobile' => $data['mobile'],
        ];
        try {
            $result = Member::createMember($memberData);
        } catch (\Exception $e) {
            $this->error($e->getMessage(), 205);
        }
        if (!$result) {
            $this->error('注册失败', 203);
        }
        $this->success('');
    }

    /**
     * 退出登录
     */
    public function out()
    {
        session('user') && LogService::write('系统管理', '用户退出系统成功');
        !empty($_SESSION) && $_SESSION = [];
        [session_unset(), session_destroy()];
        $this->success('退出登录成功！');
    }

}
