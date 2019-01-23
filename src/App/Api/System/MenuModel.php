<?php
namespace App\Api\System;
use function App\addLog;
use App\Common\CommonApi;
use App\Common\Exception\WrongRequestException;
use App\Auth\Domain\MenuModel as DomainMenuModel;

/**
 * 权限菜单模块类
 * @author dogstar 20170612
 * @property mixed page_size
 * @property mixed page_num
 * @property mixed filter
 */
class MenuModel extends CommonApi
{
    private static $Domain = null;

    public function __construct()
    {
        if (self::$Domain == null) {
            self::$Domain = new DomainMenuModel();
        }
    }

    public function getRules()
    {
        return array(
            'getList' => array(
                'keyWord' => array('name' => 'keyword', 'type' => 'string', 'default' => '', 'desc' => '关键词'),
                'field' => array('name' => 'field', 'type' => 'string', 'default' => '*', 'desc' => '返回字段'),
                'limitPage' => array('name' => 'page_num', 'type' => 'int', 'default' => '0', 'desc' => '分页页码'),
                'limitCount' => array('name' => 'page_size', 'type' => 'int', 'default' => '20', 'desc' => '单页记录条数，默认为20'),
                'order' => array('name' => 'order', 'type' => 'string', 'default' => '', 'desc' => '排序参数，如：xx ASC,xx DESC')
            ),
            'getAllList' => array(
                'field' => array('name' => 'field', 'type' => 'string', 'default' => '*', 'desc' => '返回字段'),
                'order' => array('name' => 'order', 'type' => 'string', 'default' => '', 'desc' => '排序参数，如：xx ASC,xx DESC')
            ),
            'getModel' => array(
                'id' => array('name' => 'id', 'type' => 'int', 'require' => true, 'min' => 1, 'desc' => '菜单id')
            ),
            'addModel' => array(
                'title' => array('name' => 'title', 'type' => 'string', 'require' => true, 'desc' => '标题'),
                'name' => array('name' => 'name', 'type' => 'string',  'require' => true,  'desc' => '名称'),
                'path' => array('name' => 'path', 'type' => 'string',  'default' => '',  'desc' => '路径'),
                'sort' => array('name' => 'sort', 'type' => 'int',  'default' => 0,  'desc' => '排序'),
                'icon' => array('name' => 'icon', 'type' => 'string',  'default' => '',  'desc' => '图标'),
                'model_desc' => array('name' => 'desc', 'type' => 'string', 'desc' => '描述'),
                'status' => array('name' => 'status', 'type' => 'int','default' => 0,  'desc' => '状态')
            ),
            'editModel' => array(
                'id' => array('name' => 'id', 'type' => 'int', 'require' => true, 'min' => 1, 'desc' => '需要修改的组id'),
                'title' => array('name' => 'title', 'type' => 'string', 'require' => true, 'desc' => '标题'),
                'name' => array('name' => 'name', 'type' => 'string',  'require' => true,  'desc' => '名称'),
                'path' => array('name' => 'path', 'type' => 'string',  'default' => '',  'desc' => '路径'),
                'sort' => array('name' => 'sort', 'type' => 'int',  'default' => 0,  'desc' => '排序'),
                'icon' => array('name' => 'icon', 'type' => 'string',  'default' => '',  'desc' => '图标'),
                'model_desc' => array('name' => 'desc', 'type' => 'string', 'desc' => '描述'),
                'status' => array('name' => 'status', 'type' => 'int','default' => 0,  'desc' => '状态')
            ),
            'delModel' => array(
                'ids' => array('name' => 'ids', 'type' => 'Array', 'format' => 'json','require' => true,  'desc' => '菜单id')
            ),
        );
    }

    /**
     * 获取所有菜单模块列表
     * @desc 获取所有菜单模块列表
     * @return array
     */
    public function getList()
    {
        unset($this->user_info);
        $result = self::$Domain->getLimitList($this);
        return $result;
    }

    /**
     * 获取所有菜单模块列表
     * @desc 获取所有菜单模块列表
     * @return array
     */
    public function getAllList()
    {
        unset($this->user_info);
        $result = self::$Domain->getAllList($this);
        return $result;
    }



    /**
     *  新增菜单模块
     * @desc 新增菜单模块
     * @return int code 业务代码：200.操作成功，201.操作失败，202.菜单模块名称重复
     * @throws WrongRequestException
     */
    public function addModel()
    {
        unset($this->user_info);
        $result = self::$Domain->addModel($this);
        if ($result == 1) {
            throw new WrongRequestException('操作失败', 1);
        } else if ($result == 2) {
            throw new WrongRequestException('菜单模块名称重复', 2);
        }
    }

    /**
     * 获取模块信息
     * @desc 获取模块信息
     * @return mixed
     */
    public function getModel()
    {
        return self::$Domain->getInfo($this->id);
    }

    /**
     * 修改菜单模块
     * @desc 修改菜单模块
     * @return int code 业务代码：200.操作成功，201.操作失败，202.菜单模块名称重复
     * @throws WrongRequestException
     */
    public function editModel()
    {
        unset($this->user_info);
        $result = self::$Domain->editModel($this);
        if ($result == 1) {
            throw new WrongRequestException('操作失败', 1);
        } else if ($result == 2) {
            throw new WrongRequestException('菜单模块名称重复', 2);
        }
    }

    /**
     * 删除菜单模块
     * @desc 删除菜单模块
     * @return int code 业务代码：200.操作成功，201.操作失败
     * @throws WrongRequestException
     */
    public function delModel()
    {
        $result = self::$Domain->delModel($this->ids);
        if ($result != 0) {
            throw new WrongRequestException('操作失败', 1);
        }
    }
}