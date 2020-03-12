<?php

namespace app\common\Model;

use Exception;
use PDOStatement;
use service\JwtService;
use service\NodeService;
use service\RandomService;
use think\Db;
use think\db\exception\DataNotFoundException;
use think\db\exception\ModelNotFoundException;
use think\exception\DbException;
use think\exception\PDOException;
use think\File;
use think\Model;

class Member extends CommonModel
{

    protected $append = [];

    public static function login($member)
    {
        // 更新登录信息
        Db::name('Member')->where(['id' => $member['id']])->update([
            'last_login_time' => Db::raw('now()'),
        ]);

        $configModel = new SystemConfig();
        $config = $configModel->info();
        if ($config['single_mode'] && $config['single_org_code']) {
            $list = MemberAccount::where(['member_code' => $member['code'], 'organization_code' => $config['single_org_code']])->order('id asc')->select()->toArray();
            if (!$list) {
                MemberAccount::inviteMember($member['code'], $config['single_org_code']);
                $list = MemberAccount::where(['member_code' => $member['code'], 'organization_code' => $config['single_org_code']])->order('id asc')->select()->toArray();
            }
        } else {
            $list = MemberAccount::where(['member_code' => $member['code']])->order('id asc')->select()->toArray();
        }

        $organizationList = self::getOrgList($member['code'], true);
        if ($list) {
            foreach ($list as &$item) {
                $departments = [];
                $departmentCodes = $item['department_code'];
                if ($departmentCodes) {
                    $departmentCodes = explode(',', $departmentCodes);
                    foreach ($departmentCodes as $departmentCode) {
                        $department = Department::where(['code' => $departmentCode])->field('name')->find();
                        $departments[] = $department['name'];
                    }
                }
                $item['department'] = $departments ? implode(' - ', $departments) : '';
            }
        }
        $member['account_id'] = $list[0]['id'];
        $member['is_owner'] = $list[0]['is_owner'];
        $member['authorize'] = $list[0]['authorize'];
        $member['position'] = $list[0]['position'];
        $member['department'] = $list[0]['department'];

        setCurrentMember($member);
        !empty($member['authorize']) && NodeService::applyProjectAuthNode();
        $member = getCurrentMember();
        $tokenList = JwtService::initToken(['code' => $member['code']]);
        $accessTokenExp = JwtService::decodeToken($tokenList['accessToken'])->exp;
        $tokenList['accessTokenExp'] = $accessTokenExp;
        $loginInfo = ['member' => $member, 'tokenList' => $tokenList, 'organizationList' => $organizationList];
        session('loginInfo', $loginInfo);
        logRecord($loginInfo, 'info', 'member/login');
        return $loginInfo;
    }

    /**
     * 获取当前用户所在的组织
     * @param string $memberCode
     * @param bool $newest 是否取最新的值
     * @return array
     * @throws DataNotFoundException
     * @throws DbException
     * @throws ModelNotFoundException
     */
    public static function getOrgList(string $memberCode, $newest = false)
    {
        $organizationList = [];
        if (!$memberCode) {
            return $organizationList;
        }
        $cacheKey = 'member:orgList:' . $memberCode;
        if (!$newest) {
            $organizationList = cache($cacheKey);
            if ($organizationList) {
                return $organizationList;
            }
        }
        $list = MemberAccount::where(['member_code' => $memberCode])->order('id asc')->select()->toArray();
        if ($list) {
            $configModel = new SystemConfig();
            $config = $configModel->info();
            $single = false;
            if ($config['single_mode'] && $config['single_org_code']) {
                $single = true;
            }
            foreach ($list as $item) {
                $organization = Organization::where(['code' => $item['organization_code']])->find();
                if ($organization) {
                    if ($single) {
                        if ($item['organization_code'] == $config['single_org_code']) {
                            $organizationList[] = $organization;
                            break;
                        };
                    } else {
                        $organizationList[] = $organization;
                    }
                }
            }
            if (!$organizationList) {
                $organization = Organization::where(['code' => $config['single_org_code']])->find();
                MemberAccount::inviteMember($memberCode, $config['single_org_code']);
                $organizationList[] = $organization;
            }
        }
        cache($cacheKey, $organizationList, 3600 * 24);
        return $organizationList;
    }

