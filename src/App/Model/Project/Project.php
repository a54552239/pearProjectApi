<?php
namespace App\Model\Project;
use App\Common\CommonModel;
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2017/3/23 0023
 * Time: 9:37
 */
class Project extends CommonModel
{

    protected function getTableName($id)
    {
        return 'project';
    }

    public function getProjectFileList($project_id)
    {
        $sql = "select t.project_id as project_id,p.name as name,f.id as file_id,f.title as title,f.add_time as add_time,f.member_id as member_id,f.file_size as file_size,f.file_ext as file_ext,m.member_truename as member_truename from tbl_task as t  join tbl_project as p on  p.id = t.project_id and p.id = {$project_id} join tbl_task_file as f on f.task_id = t.id join tbl_member as m on m.id = f.member_id order by f.id desc";
        return $this->getORM()->queryAll($sql);
    }

    /**
     * 获取会员加入的项目列表
     * @param $param
     * @param $member_id
     * @return array
     * @internal param int $page_size
     * @internal param int $page_num
     * @internal param array $where
     */
    public function getMemberProjectList($param,$member_id)
    {
        $offset = ($param['page_num'] - 1) * $param['page_size'];
        $sql_1 = "select count(p.id) as c from tbl_project as p join tbl_project_member as m on p.id = m.project_id and m.member_id = {$member_id} ";
        $sql_2 = "select * from tbl_project as p join tbl_project_member as m on p.id = m.project_id and m.member_id = {$member_id}";
        //拼接查询条件
        if (count($where) > 0) {
            foreach ($where as $key=>$value) {
                //取出 ? 号
                $key = str_replace('?','',$key);
                //如果不包含 = 号，则拼 = 号
                if (strpos($key,'=') === false) {
                    $key .= '=';
                }
                $sql_2 .= " and p.{$key} {$value} ";
            }
        }
        $sql_2 .= " order by p.id desc limit {$offset},{$param['page_size']}";
        $total =  $this->getORM()->queryAll($sql_1);
        $total = $total[0]['c'];
        $lists =  $this->getORM()->queryAll($sql_2);
        return array('count' => $total, 'list' => $lists);
    }
    public function getListForUser($param)
    {
        $offset = ($param['page_num'] - 1) * $param['page_size'];
        $order = $param['order'] == '' ? '' : ' ORDER BY ' . $param['order'];
        $key_word = $param['keyWord'] == '' ? ' WHERE 1=1 ' :  ' WHERE ( p.name like '. "'%"  . $param['keyWord'] . "%' OR u.realname like " . "'%" . $param['keyWord'] . "%' )";
        $end_time = $param['end_time'] == '' ? ' ' :  ' AND p.end >= "'. $param['end_time'].'"';
        $create_time = $param['create_time'] == '' ? ' ' :  ' AND p.begin >= "'. $param['create_time'].'"';
        $prepay_time = $param['prepay_time'] == '' ? ' ' :  ' AND p.prepayDate >= '. $param['prepay_time'];
        $project_state = $this->getFullProjectState($param['state']);
        $state = ($param['state'] == -1 or !isset($param['state'])) ? ' ' :  ' AND  p.status = "' . $project_state['code'] .'" ';
        $prefix = \PhalApi\DI()->config->get('dbs.tables.__default__.prefix');
        if (isset($param['fields'])) {
            $fields = $param['fields'].' ';
        }else{
            $fields = '*,u.id as u_user_id,p.id as project_id,p.status as p_state ';
        }
        $sql = 'SELECT '
            .$fields
            . 'FROM ' . $prefix . 'team AS pu '
            . 'JOIN ' . $prefix . 'project AS p '
            . ' ON pu.project = p.id '
            . 'JOIN ' . $prefix . 'project_level AS l '
            . ' ON p.level_id = l.id '
            . 'JOIN ' . $prefix . 'user AS u '
            . ' ON pu.account = u.account '
            . $key_word
            . $end_time
            . $create_time
            . $prepay_time
            . $state
            . '  and p.deleted = "0"  AND u.id = :id ';
        $params = array(':id' => $param['user_id']);
        $lists = \PhalApi\DI()->notorm->notTable->queryRows($sql, $params);
        $count = count($lists);
        $sql .= $order.' LIMIT ' . $offset . ',' . $param['page_size'];
        $lists = \PhalApi\DI()->notorm->notTable->queryRows($sql, $params);
        if ($lists) {
            $model_user = new \App\Model\User\User();
            foreach ($lists as &$item) {
                $item['state'] = $this->getProjectStateByCode($item['p_state'])['name'];
                $item['business_info'] = $model_user->get($item['business_id'], 'realname');
                $item['leader_info'] = $model_user->get($item['leader_id'], 'realname');
            }
        }
        $list = array('list' => $lists, 'count' => $count);
        return $list;
    }
    public function getList($param)
    {
        $offset = ($param['page_num'] - 1) * $param['page_size'];
        $order = $param['order'] == '' ? '' : ' ORDER BY ' . $param['order'];
        $key_word = $param['keyWord'] == '' ? ' WHERE 1=1 ' :  ' WHERE ( p.name like '. "'%"  . $param['keyWord'] . "%' OR u.realname like " . "'%" . $param['keyWord'] . "%' )";
        if (!isset($param['state'])) {
            $param['state'] = -1;
        }
        $project_state = $this->getFullProjectState($param['state']);
        $state = $param['state'] == -1 ? ' ' :  ' AND  p.status = "' . $project_state['code'] .'" ';
        $prefix = \PhalApi\DI()->config->get('dbs.tables.__default__.prefix');
        $sql = 'SELECT *,u.id as u_user_id,p.id as project_id,p.status as p_state '
            . 'FROM ' . $prefix . 'team AS pu '
            . 'JOIN ' . $prefix . 'project AS p '
            . ' ON pu.project = p.id '
            . 'JOIN ' . $prefix . 'project_level AS l '
            . ' ON p.level_id = l.id '
            . 'JOIN ' . $prefix . 'user AS u '
            . 'ON pu.account = u.account '
            . $key_word
            . $state
            . ' and p.deleted = "0" '
            . ' group by p.id';
        $params = array();
        $lists = \PhalApi\DI()->notorm->notTable->queryRows($sql, $params);
        $count = count($lists);
        $sql .= $order.' LIMIT ' . $offset . ',' . $param['page_size'];
        $lists = \PhalApi\DI()->notorm->notTable->queryRows($sql, $params);
        if ($lists) {
            $model_user = new \App\Model\User\User();
            foreach ($lists as &$item) {
                $item['state'] = $this->getProjectStateByCode($item['p_state'])['name'];
                $item['business_info'] = $model_user->get($item['business_id'], 'realname');
                $item['leader_info'] =  $model_user->get($item['leader_id'], 'realname');
            }
            unset($item);
        }
        $list = array('list' => $lists, 'count' => $count);
        return $list;
    }

