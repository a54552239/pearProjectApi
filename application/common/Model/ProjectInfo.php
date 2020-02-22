<?php

namespace app\common\Model;

class ProjectInfo extends CommonModel
{
    protected $pk = 'id';

    /**
     * 创建项目信息
     * @param $name
     * @param $description
     * @param $projectCode
     * @param $organizationCode
     * @return array
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public function createData($name, $value, $description, $projectCode, $organizationCode, $sort = 0)
    {
        if (!$name) {
            return error(1, '请填写项目信息名称');
        }
        $project = Project::where(['code' => $projectCode, 'deleted' => 0])->field('id')->find();
        if (!$project) {
            return error(3, '该项目已失效');
        }
        $data = [
            'create_time' => nowTime(),
            'code' => createUniqueCode('ProjectInfo'),
            'project_code' => $projectCode,
            'description' => $description,
            'organization_code' => $organizationCode,
            'value' => trim($value),
            'sort' => $sort,
            'name' => trim($name),
        ];
        $result = self::create($data)->toArray();
        return $result;
    }
}
