<?php
namespace app\common\exception;

use Exception;
use service\ToolsService;
use think\exception\Handle;
use think\exception\HttpException;
use think\exception\ValidateException;

class Api extends Handle
{
    public function render(Exception $e)
    {
        ToolsService::error($e->getMessage(),[],$e->getCode());

        // 参数验证错误
        if ($e instanceof ValidateException) {
            ToolsService::error($e->getError(), $e->getError(), $e->getCode());
            return json($e->getError(), 422);
        }

        // 请求异常
        if ($e instanceof HttpException && request()->isAjax()) {
            return response($e->getMessage(), $e->getStatusCode());
        }
        var_dump($e);die;

        // 其他错误交给系统处理
        return parent::render($e);
    }

}
