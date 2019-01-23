<?php
namespace App\Model\Project;
use App\Common\CommonModel;

class Task extends CommonModel
{

    
    protected function getTableName($id)
    {
        return 'task';
    }
}