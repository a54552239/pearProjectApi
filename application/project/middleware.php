<?php

use app\project\middleware\Auth;
use app\project\middleware\ProjectAuth;

return [
    // 系统权限访问管理
    Auth::class,
    ProjectAuth::class,
];
