<?php
define('SERVER_ADDRESS', '192.168.0.159');//服务注册地址
define('SERVER_PORT', '2346');//服务注册端口
define('CLIENT_PORT', '2345');//客户端监听端口
define('USE_SSL', false);//是否使用ssl
define('SSL_CONFIG', array(
    // 请使用绝对路径
    'local_cert' => '/www/wwwroot/pms/server.pem', // 也可以是crt文件
    'local_pk' => '/www/wwwroot/pms/server.key',
    'verify_peer' => false,
    'allow_self_signed' => true, //如果是自签名证书需要开启此选项
));//ssl配置
