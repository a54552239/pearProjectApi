<?php

namespace app\common\middleware;

use think\Request;

/**
 * 跨域处理
 * Class Auth
 * @package app\admin\middleware
 */
class CORS
{
    /**
     * @param Request $request
     * @param \Closure $next
     * @return mixed
     */
    public function handle($request, \Closure $next)
    {

        $Origin = $request->header('Origin');
        $Headers = $request->header('Access-Control-Request-Headers');
        header('Access-Control-Allow-Origin: ' . $Origin);
        header('Access-Control-Allow-Headers: ' . $Headers);
        header('Access-Control-Allow-Credentials:true');
        header('Access-Control-Allow-Methods: GET, POST, OPTIONS');
        header('Access-Control-Max-Age: 1728000');
        header('Content-Type:text/plain charset=UTF-8');
        if (strtoupper($request->method()) == "OPTIONS") {
            header('HTTP/1.0 204 No Content');
            header('Content-Length:0');
            header('status:204');
            exit();
        }
        return $next($request);
    }
}
