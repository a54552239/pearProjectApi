<?php

namespace app\common\Model;

class Notify extends CommonModel
{

    /**
     * 按type类型格式化输出列表
     * @param $where
     * @param bool $size
     * @return array
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public function listTypeFormat($where, $size = false)
    {
        $types = ['notice', 'message', 'task'];
        $totalSum = [];
        $list = $this->where($where)->order('id desc')->select();
        $formatList = [];
        $total = $this->where($where)->count('id');
        if ($list) {
            foreach ($list as &$item) {
                foreach ($types as $type) {
                    !isset($formatList[$type]) and $formatList[$type] = [];
                    !isset($totalSum[$type]) and $totalSum[$type] = 0;
                    $sum = $this->where($where)->where(['type' => $type])->count('id');
                    $totalSum[$type] = $sum;
                    if ($size and count($formatList[$type]) >= $size) {
                        continue;
                    }
                    if ($item['type'] == $type) {
                        $item['from'] = $this->getReceiverByTerminal($item['terminal'], $item['from']);
                        $item['to'] = $this->getReceiverByTerminal($item['terminal'], $item['to']);
                        $formatList[$type][] = $item;
//                        $total++;
                    }
                }
            }
        }
        return ['list' => $formatList, 'total' => $total, 'totalSum' => $totalSum];
    }

    public function getReceiverByTerminal($terminal, $to)
    {
        if (!$to) {
            return false;
        }
        switch ($terminal) {
            case 'system':
                return [];
        }
    }

    public function getFromByType($fromType, $from)
    {
        if (!$from) {
            return false;
        }
        switch ($fromType) {
            case 'project': //消息
                return MemberAccount::find($from);
        }
    }

    public function add($title, $content, $type, $from, $to, $action, $send_data, $terminal, $avatar = '', $fromType = 'system')
    {
        $data = [
            'title' => $title,
            'content' => $content,
            'type' => $type,
            'from' => $from,
            'to' => $to,
            'action' => $action,
            'send_data' => $send_data,
            'terminal' => $terminal,
            'avatar' => $avatar,
            'from_type' => $fromType,
            'create_time' => nowTime(),
        ];
        return self::create($data);
    }
}
