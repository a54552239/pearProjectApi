<?php
namespace App\Api\Project;
use App\Common\CommonApi;
use App\Common\Exception\WrongRequestException;
use App\Domain\Project\File;
use App\Domain\Project\TaskLog;
use App\Domain\Project\TaskTag;
use App\Domain\Project\TaskUser;
use App\Domain\Team\Team;
use function App\getCurrentUser;
use App\Plugins\UploadFile;

/**
 * 项目任务类
 */
class Task extends CommonApi
{
    private static $Domain = null;

    public function __construct()
    {
        if (self::$Domain == null) {
            self::$Domain = new \App\Domain\Project\Task();
        }
    }

    public function getRules()
    {
        return array(
            'getInfo' => array(
                'id' => array('name' => 'task_id', 'type' => 'int', 'required' => true, 'desc' => '任务ID')
            ),
            'getList' => array(
                'project_id' => array('name' => 'project_id', 'type' => 'int', 'required' => true, 'desc' => '任务ID'),
                'task_type' => array('name' => 'task_type', 'type' => 'int', 'default' => 0, 'desc' => '任务类型'),
                'pid' => array('name' => 'pid', 'type' => 'int','default' => 0, 'desc' => '父任务id'),
                'keyWord' => array('name' => 'keyword', 'type' => 'string', 'default' => '', 'desc' => '关键词'),
                'page_size' => array('name' => 'page_size', 'type' => 'int', 'default' => 100, 'desc' => '页面大小'),
                'page_num' => array('name' => 'page_num', 'type' => 'int', 'default' => 1, 'desc' => '页码'),
                'order' => array('name' => 'order', 'type' => 'string', 'default' => 'sort asc', 'desc' => '排序参数，如：xx ASC,xx DESC')
            ),
            'getListOverview' => array(
                'team_id' => array('name' => 'team_id', 'type' => 'int', 'default' => 0, 'desc' => '团队id'),
                'include_child' => array('name' => 'include_child', 'type' => 'int', 'default' => 1, 'desc' => '是否查询下级团队'),
                'task_type' => array('name' => 'task_type', 'type' => 'int', 'default' => 0, 'desc' => '任务类型'),
                'keyWord' => array('name' => 'keyword', 'type' => 'string', 'default' => '', 'desc' => '关键词'),
                'task_state' => array('name' => 'task_state', 'type' => 'int', 'default' => -1, 'desc' => '页面大小'),
                'page_size' => array('name' => 'page_size', 'type' => 'int', 'default' => 100, 'desc' => '页面大小'),
                'page_num' => array('name' => 'page_num', 'type' => 'int', 'default' => 1, 'desc' => '页码'),
                'order' => array('name' => 'order', 'type' => 'string', 'default' => 'id desc', 'desc' => '排序参数，如：xx ASC,xx DESC')
            ),
            'getTaskForUser' => array(
                'user_id' => array('name' => 'user_id', 'type' => 'int', 'default' => 0, 'desc' => '用户id'),
                'project_id' => array('name' => 'project_id', 'type' => 'int', 'default' => 0, 'desc' => '项目id'),
                'is_executor' => array('name' => 'is_executor', 'type' => 'int', 'default' => 0, 'desc' => '是否是执行人'),
                'is_creator' => array('name' => 'is_creator', 'type' => 'int', 'default' => 0, 'desc' => '是否是创建人'),
                'is_in' => array('name' => 'is_in', 'type' => 'int', 'default' => 0, 'desc' => '是否是参与者'),
                'is_overdue' => array('name' => 'is_overdue', 'type' => 'int', 'default' => 0, 'desc' => '是否逾期'),
                'state' => array('name' => 'state', 'type' => 'int', 'default' => -1, 'desc' => '完成状态'),
                'keyWord' => array('name' => 'keyword', 'type' => 'string', 'default' => '', 'desc' => '关键词'),
                'page_size' => array('name' => 'page_size', 'type' => 'int', 'default' => 100, 'desc' => '页面大小'),
                'page_num' => array('name' => 'page_num', 'type' => 'int', 'default' => 1, 'desc' => '页码'),
                'order' => array('name' => 'order', 'type' => 'string', 'default' => 't.id desc', 'desc' => '排序参数，如：xx ASC,xx DESC')
            ),
            'delTask' => array(
                'id' => array('name' => 'id', 'type' => 'int', 'require' => true, 'desc' => '任务id')
            ),
            'getTaskTypeList' => array(),
            'getTaskLevelList' => array(),
            'getTaskTagList' => array(
                'project_id' => array('name' => 'project_id', 'type' => 'int', 'required' => true, 'desc' => '项目id'),
            ),
            'getTaskExecuteStateList' => array(),
            'addTaskUser' => array(
                'task_id' => array('name' => 'task_id', 'type' => 'int', 'required' => true, 'desc' => '项目id'),
                'user_id' => array('name' => 'user_id', 'type' => 'int', 'required' => true, 'desc' => '用户id'),
            ),
            'addTaskExecutorUser' => array(
                'task_id' => array('name' => 'task_id', 'type' => 'int', 'required' => true, 'desc' => '项目id'),
                'user_id' => array('name' => 'user_id', 'type' => 'int', 'required' => true, 'desc' => '用户id'),
            ),
            'addTask' => array(
                'name' => array('name' => 'name', 'type' => 'string', 'required' => true, 'desc' => '任务标题'),
                'executor_id' => array('name' => 'executor_id', 'type' => 'int', 'default' => 0, 'desc' => '任务执行人'),
                'pid' => array('name' => 'pid', 'type' => 'int', 'default' => 0, 'desc' => '父任务id'),
                'task_type' => array('name' => 'task_type', 'type' => 'int', 'required' => true, 'desc' => '任务提成'),
                'project' => array('name' => 'project_id', 'type' => 'int', 'required' => true, 'desc' => '项目id'),
                'task_count' => array('name' => 'task_count', 'type' => 'int', 'default' => 1, 'desc' => '添加条数'),
            ),
            'editTask' => array(
                'task_id' => array('name' => 'task_id', 'type' => 'int', 'required' => true, 'desc' => '项目id'),
                'task_type' => array('name' => 'task_type', 'type' => 'int', 'desc' => '项目类型'),
                'task_level' => array('name' => 'task_level', 'type' => 'int', 'desc' => '项目优先级'),
                'task_tag' => array('name' => 'task_tag', 'type' => 'array', 'format' => 'json', 'desc' => '项目标签'),
                'execute_state' => array('name' => 'execute_state', 'type' => 'int', 'desc' => '项目执行状态'),
                'title' => array('name' => 'title', 'type' => 'string', 'desc' => '任务标题'),
                'content' => array('name' => 'content', 'type' => 'string', 'desc' => '任务备注'),
                'begin_time' => array('name' => 'begin_time', 'type' => 'string', 'desc' => '开始时间'),
                'end_time' => array('name' => 'end_time', 'type' => 'string', 'desc' => '结束时间'),
                'remind_time' => array('name' => 'remind_time', 'type' => 'string', 'desc' => '提醒时间'),
            ),
            'addTaskComment' => array(
                'task_id' => array('name' => 'task_id', 'type' => 'int', 'required' => true, 'desc' => '任务id'),
                'memo' => array('name' => 'memo', 'type' => 'string', 'required' => true, 'desc' => '评论内容'),
            ),
            'editTaskComment' => array(
                'id' => array('name' => 'id', 'type' => 'int', 'required' => true, 'desc' => '评论id'),
                'memo' => array('name' => 'memo', 'type' => 'string', 'required' => true, 'desc' => '评论内容'),
            ),
            'delTaskComment' => array(
                'id' => array('name' => 'id', 'type' => 'int', 'required' => true, 'desc' => '评论id'),
            ),
            'addTaskTag' => array(
                'task_id' => array('name' => 'task_id', 'type' => 'int', 'required' => true, 'desc' => '任务id'),
                'project' => array('name' => 'project_id', 'type' => 'int', 'required' => true, 'desc' => '项目id'),
                'name' => array('name' => 'name', 'type' => 'string', 'required' => true, 'desc' => '标签名称'),
                'color' => array('name' => 'color', 'type' => 'string', 'required' => true, 'desc' => '标签颜色'),
            ),
            'editTaskTag' => array(
                'id' => array('name' => 'id', 'type' => 'int', 'required' => true, 'desc' => '评论id'),
                'name' => array('name' => 'name', 'type' => 'string', 'required' => true, 'desc' => '标签名称'),
                'color' => array('name' => 'color', 'type' => 'string', 'required' => true, 'desc' => '标签颜色'),
            ),
            'setTaskState' => array(
                'task_id' => array('name' => 'task_id', 'type' => 'int', 'required' => true, 'desc' => '任务id'),
                'task_state' => array('name' => 'task_state', 'type' => 'int', 'required' => true, 'desc' => '状态'),
            ),
            'exchangeTaskSort' => array(
                'list' => array('name' => 'list', 'type' => 'array', 'format'=>'json','required' => true, 'desc' => '重排后的任务id列表'),
            ),
            'delTypeTask' => array(
                'project_id' => array('name' => 'project_id', 'type' => 'int', 'required' => true, 'desc' => '项目id'),
                'type_id' => array('name' => 'type_id', 'type' => 'int', 'required' => true, 'desc' => '类型id'),
            ),
            'setTypeTaskEndTime' => array(
                'project_id' => array('name' => 'project_id', 'type' => 'int', 'required' => true, 'desc' => '项目id'),
                'type_id' => array('name' => 'type_id', 'type' => 'int', 'required' => true, 'desc' => '类型id'),
                'end_time' => array('name' => 'end_time', 'type' => 'string', 'desc' => '截止时间'),
            ),
            'setTypeTaskExecutor' => array(
                'project_id' => array('name' => 'project_id', 'type' => 'int', 'required' => true, 'desc' => '项目id'),
                'type_id' => array('name' => 'type_id', 'type' => 'int', 'required' => true, 'desc' => '类型id'),
                'user_id' => array('name' => 'user_id', 'type' => 'int', 'required' => true, 'desc' => '用户id'),
            ),
            'getTaskLog' => array(
                'task_id' => array('name' => 'task_id', 'type' => 'int', 'required' => true, 'desc' => '任务ID'),
                'show_all' => array('name' => 'show_all', 'type' => 'int', 'default' => 0, 'desc' => '是否显示全部')
            ),
            'getTaskUserList' => array(
                'task_id' => array('name' => 'task_id', 'type' => 'int', 'required' => true, 'desc' => '任务ID'),
                'page_size' => array('name' => 'page_size', 'type' => 'int', 'default' => 100, 'desc' => '页面大小'),
                'page_num' => array('name' => 'page_num', 'type' => 'int', 'default' => 1, 'desc' => '页码'),
                'order' => array('name' => 'order', 'type' => 'string', 'default' => 'id desc', 'desc' => '排序参数，如：xx ASC,xx DESC')
            ),
            'getTeamTaskLog' => array(
                'team_id' => array('name' => 'team_id', 'type' => 'int', 'default' => 0, 'desc' => '团队id'),
                'page_size' => array('name' => 'page_size', 'type' => 'int', 'default' => 20, 'desc' => '页面大小'),
                'page_num' => array('name' => 'page_num', 'type' => 'int', 'default' => 1, 'desc' => '页码'),
            ),
            'getTaskFileList' => array(
                'objectID' => array('name' => 'task_id', 'type' => 'int', 'required' => true, 'desc' => '任务ID'),
                'page_size' => array('name' => 'page_size', 'type' => 'int', 'default' => 100, 'desc' => '页面大小'),
                'page_num' => array('name' => 'page_num', 'type' => 'int', 'default' => 1, 'desc' => '页码'),
                'order' => array('name' => 'order', 'type' => 'string', 'default' => 'id desc', 'desc' => '排序参数，如：xx ASC,xx DESC')
            ),
            'uploadTaskFile' => array(
                'task_id' => array('name' => 'id', 'type' => 'int', 'required' => true, 'desc' => '任务ID'),
            ),
            'delTaskFile' => array(
                'file_id' => array('name' => 'file_id', 'type' => 'int', 'required' => true, 'desc' => '文件ID'),
            ),
            'downloadTaskFile' => array(
                'file_id' => array('name' => 'file_id', 'type' => 'int', 'required' => true, 'desc' => '文件ID'),
            ),
            'getTaskStatisticsByTeam' => array(
                'team_id' => array('name' => 'team_id', 'type' => 'int', 'required' => true, 'desc' => '团队id'),
                'type' => array('name' => 'type', 'type' => 'string', 'default' => 'week', 'desc' => '统计类型'),
            ),
            'getTaskStatisticsByAll' => array(
                'type' => array('name' => 'type', 'type' => 'string', 'default' => 'week', 'desc' => '统计类型'),
            ),
        );
    }

