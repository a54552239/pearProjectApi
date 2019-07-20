<?php

namespace app\project\controller;

use app\common\Model\Member;
use app\common\Model\MemberAccount;
use app\common\Model\Organization;
use controller\BasicApi;
use Exception;
use service\JwtService;
use service\LogService;
use service\NodeService;
use service\RandomService;
use mail\Mail;
use sms\Sms;
use think\Db;
use think\db\exception\DataNotFoundException;
use think\db\exception\ModelNotFoundException;
use think\exception\DbException;
use think\exception\PDOException;
use think\facade\Hook;
use think\facade\Log;
use think\facade\Request;
use think\facade\Validate;


/**
 * @title 用户相关
 * @description 接口说明
 * @group 接口分组
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
     * @title 用户登录
     * @description 用户登录
     * @return void :名称
     * @throws DataNotFoundException
     * @throws DbException
     * @throws ModelNotFoundException
     * @throws \think\Exception
     * @throws PDOException
     * @author PearProject
     * @url /project/login
     * @method POST
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
            if (cache('captcha') != Request::param('captcha')) {
                $this->error('验证码错误', 203);
            }
            if (cache('captchaMobile') != $mobile) {
                $this->error('手机号与验证码不匹配', 203);
            }
            $member = Member::where(['mobile' => $mobile])->order('id asc')->find();
        } else {
            $member = Member::where(['account' => $data['account']])->whereOr(['email' => $data['account']])->order('id asc')->find();
        }
        empty($member) && $this->error('账号或密码错误', 201);
        $member = $member->toArray();
        empty($member['status']) && $this->error('账号已经被禁用');
        if (!$mobile) {
            $member['password'] !== $data['password'] && $this->error('账号或密码错误', 201);
        }
        $result = Member::login($member);
        $this->success('', $result);
    }

    /**
     * 获取验证码
     */
    public function getCaptcha()
    {
        $mobile = $this->request->post('mobile', '');
        $code = RandomService::numeric(6);
        if (!config('sms.debug')) {
            $sms = new Sms();
            $result = $sms->vSend($mobile, [
                'data' => [
                    'project' => 'DWYsW1',
                    'code' => $code
                ],
            ]);
            if (isError($result)) {
                $this->error('系统繁忙');
            }
        }
        cache('captcha:' . $mobile, $code, 60 * 15);
        $this->success('', config('sms.debug') ? $code : '');
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
        if (cache('captcha:' . $data['mobile']) != $data['captcha']) {
            $this->error('验证码错误', 203);
        }
//        if (cache('captchaMobile') != $data['mobile']) {
//            $this->error('手机号与验证码不匹配', 203);
//        }
        $memberData = [
            'email' => $data['email'],
            'name' => $data['name'],
            'account' => RandomService::alnumLowercase(),
            'avatar' => 'https://static.vilson.online/cover.png',
            'status' => 1,
            'code' => createUniqueCode('member'),
            'password' => $data['password'],
            'mobile' => $data['mobile'],
        ];
        try {
            $result = Member::createMember($memberData);
        } catch (Exception $e) {
            $this->error($e->getMessage(), 205);
        }
        if (!$result) {
            $this->error('注册失败', 203);
        }
        $this->success('');
    }

    /**
     * 绑定手机
     * @throws DataNotFoundException
     * @throws DbException
     * @throws ModelNotFoundException
     */
    public function _bindMobile()
    {
        $mobile = $this->request->post('mobile', '');
        if (cache('captcha:' . $mobile) != Request::param('captcha')) {
            $this->error('验证码错误', 203);
        }
//        if (cache('captchaMobile') != $mobile) {
//            $this->error('手机号与验证码不匹配', 203);
//        }
        $member = getCurrentMember();
        if ($mobile && $member['mobile'] == $mobile) {
            $this->error('你已绑定该手机', 203);
        }
        $other = Member::where(['mobile' => $mobile])->find();
        if ($other && $other['id'] != $member['id']) {
            $this->error('该手机已被绑定', 203);
        }
        $result = Member::update(['mobile' => $mobile], ['id' => $member['id']]);
        $member['mobile'] = $mobile;
        if ($result) {
            setCurrentMember($member);
            $tokenList = JwtService::initToken($member);
            $accessTokenExp = JwtService::decodeToken($tokenList['accessToken'])->exp;
            $tokenList['accessTokenExp'] = $accessTokenExp;
            $this->success('绑定成功！', ['member' => $member, 'tokenList' => $tokenList]);
        }
    }

    /**
     * 获取邮箱验证码
     */
    public function _getMailCaptcha()
    {
//        if (!config('mail.open')) {
//            $this->error('系统尚未开启邮件服务');
//        }
        $email = $this->request->post('email', '');
        $code = RandomService::numeric(6);
        cache('captcha:' . $email, $code, 60 * 15);
        $member = getCurrentMember();
        if (config('mail.open')) {
            $mailer = new Mail();
            try {
                $mail = $mailer->mail;
                $mail->CharSet = 'utf-8';
                $mail->setFrom(config('mail.Username'), 'pearProject');
                $mail->addAddress($email, getCurrentMember()['name']);
                //Content
                $mail->isHTML(true);
                $mail->Subject = '重置密码验证码：' . $code;
//            $info = [
//                'member_code' => $member['code'],
//                'email' => $email,
//            ];
//            $accessToken = JwtService::getAccessToken($info);
//            $link = Request::domain() . '/#/reset/email?token=' . $accessToken;
                $mail->Body = '
<p>系统检测到你正在尝试重置密码，验证码：' . $code . '。验证码15分钟内有效，请在重置页面输入验证码并进行下一步操作, 如非你本人操作，请忽略此邮件。</p>';
                $mail->send();
            } catch (Exception $e) {
                ob_clean();
                $this->error('发送失败 ');
            }
        }
        $this->success('', !config('mail.open') ? $code : '');
    }

    /**
     * 绑定邮箱
     */
    public function _bindMail()
    {
        if (!config('mail.open')) {
            $this->error('系统尚未开启邮件服务');
        }
        $member = getCurrentMember();

        $email = $this->request->post('mail', '');
        if ($email && $member['email'] == $email) {
            $this->error('你已绑定该邮箱', 203);
        }
        $mailer = new Mail();
        try {
            $mail = $mailer->mail;
            $mail->CharSet = 'utf-8';
            $mail->setFrom(config('mail.Username'), 'pearProject');
            $mail->addAddress($email, getCurrentMember()['name']);
            //Content
            $mail->isHTML(true);
            $mail->Subject = '申请修改邮箱地址';
            $info = [
                'member_code' => $member['code'],
                'email' => $email,
            ];
            $accessToken = JwtService::getAccessToken($info);
            $link = Request::domain() . '/#/reset/email?token=' . $accessToken;
            $mail->Body = '
<p>您最近申请了修改您的邮箱地址，点击下面的链接进行修改，如果您从未提交过此申请，请忽略此邮件。</p>
<a href="' . $link . '" target="_blank" style="display: inline-block;padding: 8px 24px;background: #1890ff;border-radius: 4px;font-weight: normal;letter-spacing: 1px;font-size: 14px;color: white;text-decoration: none;" rel="noopener">
                验证邮箱
            </a>
            <p>如果按钮无法点击，请点击以下链接进行验证:</p>
            <a href="' . $link . '">' . $link . '</a>
            ';
            $mail->send();
        } catch (Exception $e) {
            ob_clean();
            $this->error('发送失败 ');
        }
        $this->success('发送邮件成功');
    }

    /**
     * 解绑钉钉
     * @throws DataNotFoundException
     * @throws DbException
     * @throws ModelNotFoundException
     */
    public function _unbindDingtalk()
    {
        $currentMember = getCurrentMember();
        $memberCode = $currentMember['code'];
        $member = Member::where(['code' => $memberCode])->find();
        if (!$member['mobile'] && !$member['email']) {
            $this->error('您未绑定手机或邮箱，无法解绑 ');
        }
        $member->dingtalk_openid = '';
        $member->dingtalk_unionid = '';
        $member->dingtalk_userid = '';
        $member->save();
        $currentMember['dingtalk_openid'] = '';
        $currentMember['dingtalk_unionid'] = '';
        $currentMember['dingtalk_userid'] = '';
        setCurrentMember($currentMember);
        $this->success('解除绑定成功', $currentMember);
    }

    /**
     * 验证绑定邮箱
     * @throws DataNotFoundException
     * @throws DbException
     * @throws ModelNotFoundException
     */
    public function _checkBindMail()
    {
        $accessToken = $this->request->post('token', '');
        $data = JwtService::decodeToken($accessToken);
        $isError = isError($data);
        if (!$isError) {
            $other = Member::where(['email' => $data->data->email])->find();
            if ($other && $other['code'] != $data->data->member_code) {
                $this->error('该邮箱已被绑定', 203);
            }
            $result = Member::update(['email' => $data->data->email], ['code' => $data->data->member_code]);
            if ($result) {
                $this->success();
            }
        }
        $this->error('验证失败！');

    }

    /**
     * 通过邮箱重置密码
     * @throws DataNotFoundException
     * @throws DbException
     * @throws ModelNotFoundException
     */
    public function _resetPasswordByMail()
    {
        $data = Request::only('email,password,password2,mobile,captcha');
        $validate = Validate::make([
            'email' => 'require',
            'password' => 'require|min:6',
            'password2' => 'require|min:6',
            'captcha' => 'require|min:6',
        ], [
            'email.require' => '邮箱账号不能为空！',
            'password.require' => '登陆密码不能为空！',
            'password.min' => '登录密码长度不能少于6位有效字符！',
            'password2.require' => '确认密码不能为空！',
            'password2.min' => '确认密码长度不能少于6位有效字符！',
            'captcha.require' => '验证码不能为空！',
            'captcha.min' => '验证码格式有误',
        ]);
        $validate->check($data) || $this->error($validate->getError());
        $email = $this->request->post('email', '');
        if (cache('captcha:' . $email) != Request::param('captcha')) {
            $this->error('验证码错误', 203);
        }
        $member = Member::where(['email' => $email])->find();
        if (!$member) {
            $this->error('该邮箱账号不存在', 203);
        }
        $member->password = $data['password'];
        $member->save();
            $this->success('重置密码成功，请登录');
    }

    /**
     * 检测登陆信息
     */
    public function _checkLogin()
    {
        $loginInfo = session('loginInfo');
        $this->success('', $loginInfo);
    }

    /*
     * 获取当前用户信息
     */
    public function _currentMember()
    {
        $this->success('', getCurrentMember());
    }


    /**
     * 退出登录
     */
    public function _out()
    {
        Member::logout();
        $this->success('');
    }

}
