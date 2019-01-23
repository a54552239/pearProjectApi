<?php
namespace App\Api\User;

use App\Common\CommonApi;
use App\Common\Exception\WrongRequestException;

/**
 * 用户职位类
 */
class Position extends CommonApi
{
    private static $Domain = null;

    public function __construct()
    {
        if (self::$Domain == null) {
            self::$Domain = new \App\Domain\User\Position();
        }
    }

    public function getRules()
    {
        return array(
            'getInfo' => array(
                'id' => array('name' => 'position_id', 'type' => 'int', 'required' => true, 'desc' => '职位ID')
            ),
            'getList' => array(
                'keyWord' => array('name' => 'keyword', 'type' => 'string', 'default' => '', 'desc' => '关键词'),
                'page_size' => array('name' => 'page_size', 'type' => 'int', 'default'=> PAGE_SIZE, 'desc' => '页面大小'),
                'page_num' => array('name' => 'page_num', 'type' => 'int', 'default' => 1, 'desc' => '页码'),
                'order' => array('name' => 'order', 'type' => 'string', 'default' => 'sort desc', 'desc' => '排序参数，如：xx ASC,xx DESC')
            ),
            'getUserList' => array(
                'position_id' => array('name' => 'position_id', 'type' => 'int', 'required' => true, 'desc' => '职位ID'),
                'keyWord' => array('name' => 'keyword', 'type' => 'string', 'default' => '', 'desc' => '关键词'),
                'page_size' => array('name' => 'page_size', 'type' => 'int', 'default'=> PAGE_SIZE, 'desc' => '页面大小'),
                'page_num' => array('name' => 'page_num', 'type' => 'int', 'default' => 1, 'desc' => '页码'),
                'order' => array('name' => 'order', 'type' => 'string', 'default' => 'id desc', 'desc' => '排序参数，如：xx ASC,xx DESC')
            ),
            'delPosition' => array(
                'ids' => array('name' => 'ids', 'type' => 'Array', 'format' => 'json', 'require' => true, 'desc' => '职位id')
            ),
            'addPosition' => array(
                'position_name' => array('name' => 'position_name', 'type' => 'string', 'required' => true, 'desc' => '职位名称'),
                'position_desc' => array('name' => 'position_desc', 'type' => 'string', 'default' => '', 'desc' => '职位名称'),
                'eng_name' => array('name' => 'eng_name', 'type' => 'string', 'default' => '', 'desc' => '英文名称'),
                'sort' => array('name' => 'sort', 'type' => 'int', 'default' => 0, 'desc' => '排序'),
            ),
            'editPosition' => array(
                'id' => array('name' => 'position_id', 'type' => 'int', 'required' => true, 'desc' => '职位ID'),
                'position_name' => array('name' => 'position_name', 'type' => 'string', 'required' => true, 'desc' => '职位名称'),
                'eng_name' => array('name' => 'eng_name', 'type' => 'string', 'default' => '', 'desc' => '英文名称'),
                'position_desc' => array('name' => 'position_desc', 'type' => 'string', 'default' => '', 'desc' => '职位名称'),
                'sort' => array('name' => 'sort', 'type' => 'int', 'default' => 0, 'desc' => '排序')
            ),
        );
    }

    /**
     * 获取职位列表
     * @desc 获取职位列表
     * @return array
     */
    public function getList()
    {
        unset($this->user_info);
        return self::$Domain->getList($this);
    }

    /**
     * 获取对应职位的用户列表
     * @desc 获取对应职位的用户列表
     * @return array
     */
    public function getUserList()
    {
        unset($this->user_info);
        return self::$Domain->getUserList($this);
    }

    /**
     * 获取职位信息
     * @desc 获取职位信息
     * @return array
     */
    public function getInfo()
    {
        return self::$Domain->getInfo(array('id' => $this->id));
    }

    /**
     * 删除职位
     * @desc 删除职位
     */
    public function delPosition()
    {
        self::$Domain->delPosition($this->ids);
    }

    /**
     * 新增职位
     * @desc 新增职位
     */
    public function addPosition()
    {
        unset($this->user_info);
        $data = get_object_vars($this);
        self::$Domain->addPosition($data);
    }

    /**
     * 保存职位信息
     * @desc 保存职位信息
     */
    public function editPosition()
    {
        unset($this->user_info);
        unset($this->position_id);
        $data = get_object_vars($this);
        self::$Domain->editPosition($this->id, $data);
    }
}