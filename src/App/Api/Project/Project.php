<?php
namespace App\Api\Project;
use App\Common\CommonApi;
use App\Common\Exception\WrongRequestException;
use App\Domain\Project\Build;
use App\Domain\Project\Log;
use App\Domain\Project\File;
use App\Domain\Team\TeamUser;
use function App\getWeekTime;
use App\Model\User\User;
use function App\week;

/**
 * 项目类
 * User: vilson
 * Date: 2017/3/23 0023
 * Time: 9:34
 */
class Project extends CommonApi
{
    private static $Domain = null;

    function __construct()
    {
        if (self::$Domain == null) {
            self::$Domain = new \App\Domain\Project\Project();
        }
    }

    public function getRules()
    {
        return array(
            'getInfo' => array(
                'project_id' => array('name' => 'project_id', 'type' => 'int', 'require' => true, 'desc' => '项目id'),
            ),
            'getList' => array(
                'keyWord' => array('name' => 'keyword', 'type' => 'string', 'default' => '', 'desc' => '关键词'),
                'state' => array('name' => 'state', 'type' => 'int', 'default' => -1, 'desc' => '项目状态'),
                'page_size' => array('name' => 'page_size', 'type' => 'int', 'default' => PAGE_SIZE, 'desc' => '页面大小'),
                'page_num' => array('name' => 'page_num', 'type' => 'int', 'default' => 1, 'desc' => '页码'),
                'order' => array('name' => 'order', 'type' => 'string', 'default' => 'p.id desc', 'desc' => '排序参数，如：xx ASC,xx DESC')
            ),
            'getListForUser' => array(
                'user_id' => array('name' => 'user_id', 'type' => 'int', 'default' => 0, 'desc' => '用户id'),
                'keyWord' => array('name' => 'keyword', 'type' => 'string', 'default' => '', 'desc' => '关键词'),
                'end_time' => array('name' => 'end_time', 'type' => 'string', 'default' => '', 'desc' => '截止时间'),
                'create_time' => array('name' => 'create_time', 'type' => 'string', 'default' => '', 'desc' => '开启时间'),
                'prepay_time' => array('name' => 'prepay_time', 'type' => 'string', 'default' => '', 'desc' => '预付时间'),
                'state' => array('name' => 'state', 'type' => 'int', 'default' => -1, 'desc' => '项目状态'),
                'page_size' => array('name' => 'page_size', 'type' => 'int', 'default' => PAGE_SIZE, 'desc' => '页面大小'),
                'page_num' => array('name' => 'page_num', 'type' => 'int', 'default' => 1, 'desc' => '页码'),
                'order' => array('name' => 'order', 'type' => 'string', 'default' => 'p.id desc', 'desc' => '排序参数，如：xx ASC,xx DESC')
            ),
            'selectProjectUser' => array(
                'project_id' => array('name' => 'project_id', 'type' => 'int', 'require' => true, 'desc' => '项目id'),
                'keyWord' => array('name' => 'keyword', 'type' => 'string', 'default' => '', 'desc' => '关键词'),
                'order' => array('name' => 'order', 'type' => 'string', 'default' => 'u.account asc', 'desc' => '排序参数，如：xx ASC,xx DESC')
            ),
            'getProjectUserList' => array(
                'project_id' => array('name' => 'project_id', 'type' => 'int', 'require' => true, 'desc' => '项目id'),
                'task_id' => array('name' => 'task_id', 'type' => 'int', 'default' => 0, 'desc' => '任务id'),
                'keyWord' => array('name' => 'keyword', 'type' => 'string', 'default' => '', 'desc' => '关键词'),
                'order' => array('name' => 'order', 'type' => 'string', 'default' => 'pu.join desc', 'desc' => '排序参数，如：xx ASC,xx DESC')
            ),
            'addProjectUser' => array(
                'project_id' => array('name' => 'project_id', 'type' => 'int', 'require' => true, 'desc' => '项目id'),
                'user_id' => array('name' => 'user_id', 'type' => 'int', 'require' => true, 'desc' => '用户id'),
            ),
            'addProject' => array(
                'name' => array('name' => 'name', 'type' => 'string', 'require' => true, 'desc' => '项目名称'),
                'access_control_type' => array('name' => 'access_control_type', 'type' => 'string', 'default' => 'open', 'desc' => '项目公开性'),
                'project_desc' => array('name' => 'project_desc', 'type' => 'string', 'require' => true, 'desc' => '项目描述'),
                'level_id' => array('name' => 'level_id', 'require' => true, 'desc' => '项目评级id'),
                'type_id' => array('name' => 'type_id', 'desc' => '项目类型id'),
                'ticket' => array('name' => 'ticket', 'desc' => '项目标记'),
                'end' => array('name' => 'end', 'type' => 'string', 'desc' => '项目截止日期'),
                'prepayDate' => array('name' => 'prepayDate', 'type' => 'string', 'desc' => '项目预付日期'),
            ),
            'editProject' => array(
                'id' => array('name' => 'project_id', 'type' => 'int', 'desc' => '项目id'),
                'name' => array('name' => 'name', 'type' => 'string', 'desc' => '项目名称'),
                'access_control_type' => array('name' => 'access_control_type', 'type' => 'string', 'desc' => '项目公开性'),
                'project_desc' => array('name' => 'project_desc', 'type' => 'string', 'desc' => '项目描述'),
                'status' => array('name' => 'status', 'type' => 'string', 'desc' => '项目状态'),
                'level_id' => array('name' => 'level_id', 'desc' => '项目评级id'),
                'type_id' => array('name' => 'type_id', 'desc' => '项目类型id'),
                'ticket' => array('name' => 'ticket', 'desc' => '项目标记'),
                'end' => array('name' => 'end', 'type' => 'string', 'desc' => '项目截止日期'),
                'prepayDate' => array('name' => 'prepayDate', 'type' => 'string', 'desc' => '项目预付日期'),
                'leader_id' => array('name' => 'leader_id', 'type' => 'int', 'desc' => '项目负责人'),
                'business_id' => array('name' => 'business_id', 'desc' => '项目业务id'),
                'schedule' => array('name' => 'schedule', 'type' => 'int', 'desc' => '项目进度'),
                'test_message' => array('name' => 'test_message', 'type' => 'string', 'desc' => '测试信息'),
                'test_ftp' => array('name' => 'test_ftp', 'type' => 'string', 'desc' => '测试FTP'),
                'online_message' => array('name' => 'online_message', 'type' => 'string', 'desc' => '上线信息'),
                'online_ftp' => array('name' => 'online_ftp', 'type' => 'string', 'desc' => '上线FTP'),
                'other_message' => array('name' => 'other_message', 'type' => 'string', 'desc' => '其他信息'),
            ),
            'doArchive' => array(
                'id' => array('name' => 'id', 'type' => 'int', 'require' => true, 'desc' => '项目id'),
                'archive' => array('name' => 'archive', 'type' => 'int', 'require' => true, 'desc' => '是否归档')
            ),
            'doComplete' => array(
                'id' => array('name' => 'id', 'type' => 'int', 'require' => true, 'desc' => '项目id')
            ),
            'checkProjectName' => array(
                'project_id' => array('name' => 'project_id', 'type' => 'int', 'default' => 0, 'desc' => '项目id'),
                'project_name' => array('name' => 'project_name', 'type' => 'string', 'require' => true, 'desc' => '项目名称'),
            ),
            'delProject' => array(
                'ids' => array('name' => 'ids', 'type' => 'Array', 'format' => 'json', 'require' => true, 'desc' => '项目id')
            ),
            'delProjectUser' => array(
                'user_id' => array('name' => 'user_id', 'type' => 'int', 'default' => 0, 'desc' => '成员id'),
                'project_id' => array('name' => 'project_id', 'type' => 'int', 'require' => true, 'desc' => '项目id')
            ),
            'batchDownloadTaskFile' => array(
                'ids' => array('name' => 'ids', 'type' => 'Array', 'format' => 'json', 'require' => true, 'desc' => '项目id')
            ),
            'getProjectFileList' => array(
                'project_id' => array('name' => 'project_id', 'type' => 'int', 'require' => true, 'desc' => '项目id'),
                'keyWord' => array('name' => 'keyword', 'type' => 'string', 'default' => '', 'desc' => '关键词'),
            ),
            'deleteFile' => array(
                'file_id' => array('name' => 'file_id', 'type' => 'int', 'require' => true, 'desc' => '文件id')
            ),
            'getProjectLogList' => array(
                'project_id' => array('name' => 'project_id', 'type' => 'int', 'require' => true, 'desc' => '项目id'),
                'contain_task_log' => array('name' => 'contain_task_log', 'type' => 'int', 'default' => 0, 'desc' => '是否包含任务日志'),
                'keyWord' => array('name' => 'keyword', 'type' => 'string', 'default' => '', 'desc' => '关键词'),
                'page_size' => array('name' => 'page_size', 'type' => 'int', 'default' => PAGE_SIZE, 'desc' => '页面大小'),
                'page_num' => array('name' => 'page_num', 'type' => 'int', 'default' => 1, 'desc' => '页码'),
                'order' => array('name' => 'order', 'type' => 'string', 'default' => 'id desc', 'desc' => '排序参数，如：xx ASC,xx DESC')
            ),
            'getBuildInfo' => array(
                'id' => array('name' => 'id', 'type' => 'int', 'require' => true, 'desc' => '版本id'),
            ),
            'getProjectBuildList' => array(
                'project_id' => array('name' => 'project_id', 'type' => 'int', 'require' => true, 'desc' => '项目id'),
                'keyWord' => array('name' => 'keyword', 'type' => 'string', 'default' => '', 'desc' => '关键词'),
                'page_size' => array('name' => 'page_size', 'type' => 'int', 'default' => 1000, 'desc' => '页面大小'),
                'page_num' => array('name' => 'page_num', 'type' => 'int', 'default' => 1, 'desc' => '页码'),
                'order' => array('name' => 'order', 'type' => 'string', 'default' => 'id desc', 'desc' => '排序参数，如：xx ASC,xx DESC')
            ),
            'addProjectBuild' => array(
                'id' => array('name' => 'id', 'type' => 'int', 'require' => true, 'desc' => '版本id'),
                'name' => array('name' => 'name', 'type' => 'string', 'require' => true, 'desc' => '版本名称'),
                'desc' => array('name' => 'desc', 'type' => 'string', 'require' => true, 'desc' => '版本描述'),
                'project' => array('name' => 'project_id', 'require' => true, 'desc' => '项目id'),
            ),
            'deleteProjectBuild' => array(
                'id' => array('name' => 'id', 'type' => 'int', 'require' => true, 'desc' => '版本id')
            ),
            'getProjectStatisticsByAll' => array(
                'type' => array('name' => 'type', 'type' => 'string', 'default' => 'week', 'desc' => '统计类型'),
                'jixiao' => array('name' => 'jixiao', 'type' => 'boolean', 'default' => false, 'desc' => '是否统计绩效'),
            ),
            'exportTeamTimeProjectReport' => array(
                'team_id' => array('name' => 'team_id', 'type' => 'int', 'default' => 0, 'desc' => '团队id'),
                'time_type' => array('name' => 'time_type', 'type' => 'string', 'default' => 'week', 'desc' => '时间段类型，week：周，month：月，year：年')
            ),
        );
    }


