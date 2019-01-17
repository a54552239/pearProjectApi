<?php


namespace service;

use think\Db;
use think\db\Query;
use think\facade\Request;

/**
 * Session服务
 * Class LogService
 * @package service
 * @author Vilson
 */
class SessionService
{

    /*
    * 获取当前Client session
    * */
    public static function getClientSession()
    {
        $session = session('client');
        return $session;
    }
    /*
    * 获取当前Admin session
    * */
    public static function getAdminSession()
    {
        $session = session('user');
        return $session;
    }

    /*
        * 获取当前hotel id
        * */
    public static function geCurrentHotelId()
    {
        $currentHotelId = session('currentHotelId');
        return $currentHotelId;
    }

    /*
    * 获取当前member session
    * */
    public static function getMemberSession()
    {
        $member_session = session('member');
        return $member_session;
    }
}
