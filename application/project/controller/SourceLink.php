<?php

namespace app\project\controller;

use app\common\Model\Member;
use app\common\Model\MemberAccount;
use app\common\Model\Notify;
use app\common\Model\ProjectCollection;
use app\common\Model\ProjectMember;
use app\common\Model\SystemConfig;
use controller\BasicApi;
use OSS\Core\OssException;
use service\FileService;
use service\NodeService;
use service\RandomService;
use think\Exception;
use think\exception\PDOException;
use think\facade\Request;
use think\File;

/**
 */
class SourceLink extends BasicApi
{
    public function __construct()
    {
        parent::__construct();
        if (!$this->model) {
            $this->model = new \app\common\Model\SourceLink();
        }
    }


    /**
     * 删除资源
     * @return void
     * @throws \Exception
     */
    public function delete()
    {
        $code = Request::post('sourceCode');
        if (!$code) {
            $this->error("资源不存在");
        }
        $this->model->deleteSource($code);
        $this->success('');
    }
}
