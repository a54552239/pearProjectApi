<?php


namespace service;

use think\Db;

/**
 * 系统权限节点读取器
 * Class NodeService
 * @package extend
 * @author Vilson
 */
class NodeService
{
    /**
     * 应用项目账号权限节点
     * @return bool
     */
    public static function applyProjectAuthNode()
    {
        cache('member_need_access_node', null);
        $member = getCurrentMember();
        $member['nodes'] = [];
        if (($authorize = $member['authorize'])) {
            $where = ['status' => '1'];
            $authorizeIds = Db::name('ProjectAuth')->whereIn('id', explode(',', $authorize))->where($where)->column('id');
            if (empty($authorizeIds)) {
                $member['nodes'] = [];
                return setCurrentMember($member);
            }
            $nodes = Db::name('ProjectAuthNode')->whereIn('auth', $authorizeIds)->column('node');
            $member['nodes'] = $nodes;
            return setCurrentMember($member);
        }
        return setCurrentMember($member);
    }

    /**
     * 获取项目账号授权节点
     * @return array
     */
    public static function getProjectAuthNode()
    {
        $nodes = cache('member_need_access_node');
        if (empty($nodes)) {
            $nodes = Db::name('ProjectNode')->where(['is_auth' => '1'])->column('node');
            cache('member_need_access_node', $nodes);
        }
        return $nodes;
    }

    /**
     * 检查账号节点权限
     * @param string $node 节点
     * @param $moduleApp string
     * @return bool
     */
    public static function checkAuthNode($node, $moduleApp = 'project')
    {
        list($module, $controller, $action) = explode('/', str_replace(['?', '=', '&'], '/', $node . '///'));
        $currentNode = self::parseNodeStr("{$module}/{$controller}") . strtolower("/{$action}");
        $member = getCurrentMember();
        if ($moduleApp == 'project') {
            //拥有者账号不加入权限判断
            if ($member['is_owner'] == 1) {
                return true;
            }
            if (!in_array($currentNode, self::getProjectAuthNode())) {
                return true;
            }
            return in_array($currentNode, !empty($member['nodes']) ? (array)$member['nodes'] : []);
        }
        return false;
    }

    /**
     * 获取系统代码节点
     * @param array $nodes
     * @param array $where 查询条件
     * @param string $module 节点模块。目录名应该和模块名一致，如果传入模块，则只搜索该模块目录下的节点。
     * @return array
     */
    public static function get($nodes = [], $where = [], $module = '')
    {
        if ($module == 'project') {
            $alias = Db::name('ProjectNode')->where($where)->column('node,is_menu,is_auth,is_login,title,id');
        }
        $ignore = ['index', 'api', 'project/login', 'project/register', 'project/getCaptcha'];
        $path = env('app_path');
        if ($module) {
            $path .= '/' . $module;
        }
        foreach (self::getNodeTree($path) as $thr) {
            foreach ($ignore as $str) {
                if (stripos($thr, $str) === 0) {
                    continue 2;
                }
            }
            $tmp = explode('/', $thr);
            list($one, $two) = ["{$tmp[0]}", "{$tmp[0]}/{$tmp[1]}"];
            $nodes[$one] = array_merge(isset($alias[$one]) ? $alias[$one] : ['node' => $one, 'title' => '', 'is_menu' => 0, 'is_auth' => 0, 'is_login' => 0], ['pnode' => '']);
            $nodes[$two] = array_merge(isset($alias[$two]) ? $alias[$two] : ['node' => $two, 'title' => '', 'is_menu' => 0, 'is_auth' => 0, 'is_login' => 0], ['pnode' => $one]);
            $nodes[$thr] = array_merge(isset($alias[$thr]) ? $alias[$thr] : ['node' => $thr, 'title' => '', 'is_menu' => 0, 'is_auth' => 0, 'is_login' => 0], ['pnode' => $two]);
        }
        foreach ($nodes as $key => &$node) {
            list($node['is_auth'], $node['is_menu'], $node['is_login']) = [intval($node['is_auth']), intval($node['is_menu']), empty($node['is_auth']) ? intval($node['is_login']) : 1];
        }
        return $nodes;
    }

    /**
     * 获取节点列表
     * @param string $dirPath 路径
     * @param array $nodes 额外数据
     * @return array
     */
    public static function getNodeTree($dirPath, $nodes = [])
    {
        foreach (self::scanDirFile($dirPath) as $filename) {
            $matches = [];
            if (!preg_match('|/(\w+)/controller/(\w+)|', str_replace(DIRECTORY_SEPARATOR, '/', $filename), $matches) || count($matches) !== 3) {
                continue;
            }
            $className = env('app_namespace') . str_replace('/', '\\', $matches[0]);
            if (!class_exists($className)) {
                continue;
            }
            foreach (get_class_methods($className) as $funcName) {
                if (strpos($funcName, '_') !== 0 && $funcName !== 'initialize') {
                    $nodes[] = self::parseNodeStr("{$matches[1]}/{$matches[2]}") . '/' . strtolower($funcName);
                }
            }
        }
        return $nodes;
    }

    /**
     * 驼峰转下划线规则
     * @param string $node
     * @return string
     */
    public static function parseNodeStr($node)
    {
        $tmp = [];
        foreach (explode('/', $node) as $name) {
            $tmp[] = strtolower(trim(preg_replace("/[A-Z]/", "_\\0", $name), "_"));
        }
        return trim(join('/', $tmp), '/');
    }

    /**
     * 获取所有PHP文件
     * @param string $dirPath 目录
     * @param array $data 额外数据
     * @param string $ext 有文件后缀
     * @return array
     */
    private static function scanDirFile($dirPath, $data = [], $ext = 'php')
    {
        foreach (scandir($dirPath) as $dir) {
            if (strpos($dir, '.') === 0) {
                continue;
            }
            $tmpPath = realpath($dirPath . DIRECTORY_SEPARATOR . $dir);
            if (is_dir($tmpPath)) {
                $data = array_merge($data, self::scanDirFile($tmpPath));
            } elseif (pathinfo($tmpPath, 4) === $ext) {
                $data[] = $tmpPath;
            }
        }
        return $data;
    }

}
