<?php
namespace App\Api\User;

use App\Common\CommonApi;
use App\Common\Exception\WrongRequestException;

/**
 * 用户等级类
 */
class Level extends CommonApi
{
    private static $Domain = null;

    public function __construct()
    {
        if (self::$Domain == null) {
            self::$Domain = new \App\Domain\User\Level();
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
            'getUserList' => array(
                'level_id' => array('name' => 'level_id', 'type' => 'int', 'required' => true, 'desc' => '等级ID'),
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
                'level_desc' => array('name' => 'level_desc', 'type' => 'string', 'default' => '', 'desc' => '等级名称'),
                'eng_name' => array('name' => 'eng_name', 'type' => 'string', 'default' => '', 'desc' => '英文名称'),
                'sort' => array('name' => 'sort', 'type' => 'int', 'default' => 0, 'desc' => '排序'),
            ),
            'editLevel' => array(
                'id' => array('name' => 'level_id', 'type' => 'int', 'required' => true, 'desc' => '等级ID'),
                'level_name' => array('name' => 'level_name', 'type' => 'string', 'required' => true, 'desc' => '等级名称'),
                'eng_name' => array('name' => 'eng_name', 'type' => 'string', 'default' => '', 'desc' => '英文名称'),
                'level_desc' => array('name' => 'level_desc', 'type' => 'string', 'default' => '', 'desc' => '等级名称'),
                'sort' => array('name' => 'sort', 'type' => 'int', 'default' => 0, 'desc' => '排序')
            ),
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
     * 获取对应等级的用户列表
     * @desc 获取对应等级的用户列表
     * @return array
     */
    public function getUserList()
    {
        unset($this->user_info);
        return self::$Domain->getUserList($this);
    }

    /**
     * 获取等级信息
     * @desc 获取等级信息
     * @return array
     */
    public function getInfo()
    {
        return self::$Domain->getInfo(array('id' => $this->id));
    }

    /**
     * 删除等级
     * @desc 删除等级
     */
    public function delLevel()
    {
        self::$Domain->delLevel($this->ids);
    }

    /**
     * 新增等级
     * @desc 新增等级
     */
    public function addLevel()
    {
        unset($this->user_info);
        $data = get_object_vars($this);
        self::$Domain->addLevel($data);
    }

    /**
     * 保存等级信息
     * @desc 保存等级信息
     */
    public function editLevel()
    {
        unset($this->user_info);
        unset($this->level_id);
        $data = get_object_vars($this);
        self::$Domain->editLevel($this->id, $data);
    }
}