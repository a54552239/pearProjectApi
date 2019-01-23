<?php
namespace App\Api\Common;
use App\Common\CommonApi;

/**
 * 搜索类
 */
class Search extends CommonApi
{
    private static $Domain = null;

    public function __construct()
    {
        if (self::$Domain == null) {
            self::$Domain = new \App\Domain\Common\Search();
        }
    }

    public function getRules()
    {
        return array(
            'search' => array(
                'keyWord' => array('name' => 'keyword', 'type' => 'string', 'default' => '', 'desc' => '关键词'),
                'page_size' => array('name' => 'page_size', 'type' => 'int', 'default'=> 5, 'desc' => '页面大小'),
                'page_num' => array('name' => 'page_num', 'type' => 'int', 'default' => 1, 'desc' => '页码'),
                'order' => array('name' => 'order', 'type' => 'string', 'default' => 'id desc', 'desc' => '排序参数，如：xx ASC,xx DESC')
            ),
        );
    }


    /**
     * 获取等级列表
     * @desc 获取等级列表
     * @return array
     */
    public function search()
    {
        unset($this->user_info);
        return self::$Domain->search($this);
    }
}
