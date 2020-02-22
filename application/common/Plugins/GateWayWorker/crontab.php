<?php

use GuzzleHttp\Client;
use Workerman\Lib\Timer;
use Workerman\Worker;

require_once __DIR__ . '/vendor/autoload.php';
require_once __DIR__ . '/config.php';
require_once __DIR__ . '/../../../../vendor/autoload.php';

date_default_timezone_set('Asia/Shanghai');

$client = new Client();
$task = new Worker();
$task->name = 'crontab';
$doneTicket = [];
$task->onWorkerStart = function ($task) {
    $timerId = Timer::add(1, 'checkTime');
};

// 运行worker
Worker::runAll();

function checkTime()
{
    global $doneTicket;
    $now = time();
    $dateTime = date('H:i', $now);
    //每天23:55统计项目情况
    if ($dateTime == '23:55' && (!isset($doneTicket['setProjectReportDate']) || date('Y-m-d', $now) != $doneTicket['setProjectReportDate'])) {
        setProjectReport();
    }
}

function setProjectReport()
{
    global $client,$doneTicket;
    $doneTicket['setProjectReportDate'] = date('Y-m-d', time());
    //命令行模式
//    exec("php think projectReport",$out);
//    echo $out[0];

    //http模式
    $res = $client->request('GET', SITE_URL . '/index.php/project/project/_setDayilyProejctReport');
    echo $res->getBody();
}

