<?php

namespace app\common\Model;

/**
 * 任务工作流规则
 * Class TaskWorkflow
 * @package app\common\Model
 */
class TaskWorkflowRule extends CommonModel
{
    protected $append = [];

    public static function getActionByTaskType($type)
    {
        switch ($type) {
            case 'done':
                return 1;
            case 'redo':
                return 2;
            case 'assign':
                return 3;
            case 'setEndTime':
                return 4;
            case 'pri':
                return 5;
            default:
                return 0;
        }
    }

    /**
     * 执行策略
     * @param $task
     * @param $do
     * @return bool
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public static function doAction($task, $do)
    {
        if ($do['action'] == 0) {
            //跳转到
            $oldStageCode = $task->stage_code;
            $toStageCode = $do['object_code'];
            $task->stage_code = $toStageCode;
            $task->save();
            if ($oldStageCode != $toStageCode) {
                $stage = TaskStages::where(['code' => $toStageCode])->find();
                Task::taskHook(getCurrentMember()['code'], $task['code'], 'move', '', '', '', '', '', ['stageName' => $stage['name'], 'is_robot' => true]);
            }
        } elseif ($do['action'] == 1) {
            //指派给
            try {
                TaskMember::inviteMember($do['object_code'], $task['code'], 1, 0, false, true);
            } catch (\Exception $exception) {
            }
        }
        $next = self::where(['workflow_code' => $do['workflow_code'], 'sort' => $do['sort'] + 1])->find();
        if ($next) {
            return self::doAction($task, $next);
        }
        return true;
    }
}
