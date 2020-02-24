<?php

namespace app\project\controller;

use app\common\Model\CommonModel;
use app\common\Model\Member;
use app\common\Model\MemberAccount;
use app\common\Model\Notify;
use app\common\Model\ProjectCollection;
use app\common\Model\ProjectLog;
use app\common\Model\ProjectMember;
use app\common\Model\ProjectReport;
use app\common\Model\SystemConfig;
use controller\BasicApi;
use OSS\Core\OssException;
use service\DateService;
use service\FileService;
use service\NodeService;
use service\RandomService;
use think\Db;
use think\db\exception\DataNotFoundException;
use think\db\exception\ModelNotFoundException;
use think\Exception;
use think\Exception\DbException;
use think\exception\PDOException;
use think\facade\Request;
use think\File;

/**
 */
class Project extends BasicApi
{
    public function __construct()
    {
        parent::__construct();
        if (!$this->model) {
            $this->model = new \app\common\Model\Project();
        }
    }

    /**
     * 显示资源列表
     *
     * @return void
     * @throws DbException
     */
    public function index()
    {
        $prefix = config('database.prefix');
        $type = Request::post('type');
        $page = Request::param('page', 1);
        $pageSize = Request::param('pageSize', cookie('pageSize'));
        $data = Request::only('recycle,archive,all');
        $currentMember = getCurrentMember();
        $memberCode = $currentMember['code'];

        $orgCode = getCurrentOrganizationCode();
        if ($type == 'my' || $type == 'other') {
            $sql = "select * from {$prefix}project as pp left join {$prefix}project_member as pm on pm.project_code = pp.code where pp.organization_code = '{$orgCode}' and (pm.member_code = '{$memberCode}' or pp.private = 0)";
        } else {
            $sql = "select * from {$prefix}project as pp left  join {$prefix}project_collection as pc on pc.project_code = pp.code where pp.organization_code = '{$orgCode}' and pc.member_code = '{$memberCode}'";
        }
        if ($type != 'other') {
            $sql .= " and pp.deleted = 0";
        }
        if (isset($data['archive'])) {
            $sql .= " and pp.archive = 1";
        }
        if (isset($data['recycle'])) {
            $sql .= " and pp.deleted = 1";
        }
        $sql .= " group by pp.`code` order by pp.id desc";
        $list = CommonModel::limitByQuery($sql, $page, $pageSize);
        $newList = [];
        if ($list['list']) {
            foreach ($list['list'] as $key => &$item) {
                $item['collected'] = 0;
                $item['owner_name'] = '-';
                $collected = ProjectCollection::where(['project_code' => $item['code'], 'member_code' => $currentMember['code']])->field('id')->find();
                if ($collected) {
                    $item['collected'] = 1;
                }

                $owner = ProjectMember::where(['project_code' => $item['code'], 'is_owner' => 1])->field('member_code')->find();
                if (!$owner) {
                    continue;
                }
                $member = Member::where(['code' => $owner['member_code']])->field('name')->find();
                if (!$member) {
                    continue;
                }
                $item['owner_name'] = $member['name'];
                $newList[] = $item;
            }
        }
        $this->success('', ['list' => $newList, 'total' => count($newList)]);
    }

