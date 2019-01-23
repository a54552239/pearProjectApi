<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2017/8/22
 * Time: 16:17
 */
namespace App\Model\Project;
use App\Common\CommonModel;

class Level extends CommonModel
{

    
    protected function getTableName($id)
    {
        return 'project_level';
    }
}