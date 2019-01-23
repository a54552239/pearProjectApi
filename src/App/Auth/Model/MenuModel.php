<?php
namespace App\Auth\Model;
use function App\addLog;
use App\Common\CommonModel;

/*
/**
 * 菜单模块模型类
 * @author: hms 2015-8-6
 */

class MenuModel extends CommonModel
{


    public function getLimitCount($keyWord)
    {
        $r = $this->getORM()->where('title LIKE ? ', "%" . $keyWord . "%")
            ->or('name LIKE ?', "%" . $keyWord . "%")
            ->count();
        return $r;
    }

    /**获取列表
     * @param $param
     * @return mixed
     */
    public function getLimitList($param)
    {
        $param['limitPage'] = ($param['limitPage'] - 1) * $param['limitCount'];
        $r = $this->getORM()->select($param['field'])->where('title LIKE ?', "%" . $param['keyWord'] . "%")
            ->or('name LIKE ?', "%" . $param['keyWord'] . "%")
            ->limit($param['limitPage'], $param['limitCount'])
            ->order($param['order'])
            ->fetchAll();
        return $r;
    }

    public function getAllList($param)
    {
        if (is_object($param)) {
            $param = get_object_vars($param);
        }
        $rs = array('list' => array(), 'count' => 0);
        $rs['count'] = self::$Model->getCount(array());
        $rs['list'] = self::$Model->getListByWhere(array(),$param['field'],$param['order']);
        return $rs;
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

    /**添加菜单
     * @param $param
     * @return bool
     */
    public function addModel($param)
    {
        $rom = $this->getORM();
        $rom->insert($param);
        $id = $rom->insert_id();
        if (!empty($id)) {
            addLog("新增菜单模块，编号：$id");
        }
        return empty($id) ? false : true;
    }

    /**修改菜单
     * @param $id
     * @param $info
     * @return bool
     */
    public function editModel($id, $info)
    {
        $r = $this->getORM()->where('id', $id)->update($info);
        return $r === false ? false : true;
    }

    /** 删除菜单
     * @param $ids
     * @return bool
     */
    public function delModel($ids)
    {
        $r = $this->getORM()->where('id', $ids)->delete();
        return $r === false ? false : true;
    }

    public function getInfoByName($name)
    {
        $r = $this->getORM()->where('name', $name)->fetchOne();
        return $r;
    }


    protected function getTableName($id)
    {
        return \PhalApi\DI()->config->get('app.auth.auth_menu_model');
    }
}
