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
        Log::init(['path' => 'log/sms']);
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
        if (config('sms.debug')) {
            return true;
        }
        try {
            $result = $this->send($to, $message, $gateways);
        } catch (InvalidArgumentException $e) {
//            Log::write($e->getResults(), "sms-exception");
            return error(1);
        } catch (NoGatewayAvailableException $e) {
//            Log::write($e->getResults(), "sms-exception");
            return error(1);
        }
        Log::write($result, "sms");
        return $result;
    }
}