    /**
     * 项目统计
     * @desc 项目统计
     * @return array
     */
    public function getProjectStatisticsByAll()
    {
        return self::$Domain->getProjectStatisticsByAll($this->type, $this->jixiao);
    }

    /**
     * 导出团队项目周报
     * @desc 导出团队项目周报
     */
    public function exportTeamTimeProjectReport()
    {
        unset($this->user_info);
        self::$Domain->exportTeamTimeProjectReport($this->team_id, $this->time_type);
    }

    /**
     * 选择项目成员
     * @desc 选择项目成员
     */
    public function selectProjectUser()
    {
        unset($this->user_info);
        return self::$Domain->selectProjectUser($this);
    }

    /**
     * 获取项目成员
     * @desc 获取项目成员
     */
    public function getProjectUserList()
    {
        unset($this->user_info);
        return self::$Domain->getProjectUserList($this);
    }

    /**
     * 添加项目成员
     * @desc 添加项目成员
     */
    public function addProjectUser()
    {
        self::$Domain->addProjectUser($this->project_id, $this->user_id);
    }

    /**
     * 添加项目
     * @desc 添加项目
     */
    public function addProject()
    {
        $user_id = $this->user_info['id'];
        unset($this->user_info);
        self::$Domain->addProject($this, $user_id);
    }

