<?php
namespace App\Model\User\Setting;
use App\Common\CommonModel;

class UserSetting extends CommonModel
{

    
    protected function getTableName($id)
    {
        return 'user_setting';
    }
}