<?php
namespace App;
use App\Domain\Project\Log;
use App\Domain\Project\TaskLog as TaskLog;
use App\Domain\System\Log as DomainLog;
use App\Domain\Team\Team;
use App\Model\User\User;
use App\Model\User\UserToken;
use App\Plugins\MessageService;
use GatewayWorker\Lib\Gateway;
use PhalApi\Exception\BadRequestException;

function nowTime()
{
    return date('Y-m-d H:i:s', time());
}

/**
 * 返回本周开始和结束的时间戳
 *
 * @return array
 */
function getWeekTime()
{
    $timestamp = time();
    return array(
        strtotime(date('Y-m-d', strtotime("this week Monday", $timestamp))),
        strtotime(date('Y-m-d', strtotime("this week Sunday", $timestamp))) + 24 * 3600 - 1
    );
}

/**
 * 推送钉钉消息
 * @param string $to_uid
 * @param int $phone
 * @param string $content
 * @param string $notice_type
 * @param null $data
 * @param int $user_id
 * @return bool
 */
function pushDingDing($to_uid = '', $phone = 0, $content = "消息通知", $notice_type = 'text', $data = null, $user_id = 0)
{
//    return false;
    $is_synchronize = $data['data']['is_synchronize'];
    if ($is_synchronize) {  //如果消息来源自同步，则不重复推送消息
        return false;
    }
    if ($to_uid) {
        $domain_team = new Team();
        $team_list = $domain_team->getUserTeam($to_uid);
        $team = $team_list[0];
        $team = $domain_team->getInfo(array('id' => $team['team_id']));
        $team_token = $team['token'];
        $prefix_url = "https://oapi.dingtalk.com/robot/send?access_token=";
        $push_url = $prefix_url . $team_token;
        switch ($notice_type) {
            case 'text':
                $post_data = array('msgtype' => 'text', 'text' => array('content' => $content));
                break;
            case  'markdown':
                $task_id = $data['task_info']['id'];
                $task_name = $data['task_info']['name'];
                $task_desc = $data['task_info']['desc'];
                $data_content = $data['data']['content'];
                $project_name = $data['project_info']['name'];
                $project_id = $data['project_info']['id'];
                $now = nowTime();
                $old_system = "http://zxceshi.iask.in/task-view-{$task_id}.html";
                $new_system = "http://192.168.1.183:8090/#/project/task/{$project_id}";
                $task_desc_template = !$task_desc ? '' : ">>任务描述：{$task_desc}\n\n";
                $markdown_text = "#### {$data_content}\n" .
                    ">>任务：{$task_name}\n\n" .
                    $task_desc_template .
                    ">>来自：{$project_name}\n\n" .
                    "> @{$phone}\n\n" .
//                    "> ###### {$now} 发布 [原系统]({$old_system})  [新系统]({$new_system}) \n";
                    "> ###### {$now} 发布 [查看]({$old_system}) \n";
                $post_data = array('msgtype' => 'markdown', 'markdown' => array('title' => $data['task_info']['name'], 'text' => $markdown_text));
                break;
        }
        if ($phone) {
            $post_data['at'] = array('atMobiles' => array($phone));
        }
//        var_dump($data);die;
        $data_string = json_encode($post_data);
        $ch = curl_init();
        curl_setopt($ch, CURLOPT_URL, $push_url);
        curl_setopt($ch, CURLOPT_POST, 1);
        curl_setopt($ch, CURLOPT_CONNECTTIMEOUT, 5);
        curl_setopt($ch, CURLOPT_HTTPHEADER, array('Content-Type: application/json;charset=utf-8'));
        curl_setopt($ch, CURLOPT_POSTFIELDS, $data_string);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
        // 线下环境不用开启curl证书验证, 未调通情况可尝试添加该代码
        curl_setopt($ch, CURLOPT_SSL_VERIFYHOST, 0);
        curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, 0);
        $data = curl_exec($ch);
        curl_close($ch);
        \PhalApi\DI()->logger->info('push_dingding_data:' . $data_string);
//        var_dump($data, $push_url);
//        die;
    }
}

/**
 * 推送桌面消息
 * @param string $to_uid
 * @param string $content
 * @param string $notice_type
 * @param int $user_id
 * @return bool
 * @throws BadRequestException
 * @throws \Exception
 */
