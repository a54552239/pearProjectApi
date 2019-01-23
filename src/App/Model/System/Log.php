<?php
namespace App\Model\System;
use App\Common\CommonModel;

class Log extends CommonModel
{

    
    protected function getTableName($id)
    {
        return 'system_log';
    }
}