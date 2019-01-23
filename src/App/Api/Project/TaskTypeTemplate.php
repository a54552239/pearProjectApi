<?php
namespace App\Api\Project;
use App\Common\CommonApi;

/**
 * 任务类型模板类
 */
class TaskTypeTemplate extends CommonApi
{
    private static $Domain = null;

    public function __construct()
    {
        if (self::$Domain == null) {
            self::$Domain = new \App\Domain\Project\TaskTypeTemplate();
        }
    }

    public function getRules()
    {
        return array(
            'getInfo' => array(
                'id' => array('name' => 'template_id', 'type' => 'int', 'required' => true, 'desc' => '任务类型模板ID')
            ),
            'getList' => array(
                'keyWord' => array('name' => 'keyword', 'type' => 'string', 'default' => '', 'desc' => '关键词'),
                'page_size' => array('name' => 'page_size', 'type' => 'int', 'default'=> PAGE_SIZE, 'desc' => '页面大小'),
                'page_num' => array('name' => 'page_num', 'type' => 'int', 'default' => 1, 'desc' => '页码'),
                'project_type_id' => array('name' => 'project_type_id', 'type' => 'int', 'require' => true, 'desc' => '类型id'),
                'order' => array('name' => 'order', 'type' => 'string', 'default' => 'sort desc,id asc', 'desc' => '排序参数，如：xx ASC,xx DESC')
            ),
            'delTaskTypeTemplate' => array(
                'ids' => array('name' => 'ids', 'type' => 'Array', 'format' => 'json', 'require' => true, 'desc' => '任务类型模板id')
            ),
            'addTaskTypeTemplate' => array(
                'name' => array('name' => 'name', 'type' => 'string', 'required' => true, 'desc' => '任务类型模板名称'),
                'project_type_id' => array('name' => 'project_type_id', 'type' => 'int', 'required' => true, 'desc' => '项目id'),
                'sort' => array('name' => 'sort', 'type' => 'int', 'default' => 0, 'desc' => '排序'),
            ),
            'editTaskTypeTemplate' => array(
                'id' => array('name' => 'template_id', 'type' => 'int', 'required' => true, 'desc' => '任务类型模板ID'),
                'name' => array('name' => 'name', 'type' => 'string', 'required' => true, 'desc' => '任务类型模板名称'),
                'project_type_id' => array('name' => 'project_type_id', 'type' => 'int', 'required' => true, 'desc' => '项目id'),
                'sort' => array('name' => 'sort', 'type' => 'int', 'default' => 0, 'desc' => '排序'),
            )
        );
    }


    /**
     * 获取任务类型模板列表
     * @desc 获取任务类型模板列表
     * @return array
     */
    public function getList()
    {
        unset($this->user_info);
        return self::$Domain->getList($this);
    }

    /**
     * 获取任务类型模板信息
     * @desc 获取任务类型模板信息
     * @return array
     */
    public function getInfo()
    {
        return self::$Domain->getInfo(array('id'=>$this->id));
    }

    /**
     * 删除任务类型模板
     * @desc 删除任务类型模板
     */
    public function delTaskTypeTemplate()
    {
        self::$Domain->delTaskTypeTemplate($this->ids);
    }

    /**
     * 新增任务类型模板
     * @desc 新增任务类型模板
     */
    public function addTaskTypeTemplate()
    {
        unset($this->user_info);
        $data = get_object_vars($this);
        self::$Domain->addTaskTypeTemplate($data);
    }
    /**
     * 保存任务类型模板信息
     * @desc 保存任务类型模板信息
     */
    public function editTaskTypeTemplate()
    {
        unset($this->user_info);
        unset($this->task_type_template_id);
        $data = get_object_vars($this);
        self::$Domain->editProjectTaskTypeTemplate($this->id,$data);
    }

}