<?php
namespace App\Common;
use PhalApi\Model\NotORMModel as NotORM;
class CommonModel extends NotORM
{

    /**
     * @param $param
     * @return array total：记录总数  rows:分段结果集
     * @internal param int $page_size 页面大小
     * @internal param int $page_num 页码
     * @internal param array $where 查询条件
     * @internal param string $order 排序
     * @internal param string $field 字段
     */
    public function getList($param)
    {
        if (!is_array($param)) {
            $param = get_object_vars($param);
        }
        if (!isset($param['page_num'])) {
            $param['page_num'] = 1;
        }
        if (!isset($param['page_size'])) {
            $param['page_size'] = PAGE_SIZE;
        }
        if (!isset($param['field'])) {
            $param['field'] = '*';
        }
        if (!isset($param['order'])) {
            $param['order'] = 'id desc';
        }
        if (!isset($param['where'])) {
            $param['where'] = array();
        }
        $total = $this->getORM()->where($param['where'])->count();
        $offset = ($param['page_num'] - 1) * $param['page_size'];
        $lists = $this->getORM()->where($param['where'])->select($param['field'])->limit($offset, $param['page_size'])->order($param['order'])->fetchAll();
        return array('count' => $total, 'list' => $lists);
    }

    public function getCount($condition = array())
    {
        return $this->getORM()->where($condition)->count();
    }

    /**
     * 根据查询条件获取单条数据
     * @param array $condition
     * @param string $field
     * @return mixed
     */
    public function getInfo($condition = array(), $field = '*')
    {
        return $this->getORM()->where($condition)->select($field)->fetchOne();
    }

    /**
     * 根据查询条件获取所有数据
     * @param array $condition
     * @param string $field
     * @return mixed
     */
    public function getListByWhere($condition = array(), $field = '*', $order = 'id desc')
    {
        return $this->getORM()->where($condition)->select($field)->order($order)->fetchAll();
    }


    /**
     * 根据查询条件更新数据
     * @param array $condition
     * @param array $data
     * @return boolean|int 执行成功返回影响条数，失败返回false
     */
    public function updateByWhere($where, $data)
    {
        $this->formatExtData($data);
        return $this->getORM()->where($where)->update($data);
    }
    public function updateByIds($ids, $data)
    {
        $r = $this->getORM()->where('id', $ids)->update($data);
        return $r === false ? false : true;
    }
    public function deleteByWhere($where)
    {
        $this->formatExtData($data);
        return $this->getORM()->where($where)->delete();
    }

    /**
     * 直接执行手写sql语句更新或者插入
     * @param string $sql sql更新或者插入语句
     * @param array $params 更新或者插入条件和更新或者插入数据
     * @return boolean|int 执行成功返回影响条数，失败返回false
     */
    public function queryExecute($sql, $params = array())
    {
        return $this->getORM()->query($sql, $params);
    }

    /** 删除
     * @param $ids
     * @return bool
     */
    public function delItems($ids)
    {
        $r = $this->getORM()->where('id', $ids)->delete();
        return $r === false ? false : true;
    }

    public function getListByIds($ids,$keys = 'id',$order = 'id desc',$field='*')
    {
        return $this->getORM()->where($keys, $ids)->select($field)->order($order)->fetchAll();
    }

}