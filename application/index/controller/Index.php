<?php

namespace app\index\controller;

use app\common\Model\Areas;
use app\common\Model\Collection;
use app\common\Model\Department;
use app\common\Model\DepartmentMember;
use app\common\Model\File;
use app\common\Model\Member;
use app\common\Model\MemberAccount;
use app\common\Model\Organization;
use app\common\Model\Project;
use app\common\Model\ProjectAuth;
use app\common\Model\ProjectAuthNode;
use app\common\Model\ProjectCollection;
use app\common\Model\ProjectLog;
use app\common\Model\ProjectMember;
use app\common\Model\SourceLink;
use app\common\Model\Task;
use app\common\Model\TaskLike;
use app\common\Model\TaskMember;
use app\common\Model\TaskStages;
use controller\BasicApi;
use Exception;
use PDO;
use service\MessageService;
use think\facade\Request;


/**
 * 应用入口控制器
 * @author Vilson
 */
class Index extends BasicApi
{

    protected $siteName = 'pearProject';

    public function index()
    {
        $this->success('success');
    }

    /**
     * 安装
     */
    public function install()
    {

        $dataPath = env('root_path') . 'data/';
        //数据库配置文件
        $dbConfigFile = env('config_path') . 'database.php';
        // 锁定的文件
        $lockFile = $dataPath . 'install.lock';
        $err = '';

        if (is_file($lockFile)) {
            $err = "当前已经安装{$this->siteName}，如果需要重新安装，请手动移除data/install.lock文件";
        } else if (version_compare(PHP_VERSION, '7.0.0', '<')) {
            $err = "当前版本(" . PHP_VERSION . ")过低，请使用PHP7.0以上版本";
        } else if (!extension_loaded("PDO")) {
            $err = "当前未开启PDO，无法进行安装";
        } else if (!is_really_writable($dbConfigFile)) {
            $open_basedir = ini_get('open_basedir');
            if ($open_basedir) {
                $dirArr = explode(PATH_SEPARATOR, $open_basedir);
                if ($dirArr && in_array(__DIR__, $dirArr)) {
                    $err = '当前服务器因配置了open_basedir，导致无法读取父目录';
                }
            }
            if (!$err) {
                $err = '当前权限不足，无法写入配置文件application/database.php';
            }
        }
        if ($err) {
            $this->error($err);
        }

        $initData = isset($_POST['initData']) ? $_POST['initData'] : false;
        $mysqlHostname = isset($_POST['mysqlHost']) ? $_POST['mysqlHost'] : '127.0.0.1';
        $mysqlHostport = isset($_POST['mysqlHostport']) ? $_POST['mysqlHostport'] : 3306;
        $hostArr = explode(':', $mysqlHostname);
        if (count($hostArr) > 1) {
            $mysqlHostname = $hostArr[0];
            $mysqlHostport = $hostArr[1];
        }
        $mysqlUsername = isset($_POST['mysqlUsername']) ? $_POST['mysqlUsername'] : 'root';
        $mysqlPassword = isset($_POST['mysqlPassword']) ? $_POST['mysqlPassword'] : 'root';
        $mysqlDatabase = isset($_POST['mysqlDatabase']) ? $_POST['mysqlDatabase'] : 'pearProject';
        $mysqlPrefix = isset($_POST['mysqlPrefix']) ? $_POST['mysqlPrefix'] : 'pear_';
        try {
            ignore_user_abort();
            set_time_limit(0);
            //检测能否读取安装文件
            $sql = @file_get_contents($dataPath . 'pearproject.sql');
            if (!$sql) {
                throw new Exception("无法读取data/pearproject.sql文件，请检查是否有读权限");
            }
            $sql = str_replace("`pms_", "`{$mysqlPrefix}", $sql);
            $pdo = new PDO("mysql:host={$mysqlHostname};port={$mysqlHostport}", $mysqlUsername, $mysqlPassword, array(
                PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION,
                PDO::MYSQL_ATTR_INIT_COMMAND => "SET NAMES utf8"
            ));

            //检测是否支持innodb存储引擎
            $pdoStatement = $pdo->query("SHOW VARIABLES LIKE 'innodb_version'");
            $result = $pdoStatement->fetch();
            if (!$result) {
                throw new Exception("当前数据库不支持innodb存储引擎，请开启后再重新尝试安装");
            }

            $pdo->query("CREATE DATABASE IF NOT EXISTS `{$mysqlDatabase}` CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;");

            $pdo->query("USE `{$mysqlDatabase}`");

            $pdo->exec($sql);

            $config = @file_get_contents($dbConfigFile);
            $callback = function ($matches) use ($mysqlHostname, $mysqlHostport, $mysqlUsername, $mysqlPassword, $mysqlDatabase, $mysqlPrefix) {
                $field = ucfirst($matches[1]);
                $replace = ${"mysql{$field}"};
                if ($matches[1] == 'hostport' && $mysqlHostport == 3306) {
                    $replace = '';
                }
                return "'{$matches[1]}'{$matches[2]}=>{$matches[3]}'{$replace}',";
            };

            $config = preg_replace_callback("/'(hostname|database|username|password|hostport|prefix)'(\s+)=>(\s+)(.*),/", $callback, $config);
            //检测能否成功写入数据库配置
            $result = @file_put_contents($dbConfigFile, $config);

            if (!$result) {
                throw new Exception("无法写入数据库信息到config/database.php文件，请检查是否有写权限");
            }

            //检测能否成功写入lock文件
            $result = @file_put_contents($lockFile, 1);
            if (!$result) {
                throw new Exception("无法写入安装锁定到data/install.lock文件，请检查是否有写权限");
            }
            if ($initData) {
                $this->initData();
            }
            $this->success('安装成功，请登录');
        } catch (PDOException $e) {
            $err = $e->getMessage();
        } catch (Exception $e) {
            $err = $e->getMessage();
        }
        if ($err) {
            $this->error($err);
        }
        $this->success('安装成功，请登录');

    }