    /**
     * 团队任务统计
     * @desc 团队任务统计
     * @return array
     * @throws WrongRequestException
     * @throws \PhalApi\Exception\BadRequestException
     */
    public function getTaskStatisticsByTeam()
    {
        return self::$Domain->getTaskStatisticsByTeam($this->team_id, $this->type);
    }

    /**
     * 任务统计
     * @desc 任务统计
     * @return array
     */
    public function getTaskStatisticsByAll()
    {
        return self::$Domain->getTaskStatisticsByAll($this->type);
    }

    /**
     * 获取任务列表
     * @desc 获取任务列表
     * @return array
     */
    public function getList()
    {
        unset($this->user_info);
        return self::$Domain->getList($this);
    }

    /**
     * 获取所有任务概况列表
     * @desc 获取所有任务概况列表
     * @return array
     */
    public function getListOverview()
    {
        unset($this->user_info);
        return self::$Domain->getListOverview($this);
    }

    /**
     * 获取成员任务列表
     * @desc 获取成员任务列表
     * @return array
     */
    public function getTaskForUser()
    {
        if (!$this->user_id) {
            $this->user_id = $this->user_info['id'];
        }
        unset($this->user_info);
        return self::$Domain->getTaskForUser($this);
    }

    /**
     * 获取任务成员列表
     * @desc 获取任务成员列表
     * @return array
     */
    public function getTaskUserList()
    {
        unset($this->user_info);
        $domain_task_user = new TaskUser();
        return $domain_task_user->getList($this);
    }

