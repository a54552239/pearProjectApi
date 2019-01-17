<?php

namespace app\project\controller\project;

use app\common\Model\Member;
use app\common\Model\MemberAccount;
use app\common\Model\Notify;
use app\common\Model\SystemConfig;
use controller\BasicApi;
use service\FileService;
use service\NodeService;
use think\facade\Request;
use think\File;

/**
 */
class Index extends BasicApi
{
    public function __construct()
    {
        parent::__construct();
        if (!$this->model) {
            $this->model = new \app\common\Model\Project();
        }
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
        $params = Request::post();
        foreach (['name'] as $key) {
            (isset($params[$key]) && $params[$key] !== '') && $where[] = [$key, 'like', "%{$params[$key]}%"];
        }
        foreach (['state'] as $key) {
            (isset($params[$key]) && $params[$key] !== '') && $where[] = [$key, '=', $params['state']];
        }
        if (isset($params['date']) && $params['date'] !== '') {
            list($start, $end) = explode('~', $params['date']);
            $where[] = ['regdate', 'between', ["{$start} 00:00:00", "{$end} 23:59:59"]];
        }
        $list = $this->model->_list($where);
        $result = ['list' => $list];
        $this->success('', $result);


    }

    /**
     * 新增
     *
     * @param Request $request
     * @return void
     */
    public function save(Request $request)
    {
        $data = $request::only('name,address,lng,lat,phone,type_id,open_time,close_time,areas');

        list($data['province'], $data['city'], $data['area']) = json_decode($data['areas']);
        unset($data['areas']);

        $data['landlord_id'] = $this->session['landlord_id'];
        $data['status'] = 0;
        if (empty($data['landlord_id'])) {
            $this->success('', '');
        }
        $result = $this->model->_add($data);
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
     * 保存
     *
     * @param Request $request
     * @return void
     */
    public function edit(Request $request)
    {
        $data = $request::only('id,name,address,lng,lat,phone,type_id,open_time,close_time,areas');

        list($data['province'], $data['city'], $data['area']) = json_decode($data['areas']);
        unset($data['areas']);

        //编辑后重新审核
        $data['status'] = 0;
        $result = $this->model->_edit($data);
        if ($result) {
            $this->success('');
        }
        $this->error("操作失败，请稍候再试！");
    }

    /**
     * 删除指定资源
     *
     * @param  int $id
     * @return \think\Response
     */
    public function delete($id = 0)
    {
        $this->model->destroy(Request::post('id'));
        $this->success('');
    }

}
