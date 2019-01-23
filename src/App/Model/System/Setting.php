<?php
namespace App\Model\System;
use App\Common\CommonModel;

class Setting extends CommonModel
{

    
    protected function getTableName($id)
    {
        return 'system_setting';
    }
}