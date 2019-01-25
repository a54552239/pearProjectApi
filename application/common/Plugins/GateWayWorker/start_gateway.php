<?php
/**
 * This file is part of workerman.
 *
 * Licensed under The MIT License
 * For full copyright and license information, please see the MIT-LICENSE.txt
 * Redistributions of files must retain the above copyright notice.
 *
 * @author walkor<walkor@workerman.net>
 * @copyright walkor<walkor@workerman.net>
 * @link http://www.workerman.net/
 * @license http://www.opensource.org/licenses/mit-license.php MIT License
 */

use Workerman\Worker;
use GatewayWorker\Gateway;

require_once __DIR__ . '/vendor/autoload.php';
require_once __DIR__ . '/config.php';

$context = array();
if (USE_SSL) {
    // 证书最好是申请的证书
    $context = [
        // 更多ssl选项请参考手册 http://php.net/manual/zh/context.ssl.php
        'ssl' => [
            // 请使用绝对路径
            'local_cert' => LOCAL_CERT, // 也可以是crt文件
            'local_pk' => LOCAL_PK,
            'verify_peer' => VERIFY_PEER,
            'allow_self_signed' => ALLOW_SELF_SIGNED, //如果是自签名证书需要开启此选项
        ]
    ];
}

// gateway 进程，这里使用Text协议，可以用telnet测试
$gateway = new Gateway('websocket://' . SERVER_ADDRESS . ':' . CLIENT_PORT, $context);

if (USE_SSL) {
    // 开启SSL，websocket+SSL 即wss
    $gateway->transport = 'ssl';
}

// gateway名称，status方便查看
$gateway->name = 'YourAppGateway';
// gateway进程数
$gateway->count = 4;
// 本机ip，分布式部署时使用内网ip
$gateway->lanIp = '127.0.0.1';
// 内部通讯起始端口，假如$gateway->count=4，起始端口为4000
// 则一般会使用4000 4001 4002 4003 4个端口作为内部通讯端口
$gateway->startPort = 2900;
// 服务注册地址
$gateway->registerAddress = SERVER_ADDRESS . ':' . SERVER_PORT;

// 心跳间隔
$gateway->pingInterval = 60;
// 心跳数据
$data = ['action' => 'ping'];
$gateway->pingData = json_encode($data);

/*
// 当客户端连接上来时，设置连接的onWebSocketConnect，即在websocket握手时的回调
$gateway->onConnect = function($connection)
{
    $connection->onWebSocketConnect = function($connection , $http_header)
    {
        // 可以在这里判断连接来源是否合法，不合法就关掉连接
        // $_SERVER['HTTP_ORIGIN']标识来自哪个站点的页面发起的websocket链接
        if($_SERVER['HTTP_ORIGIN'] != 'http://kedou.workerman.net')
        {
            $connection->close();
        }
        // onWebSocketConnect 里面$_GET $_SERVER是可用的
        // var_dump($_GET, $_SERVER);
    };
};
*/

// 如果不是在根目录启动，则运行runAll方法
if (!defined('GLOBAL_START')) {
    Worker::runAll();
}

