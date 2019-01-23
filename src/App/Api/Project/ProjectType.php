<?php
namespace App\Api\Project;
use App\Common\CommonApi;

/**
 * 项目项目类型类
 */
class ProjectType extends CommonApi
{
    private static $Domain = null;

    public function __construct()
    {
        if (self::$Domain == null) {
            self::$Domain = new \App\Domain\Project\ProjectType();
        }
    }

    public function getRules()
    {
        return array(
            'getInfo' => array(
                'id' => array('name' => 'project_type_id', 'type' => 'int', 'required' => true, 'desc' => '项目类型ID')
            ),
            'getList' => array(
                'keyWord' => array('name' => 'keyword', 'type' => 'string', 'default' => '', 'desc' => '关键词'),
                'page_size' => array('name' => 'page_size', 'type' => 'int', 'default'=> PAGE_SIZE, 'desc' => '页面大小'),
                'page_num' => array('name' => 'page_num', 'type' => 'int', 'default' => 1, 'desc' => '页码'),
                'order' => array('name' => 'order', 'type' => 'string', 'default' => 'sort desc', 'desc' => '排序参数，如：xx ASC,xx DESC')
            ),
            'delProjectType' => array(
                'ids' => array('name' => 'ids', 'type' => 'Array', 'format' => 'json', 'require' => true, 'desc' => '项目类型id')
            ),
            'addProjectType' => array(
                'name' => array('name' => 'name', 'type' => 'string', 'required' => true, 'desc' => '项目类型名称'),
                'memo' => array('name' => 'memo', 'type' => 'string', 'default' => '', 'desc' => '描述'),
                'sort' => array('name' => 'sort', 'type' => 'int', 'default' => 0, 'desc' => '排序'),
            ),
            'editProjectType' => array(
                'id' => array('name' => 'project_type_id', 'type' => 'int', 'required' => true, 'desc' => '项目类型ID'),
                'name' => array('name' => 'name', 'type' => 'string', 'required' => true, 'desc' => '项目类型名称'),
                'memo' => array('name' => 'memo', 'type' => 'string', 'default' => '', 'desc' => '描述'),
                'sort' => array('name' => 'sort', 'type' => 'int', 'default' => 0, 'desc' => '排序'),
            )
        );
    }


    /**
     * 获取项目类型列表
     * @desc 获取项目类型列表
     * @return array
     */
    public function getList()
    {
        unset($this->user_info);
        return self::$Domain->getList($this);
    }

    /**
     * 获取项目类型信息
     * @desc 获取项目类型信息
     * @return array
     */
    public function getInfo()
    {
        return self::$Domain->getInfo(array('id'=>$this->id));
    }

    /**
     * 删除项目类型
     * @desc 删除项目类型
     */
    public function delProjectType()
    {
        self::$Domain->delProjectType($this->ids);
    }

    /**
     * 新增项目类型
     * @desc 新增项目类型
     */
    public function addProjectType()
    {
        unset($this->user_info);
        $data = get_object_vars($this);
        self::$Domain->addProjectType($data);
    }
    /**
     * 保存项目类型信息
     * @desc 保存项目类型信息
     */
    public function editProjectType()
    {
        unset($this->user_info);
        unset($this->project_type_id);
        $data = get_object_vars($this);
        self::$Domain->editProjectProjectType($this->id,$data);
    }

}