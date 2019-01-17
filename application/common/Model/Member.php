<?php

namespace app\common\Model;

use think\Db;
use think\File;

class Member extends CommonModel
{

    protected $append = [];

    public function login($account)
    {
        if ($account == 'admin') {
            return [];
        }
        $where[] = ['account', '=', $account];
        return Db::name('member')->where($where)->find();
    }

    /**
     * @param $memberData
     * @return Member
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public static function createMember($memberData)
    {
        //需要创建的信息。1、用户 2、用户所属组织 3、组织权限 4、所属组织账号
        $memberData['create_time'] = nowTime();
        $result = self::create($memberData);


        Organization::createOrganization($result);
//        $organizationData = [
//            'code' => createUniqueCode('organization'),
//            'name' => $memberData['name'] . '的个人项目',
//            'personal' => 1,
//            'create_time' => nowTime(),
//            'owner_code' => $memberData['code'],
//        ];
//        Organization::create($organizationData);
//
//        $defaultAdminAuth = ProjectAuth::get(1)->toArray();
//        $defaultMemberAuth = ProjectAuth::get(2)->toArray();
//        unset($defaultAdminAuth['id']);
//        unset($defaultMemberAuth['id']);
//        $defaultAdminAuth['organization_code'] = $defaultMemberAuth['organization_code'] = $organizationData['code'];
//        $defaultAdminAuth = ProjectAuth::create($defaultAdminAuth);
//        $defaultMemberAuth = ProjectAuth::create($defaultMemberAuth);
//        $defaultAdminAuthNode = ProjectAuthNode::where(['auth' => 1])->select()->toArray();
//        $defaultMemberAuthNode = ProjectAuthNode::where(['auth' => 2])->select()->toArray();
//        foreach ($defaultAdminAuthNode as &$item) {
//            unset($item['id']);
//            $item['auth'] = $defaultAdminAuth['id'];
//            ProjectAuthNode::create($item);
//        }
//        foreach ($defaultMemberAuthNode as &$item) {
//            unset($item['id']);
//            $item['auth'] = $defaultMemberAuth['id'];
//            ProjectAuthNode::create($item);
//        }
//
//        $memberAccountData = [
//            'position' => '资深工程师',
//            'department' => '某某公司－某某某事业群－某某平台部－某某技术部－BM',
//            'code' => createUniqueCode('organization'),
//            'member_code' => $memberData['code'],
//            'organization_code' => $organizationData['code'],
//            'is_owner' => 1,
//            'status' => 1,
//            'create_time' => nowTime(),
//            'avatar' => $memberData['avatar'],
//            'name' => $memberData['name'],
//            'email' => $memberData['email'],
//        ];
//        MemberAccount::create($memberAccountData);
        return $result;
    }


    /**
     * @param File $file
     * @return array|bool
     * @throws \think\Exception
     * @throws \think\exception\PDOException
     * @throws \Exception
     */
    public function uploadImg(File $file)
    {
        return $this->_uploadImg($file, config('upload.base_path') . config('upload.member_avatar'));
    }
}
