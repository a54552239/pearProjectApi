<?php
namespace App\Model\Team;
use App\Common\CommonModel;

class Team extends CommonModel
{


    
    protected function getTableName($id)
    {
        return 'company_team';
    }
}