    /**
     * 编辑项目
     * @desc 编辑项目
     * @throws \App\Common\Exception\WrongRequestException
     * @throws \PhalApi\Exception\BadRequestException
     */
    public function editProject()
    {
        unset($this->user_info);
        $data = get_object_vars($this);
        self::$Domain->editProject($this->id, $data);
    }

    /**
     * 获取项目信息
     * @desc 根据项目id获取项目信息
     * @return string prepay_date 交付日期（格式化）
     * @return string project_date 起止日期（格式化）
     * @return string complete_date 完成日期（格式化）
     */
    public function getInfo()
    {
        return self::$Domain->getProjectInfo(array('id' => $this->project_id));
    }

    /**
     * 获取所有项目列表
     * @desc 获取所有项目列表
     */
    public function getList()
    {
        unset($this->user_info);
        return self::$Domain->getList($this);
    }

    /**
     * 获取项目状态列表
     * @desc 获取项目状态列表
     */
    public function getProjectStateList()
    {
        return self::$Domain->getProjectStateList();
    }

    /**
     * 获取项目类型列表
     * @desc 获取项目类型列表
     */
    public function getProjectTypeList()
    {
        return self::$Domain->getProjectTypeList();
    }

    /**
     * 获取项目标记列表
     * @desc 获取项目标记列表
     */
    public function getProjectTicketList()
    {
        return self::$Domain->getProjectTicketList();
    }

