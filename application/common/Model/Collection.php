<?php

namespace app\common\Model;

/**
 * 收藏
 * Class TaskStar
 * @package app\common\Model
 */
class Collection extends CommonModel
{
    protected $append = [];

    /**
     * @param $code
     * @param $memberCode
     * @param $star
     * @return TaskLike|bool
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public static function starTask($code, $memberCode, $star)
    {
        $stared = self::where(['source_code' => $code, 'type' => 'task', 'member_code' => $memberCode])->find();
        if ($star && !$stared) {
            $data = [
                'create_time' => nowTime(),
                'code' => createUniqueCode('collection'),
                'create_by' => $memberCode,
                'source_code' => $code,
                'type' => 'task',
                'member_code' => $memberCode,
            ];
            return self::create($data);
        }
        if (!$star) {
            return self::where(['source_code' => $code, 'type' => 'task', 'member_code' => $memberCode])->delete();
        }
    }

}
