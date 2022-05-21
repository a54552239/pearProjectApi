<?php

namespace app\common\Model;

use think\Db;
use think\db\exception\DataNotFoundException;
use think\db\exception\ModelNotFoundException;
use think\Exception;
use think\exception\DbException;
use think\exception\PDOException;
use think\facade\Hook;

class Events extends CommonModel
{
    protected $pk = 'id';


    public function myList($projectCode, $memberCode = '', $page = 1, $pageSize = 10, $sortType = '', $sort = 'desc')
    {
        if ($page < 1) {
            $page = 1;
        }
        $offset = ($page - 1) * $pageSize;
        $limit = $pageSize;
        $prefix = config('database.prefix');
        $sql = "select *,p.id as id,p.name as name,p.code as code,p.create_time as create_time,p.end_time as end_time,p.qc,p.get_expected,p.plain_finish from {$prefix}events_member join {$prefix}project as p as pm on p.code = pm.project_code where pm.member_code = '{$memberCode}'";
        $sql .= "group by p.id ";
        if ($sortType) {
            $sql .= " order by {$sortType} {$sort} ";
        } else {
            $sql .= ' order by pc.id desc, p.id desc';
        }
        $total = Db::query($sql);
        $total = count($total);
        $sql .= " limit {$offset},{$limit}";
        $list = Db::query($sql);
    }

    /**
     * 创建日程
     * @param $projectCode
     * @param $title
     * @param $description
     * @param $position
     * @param $allDay
     * @param $organizationCode
     * @param $beginTime
     * @param $endTime
     * @return array
     * @throws DataNotFoundException
     * @throws DbException
     * @throws ModelNotFoundException
     */
    public function createData($projectCode, $title, $description, $position, $allDay, $organizationCode, $beginTime, $endTime, $createdBy)
    {
        if (!$title) {
            return error(1, '请填写日程名称');
        }

        $project = Project::where(['code' => $projectCode])->field('id')->find();
        if (!$project) {
            return error(3, '该日程已失效');
        }
        $data = [
            'create_time' => nowTime(),
            'code' => createUniqueCode('ProjectVersion'),
            'project_code' => $projectCode,
            'begin_time' => $beginTime,
            'end_time' => $endTime,
            'position' => $position,
            'all_day' => $allDay,
            'description' => $description,
            'organization_code' => $organizationCode,
            'created_by' => $createdBy,
            'title' => trim($title),
        ];
        return self::create($data)->toArray();
    }

    /**
     * 删除日程
     * @param $eventsCode
     * @return array|bool
     */
    public function deleteEvents($eventsCode)
    {
        if (!$eventsCode) {
            return error(1, '请选择一个日程');
        }
        self::eventsHook(getCurrentMember()['code'], $eventsCode, 'delete');
        self::update(['deleted' => 1, 'deleted_time' => nowTime()], ['code' => $eventsCode]);
        return true;
    }

    /**
     * 变动钩子
     * @param $memberCode
     * @param $eventsCode
     * @param string $type
     * @param string $remark
     * @param string $content
     * @param array $data
     * @param string $tag
     */
    public static function eventsHook($memberCode, $eventsCode, $type = 'create', $remark = '', $content = '', $data = [], $tag = 'events')
    {
        $data = ['memberCode' => $memberCode, 'eventsCode' => $eventsCode, 'remark' => $remark, 'type' => $type, 'content' => $content, 'data' => $data, 'tag' => $tag];
        Hook::listen($tag, $data);
    }
}
