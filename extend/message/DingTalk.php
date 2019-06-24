<?php

namespace message;


use EasyDingTalk\Application;

/**
 * 消息推送服务
 * Class MessageService
 * @package service
 */
class DingTalk
{
    public $app;
    public $agentId;

    /**
     * MessageService constructor.
     * @param $agentId
     * @param $userIdList
     * @param $msg
     */
    public function __construct($agentId = '')
    {
        $app = new Application(config('dingtalk.'));
        $this->app = $app;
        $this->agentId = $agentId ? $agentId : config('dingtalk.agent_id');
    }

    public function sendCorporationMessage($userIdList, $msg, $agentId = '')
    {
        $params = [
            'agent_id' => $agentId ? $agentId : $this->agentId,
            'userid_list' => $userIdList,
            'msg' => is_array($msg) ? json_encode($msg) : $msg
        ];
        return $this->app->conversation->sendCorporationMessage($params);
    }

}
