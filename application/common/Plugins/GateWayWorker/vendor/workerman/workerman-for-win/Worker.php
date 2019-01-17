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
namespace Workerman;

require_once __DIR__ . '/Lib/Constants.php';

use \Workerman\Events\Libevent;
use \Workerman\Events\Event;
use \Workerman\Events\React;
use \Workerman\Events\Select;
use \Workerman\Events\EventInterface;
use \Workerman\Connection\ConnectionInterface;
use \Workerman\Connection\TcpConnection;
use \Workerman\Connection\UdpConnection;
use \Workerman\Lib\Timer;
use \Workerman\Autoloader;
use \Exception;

/**
 * 
 * @author walkor<walkor@workerman.net>
 */
class Worker
{
    /**
     * 版本号
     * @var string
     */
    const VERSION = '3.5.1';
    
    /**
     * 状态 启动中
     * @var int
     */
    const STATUS_STARTING = 1;
    
    /**
     * 状态 运行中
     * @var int
     */
    const STATUS_RUNNING = 2;
    
    /**
     * 状态 停止
     * @var int
     */
    const STATUS_SHUTDOWN = 4;
    
    /**
     * 状态 平滑重启中
     * @var int
     */
    const STATUS_RELOADING = 8;
    
    /**
     * 给子进程发送重启命令 KILL_WORKER_TIMER_TIME 秒后
     * 如果对应进程仍然未重启则强行杀死
     * @var int
     */
    const KILL_WORKER_TIMER_TIME = 1;
    
    /**
     * 默认的backlog，即内核中用于存放未被进程认领（accept）的连接队列长度
     * @var int
     */
    const DEFAUL_BACKLOG = 1024;
    
    /**
     * udp最大包长
     * @var int
     */
    const MAX_UDP_PACKAGE_SIZE = 65535;
    
    /**
     * worker id
     * @var int
     */
    public $id = 0;
    
    /**
     * worker的名称，用于在运行status命令时标记进程
     * @var string
     */
    public $name = 'none';
    
    /**
     * 设置当前worker实例的进程数
     * @var int
     */
    public $count = 1;
    
    /**
     * 设置当前worker进程的运行用户，启动时需要root超级权限
     * @var string
     */
    public $user = '';
    
    /**
     * 当前worker进程是否可以平滑重启 
     * @var bool
     */
    public $reloadable = true;
    
    /**
     * reuse port
     * @var bool
     */
    public $reusePort = false;
    
    /**
     * 当worker进程启动时，如果设置了$onWorkerStart回调函数，则运行
     * 此钩子函数一般用于进程启动后初始化工作
     * @var callback
     */
    public $onWorkerStart = null;
    
    /**
     * 当有客户端连接时，如果设置了$onConnect回调函数，则运行
     * @var callback
     */
    public $onConnect = null;
    
    /**
     * 当客户端连接上发来数据时，如果设置了$onMessage回调，则运行
     * @var callback
     */
    public $onMessage = null;
    
    /**
     * 当客户端的连接关闭时，如果设置了$onClose回调，则运行
     * @var callback
     */
    public $onClose = null;
    
    /**
     * 当客户端的连接发生错误时，如果设置了$onError回调，则运行
     * 错误一般为客户端断开连接导致数据发送失败、服务端的发送缓冲区满导致发送失败等
     * 具体错误码及错误详情会以参数的形式传递给回调，参见手册
     * @var callback
     */
    public $onError = null;
    
    /**
     * 当连接的发送缓冲区满时，如果设置了$onBufferFull回调，则执行
     * @var callback
     */
    public $onBufferFull = null;
    
    /**
     * 当链接的发送缓冲区被清空时，如果设置了$onBufferDrain回调，则执行
     * @var callback
     */
    public $onBufferDrain = null;
    
    /**
     * 当前进程退出时（由于平滑重启或者服务停止导致），如果设置了此回调，则运行
     * @var callback
     */
    public $onWorkerStop = null;
    
    /**
     * 当收到reload命令时的回调函数
     * @var callback
     */
    public $onWorkerReload = null;
    
    /**
     * 传输层协议
     * @var string
     */
    public $transport = 'tcp';
    
    /**
     * 所有的客户端连接
     * @var array
     */
    public $connections = array();
    
