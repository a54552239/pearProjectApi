<?php

namespace app\project\controller;

use app\common\Model\Member;
use controller\BasicApi;
use think\db\exception\DataNotFoundException;
use think\db\exception\ModelNotFoundException;
use think\exception\DbException;
use think\facade\Request;

class Organization extends BasicApi
{
    public function __construct()
    {
        parent::__construct();
        if (!$this->model) {
            $this->model = new \app\common\Model\Organization();
        }
    }

    public function _getOrgList()
    {
        $list = Member::getOrgList(getCurrentMember()['code']);
        $this->success('', $list);
    }

    /**
     * 显示资源列表
     *
     * @return void
     * @throws \think\exception\DbException
     */
    public function index()
    {
        $list = \app\common\Model\MemberAccount::where(['member_code' => getCurrentMember()['code']])->order('id asc')->select()->toArray();
        $organizationList = [];
        if ($list) {
            foreach ($list as $item) {
                $organization = $this->model->where(['code' => $item['organization_code']])->field('id', true)->find();
                if ($organization) {
                    $organizationList[] = $organization;
                }
            }
        }
        $result = ['list' => $organizationList, 'total' => count($list)];
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
        $data = $request::only('name,address,areas');

//        list($data['province'], $data['city'], $data['area']) = json_decode($data['areas']);
//        unset($data['areas']);

        try {
            $result = \app\common\Model\Organization::createOrganization(getCurrentMember(), $data);
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
     * @throws \think\Exception\DbException
     */
    public function read(Request $request)
    {
        $this->success('', $this->model->get($request::post('organizationCode')));
    }

    /**
     * 保存
     *
     * @param Request $request
     * @return void
     * @throws \Exception
     */
    public function edit(Request $request)
    {
        $data = $request::only('name,address,areas');
        $organizationCode = $request::param('organizationCode');

//        list($data['province'], $data['city'], $data['area']) = json_decode($data['areas']);
//        unset($data['areas']);

        $result = $this->model->edit($organizationCode, $data);
        if ($result) {
            $this->success('');
        }
        $this->error("操作失败，请稍候再试！");
    }

    /**
     * 删除指定资源
     *
     * @param int $id
     * @return void
     */
    public function delete($id = 0)
    {
        $this->model->destroy(Request::post('id'));
        $this->success('');
    }

    public function _quitOrganization(Request $request)
    {
        $organizationCode = $request::param('organizationCode');
        $res = $this->model->quitOrganization(getCurrentMember()['code'], $organizationCode);
        if (isError($res)) {
            $this->error($res['msg']);
        }
        $this->success('');
    }
}
