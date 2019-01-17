<?php

namespace app\common\Model;

use service\FileService;
use service\RandomService;
use think\File;

/**
 * 项目模板
 * Class Organization
 * @package app\common\Model
 */
class ProjectTemplate extends CommonModel
{
    protected $append = [];

    /**
     * 创建项目模板
     * @param $memberCode
     * @param $orgCode
     * @param $name
     * @param string $description
     * @param string $cover
     * @return ProjectTemplate
     * @throws \think\Exception
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     * @throws \think\exception\PDOException
     */
    public function createProjectTemplate($memberCode, $orgCode, $name, $description = '', $cover = '')
    {
        $data = [
            'create_time' => nowTime(),
            'code' => createUniqueCode('projectTemplate'),
            'member_code' => $memberCode,
            'name' => $name,
            'description' => $description,
            'organization_code' => $orgCode,
            'cover' => $cover ?? FileService::getFilePrefix() . 'static/image/default/cover.png'
        ];
        $result = self::create($data);
        if ($result) {
            $taskStagesList = TaskStagesTemplate::$defaultTaskStagesNameList;
            if ($taskStagesList) {
                foreach ($taskStagesList as $name) {
                    TaskStagesTemplate::createTaskStagesTemplate($data['code'], $name);
                }
            }
        }
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
        return TaskStagesTemplate::destroy(['project_template_code' => $code]);
    }

    /**
     * @param File $file
     * @return array|bool
     * @throws \think\Exception
     * @throws \think\exception\PDOException
     * @throws \Exception
     */
    public function uploadCover(File $file)
    {
        return $this->_uploadImg($file);
    }
}
