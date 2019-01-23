<?php
namespace App\Model\Common;
use App\Common\CommonModel;

class Notify extends CommonModel
{

    /**
     * 通知类型列表
     * @return array
     */
    public function getNotifyTypeList()
    {
        $type = array();
        $type[] = array('title' => '任务动态', 'key' => '1', 'action' => 'task_dynamic');
        $type[] = array('title' => '项目动态', 'key' => '2', 'action' => 'project_dynamic');
        $type[] = array('title' => '团队动态', 'key' => '3', 'action' => 'team_dynamic');
        $type[] = array('title' => '上线提醒', 'key' => '4', 'action' => 'user_login');
        $type[] = array('title' => '项目同步', 'key' => '5', 'action' => 'project_synchronize');
        $type[] = array('title' => '任务同步', 'key' => '6', 'action' => 'task_synchronize');
        $type[] = array('title' => 'action同步', 'key' => '6', 'action' => 'action_synchronize');
        return $type;
    }

    /**  获取通知类型
     * @param $key
     * @return mixed
     */
    public function getNotifyType($key)
    {
        $task_list = $this->getNotifyTypeList();
        foreach ($task_list as $item) {
            if ($item['key'] == $key) {
                return $item;
            }
        }
    }

    /**
     * 获取通知类型名称
     * @param $key
     * @return mixed
     */
    public function getNotifyTypeTitle($key)
    {
        $task_list = $this->getNotifyTypeList();
        foreach ($task_list as $item) {
            if ($item['key'] == $key) {
                return $item['title'];
            }
        }
    }
    /**
     * 获取通知类型action
     * @param $key
     * @return mixed
     */
    public function getNotifyTypeAction($key)
    {
        $task_list = $this->getNotifyTypeList();
        foreach ($task_list as $item) {
            if ($item['key'] == $key) {
                return $item['action'];
            }
        }
    }


    
    protected function getTableName($id)
    {
        return 'notify';
    }
}