    public function checkInstall()
    {
        $dataPath = env('root_path') . '/data/';
        // 锁定的文件
        $lockFile = $dataPath . '/install.lock';
        if (!is_file($lockFile)) {
            $this->error('', 201);
        }
        $this->success();
    }

    /**
     * @throws Exception
     */
    public function initData()
    {
//        $member = Member::where("account = 123456")->find();
//        $memberCode = $member['code'];
        Member::where("account <> '123456'")->delete();
        MemberAccount::where("id > 21")->delete();
        Collection::where("id > 0")->delete();
        Department::where("id > 0")->delete();
        DepartmentMember::where("id > 0")->delete();
        File::where("id > 0")->delete();
        Organization::where("id > 1")->delete();
        Project::where("id > 0")->delete();
        ProjectAuth::where("id > 4")->delete();
        ProjectAuthNode::where("auth not in (1,2,3,4)")->delete();
        ProjectCollection::where("id > 0")->delete();
        ProjectLog::where("id > 0")->delete();
        ProjectMember::where("id > 0")->delete();
        SourceLink::where("id > 0")->delete();
        Task::where("id > 0")->delete();
        TaskLike::where("id > 0")->delete();
        TaskMember::where("id > 0")->delete();
        TaskStages::where("id > 0")->delete();
    }

    /**
     * 获取行政区划数据
     */
    public function getAreaData()
    {
        $this->success('', Areas::createJsonForAnt());

    }

    /**
     * 将webscoket的client_id和用户id进行绑定
     * @param Request $request
     */
    public function bindClientId(Request $request)
    {
        $clientId = $request::param('client_id');
        $uid = $request::param('uid');
        if (!$uid) {
            $uid = getCurrentMember()['code'];
        }
        $messageService = new MessageService();
        $messageService->bindUid($clientId, $uid);
        $messageService->joinGroup($clientId, 'project');
        $this->success('', $uid);
    }

    public function createNotice(Request $request)
    {
        $data = $request::post();
        $notifyModel = new \app\common\Model\Notify();
        $result = $notifyModel->add($data['title'], $data['content'], $data['type'], $data['from'], $data['to'], $data['action'], $data['send_data'], $data['terminal']);
        $messageService = new MessageService();
        $messageService->sendToUid($data['to'], $data, $data['action']);
        $this->success('', $result);
    }

    public function pushNotice(Request $request)
    {
        $uid = $request::param('uid');
        $messageService = new MessageService();
        $messageService->sendToUid($uid, '888', 'notice');
        $this->success('', $messageService->isUidOnline($uid));

    }

    public function pushNoticeGroup(Request $request)
    {
        $group = $request::param('group');
        $messageService = new MessageService();
        $messageService->sendToGroup($group, '999', 'noticeGroup');
//        $this->success('群组消息', $group);
    }
}
