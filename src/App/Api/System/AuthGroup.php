<?php
namespace App\Api\System;
use function App\addLog;
use App\Common\CommonApi;
use App\Common\Exception\WrongRequestException;
use App\Auth\Domain\Group as DomainGroup;
use  App\Auth\Domain\Group;
use  App\Auth\Domain\Rule;

/**
 * 用户组类
 * @author dogstar 20170612
 * @property mixed page_size
 * @property mixed page_num
 * @property mixed filter
 */
class AuthGroup extends CommonApi
{
    private static $Domain = null;

    public function __construct()
    {
        if (self::$Domain == null) {
            self::$Domain = new DomainGroup();
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
            'getFullGroupOne' => array(
                'id' => array('name' => 'id', 'type' => 'int', 'require' => true, 'min' => 1, 'desc' => '组id'),
                'format' => array('name' => 'format', 'type' => 'int', 'default' => 0, 'desc' => '是否格式化')
            ),
            'addGroup' => array(
                'title' => array('name' => 'title', 'type' => 'string', 'require' => true, 'desc' => '用户组名称'),
                'status' => array('name' => 'status', 'type' => 'int', 'default' => 1, 'desc' => '状态，1.正常，0.禁用'),
                'desc' => array('name' => 'desc', 'type' => 'string', 'desc' => '用户组描述'),
                'rules' => array('name' => 'rules', 'type' => 'Array', 'format' => 'json', 'desc' => '权限规则id集合'),
                'menus' => array('name' => 'menus', 'type' => 'Array', 'format' => 'json', 'desc' => '系统菜单id集合')
            ),
            'editGroup' => array(
                'id' => array('name' => 'id', 'type' => 'int', 'require' => true, 'min' => 1, 'desc' => '需要修改的组id'),
                'title' => array('name' => 'title', 'type' => 'string', 'require' => true, 'desc' => '组名称'),
                'status' => array('name' => 'status', 'type' => 'int', 'title' => '状态，1.正常，0.禁用'),
                'desc' => array('name' => 'desc', 'type' => 'string', 'desc' => '描述'),
                'rules' => array('name' => 'rules', 'type' => 'Array', 'format' => 'json', 'desc' => '规则id'),
                'menus' => array('name' => 'menus', 'type' => 'Array', 'format' => 'json', 'desc' => '菜单id')
            ),
            'getGroupAccess' => array(
                'user_id' => array('name' => 'user_id', 'type' => 'int', 'require' => true, 'desc' => '用户id')
            ),
            'delGroup' => array(
                'ids' => array('name' => 'ids', 'type' => 'Array', 'format' => 'json', 'require' => true, 'desc' => '组id')
            ),
            'setRules' => array(
                'id' => array('name' => 'id', 'type' => 'int', 'require' => true, 'min' => 1, 'desc' => '组id'),
                'rules' => array('name' => 'rules', 'type' => 'string', 'default' => '', 'desc' => '规则id，逗号隔开多个')
            ),
            'assGroupAccess' => array(
                'uid' => array('name' => 'uid', 'type' => 'int', 'require' => true, 'min' => 0, 'desc' => '用户id'),
                'group_id' => array('name' => 'group_id', 'type' => 'Array', 'format' => 'json', 'default' => '', 'desc' => '用户组id')
            ),
            'getGroupUserList' => array(
                'id' => array('name' => 'id', 'type' => 'int', 'required' => true, 'desc' => '组id'),
                'limitPage' => array('name' => 'page_num', 'type' => 'int', 'default' => '0', 'desc' => '分页页码'),
                'limitCount' => array('name' => 'page_size', 'type' => 'int', 'default' => '20', 'desc' => '单页记录条数，默认为20'),
                'order' => array('name' => 'order', 'type' => 'string', 'default' => '', 'desc' => '排序参数，如：xx ASC,xx DESC'),
                'keyWord' => array('name' => 'keyword', 'type' => 'string', 'default' => '', 'desc' => '关键词')
            ),
            'removeGroupUser' => array(
                'ids' => array('name' => 'ids', 'type' => 'Array', 'format' => 'json', 'require' => true, 'min' => 0, 'desc' => '用户id'),
                'group_id' => array('name' => 'group_id', 'type' => 'int', 'require' => true, 'desc' => '组id')
            ),
        );
    }

