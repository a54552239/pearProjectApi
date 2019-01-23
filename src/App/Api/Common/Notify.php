<?php
namespace App\Api\Common;
use App\Common\CommonApi;
use function App\getCurrentUser;
use App\Plugins\MessageService;

/**
 * 动态通知类
 */
class Notify extends CommonApi
{
    private static $Domain = null;

    public function __construct()
    {
        if (self::$Domain == null) {
            self::$Domain = new \App\Domain\Common\Notify();
        }
    }

    public function getRules()
    {
        return array(
            'getInfo' => array(
                'id' => array('name' => 'notify_id', 'type' => 'int', 'required' => true, 'desc' => '通知ID')
            ),
            'getList' => array(
                'to_user_id' => array('name' => 'to_user_id', 'type' => 'int', 'default' => 0,  'desc' => '接收用户id'),
                'notice_type' => array('name' => 'notice_type', 'type' => 'Array', 'format' => 'json', 'desc' => '通知id'),
                'is_read' => array('name' => 'is_read', 'type' => 'int', 'default' => 0,  'desc' => '是否已读'),
                'keyWord' => array('name' => 'keyword', 'type' => 'string', 'default' => '', 'desc' => '关键词'),
                'page_size' => array('name' => 'page_size', 'type' => 'int', 'default'=> PAGE_SIZE, 'desc' => '页面大小'),
                'page_num' => array('name' => 'page_num', 'type' => 'int', 'default' => 1, 'desc' => '页码'),
                'order' => array('name' => 'order', 'type' => 'string', 'default' => 'id desc', 'desc' => '排序参数，如：xx ASC,xx DESC')
            ),
            'getNotifyTypeList' => array(
            ),
            'getListForUser' => array(
                'to_user_id' => array('name' => 'to_user_id', 'type' => 'int', 'default' => 0,  'desc' => '接收用户id'),
                'notice_type' => array('name' => 'notice_type', 'type' => 'Array', 'format' => 'json', 'desc' => '通知id'),
                'keyWord' => array('name' => 'keyword', 'type' => 'string', 'default' => '', 'desc' => '关键词'),
                'page_size' => array('name' => 'page_size', 'type' => 'int', 'default'=> 3, 'desc' => '页面大小'),
                'page_num' => array('name' => 'page_num', 'type' => 'int', 'default' => 1, 'desc' => '页码'),
                'order' => array('name' => 'order', 'type' => 'string', 'default' => 'id desc', 'desc' => '排序参数，如：xx ASC,xx DESC')
            ),
            'setFinallySendTime' => array(
                'ids' => array('name' => 'ids', 'type' => 'Array', 'format' => 'json', 'desc' => '通知id')
            ),
            'batchTicketRead' => array(
                'ids' => array('name' => 'ids', 'type' => 'Array', 'format' => 'json', 'desc' => '通知ids')
            ),
            'ticketRead' => array(
                'id' => array('name' => 'id', 'type' => 'int', 'require' => true, 'desc' => '通知id')
            ),
            'doSomeThing' => array(
            ),
            'bindClientId' => array(
                'client_id' => array('name' => 'client_id', 'type' => 'string'),
                'uid' => array('name' => 'uid', 'type' => 'string')
            ),
        );
    }

    /**
     * 绑定用户id
     * @desc 绑定用户id
     * @throws \PhalApi\Exception\BadRequestException
     */
    public function bindClientId()
    {
        if (!PUSH_NOTIFY) {
            return true;
        }
        $clientId = $this->client_id;
        $uid = $this->uid;
        if (!$uid) {
            $current_user = getCurrentUser();
            $uid = $current_user['id'];
        }
        if ($uid) {
            $messageService = new MessageService();
            $messageService->bindUid($clientId, $uid);
            $messageService->joinGroup($clientId, 'user');
        }
    }
//    public function doSomeThing()
//    {
//        self::$Domain->doSomeThing();
//    }
//    public function fixedExecutor()
//    {
//        self::$Domain->fixedExecutor();
//    }

    /**
     * 消息推送
     * @desc 消息推送
     * @throws \PhalApi\Exception\BadRequestException
     */
    public function pushNotify()
    {
        self::$Domain->pushNotify();
    }

    /**
     * 任务动态推送
     * @desc 任务动态推送
     */
    public function pushTaskRemind()
    {
        self::$Domain->pushTaskRemind();
    }

    /**
     * 获取通知列表
     * @desc 获取通知列表
     * @return array
     * @throws \PhalApi\Exception\BadRequestException
     */
    public function getList()
    {
        unset($this->user_info);
        return self::$Domain->getList($this);
    }

    /**
     * 获取通知列表
     * @desc 获取通知列表
     * @return array
     * @throws \PhalApi\Exception\BadRequestException
     */
    public function getListForUser()
    {
        unset($this->user_info);
        return self::$Domain->getListForUser($this);
    }
    /**
     * 获取通知类型列表
     * @desc 获取通知类型列表
     * @return array
     */
    public function getNotifyTypeList()
    {
        return self::$Domain->getNotifyTypeList();
    }

    /**
     * 获取通知信息
     * @desc 获取通知信息
     * @return array
     */
    public function getInfo()
    {
        return self::$Domain->getInfo(array('id'=>$this->id));
    }

    /**
     * 删除通知
     * @desc 删除通知
     */
    public function delNotify()
    {
        self::$Domain->delNotify($this->ids);
    }

    /**
     * 标记最后阅读时间
     * @desc 标记最后阅读时间
     */
    public function setFinallySendTime()
    {
        self::$Domain->setFinallySendTime($this->ids);
    }

    /**
     * 新增通知
     * @desc 新增通知
     */
    public function addNotify()
    {
        unset($this->user_info);
        $data = get_object_vars($this);
        self::$Domain->addNotify($data);
    }
    /**
     * 保存通知信息
     * @desc 保存通知信息
     */
    public function editNotify()
    {
        unset($this->user_info);
        unset($this->notify_id);
        $data = get_object_vars($this);
        self::$Domain->editProjectNotify($this->id,$data);
    }

    /**
     * 标记消息为已读
     * @desc 标记消息为已读
     * @throws \App\Common\Exception\WrongRequestException
     */
    public function ticketRead()
    {
        self::$Domain->ticketRead($this->id);
    }
    /**
     * 批量标记消息为已读
     * @desc 批量标记消息为已读
     * @throws \App\Common\Exception\WrongRequestException
     */
    public function batchTicketRead()
    {
        self::$Domain->batchTicketRead($this->ids);
    }

}
