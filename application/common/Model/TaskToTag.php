<?php

namespace app\common\Model;

/**
 * 任务标签映射
 * Class TaskToTag
 * @package app\common\Model
 */
class TaskToTag extends CommonModel
{
    protected $append = ['tag'];

    public function tag()
    {
        return $this->belongsTo('taskTag', 'tag_code', 'code');
    }
}
