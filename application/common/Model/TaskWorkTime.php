<?php

namespace app\common\Model;

use think\db\exception\DataNotFoundException;
use think\db\exception\ModelNotFoundException;
use think\exception\DbException;

/**
 * 任务工时
 * Class TaskLike
 * @package app\common\Model
 */
class TaskWorkTime extends CommonModel
{
    protected $append = [];

    /**
     * 创建工时
     * @param $taskCode
     * @param $memberCode
     * @param $num
     * @param $beginTime
     * @param string $content
     * @return array
     * @throws DataNotFoundException
     * @throws ModelNotFoundException
     * @throws DbException
     */
    public static function createData($taskCode, $memberCode, $num, $beginTime, $content = '')
    {
        if (!$taskCode) {
            return error(1, '请选择任务');
        }
        $task = Task::where(['code' => $taskCode, 'deleted' => 0])->field('id')->find();
        if (!$task) {
            return error(2, '该任务已失效');
        }
        if (!$memberCode) {
            return error(3, '请指定成员');
        }
        if (!$beginTime) {
            return error(4, '请选择开始时间');
        }
        if (!$num || $num < 0 || !is_numeric($num)) {
            return error(6, '请输入有效工时');
        }
        $data = [
            'create_time' => nowTime(),
            'code' => createUniqueCode('TaskWorkTime'),
            'task_code' => $taskCode,
            'num' => $num,
            'content' => $content,
            'begin_time' => $beginTime,
            'member_code' => $memberCode,
        ];
        $result = self::create($data)->toArray();
        return $result;
    }


}
