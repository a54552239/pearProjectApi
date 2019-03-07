<?php

namespace app\project\controller;

use app\common\Model\Member;
use app\common\Model\ProjectLog;
use app\common\Model\TaskTag;
use app\common\Model\TaskToTag;
use controller\BasicApi;
use think\facade\Request;

/**
 */
class Task extends BasicApi
{
    public function __construct()
    {
        parent::__construct();
        if (!$this->model) {
            $this->model = new \app\common\Model\Task();
        }
    }

    /**
     * 显示资源列表
     * @return void
     * @throws \think\exception\DbException
     */
    public function index()
    {
        $where = [];
        $params = Request::only('stageCode,pcode,keyword,order,projectCode,deleted');
        foreach (['stageCode', 'pcode', 'deleted', 'projectCode'] as $key) {
            if ($key == 'projectCode') {
                (isset($params[$key]) && $params[$key] !== '') && $where[] = ['project_code', '=', $params[$key]];
                continue;
            }
            (isset($params[$key]) && $params[$key] !== '') && $where[] = [$key, '=', $params[$key]];
        }
        if (isset($params['keyword'])) {
            $where[] = ['name', 'like', "%{$params['keyword']}%"];
        }
        $order = 'sort asc,id asc';
        if (isset($params['order'])) {
            $order = $params['order'];
        }
        $list = $this->model->_list($where, $order);
        if ($list['list']) {
            foreach ($list['list'] as &$task) {
                $task['executor'] = Member::where(['code' => $task['assign_to']])->field('name,avatar')->find();
            }
        }
        $this->success('', $list);
    }

    /**
     * 项目时间段任务统计
     */
    public function dateTotalForProject()
    {
        $projectCode = Request::post('projectCode');
        $list = $this->model->dateTotalForProject($projectCode);
        $this->success('', $list);
    }

    /**
     * 获取自己的任务
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public function selfList()
    {
        $type = Request::post('type', 0);
        $memberCode = Request::post('memberCode', '');
        if (!$memberCode) {
            $member = getCurrentMember();
        } else {
            $member = Member::where(['code' => $memberCode])->find();
        }
        $done = 1;
        if (!$type) {
            $done = 0;
        }
        $type == -1 && $done = $type;
        $list = $this->model->getMemberTasks($member['code'], $done, Request::post('page'), Request::post('pageSize'));
        if ($list['list']) {
            foreach ($list['list'] as &$task) {
                $task['executor'] = Member::where(['code' => $task['assign_to']])->field('name,avatar')->find();
                $task['projectInfo'] = \app\common\Model\Project::where(['code' => $task['project_code']])->field('name,code')->find();
            }
        }
        $this->success('', $list);
    }

    public function taskSources()
    {
        $code = Request::post('taskCode');
        try {
            $list = $this->model->taskSources($code);
        } catch (\Exception $e) {
            $this->error($e->getMessage());
        }
        $this->success('', $list);
    }

    public function read(Request $request)
    {
        //todo 隐私模式阅读权限
        $data = $request::only('taskCode');
        try {
            $result = $this->model->read($data['taskCode']);
        } catch (\Exception $e) {
            $this->error($e->getMessage(), $e->getCode());
        }
        if ($result) {
            $this->success('', $result);
        }
    }

    /**
     * 新增
     * @param Request $request
     * @return void
     */
    public function save(Request $request)
    {
        $data = $request::only('name,stage_code,project_code,assign_to,pcode');
        if (!isset($data['assign_to'])) {
            $data['assign_to'] = '';
        }
        if (!isset($data['pcode'])) {
            $data['pcode'] = '';
        }
        if (!$request::post('name')) {
            $this->error("请填写任务标题");
        }
        try {
            $member = getCurrentMember();
            if ($data['pcode']) {
                $parentTask = $this->model->where(['code' => $data['pcode']])->find();
                if (!$parentTask) {
                    throw new \Exception('父任务无效', 5);
                }
                if ($parentTask['deleted']) {
                    throw new \Exception('父任务在回收站中无法编辑', 6);
                }
                $result = $this->model->createTask($parentTask['stage_code'], $parentTask['project_code'], $data['name'], $member['code'], $data['assign_to'], $data['pcode']);
            } else {
                $result = $this->model->createTask($data['stage_code'], $data['project_code'], $data['name'], $member['code'], $data['assign_to']);
            }
        } catch (\Exception $e) {
            $this->error($e->getMessage(), $e->getCode());;
        }
        if ($result) {
            $this->success('', $result);
        }
        $this->error("操作失败，请稍候再试！");
    }

