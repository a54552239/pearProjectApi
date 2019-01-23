<?php
/**
 * 请在下面放置任何您需要的应用配置
 *
 * @license     http://www.phalapi.net/license GPL 协议
 * @link        http://www.phalapi.net/
 * @author dogstar <chanzonghuang@gmail.com> 2017-07-13
 */

return array(

    /**
     * 应用接口层的统一参数
     */
    'apiCommonRules' => array(//'sign' => array('name' => 'sign', 'require' => true),
    ),

    /**
     * 接口服务白名单，格式：接口服务类名.接口服务方法名
     *
     * 示例：
     * - *.*            通配，全部接口服务，慎用！
     * - Site.*      Api_Default接口类的全部方法
     * - *.Index        全部接口类的Index方法
     * - Site.Index  指定某个接口服务，即Api_Default::Index()
     */
    'service_whitelist' => array(
        'Site.Index',
    ),
    /**
     * 不需要权限验证
     */
    'service_no_auth' => array(
        'User_User.Login',
        'User_User.getInfoByToken',
        'User_User.getUserMenu',
        'User_User.getUserMenuModel',
        'User_User.getUserAuth',
        'System_AuthMenu.getAllList',
        'System_AuthGroup.getAllList',
        'Project_Task.downloadTaskFile',
        'Project_Project.batchDownloadTaskFile',
        'Common_Notify.getNotifyTypeList',
        'Common_Notify.getList',
        'Common_Notify.getListForUser',
        'Common_Notify.setFinallySendTime',
        'Project_Project.getProjectTypeList',
        'Project_Project.getProjectTicketList',
        'Common_Notify.batchTicketRead',
        'Common_Notify.ticketRead',
        'Common_Search.search',
        'Common_Notify.doSomeThing',
        'Common_Notify.fixedExecutor',
        'Common_Notify.pushNotify',
        'Common_Notify.pushTaskRemind',
        'Common_Notify.bindClientId',
    ),
    /**
     * 不需要登录验证
     */
    'service_no_login' => array(
        'Project_Task.downloadTaskFile',
        'Project_Project.batchDownloadTaskFile',
        'Common_Notify.getNotifyTypeList',
        'Common_Notify.getList',
        'Common_Notify.getListForUser',
        'Common_Notify.setFinallySendTime',
        'Project_Project.getProjectTypeList',
        'Common_Notify.doSomeThing',
        'Common_Notify.fixedExecutor',
        'Common_Notify.pushNotify',
        'Common_Notify.pushTaskRemind',
        'Common_Notify.bindClientId',
    ),
    'auth' => array(
        'auth_on' => true, // 认证开关
        'auth_user' => 'user', // 用户信息表
        'auth_group' => 'auth_group', // 组数据表名
        'auth_group_access' => 'auth_group_access', // 用户-组关系表
        'auth_rule' => 'auth_rule', // 权限规则表
        'auth_menu' => 'menu', // 权限菜单表
        'auth_menu_model' => 'menu_model', // 权限菜单模块表
        'auth_not_check_user' => array() //跳过权限检测的用户
    ),
	 'cors' => array(
        //域名白名单
        'whitelist'   => array(
            'http://127.0.0.1:8050',
        ),
        //header头
        'headers' => array(
            'Access-Control-Allow-Methods' => 'GET, POST, PUT, DELETE, OPTIONS', //支持的请求类型
            'Access-Control-Allow-Credentials' => 'true', //支持cookie
            'Access-Control-Allow-Headers' => 'Content-Type,Accept,Referer,Host,Keep-Alive,SystemUser-Agent,X-Requested-With,Cache-Control,Cookie,authorization,token',

        )
    ),
    /**
     * 七牛相关配置
     */
    'Qiniu' => array(
        //统一的key
        'access_key' => '111',
        'secret_key' => '222',
        //自定义配置的空间
        'space_bucket' => 'static',
        'space_host' => '',
    ),
);
