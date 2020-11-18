<?php

namespace app\common\Model;


use Exception;
use think\db\exception\DataNotFoundException;
use think\db\exception\ModelNotFoundException;
use think\exception\DbException;

/**
 * 日程成员
 * Class EventsMember
 * @package app\common\Model
 */
class EventsMember extends CommonModel
{
    protected $append = ['memberInfo'];

    /**
     * @param $memberCode
     * @param $eventCode
     * @param int $isOwner
     * @param int $status
     * @return EventsMember|array|bool
     * @throws DataNotFoundException
     * @throws DbException
     * @throws ModelNotFoundException
     */
    public static function inviteMember($memberCode, $eventCode, $isOwner = 0, $status = 0)
    {
        $event = Events::where(['code' => $eventCode, 'deleted' => 0])->find();
        if (!$event) {
            return error(4, '该日程已失效');
        }
        $hasJoined = self::where(['member_code' => $memberCode, 'events_code' => $eventCode])->find();
        if ($hasJoined) {
            return error(4, '该成员已加入日程');
        }
        $data = [
            'member_code' => $memberCode,
            'events_code' => $eventCode,
            'project_code' => $event->project_code,
            'is_owner' => $isOwner,
            'status' => $isOwner ? 1 : $status,
            'join_time' => nowTime()
        ];
        $result = self::create($data);
        Events::eventsHook(getCurrentMember()['code'], $eventCode, 'inviteMember', '', '', ['memberCode' => $memberCode]);
        return $result;
    }

    public static function removeMember($memberCode, $eventCode)
    {
        $event = Events::where(['code' => $eventCode, 'deleted' => 0])->find();
        if (!$event) {
            return error(4, '该日程已失效');
        }
        $hasJoined = self::where(['member_code' => $memberCode, 'events_code' => $eventCode])->find();
        if (!$hasJoined) {
            return error(4, '该成员尚未加入日程');
        }
        if ($hasJoined['is_owner']) {
            return error(4, '不能移除创建者');
        }
        $result = $hasJoined->delete();
        Events::eventsHook(getCurrentMember()['code'], $eventCode, 'removeMember', '', '', ['memberCode' => $memberCode]);
        return $result;
    }

    public static function confirmJoin($memberCode, $eventCode, $status)
    {
        $event = Events::where(['code' => $eventCode, 'deleted' => 0])->find();
        if (!$event) {
            return error(4, '该日程已失效');
        }
        $hasJoined = self::where(['member_code' => $memberCode, 'events_code' => $eventCode])->find();
        if (!$hasJoined) {
            return error(4, '尚未加入日程');
        }
        $result = self::where(['member_code' => $memberCode, 'events_code' => $eventCode])->update(['status' => $status, 'confirm_time' => nowTime()]);
        if ($status == 1) {
            $type = 'agreeJoin';
        } else {
            $type = 'refuseJoin';
        }
        Events::eventsHook(getCurrentMember()['code'], $eventCode, $type, '', '', ['memberCode' => $memberCode]);
        return $result;
    }

    public function getMemberInfoAttr($value, $data)
    {
        if (empty($data['member_code'])) {
            $data['member_code'] = 0;
        }
        return Member::where('code', $data['member_code'])->field('name,avatar')->find();
    }
}
