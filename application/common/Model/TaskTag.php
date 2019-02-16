<?php

namespace app\common\Model;

/**
 * 任务标签
 * Class TaskTag
 * @package app\common\Model
 */
class TaskTag extends CommonModel
{
    protected $append = [];

    /**
     * 创建标签
     * @param $name
     * @param $color
     * @param $projectCode
     * @return array
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public function createTag($name, $color, $projectCode)
    {
        if (!$name) {
            return error(1, '请填写标签名称');
        }
        $project = Project::where(['code' => $projectCode, 'deleted' => 0])->field('id')->find();
        if (!$project) {
            return error(3, '该项目已失效');
        }
        $tag = self::where(['name' => $name, 'project_code' => $projectCode])->find();
        if ($tag) {
            return error(2, '该标签已存在');
        }
        $data = [
            'create_time' => nowTime(),
            'code' => createUniqueCode('taskTag'),
            'project_code' => $projectCode,
            'color' => $color,
            'name' => trim($name),
        ];
        $result = self::create($data)->toArray();
        return $result;
    }

    /**
     * 删除标签
     * @param $tagCode
     * @return array|bool
     * @throws \think\Exception
     * @throws \think\exception\PDOException
     */
    public function deleteTag($tagCode)
    {
        if (!$tagCode) {
            return error(1, '请选择一个标签');
        }
        self::where(['code' => $tagCode])->delete();
        TaskToTag::where(['tag_code' => $tagCode])->delete();
        return true;
    }

    /**
     * 设置标签
     * @param $tagCode
     * @param $taskCode
     * @return TaskToTag|bool
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public static function setTag($tagCode, $taskCode)
    {
        $data = ['tag_code' => $tagCode, 'task_code' => $taskCode];
        $taskToTag = TaskToTag::where($data)->find();
        if ($taskToTag) {
            return $taskToTag->delete($data);
        } else {
            $data['create_time'] = nowTime();
            $data['code'] = createUniqueCode('taskToTag');
            return TaskToTag::create($data);
        }
    }
}
