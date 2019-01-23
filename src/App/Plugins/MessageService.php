<?php
namespace App\Plugins;
use GatewayWorker\Lib\Gateway;

/**
 * 消息推送服务
 * Class MessageService
 * @package service
 */
class MessageService
{
    public function __construct()
    {
        /**
         *====这个步骤是必须的====
         *这里填写Register服务的ip（通常是运行GatewayWorker的服务器ip）和端口
         *注意Register服务端口在start_register.php中可以找到（chat默认是1236）
         *这里假设GatewayClient和Register服务都在一台服务器上，ip填写127.0.0.1
         *注意：ip不能是0.0.0.0
         **/
        Gateway::$registerAddress = '192.168.0.140:2346';
    }

    /**
     * @param $data
     * @param null $client_id_array
     * @param null $exclude_client_id
     * @param bool $raw
     * @throws \Exception
     */
    public function sendToAll($data, $client_id_array = null, $exclude_client_id = null, $raw = false)
    {
        Gateway::sendToAll($data, $client_id_array, $exclude_client_id, $raw);
    }

    public function sendToUid($uid, $data, $action = '')
    {
        Gateway::sendToUid($uid, $data);
    }

    public function sendToClient($client_id, $data)
    {
        Gateway::sendToClient($client_id, $data);
    }

    public function sendToGroup($group, $data)
    {
        Gateway::sendToGroup($group, $data);
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
}
