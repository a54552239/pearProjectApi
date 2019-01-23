<?php
namespace App\Common;
use App\Model\User\User as ModelUser;
use App\Model\User\UserToken as ModelUserToken;
use PhalApi\Api;
use PhalApi\Exception\BadRequestException;

class CommonApi extends Api
{
    public $user_info = null;

    /**
     * @throws BadRequestException
     * @throws \PhalApi\Exception_BadRequest
     */
    protected function userCheck()
    {
        parent::userCheck();
        $this->loginCheck();
        $service = \PhalApi\DI()->request->get('service');
        if (!$service) {
            $service = \PhalApi\DI()->request->get('s');
        }
        $no_auth = \PhalApi\DI()->config->get('app.service_no_auth');
        if (!in_array($service, $no_auth) and $this->user_info['account'] != 'admin') {
            $auth_check = \PhalApi\DI()->auth->check($service, $this->user_info['id']);
            if (!$auth_check) {
                throw new BadRequestException('您没有访问权限', 2);
            }
        }
    }

    /**
     * 用户登录检测
     * @desc 用户登录检测
     * @return bool
     * @throws BadRequestException
     */
    public function loginCheck()
    {
        $service = \PhalApi\DI()->request->get('service');
        if (!$service) {
            $service = \PhalApi\DI()->request->get('s');
        }
        //过滤不需要登录token的请求
        $no_login = \PhalApi\DI()->config->get('app.service_no_login');
        if (in_array($service, $no_login)) {
            return true;
        }
        $model_user_token = new ModelUserToken();
        $tokenArray = \PhalApi\DI()->request->getHeader('Token');
        //todo mac和windows对 token 大小写处理不一样？？
        if (!$tokenArray) {
            $tokenArray = \PhalApi\DI()->request->getHeader('token');
            if (!$tokenArray) {
                $tokenArray = \PhalApi\DI()->request->get('token');
            }
        }
        if ($tokenArray) {
            $tokenArray = explode('&', $tokenArray);
            $token = $tokenArray[0];// token
            $expired_time = $tokenArray[1] / 1000;// 过期时间
            $user_token_info = $model_user_token->getUserToken($token);
            if ($user_token_info) {
                $user_name = $user_token_info['user_name'];
                if ($user_name) {
                    $model_user = new ModelUser();
                    $user_info = $model_user->getInfo(array('account' => $user_name),'id');
                    $user_info = $model_user->getUserFullById($user_info['id']);
                    if ($user_info) {
                        \PhalApi\DI()->cookie->set('user_info', json_encode($user_info), $_SERVER['REQUEST_TIME'] + 600);
                        $this->user_info = $user_info;
                    }
                }
            }
            if ($service != 'User_User.Login') {
                if (empty($user_token_info)) {
                    throw new BadRequestException('登录超时', 99);
                }
                if ($expired_time == 0) {
                    $expired_time = $user_token_info['login_time'] + 24 * 3600;// 有效期默认一天
                }
                if ($expired_time < time()) {
                    throw new BadRequestException('登录超时', 99);
                }
            }
        } else {
            if ($service != 'User_User.Login') {
                throw new BadRequestException('请登录', 1);
            }
        }
    }


}
