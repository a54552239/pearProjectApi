<?php
namespace App\Api\System;
use App\Common\CommonApi;
use App\Domain\System\Log as DomainLog;

/**
 * 日志类
 */
class Log extends CommonApi
{
    private static $Domain = null;

    public function __construct()
    {
        if (self::$Domain == null) {
            self::$Domain = new DomainLog();
        }
    }

    public function getRules()
    {
        return array(
            'getList' => array(
                'keyWord' => array('name' => 'keyword', 'type' => 'string', 'default' => '', 'desc' => '关键词'),
                'page_size' => array('name' => 'page_size', 'type' => 'int', 'default'=> PAGE_SIZE, 'desc' => '页面大小'),
                'page_num' => array('name' => 'page_num', 'type' => 'int', 'default' => 1, 'desc' => '页码'),
                'search_date' => array('name' => 'search_date', 'type' => 'Array', 'format' => 'json', 'desc' => '日期范围'),
                'order' => array('name' => 'order', 'type' => 'string', 'default' => 'id desc', 'desc' => '排序参数，如：xx ASC,xx DESC')
            )
        );
    }

    /**
     * 获取日志列表
     * @desc 获取日志列表
     * @return array
     */
    public function getList()
    {
        unset($this->user_info);
        return self::$Domain->getList($this);
    }

}