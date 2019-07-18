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

    /**
     * 保存规则
     * @param $workflowCode
     * @param $taskWorkflowRules Object
     */
    public static function saveRules($workflowCode, $taskWorkflowRules)
    {
        TaskWorkflowRule::createData($workflowCode, 1, $taskWorkflowRules->firstObj);
        TaskWorkflowRule::createData($workflowCode, 2, $taskWorkflowRules->firstAction->value, $taskWorkflowRules->firstAction->action);
        TaskWorkflowRule::createData($workflowCode, 3, $taskWorkflowRules->firstResult->value, $taskWorkflowRules->firstResult->action);
        if ($taskWorkflowRules->lastResult->value) {
            TaskWorkflowRule::createData($workflowCode, 4, $taskWorkflowRules->lastResult->value, $taskWorkflowRules->lastResult->action);
            if ($taskWorkflowRules->state->value) {
                TaskWorkflowRule::createData($workflowCode, 5, '', $taskWorkflowRules->state->value);
            }
        } else {
            if ($taskWorkflowRules->state->value) {
                TaskWorkflowRule::createData($workflowCode, 4, '', $taskWorkflowRules->state->value);
            }
        }
    }

    public static function createData($workflowCode, $sort, $objectCode = '', $action = 0, $type = 0)
    {
        $data = [
            'create_time' => nowTime(),
            'code' => createUniqueCode('TaskWorkflowRule'),
            'type' => $type,
            'object_code' => $objectCode,
            'action' => $action,
            'sort' => $sort,
            'workflow_code' => $workflowCode,
        ];
        return self::create($data);
    }

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
        } elseif ($do['action'] == 3) {
            //指派给
            try {
                TaskMember::inviteMember($do['object_code'], $task['code'], 1, 0, false, true);
            } catch (\Exception $exception) {
            }
        } elseif ($do['action'] == 1) {
            //完成
            $task->done = 1;
            $task->save();
        } elseif ($do['action'] == 2) {
            //重做
            $task->done = 0;
            $task->save();
        }
        $next = self::where(['workflow_code' => $do['workflow_code'], 'sort' => $do['sort'] + 1])->find();
        if ($next) {
            return self::doAction($task, $next);
        }
        return true;
    }
}
