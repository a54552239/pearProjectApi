<?php

namespace app\common\Model;


use Exception;
use service\RandomService;
use think\db\exception\DataNotFoundException;
use think\db\exception\ModelNotFoundException;
use think\exception\DbException;

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
     * @throws DataNotFoundException
     * @throws ModelNotFoundException
     * @throws DbException
     */
    public function inviteMember($accountCode, $departmentCode = '', $isOwner = 0, $isPrincipal = 0)
    {
        $orgCode = getCurrentOrganizationCode();
        if ($departmentCode) {
            $department = Department::where(['code' => $departmentCode])->find();
            if (!$department) {
                throw new Exception('该部门不存在', 1);
            }
            $hasJoined = self::where(['account_code' => $accountCode, 'department_code' => $departmentCode])->find();
            if ($hasJoined) {
                throw new Exception('已加入该部门', 2);
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
            } catch (Exception $e) {
                throw new Exception($e->getMessage(), 3);
            }
            return $result;
        }
    }

    /**
     * @param $accountCode
     * @param $departmentCode
     * @return bool
     * @throws DataNotFoundException
     * @throws ModelNotFoundException
     * @throws DbException
     */
    public function removeMember($accountCode, $departmentCode)
    {
        $orgCode = getCurrentOrganizationCode();
        $department = Department::where(['code' => $departmentCode])->find();
        if (!$department) {
            throw new Exception('该部门不存在', 1);
        }
        $hasJoined = self::where(['account_code' => $accountCode, 'department_code' => $departmentCode])->find();
        if (!$hasJoined) {
            throw new Exception('尚未加入该部门', 2);
        }
        $result = $hasJoined->delete();
        $department_codes = self::where(['account_code' => $accountCode, 'organization_code' => $orgCode])->column('department_code');
        !$department_codes && $department_codes = [];
        $department_codes = implode(',', $department_codes);
        MemberAccount::update(['department_code' => $department_codes], ['code' => $accountCode]);
        return $result;
    }

    /**
     * 导入成员
     * @param \think\File $file
     * @return bool
     * @throws Exception
     */
    public function uploadFile(\think\File $file)
    {
        try {
            $data = importExcel($file->getInfo()['tmp_name']);
        } catch (Exception $e) {
            return error('201', $e->getMessage());
        }
        $count = 0;
        if ($data) {
            $organizationCode = getCurrentOrganizationCode();
            foreach ($data as $key => $item) {
                if ($key > 3) {
                    $name = trim($item['A']);
                    $email = trim($item['B']);
                    $departments = trim($item['C']);
                    $position = trim($item['D']);
                    $mobile = trim($item['E']);
                    $password = trim($item['F']);
                    $description = trim($item['G']);
                    if (!$name || !$email) {
                        continue;
                    }
                    $member = Member::where(['email' => $email])->find();
                    if (!$member) {
                        //注册新账号
                        $memberData = [
                            'email' => $email,
                            'name' => $name,
                            'account' => RandomService::alnumLowercase(),
                            'avatar' => 'https://static.vilson.online/cover.png',
                            'status' => 1,
                            'code' => createUniqueCode('member'),
                            'password' => $password ? md5($password) : '',
//                            'mobile' => $mobile,
                        ];
                        try {
                            $result = Member::createMember($memberData);
                        } catch (Exception $e) {
                            return error(1, $e->getMessage());
                        }
                        $member = Member::get($result->id);
                        $memberAccount = MemberAccount::inviteMember($member['code'], $organizationCode, $position, $mobile, '', $description);
                        if (!isError($memberAccount)) {
                            $count++;
                        }
                    } else {
                        $memberAccount = MemberAccount::where(['member_code' => $member['code'], 'organization_code' => $organizationCode])->find();
                    }
                    if ($departments) {
                        $departmentList = explode(';', $departments);
                        if ($departmentList) {
                            foreach ($departmentList as $departmentItems) {
                                $departmentNames = explode('/', $departmentItems);
                                if ($departmentNames) {
                                    $department = null;
                                    $pcode = '';
                                    foreach ($departmentNames as $key => $departmentName) {
                                        $department = Department::where(['name' => $departmentNames, 'pcode' => $pcode, 'organization_code' => $organizationCode])->find();
                                        if (!$department) {
                                            break;
                                        }
                                        $pcode = $department['code'];
                                    }
                                    if ($department) {
                                        try {
                                            $this->inviteMember($memberAccount['code'], $department['code']);
                                        } catch (Exception $e) {
                                            return error(2, $e->getMessage());
                                        }
                                    }
                                }
                            }
                        }
                    } else {
                        $this->inviteMember($memberAccount['code'], '');
                    }
                }

            }
        }
        return $count;
    }
}
