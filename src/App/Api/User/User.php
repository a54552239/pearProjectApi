<?php
namespace App\Api\User;

use function App\addLog;
use App\Common\CommonApi;
use App\Common\Exception\WrongRequestException;
use App\Domain\User\User as DomainUser;
use App\Model\User\UserToken;
use App\Plugins\UploadFile;

/**
 * 用户类
 * @author dogstar 20170612
 * @property mixed page_size
 * @property mixed page_num
 * @property mixed filter
 */
class User extends CommonApi
{
    private static $domain_user = null;

    public function __construct()
    {
        if (self::$domain_user == null) {
            self::$domain_user = new DomainUser();
        }
    }

    public function getRules()
    {
        $rules = array(
            'login' => array(
                'account' => array('name' => 'account', 'type' => 'string', 'require' => true, 'desc' => '用户名'),
                'password' => array('name' => 'password', 'type' => 'string', 'require' => true, 'desc' => '密码'),
            ),
            'getUserList' => array(
                'page_size' => array('name' => 'page_size', 'type' => 'int', 'default'=> PAGE_SIZE, 'desc' => '页面大小'),
                'page_num' => array('name' => 'page_num', 'type' => 'int', 'default' => 1, 'desc' => '页码'),
                'filter' => array('name' => 'filter', 'type' => 'Array', 'default' => '{"state":-1}', 'format' => 'json', 'desc' => '查询条件'),
                'keyWord' => array('name' => 'keyword', 'type' => 'string', 'default' => '', 'desc' => '关键词'),
                'state' => array('name' => 'state', 'type' => 'int', 'default' => '-1', 'desc' => '状态'),
            ),
            'getInfoByToken' => array(),
            'getUserAuth' => array(
                'user_id' => array('name' => 'user_id', 'type' => 'int', 'default' => 0, 'desc' => '用户id'),
            ),
            'getUserMenu' => array(
                'user_id' => array('name' => 'user_id', 'type' => 'int', 'default' => 0, 'desc' => '用户id'),
            ),
            'getUserMenuModel' => array(
                'user_id' => array('name' => 'user_id', 'type' => 'int', 'default' => 0, 'desc' => '用户id'),
            ),
            'getUser' => array(
                'user_id' => array('name' => 'user_id', 'type' => 'int', 'default' => 0, 'desc' => '用户id'),
            ),
            'changeState' => array(
                'user_id' => array('name' => 'id', 'type' => 'int', 'default' => 0, 'desc' => '用户id'),
                'state' => array('name' => 'state', 'type' => 'int', 'require' => true, 'default' => 0, 'desc' => '状态'),
            ),
            'addUser' => array(
                'account' => array('name' => 'account', 'type' => 'string', 'desc' => '用户编号'),
                'realname' => array('name' => 'realname', 'type' => 'string', 'desc' => '用户昵称'),
                'password' => array('name' => 'password', 'type' => 'string', 'require' => true, 'desc' => '用户密码'),
                'level_id' => array('name' => 'level_id', 'type' => 'int', 'desc' => '用户等级'),
                'position_id' => array('name' => 'position_id', 'type' => 'int', 'desc' => '用户职位'),
                'state' => array('name' => 'state', 'type' => 'int', 'require' => true, 'default' => 1, 'desc' => '状态'),
            ),
            'changePassword' => array(
                'old_password' => array('name' => 'old_password', 'type' => 'string', 'require' => true, 'desc' => '原密码'),
                'password' => array('name' => 'password', 'type' => 'string', 'require' => true, 'desc' => '用户密码'),
                'password_confirm' => array('name' => 'password_confirm', 'type' => 'string', 'require' => true, 'desc' => '确认用户密码'),
            ),
            'editUser' => array(
                'user_id' => array('name' => 'user_id', 'type' => 'int', 'require' => true, 'desc' => '用户id'),
                'account' => array('name' => 'account', 'type' => 'string', 'desc' => '用户编号'),
                'realname' => array('name' => 'realname', 'type' => 'string', 'desc' => '用户昵称'),
                'level_id' => array('name' => 'level_id', 'type' => 'int', 'desc' => '用户等级'),
                'position_id' => array('name' => 'position_id', 'type' => 'int',  'desc' => '用户职位'),
                'company' => array('name' => 'company', 'type' => 'string', 'desc' => '所属公司'),
                'mobile' => array('name' => 'mobile', 'type' => 'string', 'desc' => '手机号码'),
                'email' => array('name' => 'email', 'type' => 'string', 'desc' => '邮件地址'),
                'qq' => array('name' => 'qq', 'type' => 'string', 'desc' => 'qq'),
                'password' => array('name' => 'password', 'type' => 'string', 'default' => '', 'desc' => '用户密码'),
                'state' => array('name' => 'state', 'type' => 'int', 'require' => true, 'default' => 1, 'desc' => '状态'),
            ),
            'delUser' => array(
                'ids' => array('name' => 'ids', 'type' => 'Array', 'format' => 'json', 'require' => true, 'desc' => '用户id')
            ),
        );
        return $rules;
    }

    /**
     * 用户登录
     * @desc 用户登录
     *
     */
    public function login()
    {
        $array = array();
        if (!empty($this->account)) {
            $array['account'] = trim($this->account);
        }
        if (!empty($this->password)) {
            $array['password'] = trim(md5($this->password));
        }
        return self::$domain_user->login($array);
    }

