<?php
namespace App\Api\System;
use function App\addLog;
use App\Common\CommonApi;
use App\Common\Exception\WrongRequestException;
use  App\Auth\Domain\Menu as DomainMenu;
use  App\Auth\Domain\Menu;

/**
 * 权限菜单类
 */
class AuthMenu extends CommonApi
{
    private static $Domain = null;

    public function __construct()
    {
        if (self::$Domain == null) {
            self::$Domain = new DomainMenu();
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
                'keyWord' => array('name' => 'keyword', 'type' => 'string', 'default' => '', 'desc' => '关键词'),
                'pid' => array('name' => 'pid', 'type' => 'int','default' => -1, 'desc' => '上级id'),
                'field' => array('name' => 'field', 'type' => 'string', 'default' => '*', 'desc' => '返回字段'),
                'limitPage' => array('name' => 'page_num', 'type' => 'int', 'default' => '0', 'desc' => '分页页码'),
                'limitCount' => array('name' => 'page_size', 'type' => 'int', 'default' => '20', 'desc' => '单页记录条数，默认为20'),
                'order' => array('name' => 'order', 'type' => 'string', 'default' => '', 'desc' => '排序参数，如：xx ASC,xx DESC')
            ),
            'getMenu' => array(
                'id' => array('name' => 'id', 'type' => 'int', 'require' => true, 'min' => 1, 'desc' => '菜单id')
            ),
            'addMenu' => array(
                'title' => array('name' => 'title', 'type' => 'string', 'require' => true, 'desc' => '标题'),
                'name' => array('name' => 'name', 'type' => 'string', 'require' => true, 'desc' => '名称'),
                'path' => array('name' => 'path', 'type' => 'string', 'default' => '', 'desc' => '路径'),
                'sort' => array('name' => 'sort', 'type' => 'int', 'default' => 0, 'desc' => '排序'),
                'icon' => array('name' => 'icon', 'type' => 'string', 'default' => '', 'desc' => '图标'),
                'model' => array('name' => 'model', 'type' => 'string', 'require' => true, 'desc' => '模块'),
                'menu_desc' => array('name' => 'desc', 'type' => 'string', 'desc' => '描述'),
                'pid' => array('name' => 'pid', 'type' => 'int', 'require' => true, 'desc' => '上级'),
                'status' => array('name' => 'status', 'type' => 'int', 'default' => 0, 'desc' => '状态')
            ),
            'editMenu' => array(
                'id' => array('name' => 'id', 'type' => 'int', 'require' => true, 'min' => 1, 'desc' => '需要修改的组id'),
                'title' => array('name' => 'title', 'type' => 'string', 'require' => true, 'desc' => '标题'),
                'name' => array('name' => 'name', 'type' => 'string', 'require' => true, 'desc' => '名称'),
                'path' => array('name' => 'path', 'type' => 'string', 'default' => '', 'desc' => '路径'),
                'sort' => array('name' => 'sort', 'type' => 'int', 'default' => 0, 'desc' => '排序'),
                'icon' => array('name' => 'icon', 'type' => 'string', 'default' => '', 'desc' => '图标'),
                'model' => array('name' => 'model', 'type' => 'string', 'require' => true, 'desc' => '模块'),
                'menu_desc' => array('name' => 'desc', 'type' => 'string', 'desc' => '描述'),
                'pid' => array('name' => 'pid', 'type' => 'int', 'require' => true, 'desc' => '上级'),
                'status' => array('name' => 'status', 'type' => 'int', 'default' => 0, 'desc' => '状态')
            ),
            'delMenu' => array(
                'ids' => array('name' => 'ids', 'type' => 'Array', 'format' => 'json', 'require' => true, 'desc' => '菜单id')
            ),
        );
    }

    /**
     * 获取所有菜单列表
     * @desc 获取所有菜单列表
     * @return array
     */
    public function getAllList()
    {
        $domain_menu = new Menu();
        if ($this->pid !== null and $this->pid !== -1) {
            unset($this->user_info);
            $result = $domain_menu->getLimitList($this);
        } else {
            $result = $domain_menu->getList(array('keyWord' => '', 'field' => '*', 'order' => 'id asc'));
        }

        if ($result) {
            $result['list'] = \PhalApi\DI()->auth->formatList($result['list']);
        }
        return $result;
    }

    /**
     *  获取菜单信息
     * @desc 获取菜单信息
     * @return mixed
     */
    public function getMenu()
    {
        return self::$Domain->getInfo($this->id);
    }


    /**
     * 新增菜单
     * @desc 新增菜单
     * @return int code 业务代码：200.操作成功，201.操作失败，202.菜单名称重复
     * @throws WrongRequestException
     */
    public function addMenu()
    {
        unset($this->user_info);
        $result = self::$Domain->addMenu($this);
        if ($result == 1) {
            throw new WrongRequestException('操作失败', 1);
        } else if ($result == 2) {
            throw new WrongRequestException('菜单名称重复', 2);
        }
    }

    /**
     * 修改菜单
     * @desc 修改菜单
     * @return int code 业务代码：200.操作成功，201.操作失败，202.菜单名称重复
     * @throws WrongRequestException
     */
    public function editMenu()
    {
        unset($this->user_info);
        $result = self::$Domain->editMenu($this);
        if ($result == 1) {
            throw new WrongRequestException('操作失败', 1);
        } else if ($result == 2) {
            throw new WrongRequestException('菜单名称重复', 2);
        }
    }

    /**
     * 删除菜单
     * @desc 删除菜单
     * @return int code 业务代码：200.操作成功，201.操作失败
     * @throws WrongRequestException
     */
    public function delMenu()
    {
        $result = self::$Domain->delMenu($this->ids);
        if ($result != 0) {
            throw new WrongRequestException('操作失败', 1);
        }
    }
}