    /**
     * 应用层协议，由初始化worker时指定
     * 例如 new worker('http://0.0.0.0:8080');指定使用http协议
     * @var string
     */
    protected $protocol = null;
    
    /**
     * 当前worker实例初始化目录位置，用于设置应用自动加载的根目录
     * @var string
     */
    protected $_autoloadRootPath = '';
    
    /**
     * 是否以守护进程的方式运行。运行start时加上-d参数会自动以守护进程方式运行
     * 例如 php start.php start -d
     * @var bool
     */
    public static $daemonize = false;
    
    /**
     * 重定向标准输出，即将所有echo、var_dump等终端输出写到对应文件中
     * 注意 此参数只有在以守护进程方式运行时有效
     * @var string
     */
    public static $stdoutFile = '/dev/null';
    
    /**
     * pid文件的路径及名称
     * 例如 Worker::$pidFile = '/tmp/workerman.pid';
     * 注意 此属性一般不必手动设置，默认会放到php临时目录中
     * @var string
     */
    public static $pidFile = '';
    
    /**
     * 日志目录，默认在workerman根目录下，与Applications同级
     * 可以手动设置
     * 例如 Worker::$logFile = '/tmp/workerman.log';
     * @var unknown_type
     */
    public static $logFile = '';
    
    /**
     * 全局事件轮询库，用于监听所有资源的可读可写事件
     * @var Select/Libevent
     */
    public static $globalEvent = null;
    
    /**
     * 主进程停止时触发的回调，Win系统下不起作用
     * @var unknown_type
     */
    public static $onMasterStop = null;

    /**
     * 事件轮询库类名
     * @var string
     */
    public static $eventLoopClass = '';
    
    /**
     * 主进程pid
     * @var int
     */
    protected static $_masterPid = 0;
    
    /**
     * 监听的socket
     * @var stream
     */
    protected $_mainSocket = null;
    
    /**
     * socket名称，包括应用层协议+ip+端口号，在初始化worker时设置 
     * 值类似 http://0.0.0.0:80
     * @var string
     */
    protected $_socketName = '';
    
    /**
     * socket的上下文，具体选项设置可以在初始化worker时传递
     * @var context
     */
    protected $_context = null;
    
    /**
     * 所有的worker实例
     * @var array
     */
    protected static $_workers = array();
    
    /**
     * 所有worker进程的pid
     * 格式为 [worker_id=>[pid=>pid, pid=>pid, ..], ..]
     * @var array
     */
    protected static $_pidMap = array();
    
    /**
     * 所有需要重启的进程pid
     * 格式为 [pid=>pid, pid=>pid]
     * @var array
     */
    protected static $_pidsToRestart = array();
    
    /**
     * 当前worker状态
     * @var int
     */
    protected static $_status = self::STATUS_STARTING;
    
    /**
     * 所有worke名称(name属性)中的最大长度，用于在运行 status 命令时格式化输出
     * @var int
     */
    protected static $_maxWorkerNameLength = 12;
    
    /**
     * 所有socket名称(_socketName属性)中的最大长度，用于在运行 status 命令时格式化输出
     * @var int
     */
    protected static $_maxSocketNameLength = 12;
    
    /**
     * 所有user名称(user属性)中的最大长度，用于在运行 status 命令时格式化输出
     * @var int
     */
    protected static $_maxUserNameLength = 12;
    
    /**
     * 运行 status 命令时用于保存结果的文件名
     * @var string
     */
    protected static $_statisticsFile = '';
    
    /**
     * 启动的全局入口文件
     * 例如 php start.php start ，则入口文件为start.php
     * @var string
     */
    protected static $_startFile = '';
    
    /**
     * 用来保存子进程句柄（windows）
     * @var array
     */
    protected static $_process = array();
    
    /**
     * 要执行的文件
     * @var array
     */
    protected static $_startFiles = array();

    /**
     * Available event loops.
     *
     * @var array
     */
    protected static $_availableEventLoops = array(
        'libevent' => '\Workerman\Events\Libevent',
        'event'    => '\Workerman\Events\Event'
    );

    /**
     * PHP built-in protocols.
     *
     * @var array
     */
    protected static $_builtinTransports = array(
            'tcp'   => 'tcp',
            'udp'   => 'udp',
            'unix'  => 'unix',
            'ssl'   => 'tcp'
    );
    
