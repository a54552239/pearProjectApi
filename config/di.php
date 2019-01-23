<?php
/**
 * DI依赖注入配置文件
 *
 * @license     http://www.phalapi.net/license GPL 协议
 * @link        http://www.phalapi.net/
 * @author dogstar <chanzonghuang@gmail.com> 2017-07-13
 */

use PhalApi\Loader;
use PhalApi\Config\FileConfig;
use PhalApi\Logger;
use PhalApi\Logger\FileLogger;
use PhalApi\Database\NotORMDatabase;
use App\Auth\Lite as AuthLite;

/** ---------------- 注册&初始化 基本服务组件 ---------------- **/

// 兼容PhalApi 1.x 旧版本
$loader = new Loader(API_ROOT, array('Library', 'library'));

include 'constant.php';

$di = \PhalApi\DI();

// 自动加载
$di->loader = $loader;

// 配置
$di->config = new FileConfig(API_ROOT . '/config');

// 调试模式，$_GET['__debug__']可自行改名
$di->debug = !empty($_GET['__debug__']) ? true : $di->config->get('sys.debug');

// 日记纪录
$di->logger = new FileLogger(API_ROOT . '/runtime', Logger::LOG_LEVEL_DEBUG | Logger::LOG_LEVEL_INFO | Logger::LOG_LEVEL_ERROR);
// 数据操作 - 基于NotORM
$di->notorm = new NotORMDatabase($di->config->get('dbs'), $di->debug);

$di->request = New App\Common\Request();

$di->qiniu = new \PhalApi\Qiniu\Lite();

$di->auth = New AuthLite();

$di->phpExcel = New PHPExcel_Lite();

$di->cors = new \PhalApi\CORS\Lite();

\PhalApi\DI()->cookie = new PhalApi\Cookie();

/** ---------------- 定制注册 可选服务组件 ---------------- **/

/**
 * // 签名验证服务
 * $di->filter = new \PhalApi\Filter\SimpleMD5Filter();
 */

/**
 * // 缓存 - Memcache/Memcached
 * $di->cache = function () {
 * return new \PhalApi\Cache\MemcacheCache(DI()->config->get('sys.mc'));
 * };
 */

/**
 * // 支持JsonP的返回
 * if (!empty($_GET['callback'])) {
 * $di->response = new \PhalApi\Response\JsonpResponse($_GET['callback']);
 * }
 */

//header("Content-Type:text/html; charset=UTF-8");

//跨域支持
if (isset($_SERVER['HTTP_ORIGIN'])) {
    header('Access-Control-Allow-Headers:Content-Type,Accept,Referer,Host,Keep-Alive,SystemUser-Agent,X-Requested-With,Cache-Control,Cookie,authorization,token');
}


