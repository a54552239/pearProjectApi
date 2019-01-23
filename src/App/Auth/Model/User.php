<?php
namespace App\Auth\Model;
use PhalApi\Model\NotORMModel as NotORM;
/*
/**
 * 用户模型
 * @author: hms 2015-8-6
 */

class User extends NotORM
{

    protected function getTableName($id)
    {
        return \PhalApi\DI()->config->get('app.auth.auth_user');
    }
    
    public   function getUserInfo($uid){
        static $userinfo = array();
        if (!isset($userinfo[$uid])) {
            $userinfo[$uid] = $this->getORM()->where('id', $uid)->fetchOne();
        }
        return $userinfo[$uid];
    }
}
