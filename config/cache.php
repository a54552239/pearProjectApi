<?php
// +----------------------------------------------------------------------
// | ThinkPHP [ WE CAN DO IT JUST THINK ]
// +----------------------------------------------------------------------
// | Copyright (c) 2006~2018 http://thinkphp.cn All rights reserved.
// +----------------------------------------------------------------------
// | Licensed ( http://www.apache.org/licenses/LICENSE-2.0 )
// +----------------------------------------------------------------------
// | Author: liu21st <liu21st@gmail.com>
// +----------------------------------------------------------------------
use think\facade\Env;

// +----------------------------------------------------------------------
// | 缓存设置
// +----------------------------------------------------------------------

if (Env::get('cache.type', 'redis') == 'redis') {
    return [
        // 驱动方式
        'type' => 'redis',
        // 服务器地址
        'host' => Env::get('redis.host', '127.0.0.1'),
        // 密码
        'password' => Env::get('redis.password', ''),
        // 端口
        'port' => Env::get('redis.port', 6379),
        // 缓存保存目录
        'path' => Env::get('cache.path', './runtime/cache'),
        // 全局缓存有效期（0为永久有效）
        'expire' => Env::get('cache.expire', 0),
    ];
} else {
    return [
        // 驱动方式
        'type' => 'File',
        // 缓存保存目录
        'path' => '',
        // 缓存前缀
        'prefix' => '',
        // 缓存有效期 0表示永久缓存
        'expire' => Env::get('cache.expire', 0),
    ];
}
