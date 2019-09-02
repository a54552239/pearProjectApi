<?php

namespace app\project\middleware;

use app\common\Model\Project;
use app\common\Model\ProjectMember;
use app\common\Model\Task;
use app\common\Model\TaskStages;
use think\Request;

/**
 * 项目内容操作权限管理
 * Class ProjectAuth
 * @package app\admin\middleware
 */
class ProjectAuth
{
    protected $needAuthActions = [
        'Project/edit',
        'Project/recycle',
        'Project/recovery',
        'Project/archive',
        'Project/recoveryArchive',
        'ProjectMember/inviteMember',

        'Task/save',
        'Task/taskDone',
        'Task/assignTask',
        'Task/sort',
        'Task/edit',
        'Task/recycle',
        'Task/recovery',
        'Task/recycle',
        'Task/delete',

        'TaskMember/inviteMember',
        'TaskMember/inviteMemberBatch',

        'TaskStages/save',
        'TaskStages/sort',
        'TaskStages/edit',
        'TaskStages/delete',
    ];
    protected $needVisibleActions = [
        'Project/read',
        'Task/read',
        'TaskStages/index',
    ];

    /**
     * 权限检测
     * 原则上需要获取到项目的code进行判断，所以接口需要传递projectCode或者taskCode来获得项目信息
     * @param Request $request
     * @param \Closure $next
     * @return mixed
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public function handle($request, \Closure $next)
    {
        $member = getCurrentMember();
        if (!$member) {
            return $next($request);
        }
        list($module, $controller, $action) = [$request->module(), $request->controller(), $request->action()];
        $node = "$controller/$action";
        //方法转小写
        foreach ($this->needAuthActions as &$action) {
            $arr = explode('/', $action);
            $arr[1] = strtolower($arr[1]);
            $action = implode('/', $arr);
        }
        //操作权限
        if (in_array($node, $this->needAuthActions)) {
            $code = $this->getCode();
            if (!$code) {
//                return json(['code' => 404, 'msg' => '资源不存在']);
            }
            if ($code) {
                $result = $this->checkAuth($code);
                if (!$result) {
                    return json(['code' => 403, 'msg' => '无权限操作资源，访问被拒绝']);
                }
            }
        }
        //只读权限
        if (in_array($node, $this->needVisibleActions)) {
            $code = $this->getCode();
            if ($code) {
                $info = Project::where(['code' => $code])->field('private')->find();
                if ($info['private']) {
                    $result = $this->checkAuth($code);
                    if (!$result) {
                        return json(['code' => 4031, 'msg' => '无权限操作资源，访问被拒绝']);
                    }
                }
            }
        }
        return $next($request);
    }

    public function getCode()
    {
        $code = \think\facade\Request::param('projectCode');
        if (!$code) {
            $code = \think\facade\Request::param('project_code');
        }
        if (!$code) {
            $taskCode = \think\facade\Request::param('taskCode');
            if (!$taskCode) {
                $taskCode = \think\facade\Request::param('pcode'); // 父任务
            }
            $task = Task::where(['code' => $taskCode])->field('project_code')->find();

            if ($task) {
                $code = $task['project_code'];
            }
        }
        if (!$code) {
            $taskStageCode = \think\facade\Request::param('stageCode');
            if ($taskStageCode) {
                $taskStage = TaskStages::where(['code' => $taskStageCode])->find();
                if ($taskStage) {
                    $code = $taskStage['project_code'];
                }
            }
        }
        return $code;
    }

    /**
     * 检测操作权限
     * @param $code
     * @return bool
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public function checkAuth($code)
    {
        $info = Project::where(['code' => $code])->field('private')->find();
        if (!$info) {
            return false;
        }
        $where = ['project_code' => $code, 'member_code' => getCurrentMember()['code']];
        $projectMember = ProjectMember::where($where)->field('id')->find();
        if (!$projectMember) {
            return false;
        }
        return true;
    }
}
