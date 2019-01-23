<?php
namespace App\Model\Project;
use App\Common\CommonModel;
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2017/3/23 0023
 * Time: 9:37
 */
class ProjectType extends CommonModel
{

    protected function getTableName($id)
    {
        return 'project_type';
    }

}