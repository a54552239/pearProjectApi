<?php
/**
 * Created by PhpStorm.
 * SystemUser: vilson
 * Date: 2018/7/10
 * Time: 12:38
 */

namespace app\project\behavior;


use app\common\Model\CommonModel;
use app\common\Model\Member;
use app\common\Model\Notify;
use app\common\Model\ProjectLog;
use app\common\Model\ProjectVersion;
use app\common\Model\ProjectVersionLog;
use app\common\Model\TaskMember;
use app\common\Model\TaskStages;
use service\MessageService;
use think\db\exception\DataNotFoundException;
use think\db\exception\ModelNotFoundException;
use think\exception\DbException;
use think\facade\Log;

class Version
{
    /**
     * 版本操作钩子
     * @param $data
     * @throws DataNotFoundException
     * @throws ModelNotFoundException
     * @throws DbException
     */
    public function run($data)
    {
        $logData = ['member_code' => $data['memberCode'], 'source_code' => $data['versionCode'], 'remark' => $data['remark'], 'type' => $data['type'], 'content' => $data['content'], 'create_time' => nowTime(), 'code' => createUniqueCode('projectVersionLog')];
        $version = ProjectVersion::where(['code' => $data['versionCode']])->find();
        $logData['features_code'] = $version['features_code'];
        $remark = '';
        $content = '';
        switch ($data['type']) {
            case 'create':
                $icon = 'plus';
                $remark = '创建了版本 ';
                $content = $version['name'];
                break;
            case 'status':
                $icon = 'check-square';
                $remark = '更新了状态为  ' . $version['statusText'];
                break;
            case 'publish':
                $icon = 'check-square';
                $remark = '完成版本时间为 ' . date('m月d日 H:i', strtotime($version['publish_time']));
                break;
            case 'name':
                $icon = 'edit';
                $remark = '更新了版本名 ';
                $content = $version['name'];
                break;
            case 'content':
                $icon = 'file-text';
                $remark = '更新了备注 ';
                $content = $version['description'];
                break;
            case 'clearContent':
                $icon = 'file-text';
                $remark = '清空了备注 ';
                break;
            case 'setStartTime':
                $icon = 'calendar';
                $remark = '更新开始时间为 ' . date('m月d日 H:i', strtotime($version['start_time']));
                break;
            case 'clearStartTime':
                $icon = 'calendar';
                $remark = '清除了开始时间 ';
                break;
            case 'setPlanPublishTime':
                $icon = 'calendar';
                $remark = '更新计划发布时间为 ' . date('m月d日 H:i', strtotime($version['plan_publish_time']));
                break;
            case 'clearPlanPublishTime':
                $icon = 'calendar';
                $remark = '清除了计划发布时间 ';
                break;
            case 'delete':
                $icon = 'delete';
                $remark = '删除了版本 ';
                break;
            case 'addVersionTask':
                $count = count($data['data']);
                $icon = 'link';
                $remark = "添加了 $count 项发布内容 ";
                $content = implode('，', $data['data']);
                break;
            case 'removeVersionTask':
                $icon = 'disconnect';
                $remark = '移除了发布内容';
                $content = $data['data'];
                break;
            default:
                $icon = 'plus';
                $remark = ' 创建了版本 ';
                break;
        }
        $logData['icon'] = $icon;
        if (!$data['remark']) {
            $logData['remark'] = $remark;
        }
        if (!$data['content']) {
            $logData['content'] = $content;
        }
        ProjectVersionLog::create($logData);
    }
}
