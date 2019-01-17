<?php
return [
    // 系统权限访问管理
    \app\project\middleware\Auth::class,
    \app\project\middleware\ProjectAuth::class,
];
