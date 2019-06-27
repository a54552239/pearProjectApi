<?php

namespace app\common\Model;

use think\Db;

/**
 * 任务工作流
 * Class TaskWorkflow
 * @package app\common\Model
 */
class TaskWorkflow extends CommonModel
{
    protected $append = [];

    public static function createData($name, $projectCode, $organizationCode)
    {
        $data = [
            'create_time' => nowTime(),
            'code' => createUniqueCode('TaskWorkflow'),
            'project_code' => $projectCode,
            'organization_code' => $organizationCode,
            'name' => trim($name),
        ];
        return self::create($data);
    }

    public static function del($code)
    {
        Db::startTrans();
        try {
            self::where(['code' => $code])->delete();
            TaskWorkflowRule::where(['workflow_code' => $code])->delete();
        } catch (\Exception $exception) {
            Db::rollback();
            return error(1, $exception->getMessage());
        }
        Db::commit();
        return true;
    }
}
