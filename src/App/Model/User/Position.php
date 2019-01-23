<?php
namespace App\Model\User;
use App\Common\CommonModel;

class Position extends CommonModel
{


    protected function getTableName($id)
    {
        return 'user_position';
    }

}