    public function analysis(Request $request)
    {
        $organizationCode = getCurrentOrganizationCode();
        $projectList = [];
        $monthNum = date('m', time());
        $monthList = DateService::lastCurrentMonth($monthNum);
        $monthList = array_reverse($monthList);
        foreach ($monthList as $key => $mounth) {
            if ($key < $monthNum - 1) {
                $num = \app\common\Model\Project::where('create_time', 'between', [date('Y-m-d H:i:s', $mounth['current_date']), date('Y-m-d H:i:s', $monthList[$key + 1]['current_date'])])->where(['deleted' => 0])->where(['organization_code' => $organizationCode])->count('id');
            } else {
                $num = \app\common\Model\Project::where('create_time', '>=', date('Y-m-d H:i:s', $mounth['current_date']))->where(['deleted' => 0])->where(['organization_code' => $organizationCode])->count('id');
            }
            $projectList[] = [
                '日期' => date('m', $mounth['current_date']) . '月',
                '数量' => $num,
            ];
        }
        $projectAll = \app\common\Model\Project::where(['deleted' => 0])->where(['organization_code' => $organizationCode])->select();
        $projectCount = count($projectAll);
        $projectSchedule = 0;
        $scheduleAll = 0;
        if ($projectAll) {
            foreach ($projectAll as $item) {
                $scheduleAll += $item['schedule'];
            }
        }
        if ($projectCount) {
            $projectSchedule = round($scheduleAll / ($projectCount * 100), 2);
        }
        $taskList = [];
        $currentMonth = DateService::lastCurrentMonth();
        $currentMonthBegin = $currentMonth[0]['current_date'];
        $today = date('d', time());
        $month = date('m', time());
        for ($i = 0; $i < $today; $i++) {
            $dayBegin = date('Y-m-d H:i:s', $currentMonthBegin + $i * DateService::DAY);
            $dayEnd = date('Y-m-d H:i:s', $currentMonthBegin + ($i + 1) * DateService::DAY);
            $taskList[] = [
                '日期' => $month . '月' . ($i + 1) . '日',
                '任务' => \app\common\Model\Task::alias('t')->leftJoin('project p', 't.project_code = p.code')->where('t.create_time', 'between', [$dayBegin, $dayEnd])->where(['t.deleted' => 0])->where(['p.organization_code' => $organizationCode])->count('t.id'),
            ];
        }

        $taskAll = \app\common\Model\Task::alias('t')->leftJoin('project p', 't.project_code = p.code')->where(['p.organization_code' => $organizationCode])->where(['t.deleted' => 0])->field('t.done,t.end_time,t.code')->select();
        $taskCount = count($taskAll);
        $taskOverdueCount = 0;
        $now = nowTime();
        foreach ($taskAll as $item) {
            if ($item['end_time']) {
                if (!$item['done']) {
                    $item['end_time'] < $now && $taskOverdueCount++;
                } else {
                    $log = ProjectLog::where(['action_type' => 'task', 'source_code' => $item['code'], 'type' => 'done'])->order('id desc')->find();
                    if ($log && $log['create_time'] > $item['end_time']) {
                        $taskOverdueCount++;
                    }
                }
            }
        }
        $taskOverduePercent = 0;
        if ($taskCount) {
            $taskOverduePercent = round($taskOverdueCount / $taskCount, 2) * 100;
        }
        $this->success('', compact('projectList', 'projectCount', 'projectSchedule', 'taskList', 'taskCount', 'taskOverdueCount', 'taskOverduePercent'));


    }

    /**
     * 获取自己的项目
     * @throws DataNotFoundException
     * @throws ModelNotFoundException
     * @throws DbException
     */
    public function selfList()
    {
        $type = Request::post('type', 0);
        $archive = Request::param('archive', 0);
        $delete = Request::param('delete');
        $organizationCode = Request::param('organizationCode', '');
        $memberCode = Request::post('memberCode', '');
        if (!$memberCode) {
            $member = getCurrentMember();
        } else {
            $member = Member::where(['code' => $memberCode])->find();
        }
        if (!$member) {
            $this->error("参数有误");
        }
        $deleted = $delete === null ? 1 : $delete;
        if (!$type) {
            $deleted = 0;
        }
        $list = $this->model->getMemberProjects($member['code'], $organizationCode ?? getCurrentOrganizationCode(), $deleted, $archive, Request::post('page'), Request::post('pageSize'));
        if ($list['list']) {
            foreach ($list['list'] as $key => &$item) {
                $item['owner_name'] = '-';
                if (isset($item['project_code'])) {
                    $item['code'] = $item['project_code'];
                    $item = $this->model->where(['code' => $item['code']])->find();
                }
                $collected = ProjectCollection::where(['project_code' => $item['code'], 'member_code' => getCurrentMember()['code']])->field('id')->find();
                $item['collected'] = $collected ? 1 : 0;
                $owner = ProjectMember::alias('pm')->leftJoin('member m', 'pm.member_code = m.code')->where(['pm.project_code' => $item['code'], 'is_owner' => 1])->field('member_code,name')->find();
                $item['owner_name'] = $owner['name'];
            }
            unset($item);
        }
        $this->success('', $list);
    }

    /**
     * 新增
     *
     * @param Request $request
     * @return void
     * @throws \Exception
     */
    public function save(Request $request)
    {
        $data = $request::only('name,description,templateCode');
        if (!$request::post('name')) {
            $this->error("请填写项目名称");
        }
        $data['organization_code'] = getCurrentOrganizationCode();
        $member = getCurrentMember();
        try {
            $result = $this->model->createProject($member['code'], $data['organization_code'], $data['name'], $data['description'], $data['templateCode']);
        } catch (\Exception $e) {
            $this->error($e->getMessage(), $e->getCode());;
        }
        if ($result) {
            $this->success('', $result);
        }
        $this->error("操作失败，请稍候再试！");
    }

