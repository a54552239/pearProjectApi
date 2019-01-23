<?php
namespace App\Model\Team;
use App\Common\CommonModel;

class TeamUser extends CommonModel
{

    public function delTeamUser($user_id,$team_id)
    {
        return $this->getORM()->where('user_id', $user_id)->where('team_id', $team_id)->delete();
    }
    public function delTeam($team_id)
    {
        return $this->getORM()->where('team_id', $team_id)->delete();
    }

    protected function getTableName($id)
    {
        return 'team_user';
    }
}