<?php
namespace App\Auth;
use App\Auth\Domain\Group;
use App\Auth\Model\MenuModel;
use App\Auth\Domain\MenuModel as DomainMenuModel;


class Lite
{
    /**
     * 检查权限
     * @param name string|array  需要验证的规则列表,支持逗号分隔的权限规则或索引数组
     * @param uid  int           认证用户的id
     * @param relation string    如果为 'or' 表示满足任一条规则即通过验证;如果为 'and'则表示需满足所有规则才能通过验证
     * @return boolean           通过验证返回true;失败返回false
     */
    public function check($name, $uid, $relation = 'or')
    {
        //判断权限检测开关
        if (!\PhalApi\DI()->config->get('app.auth.auth_on'))
            return true;
        //判断是不是免检用户
        if (in_array($uid, (array)\PhalApi\DI()->config->get('app.auth.auth_not_check_user')))
            return true;
        $authList = $this->getAuthList($uid); //获取用户需要验证的所有有效规则列表

        if (is_string($name)) {
            $name = strtolower($name);
            if (strpos($name, ',') !== false) {
                $name = explode(',', $name);
            } else {
                $name = array($name);
            }
        }

        $list = array(); //保存验证通过的规则名
        foreach ($authList as $auth) {
            if (in_array($auth, $name)) {
                $list[] = $auth;
            }
        }

        if ($relation == 'or' and !empty($list)) {
            return true;
        }
        $diff = array_diff($name, $list);
        if ($relation == 'and' and empty($diff)) {
            return true;
        }
        return false;
    }

    /**
     * 根据用户id获取组,返回值为数组
     * @param  int $uid 用户id
     * @return array       用户所属的组
     */
    public function getGroups($uid)
    {
        static $groups = array();
        if (isset($groups[$uid]))
            return $groups[$uid];
        $groupDomain = new Group();
        $user_groups = $groupDomain->getUserInGroups($uid);
        $groups[$uid] = $user_groups ?: array();
        return $groups[$uid];
    }

    public function getMenuList($uid)
    {
        static $_menuList = array(); //保存用户验证通过的权限列表

        //读取用户所属组
        $groups = $this->getGroups($uid);
        $ids = array(); //保存用户所属组设置的所有权限规则id
        foreach ($groups as $g) {
            $ids = array_merge($ids, explode(',', trim($g['menus'], ',')));
        }
        $ids = array_unique($ids);
        if (empty($ids)) {
            $_menuList[$uid] = array();
            return array();
        }
        $menuDomain = new Domain\Menu();
        $menus = $menuDomain->getMenusInGroups($ids);

        //循环规则，判断结果。
        $menuList = array();   //
        $userDomain = new Domain\User();
        foreach ($menus as $menu) {
            if (!empty($menu['condition'])) { //根据addcondition进行验证
                $user = $userDomain->getUserInfo($uid); //获取用户信息,一维数组

                $command = preg_replace('/\{(\w*?)\}/', '$user[\'\\1\']', $menu['add_condition']);
                @(eval('$condition=(' . $command . ');'));
                if ($condition) {
                    $menuList[] = $menu;
                }
            } else {
                //只要存在就记录
                $menuList[] = $menu;
            }
        }
        $_menuList[$uid] = $menuList;
        $menuListOld = $menuList;
        $menuList = $this->formatList($menuList);
        $menu_model_list = array();
        $temp_model_list = array();
        if ($menuList) {
            $model_menuModel = new MenuModel();
            foreach ($menuList as $item) {
                if (!in_array($item['model'], $temp_model_list)) {
                    $temp_model_list[] = $item['model'];
                }
            }
            foreach ($temp_model_list as $item) {
                $model_info = $model_menuModel->getInfoByName($item);
                $menu_model_list[] = $model_info['id'];
            }
            $menu_model_list = $model_menuModel->getListByWhere(array('id'=>$menu_model_list),'*','sort desc');
        }
        $domain_menu_model = new DomainMenuModel();
        $menu_model_list_all = $domain_menu_model->getAllList(array('field'=>'*','order'=>'id asc'));
        $menu_model_list_all = $menu_model_list_all['list'];
        return array('menu_list'=>$menuList,'menu_model_list'=>$menu_model_list,'menu_model_list_all'=>$menu_model_list_all,'menu_list_old'=>$menuListOld,);
    }