function pushNotice($to_uid = '', $content = "消息通知", $notice_type = 'new_notice', $user_id = 0)
{
    if (!PUSH_NOTIFY) {
        return true;
    }
    $current_user = getCurrentUser();
    if (!$user_id) {
        if (!$current_user) {
            $current_user['id'] = $user_id;
        } else {
            $user_id = $current_user['id'];
        }
    }
    if ($to_uid == '') {
        $to_uid = $current_user['id'];
        if (!$to_uid) {
            return false;
        }
    }
    if ($to_uid == 'all') {
        $to_uid = 0;
    }
    if (is_array($content)) {
        $data = $content;
        $notice = isset($content['notice']) ? $content['notice'] : '';
        $title = isset($content['title']) ? $content['title'] : '';
    } else {
        $data = array();
        $title = '消息通知';
        $notice = $content;
    }
    $content = json_encode(array('data' => $data, 'notice' => $notice, 'title' => $title, 'user_id' => $user_id), true);


    // 指明给谁推送，为空表示向所有在线用户推送
    // 推送的url地址，使用自己的服务器地址
//    $push_api_url = "http://127.0.0.1:2021/";
    $post_data = array(
        "type" => $notice_type,
        "content" => $content,
        "to" => $to_uid,
    );
    $post_data = json_encode($post_data);
    $messageService = new MessageService();
    if (!$to_uid) {
        $messageService->sendToAll($post_data);
    }else{
        $messageService->sendToUid($to_uid, $post_data);
    }
//    $ch = curl_init();
//    curl_setopt($ch, CURLOPT_URL, $push_api_url);
//    curl_setopt($ch, CURLOPT_POST, 1);
//    curl_setopt($ch, CURLOPT_HEADER, 0);
//    curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
//    curl_setopt($ch, CURLOPT_POSTFIELDS, $post_data);
//    curl_setopt($ch, CURLOPT_HTTPHEADER, array("Expect:"));
//    $return = curl_exec($ch);
//    curl_close($ch);
}

/**
 * 获取当前登录的用户
 * @return mixed
 * @throws BadRequestException
 */
function getCurrentUser()
{
//    $user_info = \PhalApi\DI()->cookie->get('user_info');
//    var_dump(\PhalApi\DI()->request->getHeader('Token'));
//    if ($user_info) {
//        get_object_vars(json_decode($user_info));
//    }
    $user_info = null;

    $model_user_token = new UserToken();
    $tokenArray = \PhalApi\DI()->request->getHeader('Token');
    if (!$tokenArray) {
        $tokenArray = \PhalApi\DI()->request->getHeader('token');
        if (!$tokenArray) {
            $tokenArray = \PhalApi\DI()->request->get('token');
        }
    }
    if ($tokenArray) {
        $tokenArray = explode('&', $tokenArray);
        $token = $tokenArray[0];// token
        $expired_time = $tokenArray[1];// 过期时间
        $user_token_info = $model_user_token->getUserToken($token);
        if ($user_token_info) {
            $user_name = $user_token_info['user_name'];
            if ($user_name) {
                $model_user = new User();
                $user_info = $model_user->getInfo(array('account' => $user_name));
            }
        }
        if ($expired_time == 0) {
            $expired_time = $user_token_info['login_time'] + 24 * 3600;// 有效期默认一天
        }
        if ($expired_time < time()) {
//            throw new BadRequestException('登录超时', 99);
        }
        return $user_info;
    }
    return false;
}

function addLog($content)
{
    $user_info = json_decode(\PhalApi\DI()->cookie->get('user_info'));
    $user_id = 0;
    if ($user_info) {
        $user_id = $user_info->id;
    }
    DomainLog::addLog($content, $user_id);
}

function addProjectLog($content, $project_id = 0, $ticket = '')
{
    $user_info = getCurrentUser();
    $user_id = 0;
    if ($user_info) {
        $user_id = $user_info['id'];
    }
    Log::addLog($content, $project_id, $user_id, $ticket);
}

function addTaskLog($content, $task_id = 0, $log_type = 'add', $memo = '', $ticket = '', $user_id = 0, $to_user_id = 0, $is_synchronize = false)
{
    if (!$content) {
        return false;
    }
    if (!$user_id) {
        $user_info = getCurrentUser();
        $user_id = $user_info['id'];
    }
    TaskLog::addLog($content, $task_id, $user_id, $log_type, $memo, $ticket, $to_user_id, $is_synchronize);
}

function downloadFile($file, $path, $use_new = false)
{

    if (USE_QINIU or !$use_new) {
        header('Content-Description: File Transfer');

        header('Content-Type: application/octet-stream');
        header('Content-Disposition: attachment; filename=' . basename($file['title']));
        header('Content-Transfer-Encoding: binary');
        header('Expires: 0');
        header('Cache - Control: must - revalidate, post - check = 0, pre - check = 0');
        header('Pragma: public');
//        header('Content-Length: ' . filesize($path));
        readfile($path);
        die;
    } else {
        $save_name = $file['title'];
        ob_end_clean();
        $hfile = fopen($path, "rb") or die("Can not find file: $path\n");
        Header("Content-type: application/octet-stream");
        Header("Content-Transfer-Encoding: binary");
        Header("Accept-Ranges: bytes");
        Header("Content-Length: " . filesize($path));
        Header("Content-Disposition: attachment; filename=\"$save_name\"");
        while (!feof($hfile)) {
            echo fread($hfile, 32768);
        }
        fclose($hfile);
        die;
    }
}