    /**
     * 获取用户项目列表
     * @desc 根据查询条件获取当前用户的项目列表
     */
    public function getListForUser()
    {
        if ($this->user_id == 0) {
            $this->user_id = $this->user_info['id'];
        }
        unset($this->user_info);
        return self::$Domain->getListForUser($this);
    }

    /**
     * 项目归档
     * @desc 项目归档或重新激活
     */
    public function doArchive()
    {
        self::$Domain->doArchive(array('id' => $this->id, 'archive' => $this->archive));
    }

    /**
     * 项目完成
     * @desc 标记项目为已完成，记录完成时间
     */
    public function doComplete()
    {
        self::$Domain->doComplete($this->id);
    }

    /**
     * 删除项目
     * @desc 删除一个项目
     */
    public function delProject()
    {
        self::$Domain->delProject($this->ids);
    }

    /**
     * 删除项目
     * @desc 删除一个项目
     */
    public function batchDownloadTaskFile()
    {
        $domain_task_file = new File();
        $domain_task_file->batchDownloadTaskFile($this->ids);
    }

    /**
     * 项目重名检测
     * @desc 项目重名检测
     */
    public function checkProjectName()
    {
        self::$Domain->checkProjectName($this->member_info['id'], $this->project_name, $this->project_id);
    }

    /**
     * 移除项目成员
     * @desc 移除项目成员
     */
    public function delProjectUser()
    {
        self::$Domain->delProjectUser($this->project_id, $this->user_id);
    }

    /**
     * 获取项目文件列表
     * @desc 获取项目文件列表
     * @return array
     */
    public function getProjectFileList()
    {
        return self::$Domain->getProjectFileList($this->project_id, $this->keyWord);
    }

    /**
     * 删除文件
     * @desc 删除文件
     */
    public function deleteFile()
    {
        self::$Domain->deleteFile($this->file_id);
    }

    /**
     * 获取项目日志列表
     * @desc 获取项目日志列表
     * @return array
     */
    public function getProjectLogList()
    {
        $domain_project_log = new Log();
        return $domain_project_log->getList($this);
    }

    /**
     * 添加版本
     * @desc 添加版本
     */
    public function addProjectBuild()
    {
        $user_id = $this->user_info['id'];
        unset($this->user_info);
        $domain_project_build = new Build();
        $domain_project_build->addProjectBuild($this, $user_id);
    }

    /**
     * 获取项目版本列表
     * @desc 获取项目版本列表
     * @return array
     */
    public function getProjectBuildList()
    {
        $domain_project_build = new Build();
        return $domain_project_build->getList($this);
    }

    /**
     * 获取项目版本列表
     * @desc 获取项目版本列表
     * @return array
     */
    public function getBuildInfo()
    {
        $domain_project_build = new Build();
        return $domain_project_build->getInfo(array('id' => $this->id));
    }

    public function deleteProjectBuild()
    {
        $domain_project_build = new Build();
        return $domain_project_build->delBuild($this->id);
    }
}