<?php

namespace app\project\controller;

use app\common\Model\EventsMember;
use app\common\Model\Member;
use app\common\Model\EventsLog;
use controller\BasicApi;
use think\db\exception\DataNotFoundException;
use think\db\exception\ModelNotFoundException;
use think\Exception;
use think\exception\DbException;
use think\exception\PDOException;
use think\facade\Request;

/**
 */
class Events extends BasicApi
{
    public function __construct()
    {
        parent::__construct();
        if (!$this->model) {
            $this->model = new \app\common\Model\Events();
        }
    }

    /**
     * 显示资源日程
     * @return void
     * @throws DataNotFoundException
     * @throws ModelNotFoundException
     * @throws DbException
     */
    public function index()
    {
        $where = [];
        $code = Request::post('projectCode');
        if ($code) {
            $where[] = ['project_code', '=', $code];
        }
        $where[] = ['deleted', '=', 0];
        $list = $this->model->_list($where);
//        $eventMember = new EventsMember();
//        $list = $eventMember->_list($where);
        if ($list['list']) {
            foreach ($list['list'] as &$item) {
                $item['memberList'] = [];
                $item['projectName'] = '';
                $members = EventsMember::where(['events_code' => $item['code']])->order('is_owner desc, status desc, id asc')->all();
                if ($members) {
                    $item['memberList'] = $members;
                }
                $project = \app\common\Model\Project::where('code', $item['project_code'])->field('name')->find();
                if ($project) {
                    $item['projectName'] = $project['name'];
                }
            }
        }
        $this->success('', $list);
    }

    public function myList()
    {
        $where = [];
        $code = Request::post('projectCode');
        if ($code) {
            $where[] = ['project_code', '=', $code];
        }
        $status = Request::post('status', -1);
        $where[] = ['deleted', '=', 0];
        $memberWhere = [['member_code', '=', getCurrentMember()['code']]];
        if ($status != -1) {
            $memberWhere[] = ['status', '=', $status];
        } else {
            $memberWhere[] = ['status', '<>', 2];
        }
        $memberCode = getCurrentMember()['code'];
        $eventCodes = EventsMember::where($memberWhere)->column('events_code');
        $where[] = ['code', 'in', $eventCodes];
        $list = $this->model->_list($where);
        if ($list['list']) {
            foreach ($list['list'] as &$item) {
                $item['memberList'] = [];
                $item['projectName'] = '';
                $item['waitConfirm'] = 1;
                $waitConfirm = EventsMember::where(['events_code' => $item['code'], 'member_code' => $memberCode, 'status' => 0])->find();
                if (!$waitConfirm) {
                    $item['waitConfirm'] = 0;
                }
                $members = EventsMember::where(['events_code' => $item['code']])->order('is_owner desc, status desc, id asc')->all();
                if ($members) {
                    $item['memberList'] = $members;
                }
                $project = \app\common\Model\Project::where('code', $item['project_code'])->field('name')->find();
                if ($project) {
                    $item['projectName'] = $project['name'];
                }
            }
        }
        $this->success('', $list);
    }

    public function confirmList()
    {
        $where = [];
        $code = Request::post('projectCode');
        if ($code) {
            $where[] = ['project_code', '=', $code];
        }
        $where[] = ['deleted', '=', 0];
        $eventCodes = EventsMember::where(['status' => 0, 'member_code' => getCurrentMember()['code']])->column('events_code');
        $where[] = ['code', 'in', $eventCodes];
        $list = $this->model->_list($where);
        if ($list['list']) {
            foreach ($list['list'] as &$item) {
                $item['memberList'] = [];
                $item['projectName'] = '';
                $members = EventsMember::where(['events_code' => $item['code']])->all();
                if ($members) {
                    $item['memberList'] = $members;
                }
                $project = \app\common\Model\Project::where('code', $item['project_code'])->field('name')->find();
                if ($project) {
                    $item['projectName'] = $project['name'];
                }
            }
        }
        $this->success('', $list);
    }

    /**
     * 新增
     * @param Request $request
     * @return void
     * @throws DataNotFoundException
     * @throws DbException
     * @throws ModelNotFoundException
     */
    public function save(Request $request)
    {
        $data = $request::only('project_code,title,description,begin_time,end_time,all_day,position');
        if (!$request::post('title')) {
            $this->error("请填写日程名称");
        }
        $result = $this->model->createData($data['project_code'], $data['title'], $data['description'], $data['position'], $data['all_day'], getCurrentOrganizationCode(), $data['begin_time'], $data['end_time'], getCurrentMember()['code']);
        if (!isError($result)) {
            \app\common\Model\Events::eventsHook(getCurrentMember()['code'], $result['code'], 'create');
            $memberList = $request::post('member_list', "");
            if ($memberList) {
                $memberCode = getCurrentMember()['code'];
                $memberList = json_decode($memberList, JSON_UNESCAPED_UNICODE);
                foreach ($memberList as $item) {
                    EventsMember::inviteMember($item, $result['code'], $item == $memberCode ? 1 : 0);
                }
            }

            $this->success('添加成功', $result);
        }
        $this->error($result['msg']);
    }

