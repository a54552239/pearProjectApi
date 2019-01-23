<?php
namespace App\Domain\User;
use function App\addLog;
use App\Auth\Domain\Group;
use App\Common\CommonDomain;
use App\Common\Exception\WrongRequestException;
use App\Domain\Common\Notify;
use App\Domain\User\Setting\UserSetting;
use App\Model\User\User as ModelUser;
use App\Model\User\UserToken as ModelUserToken;
use function App\nowTime;
use  App\Auth\Model\Access;
use function App\pushNotice;

class User extends CommonDomain
{
    public function login($array)
    {
        $model_member = new ModelUser();
        $model_member_token = new ModelUserToken();
        $member_info = $model_member->getinfo($array);
        if ($array['account'] == '' or $array['password'] == '') {
            throw new WrongRequestException('请填写账号和密码', 1);
        }
        if (!$member_info) {
            throw new WrongRequestException('账号或密码输入错误', 2);
        }
        if (!$member_info['state']) {
            throw new WrongRequestException('抱歉，您已被封号，禁止登录', 4);
        }
        $member_info = $this->getUserById($member_info['id']);
        $token = $model_member_token->_get_token($member_info['id'], $member_info['account']);
        if ($token) {
            $user_id = $member_info['id'];
            $visit_times = $member_info['visits'] + 1;
            $model_member->update($user_id, array('last' => time(), 'ip' => $_SERVER['REMOTE_ADDR'], 'visits' => $visit_times));
            addLog("用户登录，编号：[$user_id]");
            $domain_notify = new Notify();
//            $domain_notify->NotifyHook('login',$member_info,4);
            return array('account' => $member_info['account'], 'token' => $token, 'user_info' => $member_info);
        } else {
            throw new WrongRequestException('登录失败', 3);
        }
    }

    public function getUserById($user_id)
    {
        $model_user = new ModelUser();
        return $model_user->getUserFullById($user_id);
    }

    public function addUser($data)
    {
        $model_user = new ModelUser();
        $user = $model_user->getInfo(array('account' => $data['account']), 'id');
        if (!$user) {
            \PhalApi\DI()->notorm->beginTransaction(DB_TICKET);
//            $this->addUserValidate($data);
            $data['password'] = md5($data['password']);
            $data['join'] = nowTime();
            $user_id = $model_user->insert($data);
            if ($user_id === false) {
                \PhalApi\DI()->notorm->rollback(DB_TICKET);
                throw new WrongRequestException('新增失败', 8);
            }
            $domain_group = new Group();
            $domain_user_setting = new UserSetting();
            $user_base_setting = get_object_vars($domain_user_setting->getSetting('base_setting'));
            $result = $domain_group->assUser(array('uid' => $user_id, 'group_id' => $user_base_setting['default_user_group_list']));
            if ($result) {
                \PhalApi\DI()->notorm->rollback(DB_TICKET);
                throw new WrongRequestException('新增失败', 9);
            }
            \PhalApi\DI()->notorm->commit(DB_TICKET);
            addLog('新增用户，编号：' . $user_id);
        } else {
//            throw new WrongRequestException('用户编号已存在', 7);
        }

    }

    public function addUserValidate($param)
    {
        ini_set('display_errors', 0);
        $domain_user_setting = new UserSetting();
        $user_base_setting = get_object_vars($domain_user_setting->getSetting('base_setting'));
        if (strlen($param['account']) < $user_base_setting['user_name_length_min'] and isset($param['account'])) {
            throw new WrongRequestException('用户名最小长度为' . $user_base_setting['user_name_length_min'], 1);
        }
        if (strlen($param['account']) > $user_base_setting['user_name_length_max'] and isset($param['account'])) {
            throw new WrongRequestException('用户名最大长度为' . $user_base_setting['user_name_length_max'], 2);
        }
        if (strlen($param['realname']) < $user_base_setting['realname_length_min'] and isset($param['realname'])) {
            throw new WrongRequestException('用户昵称最小长度为' . $user_base_setting['realname_length_min'], 3);
        }
        if (strlen($param['realname']) > $user_base_setting['realname_length_max'] and isset($param['realname'])) {
            throw new WrongRequestException('用户昵称最大长度为' . $user_base_setting['realname_length_max'], 4);
        }
        if (isset($param['password'])) {
            if (strlen($param['password']) < $user_base_setting['password_length_min'] and isset($param['password'])) {
                throw new WrongRequestException('用户密码最小长度为' . $user_base_setting['password_length_min'], 5);
            }
            if (strlen($param['password']) > $user_base_setting['password_length_max'] and isset($param['password'])) {
                throw new WrongRequestException('用户密码最大长度为' . $user_base_setting['password_length_max'], 6);
            }
        }
    }