    /**
     * 执行任务
     * @param Request $request
     */
    public function taskDone(Request $request)
    {
        $data = $request::only('taskCode,done');
        if (!$request::post('taskCode')) {
            $this->error("请选择任务");
        }
        try {
            $result = $this->model->taskDone($data['taskCode'], $data['done']);
        } catch (\Exception $e) {
            $this->error($e->getMessage(), $e->getCode());;
        }
        if ($result) {
            $this->success('', $result);
        }
        $this->error("操作失败，请稍候再试！");
    }

    /**
     * 指派任务
     * @param Request $request
     */
    public function assignTask(Request $request)
    {
        $data = $request::only('taskCode,executorCode');
        if (!$request::post('taskCode')) {
            $this->error("请选择任务");
        }
        try {
            $result = $this->model->assignTask($data['taskCode'], $data['executorCode']);
        } catch (\Exception $e) {
            $this->error($e->getMessage(), $e->getCode());;
        }
        if ($result) {
            $this->success('', $result);
        }
        $this->error("操作失败，请稍候再试！");
    }


    /**
     * 批量
     * 指派任务
     * @param Request $request
     */
    public function batchAssignTask(Request $request)
    {
        $taskCodes = $request::param('taskCodes');
        $executorCode = $request::param('executorCode');
        if ($taskCodes) {
            $result = $this->model->batchAssignTask(json_decode($taskCodes), $executorCode);
            if (isError($result)) {
                $this->error($result['msg'], $result['errno']);
            }
        }
        $this->success();
    }

    /**
     * 排序
     * @param Request $request
     */
    public function sort(Request $request)
    {
        $data = $request::only('stageCode,codes');
        if (!$request::post('codes')) {
            $this->error("参数有误");
        }
        try {
            $this->model->sort($data['stageCode'], explode(',', $data['codes']));
        } catch (\Exception $e) {
            $this->error($e->getMessage(), $e->getCode());;
        }
        $this->success();
    }

