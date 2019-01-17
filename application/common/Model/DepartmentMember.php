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
     * @param string $departmentCode
     * @param int $isOwner
     * @param int $isPrincipal
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
            $hasJoined = MemberAccount::where(['member_code' => $accountCode, 'organization_code' => $orgCode])->find();
            if ($hasJoined) {
                throw new \Exception('已加入该组织', 3);
            }
            $memberDate = Member::where(['code' => $accountCode])->find();
            if (!$memberDate) {
                throw new \Exception('该用户不存在', 4);
            }
            $auth = ProjectAuth::where(['organization_code' => $orgCode, 'is_default' => 1])->field('id')->find();
            $authId = '';
            if ($auth) {
                $authId = $auth['id'];//权限id
            }
            $data = [
                'position' => '资深工程师',
                'department' => '某某公司－某某某事业群－某某平台部－某某技术部',
                'code' => createUniqueCode('memberAccount'),
                'member_code' => $accountCode,
                'organization_code' => $orgCode,
                'is_owner' => 0,
                'authorize' => $authId,
                'status' => 1,
                'create_time' => nowTime(),
                'name' => $memberDate['name'],
                'email' => $memberDate['email'],
            ];
            return MemberAccount::create($data);
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
        if ($department_codes) {
            $department_codes = implode(',', $department_codes);
            MemberAccount::update(['department_code' => $department_codes], ['code' => $accountCode]);
        }
        return $result;
    }
}
