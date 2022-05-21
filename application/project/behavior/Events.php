<?php

namespace app\project\behavior;


use app\common\Model\EventsLog;
use app\common\Model\Member;
use app\common\Model\Notify;
use service\MessageService;
use think\db\exception\DataNotFoundException;
use think\db\exception\ModelNotFoundException;
use think\exception\DbException;

class Events
{
    /**
     * 日程操作钩子
     * @param $data
     * @throws DataNotFoundException
     * @throws ModelNotFoundException
     * @throws DbException
     */
    public function run($data)
    {
        $logData = ['member_code' => $data['memberCode'], 'source_code' => $data['eventsCode'], 'remark' => $data['remark'], 'type' => $data['type'], 'content' => $data['content'], 'data' => $data['data'], 'create_time' => nowTime(), 'code' => createUniqueCode('eventsLog')];
        $events = \app\common\Model\Events::where(['code' => $data['eventsCode']])->find();
        $logData['project_code'] = $events['project_code'];
        $remark = '';
        $content = '';
        $notifyData = [
            'title' => '',
            'content' => '',
            'type' => 'message',
            'action' => 'events',
            'terminal' => 'project',
            'source_code' => $data['eventsCode'],
        ];

        $member = Member::where(['code' => $data['memberCode']])->find();
        $toMember = [];
        if (isset($data['data']['memberCode'])) {
            $toMember = Member::where(['code' => $data['data']['memberCode']])->find();
        }
        switch ($data['type']) {
            case 'create':
                $icon = 'plus';
                $remark = '创建了日程 ';
                $content = $events['title'];
                break;
            case 'title':
                $icon = 'edit';
                $remark = '更新了日程名 ';
                $content = $events['title'];
                break;
            case 'content':
                $icon = 'file-text';
                $remark = '更新了备注 ';
                $content = $events['description'];
                break;
            case 'clearContent':
                $icon = 'file-text';
                $remark = '清空了备注 ';
                break;
            case 'setBeginTime':
                $icon = 'calendar';
                $remark = '更新开始时间为 ' . date('m月d日 H:i', strtotime($events['begin_time']));
                break;
            case 'clearBeginTime':
                $icon = 'calendar';
                $remark = '清除了开始时间 ';
                break;
            case 'setEndTime':
                $icon = 'calendar';
                $remark = '更新截止时间为 ' . date('m月d日 H:i', strtotime($events['end_time']));
                break;
            case 'clearEndTime':
                $icon = 'calendar';
                $remark = '清除了截止时间 ';
                break;
            case 'delete':
                $icon = 'delete';
                $remark = '删除了日程 ';
                break;
            case 'agreeJoin':
                $icon = 'user-add';
                $remark = $member['name'] . ' 确认加入日程';
                $content = $member['name'];
                break;
            case 'refuseJoin':
                $icon = 'user-add';
                $remark = $member['name'] . ' 拒绝加入日程';
                $content = $member['name'];
                break;
            case 'inviteMember':
                $icon = 'user-add';
                $remark = '将 ' . $toMember['name'] . ' 添加到日程';
                $content = $toMember['name'];
                $notifyData['title'] = "{$member['name']} 邀请你加入日程";
                $notifyData['content'] = $events['title'];
                break;
            case 'removeMember':
                $icon = 'user-delete';
                $remark = '将 ' . $toMember['name'] . ' 从日程中移出';
                $content = $toMember['name'];
                $notifyData['title'] = "{$member['name']} 将你从日程中移出";
                $notifyData['content'] = $events['title'];
                break;
            default:
                $icon = 'plus';
                $remark = ' 创建了日程 ';
                break;
        }
        $logData['icon'] = $icon;
        if (!$data['remark']) {
            $logData['remark'] = $remark;
        }
        if (!$data['content']) {
            $logData['content'] = $content;
        }
        EventsLog::create($logData);

        $notifyActions = ['inviteMember', 'removeMember'];
        $socketAction = $notifyData['action'];
        if (in_array($data['type'], $notifyActions)) {
            if ($toMember['code'] != $member['code']) {
                $messageService = new MessageService();
                $notifyModel = new Notify();
                $notifyData['avatar'] = $member['avatar'];
                $result = $notifyModel->add($notifyData['title'], $notifyData['content'], $notifyData['type'], $member['code'], $toMember['code'], $notifyData['action'], [], $notifyData['terminal'], $notifyData['avatar']);
                if (isOpenNoticePush()) {
                    $socketMessage = $socketGroupMessage = ['content' => $notifyData['content'], 'title' => $notifyData['title'], 'data' => ['organizationCode' => getCurrentOrganizationCode(), 'projectCode' => $events['project_code'], 'eventsCode' => $events['code']]];
                    $socketMessage['notify'] = $result;
                    $messageService->sendToUid($toMember['code'], $socketMessage, $socketAction);
                }
            }
        }
    }
}
