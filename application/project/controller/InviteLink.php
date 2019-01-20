<?php

namespace app\project\controller;

use controller\BasicApi;
use think\db\exception\DataNotFoundException;
use think\db\exception\ModelNotFoundException;
use think\exception\DbException;
use think\facade\Request;

class InviteLink extends BasicApi
{
    public function __construct()
    {
        parent::__construct();
        if (!$this->model) {
            $this->model = new \app\common\Model\InviteLink();
        }
    }


    /**
     * 新增
     *
     * @param Request $request
     * @return void
     */
    public function save(Request $request)
    {
        $data = $request::only('inviteType,sourceCode');


        try {
            $result = \app\common\Model\InviteLink::createInvite($data['inviteType'], $data['sourceCode']);
        } catch (\Exception $e) {
            $this->error($e->getMessage());
        }
        if ($result) {
            $this->success('', $result);
        }
        $this->error("操作失败，请稍候再试！");
    }

    /**
     * 获取信息
     *
     * @param Request $request
     * @return void
     */
    public function _read(Request $request)
    {
        $info = \app\common\Model\InviteLink::getInviteDetail($request::post('inviteCode'));
        $this->success('', $info);
    }
}
