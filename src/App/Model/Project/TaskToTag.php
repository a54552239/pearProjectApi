<?php
namespace App\Model\Project;
use App\Common\CommonModel;
class TaskToTag extends CommonModel
{

    protected function getTableName($id)
    {
        return 'task_to_tag';
    }

}
