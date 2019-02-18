<?php

namespace app\common\Model;

use service\FileService;
use service\RandomService;
use think\Db;
use think\facade\Hook;
use think\File;

/**
 * 项目
 * Class Organization
 * @package app\common\Model
 */
class Project extends CommonModel
{
    protected $append = [];
    protected $defaultStages = [['name' => '待处理'], ['name' => '进行中'], ['name' => '已完成']];

    public static function getEffectInfo($id)
    {
        return self::where(['id' => $id, 'deleted' => 0, 'archive' => 0])->find();
    }

    public function getMemberProjects($memberCode = '', $deleted = 0, $archive = 0, $page = 1, $pageSize = 10)
    {
        if (!$memberCode) {
            $memberCode = getCurrentMember()['code'];
        }
        if ($page < 1) {
            $page = 1;
        }
        $offset = ($page - 1) * $page;
        $limit = $pageSize;
        $prefix = config('database.prefix');
        $sql = "select *,p.id as id,p.name as name,p.code as code from {$prefix}project as p join {$prefix}project_member as pm on p.code = pm.project_code where pm.member_code = '{$memberCode}' and p.deleted = {$deleted} and p.archive = {$archive} order by p.id desc";
        $total = Db::query($sql);
        $total = count($total);
        $sql .= " limit {$offset},{$limit}";
        $list = Db::query($sql);
        return ['list' => $list, 'total' => $total];
    }

    /**
     * 创建项目
     * @param $memberCode
     * @param $orgCode
     * @param $name
     * @param string $description
     * @param string $templateCode
     * @return Project
     * @throws \Exception
     */
    public function createProject($memberCode, $orgCode, $name, $description = '', $templateCode = '')
    {
        //d85f1bvwpml2nhxe94zu7tyi
        Db::startTrans();
        try {
            $project = [
                'create_time' => nowTime(),
                'code' => createUniqueCode('project'),
                'name' => $name,
                'description' => $description,
                'organization_code' => $orgCode,
                'cover' => FileService::getFilePrefix() . 'static/image/default/project-cover.png'
            ];
            $result = self::create($project);
            $projectMemberModel = new ProjectMember();
            $projectMemberModel->inviteMember($memberCode, $project['code'], 1);
            if ($templateCode) {
                $stages = TaskStagesTemplate::where(['project_template_code' => $templateCode])->order('sort desc,id asc')->select();
            } else {
                $stages = $this->defaultStages;
            }
            if ($stages) {
                foreach ($stages as $key => $stage) {
                    $taskStage = [
                        'project_code' => $project['code'],
                        'name' => $stage['name'],
                        'sort' => $key,
                        'code' => createUniqueCode('taskStages'),
                        'create_time' => nowTime(),
                    ];
                    $stagesResult = TaskStages::create($taskStage);
                    $taskStage['id'] = $stagesResult['id'];
                }
            }
            Db::commit();
        } catch (\Exception $e) {
            Db::rollback();
            throw new \Exception($e->getMessage(), 1);
        }
        self::projectHook(getCurrentMember()['code'], $project['code'], 'create');
        return $result;
    }

    public function edit($code, $data)
    {
        if (!$code) {
            throw new \Exception('请选择项目', 1);
        }
        $project = self::where(['code' => $code, 'deleted' => 0])->field('id', true)->find();
        if (!$project) {
            throw new \Exception('该项目在回收站中无法编辑', 1);
        }
        $result = self::update($data, ['code' => $code]);
        //TODO 项目动态
        self::projectHook(getCurrentMember()['code'], $code, 'edit');
        return $result;
    }


    /**
     * @param File $file
     * @return array|bool
     * @throws \think\Exception
     * @throws \think\exception\PDOException
     * @throws \Exception
     */
    public function uploadCover(File $file)
    {
        return $this->_uploadImg($file);
    }

    /**
     * 放入回收站
     * @param $code
     * @return Project
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public function recycle($code)
    {
        $info = self::where(['code' => $code])->find();
        if (!$info) {
            throw new \Exception('项目不存在', 1);
        }
        if ($info['deleted']) {
            throw new \Exception('项目已在回收站', 2);
        }
        $result = self::update(['deleted' => 1, 'deleted_time' => nowTime()], ['code' => $code]);
        self::projectHook(getCurrentMember()['code'], $code, 'recycle');
        return $result;
    }

    /**
     * 恢复项目
     * @param $code
     * @return Project
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public function recovery($code)
    {
        $info = self::where(['code' => $code])->find();
        if (!$info) {
            throw new \Exception('项目不存在', 1);
        }
        if (!$info['deleted']) {
            throw new \Exception('项目已恢复', 2);
        }
        $result = self::update(['deleted' => 0], ['code' => $code]);
        self::projectHook(getCurrentMember()['code'], $code, 'recovery');
        return $result;
    }

    /**
     * 项目归档
     * @param $code
     * @return Project
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public function archive($code)
    {
        $info = self::where(['code' => $code])->find();
        if (!$info) {
            throw new \Exception('项目不存在', 1);
        }
        if ($info['archive']) {
            throw new \Exception('项目已归档', 2);
        }
        $result = self::update(['archive' => 1, 'archive_time' => nowTime()], ['code' => $code]);
        self::projectHook(getCurrentMember()['code'], $code, 'archive');
        return $result;
    }

    /**
     * 恢复项目
     * @param $code
     * @return Project
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public function recoveryArchive($code)
    {
        $info = self::where(['code' => $code])->find();
        if (!$info) {
            throw new \Exception('项目不存在', 1);
        }
        if (!$info['archive']) {
            throw new \Exception('项目已恢复', 2);
        }
        $result = self::update(['archive' => 0], ['code' => $code]);
        self::projectHook(getCurrentMember()['code'], $code, 'recoveryArchive');
        return $result;
    }

    /**
     * 退出项目
     * @param $code
     * @return bool
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     * @throws \Exception
     */
    public function quit($code)
    {
        $info = self::where(['code' => $code])->find();
        if (!$info) {
            throw new \Exception('项目不存在', 1);
        }
        $where = ['project_code' => $code, 'member_code' => getCurrentMember()['code']];
        $projectMember = ProjectMember::where($where)->find();
        if (!$projectMember) {
            throw new \Exception('你不是该项目成员', 2);
        }
        if ($projectMember['is_owner']) {
            throw new \Exception('创建者不能退出项目', 3);
        }
        $result = ProjectMember::where($where)->delete();
        return $result;
    }

    /** 项目变动钩子
     * @param $memberCode
     * @param $sourceCode
     * @param string $type
     * @param string $toMemberCode
     * @param int $isComment
     * @param string $remark
     * @param string $content
     * @param string $fileCode
     * @param array $data
     * @param string $tag
     */
    public static function projectHook($memberCode, $sourceCode, $type = 'create', $toMemberCode = '', $isComment = 0, $remark = '', $content = '', $fileCode = '', $data = [], $tag = 'project')
    {
        $data = ['memberCode' => $memberCode, 'sourceCode' => $sourceCode, 'remark' => $remark, 'type' => $type, 'content' => $content, 'isComment' => $isComment, 'toMemberCode' => $toMemberCode, 'fileCode' => $fileCode, 'data' => $data, 'tag' => $tag];
        Hook::listen($tag, $data);

    }
}
