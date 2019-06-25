<?php

namespace app\common\Model;


/**
 * 项目成员
 * Class ProjectMember
 * @package app\common\Model
 */
class ProjectMember extends CommonModel
{
    protected $append = [];

    /**
     * @param $memberCode
     * @param $projectCode
     * @param int $isOwner
     * @return ProjectMember|bool
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public function inviteMember($memberCode, $projectCode, $isOwner = 0)
    {
        $project = Project::where(['code' => $projectCode, 'deleted' => 0])->find();
        if (!$project) {
            throw new \Exception('该项目已失效', 1);
        }
        $hasJoined = self::where(['member_code' => $memberCode, 'project_code' => $projectCode])->find();
        if ($hasJoined) {
//            throw new \Exception('该成员已加入项目', 1);
            return true;
        }
        $data = [
            'member_code' => $memberCode,
            'project_code' => $projectCode,
            'is_owner' => $isOwner,
            'join_time' => nowTime()
        ];
        $result = self::create($data);
        MemberAccount::inviteMember($memberCode, $project['organization_code']);
        Project::projectHook(getCurrentMember()['code'], $projectCode, 'inviteMember', $memberCode);
        return $result;
    }

    public function removeMember($memberCode, $projectCode)
    {
        $project = Project::where(['code' => $projectCode, 'deleted' => 0])->find();
        if (!$project) {
            throw new \Exception('该项目已失效', 1);
        }
        $hasJoined = self::where(['member_code' => $memberCode, 'project_code' => $projectCode])->find();
        if (!$hasJoined) {
//            throw new \Exception('该成员尚未加入项目', 1);
            return true;
        }
        $result = $hasJoined->delete();
        Project::projectHook(getCurrentMember()['code'], $projectCode, 'removeMember', $memberCode);
        return $result;
    }
}
