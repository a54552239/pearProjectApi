<?php

namespace app\common\Model;

use Exception;
use service\NodeService;
use think\Db;
use think\db\exception\DataNotFoundException;
use think\db\exception\ModelNotFoundException;
use think\exception\DbException;
use think\exception\PDOException;
use think\File;

class MemberAccount extends CommonModel
{

    protected $append = ['statusText', 'authorizeArr'];

    /**
     * 获取当前用户菜单
     * @throws DataNotFoundException
     * @throws ModelNotFoundException
     * @throws DbException
     */
    public static function getAuthMenuList()
    {
        NodeService::applyProjectAuthNode();
        $menuModel = new ProjectMenu();
        $list = $menuModel->listForUser();
        return $list;
    }

    /**
     * 邀请成员
     * @param $memberCode
     * @param $organizationCode
     * @param string $position
     * @param string $mobile
     * @param string $department
     * @param string $description
     * @return MemberAccount
     * @throws DataNotFoundException
     * @throws DbException
     * @throws ModelNotFoundException
     */
    public static function inviteMember($memberCode, $organizationCode, $position = '', $mobile = '', $department = '', $description = '')
    {
        $hasJoined = MemberAccount::where(['member_code' => $memberCode, 'organization_code' => $organizationCode])->find();
        if ($hasJoined) {
            return error(3, '已加入该组织');
        }
        $memberDate = Member::where(['code' => $memberCode])->find();
        if (!$memberDate) {
            return error(4, '该用户不存在');
        }
        $auth = ProjectAuth::where(['organization_code' => $organizationCode, 'is_default' => 1])->field('id')->find();
        $authId = '';
        if ($auth) {
            $authId = $auth['id'];//权限id
        }
        $data = [
            'position' => $position,
            'department' => $department ?? '某某公司－某某某事业群－某某平台部－某某技术部',
            'description' => $description ?? '',
            'code' => createUniqueCode('memberAccount'),
            'member_code' => $memberCode,
            'organization_code' => $organizationCode,
            'is_owner' => 0,
            'authorize' => $authId,
            'status' => 1,
            'create_time' => nowTime(),
            'name' => $memberDate['name'],
            'mobile' => $mobile,
            'email' => $memberDate['email'],
        ];
        $result = MemberAccount::create($data);
        $cacheKey = 'member:orgList:' . $memberCode;
        cache($cacheKey, null);
        return $result;
    }

    /**
     * @param File $file
     * @return array|bool
     * @throws \think\Exception
     * @throws PDOException
     * @throws Exception
     */
    public function uploadImg(File $file)
    {
        return $this->_uploadImg($file, config('upload.base_path') . config('upload.member_avatar'));
    }

    public function getAccountByOrganization($account, $organization_code)
    {
        return $this->where(['account' => $account, 'organization_code' => $organization_code])->find();
    }

    public function getAuthorizeArrAttr($value, $data)
    {
        //支持同时设置多个角色，默认关闭
        if ($data['authorize']) {
            return explode(',', $data['authorize']);
        }
        return [];
    }

    public function getStatusTextAttr($value, $data)
    {
        $status = [0 => '禁用', 1 => '使用中'];
        return $status[$data['status']];
    }

    /**
     * @param $accountCode
     * @return bool
     * @throws Exception
     */
    public function del($accountCode)
    {
        //todo 权限判断
        try {
            Db::startTrans();
            $memberAccount = self::where(['code' => $accountCode])->find()->toArray();
            self::destroy(['code' => $accountCode]);
            $projects = Project::where(['organization_code' => $memberAccount['organization_code']])->column('code');
            if ($projects) {
                ProjectMember::whereIn('project_code', $projects)->where(['member_code' => $memberAccount['member_code']])->delete();
                $orgCode = getCurrentOrganizationCode();
                DepartmentMember::where(['account_code' => $accountCode, 'organization_code' => $orgCode])->delete();
            }
            $cacheKey = 'member:orgList:' . $memberAccount['member_code'];
            cache($cacheKey, null);
            Db::commit();
        } catch (Exception $e) {
            Db::rollback();
            throw new Exception($e->getMessage(), 201);
        }
        return true;
    }
}
