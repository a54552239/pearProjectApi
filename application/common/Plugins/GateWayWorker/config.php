<?php
define('SERVER_ADDRESS', '192.168.0.159');//服务注册地址，需为内网IP地址
define('SERVER_PORT', '2346');//服务注册端口
define('CLIENT_PORT', '2345');//客户端监听端口

//ssl配置 请使用绝对路径。不开启可以不用关注
define('USE_SSL', false);//是否使用ssl
define('LOCAL_CERT', '/www/wwwroot/EasyProjectApi/server.pem');// 证书路径也可以是crt文件
define('LOCAL_PK', '/www/wwwroot/EasyProjectApi/server.key');
define('VERIFY_PEER', false);
define('ALLOW_SELF_SIGNED', false);//如果是自签名证书需要开启此选项
