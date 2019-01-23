<?php
namespace App\Model\User;
use App\Common\CommonModel;
use App\Domain\Team\Team;
use App\Model\Team\TeamUser;

class User extends CommonModel
{

    public function getUserFullById($user_id)
    {
//        $prefix = \PhalApi\DI()->config->get('dbs.tables.__default__.prefix');
//        $sql = 'SELECT *,u.id as u_user_id,u.id as id,u.state as state,u.id as id,l.eng_name as l_eng_name,p.eng_name as p_eng_name '
//            . 'FROM ' . $prefix . 'user AS u '
//            . 'RIGHT JOIN ' . $prefix . 'team_user AS tu '
//            . ' ON tu.user_id = u.id '
//            . 'RIGHT JOIN ' . $prefix . 'company_team AS t '
//            . ' ON tu.team_id = t.id '
//            . 'RIGHT JOIN ' . $prefix . 'user_level AS l '
//            . 'ON u.level_id = l.id '
//            . 'RIGHT JOIN ' . $prefix . 'user_position AS p '
//            . 'ON u.position_id = p.id '
//            . 'AND u.id = :id order by u.id desc limit 1';
//        $params = array(':id' => $user_id);
//        $info = \PhalApi\DI()->notorm->notTable->queryRows($sql, $params);
        $info = $this->get($user_id);
        $user_info = $info;
        $team_user_model = new TeamUser();
        $team_user_info = $team_user_model->getInfo(array('user_id'=>$user_id));
        $team_model = new \App\Model\Team\Team();
        $team_info = $team_model->getInfo(array('id'=>$team_user_info['team_id']));
        if (!$team_info) {
            $team_info = array();
        }
        $level_model = new Level();
        $level_info = $level_model->getInfo(array('id'=>$info['level_id']));
        if (!$level_info) {
            $level_info = array();
        }
        $position_model = new Position();
        $position_info = $position_model->getInfo(array('id'=>$info['position_id']));
        if (!$position_info) {
            $position_info = array();
        }
        $info = array_merge($info, $team_info, $level_info, $position_info);
        $info['id'] = $user_info['id'];
        $info['u_user_id'] = $info['id'];
        if (!isset($level_info['eng_name'])) {
            $level_info['eng_name'] = '';
        }
        if (!isset($position_info['eng_name'])) {
            $position_info['eng_name'] = '';
        }
        if (!isset($team_info['id'])) {
            $team_info['id'] = 0;
        }
        $info['l_eng_name'] = $level_info['eng_name'];
        $info['p_eng_name'] = $position_info['eng_name'];

        $info['team_id'] = $team_info['id'];
        $info = array_merge($info, $user_info);
        if ($info['team_id']) {
            $domain_team = new Team();
            $team_path = $domain_team->getTeamPath($info['team_id'],'－');
            $info['team_path'] = $team_path;
        }
        return $info;

    }

    protected function getTableName($id)
    {
        return 'user';
    }

}