    /**
     * 运行所有worker实例
     * @return void
     */
    public static function runAll()
    {
        // 初始化环境变量
        self::init();
        // 解析命令
        self::parseCommand();
        // 初始化所有worker实例，主要是监听端口
        self::initWorkers();
        // 展示启动界面
        self::displayUI();
        // 运行所有的worker
        self::runAllWorkers();
        // 监控worker
        self::monitorWorkers();
    }
    
    /**
     * 初始化一些环境变量
     * @return void
     */
    public static function init()
    {
        if(strpos(strtolower(PHP_OS), 'win') !== 0)
        {
            exit("workerman-for-win can not run in linux\n");
        }
        if (false !== strpos(ini_get('disable_functions'), 'proc_open'))
        {
            exit("\r\nWarning: proc_open() has been disabled for security reasons. \r\n\r\nSee http://wiki.workerman.net/Error5\r\n");
        }
        $backtrace = debug_backtrace();
        self::$_startFile = $backtrace[count($backtrace)-1]['file'];
        // 没有设置日志文件，则生成一个默认值
        if(empty(self::$logFile))
        {
            self::$logFile = __DIR__ . '/../workerman.log';
        }
        // 标记状态为启动中
        self::$_status = self::STATUS_STARTING;
        
        $event_loop_class = self::getEventLoopName();
        self::$globalEvent = new $event_loop_class;
        Timer::init(self::$globalEvent);
    }
    
    /**
     * 初始化所有的worker实例，主要工作为获得格式化所需数据及监听端口
     * @return void
     */
    protected static function initWorkers()
    {
        foreach(self::$_workers as $worker)
        {
            // 没有设置worker名称，则使用none代替
            if(empty($worker->name))
            {
                $worker->name = 'none';
            }
            // 获得所有worker名称中最大长度
            $worker_name_length = strlen($worker->name);
            if(self::$_maxWorkerNameLength < $worker_name_length)
            {
                self::$_maxWorkerNameLength = $worker_name_length;
            }
            // 获得所有_socketName中最大长度
            $socket_name_length = strlen($worker->getSocketName());
            if(self::$_maxSocketNameLength < $socket_name_length)
            {
                self::$_maxSocketNameLength = $socket_name_length;
            }
            $user_name_length = strlen($worker->user);
            if(self::$_maxUserNameLength < $user_name_length)
            {
                self::$_maxUserNameLength = $user_name_length;
            }
        }
    }
    
    /**
     * 运行所有的worker
     */
    public static function runAllWorkers()
    {
        // 只有一个start文件时执行run
        if(count(self::$_startFiles) === 1)
        {
            // win不支持同一个页面执初始化多个worker
            if(count(self::$_workers) > 1)
            {
                echo "@@@ Error: multi workers init in one php file are not support @@@\r\n";
                echo "@@@ Please visit http://wiki.workerman.net/Multi_woker_for_win @@@\r\n";
            }
            elseif(count(self::$_workers) <= 0)
            {
                exit("@@@no worker inited@@@\r\n\r\n");
            }
            
            // 执行worker的run方法
            reset(self::$_workers);
            $worker = current(self::$_workers);
            $worker->listen();
            // 子进程阻塞在这里
            $worker->run();
            exit("@@@child exit@@@\r\n");
        }
        // 多个start文件则多进程打开
        elseif(count(self::$_startFiles) > 1)
        {
            self::$globalEvent = new Select();
            Timer::init(self::$globalEvent);
            foreach(self::$_startFiles as $start_file)
            {
                self::openProcess($start_file);
            }
        }
        // 没有start文件提示错误
        else
        {
            //exit("@@@no worker inited@@@\r\n");
        }
    }
    