    /**
     * 保存
     * @param Request $request
     * @return void
     * @throws DataNotFoundException
     * @throws ModelNotFoundException
     * @throws DbException
     */
    public function edit(Request $request)
    {
        $data = $request::only('project_code,title,description,begin_time,end_time,all_day,position');
        $eventsCode = $request::param('code');
        if (isset($data['title']) && !$data['title']) {
            $this->error("请填写日程名称");
        }
        if (!$eventsCode) {
            $this->error("请选择一个日程");
        }
        $events = $this->model->where(['code' => $eventsCode])->field('id,project_code')->find();
        if (!$events) {
            $this->error("该日程已失效");
        }
        $result = $this->model->_edit($data, ['code' => $eventsCode]);
        if ($result) {
            $eventsMemberCodes = EventsMember::where(['events_code' => $eventsCode])->column('member_code');
            $memberList = $request::post('member_list', "");
            if ($memberList) {
                $memberCode = getCurrentMember()['code'];
                $memberList = json_decode($memberList, JSON_UNESCAPED_UNICODE);
                foreach ($memberList as $item) {
                    if (!in_array($item, $eventsMemberCodes)) {
                        EventsMember::inviteMember($item, $eventsCode, $item == $memberCode ? 1 : 0);
                    }
                }
            }
            if ($eventsMemberCodes) {
                foreach ($eventsMemberCodes as $item) {
                    if (!in_array($item, $memberList)) {
                        EventsMember::removeMember($item, $eventsCode);
                    }
                }
            }

            $member = getCurrentMember();
            $type = 'title';
            if (isset($data['title'])) {
                $type = 'title';
            }
            if (isset($data['description'])) {
                $type = 'content';
                if (!$data['description']) {
                    $type = 'clearContent';
                }
            }
            if (isset($data['begin_time'])) {
                $type = 'setBeginTime';
                if (!$data['begin_time']) {
                    $type = 'clearBeginTime';
                }
            }
            if (isset($data['end_time'])) {
                $type = 'setEndTime';
                if (!$data['end_time']) {
                    $type = 'clearEndTime';
                }
            }
            \app\common\Model\Events::eventsHook($member['code'], $eventsCode, $type);
            $this->success('');
        }
        $this->error("操作失败，请稍候再试！");
    }

    /**
     * 详情
     * @throws DataNotFoundException
     * @throws DbException
     * @throws ModelNotFoundException
     */
    public function read()
    {
        $code = Request::post('eventsCode');
        $events = $this->model->where(['code' => $code])->field('id', true)->find();
        if ($events) {
            $events['memberList'] = [];
            $members = EventsMember::where(['events_code' => $events['code']])->all();
            if ($members) {
                $events['memberList'] = $members;
            }
        }
        $this->success('', $events);
    }

    public function confirmJoin()
    {
        $eventsCode = Request::post('eventsCode');
        $status = Request::post('status');
        $memberCode = getCurrentMember()['code'];
        $result = EventsMember::confirmJoin($memberCode, $eventsCode, $status);
        if (isError($result)) {
            $this->error($result['msg'], $result['errno']);
        }
        $this->success();
    }

    public function removeMember()
    {
        $eventsCode = Request::post('eventsCode');
        $memberCode = Request::post('memberCode');
        $result = EventsMember::removeMember($memberCode, $eventsCode);
        if (isError($result)) {
            $this->error($result['msg'], $result['errno']);
        }
        $this->success();
    }

    public function inviteMember()
    {
        $eventsCode = Request::post('eventsCode');
        $memberCode = Request::post('memberCode');
        $result = EventsMember::inviteMember($memberCode, $eventsCode, 0);
        if (isError($result)) {
            $this->error($result['msg'], $result['errno']);
        }
        $this->success();
    }

    /**
     * 日程日志
     * @throws DataNotFoundException
     * @throws DbException
     * @throws ModelNotFoundException
     */
    public function _getEventsLog()
    {
        $code = Request::post('eventsCode');
        $showAll = Request::post('all', 0);
        $where = [];
        $where[] = ['source_code', '=', $code];
        $eventsModel = new EventsLog();
        if ($showAll) {
            $list = [];
            $list['list'] = $eventsModel->where($where)->order('id asc')->select()->toArray();
            $list['total'] = count($list['list']);
        } else {
            $list = $eventsModel->_list($where, 'id desc');
            if ($list['list']) {
                $list['list'] = array_reverse($list['list']);
            }
        }
        if ($list['list']) {
            foreach ($list['list'] as &$item) {
                $member = Member::where(['code' => $item['member_code']])->field('id,name,avatar,code')->find();
                !$member && $member = [];
                $item['member'] = $member;
            }
        }
        $this->success('', $list);
    }

    /**
     * 删除日程
     * @return void
     */
    public function delete()
    {
        $code = Request::post('eventsCode');
        if (!$code) {
            $this->error("请选择一个日程");
        }
        $result = $this->model->deleteEvents($code);
        if (isError($result)) {
            $this->error($result['msg'], $result['errno']);
        }
        $this->success();
    }
}
