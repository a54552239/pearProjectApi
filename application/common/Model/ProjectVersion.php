<?php

namespace app\common\Model;

use think\db\exception\DataNotFoundException;
use think\db\exception\ModelNotFoundException;
use think\Exception;
use think\exception\DbException;
use think\exception\PDOException;

/**
 * 版本
 * Class ProjectFeatures
 * @package app\common\Model
 */
class ProjectVersion extends CommonModel
{
    protected $append = ['statusText'];

    /**
     * 创建版本
     * @param $featuresCode
     * @param $name
     * @param $description
     * @param $projectCode
     * @param $organizationCode
     * @param $startTime
     * @param string $planPublishTime
     * @return array
     * @throws DataNotFoundException
     * @throws DbException
     * @throws ModelNotFoundException
     */
    public function createData($featuresCode, $name, $description, $organizationCode, $startTime, $planPublishTime = '')
    {
        if (!$name) {
            return error(1, '请填写版本名称');
        }

        $projectFeatures = ProjectFeatures::where(['code' => $featuresCode])->field('id')->find();
        if (!$projectFeatures) {
            return error(3, '该版本库已失效');
        }
        $version = self::where(['name' => $name, 'features_code' => $featuresCode])->find();
        if ($version) {
            return error(2, '该版本已名称存在');
        }
        $data = [
            'create_time' => nowTime(),
            'code' => createUniqueCode('ProjectVersion'),
            'features_code' => $featuresCode,
            'start_time' => $startTime,
            'plan_publish_time' => $planPublishTime,
            'description' => $description,
            'organization_code' => $organizationCode,
            'name' => trim($name),
        ];
        $result = self::create($data)->toArray();
        return $result;
    }

    /**
     * 删除版本
     * @param $featuresCode
     * @return array|bool
     * @throws Exception
     * @throws PDOException
     */
    public function deleteProjectVersion($versionCode)
    {
        if (!$versionCode) {
            return error(1, '请选择一个版本');
        }
        self::where(['code' => $versionCode])->delete();
        Task::update(['features_code' => '', 'version_code' => ''], ['version_code' => $versionCode]);
        return true;
    }

    public function changeStatus($versionCode, $status, $publishTime = '')
    {
        if (!$versionCode) {
            return error(1, '请选择一个版本');
        }
        $updateData = ['status' => $status];
        if ($status == 3) {
            $updateData['publish_time'] = $publishTime;
        }
        self::update($updateData, ['code' => $versionCode]);
        return true;
    }

    public function getStatusTextAttr($value, $data)
    {
        //状态。0：未开始，1：进行中，2：延期发布，3：已发布
        if (!isset($data['status'])) {
            return '-';
        }
        switch ($data['status']) {
            case 0:
                return '未开始';
            case 1:
                return '进行中';
            case 2:
                return '延期发布';
            case 3:
                return '已发布';

        }

    }
}
