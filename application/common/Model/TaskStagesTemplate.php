<?php

namespace app\common\Model;

use service\FileService;
use service\RandomService;
use think\File;

/**
 * 任务列表模板
 * Class Organization
 * @package app\common\Model
 */
class TaskStagesTemplate extends CommonModel
{
    protected $append = [];

    public static $defaultTaskStagesNameList = ['待处理', '进行中', '已完成'];

    /**
     * 创建任务列表模板
     * @param $projectTemplateCode
     * @param $name
     * @return TaskStagesTemplate
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public static function createTaskStagesTemplate($projectTemplateCode, $name)
    {
        $data = [
            'create_time' => nowTime(),
            'code' => createUniqueCode('taskStagesTemplate'),
            'project_template_code' => $projectTemplateCode,
            'name' => $name,
        ];
        $result = self::create($data);
        return $result;
    }

    /**
     * 创建任务列表模板
     * @param $code
     * @param $name
     * @param int $sort
     * @return TaskStagesTemplate
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public function createTemplate($code, $name, $sort = 0)
    {
        $data = [
            'create_time' => nowTime(),
            'code' => createUniqueCode('taskStagesTemplate'),
            'project_template_code' => $code,
            'sort' => $sort,
            'name' => $name,
        ];
        $result = self::create($data);
        return $result;
    }

    /**
     * 删除模板
     * @param $code
     * @return bool
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public function deleteTemplate($code)
    {
        $template = self::where(['code' => $code])->field('id')->find();
        if (!$template) {
            throw new \Exception('该模板不存在', 1);
        }
        $result = self::destroy(['code' => $code]);
        if (!$result) {
            throw new \Exception('删除失败', 2);
        }
        return $result;
    }
}
