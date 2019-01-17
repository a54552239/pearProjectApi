<?php


namespace sms;

use MESSAGEMultiSend;
use MESSAGEsend;
use Multi;
use think\facade\Env;
use think\facade\Log;

/**
 * Submail短信服务
 * Class Sms
 * @package sms
 */
class SubmailSms
{
    private $messageSend;//单个发送
    private $messageMultiSend;//批量发送
    private $signName = '【星盟】';

    public function __construct()
    {
        $message_configs = [];
        @require Env::get('extend_path') . '/sms/submail/app_config.php';
        @require_once(Env::get('extend_path') . '/sms/submail/SUBMAILAutoload.php');
        @$this->messageSend = new MESSAGEsend($message_configs);
        @$this->messageMultiSend = new MESSAGEMultiSend($message_configs);

    }

    public function send($phoneNumber, $content)
    {
        $this->messageSend->SetTo($phoneNumber);
        $this->messageSend->SetContent("{$this->signName}{$content}");
        return $this->messageSend->send();
    }

    public function multiSend($phoneNumbers, $content, $vars)
    {
        if ($phoneNumbers) {
            foreach ($phoneNumbers as $phoneNumber) {
                $multi = new Multi();
                $multi->setTo($phoneNumber);
                foreach ($vars as $key => $var) {
                    $multi->addVar($key, $var);
                }
                $this->messageMultiSend->addMulti($multi->build());
            }
        }
        $this->messageMultiSend->SetContent("{$this->signName}{$content}");
        return $this->messageMultiSend->multisend();
    }
}
