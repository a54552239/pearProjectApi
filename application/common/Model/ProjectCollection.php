<?php

namespace app\common\Model;


/**
 * 项目收藏
 * Class ProjectMember
 * @package app\common\Model
 */
class ProjectCollection extends CommonModel
{
    protected $append = [];

    /**
     * @param $memberId
     * @param $projectId
     * @param string $type
     * @return ProjectCollection|bool
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public function collect($memberCode, $projectCode, $type = 'collect')
    {
        $project = Project::where(['code' => $projectCode, 'deleted' => 0])->find();
        if (!$project) {
            throw new \Exception('该项目已失效', 1);
        }
        $hasCollected = self::where(['member_code' => $memberCode, 'project_code' => $projectCode])->find();
        if ($type == 'collect') {
            if ($hasCollected) {
                throw new \Exception('该项目已收藏', 1);
            }
            $data = [
                'member_code' => $memberCode,
                'project_code' => $projectCode,
                'create_time' => nowTime()
            ];
            return self::create($data);
        } else {
            if (!$hasCollected) {
                throw new \Exception('尚未收藏该项目', 1);
            }
            return self::where(['member_code' => $memberCode, 'project_code' => $projectCode])->delete();
        }
    }
}