    public function selectProjectUser($param)
    {
        $order = $param['order'] == '' ? '' : ' ORDER BY ' . $param['order'];
        $key_word = $param['keyWord'] == '' ? ' WHERE 1=1 ' :  ' WHERE ( u.account like '. "'%"  . $param['keyWord'] . "%' OR u.realname like " . "'%" . $param['keyWord'] . "%' )";
        $prefix = \PhalApi\DI()->config->get('dbs.tables.__default__.prefix');
        $sql = 'SELECT *,u.id as u_user_id,u.id as id,pu.id as pu_id,u.account as account   '
            . 'FROM ' . $prefix . 'user AS u '
            . 'LEFT JOIN ' . $prefix . 'team AS pu '
            . 'ON pu.account = u.account '
//            . 'JOIN ' . $prefix . 'user_level AS l '
//            . 'ON u.level_id = l.id '
//            . 'JOIN ' . $prefix . 'user_position AS p '
//            . 'ON u.position_id = p.id '
            . $key_word
            . 'GROUP BY u.id';
//            . 'AND (pu.project_id = :id '
//            . 'OR pu.project_id is null)';
        $params = array(':id' => $param['project_id']);
        $sql .= $order;
        $lists = \PhalApi\DI()->notorm->notTable->queryRows($sql, $params);
        $count = count($lists);
        if ($lists) {
            $model_project_user = new User();
            foreach ($lists as &$item) {
                $item['is_add'] = false;
                $user_info = $model_project_user->getInfo(array('project'=>$param['project_id'],'account'=>$item['account']),'id');
                if ($user_info) {
                    $item['is_add'] = true;
                }
                $item['state'] = $this->getProjectState($item['state']);
            }
            unset($item);
            $is_add_array = array();
            $no_add_array = array();
            foreach ($lists as $item) {
                if ($item['is_add']) {
                    $is_add_array[] = $item;
                }else{
                    $no_add_array[] = $item;
                }
            }
            $lists = array_merge($is_add_array,$no_add_array);
        }
        $list = array('list' => $lists, 'count' => $count);
        return $list;
    }
    public function getProjectUserList($param)
    {
        $order = $param['order'] == '' ? '' : ' ORDER BY ' . $param['order'];
        $key_word = $param['keyWord'] == '' ? ' WHERE 1=1 ' :  ' WHERE ( u.account like '. "'%"  . $param['keyWord'] . "%' OR u.realname like " . "'%" . $param['keyWord'] . "%' )";
        $prefix = \PhalApi\DI()->config->get('dbs.tables.__default__.prefix');
        $sql = 'SELECT *,u.id as u_user_id,u.id as id '
            . 'FROM ' . $prefix . 'user AS u '
            . 'LEFT JOIN ' . $prefix . 'team AS pu '
            . 'ON pu.account = u.account '
//            . 'JOIN ' . $prefix . 'user_level AS l '
//            . 'ON u.level_id = l.id '
//            . 'JOIN ' . $prefix . 'user_position AS p '
//            . 'ON u.position_id = p.id '
            . $key_word
            . 'AND pu.project = :id ';
        $params = array(':id' => $param['project_id']);
        $sql .= $order;
        $lists = \PhalApi\DI()->notorm->notTable->queryRows($sql, $params);
        $count = count($lists);
        if (isset($param['task_id']) and $param['task_id'] > 0 and $lists) {
            $model_task_user = new TaskUser();
            foreach ($lists as &$item) {
                $item['is_add'] = false;
                $user_info = $model_task_user->getInfo(array('task_id'=>$param['task_id'],'user_id'=>$item['u_user_id']),'id');
                if ($user_info) {
                    $item['is_add'] = true;
                }
            }
            unset($item);
        }
        $list = array('list' => $lists, 'count' => $count);
        return $list;
    }