    /**
     * 打开一个子进程
     * @param string $start_file
     */
    public static function openProcess($start_file)
    {
        // 保存子进程的输出
        $start_file = realpath($start_file);
        $std_file = sys_get_temp_dir() . '/'.str_replace(array('/', "\\", ':'), '_', $start_file).'.out.txt';
        // 将stdou stderr 重定向到文件
        $descriptorspec = array(
                0 => array('pipe', 'a'), // stdin
                1 => array('file', $std_file, 'w'), // stdout
                2 => array('file', $std_file, 'w') // stderr
        );
        
        // 保存stdin句柄，用来探测子进程是否关闭
        $pipes = array();
       
        // 打开子进程
        $process= proc_open("php \"$start_file\" -q", $descriptorspec, $pipes);
        
        // 打开stdout stderr 文件句柄
        $std_handler = fopen($std_file, 'a+');
        // 非阻塞
        stream_set_blocking($std_handler, 0);
        // 定时读取子进程的stdout stderr
        $timer_id = Timer::add(0.1, function()use($std_handler)
        {
            echo fread($std_handler, 65535);
        });
        
        // 保存子进程句柄
        self::$_process[$start_file] = array($process, $start_file, $timer_id);
    }
    
    /**
     * 定时检查子进程是否退出了
     */
    protected static function monitorWorkers()
    {
        // 定时检查子进程是否退出了
        Timer::add(0.5, "\\Workerman\\Worker::checkWorkerStatus");
        
        // 主进程loop
        self::$globalEvent->loop();
    }
    
    public static function checkWorkerStatus()
    {
        foreach(self::$_process as $process_data)
        {
            $process = $process_data[0];
            $start_file = $process_data[1];
            $timer_id = $process_data[2];
            $status = proc_get_status($process);
            if(isset($status['running']))
            {
                // 子进程退出了，重启一个子进程
                if(!$status['running'])
                {
                    echo "process $start_file terminated and try to restart\n";
                    Timer::del($timer_id);
                    @proc_close($process);
                    // 重新打开一个子进程
                    self::openProcess($start_file);
                }
            }
            else
            {
                echo "proc_get_status fail\n";
            }
        }
    }

    /**
     * Get all worker instances.
     *
     * @return array
     */
    public static function getAllWorkers()
    {
        return self::$_workers;
    }

    /**
     * Get global event-loop instance.
     *
     * @return EventInterface
     */
    public static function getEventLoop()
    {
        return self::$globalEvent;
    }
    
    /**
     * 展示启动界面
     * @return void
     */
    protected static function displayUI()
    {
        global $argv;
        // -q不打印
        if(in_array('-q', $argv))
        {
            return;
        }
        echo "----------------------- WORKERMAN -----------------------------\n";
        echo 'Workerman version:' . Worker::VERSION . "          PHP version:".PHP_VERSION."\n";
        echo "------------------------ WORKERS -------------------------------\n";
        echo "worker",str_pad('', self::$_maxWorkerNameLength+2-strlen('worker')), "listen",str_pad('', self::$_maxSocketNameLength+2-strlen('listen')), "processes ","status\n";
        foreach(self::$_workers as $worker)
        {
            echo str_pad($worker->name, self::$_maxWorkerNameLength+2),str_pad($worker->getSocketName(), self::$_maxSocketNameLength+2), str_pad(' '.$worker->count, 9), " [OK] \n";;
        }
        echo "----------------------------------------------------------------\n";
        echo "Press Ctrl-C to quit. Start success.\n";
    }
    
    /**
     * 解析运行命令
     * php yourfile.php start | stop | restart | reload | status
     * @return void
     */
    public static function parseCommand()
    {
        global $argv;
        foreach($argv as $file)
        {
            $ext = pathinfo($file, PATHINFO_EXTENSION );
            if($ext !== 'php')
            {
                continue;
            }
            if(is_file($file))
            {
                self::$_startFiles[$file] = $file;
                include_once $file;
            }
        }
    }
    
    /**
     * 执行关闭流程
     * @return void
     */
    public static function stopAll()
    {
        self::$_status = self::STATUS_SHUTDOWN;
        exit(0);
    }
    
    /**
     * 记录日志
     * @param string $msg
     * @return void
     */
    public static function log($msg)
    {
        $msg = $msg."\n";
        if(self::$_status === self::STATUS_STARTING || !self::$daemonize)
        {
            echo $msg;
        }
        file_put_contents(self::$logFile, date('Y-m-d H:i:s') . " " . $msg, FILE_APPEND | LOCK_EX);
    }
    
