<?php
namespace App\Model\Project;
use App\Common\CommonModel;

/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2017/3/23 0023
 * Time: 9:37
 */
class TaskTypeTemplate extends CommonModel
{
    public $default_template = array(
        array('name' => '待办', 'list' => array(), 'show_card' => false, 'fixed_creator' => false),
        array('name' => '需求', 'list' => array(), 'show_card' => false, 'fixed_creator' => false),
        array('name' => '新增', 'list' => array(), 'show_card' => false, 'fixed_creator' => false),
        array('name' => '问题', 'list' => array(), 'show_card' => false, 'fixed_creator' => false),
        array('name' => '其他', 'list' => array(), 'show_card' => false, 'fixed_creator' => false),

    );

    protected function getTableName($id)
    {
        return 'task_type_template';
    }

}