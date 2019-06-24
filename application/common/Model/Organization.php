<?php

namespace app\common\Model;

/**
 * 组织
 * Class Organization
 * @package app\common\Model
 */
class Organization extends CommonModel
{
    protected $append = [];

    /**
     * 创建组织
     * @param $memberData
     * @param array $data
     * @return Organization
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public static function createOrganization($memberData, $data = [])
    {
        $defaultAdminAuthId = 3;//默认管理员权限id
        $defaultMemberAuthId = 4;//默认成员权限id

        if (!isset($data['name'])) {
            $data['name'] = $memberData['name'] . '的个人项目';
        }
        $data['code'] = createUniqueCode('organization');
        $data['personal'] = 1;
        $data['create_time'] = nowTime();
        $data['owner_code'] = $memberData['code'];
        $organization = self::create($data);

        $defaultAdminAuth = ProjectAuth::get($defaultAdminAuthId)->toArray();
        $defaultMemberAuth = ProjectAuth::get($defaultMemberAuthId)->toArray();
        unset($defaultAdminAuth['id']);
        unset($defaultMemberAuth['id']);
        $defaultAdminAuth['organization_code'] = $defaultMemberAuth['organization_code'] = $data['code'];
        $defaultAdminAuth = ProjectAuth::create($defaultAdminAuth);
        $defaultMemberAuth = ProjectAuth::create($defaultMemberAuth);
        $defaultAdminAuthNode = ProjectAuthNode::where(['auth' => $defaultAdminAuthId])->select()->toArray();
        $defaultMemberAuthNode = ProjectAuthNode::where(['auth' => $defaultMemberAuthId])->select()->toArray();
        foreach ($defaultAdminAuthNode as &$item) {
            unset($item['id']);
            $item['auth'] = $defaultAdminAuth['id'];
            ProjectAuthNode::create($item);
        }
        foreach ($defaultMemberAuthNode as &$item) {
            unset($item['id']);
            $item['auth'] = $defaultMemberAuth['id'];
            ProjectAuthNode::create($item);
        }

        $memberAccountData = [
            'position' => '资深工程师',
            'department' => '某某公司－某某某事业群－某某平台部－某某技术部－BM',
            'code' => createUniqueCode('organization'),
            'member_code' => $memberData['code'],
            'organization_code' => $data['code'],
            'is_owner' => 1,
            'status' => 1,
            'create_time' => nowTime(),
            'avatar' => $memberData['avatar'],
            'name' => $memberData['name'],
            'email' => isset($memberData['email']) ? $memberData['email'] : '',
        ];
        MemberAccount::create($memberAccountData);
        return $organization;
    }


    public function edit($code, $data)
    {
        if (!$code) {
            throw new \Exception('请选择组织', 1);
        }
        $project = self::where(['code' => $code])->field('id', true)->find();
        if (!$project) {
            throw new \Exception('该组织不存在', 1);
        }
        $result = self::update($data, ['code' => $code]);
        return $result;
    }
}
