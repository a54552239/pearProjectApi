<?php
/* 定义Session会话字段名 */
$session_name = 's' . substr(md5(__DIR__), -8);
$session_path = env('runtime_path') . 'sess' . DIRECTORY_SEPARATOR;
file_exists($session_path) || mkdir($session_path, 0755, true);

/* 定义Session会话参数 */
return [
    'id'             => '',
    'type'           => '',
    'prefix'         => 'ta',
    'auto_start'     => true,
    'path'           => $session_path,
    'name'           => $session_name,
    'var_session_id' => $session_name,

//    'use_trans_sid'  => 0,
//    'httponly'       => true,
//    'secure'         => true,
];
