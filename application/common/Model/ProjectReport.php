<?php

namespace app\common\Model;

use service\DateService;
use think\db\exception\DataNotFoundException;
use think\db\exception\ModelNotFoundException;
use think\exception\DbException;

/**
 * 项目报告
 * Class ProjectReport
 * @package app\common\Model
 */
class ProjectReport extends CommonModel
{
    protected $append = [];
    protected $json = ['content'];

    /**
     * 计算最近n天的数据
     * @param string $projectCode 项目code
     * @param int $day 近n天
     * @return array
     * @throws DataNotFoundException
     * @throws DbException
     * @throws ModelNotFoundException
     */
    public static function getReportByDay($projectCode, $day = 10)
    {
        $dateList = [];
        $taskList = [];
        $undoneTaskList = [];
        $baseLineList = [];
        $max = 0;
        for ($i = $day; $i >= 1; $i--) {
            $date = date('Y-m-d', mktime(0, 0, 0, date("m"), date("d") - $i, date("Y")));
            $dateFormat = date('m-d', strtotime($date));
            $dateList[] = $dateFormat;
            $report = ProjectReport::where(['project_code' => $projectCode, 'date' => $date])->find();
            if ($report) {
                $task = get_object_vars($report['content']);
                $taskList[] = $task['task'];
                $undoneTaskList[] = $task['task:undone'];
                if ($task['task:undone'] > $max) {
                    $max = $task['task:undone'];
                }
            }else{
                $taskList[] = 0;
                $undoneTaskList[] = 0;
            }
        }
        if ($max) {
            $each = round($max / ($day - 1), 1);
            $current = $max;
            for ($i = 1; $i <= $day; $i++) {
                ($current < 0 || $day == $i) && $current = 0;
                $baseLineList[] = $current;
                $current -= $each;
            }
        }
        return ['date' => $dateList, 'task' => $taskList, 'undoneTask' => $undoneTaskList, 'baseLineList' => $baseLineList];
    }

    public static function setDayilyProejctReport()
    {
        $day = date('Y-m-d', time());
        $taskList = Task::where(['deleted' => 0])->select()->toArray();
        if ($taskList) {
            $projectList = [];
            foreach ($taskList as $task) {
                $item = null;
                $projectCode = $task['project_code'];
                if (!isset($projectList[$projectCode])) {
                    $projectList[$projectCode] = [];
                }
                @$projectList[$projectCode]['task']++;
                if (!isset($projectList[$projectCode]['task:undone'])) {
                    $projectList[$projectCode]['task:undone'] = 0;
                }
                !$task['done'] && @$projectList[$projectCode]['task:undone']++;
            }
            if ($projectList) {
                foreach ($projectList as $key => $project) {
                    self::setData($key, $day, 'content', $project, true);
                }
            }
        }
        return true;
    }

    /**
     * 插入统计数据
     * @param string $projectCode 项目编号
     * @param string $date 日期 [2019-07-10]
     * @param string $key 键
     * @param string|array $values 值，值为null则移除该键值对
     * @param bool $isContent 是否存储多个content的键值对
     * @param bool $replace 是否覆盖content
     * @return bool
     * @throws DataNotFoundException
     * @throws DbException
     * @throws ModelNotFoundException
     */
    public static function setData($projectCode, $date, $key, $values, $isContent = false, $replace = false)
    {
        if (!DateService::checkDateIsValid($date, ['Y-m-d'])) {
            return error(1, '日期格式不正确');
        }
        $projet = Project::where(['code' => $projectCode])->field('id')->find();
        if (!$projet) {
            return error(2, '项目不存在');
        }
        $saveData = new \stdClass();
        $where = ['project_code' => $projectCode, 'date' => $date];
        $report = self::where($where)->find();
        if ($report) {
            $saveData->content = $report->content;
        } else {
            $report = new self();
            $saveData->project_code = $projectCode;
            $saveData->date = $date;
            $saveData->create_time = nowTime();
            $saveData->content = new \stdClass();
        }
        $saveData->update_time = nowTime();
        //值为null则移除该键值对
        if ($values === null) {
            unset($saveData->content->$key);
            return $report->save($saveData);
        }
        if ($isContent) {
            if ($replace) {
                //直接替换content
                $saveData->content = $values;
            } else {
                //遍历键值对，赋值到conetnt
                if (!is_array($values)) {
                    $saveData->content->$key = $values;
                } else {
                    foreach ($values as $keyItme => $value) {
                        //值为null则移除该键值对
                        if ($value === null) {
                            unset($saveData->content->$keyItme);
                            continue;
                        }
                        $saveData->content->$keyItme = $value;
                    }
                }
            }
        } else {
            //单个键值对
            $saveData->content->$key = $values;
        }
        return $report->save($saveData);
    }
}
