<?php
namespace App\Api\System;
use App\Common\CommonApi;
use App\Common\Exception\WrongRequestException;
use  App\Auth\Domain\Rule as DomainRule;

/**
 * 权限规则类
 */
class AuthRule extends CommonApi
{
    private static $Domain = null;

    public function __construct()
    {
        if (self::$Domain == null) {
            self::$Domain = new DomainRule();
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
                'pid' => array('name' => 'pid', 'type' => 'int', 'desc' => '上级id'),
                'field' => array('name' => 'field', 'type' => 'string', 'default' => '*', 'desc' => '返回字段'),
                'limitPage' => array('name' => 'page_num', 'type' => 'int', 'default' => '0', 'desc' => '分页页码'),
                'limitCount' => array('name' => 'page_size', 'type' => 'int', 'default' => '20', 'desc' => '单页记录条数，默认为20'),
                'order' => array('name' => 'order', 'type' => 'string', 'default' => '', 'desc' => '排序参数，如：xx ASC,xx DESC')
            ),
            'getRule' => array(
                'id' => array('name' => 'id', 'type' => 'int', 'require' => true, 'min' => 1, 'desc' => '权限id')
            ),
            'addRule' => array(
                'title' => array('name' => 'title', 'type' => 'string', 'require' => true, 'desc' => '标题'),
                'name' => array('name' => 'name', 'type' => 'string',  'require' => true,  'desc' => '名称'),
                'rule_desc' => array('name' => 'desc', 'type' => 'string', 'desc' => '描述'),
                'pid' => array('name' => 'pid', 'type' => 'int','require' => true,  'desc' => '上级'),
                'status' => array('name' => 'status', 'type' => 'int','default' => 0,  'desc' => '状态')
            ),
            'editRule' => array(
                'id' => array('name' => 'id', 'type' => 'int', 'require' => true, 'min' => 1, 'desc' => '需要修改的组id'),
                'title' => array('name' => 'title', 'type' => 'string', 'require' => true, 'desc' => '标题'),
                'name' => array('name' => 'name', 'type' => 'string',  'require' => true,  'desc' => '名称'),
                'rule_desc' => array('name' => 'desc', 'type' => 'string', 'desc' => '描述'),
                'pid' => array('name' => 'pid', 'type' => 'int','require' => true,  'desc' => '上级'),
                'status' => array('name' => 'status', 'type' => 'int','default' => 0,  'desc' => '状态')
            ),
            'delRule' => array(
                'ids' => array('name' => 'ids', 'type' => 'Array', 'format' => 'json','require' => true,  'desc' => '权限id')
            ),
        );
    }

    /**
     * 获取所有权限列表
     * @desc 获取所有权限列表
     * @return array
     */
    public function getAllList()
    {
        $domain_rule = self::$Domain;
        if ($this->pid !== null) {
            unset($this->user_info);
            $result = $domain_rule->getLimitList($this);
        } else {
            $result = $domain_rule->getList(array('keyWord' => '', 'field' => '*', 'order' => 'id asc'));
        }

        if ($result) {
            $result['list'] = \PhalApi\DI()->auth->formatList($result['list']);
        }
        return $result;
    }

    /**
     * 获取权限规则信息
     * @desc 获取权限规则信息
     * @return mixed
     */
    public function getRule()
    {
        return self::$Domain->getInfo($this->id);
    }


    /**
     * 新增权限规则
     * @desc 新增权限规则
     * @return int code 业务代码：200.操作成功，201.操作失败，202.权限名称重复
     * @throws WrongRequestException
     */
    public function addRule()
    {
        unset($this->user_info);
        $result = self::$Domain->addRule($this);
        if ($result == 1) {
            throw new WrongRequestException('操作失败', 1);
        } else if ($result == 2) {
            throw new WrongRequestException('权限名称重复', 2);
        }
    }

    /**
     * 修改权限规则信息
     * @desc 修改权限规则信息
     * @return int code 业务代码：200.操作成功，201.操作失败，202.权限名称重复
     * @throws WrongRequestException
     */
    public function editRule()
    {
        unset($this->user_info);
        $result = self::$Domain->editRule($this);
        if ($result == 1) {
            throw new WrongRequestException('操作失败', 1);
        } else if ($result == 2) {
            throw new WrongRequestException('权限名称重复', 2);
        }
    }

    /**
     * 删除权限
     * @desc 删除权限
     * @return int code 业务代码：200.操作成功，201.操作失败
     * @throws WrongRequestException
     */
    public function delRule()
    {
        $r = self::$Domain->delRule($this->ids);
        if ($r != 0) {
            throw new WrongRequestException('操作失败', 1);
        }
    }
}