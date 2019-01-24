<?php

namespace service;

require_once env('app_path') . 'common/Plugins/GateWayWorker/vendor/autoload.php';
require_once env('app_path') . 'common/Plugins/GateWayWorker/config.php';

use GatewayWorker\Lib\Gateway;

/**
 * 消息推送服务
 * Class MessageService
 * @package service
 */
class MessageService
{

    /**
     * MessageService constructor.
     */
    public function __construct()
    {
        /**
         *====这个步骤是必须的====
         *这里填写Register服务的ip（通常是运行GatewayWorker的服务器ip）和端口
         *注意Register服务端口在start_register.php中可以找到（chat默认是1236）
         *这里假设GatewayClient和Register服务都在一台服务器上，ip填写127.0.0.1
         *注意：ip不能是0.0.0.0
         **/
        Gateway::$registerAddress = SERVER_ADDRESS . ':' . SERVER_PORT;
    }

    public function isUidOnline($uid)
    {
        return Gateway::isUidOnline($uid);
    }

    public function sendToAll($message, $action = '', $client_id_array = null, $exclude_client_id = null, $raw = false)
    {
        Gateway::sendToAll($this->messageFormat($message, $action), $client_id_array, $exclude_client_id, $raw);
    }

    public function sendToUid($uid, $message, $action = '')
    {
        Gateway::sendToUid($uid, $this->messageFormat($message, $action));
    }

    public function sendToClient($client_id, $message, $action = '')
    {
        Gateway::sendToClient($client_id, $this->messageFormat($message, $action));
    }

    public function sendToGroup($group, $message, $action = '')
    {
        Gateway::sendToGroup($group, $this->messageFormat($message, $action));
    }

    public function bindUid($client_id, $uid)
    {
        Gateway::bindUid($client_id, $uid);
    }

    public function joinGroup($client_id, $group)
    {
        if ($group) {
            Gateway::joinGroup($client_id, $group);
        }
    }

    public function messageFormat($message, $action = 'none')
    {
        $messageData = [
            'action' => $action, //推送场景
            'msg' => '', //推送内容
            'title' => '消息通知',//推送标题
            'data' => [],//推送数据
            'uid' => 0,//推送数据
        ];
        if (is_array($message)) {
            $messageData['data'] = $message;
            $messageData['msg'] = isset($message['content']) ? $message['content'] : '';
            $messageData['title'] = isset($message['title']) ? $message['title'] : '';
        } else {
            $messageData['msg'] = $message;
        }
        return json_encode($messageData, JSON_UNESCAPED_UNICODE);
    }

}
