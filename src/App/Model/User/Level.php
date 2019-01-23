<?php
namespace App\Model\User;
use App\Common\CommonModel;

class Level extends CommonModel
{


    protected function getTableName($id)
    {
        return 'user_level';
    }

}