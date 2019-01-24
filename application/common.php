<?php

use service\DataService;
use service\NodeService;
use service\RandomService;
use think\Db;
use think\facade\Cache;
use think\facade\Request;


function isDebug()
{
    return config('app.app_debug');
}

/**
 * 打印输出数据到文件
 * @param mixed $data 输出的数据
 * @param bool $force 强制替换
 * @param string|null $file
 */
function p($data, $force = false, $file = null)
{
    is_null($file) && $file = env('runtime_path') . date('Ymd') . '.txt';
    $str = (is_string($data) ? $data : (is_array($data) || is_object($data)) ? print_r($data, true) : var_export($data, true)) . PHP_EOL;
    $force ? file_put_contents($file, $str) : file_put_contents($file, $str, FILE_APPEND);
}

/**
 * RBAC节点权限验证
 * @param string $node
 * @param string $moduleApp
 * @return bool
 */
function auth($node, $moduleApp = 'project')
{
    return NodeService::checkAuthNode($node, $moduleApp);
}

/**
 * 生成表唯一标记
 * @param string $tableName 表名
 * @param string $fieldName 字段名
 * @param int $len 长度
 * @return string
 * @throws \think\db\exception\DataNotFoundException
 * @throws \think\db\exception\ModelNotFoundException
 * @throws \think\exception\DbException
 */
function createUniqueCode($tableName, $fieldName = 'code', $len = 24)
{
    $code = RandomService::alnumLowercase($len);
    $has = Db::name($tableName)->where([$fieldName => $code])->field($fieldName)->find();
    if ($has) {
        return createUniqueCode($tableName, $fieldName, $len);
    }
    return $code;
}

/**
 * 设备或配置系统参数
 * @param string $name 参数名称
 * @param bool $value 默认是null为获取值，否则为更新
 * @return string|bool
 * @throws \think\Exception
 * @throws \think\exception\PDOException
 */
function sysconf($name, $value = null)
{
    static $config = [];
    if ($value !== null) {
        list($config, $data) = [[], ['name' => $name, 'value' => $value]];
        return DataService::save('SystemConfig', $data, 'name');
    }
    if (empty($config)) {
        $config = Db::name('SystemConfig')->column('name,value');
    }
    return isset($config[$name]) ? $config[$name] : '';
}

/**
 * 错误消息，一般用于向上抛出逻辑错误
 * @param $errno
 * @param string $message
 * @return array
 */
function error($errno, $message = '')
{
    return [
        'errno' => $errno,
        'msg' => $message,
    ];
}

/**
 * 判断是否含有错误消息
 * @param $data
 * @return bool
 */
function isError($data)
{
    if (empty($data) || !is_array($data) || !array_key_exists('errno', $data) || (array_key_exists('errno', $data) && $data['errno'] == 0)) {
        return false;
    } else {
        return true;
    }
}

/**
 * 是否开启消息推送
 * @return mixed
 */
function isOpenNoticePush()
{
    return config('config.notice_push');
}

/**
 * 日期格式标准输出
 * @param string $datetime 输入日期
 * @param string $format 输出格式
 * @return false|string
 */
function format_datetime($datetime, $format = 'Y年m月d日 H:i:s')
{
    return date($format, strtotime($datetime));
}

/**
 * 当前时间
 * @return false|string
 */
function nowTime()
{
    return date('Y-m-d H:i:s', time());

}

// 判断文件或目录是否有写的权限
function is_really_writable($file)
{
    if (DIRECTORY_SEPARATOR == '/' AND @ ini_get("safe_mode") == FALSE) {
        return is_writable($file);
    }
    if (!is_file($file) OR ($fp = @fopen($file, "r+")) === FALSE) {
        return FALSE;
    }

    fclose($fp);
    return TRUE;
}

/**
 * UTF8字符串加密
 * @param string $string
 * @return string
 */