    /**
     * 发表评论
     * @param Request $request
     */
    public function createComment(Request $request)
    {
        $data = $request::only('taskCode,comment');
        if (!$request::post('taskCode')) {
            $this->error("请选择任务");
        }
        try {
            $result = $this->model->createComment($data['taskCode'], $data['comment']);
        } catch (\Exception $e) {
            $this->error($e->getMessage(), $e->getCode());;
        }
        if ($result) {
            $this->success('', $result);
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
        $data = $request::only('name,sort,end_time,pri,description');
        $code = $request::post('taskCode');
        if (!$code) {
            $this->error("请选择一个任务");
        }
        $template = $this->model->where(['code' => $code])->field('id')->find();
        if (!$template) {
            $this->error("该任务已失效");
        }
        try {
            $result = $this->model->edit($code, $data);
        } catch (\Exception $e) {
            $this->error($e->getMessage(), $e->getCode());;

        }
        if ($result) {
            $this->success();
        }
        $this->error("操作失败，请稍候再试！");
    }

    /**
     * 设置隐私模式
     * @param Request $request
     * @throws \Exception
     */
    public function setPrivate(Request $request)
    {
        $private = intval($request::post('private', 0));
        $code = $request::post('taskCode');
        if ($private === 0 || $private === 1) {
            $result = $this->model->edit($code, ['private' => $private]);
            if ($result) {
                $this->success();
            }
            $this->error("操作失败，请稍候再试！");
        }
        $this->success();
    }

    /**
     * 点赞
     * @param Request $request
     * @return void
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public function like(Request $request)
    {
        $data = $request::only('like');
        $code = $request::post('taskCode');
        if (!$code) {
            $this->error("请选择一个任务");
        }
        $template = $this->model->where(['code' => $code])->field('id')->find();
        if (!$template) {
            $this->error("该任务已失效");
        }
        try {
            $result = $this->model->like($code, $data['like']);
        } catch (\Exception $e) {
            $this->error($e->getMessage(), $e->getCode());;

        }
        if ($result) {
            $this->success();
        }
        $this->error("操作失败，请稍候再试！");
    }

    /**
     * 任务标签列表
     * @param Request $request
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public function taskToTags(Request $request)
    {
        $taskCode = $request::param('taskCode');
        $tags = TaskToTag::where(['task_code' => $taskCode])->field('id', true)->select()->toArray();
        $this->success('', $tags);
    }

    /**
     * 设置标签
     * @param Request $request
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public function setTag(Request $request)
    {
        $tagCode = $request::param('tagCode');
        $taskCode = $request::param('taskCode');
        if (!$taskCode) {
            $this->error("请选择一个任务");
        }
        if (!$tagCode) {
            $this->error("请选择一个标签");
        }
        TaskTag::setTag($tagCode, $taskCode);
        $this->success();
    }

    /**
     * 收藏
     * @param Request $request
     * @return void
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public function star(Request $request)
    {
        $data = $request::only('star');
        $code = $request::post('taskCode');
        if (!$code) {
            $this->error("请选择一个任务");
        }
        $task = $this->model->where(['code' => $code])->field('id')->find();
        if (!$task) {
            $this->notFound();
        }
        try {
            $result = $this->model->star($code, $data['star']);
        } catch (\Exception $e) {
            $this->error($e->getMessage(), $e->getCode());;

        }
        if ($result) {
            $this->success();
        }
        $this->error("操作失败，请稍候再试！");
    }

    /**
     * @throws \think\exception\DbException
     */
    public function taskLog()
    {
        $taskCode = Request::post('taskCode');
        $showAll = Request::post('all', 0);
        $onlyComment = Request::post('comment', 0);
        $where = [];
        $where[] = ['source_code', '=', $taskCode];
        $where[] = ['action_type', '=', 'task'];
        if ($onlyComment) {
            $where[] = ['is_comment', '=', 1];
        }
        $projectLogModel = new ProjectLog();
        if ($showAll) {
            $list = [];
            $list['list'] = $projectLogModel->where($where)->order('id asc')->select()->toArray();
            $list['total'] = count($list['list']);
        } else {
            $list = $projectLogModel->_list($where, 'id desc');
            if ($list['list']) {
                $list['list'] = array_reverse($list['list']);
            }
        }
        if ($list['list']) {
            foreach ($list['list'] as &$item) {
                $member = Member::where(['code' => $item['member_code']])->field('id,name,avatar,code')->find();
                !$member && $member = [];
                $item['member'] = $member;
            }
        }
        $this->success('', $list);
    }

    /**
     * 批量放入回收站
     */
    public function recycleBatch()
    {
        try {
            $this->model->recycleBatch(Request::post('stageCode'));
        } catch (\Exception $e) {
            $this->error($e->getMessage(), $e->getCode());;
        }
        $this->success('');
    }

    /**
     * 放入回收站
     */
    public function recycle()
    {
        try {
            $this->model->recycle(Request::post('taskCode'));
        } catch (\Exception $e) {
            $this->error($e->getMessage(), $e->getCode());;
        }
        $this->success('');
    }

    /**
     * 恢复
     */
    public function recovery()
    {
        try {
            $this->model->recovery(Request::post('taskCode'));
        } catch (\Exception $e) {
            $this->error($e->getMessage(), $e->getCode());;
        }
        $this->success('');
    }

    /**
     * 彻底删除
     */
    public function delete()
    {
        try {
            $this->model->del(Request::post('taskCode'));
        } catch (\Exception $e) {
            $this->error($e->getMessage(), $e->getCode());;
        }
        $this->success('');
    }
}
