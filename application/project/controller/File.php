<?php

namespace app\project\controller;

use app\common\Model\Member;
use controller\BasicApi;
use service\FileService;
use think\Exception;
use think\facade\Request;


/**
 */
class File extends BasicApi
{
    public function __construct()
    {
        parent::__construct();
        if (!$this->model) {
            $this->model = new \app\common\Model\File();
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
        $memberCode = getCurrentMember()['code'];
        $projectCode = Request::param('projectCode');
        $deleted = Request::param('deleted', 0);
        if (!$projectCode) {
            $this->error("请选择项目");
        }
        $where = [];
//        $where[] = ['organization_code', '=', $orgCode];
        $where[] = ['project_code', '=', $projectCode];
//        $where[] = ['create_by', '=', $memberCode];
        $where[] = ['deleted', '=', $deleted];
        $list = $this->model->_list($where);
        if ($list['list']) {
            foreach ($list['list'] as &$item) {
                $item['creatorName'] = '';
                $member = Member::where(['code' => $item['create_by']])->find();
                if ($member) {
                    $item['creatorName'] = $member['name'];
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
        $file = $this->model->where(['code' => $request::post('fileCode')])->field('id', true)->find();
        if (!$file) {
            $this->notFound();
        }
        $this->success('', $file);
    }


    /**
     * 文件上传
     * @throws Exception
     * @throws \OSS\Core\OssException
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     * @throws \think\exception\PDOException
     */
    public function uploadFiles()
    {
        $data = Request::post();
        $fileName = $data['identifier'];
        $orgFileName = $data['filename'];
        $chunkNumber = $data['chunkNumber'];
        $totalChunks = $data['totalChunks'];
        $file = Request::file('file');
        $orgCode = getCurrentOrganizationCode();
        $memberCode = getCurrentMember()['code'];
        $date = date('Ymd', time());
        $ticket = date('YmdHis', time());
        $path = config('upload.base_path') . config('upload.file_temp') . "/{$orgCode}/{$memberCode}/$date/";
        $saveName = $fileName . "-{$chunkNumber}";
        try {
            $uploadInfo = _uploadFile($file, $path, $saveName);
        } catch (\Exception $e) {
            $this->error($e->getMessage(), 500);
        }
        $info = $uploadInfo['uploadInfo'];

        $fileData = [
            'extension' => $info->getExtension(),
            'file_type' => $info->getInfo()['type'],
        ];
        $result = [];
        $type = empty($file_storage) ? sysconf('storage_type') : $file_storage;
        if ($chunkNumber == $totalChunks) {
            $fileList = [];
            $blob = '';
            for ($i = 1; $i <= $totalChunks; $i++) {
                $ext = explode('.', $orgFileName);
                $ext = $ext[count($ext) - 1];
                $fileUrl = "{$path}/{$fileName}-{$i}.{$ext}";
                $site_url = FileService::getFileUrl($fileUrl, 'local');
                $blob .= file_get_contents($site_url);
                $fileList[] = env('root_path') . $fileUrl;
            }
            $path = config('upload.base_path') . config('upload.file') . "/{$orgCode}/{$memberCode}/$date/$ticket-$orgFileName";
            $result = FileService::$type($path, $blob);
            $fileData['size'] = $data['totalSize'];
            $fileData['path_name'] = $result['key'];
            $fileData['file_url'] = $result['url'];
            $fileData['title'] = FileService::removeSuffix($data['filename']);
            $fileData['size'] = $data['totalSize'];
            !isset($data['taskCode']) && $data['taskCode'] = '';
            $fileResult = \app\common\Model\File::createFile($data['projectCode'], $fileData);
            //文件碎片移除
            foreach ($fileList as $file) {
                @unlink($file);
            }
            $fileInfo = \app\common\Model\File::where(['code' => $fileResult['code']])->find();
            if ($data['taskCode']) {
                \app\common\Model\SourceLink::createSource('file', $fileResult['code'], 'task', $data['taskCode']);
            }
            \app\common\Model\Project::projectHook(getCurrentMember()['code'],  $data['projectCode'], 'uploadFile','',0,'','',$fileResult['code'],['title' => $fileInfo['fullName'], 'url' => $fileResult['file_url']]);
        }

        $project = \app\common\Model\Project::where(['code' => $data['projectCode']])->find();
        $result['projectName'] = $project['name'];
        $this->success('', $result);
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
        $data = $request::only('title');
        $code = $request::post('fileCode');
        if (!$code) {
            $this->error("请选择一个文件");
        }
        $file = $this->model->where(['code' => $code])->field('id')->find();
        if (!$file) {
            $this->error("该文件已失效");
        }
        $result = $this->model->_edit($data, ['code' => $code]);
        if ($result) {
            $this->success('', $result);
        }
        $this->error("操作失败，请稍候再试！");
    }

    /**
     * 放入回收站
     */
    public function recycle()
    {
        try {
            $this->model->recycle(Request::post('fileCode'));
        } catch (\Exception $e) {
            $this->error($e->getMessage(), $e->getCode());;
        }
        $this->success('');
    }

    /**
     * 恢复
     */
    public function recovery()
    {
        try {
            $this->model->recovery(Request::post('fileCode'));
        } catch (\Exception $e) {
            $this->error($e->getMessage(), $e->getCode());;
        }
        $this->success('');
    }

    /**
     * 删除文件
     * @return void
     * @throws \Exception
     */
    public function delete()
    {
        $code = Request::post('fileCode');
        if (!$code) {
            $this->error("请选择一个文件");
        }
        $this->model->deleteFile($code);
        $this->success('');
    }
}
