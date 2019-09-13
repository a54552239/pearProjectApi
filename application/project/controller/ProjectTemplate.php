<?php

namespace app\project\controller;

use app\common\Model\CommonModel;
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
class ProjectTemplate extends BasicApi
{
    public function __construct()
    {
        parent::__construct();
        if (!$this->model) {
            $this->model = new \app\common\Model\ProjectTemplate();
        }
    }

    /**
     * 显示资源列表
     * @return void
     * @throws \think\exception\DbException
     */
    public function index()
    {
        $prefix = config('database.prefix');
        $page = Request::param('page', 1);
        $pageSize = Request::param('pageSize', cookie('pageSize'));
        $orgCode = getCurrentOrganizationCode();
        $sql = '';
        $viewType = Request::post('viewType', -1);
        if ($viewType == -1) {
            $sql = "select * from {$prefix}project_template as pt where pt.organization_code = '{$orgCode}' or pt.is_system = 1";
        }
        if ($viewType == 1) {
            $sql = "select * from {$prefix}project_template as pt where pt.is_system = 1";
        }
        if ($viewType == 0) {
            $sql = "select * from {$prefix}project_template as pt where pt.organization_code = '{$orgCode}' and pt.is_system = 0";
        }
        $list = CommonModel::limitByQuery($sql, $page, $pageSize);
        if ($list['list']) {
            foreach ($list['list'] as &$item) {
                $item['task_stages'] = \app\common\Model\TaskStagesTemplate::where(['project_template_code' => $item['code']])->field('name')->order('sort desc,id asc')->select();
            }
        }
        $this->success('', $list);
    }

    /**
     * 新增
     * @param Request $request
     * @return void
     */
    public function save(Request $request)
    {
        $data = $request::only('name,description,cover');
        if (!$request::post('name')) {
            $this->error("请填写模板名称");
        }
        $data['organization_code'] = getCurrentOrganizationCode();
        $member = getCurrentMember();
        try {
            $result = $this->model->createProjectTemplate($member['code'], $data['organization_code'], $data['name'], $data['description'], $data['cover']);
        } catch (Exception $e) {
            $this->error($e->getMessage(), $e->getCode());;
        }
        if ($result) {
            $this->success('制作模板成功', $result);
        }
        $this->error("操作失败，请稍候再试！");
    }

    /**
     * 上传封面
     */
    public function uploadCover()
    {
        try {
            $file = $this->model->uploadCover(Request::file('cover'));
        } catch (\Exception $e) {
            $this->error($e->getMessage(), $e->getCode());;
        }
        $this->success('', $file);
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
        $data = $request::only('name,description,cover');
        $code = $request::post('code');
        if (!$code) {
            $this->error("请选择一个模板");
        }
        $template = $this->model->where(['code' => $code])->field('is_system')->find();
        if (!$template) {
            $this->error("该模板已失效");
        }
        if ($template['is_system']) {
            $this->error("无法编辑该模板");
        }
        $result = $this->model->_edit($data, ['code' => $code]);
        if ($result) {
            $this->success('编辑模板成功');
        }
        $this->error("操作失败，请稍候再试！");
    }

    /**
     * 删除模板
     * @return void
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public function delete()
    {
        $code = Request::post('code');
        if (!$code) {
            $this->error("请选择一个模板");
        }
        $this->model->deleteTemplate($code);
        $this->success('');
    }
}
