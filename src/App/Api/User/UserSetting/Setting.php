<?php
namespace App\Api\User\UserSetting;

use App\Common\CommonApi;
use App\Common\Exception\WrongRequestException;
use App\Domain\User\Setting\UserSetting as DomainSetting;

/**
 * 用户配置类
 */
class Setting extends CommonApi
{
    private static $Domain = null;

    public function __construct()
    {
        if (self::$Domain == null) {
            self::$Domain = new DomainSetting();
        }
    }

    public function getRules()
    {
        return array(
            'getSetting' => array(
                'name' => array('name' => 'name', 'type' => 'string', 'required' => true, 'desc' => '配置项名称'),
            ),
            'doSetting' => array(
                'name' => array('name' => 'name', 'type' => 'string', 'required' => true, 'desc' => '配置项名称'),
                'value' => array('name' => 'value', 'type' => 'string','required' => true, 'desc' => '配置值'),
            )
        );
    }

    /**
     * 获取用户配置信息
     * @desc 获取用户对应类型的配置
     * @return mixed
     */
    public function getSetting()
    {
        return self::$Domain->getSetting($this->name);
    }

    /**
     * 保存用户配置
     * @desc 保存用户配置
     */
    public function doSetting()
    {
        self::$Domain->doSetting($this->name,$this->value);
    }
}