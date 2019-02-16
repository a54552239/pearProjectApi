<?php

namespace app\project\controller;

use controller\BasicApi;
use think\facade\Request;

/**
 */
class TaskTag extends BasicApi
{
    public function __construct()
    {
        parent::__construct();
        if (!$this->model) {
            $this->model = new \app\common\Model\TaskTag();
        }
    }

    /**
     * 显示资源标签
     * @return void
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
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
        $list = $this->model->where($where)->order('name asc')->select()->toArray();
        $this->success('', $list);
    }

    /**
     * 新增
     * @param Request $request
     * @return void
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public function save(Request $request)
    {
        $data = $request::only('name,projectCode,color');
        if (!$request::post('name')) {
            $this->error("请填写标签名称");
        }
        $result = $this->model->createTag($data['name'], $data['color'], $data['projectCode']);
        if (!isError($result)) {
            $this->success('添加成功', $result);
        }
        $this->error($result['msg']);
    }

    /**
     * 保存
     * @param Request $request
     * @return void
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public function edit(Request $request)
    {
        $data = $request::only('name,tagCode,color');
        if (!$request::post('name')) {
            $this->error("请填写标签名称");
        }
        if (!$data['tagCode']) {
            $this->error("请选择一个标签");
        }
        $tag = $this->model->where(['code' => $data['tagCode']])->field('id')->find();
        if (!$tag) {
            $this->error("该标签已失效");
        }
        $result = $this->model->_edit(['name' => $data['name'], 'color' => $data['color']], ['code' => $data['tagCode']]);
        if ($result) {
            $this->success('');
        }
        $this->error("操作失败，请稍候再试！");
    }

    /**
     * 删除标签
     * @return void
     * @throws \think\Exception
     * @throws \think\exception\PDOException
     */
    public function delete()
    {
        $code = Request::post('tagCode');
        if (!$code) {
            $this->error("请选择一个标签");
        }
        $result = $this->model->deleteTag($code);
        if (!isError($result)) {
            $this->success();
        }
    }
}
