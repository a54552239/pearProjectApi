<?php

namespace app\common\Model;


use think\Db;

/**
 * 任务成员
 * Class ProjectMember
 * @package app\common\Model
 */
class TaskMember extends CommonModel
{
    protected $append = [];

    /**
     * @param $memberCode
     * @param $taskCode
     * @param int $isExecutor
     * @param int $isOwner
     * @param bool $fromCreate
     * @param bool $isRobot 是否机器人
     * @return TaskMember|bool
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public static function inviteMember($memberCode, $taskCode, $isExecutor = 0, $isOwner = 0, $fromCreate = false, $isRobot = false)
    {
        !$memberCode && $memberCode = '';
        $task = Task::where(['code' => $taskCode, 'deleted' => 0])->find();
        if (!$task) {
            throw new \Exception('该任务已失效', 1);
        }
        $currentMember = getCurrentMember();
        $taskExecutor = self::where(['is_executor' => 1, 'task_code' => $taskCode])->find(); //原执行者
        if ($taskExecutor['member_code'] == $memberCode) {
            //已经是本人
            return true;
        }
        self::update(['is_executor' => 0], ['task_code' => $taskCode]);
        if ($memberCode) {
            $hasJoined = self::where(['member_code' => $memberCode, 'task_code' => $taskCode])->find();
            if ($hasJoined) {
                Task::update(['assign_to' => $memberCode], ['code' => $taskCode]);
                self::update(['is_executor' => 1], ['task_code' => $taskCode, 'member_code' => $memberCode]);
                $logType = 'assign';
                if ($memberCode == $currentMember['code']) {
                    $logType = 'claim';
                }
                Task::taskHook($currentMember['code'], $taskCode, $logType, $memberCode, 0, '', '', '', ['is_robot' => $isRobot]);
//            throw new \Exception('该成员已参与任务', 2);
                return true;
            }
        }
        if (!$memberCode) {
            //不指派执行人
            Task::update(['assign_to' => $memberCode], ['code' => $taskCode]);
            if (!$fromCreate) {
                if ($taskExecutor) {
                    Task::taskHook($currentMember['code'], $taskCode, 'removeExecutor', $taskExecutor['member_code'], 0, '', '', '', ['is_robot' => $isRobot]);
                }
            }
            return true;
        }
        $data = [
            'member_code' => $memberCode,
            'task_code' => $taskCode,
            'is_executor' => $isExecutor,
            'is_owner' => $isOwner,
            'join_time' => nowTime()
        ];
        //todo 添加任务动态
        $result = self::create($data);

        if ($isExecutor) {
            Task::update(['assign_to' => $memberCode], ['code' => $taskCode]);
            if ($memberCode == $currentMember['code']) {
                Task::taskHook($currentMember['code'], $taskCode, 'claim','',0, '', '', '', ['is_robot' => $isRobot]);
            } else {
                Task::taskHook($currentMember['code'], $taskCode, 'assign', $memberCode,0, '', '', '', ['is_robot' => $isRobot]);
            }
        }
        if ($memberCode) {
            $projectModel = new ProjectMember();
            $projectModel->inviteMember($memberCode, $task['project_code']);
        }
        return $result;
    }

    /**
     * 批量邀请成员
     * @param $memberCodes
     * @param $taskCode
     * @return bool
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public function inviteMemberBatch($memberCodes, $taskCode)
    {
        $currentMember = getCurrentMember();
        if (!$memberCodes) {
            return false;
        }
        $task = Task::where(['code' => $taskCode, 'deleted' => 0])->find();
        if (!$task) {
            throw new \Exception('该任务已失效', 1);
        }
        $isAll = false;
        if (in_array('all', $memberCodes)) {  //全部项目成员
            $memberCodes = ProjectMember::where(['project_code' => $task['project_code']])->column('member_code');
            $isAll = true;
        }
        if ($memberCodes) {
            Db::startTrans();
            try {
                $ownerCode = self::where(['is_owner' => 1, 'task_code' => $taskCode])->column('member_code');
                foreach ($memberCodes as $memberCode) {
                    if ($ownerCode == $memberCode) {
                        //创建者不能被移除
                        continue;
                    }
                    $hasJoined = self::where(['member_code' => $memberCode, 'task_code' => $taskCode])->find();
                    if ($hasJoined) {
                        if (!$isAll) {
                            if ($hasJoined['is_executor']) {
                                Task::update(['assign_to' => ''], ['code' => $taskCode]);
                                Task::taskHook($currentMember['code'], $taskCode, 'removeExecutor', $memberCode);
                            }
                            self::where(['task_code' => $taskCode, 'member_code' => $memberCode])->delete();
                            Task::taskHook($currentMember['code'], $taskCode, 'removeMember', $memberCode);
                        }
                    } else {
                        $data = [
                            'member_code' => $memberCode,
                            'task_code' => $taskCode,
                            'is_executor' => 0,
                            'join_time' => nowTime()
                        ];
                        self::create($data);
                        Task::taskHook($currentMember['code'], $taskCode, 'inviteMember', $memberCode);
                    }
                }
                Db::commit();
            } catch (\Exception $e) {
                Db::rollback();
                $this->error($e->getMessage(), $e->getCode());;
            }
        }
    }
}
