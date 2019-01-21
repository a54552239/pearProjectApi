<?php

namespace app\common\Model;


use service\DateService;

/**
 * 邀请链接
 * Class TaskStar
 * @package app\common\Model
 */
class InviteLink extends CommonModel
{
    protected $append = [];

    /**
     * @param $inviteType
     * @param $sourceCode
     * @param $linkType
     * @param $linkCode
     * @param int $sort
     * @return InviteLink
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public static function createInvite($inviteType, $sourceCode)
    {
        $memberCode = getCurrentMember()['code'];
        $inviteLink = self::where(['invite_type' => $inviteType, 'source_code' => $sourceCode, 'create_by' => $memberCode])->find();
        if ($inviteLink && nowTime() >= $inviteLink['over_time']) {
            $inviteLink->delete();
        }
        $source = $link = null;
        switch ($inviteType) {
            case 'project':
                $source = Project::where(['code' => $sourceCode])->find();
                break;
            case 'organization':
                $source = Organization::where(['code' => $sourceCode])->find();
        }
        if (!$source) {
            throw new \Exception('该资源不存在', 1);
        }
        if (!$inviteLink) {
            $fileData = [
                'code' => createUniqueCode('inviteLink'),
                'create_by' => $memberCode,
                'invite_type' => $inviteType,
                'source_code' => $sourceCode,
                'create_time' => nowTime(),
                'over_time' => Date('Y-m-d H:i:s', strtotime(nowTime()) + 3600 * 24),
            ];
            $result = self::create($fileData);
        }else{
            $result = $inviteLink;
        }
        return $result;
    }

    public static function getInviteDetail($linkCode)
    {
        $link = self::where(['code' => $linkCode])->find();
        $linkDetail = null;
        switch ($link['invite_type']) {
            case 'project':
                $link['name'] = '';
                $linkDetail = Project::where(['code' => $link['source_code']])->field('id', true)->find();
                if ($linkDetail) {
                    $link['name'] = $linkDetail['name'];
                }
                break;
            case 'organization':
                $link['name'] = '';
                $linkDetail = Organization::where(['code' => $link['source_code']])->field('id', true)->find();
                if ($linkDetail) {
                    $link['name'] = $linkDetail['name'];
                }
        }
        $link['member'] = Member::where(['code' => $link['create_by']])->field('id', true)->find();
        $link['sourceDetail'] = $linkDetail;
        return $link;
    }

}