    /**
     * worker构造函数
     * @param string $socket_name
     * @return void
     */
    public function __construct($socket_name = '', $context_option = array())
    {
        // 保存worker实例
        $this->workerId = spl_object_hash($this);
        self::$_workers[$this->workerId] = $this;
        self::$_pidMap[$this->workerId] = array();
        
        // 获得实例化文件路径，用于自动加载设置根目录
        $backrace = debug_backtrace();
        $this->_autoloadRootPath = dirname($backrace[0]['file']);
        
        // 设置socket上下文
        if($socket_name)
        {
            $this->_socketName = $socket_name;
            if(!isset($context_option['socket']['backlog']))
            {
                $context_option['socket']['backlog'] = self::DEFAUL_BACKLOG;
            }
            $this->_context = stream_context_create($context_option);
        }
        
        // 设置一个空的onMessage，当onMessage未设置时用来消费socket数据
        $this->onMessage = function(){};
    }
    
    /**
     * 监听端口
     * @throws Exception
     */
    public function listen()
    {
        if (!$this->_socketName || $this->_mainSocket) {
            return;
        }

        // Autoload.
        Autoloader::setRootPath($this->_autoloadRootPath);

        // Get the application layer communication protocol and listening address.
        list($scheme, $address) = explode(':', $this->_socketName, 2);
        // Check application layer protocol class.
        if (!isset(self::$_builtinTransports[$scheme])) {
            if(class_exists($scheme)){
                $this->protocol = $scheme;
            } else {
                $scheme         = ucfirst($scheme);
                $this->protocol = '\\Protocols\\' . $scheme;
                if (!class_exists($this->protocol)) {
                    $this->protocol = "\\Workerman\\Protocols\\$scheme";
                    if (!class_exists($this->protocol)) {
                        throw new Exception("class \\Protocols\\$scheme not exist");
                    }
                }
            }
            if (!isset(self::$_builtinTransports[$this->transport])) {
                throw new \Exception('Bad worker->transport ' . var_export($this->transport, true));
            }
        } else {
            $this->transport = $scheme;
        }

        $local_socket = self::$_builtinTransports[$this->transport] . ":" . $address;

        // Flag.
        $flags  = $this->transport === 'udp' ? STREAM_SERVER_BIND : STREAM_SERVER_BIND | STREAM_SERVER_LISTEN;
        $errno  = 0;
        $errmsg = '';
        // SO_REUSEPORT.
        if ($this->reusePort) {
            stream_context_set_option($this->_context, 'socket', 'so_reuseport', 1);
        }

        // Create an Internet or Unix domain server socket.
        $this->_mainSocket = stream_socket_server($local_socket, $errno, $errmsg, $flags, $this->_context);
        if (!$this->_mainSocket) {
            throw new Exception($errmsg);
        }

        if ($this->transport === 'ssl') {
            stream_socket_enable_crypto($this->_mainSocket, false);
        }

        // Try to open keepalive for tcp and disable Nagle algorithm.
        if (function_exists('socket_import_stream') && self::$_builtinTransports[$this->transport] === 'tcp') {
            $socket = socket_import_stream($this->_mainSocket);
            @socket_set_option($socket, SOL_SOCKET, SO_KEEPALIVE, 1);
            @socket_set_option($socket, SOL_TCP, TCP_NODELAY, 1);
        }

        // Non blocking.
        stream_set_blocking($this->_mainSocket, 0);

        // Register a listener to be notified when server socket is ready to read.
        if (self::$globalEvent) {
            if ($this->transport !== 'udp') {
                self::$globalEvent->add($this->_mainSocket, EventInterface::EV_READ, array($this, 'acceptConnection'));
            } else {
                self::$globalEvent->add($this->_mainSocket, EventInterface::EV_READ,
                    array($this, 'acceptUdpConnection'));
            }
        }
    }

    /**
     * Get event loop name.
     *
     * @return string
     */
    protected static function getEventLoopName()
    {
        if (self::$eventLoopClass) {
            return self::$eventLoopClass;
        }

        $loop_name = '';
        foreach (self::$_availableEventLoops as $name=>$class) {
            if (extension_loaded($name)) {
                $loop_name = $name;
                break;
            }
        }

        if ($loop_name) {
            if (interface_exists('\React\EventLoop\LoopInterface')) {
                switch ($loop_name) {
                    case 'libevent':
                        self::$eventLoopClass = '\Workerman\Events\React\LibEventLoop';
                        break;
                    case 'event':
                        self::$eventLoopClass = '\Workerman\Events\React\ExtEventLoop';
                        break;
                    default :
                        self::$eventLoopClass = '\Workerman\Events\React\StreamSelectLoop';
                        break;
                }
            } else {
                self::$eventLoopClass = self::$_availableEventLoops[$loop_name];
            }
        } else {
            self::$eventLoopClass = interface_exists('\React\EventLoop\LoopInterface')? '\Workerman\Events\React\StreamSelectLoop':'\Workerman\Events\Select';
        }
        return self::$eventLoopClass;
    }
    
