<?php
namespace App\Api\Team;
use App\Common\CommonApi;
use App\Domain\Team\TeamUser;

/**
 * 团队类
 */
class Team extends CommonApi
{
    private static $Domain = null;

    public function __construct()
    {
        if (self::$Domain == null) {
            self::$Domain = new \App\Domain\Team\Team();
        }
    }

    public function getRules()
    {
        return array(
            'getInfo' => array(
                'id' => array('name' => 'team_id', 'type' => 'int', 'required' => true, 'desc' => '团队ID')
            ),
            'getList' => array(
                'keyWord' => array('name' => 'keyword', 'type' => 'string', 'default' => '', 'desc' => '关键词'),
                'pid' => array('name' => 'pid', 'type' => 'int', 'default' => '0', 'desc' => '上级id'),
                'page_size' => array('name' => 'page_size', 'type' => 'int', 'default'=> PAGE_SIZE, 'desc' => '页面大小'),
                'page_num' => array('name' => 'page_num', 'type' => 'int', 'default' => 1, 'desc' => '页码'),
                'order' => array('name' => 'order', 'type' => 'string', 'default' => 'id desc', 'desc' => '排序参数，如：xx ASC,xx DESC')
            ),
            'changeState' => array(
                'team_id' => array('name' => 'team_id', 'type' => 'int', 'default' => 0, 'desc' => '团队id'),
                'state' => array('name' => 'state', 'type' => 'int', 'require' => true, 'default' => 0, 'desc' => '状态'),
            ),
            'delTeam' => array(
                'ids' => array('name' => 'ids', 'type' => 'Array', 'format' => 'json', 'require' => true, 'desc' => '团队id')
            ),
            'addTeam' => array(
                'team_name' => array('name' => 'team_name', 'type' => 'string', 'required' => true, 'desc' => '团队名称'),
                'pid' => array('name' => 'pid', 'type' => 'int', 'default' => 0, 'desc' => '隶属团队'),
                'state' => array('name' => 'state', 'type' => 'int', 'default' => 0, 'desc' => '状态'),
            ),
            'editTeam' => array(
                'id' => array('name' => 'team_id', 'type' => 'int', 'required' => true, 'desc' => '团队ID'),
                'team_name' => array('name' => 'team_name', 'type' => 'string', 'required' => true, 'desc' => '团队名称'),
                'pid' => array('name' => 'pid', 'type' => 'int', 'default' => 0, 'desc' => '隶属团队'),
                'state' => array('name' => 'state', 'type' => 'int', 'default' => 0, 'desc' => '状态'),
            ),
            'getNoInTeamUser' => array(
                'keyWord' => array('name' => 'keyword', 'type' => 'string', 'default' => '', 'desc' => '关键词'),
                'team_id' => array('name' => 'team_id', 'type' => 'int', 'required' => true, 'desc' => '团队ID'),
                'page_size' => array('name' => 'page_size', 'type' => 'int', 'default'=> PAGE_SIZE, 'desc' => '页面大小'),
                'page_num' => array('name' => 'page_num', 'type' => 'int', 'default' => 1, 'desc' => '页码'),
                'order' => array('name' => 'order', 'type' => 'string', 'default' => 'u.id desc', 'desc' => '排序参数，如：xx ASC,xx DESC')
            ),
            'getTeamUser' => array(
                'keyWord' => array('name' => 'keyword', 'type' => 'string', 'default' => '', 'desc' => '关键词'),
                'team_id' => array('name' => 'team_id', 'type' => 'int', 'default' => 0, 'desc' => '团队ID'),
                'page_size' => array('name' => 'page_size', 'type' => 'int', 'default'=> PAGE_SIZE, 'desc' => '页面大小'),
                'page_num' => array('name' => 'page_num', 'type' => 'int', 'default' => 1, 'desc' => '页码'),
                'order' => array('name' => 'order', 'type' => 'string', 'default' => 'u.id desc', 'desc' => '排序参数，如：xx ASC,xx DESC')
            ),
            'addTeamUser' => array(
                'team_id' => array('name' => 'team_id', 'type' => 'int', 'required' => true, 'desc' => '团队id'),
                'user_id' => array('name' => 'user_id', 'type' => 'int', 'required' => true, 'desc' => '用户id')
            ),
            'editLeader' => array(
                'team_id' => array('name' => 'team_id', 'type' => 'int', 'required' => true, 'desc' => '团队id'),
                'user_id' => array('name' => 'user_id', 'type' => 'int', 'required' => true, 'desc' => '用户id'),
                'state' => array('name' => 'state', 'type' => 'int', 'default' => 1, 'desc' => '编辑团队负责人')
            ),
        );
    }

    /**
     * 编辑团队负责人
     * @desc 编辑团队负责人
     * @return array
     */
    public function editLeader()
    {
        self::$Domain->editLeader($this->team_id,$this->user_id,$this->state);
    }

    /**
     * 获取不在本团队成员列表
     * @desc 获取不在本团队成员列表
     * @return array
     */
    public function getNoInTeamUser()
    {
        unset($this->user_info);
        return self::$Domain->getNoInTeamUser($this);
    }
    /**
     * 获取本团队成员列表
     * @desc 获取团队成员列表
     * @return array
     */
    public function getTeamUser()
    {
        unset($this->user_info);
        $domain_team_user = new TeamUser();
        return $domain_team_user->getTeamUser($this);
    }

    /**
     * 添加成员至团队
     * @desc 添加成员至团队
     * @return array
     */
    public function addTeamUser()
    {
        $data = array('team_id' => $this->team_id, 'user_id' => $this->user_id);
        $domain_team_user = new TeamUser();
        $domain_team_user->addTeamUser($data);
    }

    /**
     * 获取团队列表
     * @desc 获取团队列表
     * @return array
     */
    public function getList()
    {
        unset($this->user_info);
        return self::$Domain->getList($this);
    }

    /**
     * 获取团队信息
     * @desc 获取团队信息
     * @return array
     */
    public function getInfo()
    {
        return self::$Domain->getInfo(array('id' => $this->id));
    }

    /**
     * 删除团队
     * @desc 删除团队
     */
    public function delTeam()
    {
        self::$Domain->delTeam($this->ids);
    }

    /**
     * 新增团队
     * @desc 新增团队
     */
    public function addTeam()
    {
        unset($this->user_info);
        $data = get_object_vars($this);
        self::$Domain->addTeam($data);
    }

    /**
     * 保存团队信息
     * @desc 保存团队信息
     */
    public function editTeam()
    {
        unset($this->user_info);
        unset($this->Team_id);
        $data = get_object_vars($this);
        self::$Domain->editTeam($this->id, $data);
    }

    /**
     * 修改团队状态
     * @desc 修改团队状态，1.启用，0.禁用
     * @return int code 业务代码：200.操作成功，201.操作失败
     */
    public function changeState()
    {
        self::$Domain->changeState($this->team_id, $this->state);

    }

}