<?php
namespace App\Common\Exception;
use PhalApi\Exception;

/**
 * WrongRequestException 客户端异常请求
 *
 * 客户端异常请求
 *
 * @package     PhalApi\Exception
 * @license     http://www.phalapi.net/license GPL 协议
 * @link        http://www.phalapi.net/
 * @author      dogstar <chanzonghuang@gmail.com> 2015-02-05
 */

class WrongRequestException extends Exception {

    public function __construct($message, $code = 0) {
        parent::__construct(
            \PhalApi\T('{message}', array('message' => $message)), 200 + $code
        );
    }
}
