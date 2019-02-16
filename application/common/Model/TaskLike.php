<?php

namespace app\common\Model;

/**
 * 任务点赞
 * Class TaskLike
 * @package app\common\Model
 */
class TaskLike extends CommonModel
{
    protected $append = [];

    /**
     * @param $code
     * @param $memberCode
     * @param $like
     * @return TaskLike|bool
     * @throws \think\Exception
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     * @throws \think\exception\PDOException
     */
    public static function likeTask($code, $memberCode, $like)
    {
        $liked = self::where(['task_code' => $code, 'member_code' => $memberCode])->find();
        if ($like && !$liked) {
            $data = [
                'create_time' => nowTime(),
                'create_by' => $memberCode,
                'task_code' => $code,
                'member_code' => $memberCode,
            ];
            return self::create($data);
        }
        if (!$like) {
            return self::where(['task_code' => $code, 'member_code' => $memberCode])->delete();
        }
    }

}