    /**
     * 获得 socket name
     * @return string
     */
    public function getSocketName()
    {
        return $this->_socketName ? $this->_socketName : 'none';
    }
    
    /**
     * 运行worker实例
     */
    public function run()
    {
        // 设置自动加载根目录
        Autoloader::setRootPath($this->_autoloadRootPath);

        // Create a global event loop.
        if (!self::$globalEvent) {
            $event_loop_class = self::getEventLoopName();
            self::$globalEvent = new $event_loop_class;
        }

        // 监听_mainSocket上的可读事件（客户端连接事件）
        if($this->_socketName)
        {
            if($this->transport !== 'udp')
            {
                self::$globalEvent->add($this->_mainSocket, EventInterface::EV_READ, array($this, 'acceptConnection'));
            }
            else
            {
                self::$globalEvent->add($this->_mainSocket,  EventInterface::EV_READ, array($this, 'acceptUdpConnection'));
            }
        }
        
        // 用全局事件轮询初始化定时器
        Timer::init(self::$globalEvent);
        
        // 如果有设置进程启动回调，则执行
        if($this->onWorkerStart)
        {
            call_user_func($this->onWorkerStart, $this);
        }
        
        // 子进程主循环
        self::$globalEvent->loop();
    }
    
    /**
     * 停止当前worker实例
     * @return void
     */
    public function stop()
    {
        // 如果有设置进程终止回调，则执行
        if($this->onWorkerStop)
        {
            call_user_func($this->onWorkerStop, $this);
        }
        // 删除相关监听事件，关闭_mainSocket
        self::$globalEvent->del($this->_mainSocket, EventInterface::EV_READ);
        @fclose($this->_mainSocket);
    }

    /**
     * 接收一个客户端连接
     * @param resources $socket
     * @return void
     */
    public function acceptConnection($socket)
    {
         // Accept a connection on server socket.
        $new_socket = @stream_socket_accept($socket, 0, $remote_address);
        // Thundering herd.
        if (!$new_socket) {
            return;
        }

        // TcpConnection.
        $connection                         = new TcpConnection($new_socket, $remote_address);
        $this->connections[$connection->id] = $connection;
        $connection->worker                 = $this;
        $connection->protocol               = $this->protocol;
        $connection->transport              = $this->transport;
        $connection->onMessage              = $this->onMessage;
        $connection->onClose                = $this->onClose;
        $connection->onError                = $this->onError;
        $connection->onBufferDrain          = $this->onBufferDrain;
        $connection->onBufferFull           = $this->onBufferFull;

        // Try to emit onConnect callback.
        if ($this->onConnect) {
            try {
                call_user_func($this->onConnect, $connection);
            } catch (\Exception $e) {
                self::log($e);
                exit(250);
            } catch (\Error $e) {
                self::log($e);
                exit(250);
            }
        }
    }
    
    /**
     * 处理udp连接（udp其实是无连接的，这里为保证和tcp连接接口一致）
     * @param resource $socket
     */
    public function acceptUdpConnection($socket)
    {
        $recv_buffer = stream_socket_recvfrom($socket, self::MAX_UDP_PACKAGE_SIZE, 0, $remote_address);
        if (false === $recv_buffer || empty($remote_address)) {
            return false;
        }
        // UdpConnection.
        $connection           = new UdpConnection($socket, $remote_address);
        $connection->protocol = $this->protocol;
        if ($this->onMessage) {
            if ($this->protocol) {
                $parser      = $this->protocol;
                $recv_buffer = $parser::decode($recv_buffer, $connection);
            }
            ConnectionInterface::$statistics['total_request']++;
            try {
                call_user_func($this->onMessage, $connection, $recv_buffer);
            } catch (\Exception $e) {
                self::log($e);
                exit(250);
            } catch (\Error $e) {
                self::log($e);
                exit(250);
            }
        }
        return true;
    }
}
