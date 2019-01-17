<?php

use think\facade\Route;
/*  演示环境禁止操作路由 */
Route::post('project/menu/menuForbid', function () {
    return json(['code' => 404, 'msg' => '演示环境禁修改菜单权限！']);
});
Route::post('project/menu/menuEdit', function () {
    return json(['code' => 404, 'msg' => '演示环境禁修改菜单权限！']);
});
Route::post('project/menu/menuDel', function () {
    return json(['code' => 404, 'msg' => '演示环境禁修改菜单权限！']);
});
Route::post('project/index/editPassword', function () {
    return json(['code' => 404, 'msg' => '演示环境禁修改密码！']);
});
//Route::post('project/account/del', function () {
//    return json(['code' => 404, 'msg' => '演示环境禁修改账号！']);
//});
return [];