    public function changePassword($user_info, $data)
    {
        if (!is_array($data)) {
            $data = get_object_vars($data);
        }
        //超管特殊处理 begin
        if ($user_info['account'] == 'admin') {
            throw new WrongRequestException('演示账号不允许修改密码', 4);
        }
        //超管特殊处理 end
        $model_user = new ModelUser();
        $old_password = md5($data['old_password']);
        if ($data['password'] != $data['password_confirm']) {
            throw new WrongRequestException('两次输入的密码不一致', 1);
        }
        if ($old_password != $user_info['password']) {
            throw new WrongRequestException('原密码不正确', 2);
        }
        $domain_user_setting = new UserSetting();
        $user_base_setting = get_object_vars($domain_user_setting->getSetting('base_setting'));
        if (strlen($data['password']) < $user_base_setting['password_length_min']) {
            throw new WrongRequestException('用户密码最小长度为' . $user_base_setting['password_length_min'], 3);
        }
        if (strlen($data['password']) > $user_base_setting['password_length_max']) {
            throw new WrongRequestException('用户密码最大长度为' . $user_base_setting['password_length_max'], 7);
        }
        $result = $model_user->update($user_info['id'], array('password' => md5($data['password'])));
        if ($result !== false) {
            addLog('修改密码，编号：' . $user_info['id']);
        }
        return $result;
    }

    public function uploadAvatarImg($user_id, $img_url)
    {
        $model_user = new ModelUser();
        $result = $model_user->update($user_id, array('avatar' => $img_url));
        if ($result !== false) {
            addLog('上传头像，编号：' . $user_id);
        }
        return $result;
    }

    public function editUser($user_id, $data)
    {
        $model_user = new ModelUser();
        $this->addUserValidate($data);
        if (isset($data['password'])) {
            $data['password'] = md5($data['password']);
        }
        if (isset($data['user_name'])) {
            $user = $model_user->getInfo(array('user_name' => $data['user_name']), 'id');
            if ($user and $user['id'] != $user_id) {
                throw new WrongRequestException('用户编号已存在', 7);
            }
        }
        $result = $model_user->update($user_id, $data);
        if ($result !== false) {
            addLog('编辑用户，编号：' . $user_id);
        }
        return $result;
    }

    public function getUserList($param)
    {
        if (!is_array($param)) {
            $param = get_object_vars($param);
        }
        $model_user = new ModelUser();
//        if (!isset($param['state'])) {
//            $param['where']['state'] = 0;
//        }
        if (isset($param['state'])) {
            if ($param['state'] == -1) {
                unset($param['state']);
            } else {
                $param['where']['state'] = $param['state'];
            }
        } else {
            unset($param['state']);
        }
        //超管特殊处理 begin
        $param['where']['account <> ?'] = array('admin');
        //超管特殊处理 end
        if (isset($param['keyWord'])) {
            $param['where']["account LIKE ?  or realname LIKE ? "] = array("%" . $param['keyWord'] . "%", "%" . $param['keyWord'] . "%");
        }
        $param['where']['deleted'] = "0";
        $result = $model_user->getList($param);
        if ($result['list']) {
            $domain_user_level = new Level();
            $domain_user_position = new Position();
            foreach ($result['list'] as &$item) {
                $item['level_info'] = $domain_user_level->getInfo(array('id' => $item['level_id']));
                $item['position_info'] = $domain_user_position->getInfo(array('id' => $item['position_id']));
                if ($item['id'] == 26) {
                    $item['_disabled'] = true;
                }
            }
            unset($item);
        }

        return $result;
    }

    public function changeState($user_id, $state)
    {
        $model_user = new ModelUser();
        return $model_user->update($user_id, array('state' => $state));
    }

    /** 删除用户
     * @param $ids id列表 如1,2,3
     * @return int
     */
    public function delUser($ids)
    {
        $model_user = new ModelUser();
        $r = $model_user->updateByIds($ids, array('deleted' => '1'));
        $ids = json_encode($ids);
        addLog("删除用户，编号：$ids");
        return $r == true ? 0 : 1;

        $r = $model_user->delItems($ids);
        if ($r) {
            $model_access = new Access();
            foreach ($ids as $id) {
                $model_access->delByUid($id);
            }
            $ids = json_encode($ids);
            addLog("删除用户，编号：$ids");
        }
        return $r == true ? 0 : 1;
    }
}
