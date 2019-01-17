<?php


namespace sms;

use Overtrue\EasySms\EasySms;
use Overtrue\EasySms\Exceptions\InvalidArgumentException;
use Overtrue\EasySms\Exceptions\NoGatewayAvailableException;
use think\facade\Log;

/**
 * 短信服务
 * Class Sms
 * @package sms
 */
class Sms extends EasySms
{
    public function __construct()
    {
        parent::__construct(config('sms.'));
        Log::init(['path' => 'log/sms/order']);
    }

    /**
     *  发送单条短信
     * @param $to
     * @param $message
     * @param array $gateways
     * @return array|bool
     */
    public function vSend($to, $message, array $gateways = [])
    {
        $result = false;
        try {
            $result = $this->send($to, $message, $gateways);
        } catch (InvalidArgumentException $e) {
            Log::write(json_encode($e->getResults()), "sms-exception");
        } catch (NoGatewayAvailableException $e) {
            Log::write(json_encode($e->getResults()), "sms-exception");
        }
        Log::write(json_encode($result), "sms");
        return $result;
    }

    /**
     * 暂时保留
     * @param $phoneNumber
     * @param $content
     * @param string $vars
     * @return mixed
     */
    public function sends($phoneNumber, $content, $vars = '')
    {

        $sms = new SubmailSms();
        $result = $sms->send($phoneNumber, $content);
//        $result = $sms->multiSend($phoneNumber, $content, $vars);
        Log::write(json_encode($result), "sms");
        return $result;
    }
}
