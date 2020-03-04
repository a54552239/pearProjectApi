<?php

namespace app\common\Model;

use service\FileService;
use service\RandomService;
use think\File;

/**
 * 任务列表
 * Class Organization
 * @package app\common\Model
 */
class TaskStages extends CommonModel
{
    protected $append = [];

    /**
     * 任务列表下的任务
     * @param $stageCode
     * @param int $deleted
     * @param int $done
     * @param string $title
     * @param array $pri
     * @param array $executor
     * @param array $creator
     * @param array $joiner
     * @param array $endTime
     * @param array $beginTime
     * @param array $createTime
     * @param array $doneTime
     * @return array|string|\think\Collection
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public function tasks($stageCode, $deleted = 0, $done = -1, $title = '', $pri = [], $executor = [], $creator = [], $joiner = [], $status = [], $endTime = [], $beginTime = [], $createTime = [], $doneTime = [])
    {
        $where = ['pcode' => '', 'deleted' => $deleted];
        if ($done != -1) {
            $where['done'] = $done;
        }
        $taskModel = Task::alias('t')->where($where);
        if (is_array($stageCode)) {
            $taskModel = $taskModel->whereIn('t.stage_code', $stageCode);
        } else {
            $taskModel = $taskModel->where('t.stage_code', $stageCode);
        }
        if ($title) {
            $taskModel = $taskModel->whereLike('t.name', "%$title%");
        }
        if ($pri) {
            $taskModel = $taskModel->whereIn('t.pri', $pri);
        }
        if ($status) {
            $taskModel = $taskModel->whereIn('t.status', $status);
        }
        if ($endTime) {
            $taskModel = $taskModel->whereBetween('t.end_time', implode(',', $endTime));
        }
        if ($beginTime) {
            $taskModel = $taskModel->whereBetween('t.begin_time', implode(',', $beginTime));
        }
        if ($createTime) {
            $taskModel = $taskModel->whereBetween('t.create_time', implode(',', $createTime));
        }
        if ($doneTime) {
            $taskModel = $taskModel->leftJoin('project_log pl', 't.code = pl.source_code')->where(['pl.action_type' => 'task', 'pl.type' => 'done'])->whereBetween('pl.create_time', $doneTime);
        }
        //todo 查询范围问题
        $joinTaskMember = false;
        if ($executor) {
            $joinTaskMember = true;
            $taskModel = $taskModel->leftJoin('task_member tm', 't.code = tm.task_code')->whereIn('tm.member_code', $executor)->where('tm.is_executor', 1);
        }
        if ($creator) {
            !$joinTaskMember && $taskModel->leftJoin('task_member tm', 't.code = tm.task_code');
            $taskModel = $taskModel->whereIn('tm.member_code', $creator)->where('tm.is_owner', 1);
        }
        if ($joiner) {
            !$joinTaskMember && $taskModel->leftJoin('task_member tm', 't.code = tm.task_code');
            $taskModel = $taskModel->whereIn('tm.member_code', $joiner);
        }
        $list = $taskModel->order('t.sort asc,t.id asc')->field('id', true)->select();
        if ($list) {
            $taskMemberList = [];
            foreach ($list as &$task) {
                $assign_to = $task['assign_to'];
                $task['executor'] = null;
                if ($assign_to) {
                    if (isset($taskMemberList[$assign_to])) {
                        $task['executor'] = $taskMemberList[$assign_to];
                    } else {
                        $task['executor'] = Member::where(['code' => $task['assign_to']])->field('name,avatar')->find();
                        $taskMemberList[$assign_to] = $task['executor'];
                    }
                }
            }
        }
        return $list;
    }

    /*public function tasks($stageCode, $deleted = 0, $done = -1)
    {
        $where = ['stage_code' => $stageCode, 'pcode' => '', 'deleted' => $deleted];
        if ($done != -1) {
            $where['done'] = $done;
        }
        $cacheKey = 'taskStages:task:' . $stageCode;
        $list = cache($cacheKey);
        if ($list) {
            return $list;
        }
        $list = Task::where($where)->order('sort asc,id asc')->field('id', true)->select()->toArray();
        if ($list) {
            $taskMemberList = [];
            foreach ($list as &$task) {
                $assign_to = $task['assign_to'];
                $task['executor'] = null;
                if ($assign_to) {
                    if (isset($taskMemberList[$assign_to])) {
                        $task['executor'] = $taskMemberList[$assign_to];
                    }else{
                        $task['executor'] = Member::where(['code' => $task['assign_to']])->field('name,avatar')->find();
                        $taskMemberList[$assign_to] = $task['executor'];
                    }
                }
            }
        }
        cache($cacheKey, $list, 600);
        return $list;
    }*/

    /**
     * @param $name
     * @param $projectCode
     * @return array
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public function createStage($name, $projectCode)
    {
        if (!$name) {
            throw new \Exception('请填写列表名称', 1);
        }
        $project = Project::where(['code' => $projectCode, 'deleted' => 0])->field('id')->find();
        if (!$project) {
            throw new \Exception('该项目已失效', 3);
        }
        $data = [
            'create_time' => nowTime(),
            'code' => createUniqueCode('taskStages'),
            'project_code' => $projectCode,
            'name' => trim($name),
        ];
        $result = self::create($data)->toArray();
        self::update(['sort' => $result['id']], ['id' => $result['id']]);
        if ($result) {
            unset($result['id']);
            $result['tasksLoading'] = false; //任务加载状态
            $result['fixedCreator'] = false; //添加任务按钮定位
            $result['showTaskCard'] = false; //是否显示创建卡片
            $result['tasks'] = [];
        }
        //todo 添加项目动态
        return $result;
    }

    /**
     * 列表排序（交换两个列表的sort）
     * @param $preCode string 前一个移动的列表
     * @param $nextCode string 后一个移动的列表
     * @return bool
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public function sort($preCode, $nextCode)
    {
        $preStage = self::where(['code' => $preCode])->field('sort')->find();
        $nextStage = self::where(['code' => $nextCode])->field('sort')->find();
        if ($preCode == $nextCode) {
            return false;
        }
        if ($preStage !== false && $preStage !== false) {
            self::update(['sort' => $nextStage['sort']], ['code' => $preCode]);
            self::update(['sort' => $preStage['sort']], ['code' => $nextCode]);
            return true;
        }
        return false;
    }

    /**
     * 删除列表
     * @param $code
     * @return bool
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public function deleteStage($code)
    {
        $stage = self::where(['code' => $code])->field('id')->find();
        if (!$stage) {
            throw new \Exception('该列表不存在', 1);
        }
        $info = Task::where(['stage_code' => $code, 'deleted' => 0])->find();
        if ($info) {
            throw new \Exception('请先清空此列表上的任务，然后再删除这个列表', 2);
        }
        $result = self::destroy(['code' => $code]);
        if (!$result) {
            throw new \Exception('删除失败', 3);
        }
        return $result;
    }
}
