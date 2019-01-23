<?php
namespace App\Model\Project;
use App\Common\CommonModel;
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2017/3/23 0023
 * Time: 9:37
 */
class TaskLog extends CommonModel
{

    protected function getTableName($id)
    {
        return 'task_log';
    }

}