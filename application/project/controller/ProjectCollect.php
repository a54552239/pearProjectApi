<?php

namespace app\project\controller;

use app\common\Model\Member;
use app\common\Model\MemberAccount;
use controller\BasicApi;
use think\facade\Request;

/**
 * 项目收藏
 */
class ProjectCollect extends BasicApi
{
    public function __construct()
    {
        parent::__construct();
        if (!$this->model) {
            $this->model = new \app\common\Model\ProjectCollection();
        }
    }

    /**
     * 收藏项目
     */
    public function collect()
    {
        $data = Request::only('projectCode,type');
        if (!$data['projectCode']) {
            $this->error('请先选择项目');
        }
        $project = \app\common\Model\Project::where(['code' => $data['projectCode']])->field('code')->find();
        try {
            $member = getCurrentMember();
            $this->model->collect($member['code'], $project['code'], $data['type']);
        } catch (\Exception $e) {
            $this->error($e->getMessage(), $e->getCode());;
        }
        $str = $data['type'] == 'collect' ? '加入收藏成功' : '取消收藏成功';
        $this->success($str);
    }
}
