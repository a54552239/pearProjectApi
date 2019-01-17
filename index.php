<?php

namespace think;
// 加载基础文件
require __DIR__ . '/thinkphp/base.php';

// think文件检查，防止TP目录计算异常
file_exists('think') || touch('think');

// 执行应用并响应
Container::get('app', [__DIR__ . '/application/'])->run()->send();
