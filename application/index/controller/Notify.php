<?php

namespace app\index\controller;

use controller\BasicApi;
use think\facade\Request;

class Notify extends BasicApi
{
    public $model = null;

    public function __construct()
    {
        parent::__construct();
        if (!$this->model) {
            $this->model = new \app\common\Model\Notify();
        }
    }

    /**
     *
     * 列表
     * @return void
     * @throws \think\exception\DbException
     */
    public function listTypeFormat()
    {
        $where = [];
        $params = Request::post();
        if (isset($params['keyword']) && $params['keyword'] !== '') {
            $where[] = ['content', 'like', "%{$params['keyword']}%"];
        }
        foreach (['to', 'type'] as $key) {
            if (isset($params[$key]) && $params[$key] !== '') {
                $where[] = [$key, '=', $params[$key]];
            };
        }
        $list = $this->model->listTypeFormat($where);
        $this->success('', $list);
    }

    public function noReads()
    {
        $projectId = getCurrentOrganizationCode();
        $list = $this->model->listTypeFormat(['is_read' => 0, 'to' => 0], 5);
        $this->success('', $list);
    }

}
