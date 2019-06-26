<?php

namespace app\project\controller;

use controller\BasicApi;
use think\facade\Request;

/**
 */
class TaskWorkflow extends BasicApi
{
    public function __construct()
    {
        parent::__construct();
        if (!$this->model) {
            $this->model = new \app\common\Model\TaskWorkflow();
        }
    }

    /**
     * 显示资源规则
     * @return void
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
        $list = $this->model->where($where)->select();
        if ($list) {
            foreach ($list as &$item) {
                unset($item['id']);
            }
        }
        $this->success('', $list);
    }


    /**
     * 新增
     * @param Request $request
     * @return void
     */
    public function save(Request $request)
    {
        $data = $request::only('name,projectCode');
        if (!$request::post('name')) {
            $this->error("请填写规则名称");
        }
        try {
            $result = $this->model->createStage($data['name'], $data['projectCode']);
        } catch (\Exception $e) {
            $this->error($e->getMessage(), $e->getCode());;
        }
        if ($result) {
            $this->success('添加成功', $result);
        }
        $this->error("操作失败，请稍候再试！");
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
        $data = $request::only('name,stageCode');
        if (!$request::post('name')) {
            $this->error("请填写规则名称");
        }
        if (!$data['stageCode']) {
            $this->error("请选择一个规则");
        }
        $template = $this->model->where(['code' => $data['stageCode']])->field('id')->find();
        if (!$template) {
            $this->error("该规则已失效");
        }
        $result = $this->model->_edit(['name' => $data['name']], ['code' => $data['stageCode']]);
        if ($result) {
            $this->success('');
        }
        $this->error("操作失败，请稍候再试！");
    }

    /**
     * 删除规则
     * @return void
     */
    public function delete()
    {
        $code = Request::post('code');
        if (!$code) {
            $this->error("请选择一个规则");
        }
        try {
            $result = $this->model->deleteStage($code);
        } catch (\Exception $e) {
            $this->error($e->getMessage(), $e->getCode());;
        }
        if ($result) {
            $this->success('');
        }
    }
}
