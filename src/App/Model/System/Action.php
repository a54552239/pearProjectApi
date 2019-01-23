<?php
namespace App\Model\System;
use App\Common\CommonModel;

class Action extends CommonModel
{

    
    protected function getTableName($id)
    {
        return 'action';
    }
}