    /**
     * 获取任务文件列表
     * @desc 获取任务文件列表
     * @return array
     */
    public function getTaskFileList()
    {
        unset($this->user_info);
        $domain_task_file = new File();
        return $domain_task_file->getList($this);
    }

    /**
     * 获取任务类型
     * @desc 获取任务类型
     * @return array
     */
    public function getTaskTypeList()
    {
        return self::$Domain->getTaskTypeList();
    }

    /**
     * 获取任务优先级
     * @desc 获取任务优先级
     * @return array
     */
    public function getTaskLevelList()
    {
        return self::$Domain->getTaskLevelList();
    }

    /**
     * 获取任务标签
     * @desc 获取任务标签
     * @return array
     */
    public function getTaskTagList()
    {
        return self::$Domain->getTaskTagList($this->project_id);
    }

    /**
     * 获取任务执行状态
     * @desc 获取任务执行状态
     * @return array
     */
    public function getTaskExecuteStateList()
    {
        return self::$Domain->getTaskExecuteStateList();
    }

    /**
     * 获取任务信息
     * @desc 获取任务信息
     * @return array
     */
    public function getInfo()
    {
        return self::$Domain->getInfo(array('id' => $this->id));
    }

    /**
     * 获取任务日志
     * @desc 获取任务日志
     * @return array
     */
    public function getTaskLog()
    {
        return self::$Domain->getTaskLog($this->task_id, $this->show_all);
    }

