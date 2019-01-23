<?php
namespace App\Api\Project;
use App\Common\CommonApi;

/**
 * 项目评级类
 */
class Level extends CommonApi
{
    private static $Domain = null;

    public function __construct()
    {
        if (self::$Domain == null) {
            self::$Domain = new \App\Domain\Project\Level();
        }
    }

    public function getRules()
    {
        return array(
            'getInfo' => array(
                'id' => array('name' => 'level_id', 'type' => 'int', 'required' => true, 'desc' => '等级ID')
            ),
            'getList' => array(
                'keyWord' => array('name' => 'keyword', 'type' => 'string', 'default' => '', 'desc' => '关键词'),
                'page_size' => array('name' => 'page_size', 'type' => 'int', 'default'=> PAGE_SIZE, 'desc' => '页面大小'),
                'page_num' => array('name' => 'page_num', 'type' => 'int', 'default' => 1, 'desc' => '页码'),
                'order' => array('name' => 'order', 'type' => 'string', 'default' => 'id desc', 'desc' => '排序参数，如：xx ASC,xx DESC')
            ),
            'delLevel' => array(
                'ids' => array('name' => 'ids', 'type' => 'Array', 'format' => 'json', 'require' => true, 'desc' => '等级id')
            ),
            'addLevel' => array(
                'level_name' => array('name' => 'level_name', 'type' => 'string', 'required' => true, 'desc' => '等级名称'),
                'money' => array('name' => 'money', 'type' => 'float', 'required' => true, 'desc' => '等级提成'),
                'sort' => array('name' => 'sort', 'type' => 'int', 'default' => 0, 'desc' => '排序'),
            ),
            'editLevel' => array(
                'id' => array('name' => 'level_id', 'type' => 'int', 'required' => true, 'desc' => '等级ID'),
                'level_name' => array('name' => 'level_name', 'type' => 'string', 'required' => true, 'desc' => '等级名称'),
                'money' => array('name' => 'money', 'type' => 'float', 'required' => true, 'desc' => '等级提成'),
                'sort' => array('name' => 'sort', 'type' => 'int', 'default' => 0, 'desc' => '排序'),
            )
        );
    }


    /**
     * 获取等级列表
     * @desc 获取等级列表
     * @return array
     */
    public function getList()
    {
        unset($this->user_info);
        return self::$Domain->getList($this);
    }

    /**
     * 获取评级信息
     * @desc 获取评级信息
     * @return array
     */
    public function getInfo()
    {
        return self::$Domain->getInfo(array('id'=>$this->id));
    }

    /**
     * 删除评级
     * @desc 删除评级
     */
    public function delLevel()
    {
        self::$Domain->delLevel($this->ids);
    }

    /**
     * 新增评级
     * @desc 新增评级
     */
    public function addLevel()
    {
        unset($this->user_info);
        $data = get_object_vars($this);
        self::$Domain->addLevel($data);
    }
    /**
     * 保存评级信息
     * @desc 保存评级信息
     */
    public function editLevel()
    {
        unset($this->user_info);
        unset($this->level_id);
        $data = get_object_vars($this);
        self::$Domain->editProjectLevel($this->id,$data);
    }

}