    /**
     * 获取信息
     *
     * @param Request $request
     * @return void
     * @throws DbException
     */
    public function read(Request $request)
    {
        $project = $this->model->where(['code' => $request::post('projectCode')])->field('id', true)->find();
        if (!$project) {
            $this->notFound();
        }
        $project['collected'] = 0;
        $collected = ProjectCollection::where(['project_code' => $project['code'], 'member_code' => getCurrentMember()['code']])->field('id')->find();
        if ($collected) {
            $project['collected'] = 1;
        }
        $item['owner_name'] = '';
        $item['owner_avatar'] = '';
        $owner = ProjectMember::where(['project_code' => $project['code'], 'is_owner' => 1])->field('member_code')->find();
        if ($owner) {
            $member = Member::where(['code' => $owner['member_code']])->field('name,avatar')->find();
            if ($member) {
                $project['owner_name'] = $member['name'];
                $project['owner_avatar'] = $member['avatar'];
            }
        }
        $this->success('', $project);
    }

    /**
     * 保存
     *
     * @param Request $request
     * @return void
     * @throws \Exception
     */
    public function edit(Request $request)
    {
        $data = $request::only('name,description,cover,private,prefix,open_prefix,schedule,open_begin_time,open_task_private,task_board_theme,begin_time,end_time,auto_update_schedule');
        $code = $request::param('projectCode');
        try {
            $result = $this->model->edit($code, $data);
        } catch (\Exception $e) {
            $this->error($e->getMessage(), $e->getCode());;

        }
        if ($result) {
            $this->success();
        }
        $this->error("操作失败，请稍候再试！");
    }

    /**
     * 相关的项目动态
     */
    public function getLogBySelfProject()
    {
        $projectCode = Request::param('projectCode', '');
        $orgCode = getCurrentOrganizationCode();
        $member = getCurrentMember();
        $memberCode = $member['code'];
        if (!$member) {
            $this->success('', []);
        }
        $prefix = config('database.prefix');
        if (!$projectCode) {
            $where = [];
            $where[] = ['member_code', '=', $member['code']];
            $projectCodes = ProjectMember::where($where)->column('project_code');
            $sql = "select pp.code from {$prefix}project as pp join {$prefix}project_member as pm on pm.project_code = pp.code where pp.organization_code = '{$orgCode}' and (pm.member_code = '{$memberCode}') and pp.deleted = 0 group by pp.`code`";
            $projectCodes = Db::query($sql);
            if (!$projectCodes) {
                $this->success('', []);
            }
            foreach ($projectCodes as &$projectCode) {
                $projectCode = $projectCode['code'];
                $projectCode = "'{$projectCode}'";
            }
            $projectCodes = implode(',', $projectCodes);
            $sql = "select tl.remark as remark,tl.content as content,tl.is_comment as is_comment,tl.create_time as create_time,p.name as project_name,t.name as task_name,t.code as source_code,p.code as project_code,m.avatar as member_avatar,m.name as member_name from {$prefix}project_log as tl join {$prefix}task as t on tl.source_code = t.code join {$prefix}project as p on t.project_code = p.code join {$prefix}member as m on tl.member_code = m.code where tl.action_type = 'task' and p.code in ({$projectCodes}) and p.deleted = 0 order by tl.id desc limit 0,20";
//        $sql = "select tl.remark as remark,tl.content as content,tl.is_comment as is_comment,tl.create_time as create_time,p.name as project_name,p.code as project_code,m.avatar as member_avatar,m.name as member_name from {$prefix}project_log as tl join {$prefix}project as p on tl.project_code = p.code join {$prefix}member as m on tl.member_code = m.code where p.code in ({$projectCodes}) and p.deleted = 0 order by tl.id desc limit 0,20";
            $list = Db::query($sql);
        } else {
            $page = Request::param('page');
            $pageSize = Request::param('pageSize');
            if ($page < 1) {
                $page = 1;
            }
            $offset = $pageSize * ($page - 1);
            $sql = "select tl.type as type,tl.action_type as action_type,tl.source_code as source_code,tl.remark as remark,tl.content as content,tl.is_comment as is_comment,tl.create_time as create_time,p.name as project_name,p.code as project_code,m.avatar as member_avatar,m.name as member_name from {$prefix}project_log as tl join {$prefix}project as p on tl.project_code = p.code join {$prefix}member as m on tl.member_code = m.code where p.code = '{$projectCode}' and p.deleted = 0 order by tl.id desc";
            $list = Db::query($sql);
            $total = count($list);
            $sql .= " limit {$offset},{$pageSize}";
            $list = Db::query($sql);
            if ($list) {
                foreach ($list as &$item) {
                    $item['sourceInfo'] = [];
                    switch ($item['action_type']) {
                        case 'task':
                            $item['sourceInfo'] = \app\common\Model\Task::where(['code' => $item['source_code']])->find();
                            break;
                        case 'project':
                            $item['sourceInfo'] = \app\common\Model\Project::where(['code' => $item['source_code']])->find();
                            break;
                    }
                }
            }
            $list = ['total' => $total, 'list' => $list];
        }
        $this->success('', $list);
    }