    public function getMenuModelList($uid)
    {
        $menu_list = $this->getMenuList($uid);
        $menu_model_list = array();
        if ($menu_list) {
            foreach ($menu_list as $item) {
                if (!in_array($item['model'], $menu_model_list)) {
                    $menu_model_list[] = $item['model'];
                }
            }
        }
    }

    /**
     * 遍历归类菜单
     * @param $menuList
     * @return array
     */
    function formatList($menuList){
        $list = array();
        $tmp = array();  
        foreach ($menuList as $item) {
            $tmp[$item['id']] = $item;
        }
        foreach ($menuList as $item){
            if (isset($tmp[$item['pid']])){
                $tmp[$item['pid']]['nextItem'][] = &$tmp[$item['id']];
            }
            else{
                $list[] = &$tmp[$item['id']];
            }
        }
        unset($tmp);
        return $list;
    }

    /**
     * 获得权限列表
     * @param integer $uid 用户id
     * @return array
     * @internal param int $type
     */
    protected function getAuthList($uid)
    {
        static $_authList = array(); //保存用户验证通过的权限列表

        //读取用户所属组
        $groups = $this->getGroups($uid);
        $ids = array(); //保存用户所属组设置的所有权限规则id
        foreach ($groups as $g) {
            $ids = array_merge($ids, explode(',', trim($g['rules'], ',')));
        }
        $ids = array_unique($ids);
        if (empty($ids)) {
            $_authList[$uid] = array();
            return array();
        }

        $ruleDomain = new Domain\Rule();
        $rules = $ruleDomain->getRulesInGroups($ids);

        //循环规则，判断结果。
        $authList = array();   //
        $userDomain = new Domain\User();
        foreach ($rules as $rule) {
            if (!empty($rule['add_condition'])) { //根据addcondition进行验证
                $user = $userDomain->getUserInfo($uid); //获取用户信息,一维数组

                $command = preg_replace('/\{(\w*?)\}/', '$user[\'\\1\']', $rule['add_condition']);
                @(eval('$condition=(' . $command . ');'));
                if ($condition) {
                    $authList[] = strtolower($rule['name']);
                }
            } else {
                //只要存在就记录
                $authList[] = strtolower($rule['name']);
            }
        }
        $_authList[$uid] = $authList;
        return $authList;
    }

    public function getAllAuthList()
    {
        $ruleDomain = new Domain\Rule();
    }

    /**
     * 获得权限列表（所有字段）
     * @param integer $uid 用户id
     * @return array
     */
    public function getFullAuthList($uid)
    {
        static $_authList = array(); //保存用户验证通过的权限列表

        //读取用户所属组
        $groups = $this->getGroups($uid);
        $ids = array(); //保存用户所属组设置的所有权限规则id
        foreach ($groups as $g) {
            $ids = array_merge($ids, explode(',', trim($g['rules'], ',')));
        }
        $ids = array_unique($ids);
        if (empty($ids)) {
            $_authList[$uid] = array();
            return array();
        }

        $ruleDomain = new Domain\Rule();
        $rules = $ruleDomain->getRulesInGroups($ids);

        //循环规则，判断结果。
        $authList = array();   //
        $userDomain = new Domain\User();
        foreach ($rules as $rule) {
            if (!empty($rule['add_condition'])) { //根据addcondition进行验证
                $user = $userDomain->getUserInfo($uid); //获取用户信息,一维数组

                $command = preg_replace('/\{(\w*?)\}/', '$user[\'\\1\']', $rule['add_condition']);
                @(eval('$condition=(' . $command . ');'));
                if ($condition) {
                    $authList[] = $rule;
                }
            } else {
                //只要存在就记录
                $authList[] = $rule;
            }
        }
        $_authList[$uid] = $authList;
        return $authList;
    }

}