    /**
     * 项目状态列表
     * @return array
     */
    public function getProjectStateList()
    {
        $type = array();
        $type[] = array('name' => '未安排', 'key' => '0', 'code' => 'wait');
        $type[] = array('name' => '已安排', 'key' => '1', 'code' => 'yianpai');
        $type[] = array('name' => '开发中', 'key' => '2', 'code' => 'doing');
        $type[] = array('name' => '已搁置', 'key' => '3', 'code' => 'suspended');
        $type[] = array('name' => '已关闭', 'key' => '4', 'code' => 'closed');
        $type[] = array('name' => '测试中', 'key' => '5', 'code' => 'testing');
        $type[] = array('name' => '已完成', 'key' => '6', 'code' => 'done');
        $type[] = array('name' => '维护中', 'key' => '7', 'code' => 'fixing');
        $type[] = array('name' => '已上线', 'key' => '8', 'code' => 'online');
        return $type;
    }

    /**
     * 获取项目状态名称
     * @param $key
     * @return mixed
     */
    public function getProjectState($key)
    {
        $task_list = $this->getProjectStateList();
        foreach ($task_list as $item) {
            if ($item['key'] == $key) {
                return $item['name'];
            }
        }
    }
    public function getFullProjectState($key)
    {
        $task_list = $this->getProjectStateList();
        foreach ($task_list as $item) {
            if ($item['key'] == $key) {
                return $item;
            }
        }
    }

    /**
     * 获取项目状态名称
     * @param $code
     * @return mixed
     */
    public function getProjectStateByCode($code)
    {
        $task_list = $this->getProjectStateList();
        foreach ($task_list as $item) {
            if ($item['code'] == $code) {
                return $item;
            }
        }
    }

    /**
     * 项目状态列表
     * @return array
     */
    public function getProjectTypeList()
    {
        $type = array();
        $type[] = array('name' => '结算', 'key' => '0', 'desc' => 'DS');
        $type[] = array('name' => '微信', 'key' => '1', 'desc' => '微享云');
        $type[] = array('name' => 'DMC', 'key' => '2', 'desc' => '多用户商城');
        $type[] = array('name' => '小程序', 'key' => '3', 'desc' => '微信小程序');
        $type[] = array('name' => '其它类型', 'key' => '4', 'desc' => '其它类型系统');
        return $type;
    }

    /**
     * 获取项目类型名称
     * @param $key
     * @return mixed
     */
    public function getProjectType($key)
    {
        $task_list = $this->getProjectStateList();
        foreach ($task_list as $item) {
            if ($item['key'] == $key) {
                return $item['name'];
            }
        }
    }
    /**
     * 项目标记列表
     * @return array
     */
    public function getProjectTicketList()
    {
        $type = array();
        $type[] = array('name' => '普通', 'key' => '0', 'desc' => '加急');
        $type[] = array('name' => '重点', 'key' => '1', 'desc' => '加急');
        $type[] = array('name' => '加急', 'key' => '2', 'desc' => '加急');
        $type[] = array('name' => '插单', 'key' => '3', 'desc' => '插单');
        return $type;
    }

    /**
     * 获取项目类型名称
     * @param $key
     * @return mixed
     */
    public function getProjectTicket($key)
    {
        $task_list = $this->getProjectStateList();
        foreach ($task_list as $item) {
            if ($item['key'] == $key) {
                return $item;
            }
        }
    }
}
