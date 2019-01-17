<?php

namespace app\project\controller;

use controller\BasicApi;
use service\DataService;
use service\NodeService;
use service\ToolsService;
use think\Db;
use think\facade\Request;

/**
 * 系统功能节点管理
 * Class Node
 * @package app\admin\controller
 * @author Vilson
 */
class Node extends BasicApi
{

    /**
     * 指定当前默认模型
     * @var string
     */
    public $table = 'ProjectNode';

    /**
     * 显示节点列表
     * @return string
     */
    public function index()
    {
        $module = 'project';
        !$module && $module = '';

        $nodes = ToolsService::arr2table(NodeService::get([], [], $module), 'node', 'pnode');
        $groups = [];
        foreach ($nodes as $node) {
            $pnode = explode('/', $node['node'])[0];
            if ($node['node'] === $pnode) {
                $groups[$pnode]['node'] = $node;
            }
            $groups[$pnode]['list'][] = $node;
        }
        $this->success('', ['nodes' => $nodes, 'groups' => $groups]);
    }

    public function allList()
    {
//        $module = Request::post('module');
        $node = Request::post('node');
        $where = [];
//        if ($module) {
//            $where[] = ['module', '=', $module];
//        }
        if ($node) {
            $where[] = ['node', 'like', "%{$node}%"];
        }
        $list = Db::name('ProjectNode')->where($where)->select();
        if ($node == '#') {
            $list[] = ['node' => '#', 'title' => '无节点权限'];
        }
        $this->success('', $list);
    }

    /**
     * 清理无效的节点记录
     * @throws \think\Exception
     * @throws \think\exception\PDOException
     */
    public function clear()
    {
        $nodes = array_keys(NodeService::get());
        if (false !== Db::name('projectNode')->whereNotIn('node', $nodes)->delete()) {
            $this->success('清理无效节点记录成功！', '');
        }
        $this->error('清理无效记录失败，请稍候再试！');
    }

    /**
     * 保存节点变更
     * @throws \think\Exception
     * @throws \think\exception\PDOException
     */
    public function save()
    {
        if ($this->request->isPost()) {
            list($post, $data) = [json_decode($this->request->post('list')), []];
            foreach ($post as $vo) {
                if (!empty($vo->node)) {
                    $data['node'] = $vo->node;
                    if ($vo->name) {
                        foreach ($vo->name as $key => $name) {
                            $data[$name->name] = $vo->value[$key]->value;
                        }
                    }
                }
                //根据模块将权限节点插入对应的表
                if (strpos('/', $data['node']) !== -1) {
                    $module = explode('/', $data['node'])[0];
                } else {
                    $module = $data['node'];
                }
                $data['module'] = $module;
                switch ($module) {
                    case 'project':
                        $table = 'ProjectNode';
                        break;
                    default:
//                        $table = $this->table;
                }
                !empty($data) && isset($table) && DataService::save($table, $data, 'node');
//                !empty($data) && DataService::save($this->table, $data, 'node');

            }
            $this->success('参数保存成功！', '');
        }
        $this->error('访问异常，请重新进入...');
    }

}
