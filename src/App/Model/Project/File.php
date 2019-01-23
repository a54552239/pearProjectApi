<?php
namespace App\Model\Project;
use App\Common\CommonModel;
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2017/3/23 0023
 * Time: 9:37
 */
class File extends CommonModel
{
    public function getFileListByTaskIds($ids,$order = 'id desc',$extend = array())
    {
        return $this->getORM()->where('objectID', $ids)->where('objectType', 'task')->where($extend)->order($order)->fetchAll();
    }
    public function getFileListByDocIds($ids,$order = 'id desc',$extend = array())
    {
        return $this->getORM()->where('objectID', $ids)->where('objectType', 'doc')->where($extend)->order($order)->fetchAll();
    }

    protected function getTableName($id)
    {
        return 'file';
    }

}