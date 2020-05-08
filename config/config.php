<?php
use think\facade\Env;
return [
    'notice_push' => Env::get('config.notice_push', false), //是否开启websocket消息推送
    'dingtalk_push' => Env::get('config.dingtalk_push', false), //是否开启钉钉消息推送
    'mail_push' => Env::get('config.mail_push', false), //是否开启邮件消息推送
];