    /**
     * 获取团队任务日志
     * @desc 获取团队任务日志
     * @return array
     * @throws \PhalApi\Exception\BadRequestException
     */
    public function getTeamTaskLog()
    {
        $domain_task_log = new TaskLog();
        $domain_team = new Team();
        if (!$this->team_id) {
            $current_user = getCurrentUser();
            $team_list = $domain_team->getUserTeam($current_user['id']);
            if ($team_list) {
                $this->team_id = $team_list[0]['team_id'];
                return $domain_task_log->getTeamTaskLog($this->team_id, $this->page_num, $this->page_size);
            }
        }
        return array();

    }

    /**
     * 删除任务
     * @desc 删除任务
     */
    public function delTask()
    {
        self::$Domain->delTask($this->id);
    }

    /**
     * 新增任务
     * @desc 新增任务
     */
    public function addTask()
    {
        unset($this->user_info);
        $data = get_object_vars($this);
        self::$Domain->addTask($data);
    }

    /**
     * 保存任务信息
     * @desc 保存任务信息
     * @throws WrongRequestException
     */
    public function editTask()
    {
        $task_id = $this->task_id;
        unset($this->user_info);
        unset($this->task_id);
        $data = get_object_vars($this);
        self::$Domain->editTask($task_id, $data);
    }

    /**
     * 添加任务标签
     * @desc 添加任务标签
     */
    public function addTaskTag()
    {
        unset($this->user_info);
        $data = get_object_vars($this);
        $task_tag_domain = new TaskTag();
        return $task_tag_domain->addTaskTag($data);
    }

    /**
     * 编辑任务标签
     * @desc 编辑任务标签
     */
    public function editTaskTag()
    {
        unset($this->user_info);
        $data = get_object_vars($this);
        $task_tag_domain = new TaskTag();
        return $task_tag_domain->editTaskTag($this->id,$data);
    }
    /**
     * 添加任务评论
     * @desc 添加任务评论
     */
    public function addTaskComment()
    {
        unset($this->user_info);
        self::$Domain->addTaskComment($this->task_id,$this->memo);
    }

