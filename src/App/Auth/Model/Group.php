<?php
namespace App\Auth\Model;
use function App\addLog;
use PhalApi\Model\NotORMModel as NotORM;

/*
/**
 * 组模型类
 * @author: hms 2015-8-6
 */

class Group extends NotORM
{

    protected function getTableName($id)
    {
        return \PhalApi\DI()->config->get('app.auth.auth_group');
    }

    /**获取列表
     * @param $param
     * @return mixed
     */
    public function getGroupList($param)
    {
        $param['limitPage'] = ($param['limitPage'] - 1) * $param['limitCount'];
        $r = $this->getORM()->select($param['field'])->where('title LIKE ?', "%" . $param['keyWord'] . "%")->or('`desc` LIKE ?', "%" . $param['keyWord'] . "%")->limit($param['limitPage'], $param['limitCount'])->order($param['order'])->fetchAll();
        return $r;
    }

    public function getGroupOne($id)
    {
        $r = $this->getORM()->where('id', $id)->fetchOne();
        return $r;
    }

    /**获取总数
     * @param $keyWord
     * @return mixed
     */
    public function getGroupCount($keyWord)
    {
        $r = $this->getORM()->where('title LIKE ?', "%" . $keyWord . "%")->or('`desc` LIKE ?', "%" . $keyWord . "%")->count();
        return $r;
    }

    public function getGroupUserCount($param)
    {
        $prefix = \PhalApi\DI()->config->get('dbs.tables.__default__.prefix');
//        $sql = 'SELECT count(*) as c '
//            . ' FROM '. $prefix . \PhalApi\DI()->config->get('app.auth.auth_group_access') . ' AS g'
//            . ' JOIN '. $prefix . \PhalApi\DI()->config->get('app.auth.auth_user') . ' AS u'
//            . ' ON g.uid = u.id '
//            . ' WHERE g.uid = ' . $param['id'];
        $sql = 'SELECT u.id '
            . 'FROM ' . $prefix . \PhalApi\DI()->config->get('app.auth.auth_group_access') . ' AS g '
            . 'JOIN ' . $prefix . \PhalApi\DI()->config->get('app.auth.auth_user') . ' AS u '
            . 'ON g.uid = u.id AND ( u.account like ' . "'%" . $param['keyWord'] . "%' OR u.realname like " . "'%" . $param['keyWord'] . "%' )"
            . 'WHERE g.group_id = :id';
        $params = array(':id' => $param['id']);
        $result = \PhalApi\DI()->notorm->notTable->queryRows($sql, $params);
        return count($result);
    }

    public function getGroupUserList($param)
    {
        $prefix = \PhalApi\DI()->config->get('dbs.tables.__default__.prefix');
        $param['limitPage'] = ($param['limitPage'] - 1) * $param['limitCount'];
        $order = $param['order'] == '' ? '' : ' ORDER BY ' . $param['order'];
        $sql = 'SELECT * '
            . 'FROM ' . $prefix . \PhalApi\DI()->config->get('app.auth.auth_group_access') . ' AS g'
            . ' JOIN ' . $prefix . \PhalApi\DI()->config->get('app.auth.auth_user') . ' AS u'
            . ' ON g.uid = u.id  AND ( u.account like '. "'%"  . $param['keyWord'] . "%' OR u.realname like " . "'%" . $param['keyWord'] . "%' )"
            . ' WHERE g.group_id = :id'
            . ' LIMIT ' . $param['limitPage'] . ',' . $param['limitCount']
            . $order;
        $params = array(':id' => $param['id']);
        $result = \PhalApi\DI()->notorm->notTable->queryRows($sql, $params);
        return $result;
    }

    /**添加组
     * @param $param
     * @return bool
     */
    public function addGroup($param)
    {
        $rom = $this->getORM();
        $rom->insert($param);
        $id = $rom->insert_id();
        $result = empty($id) ? false : true;
        if ($result == true) {
            addLog("新增用户组，编号：[$id]");
        }
        return $result;
    }

    /**修改组
     * @param $id
     * @param $info
     * @return bool
     */
    public function editGroup($id, $info)
    {
        $r = $this->getORM()->where('id', $id)->update($info);
        return $r === false ? false : true;
    }

    /** 删除组
     * @param $ids
     * @return bool
     */
    public function delGroup($ids)
    {
        $r = $this->getORM()->where('id', $ids)->delete();
        $result = $r === false ? false : true;
        if ($result) {
            $ids = json_encode($ids);
            addLog("删除用户组，编号：$ids");
        }
        return $result;
    }

    /**
     * 检测组名称是否重复
     * @param type $title
     * @return boolean
     */
    public function checkRepeat($title, $id = 0)
    {
        $r = $this->getORM()->select('id')->where('title', $title)->where('id != ?', $id)->fetchOne();
        return !empty($r) ? true : false;
    }

    /**设置规则
     * @param $id
     * @param $info
     * @return bool
     */
    public function setRules($id, $info)
    {
        $r = $this->getORM()->where('id', $id)->update($info);
        $result = $r === false ? false : true;
        return $result;
    }

    public function getUserInGroups($uid)
    {
        $prefix = \PhalApi\DI()->config->get('dbs.tables.__default__.prefix');
        $sql = 'SELECT g.id, g.rules, g.menus, g.menus  '
            . 'FROM ' . $prefix . \PhalApi\DI()->config->get('app.auth.auth_group_access') . ' AS a '
            . 'JOIN ' . $prefix . \PhalApi\DI()->config->get('app.auth.auth_group') . ' AS g '
            . 'ON a.group_id = g.id '
            . 'where a.uid=:uid and g.status=:status';
        $params = array(':uid' => $uid, ':status' => 1);
        $user_groups = \PhalApi\DI()->notorm->notTable->queryRows($sql, $params);
        return $user_groups;
    }

    public function getUserInGroupsCache($uid)
    {
        $user_groups = \PhalApi\DI()->cache->get($uid . '_auth_groups'); //读缓存
        if ($user_groups == null) {
            $user_groups = self::getUserInGroups($uid);
            \PhalApi\DI()->cache->set($uid . '_auth_groups', $user_groups);
        }
        return $user_groups;
    }

}