    /**
     * @param $memberData
     * @return Member
     * @throws DataNotFoundException
     * @throws ModelNotFoundException
     * @throws DbException
     */
    public static function createMember($memberData)
    {
        //需要创建的信息。1、用户 2、用户所属组织 3、组织权限 4、所属组织账号
        $memberData['create_time'] = nowTime();
        (!isset($memberData['avatar']) || !$memberData['avatar']) && $memberData['avatar'] = 'https://static.vilson.online/cover.png';
        !isset($memberData['status']) && $memberData['status'] = 1;
        !isset($memberData['code']) && $memberData['code'] = createUniqueCode('member');
        !isset($memberData['account']) && $memberData['account'] = RandomService::alnumLowercase();
        if (isset($memberData['mobile']) && $memberData['mobile']) {
            $has = self::where(['mobile' => $memberData['mobile']])->find();
            if ($has) {
                unset($memberData['mobile']);
            }
        }
        if (isset($memberData['email']) && $memberData['email']) {
            $has = self::where(['email' => $memberData['email']])->find();
            if ($has) {
                unset($memberData['email']);
            }
        }
        $result = self::create($memberData);
        Organization::createOrganization($result);

        $configModel = new SystemConfig();
        $config = $configModel->info();
        if ($config['single_mode'] && $config['single_org_code']) {
            MemberAccount::inviteMember($result['code'], $config['single_org_code']);
        }
        return $result;
    }

    /**
     * 钉钉登录
     * @param $userInfo
     * @return Member|array|PDOStatement|string|Model|null
     * @throws DataNotFoundException
     * @throws ModelNotFoundException
     * @throws DbException
     */
    public static function dingtalkLogin($userInfo)
    {
        $currentMember = getCurrentMember();
        if ($currentMember) {
            $where = ['code' => $currentMember['code']];
            $currentMember = self::where($where)->find();
        }
        $unionid = $userInfo['unionid'];
        $openid = $userInfo['openid'];
        $member = self::where(['dingtalk_unionid' => $unionid])->find();
        $memberData = [
            'dingtalk_openid' => $openid,
            'dingtalk_unionid' => $unionid,
            'dingtalk_userid' => isset($userInfo['userId']) ? $userInfo['userId'] : '',
        ];
        if (!$member) {
            $memberData['name'] = $userInfo['nick'];
            $memberData['avatar'] = isset($userInfo['avatar']) ? $userInfo['avatar'] : '';
            $memberData['mobile'] = isset($userInfo['mobile']) ? $userInfo['mobile'] : '';
            $memberData['email'] = isset($userInfo['email']) ? $userInfo['email'] : '';
            if (!$currentMember) {
                $member = self::createMember($memberData);
            } else {
                //已登录且未绑定，则绑定
                if (!$currentMember['dingtalk_unionid'] || !$currentMember['dingtalk_userid']) {
                    if ($currentMember['mobile']) {
                        unset($memberData['mobile']);
                    } else {
                        $has = self::where(['mobile' => $memberData['mobile']])->find();
                        if ($has) {
                            return error('1', '您想要绑定的手机号码已经被绑定给其他帐号，请先用该手机号码登录后进行重置，再切回当前帐号发起绑定');
                        }
                    }
                    if ($currentMember['email']) {
                        unset($memberData['email']);
                    } else {
                        $has = self::where(['email' => $memberData['email']])->find();
                        if ($has) {
                            return error('1', '您想要绑定的邮箱已经被绑定给其他帐号，请先用该邮箱登录后进行重置，再切回当前帐号发起绑定');
                        }
                    }
                    self::update($memberData, $where);
                    $member = self::where($where)->find();
                }
            }
        } else {
            if ($currentMember && $member['dingtalk_unionid'] != $currentMember['dingtalk_unionid']) {
                return error('1', '您想要绑定的第三方帐号已经被绑定给其他帐号，请先用该第三方帐号登录后，解绑释放它，再切回当前帐号发起绑定');
            }
            if (!$member['dingtalk_userid']) {
                self::update($memberData, ['code' => $member['code']]);
            }
        }
        self::login($member);
        return $member;
    }

    public static function logout()
    {
        !empty($_SESSION) && $_SESSION = [];
        [session_unset(), session_destroy()];
        setCurrentMember(null);
        session('loginInfo', null);
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
}
