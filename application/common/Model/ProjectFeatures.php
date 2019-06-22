<?php

namespace app\common\Model;

use think\db\exception\DataNotFoundException;
use think\db\exception\ModelNotFoundException;
use think\Exception;
use think\exception\DbException;
use think\exception\PDOException;

/**
 * 版本库
 * Class ProjectFeatures
 * @package app\common\Model
 */
class ProjectFeatures extends CommonModel
{
    protected $append = [];

    /**
     * 创建版本库
     * @param $name
     * @param $description
     * @param $projectCode
     * @param $organizationCode
     * @return array
     * @throws DataNotFoundException
     * @throws DbException
     * @throws ModelNotFoundException
     */
    public function createData($name, $description, $projectCode, $organizationCode)
    {
        if (!$name) {
            return error(1, '请填写版本库名称');
        }
        $project = Project::where(['code' => $projectCode, 'deleted' => 0])->field('id')->find();
        if (!$project) {
            return error(3, '该项目已失效');
        }
        $features = self::where(['name' => $name, 'project_code' => $projectCode])->find();
        if ($features) {
            return error(2, '该版本库已名称存在');
        }
        $data = [
            'create_time' => nowTime(),
            'code' => createUniqueCode('ProjectFeatures'),
            'project_code' => $projectCode,
            'description' => $description,
            'organization_code' => $organizationCode,
            'name' => trim($name),
        ];
        $result = self::create($data)->toArray();
        return $result;
    }

    /**
     * 删除版本库
     * @param $featuresCode
     * @return array|bool
     * @throws Exception
     * @throws PDOException
     */
    public function deleteProjectFeatures($featuresCode)
    {
        if (!$featuresCode) {
            return error(1, '请选择一个版本库');
        }
        self::where(['code' => $featuresCode])->delete();
        Task::update(['features_code' => '', 'version_code' => ''], ['features_code' => $featuresCode]);
        return true;
    }
}
