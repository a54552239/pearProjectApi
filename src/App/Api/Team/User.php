<?php
namespace App\Api\Team;
use App\Common\CommonApi;
use App\Domain\Team\TeamUser;

/**
 * 团队成员类
 */
class User extends CommonApi
{
    private static $Domain = null;

    public function __construct()
    {
        if (self::$Domain == null) {
            self::$Domain = new TeamUser();
        }
    }

    public function getRules()
    {
        return array(
            'changeState' => array(
                'team_id' => array('name' => 'team_id', 'type' => 'int', 'default' => 0, 'desc' => '团队id'),
                'state' => array('name' => 'state', 'type' => 'int', 'require' => true, 'default' => 0, 'desc' => '状态'),
            ),
            'delTeamUser' => array(
                'user_id' => array('name' => 'user_id', 'type' => 'int', 'require' => true, 'desc' => '团队成员id'),
                'team_id' => array('name' => 'team_id', 'type' => 'int', 'require' => true, 'desc' => '团队id')
            ),
        );
    }

    /**
     * 移除团队成员
     * @desc 移除团队成员
     * @return array
     */
    public function delTeamUser()
    {
        self::$Domain->delTeamUser($this->user_id, $this->team_id);
    }


}