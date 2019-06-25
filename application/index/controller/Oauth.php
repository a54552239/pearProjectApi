<?php
/**
 * Created by PhpStorm.
 * User: Lenovo
 * Date: 2019/1/2
 * Time: 15:03
 */

namespace app\index\controller;


use app\common\Model\Member;
use controller\BasicApi;
use EasyDingTalk\Application;
use Symfony\Component\HttpFoundation\RedirectResponse;
use think\db\exception\DataNotFoundException;
use think\db\exception\ModelNotFoundException;
use think\exception\DbException;
use think\facade\Log;
use think\facade\Request;
use think\response\Redirect;

class Oauth extends BasicApi
{

    public function index()
    {
        $app = new Application(config('dingtalk.'));
        $msg = [
            'msgtype' => "oa",
            'oa' => [
                'message_url' => 'http://dingtalk.com',
                'head' => ['bgcolor' => 'FFBBBBBB', 'title' => '消息通知'],
                'body' => ['title' => '888', 'content' => '666'],
            ]
        ];
        $params = [
            'agent_id'=> '271863764',
            'userid_list' => 'manager9168',
            'msg'=> json_encode($msg)
        ];
        $res = $app->conversation->sendCorporationMessage($params);
        echo json_encode($res);die;
        $userId = $app->user->getUseridByUnionid('3CnKFHEE7mX1hayPIHvpCwiEiE');
//        echo json_encode($userId);die;
        $userId = $userId['userid'];
        $user = $app->user->get($userId, $lang = null);
        echo json_encode($user);die;
    }

    /**
     * 获取钉钉登录授权
     * @return Redirect
     */
    public function dingTalkOauth()
    {
        $redirectPath = Request::param('redirectPath', '');
        $bindDingtalk = Request::param('bindDingtalk', '');
        $currentMember = getCurrentMember();
        if (!$currentMember || $bindDingtalk) {
            $app = new Application(config('dingtalk.'));
//            $response = $app->oauth->use('app-01')->redirect();
            $response = $app->oauth->use('app-01')->withQrConnect()->redirect();
            $redirect = $response->getTargetUrl();
            if ($redirectPath) {
                session('redirectPath', $redirectPath);
            }
            $redirectPath && $redirect .= '&$redirectPath=' . $redirectPath;
            return redirect($redirect);
        } else {
            //已登录跳转
            return redirect(Request::domain() . '/index.html');
        }
    }

    /**
     * 钉钉应用内免密登录
     * @throws DataNotFoundException
     * @throws ModelNotFoundException
     * @throws DbException
     */
    public function dingTalkLoginByCode()
    {
        $code = Request::param('code');
        logRecord($code);
        $app = new Application(config('dingtalk.'));
        $result = $app->user->getUserByCode($code);
        logRecord($result);
        if (!$result['errcode']) {
            $userId = $result['userid'];
            $user = $app->user->get($userId, $lang = null);
            logRecord($user);
            if (!$user['errcode']) {
                $userInfo = [
                    'unionid' => $user['unionid'],
                    'openid' => $user['openId'],
                    'userId' => $user['userid'],
                    'nick' => $user['name'],
                    'avatar' => $user['avatar'],
                    'mobile' => $user['mobile'],
                    'email' => $user['email'],
                ];
                Member::dingtalkLogin($userInfo);
                $loginInfo = session('loginInfo');
                $this->success('', $loginInfo);
            }
        }
        $this->error($result['errmsg']);
    }

    /**
     * 钉钉授权回调
     * @return RedirectResponse|Redirect
     * @throws DataNotFoundException
     * @throws ModelNotFoundException
     * @throws DbException
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
        //用户注册/绑定钉钉
        $redirectPath = session('redirectPath');
        $targetUrl = '/index.html#/member/login';
        if ($redirectPath) {
            $targetUrl = '/index.html#' . $redirectPath;
        }
        if (strpos($targetUrl, '?') === false) {
            $targetUrl .= '?logged=1';
        } else {
            $targetUrl .= '&logged=1';
        }
        if (!$user['errcode']) {
            $result = $app->user->getUseridByUnionid($user['user_info']['unionid']);
            if (!$result['errcode']) {
                $userId = $result['userid'];
                $userInfo = $app->user->get($userId, $lang = null);
                if (!$user['errcode']) {
                    $user['user_info']['avatar'] = $userInfo['avatar'];
                    $user['user_info']['mobile'] = $userInfo['mobile'];
                    $user['user_info']['email'] = $userInfo['email'];
                    $user['user_info']['userId'] = $userId;
                }
            }
            $result = Member::dingtalkLogin($user['user_info']);
            //跳转地址携带message可以在应用内展示通知消息
            //logged=1表示业务处理成功
            if (isError($result)) {
                Member::logout();
                $targetUrl .= '&message=' . $result['msg'];
//                $targetUrl = '/index.html#/member/login?logged=0&message='.$result['msg'];
            }
        } else {
            $targetUrl = '/index.html#/member/login?logged=0&message=钉钉登录失败，请重试';
        }
        // 登录成功跳转
        return redirect(Request::domain() . $targetUrl);
    }
}
