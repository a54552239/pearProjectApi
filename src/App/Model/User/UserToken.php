<?php
namespace App\Model\User;
use App\Common\CommonModel;
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2017/3/23 0023
 * Time: 9:37
 */
class UserToken extends CommonModel
{

    public function getUserToken($token)
    {
        if(empty($token)) {
            return null;
        }
        return $this->getORM()->select('*')->where('token = ?', $token)->fetchOne();
    }

    /**
     * 登录生成token
     * @param int $user_id 用户id
     * @param string $user_name 用户名
     * @return null|string
     */
    public function _get_token($user_id, $user_name) {

        //重新登录后以前的令牌失效

        //生成新的token
        $user_token_info = array();
        $token = md5($user_name . strval(time()) . strval(rand(0,999999)));
        $user_token_info['user_id'] = $user_id;
        $user_token_info['user_name'] = $user_name;
        $user_token_info['token'] = $token;
        $user_token_info['login_time'] = time();
        $user_token_info['login_ip'] =  $_SERVER['REMOTE_ADDR'];

        $result = $this->insert($user_token_info);

        if($result) {
            return $token;
        } else {
            return null;
        }

    }

    protected function getTableName($id)
    {
        return 'user_token';
    }

}