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
use app\common\Model\ProjectLog;
use app\common\Model\TaskStages;
use service\MessageService;
use think\facade\Log;

class Project
{
    /**
     * 任务操作钩子
     * @param $data
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public function run($data)
    {
        $logData = ['member_code' => $data['memberCode'], 'source_code' => $data['sourceCode'], 'remark' => $data['remark'], 'type' => $data['type'], 'content' => $data['content'], 'is_comment' => $data['isComment'], 'to_member_code' => $data['toMemberCode'], 'create_time' => nowTime(), 'code' => createUniqueCode('projectLog'), 'action_type' => 'project'];
        $project = \app\common\Model\Project::where(['code' => $data['sourceCode']])->find();
        $logData['project_code'] = $project['code'];
        $toMember = [];
        if ($data['toMemberCode']) {
            $toMember = Member::where(['code' => $data['toMemberCode']])->find();
        }
        $notifyData = [
            'title' => '',
            'content' => '',
            'type' => '',
            'action' => '',
            'terminal' => '',
        ];
        $remark = '';
        $content = '';
        switch ($data['type']) {
            case 'create':
                $icon = 'plus';
                $remark = '创建了项目 ';
                $content = $project['name'];
                $notifyData['title'] = "";
                $notifyData['action'] = "";
                break;
            case 'edit':
                $icon = 'edit';
                $remark = '编辑了项目 ';
                $content = $project['name'];
                break;
            case 'name':
                $icon = 'edit';
                $remark = '修改了项目名称 ';
                $content = $project['name'];
                break;
            case 'content':
                $icon = 'file-text';
                $remark = '更新了备注 ';
                $content = $project['description'];
                break;
            case 'clearContent':
                $icon = 'file-text';
                $remark = '清空了备注 ';
                break;
            case 'inviteMember':
                $icon = 'user-add';
                $remark = '邀请 ' . $toMember['name'] . ' 加入项目';
                $content = $toMember['name'];
                break;
            case 'removeMember':
                $icon = 'user-delete';
                $remark = '移除了成员 ' . $toMember['name'];
                $content = $toMember['name'];
                break;
            case 'recycle':
                $icon = 'delete';
                $remark = '把项目移到了回收站 ';
                break;
            case 'recovery':
                $icon = 'undo';
                $remark = '恢复了项目 ';
                break;
            case 'archive':
                $icon = 'delete';
                $remark = '归档了项目 ';
                break;
            case 'recoveryArchive':
                $icon = 'undo';
                $remark = '恢复了项目 ';
                break;
            case 'uploadFile':
                $icon = 'link';
                $remark = '上传了文件文件 ';
                $content = "<a target=\"_blank\" class=\"muted\" href=\"{$data['data']['url']} \">{$data['data']['title']}</a>";

                break;
            case 'deleteFile':
                $icon = 'disconnect';
                $remark = '删除了文件 ';
                $content = "<a target=\"_blank\" class=\"muted\" href=\"{$data['data']['url']} \">{$data['data']['title']}</a>";
                break;
            default:
                $icon = 'plus';
                $remark = ' 创建了项目 ';
                break;
        }
        $logData['icon'] = $icon;
        if (!$data['remark']) {
            $logData['remark'] = $remark;
        }
        if (!$data['content']) {
            $logData['content'] = $content;
        }
        ProjectLog::create($logData);
        if (false) {
            //todo 短信,消息推送
            $notifyModel = new \app\common\Model\Notify();
            $notifyData['content'] = "";
            $result = $notifyModel->add($notifyData['title'], $notifyData['content'], $notifyData['type'], 0, 0, $notifyData['action'], json_encode($project), $notifyData['terminal']);
            $organizationCode = getCurrentOrganizationCode();
            $messageService = new MessageService();
            $messageService->sendToAll(['content' => $notifyData['content'], 'title' => $notifyData['title'], 'data' => ['organizationCode' => $organizationCode], 'notify' => $result], $notifyData['action']);
        }
    }
}
