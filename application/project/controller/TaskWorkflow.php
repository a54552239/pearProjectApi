<?php

namespace app\project\controller;

use app\common\Model\TaskWorkflowRule;
use controller\BasicApi;
use think\Db;
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
        $list = $this->model->where($where)->order('id asc')->select();
        if ($list) {
            foreach ($list as &$item) {
                unset($item['id']);
            }
        }
        $this->success('', $list);
    }

    public function _getTaskWorkflowRules()
    {
        $code = Request::post('taskWorkflowCode');
        $list = TaskWorkflowRule::where(['workflow_code' => $code])->order('sort asc')->select();
        $this->success('', $list);
    }


    /**
     * 新增
     * @param Request $request
     * @return void
     */
    public function save()
    {
        $projectCode = Request::param('projectCode');
        $taskWorkflowName = Request::param('taskWorkflowName');
        $taskWorkflowRules = Request::param('taskWorkflowRules', '');
        if (!trim($taskWorkflowName)) {
            $this->error("请填写规则名称");
        }
        if (!$taskWorkflowRules) {
            $this->error("请定义具体规则");
        }
        $taskWorkflow = \app\common\Model\TaskWorkflow::createData($taskWorkflowName, $projectCode, getCurrentOrganizationCode());
        $taskWorkflow = \app\common\Model\TaskWorkflow::get($taskWorkflow['id']);
        $taskWorkflowRules = json_decode($taskWorkflowRules);
        TaskWorkflowRule::saveRules($taskWorkflow['code'], $taskWorkflowRules);
        $this->success('添加成功', []);
//        $this->error("操作失败，请稍候再试！");
    }

    /**
     * 保存
     * @param Request $request
     * @return void
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public function edit()
    {
        $taskWorkflowCode = Request::param('taskWorkflowCode');
        $taskWorkflowName = Request::param('taskWorkflowName');
        $taskWorkflowRules = Request::param('taskWorkflowRules', '');

        if (!trim($taskWorkflowName)) {
            $this->error("请填写规则名称");
        }
        if (!$taskWorkflowRules) {
            $this->error("请定义具体规则");
        }
        $taskWorkflow = \app\common\Model\TaskWorkflow::where(['code' => $taskWorkflowCode])->find();
        if (!$taskWorkflow) {
            $this->error("操作失败，请稍候再试！");
        }
        Db::startTrans();
        try {
            $taskWorkflow->name = $taskWorkflowName;
            $taskWorkflow->update_time = nowTime();
            $taskWorkflow->save();
            TaskWorkflowRule::where(['workflow_code' => $taskWorkflowCode])->delete();
            $taskWorkflowRules = json_decode($taskWorkflowRules);
            TaskWorkflowRule::saveRules($taskWorkflow['code'], $taskWorkflowRules);
        } catch (\Exception $exception) {
            Db::rollback();
            $this->error("操作失败，请稍候再试！");
        }
        Db::commit();
        $this->success('');
    }

    /**
     * 删除规则
     * @return void
     */
    public function delete()
    {
        $code = Request::post('taskWorkflowCode');
        if (!$code) {
            $this->error("请选择一个规则");
        }
        $result = \app\common\Model\TaskWorkflow::del($code);
        if (!isError($result)) {
            $this->success('删除成功');
        }
        $this->error("操作失败，请稍候再试！");
    }
}