    /**
     * 获取用户组用户列表
     * @desc 获取用户组用户列表
     * @return mixed
     */
    public function getGroupUserList()
    {
        unset($this->user_info);
        return self::$Domain->getGroupUserList($this);
    }

    /**
     * 移除用户组用户
     * @desc 移除用户组用户
     */
    public function removeGroupUser()
    {
        self::$Domain->removeGroupUser($this->ids, $this->group_id);
    }

    /**
     * 获取用户所在用户组
     * @desc 获取用户所在用户组
     * @return mixed
     */
    public function getGroupAccess()
    {
        return self::$Domain->getUserInGroups($this->user_id);
    }

    /**
     * 获取系统所有权限列表
     * @desc 获取系统所有权限列表
     * @return array
     */
    public function getAllList()
    {
        $domain_rule = new Rule();
        $result = $domain_rule->getList(array('keyWord' => '', 'field' => '*', 'order' => 'id asc'));
        if ($result) {
            $result['list'] = \PhalApi\DI()->auth->formatList($result['list']);
        }
        return $result;
    }

    /**
     * 获取用户组全部信息
     * @desc 获取用户组全部信息，包含权限规则和权限菜单信息
     * @return array info 用户组信息对象
     * @return array info.rules 权限规则列表
     * @return array info.menus 权限菜单相关信息
     * @return array info.menus.menu_list 权限菜单列表
     * @return array info.menus.menu_model_list 菜单模块列表
     * @return mixed
     */
    public function getFullGroupOne()
    {
        $domain_group = new Group();
        return $domain_group->getFullGroupOne($this->id, $this->format);
    }

    /**
     * 获取用户组列表
     * @desc 获取用户组列表
     * @return array
     * @return object info 组信息对象
     * @return object info.items 组数据行
     * @return int info.count 数据总数，用于分页
     * @return string msg 业务消息
     */
    public function getList()
    {
        unset($this->user_info);
        return self::$Domain->getGroupList($this);
    }

    /**
     * 新建用户组
     * @desc 新建用户组
     * @return int code 业务代码：0：操作成功，201：操作失败，202：组名重复
     * @throws WrongRequestException
     */
    public function addGroup()
    {
        unset($this->user_info);
        $this->add_time = time();
        sort($this->menus);
        $this->menus = implode(',', $this->menus);
        sort($this->rules);
        $this->rules = implode(',', $this->rules);
        $result = self::$Domain->addGroup($this);
        if ($result == 0) {
        } else if ($result == 1) {
            throw new WrongRequestException('操作失败', 1);
        } else if ($result == 2) {
            throw new WrongRequestException('组名重复', 2);
        }
    }

    /**
     * 编辑用户组
     * @desc 编辑用户组
     * @return int code 业务代码：200.操作成功，201.操作失败，202.组名重复
     * @throws WrongRequestException
     */
    public function editGroup()
    {
        unset($this->user_info);
        sort($this->menus);
        $this->menus = implode(',', $this->menus);
        sort($this->rules);
        $this->rules = implode(',', $this->rules);
        $result = self::$Domain->editGroup($this);
        if ($result == 1) {
            throw new WrongRequestException('操作失败', 1);
        } else if ($result == 2) {
            throw new WrongRequestException('组名重复', 2);
        }
    }

    /**
     * 删除用户组
     * @desc 删除用户组
     * @return int code 业务代码：200.操作成功，201.操作失败
     * @throws WrongRequestException
     */
    public function delGroup()
    {
        $result = self::$Domain->delGroup($this->ids);
        if ($result != 0) {
            throw new WrongRequestException('删除失败', 1);
        }

    }

    /**
     * 用户组关联用户
     * @desc 用户组关联用户
     * @return int code 业务代码：200.操作成功，201.操作失败
     * @throws WrongRequestException
     */
    public function assGroupAccess()
    {
        unset($this->user_info);
        $result = self::$Domain->assUser($this);
        if ($result) {
            throw new WrongRequestException('操作失败', 1);
        }
    }
}