    /**
     * 获取用户信息
     * @desc 获取用户信息
     * @return mixed
     */
    public function getUser()
    {
        return self::$domain_user->getUserById($this->user_id);
    }

    /**
     * 修改用户状态
     * @desc 修改用户状态，1.启用，0.禁用
     * @return int code 业务代码：200.操作成功，201.操作失败
     * @throws WrongRequestException
     */
    public function changeState()
    {
        $result = self::$domain_user->changeState($this->user_id, $this->state);
        if ($result === false) {
            throw new WrongRequestException('操作失败', 1);
        }
        addLog("修改用户状态，编号：[$this->user_id]，状态：[$this->state]");
    }

    /**
     * 添加用户
     * @desc 添加用户
     * @return int code 业务代码：200.操作成功，201.操作失败
     * @throws WrongRequestException
     */
    public function addUser()
    {
        $data = array();
        $data['account'] = $this->account;
        $data['realname'] = $this->realname;
        $data['state'] = $this->state;
        $data['password'] = $this->password;
        $data['level_id'] = $this->level_id;
        $data['position_id'] = $this->position_id;
        $result = self::$domain_user->addUser($data);
        if ($result === false) {
            throw new WrongRequestException('添加失败', 1);
        }
    }

    /**
     * 编辑用户
     * @desc 编辑用户
     * @return int code 业务代码：200.操作成功，201.操作失败
     * @throws WrongRequestException
     */
    public function editUser()
    {
        $data = array();
        $data['account'] = $this->account;
        $data['realname'] = $this->realname;
        $data['qq'] = $this->qq;
        $data['company'] = $this->company;
        $data['phone'] = $this->mobile;
        $data['email'] = $this->email;
        $data['state'] = $this->state;
        $data['level_id'] = $this->level_id;
        $data['position_id'] = $this->position_id;
        if ($this->password) {
            $data['password'] = $this->password;
        }
        foreach ($data as $key => $item) {
            if ($item === null) {
                unset($data[$key]);
            }
        }
        $result = self::$domain_user->editUser($this->user_id, $data);
        if ($result === false) {
            throw new WrongRequestException('修改失败', 1);
        }
        addLog("编辑用户信息，编号：[$this->user_id]");
    }

    /**
     * 获取用户列表
     * @desc 获取用户列表
     * @return array
     */
    public function getUserList()
    {
        unset($this->user_info);
        return self::$domain_user->getUserList($this);
    }

    /**
     * 根据Token获取用户信息
     * @desc 根据Token获取用户信息，Token like:[token]&[expired_time]&[create_time]
     */
    public function getInfoByToken()
    {
        $model_user_token = new UserToken();
        $login_log = $model_user_token->getList(array('where' => array('user_id' => $this->user_info['id']), 'page_size' => 5, 'order' => 'token_id desc'));
        if ($login_log['list']) {
            foreach ($login_log['list'] as &$log) {
                $log['login_time'] = date('Y-m-d H:i:s', $log['login_time']);
            }
        }
        return array('user_info' => $this->user_info, 'login_log' => $login_log['list']);
    }

    /**
     * 获取用户所有权限
     * @desc 获取用户所有权限
     * @return mixed
     */
    public function getUserAuth()
    {
        if (!$this->user_id) {
            $this->user_id = $this->user_info['id'];
        }
        $auth_list = \PhalApi\DI()->auth->getFullAuthList($this->user_id);
//        if ($auth_list) {
//            $auth_list = \PhalApi\DI()->auth->formatList($auth_list);
//        }
        return $auth_list;
    }

    /**
     * 获取用户所有菜单
     * @desc 获取用户所有菜单
     * @return mixed
     */
    public function getUserMenu()
    {
        if (!$this->user_id) {
            $this->user_id = $this->user_info['id'];
        }
        $menu_list = \PhalApi\DI()->auth->getMenuList($this->user_id);
        return $menu_list;
    }

    /**
     * 获取用户所有菜单模块
     * @desc 获取用户所有菜单模块
     * @return mixed
     */
    public function getUserMenuModel()
    {
        if (!$this->user_id) {
            $this->user_id = $this->user_info['id'];
        }
        $menu_list = \PhalApi\DI()->auth->getMenuModelList($this->user_id);
        return $menu_list;
    }

    /**
     * 删除用户
     * @desc 删除用户
     * @return int code 业务代码：200.操作成功，201.操作失败
     * @throws WrongRequestException
     */
    public function delUser()
    {
        $r = self::$domain_user->delUser($this->ids);
        if ($r != 0) {
            throw new WrongRequestException('操作失败', 1);
        }
    }

    /**
     * 修改用户修改密码
     * @desc 修改用户修改密码
     * @throws WrongRequestException
     */
    public function changePassword()
    {
        self::$domain_user->changePassword($this->user_info, $this);
    }

    /**
     * 上传头像图片
     * @desc 添加备注时上传头像内容
     * @return string url 头像地址
     * @throws WrongRequestException
     */
    public function uploadAvatarImg()
    {
        $upload = new UploadFile();
        $upload->set('default_dir', 'image/avatar');
        $upload->set('allow_type', array('jpg', 'jpeg', 'png'));

        $upload->upfile('file');
        $img_url = $upload->qiniu_url;
        $result = self::$domain_user->uploadAvatarImg($this->user_info['id'], $img_url);
        if ($result) {
            return $upload->qiniu_url;
        } else {
            throw new WrongRequestException('上传失败', 1);
        }
    }
}
