<?php

namespace app\project\controller;

use app\common\Model\Member;
use app\common\Model\ProjectLog;
use app\common\Model\ProjectVersionLog;
use controller\BasicApi;
use think\db\exception\DataNotFoundException;
use think\db\exception\ModelNotFoundException;
use think\Exception;
use think\exception\DbException;
use think\exception\PDOException;
use think\facade\Request;

/**
 */
class ProjectVersion extends BasicApi
{
    public function __construct()
    {
        parent::__construct();
        if (!$this->model) {
            $this->model = new \app\common\Model\ProjectVersion();
        }
    }

    /**
     * 显示资源版本
     * @return void
     * @throws DataNotFoundException
     * @throws ModelNotFoundException
     * @throws DbException
     */
    public function index()
    {
        $where = [];
        $code = Request::post('projectFeaturesCode');
        if (!$code) {
            $this->error("请选择一个版本库");
        }
        $where[] = ['features_code', '=', $code];
        $list = $this->model->where($where)->order('id asc')->select()->toArray();
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
        $data = $request::only('featuresCode,name,description,projectCode,startTime,planPublishTime');
        if (!$request::post('name')) {
            $this->error("请填写版本名称");
        }
        $result = $this->model->createData($data['featuresCode'], $data['name'], $data['description'], getCurrentOrganizationCode(), $data['startTime'], $data['planPublishTime']);
        if (!isError($result)) {
            \app\common\Model\ProjectVersion::versionHook(getCurrentMember()['code'], $result['code'], 'create');
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
        $data = $request::only('name,description,start_time,plan_publish_time');
        $versionCode = $request::param('versionCode');
        if (isset($data['name']) && !$data['name']) {
            $this->error("请填写版本名称");
        }
        if (!$versionCode) {
            $this->error("请选择一个版本");
        }
        $version = $this->model->where(['code' => $versionCode])->field('id,features_code')->find();
        if (!$version) {
            $this->error("该版本已失效");
        }
        if (isset($data['name'])) {
            $has = $this->model->where(['name' => $data['name'], 'features_code' => $version['features_code']])->field('id')->find();
            if ($has && $has['id'] != $version['id']) {
                $this->error("该版本名称已存在");
            }
        }
        $result = $this->model->_edit($data, ['code' => $versionCode]);
        if ($result) {
            $member = getCurrentMember();
            $type = 'name';
            if (isset($data['name'])) {
                $type = 'name';
            }
            if (isset($data['description'])) {
                $type = 'content';
                if (!$data['description']) {
                    $type = 'clearContent';
                }
            }
            if (isset($data['start_time'])) {
                $type = 'setStartTime';
                if (!$data['start_time']) {
                    $type = 'clearStartTime';
                }
            }
            if (isset($data['plan_publish_time'])) {
                $type = 'setPlanPublishTime';
                if (!$data['plan_publish_time']) {
                    $type = 'clearPlanPublishTime';
                }
            }
            \app\common\Model\ProjectVersion::versionHook($member['code'], $versionCode, $type);
            $this->success('');
        }
        $this->error("操作失败，请稍候再试！");
    }

    /**
     * 更改状态
     */
    public function changeStatus()
    {
        $code = Request::post('versionCode');
        $status = Request::post('status', '');
        $publishTime = Request::post('publishTime', '');
        $result = $this->model->changeStatus($code, $status, $publishTime);
        if (isError($result)) {
            $this->error($result['msg'], $result['errno']);
        }
        $this->success();
    }

    /**
     * 详情
     * @throws DataNotFoundException
     * @throws DbException
     * @throws ModelNotFoundException
     */
    public function read()
    {
        $code = Request::post('versionCode');
        $version = $this->model->where(['code' => $code])->field('id', true)->find();
        if ($version) {
            $feature = \app\common\Model\ProjectFeatures::where(['code' => $version['features_code']])->find();
            $feature && $version['featureName'] = $feature['name'];
            $version['projectCode'] = $feature['project_code'];
        }
        $this->success('', $version);
    }

    /**
     * 关联任务列表
     * @throws DataNotFoundException
     * @throws DbException
     * @throws ModelNotFoundException
     */
    public function _getVersionTask()
    {
        $code = Request::post('versionCode');
        $taskList = \app\common\Model\Task::where(['version_code' => $code, 'deleted' => 0])->order('id desc')->field('id', true)->select();
        if ($taskList) {
            foreach ($taskList as &$task) {
                $task['executor'] = Member::where(['code' => $task['assign_to']])->field('name,avatar')->find();
            }
        }
        $this->success('', $taskList);
    }

    /**
     * 关联任务
     */
    public function addVersionTask()
    {
        $taskCodeList = Request::post('taskCodeList');
        $versionCode = Request::post('versionCode');
        $taskCodeList && $taskCodeList = json_decode($taskCodeList);
        $successTotal = 0;
        $successTaskList = [];
        if ($taskCodeList) {
            foreach ($taskCodeList as $taskCode) {
                $result = $this->model->addVersionTask($taskCode, $versionCode);
                if (!isError($result)) {
                    $successTotal++;
                    $successTaskList[] = $result['name'];
                }
            }
        }
        if ($successTotal) {
            \app\common\Model\ProjectVersion::versionHook(getCurrentMember()['code'], $versionCode, 'addVersionTask', '', '', $successTaskList);

        }
        $this->success('', ['successTotal' => $successTotal]);
    }

    /**
     * 移除发布内容
     */
    public function removeVersionTask()
    {
        $taskCode = Request::post('taskCode');
        $result = $this->model->removeVersionTask($taskCode);
        if (isError($result)) {
            $this->error($result['msg'], $result['errno']);
        }
        $this->success();
    }

    /**
     * 版本日志
     * @throws DataNotFoundException
     * @throws DbException
     * @throws ModelNotFoundException
     */
    public function _getVersionLog()
    {
        $code = Request::post('versionCode');
        $showAll = Request::post('all', 0);
        $where = [];
        $where[] = ['source_code', '=', $code];
        $projectVersionModel = new ProjectVersionLog();
        if ($showAll) {
            $list = [];
            $list['list'] = $projectVersionModel->where($where)->order('id asc')->select()->toArray();
            $list['total'] = count($list['list']);
        } else {
            $list = $projectVersionModel->_list($where, 'id desc');
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
     * 删除版本
     * @return void
     * @throws Exception
     * @throws PDOException
     */
    public function delete()
    {
        $code = Request::post('versionCode');
        if (!$code) {
            $this->error("请选择一个版本");
        }
        $result = $this->model->deleteProjectVersion($code);
        if (isError($result)) {
            $this->error($result['msg'], $result['errno']);
        }
        $this->success();
    }
}
