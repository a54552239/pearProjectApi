<?php


namespace service;

use think\Db;
use think\db\Query;
use think\facade\Request;

/**
 * 接口服务
 * Class LogService
 * @package service
 */
class ApiService
{

    /**
     * 获取数据操作对象
     * @return Query
     */
    protected static function db()
    {
        return Db::name('ApiLog');
    }

    /**
     * 写入API日志
     * @param string $from
     * @param string $content
     * @return bool
     * @throws \Exception
     */
    public static function write($from = '', $content = '')
    {
        //todo 使用缓存

        $ip = Request::ip();
        $module = Request::module();
        $node = strtolower(join('/', [$module, Request::controller(), Request::action()]));
        self::checkTraffic($node, $ip);
        $header = Request::header();
        switch ($module) {
            case 'project':
                $session = SessionService::getMemberSession();
                $action = 'PMS';
                $actionName = $session['name'];
                $actionId = $session['id'];
                break;
            case 'index':
                $action = 'Common';
                $actionName = '公共接口';
                $actionId = 0;
                break;
            default:
                $session = SessionService::getAdminSession();
                $action = 'Admin';
                $actionName = $session['username'];
                $actionId = $session['id'];
        }
        $nodeName = Db::name('SystemNode')->where(['node' => $node])->field("title")->find();
        if ($nodeName) {
            $nodeName = $nodeName['title'];
        }
        $data = [
            'ip' => $ip,
            'node' => $node,
            'node_name' => $nodeName,
            'action' => $action,
            'action_name' => $actionName,
            'action_id' => $actionId,
            'content' => $content,
            'module' => $module,
            'from' => $from,
            'user_agent' => $header['user-agent'],
            'seconds' => time(),
        ];
        return self::db()->insert($data) !== false;
    }

    /**
     * 流控策略
     * @param $node
     * @param string $ip
     * @throws \Exception
     */
    public static function checkTraffic($node, $ip = '')
    {
        $where = ['node' => $node, 'seconds' => time()];
        if ($ip) {
            $where['ip'] = $ip;
        }
        $count = self::db()->where($where)->count();
        if ($count >= 10) {
            throw new \Exception('访问过于频繁', 1);
        }
    }

}
