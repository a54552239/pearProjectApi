<?php

namespace app\project\controller;

use controller\BasicApi;
use think\facade\Request;

class Notify extends BasicApi
{
    private $session;

    public function __construct()
    {
        parent::__construct();
        if (!$this->model) {
            $this->model = new \app\common\Model\Notify();
        }
        $this->session = getCurrentMember();
    }

    /**
     * 显示资源列表
     *
     * @return void
     * @throws \think\exception\DbException
     */
    public function index()
    {
        $where = [];
        $where[] = ['to', '=', getCurrentMember()['code']];
        $where[] = ['terminal', '=', 'project'];
        $params = Request::post();
        foreach (['title'] as $key) {
            (isset($params[$key]) && $params[$key] !== '') && $where[] = [$key, 'like', "%{$params[$key]}%"];
        }
//        foreach (['type'] as $key) {
//            (isset($params[$key]) && $params[$key] !== '') && $where[] = [$key, '=', $params['type']];
//        }
        if (isset($params['date']) && $params['date'] !== '') {
            list($start, $end) = explode('~', $params['date']);
            $where[] = ['create_time', 'between', ["{$start} 00:00:00", "{$end} 23:59:59"]];
        }

        $result = $this->model->_list($where);

        $this->success('', $result);


    }

    /**
     * 获取未读消息
     */
    public function noReads()
    {
        $list = $this->model->listTypeFormat(['is_read' => 0, 'to' => getCurrentMember()['code'], 'terminal' => 'project'], 5);
        $this->success('', $list);
    }

    /**
     * 设置已读
     * @throws \Exception
     */
    public function setReadied()
    {
        $ids = Request::post('ids');
        if (!$ids) {
            $this->error("请选择消息！");
        }
        $ids = json_decode($ids);
        $updateData = [];
        foreach ($ids as $id) {
            $data = [
                'id' => $id,
                'is_read' => 1,
                'read_time' => nowTime(),
            ];
            $updateData[] = $data;
        }
        $result = $this->model->saveAll($updateData);
        if ($result) {
            $this->success('', $result);
        }
        $this->error("操作失败，请稍候再试！");
    }

    /**
     * 清空所有消息
     */
    public function _clearAll()
    {
        \app\common\Model\Notify::update(['is_read' => 1, 'read_time' => nowTime()], ['to' => getCurrentMember()['code'], 'is_read' => 0]);
        $this->success();
    }

    /**
     *  批量删除
     * @throws \Exception
     */
    public function batchDel()
    {
        $ids = Request::post('ids');
        if (!$ids) {
            $this->error("请选择消息！");
        }
        $ids = json_decode($ids);
        $result = $this->model->whereIn('id', $ids)->delete();
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
     * @throws \think\Exception\DbException
     */
    public function read(Request $request)
    {
        $this->success('', $this->model->get($request::post('id')));
    }


    /**
     * 删除指定资源
     *
     * @param int $id
     * @return \think\Response
     */
    public function delete($id = 0)
    {
        $this->model->destroy(Request::post('id'));
        $this->success('');
    }
}
