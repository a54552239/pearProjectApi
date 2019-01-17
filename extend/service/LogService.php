<?php



namespace service;

use think\Db;
use think\db\Query;

/**
 * 操作日志服务
 * Class LogService
 * @package service

 * @date 2017/03/24 13:25
 */
class LogService
{

    /**
     * 获取数据操作对象
     * @return Query
     */
    protected static function db()
    {
        return Db::name('SystemLog');
    }

    /**
     * 写入操作日志
     * @param string $action
     * @param string $content
     * @return bool
     */
    public static function write($action = '行为', $content = "内容描述")
    {
        $request = app('request');
        $node = strtolower(join('/', [$request->module(), $request->controller(), $request->action()]));
        $data = [
            'ip'       => $request->ip(),
            'node'     => $node,
            'action'   => $action,
            'content'  => $content,
            'username' => session('user.username') . '',
        ];
        return self::db()->insert($data) !== false;
    }

}
