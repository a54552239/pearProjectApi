<?php
namespace App\Api\System;
use App\Common\CommonApi;

/**
 * 站点配置类
 */
class Setting extends CommonApi
{
    private static $Domain = null;

    public function __construct()
    {
        if (self::$Domain == null) {
            self::$Domain = new \App\Domain\System\Setting();
        }
    }

    public function getRules()
    {
        return array(
            'getSetting' => array(
                'set_name' => array('name' => 'set_name', 'type' => 'string', 'required' => true, 'desc' => '配置名称')
            ),
            'doSetting' => array(
                'name' => array('name' => 'name', 'type' => 'string', 'required' => true, 'desc' => '配置项名称'),
                'value' => array('name' => 'value', 'type' => 'string', 'required' => true, 'desc' => '配置值'),
            )
        );
    }

    /**
     * 获取系统配置信息
     * @desc 获取系统配置信息
     * @return array
     */
    public function getSetting()
    {
        return self::$Domain->getSetting($this->set_name);
    }

    /**
     * 保存系统配置
     * @desc 保存系统配置
     */
    public function doSetting()
    {
        self::$Domain->doSetting($this->name,$this->value);
    }

}