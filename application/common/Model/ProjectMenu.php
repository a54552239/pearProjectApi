<?php

namespace app\common\Model;

use service\NodeService;
use service\ToolsService;

class ProjectMenu extends CommonModel
{
    protected $pk = 'id';
    protected $append = ["statusText", "innerText", "fullUrl"];

    public function getIdAttr($value)
    {
        return strval($value);
    }

    public function getStatusTextAttr($value, $data)
    {
        $status = [0 => '禁用', 1 => '使用中'];
        return $status[$data['status']];
    }

    public function getInnerTextAttr($value, $data)
    {
        $status = [0 => '导航', 1 => '内页'];
        return $status[$data['is_inner']];
    }

    public function getFullUrlAttr($value, $data)
    {

        if (($data['params'] and $data['values'] != null) or $data['values'] != '') {
            $fullUrl = $data['url'] . '/' . $data['values'];
            return $fullUrl;
        }
        return $data['url'];
    }

    public function childrenMenu()
    {
        return $this->hasMany('menu', 'pid')->selfRelation();
    }

    /**
     * 获取所有菜单列表
     * @return array|string|\think\Collection
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public function treeList()
    {
        $list = $this->order('sort asc,id asc')->select();
        $list = $list->toArray();
        if ($list) {
            foreach ($list as &$item) {
                $item['is_inner'] = !!$item['is_inner'];
                $item['show_slider'] = !!$item['show_slider'];
                unset($item);
            }
        }
        $list = ToolsService::arr2tree($list);
        return $list;
    }

    /**
     * 获取用户对应的菜单列表
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public function listForUser($isTree = true)
    {
        NodeService::applyProjectAuthNode();
        $list = $this->where(['status' => '1'])->order('sort asc,id asc')->select();
        $list = $list->toArray();
        if ($list) {
            foreach ($list as &$item) {
                $item['is_inner'] = !!$item['is_inner'];
                unset($item);
            }
        }
        //主账号不做过滤
        $member = getCurrentMember();
        $menus = $member['is_owner'] ? $list : $this->filterMenu($list, $member['nodes']);
        $new = [];
        $isTree && $menus = ToolsService::arr2tree($menus);
        $this->buildFilterMenuData($menus, $new);
        $isTree && $menus = ToolsService::arr2tree($new);
        return $menus;
    }

    /**
     * 过滤没有节点权限的菜单
     * @param $menus array 待过滤菜单
     * @param $nodes array 拥有的权限节点
     * @return array
     */
    private function filterMenu($menus, $nodes)
    {
        $newMenus = [];
        foreach ($menus as $key => $menu) {
            if ($menu['node'] == '#') {
                $newMenus[] = $menu;
            } elseif (preg_match('/^https?\:/i', $menu['url'])) {
                $newMenus[] = $menu;
                continue;
            } elseif ($menu['node'] != '#') {
                $node = join('/', array_slice(explode('/', preg_replace('/[\W]/', '/', $menu['node'])), 0, 3));
                if ($nodes && in_array($node, $nodes)) {
                    $newMenus[] = $menu;
                }
            }
        }
        return $newMenus;
    }

    /**
     * 后台主菜单权限过滤（过滤没有子节点的菜单）
     * @param array $menus 当前树形结构的菜单列表
     * @param $new array 过滤后的菜单
     * @return void
     */
    private function buildFilterMenuData($menus, &$new)
    {

        foreach ($menus as $key => $menu) {
            if (($menu['node'] == '#' && isset($menu['children']) && $menu['children']) || ($menu['node'] != '#' && !isset($menu['children'])) ||  $menu['url'] == 'home') {
                $temp = $menu;
                unset($temp['children']);
                $new[] = $temp;
            }
            if (isset($menu['children']) && $menu['children']) {
                $this->buildFilterMenuData($menu['children'], $new);
            }
        }
    }

    /**
     * 后台主菜单权限过滤
     * @param array $menus 当前菜单列表
     * @param array $nodes 系统权限节点数据
     * @param bool $isLogin 是否已经登录
     * @return array
     */
    private function buildMenuData($menus, $nodes, $isLogin)
    {

        foreach ($menus as $key => &$menu) {
            !empty($menu['children']) && $menu['children'] = $this->buildMenuData($menu['children'], $nodes, $isLogin);
            if (!empty($menu['children'])) {
                $menu['url'] = '#';
            } elseif (preg_match('/^https?\:/i', $menu['url'])) {
                continue;
            } elseif ($menu['node'] != '#') {
                $node = join('/', array_slice(explode('/', preg_replace('/[\W]/', '/', $menu['node'])), 0, 3));
                if (!in_array($node, $nodes)) {
                    array_splice($menus, $key, 1);
                    continue;
                }
                if (in_array($node, $nodes) && $nodes[$node]['is_login'] && empty($isLogin)) {
                    array_splice($menus, $key, 1);
                } elseif (in_array($node, $nodes) && $nodes[$node]['is_auth'] && $isLogin && !auth($node)) {
                    array_splice($menus, $key, 1);
                }
            } else {
                array_splice($menus, $key, 1);
            }
        }
        return $menus;
    }

    public function del($id)
    {
        $delArr = [$id];
        $list = $this::where(['pid' => $id])->select()->toArray();
        if ($list) {
            foreach ($list as $item) {
                $delArr[] = $item['id'];
                $list2 = $this::where(['pid' => $item['id']])->select()->toArray();
                if ($list2) {
                    foreach ($list2 as $item2) {
                        $delArr[] = $item2['id'];
                    }
                }
            }
        }
        return $this::destroy($delArr);
    }
}