    /**
     * 项目情况统计
     */
    public function _setDayilyProejctReport()
    {
        logRecord(nowTime(), 'setDayilyProejctReportBegin');
        debug('begin');
        $result = ProjectReport::setDayilyProejctReport();
        debug('end');
        logRecord(debug('begin', 'end') * 1000 . 'ms', 'setDayilyProejctReportSuccess');
        echo 'success_at ' . nowTime();
    }

    public function _getProjectReport()
    {
        $projectCode = Request::param('projectCode');
        if (!$projectCode) {
            $this->error('项目已失效');
        }
        $data = ProjectReport::getReportByDay($projectCode, 10);
        $this->success('', $data);
    }

    /**
     * 概览报表
     * @throws DataNotFoundException
     * @throws DbException
     * @throws ModelNotFoundException
     */
    public
    function _projectStats()
    {
        $projectCode = Request::param('projectCode');
        if (!$projectCode) {
            $this->error('项目已失效');
        }
        $project = \app\common\Model\Project::where(['code' => $projectCode])->find();
        if (!$project) {
            $this->error('项目已失效');
        }
        $taskStats = [
            'total' => 0,
            'unDone' => 0,
            'done' => 0,
            'overdue' => 0,
            'toBeAssign' => 0,
            'expireToday' => 0,
            'doneOverdue' => 0,
        ];
//        $taskList = \app\common\Model\Task::where(['project_code' => $projectCode, 'deleted' => 0])->field('id,assign_to,done,end_time,create_time,code')->hidden(['childCount,hasUnDone,parentDone,hasComment,hasSource,canRead'])->select()->toArray();
        $taskList = Db::name('task')->where(['project_code' => $projectCode, 'deleted' => 0])->field('id,assign_to,done,end_time,create_time,code')->select();
        $taskStats['total'] = count($taskList);
        if ($taskList) {
            $today = date('Y-m-d 00:00:00', time());
            $tomorrow = date('Y-m-d 00:00:00', strtotime($today) + 3600 * 24);
            foreach ($taskList as $item) {
                !$item['assign_to'] && $taskStats['toBeAssign']++;
                $item['done'] && $taskStats['done']++;
                !$item['done'] && $taskStats['unDone']++;
                if ($item['end_time']) {
                    if (!$item['done']) {
                        $item['end_time'] < nowTime() && $taskStats['overdue']++;
                        if ($item['end_time'] >= $today && $item['end_time'] < $tomorrow) {
                            $taskStats['doneOverdue']++;
                        }
                    } else {
                        $log = ProjectLog::where(['action_type' => 'task', 'source_code' => $item['code'], 'type' => 'done'])->order('id desc')->find();
                        if ($log && $log['create_time'] > $item['end_time']) {
                            $taskStats['doneOverdue']++;
                        }
                    }
                }
            }
        }

        $this->success('', $taskStats);
    }

    /**
     * 上传封面
     */
    public
    function uploadCover()
    {
        try {
            $file = $this->model->uploadCover(Request::file('cover'));
        } catch (\Exception $e) {
            $this->error($e->getMessage(), $e->getCode());;
        }
        $this->success('', $file);
    }

    /**
     * 放入回收站
     */
    public
    function recycle()
    {
        try {
            $this->model->recycle(Request::post('projectCode'));
        } catch (\Exception $e) {
            $this->error($e->getMessage(), $e->getCode());;
        }
        $this->success('');
    }

    /**
     * 恢复
     */
    public
    function recovery()
    {
        try {
            $this->model->recovery(Request::post('projectCode'));
        } catch (\Exception $e) {
            $this->error($e->getMessage(), $e->getCode());;
        }
        $this->success('');
    }


    /**
     * 归档
     */
    public
    function archive()
    {
        try {
            $this->model->archive(Request::post('projectCode'));
        } catch (\Exception $e) {
            $this->error($e->getMessage(), $e->getCode());;
        }
        $this->success('');
    }

    /**
     * 恢复归档
     */
    public
    function recoveryArchive()
    {
        try {
            $this->model->recoveryArchive(Request::post('projectCode'));
        } catch (\Exception $e) {
            $this->error($e->getMessage(), $e->getCode());;
        }
        $this->success('');
    }

    /**
     * 退出项目
     */
    public
    function quit()
    {
        try {
            $this->model->quit(Request::post('projectCode'));
        } catch (\Exception $e) {
            $this->error($e->getMessage(), $e->getCode());;
        }
        $this->success('');
    }


}