    /**
     * 编辑任务评论
     * @desc 添加任务评论
     * @throws WrongRequestException
     */
    public function editTaskComment()
    {
        unset($this->user_info);
        self::$Domain->editTaskComment($this->id,$this->memo);
    }

    /**
     * 删除任务评论
     * @desc 删除任务评论
     * @throws WrongRequestException
     */
    public function delTaskComment()
    {
        unset($this->user_info);
        self::$Domain->delTaskComment($this->id);
    }

    /**
     * 添加任务成员
     * @desc 添加任务成员
     * @throws \PhalApi\Exception\BadRequestException
     */
    public function addTaskUser()
    {
        $domain_task_user = new TaskUser();
        $domain_task_user->addTaskUser($this->task_id, $this->user_id);
    }

    /**
     * 指派任务成员
     * @desc 指派任务成员
     * @throws \PhalApi\Exception\BadRequestException
     */
    public function addTaskExecutorUser()
    {
        $domain_task_user = new TaskUser();
        $domain_task_user->addTaskExecutorUser($this->task_id, $this->user_id);
    }

    /**
     * 标记任务状态
     * @desc 标记任务状态
     */
    public function setTaskState()
    {
        self::$Domain->setTaskState($this->task_id, $this->task_state);
    }
    /**
     * 任务排序
     * @desc 任务排序
     */
    public function exchangeTaskSort()
    {
        self::$Domain->exchangeTaskSort($this->list);
    }

    /**
     * 删除类型任务
     * @desc 删除类型任务
     */
    public function delTypeTask()
    {
        self::$Domain->delTypeTask($this->project_id, $this->type_id);
    }

    /**
     * 设置类型任务截止时间
     * @desc 设置类型任务截止时间
     */
    public function setTypeTaskEndTime()
    {
        self::$Domain->setTypeTaskEndTime($this->project_id, $this->type_id, $this->end_time);
    }

    /**
     * 设置类型任务执行者
     * @desc 设置类型任务执行者
     * @throws WrongRequestException
     * @throws \PhalApi\Exception\BadRequestException
     */
    public function setTypeTaskExecutor()
    {
        return self::$Domain->setTypeTaskExecutor($this->project_id, $this->type_id, $this->user_id);
    }

    /**
     * 上传任务文件
     * @desc 上传任务文件
     * @return string url 文件地址
     * @throws WrongRequestException
     */
    public function uploadTaskFile()
    {
        if (!$this->task_id) {
            throw new WrongRequestException('缺少上传参数', 3);
        }
        $domain_task_file = new File();
        $task_info = self::$Domain->getInfo(array('id' => $this->task_id));
        $project_id = $task_info['project'];
        $upload = new UploadFile();
        $upload->set('default_dir', "file/project/{$project_id}/{$this->task_id}");
        $upload->set('max_size', "3072");//设置文件上传允许的大小

        $upload->upfile('file');
        $file_url = $upload->qiniu_url;
        $title = $upload->upload_file['name'];
        $file_name = $upload->file_name;
        $file_type = $upload->upload_file['type'];
        $file_size = $upload->upload_file['size'];
        $file_ext = $upload->ext;
        $result = $domain_task_file->uploadTaskFile($this->task_id, $title, $file_name, $file_type, $file_size, $file_ext, $file_url);
        if ($result) {
            return $upload->qiniu_url;
        } else {
            throw new WrongRequestException($upload->error, 1);
        }
    }

    /**
     * 上传备注图片
     * @desc 添加备注时上传图片内容
     * @return string url 图片地址
     */
    public function uploadContentImg()
    {
        $upload = new UploadFile();
        $upload->set('default_dir', 'image/task/content');
        $upload->set('allow_type', array('jpg', 'jpeg', 'png', 'gif'));

        $upload->upfile('file');
        if (USE_QINIU) {
            $file_url = $upload->qiniu_url;
        } else {
            $file_name = $upload->file_name;
            $file_url = APP_URL . '/public/' . BASE_UPLOAD_PATH . CB . "image/task/content/{$file_name}";
        }
        echo $file_url;
        die;
    }

    /**
     * 删除任务文件
     * @desc 删除任务文件
     */
    public function delTaskFile()
    {
        $domain_task_file = new File();
        $domain_task_file->delTaskFile($this->file_id);
    }

    /**
     * 下载任务文件
     * @desc 下载任务文件
     */
    public function downloadTaskFile()
    {
        $domain_task_file = new File();
        $domain_task_file->downloadTaskFile($this->file_id);
    }

}
