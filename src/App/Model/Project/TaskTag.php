<?php
namespace App\Model\Project;
use App\Common\CommonModel;
class TaskTag extends CommonModel
{

    protected function getTableName($id)
    {
        return 'task_tag';
    }

}
