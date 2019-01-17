<?php

/**
 * 模块路由及配置检测并加载
 * @include module/init.php
 */
foreach (scandir(env('app_path')) as $dir) {
    if ($dir[0] !== '.') {
        $filename = realpath(env('app_path') . "{$dir}/init.php");
        $filename && file_exists($filename) && include($filename);
    }
}

return [];
