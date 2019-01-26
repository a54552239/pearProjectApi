<?php

namespace app\common\Model;


/**
 * 部门成员
 * Class ProjectMember
 * @package app\common\Model
 */
class DepartmentMember extends CommonModel
{
    protected $append = [];

    /**
     * @param $accountCode
     * @param string $departmentCode 部门code
     * @param int $isOwner 是否拥有者
     * @param int $isPrincipal 是否负责人
     * @return DepartmentMember|MemberAccount
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public function inviteMember($accountCode, $departmentCode = '', $isOwner = 0, $isPrincipal = 0)
    {
        $orgCode = getCurrentOrganizationCode();
        if ($departmentCode) {
            $department = Department::where(['code' => $departmentCode])->find();
            if (!$department) {
                throw new \Exception('该部门不存在', 1);
            }
            $hasJoined = self::where(['account_code' => $accountCode, 'department_code' => $departmentCode])->find();
            if ($hasJoined) {
                throw new \Exception('已加入该部门', 2);
            }
            $data = [
                'code' => createUniqueCode('departmentMember'),
                'account_code' => $accountCode,
                'organization_code' => $orgCode,
                'department_code' => $departmentCode,
                'is_owner' => $isOwner,
                'is_principal' => $isPrincipal,
                'join_time' => nowTime()
            ];
            $result = self::create($data);
            $department_codes = self::where(['account_code' => $accountCode, 'organization_code' => $orgCode])->column('department_code');
            if ($department_codes) {
                $department_codes = implode(',', $department_codes);
                MemberAccount::update(['department_code' => $department_codes], ['code' => $accountCode]);
            }
            return $result;
        } else {
            try {
                $result = MemberAccount::inviteMember($accountCode, $orgCode);
            } catch (\Exception $e) {
                throw new \Exception($e->getMessage(), 3);
            }
            return $result;
        }
    }

    /**
     * @param $accountCode
     * @param $departmentCode
     * @return bool
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public function removeMember($accountCode, $departmentCode)
    {
        $orgCode = getCurrentOrganizationCode();
        $department = Department::where(['code' => $departmentCode])->find();
        if (!$department) {
            throw new \Exception('该部门不存在', 1);
        }
        $hasJoined = self::where(['account_code' => $accountCode, 'department_code' => $departmentCode])->find();
        if (!$hasJoined) {
            throw new \Exception('尚未加入该部门', 2);
        }
        $result = $hasJoined->delete();
        $department_codes = self::where(['account_code' => $accountCode, 'organization_code' => $orgCode])->column('department_code');
        !$department_codes && $department_codes = [];
        $department_codes = implode(',', $department_codes);
        MemberAccount::update(['department_code' => $department_codes], ['code' => $accountCode]);
        return $result;
    }
}
