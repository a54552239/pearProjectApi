<?php
namespace App\Api\Project;
use App\Common\CommonApi;

/**
 * 项目任务类型类
 */
class TaskType extends CommonApi
{
    private static $Domain = null;

    public function __construct()
    {
        if (self::$Domain == null) {
            self::$Domain = new \App\Domain\Project\TaskType();
        }
    }

    public function getRules()
    {
        return array(
            'getInfo' => array(
                'id' => array('name' => 'task_type_id', 'type' => 'int', 'required' => true, 'desc' => '任务类型ID')
            ),
            'getList' => array(
                'keyWord' => array('name' => 'keyword', 'type' => 'string', 'default' => '', 'desc' => '关键词'),
                'page_size' => array('name' => 'page_size', 'type' => 'int', 'default'=> PAGE_SIZE, 'desc' => '页面大小'),
                'page_num' => array('name' => 'page_num', 'type' => 'int', 'default' => 1, 'desc' => '页码'),
                'project_id' => array('name' => 'project_id', 'type' => 'int', 'require' => true, 'desc' => '项目id'),
                'order' => array('name' => 'order', 'type' => 'string', 'default' => 'sort asc,id asc', 'desc' => '排序参数，如：xx ASC,xx DESC')
            ),
            'delTaskType' => array(
                'id' => array('name' => 'task_type_id', 'type' => 'int', 'require' => true, 'desc' => '任务类型id')
            ),
            'addTaskType' => array(
                'name' => array('name' => 'type_name', 'type' => 'string', 'required' => true, 'desc' => '任务类型名称'),
                'project' => array('name' => 'project_id', 'type' => 'int', 'required' => true, 'desc' => '项目id'),
                'sort' => array('name' => 'sort', 'type' => 'int', 'default' => 0, 'desc' => '排序'),
            ),
            'editTaskType' => array(
                'id' => array('name' => 'task_type_id', 'type' => 'int', 'required' => true, 'desc' => '任务类型ID'),
                'name' => array('name' => 'type_name', 'type' => 'string', 'required' => true, 'desc' => '任务类型名称'),
            ),
            'exchangeTaskTypeSort' => array(
                'list' => array('name' => 'list', 'type' => 'array', 'format'=>'json','required' => true, 'desc' => '重排后的任务类型id列表'),

            ),

        );
    }

    /**
     * 任务类型排序
     * @desc 任务类型排序
     */
    public function exchangeTaskTypeSort()
    {
        self::$Domain->exchangeTaskTypeSort($this->list);
    }

    /**
     * 获取任务类型列表
     * @desc 获取任务类型列表
     * @return array
     */
    public function getList()
    {
        unset($this->user_info);
        return self::$Domain->getList($this);
    }

    /**
     * 获取任务类型信息
     * @desc 获取任务类型信息
     * @return array
     */
    public function getInfo()
    {
        return self::$Domain->getInfo(array('id'=>$this->id));
    }

    /**
     * 删除任务类型
     * @desc 删除任务类型
     */
    public function delTaskType()
    {
        self::$Domain->delTaskType($this->id);
    }

    /**
     * 新增任务类型
     * @desc 新增任务类型
     */
    public function addTaskType()
    {
        unset($this->user_info);
        $data = get_object_vars($this);
        return self::$Domain->addTaskType($data);
    }
    /**
     * 保存任务类型信息
     * @desc 保存任务类型信息
     */
    public function editTaskType()
    {
        unset($this->user_info);
        $data = get_object_vars($this);
        self::$Domain->editProjectTaskType($this->id,$data);
    }

}