function encode($string)
{
    list($chars, $length) = ['', strlen($string = iconv('utf-8', 'gbk', $string))];
    for ($i = 0; $i < $length; $i++) {
        $chars .= str_pad(base_convert(ord($string[$i]), 10, 36), 2, 0, 0);
    }
    return $chars;
}

/**
 * UTF8字符串解密
 * @param string $string
 * @return string
 */
function decode($string)
{
    $chars = '';
    foreach (str_split($string, 2) as $char) {
        $chars .= chr(intval(base_convert($char, 36, 10)));
    }
    return @iconv('gbk', 'utf-8', $chars);
}

/**
 * 获取锁
 * @param  String $key 锁标识
 * @param  Int $expire 锁过期时间
 * @return Boolean
 */
function lock($key = '', $expire = 5)
{
    $is_lock = Cache::store('redis')->get($key);
    //不能获取锁
    if (!$is_lock) {
        Cache::store('redis')->set($key, time() + $expire);
    }

    return $is_lock ? true : false;
}

/**
 * 释放锁
 * @param  String $key 锁标识
 * @return Boolean
 */
function unlock($key = '')
{
    return Cache::store('redis')->rm($key);
}

/**
 * 下载远程文件到本地
 * @param string $url 远程图片地址
 * @return string
 */
function local_image($url)
{
    return \service\FileService::download($url)['url'];
}

/**
 * 提取base64
 * @param $base64_url
 * @return array
 */
function decodeFile($base64_url)
{
    preg_match('/^data:image\/(\w+);base64/', $base64_url, $out);

    $type = $out[1];
    $type_param = 'data:image/' . $type . ';base64,';
    $fileStream = str_replace($type_param, '', $base64_url);
    $fileStream = base64_decode($fileStream);

    return array(
        'type' => $type,
        'fileStream' => $fileStream
    );

}

//不同环境下获取真实的IP
function get_ip()
{
    //判断服务器是否允许$_SERVER
    if (isset($_SERVER)) {
        if (isset($_SERVER['HTTP_X_FORWARDED_FOR'])) {
            $realip = $_SERVER['HTTP_X_FORWARDED_FOR'];
        } elseif (isset($_SERVER['HTTP_CLIENT_IP'])) {
            $realip = $_SERVER['HTTP_CLIENT_IP'];
        } else {
            $realip = $_SERVER['REMOTE_ADDR'];
        }
    } else {
        //不允许就使用getenv获取
        if (getenv("HTTP_X_FORWARDED_FOR")) {
            $realip = getenv("HTTP_X_FORWARDED_FOR");
        } elseif (getenv("HTTP_CLIENT_IP")) {
            $realip = getenv("HTTP_CLIENT_IP");
        } else {
            $realip = getenv("REMOTE_ADDR");
        }
    }

    return $realip;
}


/**
 * DES 加密
 * @param $dat 需要加密的字符串
 * @param $key 加密密钥
 * @return string
 */
function javaDesEncrypt($dat, $key)
{
    /*$block = mcrypt_get_block_size(MCRYPT_DES, MCRYPT_MODE_ECB);
    $len = strlen($dat);
    $padding = $block - ($len % $block);
    $dat .= str_repeat(chr($padding),$padding);
    return bin2hex(mcrypt_encrypt(MCRYPT_DES, $key, $dat, MCRYPT_MODE_ECB));*/

    return bin2hex(openssl_encrypt($dat, 'des-ecb', $key, OPENSSL_RAW_DATA));
}

/**
 * DES 解密
 * @param $dat 需要解密的字符串
 * @param $key 加密密钥
 * @return bool|string
 */
function javaDesDecrypt($dat, $key)
{
    /*$str = hex2bin($dat);
    $str = mcrypt_decrypt(MCRYPT_DES, $key, $str, MCRYPT_MODE_ECB);
    $pad = ord($str[($len = strlen($str)) - 1]);
    return substr($str, 0, strlen($str) - $pad);*/

    $str = hex2bin($dat);
    return openssl_decrypt($str, 'des-ecb', $key, OPENSSL_RAW_DATA);
}

