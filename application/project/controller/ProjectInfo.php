<?php

namespace app\project\controller;

use controller\BasicApi;
use think\db\exception\DataNotFoundException;
use think\db\exception\ModelNotFoundException;
use think\Exception;
use think\exception\DbException;
use think\exception\PDOException;
use think\facade\Request;

class ProjectInfo extends BasicApi
{
    public function __construct()
    {
        parent::__construct();
        if (!$this->model) {
            $this->model = new \app\common\Model\ProjectInfo();
        }
    }

    /**
     * 显示资源项目信息
     * @return void
     * @throws DataNotFoundException
     * @throws ModelNotFoundException
     * @throws DbException
     */
    public function index()
    {
        $where = [];
        $code = Request::post('projectCode');
        if (!$code) {
            $this->error("请选择一个项目");
        }
        $where[] = ['project_code', '=', $code];
//        $list = $this->model->_list($where, 'sort asc,id asc');
        $list = $this->model->where($where)->order('id desc')->select()->toArray();
        $this->success('', $list);
    }

    /**
     * 新增
     * @param Request $request
     * @return void
     * @throws DataNotFoundException
     * @throws DbException
     * @throws ModelNotFoundException
     */
    public function save(Request $request)
    {
        $data = $request::only('name,value,sort,projectCode,description');
        if (!$request::post('name')) {
            $this->error("请填写项目信息名称");
        }
        $result = $this->model->createData($data['name'], $data['value'], $data['description'], $data['projectCode'], getCurrentOrganizationCode());
        if (!isError($result)) {
            $this->success('添加成功', $result);
        }
        $this->error($result['msg']);
    }

    /**
     * 保存
     * @param Request $request
     * @return void
     * @throws DataNotFoundException
     * @throws ModelNotFoundException
     * @throws DbException
     */
    public function edit(Request $request)
    {
        $data = $request::only('name,value,sort,projectCode,description,infoCode');
        if (!$request::post('name')) {
            $this->error("请填写项目信息名称");
        }
        if (!$data['infoCode']) {
            $this->error("请选择一个项目信息");
        }
        $info = $this->model->where(['code' => $data['infoCode']])->field('id,project_code')->find();
        if (!$info) {
            $this->error("该项目信息已失效");
        }
        $has = $this->model->where(['name' => $data['name'], 'project_code' => $info['project_code']])->field('id,sort')->find();
        if ($has && $has['id'] != $info['id']) {
            $this->error("该项目信息名称已存在");
        }
        $result = $this->model->_edit(['name' => $data['name'], 'description' => $data['description'], 'value' => $data['value'], 'sort' => isset($data['sort']) ? $data['sort'] : $has['sort']], ['code' => $data['infoCode']]);
        if ($result) {
            $this->success('');
        }
        $this->error("操作失败，请稍候再试！");
    }

    /**
     * 删除项目信息
     * @return void
     * @throws Exception
     * @throws PDOException
     */
    public function delete()
    {
        $code = Request::post('infoCode');
        if (!$code) {
            $this->error("请选择一个项目信息");
        }
        $result = $this->model->where('code', $code)->delete();
        if (isError($result)) {
            $this->error($result['msg'], $result['errno']);
        }
        $this->success();
    }
}
