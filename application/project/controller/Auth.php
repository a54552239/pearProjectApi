<?php

namespace app\project\controller;

use app\common\Model\Member;
use app\common\Model\ProjectAuthNode;
use app\common\Model\SystemConfig;
use controller\BasicApi;
use service\FileService;
use service\NodeService;
use service\ToolsService;
use think\facade\Request;
use think\File;

/**
 * Class Account
 * @package app\project\controller
 */
class Auth extends BasicApi
{

    public function __construct()
    {
        parent::__construct();
        if (!$this->model) {
            $this->model = new \app\common\Model\ProjectAuth();
        }
    }

    /**
     * 权限列表
     * @return array|string
     * @throws \think\Exception
     * @throws \think\exception\DbException
     */
    public function index()
    {
        $currentOrganizationCode = getCurrentOrganizationCode();
        $this->success('', $this->model->_list(['organization_code' => $currentOrganizationCode]));
    }

    /**
     * 权限授权
     * @return string
     */
    public function apply()
    {
        $auth_id = Request::param('id', '0');
        $method = '_apply_' . strtolower(Request::param('action', '0'));
        if (method_exists($this, $method)) {
            return $this->$method($auth_id);
        }
    }

    /**
     * 读取授权节点
     * @param string $auth
     */
    protected function _apply_getnode($auth)
    {
        $nodes = NodeService::get([], [], 'project');
        $checked = ProjectAuthNode::where(['auth' => $auth])->column('node');
        $count = 1;
        foreach ($nodes as $key => &$node) {
            if (!$node['title']) {
                $node['title'] = '-';
            }
            $node['checked'] = in_array($node['node'], $checked);
            $node['key'] = $node['node'];
            $count++;
        }
        $checkedList = [];
        $all = $this->_apply_filter(ToolsService::arr2tree($nodes, 'node', 'pnode', 'children'), 1, $checkedList);
        $this->success('', ['list' => $all, 'checkedList' => $checkedList]);
    }

    /**
     * 保存授权节点
     * @param string $auth
     * @throws \Exception
     */
    protected function _apply_save($auth)
    {
        //todo 优化
        list($data, $post) = [[], Request::only('action,id,nodes')];
        isset($post['nodes']) && $post['nodes'] = json_decode($post['nodes']);
        foreach (isset($post['nodes']) ? $post['nodes'] : [] as $node) {
            $data[] = ['auth' => $auth, 'node' => $node];
        }
        ProjectAuthNode::where(['auth' => $auth])->delete();
        ProjectAuthNode::insertAll($data);
        NodeService::clearMemberNodes(getCurrentOrganizationCode());
        $this->success('节点授权更新成功！', '');
    }

    /**
     * 节点数据拼装
     * @param array $nodes
     * @param int $level
     * @param $checkedList
     * @return array
     */
    protected function _apply_filter($nodes, $level = 1, &$checkedList)
    {
        foreach ($nodes as $key => $node) {
            if (!empty($node['children']) && is_array($node['children'])) {
                $node[$key]['children'] = $this->_apply_filter($node['children'], $level + 1, $checkedList);
            } else {
                if ($node['checked']) {
                    $checkedList[] = $node['key'];
                }
            }
        }
        return $nodes;
    }

    /**
     * 权限添加
     * @return array|string
     */
    public function add()
    {
        if (!Request::param('title')) {
            $this->error('名称不能为空');
        }
        $currentOrganizationCode = getCurrentOrganizationCode();
        $params = Request::only('title,desc,id');
        $params['organization_code'] = $currentOrganizationCode;
        $result = $this->model->_add($params);
        if ($result) {
            $this->success('', $result);
        }
    }

    /**
     * 权限编辑
     * @return array|string
     */
    public function edit()
    {
        if (!Request::param('title')) {
            $this->error('名称不能为空');
        }
        $result = $this->model->_edit(Request::only('title,desc,id'));
        if ($result) {
            $this->success('');
        }
        $this->error("权限禁用失败，请稍候再试！");
    }

    /**
     * 权限禁用
     */
    public function forbid()
    {
        $result = $this->model->_edit(Request::only('status,id'));
        if ($result) {
            $this->success('');
        }
        $this->error("权限禁用失败，请稍候再试！");
    }

    /**
     * 权限恢复
     */
    public function resume()
    {
        $result = $this->model->_edit(Request::only('status,id'));
        if ($result) {
            $this->success('');
        }
        $this->error("权限启用失败，请稍候再试！");
    }

    /**
     * 设置默认权限
     */
    public function setDefault()
    {
        $currentOrganizationCode = getCurrentOrganizationCode();
        $params = Request::only('is_default,id');
        $this->model->isUpdate(true)->save(['is_default' => 0],['organization_code' => $currentOrganizationCode]);
        $result = $this->model->_edit($params);
        if ($result) {
            $this->success('');
        }
        $this->error("权限设置失败，请稍候再试！");
    }

    /**
     * 权限删除
     * @throws \Exception
     */
    public function del()
    {
        $result = $this->model->del(Request::only('id'));
        if ($result) {
            $this->success("权限删除成功！", '');
        }
        $this->error("权限删除失败，请稍候再试！");
    }
}
