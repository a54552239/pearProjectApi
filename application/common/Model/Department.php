<?php

namespace app\common\Model;

use service\ToolsService;
use think\Db;

/**
 * 部门
 * Class Organization
 * @package app\common\Model
 */
class Department extends CommonModel
{
    protected $append = [];

    /**
     * @param $name
     * @param string $parentDepartmentCode
     * @return Department
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public function createDepartment($name, $parentDepartmentCode = '')
    {
        $path = '';
        if ($parentDepartmentCode) {
            $parentDepartment = self::where(['code' => $parentDepartmentCode])->field('code,path')->find();
            $parentDepartment['path'] && $parentDepartment['path'] = ",{$parentDepartment['path']}";
            $path = "{$parentDepartment['code']}{$parentDepartment['path']}";
        }
        $data = [
            'organization_code' => getCurrentOrganizationCode(),
            'code' => createUniqueCode('department'),
            'name' => $name,
            'pcode' => $parentDepartmentCode,
            'path' => $path,
            'create_time' => nowTime(),
        ];
        return self::create($data);
    }

    public function deleteDepartment($departmentCode)
    {
        $department = self::where(['code' => $departmentCode])->find();
        if (!$department) {
            throw new \Exception('该部门不存在', 1);
        }
        $prefix = config('database.prefix');
        $sql = "select code from {$prefix}department where find_in_set('{$departmentCode}',path)";
        $departments = Db::name('department')->query($sql);
        $codes = [$departmentCode];
        if ($departments) {
            foreach ($departments as $department) {
                $codes[] = $department['code'];
            }
        }
        $result = self::whereIn('code', $codes)->delete();
        DepartmentMember::whereIn('department_code', $codes)->delete();
        return $result;
    }
}
