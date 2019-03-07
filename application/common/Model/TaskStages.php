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
     * @return array|string|\think\Collection
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public function tasks($stageCode, $deleted = 0, $done = -1)
    {
        $where = ['stage_code' => $stageCode, 'pcode' => '', 'deleted' => $deleted];
        if ($done != -1) {
            $where['done'] = $done;
        }
        $list = Task::where($where)->order('sort asc,id asc')->field('id', true)->select();
        if ($list) {
            foreach ($list as &$task) {
                $task['executor'] = Member::where(['code' => $task['assign_to']])->field('name,avatar')->find();
            }
        }
        return $list;
    }

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
