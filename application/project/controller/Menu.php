<?php

namespace app\project\controller;

use app\common\Model\MemberAccount;
use app\common\Model\ProjectMenu;
use controller\BasicApi;
use think\Db;
use think\facade\Request;

class Menu extends BasicApi
{
    public $model = null;
    public $menuModel = null;

    public function __construct()
    {
        parent::__construct();
        if (!$this->model) {
            $this->model = new ProjectMenu;
        }
    }


    /**
     * 菜单列表
     * @return array|string
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public function menu()
    {
        $list = $this->model->treeList();
        $this->success('', $list);

    }

    /**
     * 添加菜单
     * @return array|string
     */
    public function menuAdd()
    {
        $title = Request::post('title');
        $url = Request::post('url');
        if (!$title) {
            $this->error('名称不能为空');
        }
        if (!$url) {
            $this->error('地址不能为空');
        }
        $data = Request::only('title,url,icon,is_inner,pid,status,sort,params,values,node,show_slider,file_path');
        if (!$data['file_path']) {
            $data['file_path'] = $data['url'];
        }
        if ($data['is_inner'] == 'true' or $data['is_inner'] == 1) {
            $data['is_inner'] = 1;
        } else {
            $data['is_inner'] = 0;
        }
        if ($data['show_slider'] == 'true' or $data['show_slider'] == 1) {
            $data['show_slider'] = 1;
        } else {
            $data['show_slider'] = 0;
        }
        $this->success('', $this->model->_add($data));
    }

    /**
     * 编辑菜单
     * @return array|string
     */
    public function menuEdit()
    {
        $data = Request::only('title,url,icon,is_inner,id,params,sort,values,node,show_slider,file_path');
        if (isset($data['title']) and !$data['title']) {
            $this->error('名称不能为空');
        }
        if (!isset($data['url']) and !$data['url']) {
            $this->error('地址不能为空');
        }
        if (!$data['file_path']) {
            $data['file_path'] = $data['url'];
        }
        if ($data['is_inner'] == 'true' or $data['is_inner'] == 1) {
            $data['is_inner'] = 1;
        } else {
            $data['is_inner'] = 0;
        }
        if ($data['show_slider'] == 'true' or $data['show_slider'] == 1) {
            $data['show_slider'] = 1;
        } else {
            $data['show_slider'] = 0;
        }
        $this->success('', $this->model->_edit($data));
    }

    /**
     * 菜单禁用
     */
    public function menuForbid()
    {
        $this->success('', $this->model->_edit(Request::only('status,id')));
    }

    /**
     * 菜单启用
     * @throws \think\Exception
     * @throws \think\exception\PDOException
     */
    public function menuResume()
    {
        $this->success('', $this->model->_edit(Request::only('status,id')));
    }


    /**
     * 删除菜单
     */
    public function menuDel()
    {
        $this->success('', $this->model->del(Request::post('id')));
    }
}
