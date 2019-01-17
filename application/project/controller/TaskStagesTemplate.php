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
class TaskStagesTemplate extends BasicApi
{
    public function __construct()
    {
        parent::__construct();
        if (!$this->model) {
            $this->model = new \app\common\Model\TaskStagesTemplate();
        }
    }

    /**
     * 显示资源列表
     * @return void
     * @throws \think\exception\DbException
     */
    public function index()
    {
        $where = [];
        $code = Request::post('code');
        if (!$code) {
            $this->error("请选择一个项目");
        }
        $where[] = ['project_template_code', '=', $code];
        $list = $this->model->_list($where,'sort desc,id asc');
        $this->success('', $list);
    }

    /**
     * 新增
     * @param Request $request
     * @return void
     */
    public function save(Request $request)
    {
        $data = $request::only('name,template_code,sort');
        if (!$request::post('name')) {
            $this->error("请填写任务名称");
        }
        try {
            $result = $this->model->createTemplate($data['template_code'], $data['name'], $data['sort']);
        } catch (Exception $e) {
            $this->error($e->getMessage(), $e->getCode());;
        }
        if ($result) {
            $this->success('添加成功', $result);
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
        $data = $request::only('name,sort');
        $code = $request::post('code');
        if (!$code) {
            $this->error("请选择一个任务");
        }
        $template = $this->model->where(['code' => $code])->field('id')->find();
        if (!$template) {
            $this->error("该任务已失效");
        }
        $result = $this->model->_edit($data, ['code' => $code]);
        if ($result) {
            $this->success('编辑任务成功');
        }
        $this->error("操作失败，请稍候再试！");
    }

    /**
     * 删除任务
     * @return void
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public function delete()
    {
        $code = Request::post('code');
        if (!$code) {
            $this->error("请选择一个任务");
        }
        $this->model->deleteTemplate($code);
        $this->success('');
    }
}
