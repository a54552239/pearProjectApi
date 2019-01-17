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
class Department extends BasicApi
{
    public function __construct()
    {
        parent::__construct();
        if (!$this->model) {
            $this->model = new \app\common\Model\Department();
        }
    }

    /**
     * 显示资源列表
     * @return void
     * @throws \think\exception\DbException
     */
    public function index()
    {
        $orgCode = getCurrentOrganizationCode();
        $where = [];
        $pcode = Request::post('pcode', '');
        $where[] = ['organization_code', '=', $orgCode];
        $where[] = ['pcode', '=', $pcode];
        $list = $this->model->_list($where,'id asc');
        if ($list['list']) {
            foreach ($list['list'] as &$item) {
                $item['hasNext'] = false;
                $hasNext = $this->model->where(['pcode' => $item['code']])->find();
                if ($hasNext) {
                    $item['hasNext'] = true;
                }
            }
        }
        $this->success('', $list);
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
        $department = $this->model->where(['code' => $request::post('departmentCode')])->field('id', true)->find();
        if (!$department) {
            $this->notFound();
        }
        $this->success('', $department);
    }

    /**
     * 新增
     * @param Request $request
     * @return void
     */
    public function save(Request $request)
    {
        $data = $request::only('name,parentDepartmentCode');
        if (!$request::post('name')) {
            $this->error("请填写部门名称");
        }
        try {
            $result = $this->model->createDepartment($data['name'], $data['parentDepartmentCode']);
        } catch (Exception $e) {
            $this->error($e->getMessage(), $e->getCode());;
        }
        if ($result) {
            $this->success('', $result);
        }
        $this->error("操作失败，请稍候再试！");
    }

    /**
     * 保存
     * @param Request $request
     * @return void
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public function edit(Request $request)
    {
        $data = $request::only('name');
        $code = $request::post('departmentCode');
        if (!$code) {
            $this->error("请选择一个部门");
        }
        $department = $this->model->where(['code' => $code])->field('id')->find();
        if (!$department) {
            $this->error("该部门已失效");
        }
        $result = $this->model->_edit($data, ['code' => $code]);
        if ($result) {
            $this->success('',$result);
        }
        $this->error("操作失败，请稍候再试！");
    }

    /**
     * 删除部门
     * @return void
     * @throws \Exception
     */
    public function delete()
    {
        $code = Request::post('departmentCode');
        if (!$code) {
            $this->error("请选择一个部门");
        }
        $this->model->deleteDepartment($code);
        $this->success('');
    }
}
