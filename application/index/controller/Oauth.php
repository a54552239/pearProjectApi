<?php
/**
 * Created by PhpStorm.
 * User: Lenovo
 * Date: 2019/1/2
 * Time: 15:03
 */

namespace app\index\controller;


use app\common\Model\Client;
use app\common\Model\Member;
use controller\BasicApi;
use EasyDingTalk\Application;
use Symfony\Component\HttpFoundation\RedirectResponse;
use think\facade\Log;
use think\facade\Request;
use think\response\Redirect;

class Oauth extends BasicApi
{

    public function index()
    {
        $app = new Application(config('dingtalk.'));
        $userId = $app->user->getUseridByUnionid('3CnKFHEE7mX1hayPIHvpCwiEiE');
//        echo json_encode($userId);die;
        $userId = $userId['userid'];
        $user = $app->user->get($userId, $lang = null);
        echo json_encode($user);die;
    }

    public function dingTalkOauth()
    {
        $currentMember = getCurrentMember();
        if (!$currentMember) {
            $app = new Application(config('dingtalk.'));
            $response = $app->oauth->use('app-01')->withQrConnect()->redirect();
            $redirect = $response->getTargetUrl();
            if ($redirect) {
                if ($redirect == 'undefined') {
                    $redirect = '/';
                }
                $_SESSION['target_url'] = $redirect;
            }
            return redirect($redirect);
        } else {
            //已登录跳转
            return redirect(Request::domain() . '/index.html');
        }
    }


    /**
     * 获取钉钉授权
     * @return RedirectResponse|Redirect
     */
    public function dingTalkOauthCallback()
    {
        $app = new Application(config('dingtalk.'));
        $data = Request::param();
        logRecord($data);
        $user = $app->oauth->use('app-01')->user();
        $response = $app->oauth->use('app-01')->redirect();
        $redirect = $response->getTargetUrl();
        logRecord($redirect);
        logRecord($user);
        //用户注册/绑定微信
        $targetUrl = '/index.html#/member/login?logged=1';
        if (!$user['errcode']) {
            $result = $app->user->getUseridByUnionid($user['user_info']['unionid']);
            if (!$result['errcode']) {
                $user['user_info']['avatar'] = $result['avatar'];
                $user['user_info']['mobile'] = $result['mobile'];
                $user['user_info']['email'] = $result['email'];
            }
            Member::dingtalkLogin($user['user_info']);
        }else{
            $targetUrl = '/index.html#/member/login?logged=0&message=钉钉登录失败，请重试';
        }
        // 登录成功跳转
        return redirect(Request::domain() . $targetUrl);
    }
}
