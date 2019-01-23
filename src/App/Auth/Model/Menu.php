<?php

namespace App\Auth\Model;

use function App\addLog;
use PhalApi\Model\NotORMModel as NotORM;

/*
/**
 * 菜单模型类
 * @author: hms 2015-8-6
 */

class Menu extends NotORM
{

    protected function getTableName($id)
    {
        return \PhalApi\DI()->config->get('app.auth.auth_menu');
    }

    /**获取列表
     * @param $param
     * @return mixed
     */
    public function getList($param, $order = 'id asc')
    {
        $r = $this->getORM()->select($param['field'])->where('title LIKE ?', "%" . $param['keyWord'] . "%")
            ->or('name LIKE ?', "%" . $param['keyWord'] . "%")
//            ->limit($param['limitPage'], $param['limitCount'])
            ->order($order)
            ->fetchAll();
        return $r;
    }

    /**获取列表
     * @param $param
     * @return mixed
     */
    public function getLimitList($param)
    {
        $param['limitPage'] = ($param['limitPage'] - 1) * $param['limitCount'];
        if (isset($param['pid'])) {
            $r = $this->getORM()->where('(title LIKE :title OR name LIKE :name) AND pid = :pid', array(':title' => "%" . $param['keyWord'] . "%", ':name' => "%" . $param['keyWord'] . "%", ':pid' => $param['pid']))->limit($param['limitPage'], $param['limitCount'])
                ->order($param['order'])
                ->fetchAll();;
//            $r = $this->getORM()->select($param['field'])->where('pid = ?',$param['pid'])->where('title LIKE ?', "%" . $param['keyWord'] . "%")
//                ->or('name LIKE ?', "%" . $param['keyWord'] . "%")
//                ->limit($param['limitPage'], $param['limitCount'])
//                ->order($param['order'])
//                ->fetchAll();
        } else {
            $r = $this->getORM()->select($param['field'])->where('title LIKE ?', "%" . $param['keyWord'] . "%")
                ->or('name LIKE ?', "%" . $param['keyWord'] . "%")
                ->limit($param['limitPage'], $param['limitCount'])
                ->order($param['order'])
                ->fetchAll();
        }
        return $r;
    }

    public function getInfo($id)
    {
        $r = $this->getORM()->where('id', $id)->fetchOne();
        if ($r) {
            $parent_info = $this->getInfo($r['pid']);
            if ($parent_info) {
                $r['parent_title'] = $parent_info['title'];
            }
        }
        return $r;
    }

    /**获取总数
     * @param $keyWord
     * @return mixed
     */
    public function getCount($keyWord)
    {
        $r = $this->getORM()->where('title LIKE ? ', "%" . $keyWord . "%")
            ->or('name LIKE ?', "%" . $keyWord . "%")
            ->count();
        return $r;
    }

    public function getLimitCount($keyWord, $pid)
    {
        if ($pid !== null) {
//            $r = $this->getORM()->where('pid = ?',$pid)->where('title LIKE ? ', "%" . $keyWord . "%")
//                ->or('name LIKE ?', "%" . $keyWord . "%")
//                ->count();
            $r = $this->getORM()->where('(title LIKE :title OR name LIKE :name) AND pid = :pid', array(':title' => "%" . $keyWord . "%", ':name' => "%" . $keyWord . "%", ':pid' => $pid))
                ->count();
        } else {
            $r = $this->getORM()->where('title LIKE ? ', "%" . $keyWord . "%")
                ->or('name LIKE ?', "%" . $keyWord . "%")
                ->count();
        }
        return $r;
    }

    /**添加菜单
     * @param $param
     * @return bool
     */
    public function addMenu($param)
    {
        $rom = $this->getORM();
        $rom->insert($param);
        $id = $rom->insert_id();
        if (!empty($id)) {
            addLog("新增菜单，编号：$id");
        }
        return empty($id) ? false : true;
    }

    /**修改菜单
     * @param $id
     * @param $info
     * @return bool
     */
    public function editMenu($id, $info)
    {
        $r = $this->getORM()->where('id', $id)->update($info);
        return $r === false ? false : true;
    }

    /** 删除菜单
     * @param $ids
     * @return bool
     */
    public function delMenu($ids)
    {
        $r = $this->getORM()->where('id', $ids)->delete();
        return $r === false ? false : true;
    }

    /**
     * 检测菜单标识是否重复
     * @param string $name
     * @param int $id
     * @return boolean
     */
    public function checkRepeat($name, $id = 0)
    {
        $r = $this->getORM()->select('id')->where('name', $name)->where('id != ?', $id)->fetchOne();
        return !empty($r) ? true : false;
    }

    public function getMenusInGroups($gids)
    {
        $menus = $this->getORM()->select('*')
            ->where(array('id' => $gids, 'status' => 1))->order('sort desc')
            ->fetchAll();
        return $menus;
    }

    public function getMenusInGroupsCache($gids)
    {
        $menus = \PhalApi\DI()->cache->get('menusInGroups'); //缓存读取
        if ($menus == null) {
            $menus = self::getMenusInGroups($gids);
            \PhalApi\DI()->cache->set('menusInGroups', $menus);
        }
        return $menus;
    }


}
