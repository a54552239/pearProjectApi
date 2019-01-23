<?php
namespace App\Domain\Project;
use function App\addProjectLog;
use App\Common\CommonDomain;
use App\Common\Exception\WrongRequestException;
use App\Domain\Project\Task;
use App\Domain\Team\Team;
use App\Domain\Team\TeamUser;
use function App\getCurrentUser;
use function App\getWeekTime;
use App\Model\Project\Doc;
use App\Model\Project\User;
use function App\nowTime;
use Exception;
use PhalApi\Exception\BadRequestException;
use PHPExcel_Lite;
use function PHPSTORM_META\type;

/**
 * Created by vilson.
 * User: Administrator
 * Date: 2017/3/23 0023
 * Time: 9:36
 */
class Project extends CommonDomain
{

    private static $Model = null;

    public function __construct()
    {
        if (self::$Model == null) {
            self::$Model = new \App\Model\Project\Project();
        }
    }

    public function getProjectInfo($condition, $filed = '*')
    {
        $project_info = self::$Model->getInfo($condition, $filed);
        if ($project_info) {
            $model_project_user = new User();
            $model_project_user->checkProjectAccess($project_info['id']);
            $project_info_state = self::$Model->getFullProjectState($project_info['status']);
            $project_info['state_name'] = $project_info_state['name'];
        }
        return $project_info;
    }

    public function getProjectStateList()
    {
        return self::$Model->getProjectStateList();
    }

    public function getProjectTypeList()
    {
        return self::$Model->getProjectTypeList();
    }

    public function getProjectTicketList()
    {
        return self::$Model->getProjectTicketList();
    }

    public function exportTeamTimeProjectReport($team_id = 0, $time_type = 'week')
    {
        $domain_task = new Task();
        $domain_team_user = new TeamUser();
        $domain_team = new Team();
        $project_list = array();
        switch ($time_type) {
            case 'week':
                $week = \Time_Time::week();
                $monday = date('Y-m-d', $week[0]);
                $opened_time = $monday;
                $file_name = "项目周报";
                break;
            case 'month':
                $month = \Time_Time::lastMonth();
                $first_day = date('Y-m-d', $month[0]);
                $opened_time = $first_day;
                $file_name = "项目月报";

        }
        if (!$team_id) {
            $current_user = getCurrentUser();
            $team_list = $domain_team->getUserTeam($current_user['id']);
            $team_id = $team_list[0]['team_id'];
            $team = $domain_team->getInfo(array('id' => $team_id));
        } else {
            $team = $domain_team->getInfo(array('id' => $team_id));
        }
        $team_user_list = $domain_team_user->getTeamUser(array('page_num' => 1, 'page_size' => 50, 'team_id' => $team_id));
        if ($team_user_list['list']) {
            foreach ($team_user_list['list'] as $item) {
                $list = $domain_task->getTaskForUserGroupByProject(array('user_id' => $item['u_user_id'], 'is_executor' => 1, 'opened_time' => $opened_time));
                if ($list['list']) {
                    foreach ($list['list'] as $task) {
                        $project_list[] = $task;
                    }
                }
            }
        }
        $new_list = array();
        if ($project_list) {
            $model_user = new \App\Model\User\User();
            $model_level = new \App\Model\Project\Level();
            foreach ($project_list as $key => $item) {
                $business_info = $model_user->get($item['project_info']['business_id'], 'realname');
                $level_info = $model_level->get($item['project_info']['level_id'], 'level_name');
                $new_list[$key]['name'] = $item['project_info']['name'];
                $new_list[$key]['level_name'] = $level_info['level_name'];
                $new_list[$key]['developer_name'] = $item['executor_user_info']['realname'];
                $new_list[$key]['business_name'] = $business_info['realname'];
                $new_list[$key]['schedule'] = $item['project_info']['schedule'] . '%';
                $new_list[$key]['begin'] = $item['project_info']['begin'];
                $new_list[$key]['end'] = $item['project_info']['end'];
                $new_list[$key]['online_time'] = '';
                $new_list[$key]['wase_time'] = '';
                $new_list[$key]['change_times'] = '';
                $new_list[$key]['question'] = '';
                $new_list[$key]['state'] = $item['state'];
                $new_list[$key]['note'] = '';
            }
            $headArr = array("项目名称", "项目评级", "开发人员", "客服人员", "完成进度", "项目开始时间", "预计结束时间", "实际上线时间", "初步耗时", "项目变更次数", "项目问题", "项目状态", "备注");
            $file_name = $team['team_name'] . $file_name;
            $this->exportProjectExcel("{$file_name}.xlsx", $new_list, $headArr);
        }

    }

    public function exportProjectExcel($fileName = 'test_excel.xlsx', $data, $headArr)
    {
        $objPHPExcel = new \PHPExcel();
        //设置表头
        $key = ord("A");
        $str_len_arr = array();
        foreach ($headArr as $k => $v) {
            $column = chr($key);
            $objPHPExcel->setActiveSheetIndex(0)->setCellValue($column . '1', $v);
            $key += 1;
            $str_len_arr[$k] = strlen($v);
        }

        $column = 2;
        $objActSheet = $objPHPExcel->getActiveSheet();
        foreach ($data as $key => $rows) { //行写入
            $span = ord("A");
            $w = 0;
            foreach ($rows as $keyName => $value) {// 列写入
                $j = chr($span);
                $objActSheet->setCellValue($j . $column, $value);
                $str_len = strlen($value);
                if ($str_len < $str_len_arr[$w]) {
                    $str_len = $str_len_arr[$w];
                }
                $objActSheet->getColumnDimension($j)->setWidth($str_len);
                $span++;
                $w++;
            }
            $column++;
        }

        $fileName = iconv("utf-8", "gb2312", $fileName);
        //设置活动单指数到第一个表,所以Excel打开这是第一个表
        $objPHPExcel->setActiveSheetIndex(0);
        header('Content-Type: application/vnd.ms-excel');
        header("Content-Disposition: attachment;filename=\"$fileName\"");
        header('Cache-Control: max-age=0');

        $objWriter = \PHPExcel_IOFactory::createWriter($objPHPExcel, PHPExcel_Lite::getExcelType($fileName));
        $objWriter->save('php://output'); //文件通过浏览器下载
        exit;
    }

    public function selectProjectUser($param)
    {
        if (!is_array($param)) {
            $param = get_object_vars($param);
        }
        return self::$Model->selectProjectUser($param);
    }

    public function getProjectUserList($param)
    {
        if (!is_array($param)) {
            $param = get_object_vars($param);
        }
        return self::$Model->getProjectUserList($param);
    }

    public function delProjectUser($project_id, $user_id)
    {
        $model_project_user = new User();
        $current_user = getCurrentUser();
        if (!$user_id) {
            $user_id = $current_user['id'];
        }
        $model_user = new \App\Model\User\User();
        $user_info = $model_user->get($user_id, 'account');
        $project_user_info = $model_project_user->getInfo(array('account' => $user_info['account'], 'project' => $project_id));
        if ($project_user_info['is_owner']) {
            throw new WrongRequestException('不能移出项目拥有者', 1);
        }
        $result = $model_project_user->deleteByWhere(array('account' => $user_info['account'], 'project' => $project_id));
        if ($result !== false) {
            $ticket = '';
            $model_user = new \App\Model\User\User();
            $user_info = $model_user->get($user_id, 'realname');
            $realname = $user_info['realname'];
            if ($current_user['id'] == $user_id) {
                $content = "{$realname} 退出了项目";
            } else {
                $content = "{$realname} 移出了项目";
                $ticket = '将';
            }
            addProjectLog($content, $project_id, $ticket);
        }
    }

    public function addProjectUser($project_id, $user_id)
    {
        $model_user = new \App\Model\User\User();
        $user_info = $model_user->get($user_id, 'realname,account');
        $realname = $user_info['realname'];
        $model_project_user = new User();
        $model_project = new \App\Model\Project\Project();
        $project_info = $model_project->get($project_id);
        if (!$project_info) {
            throw new WrongRequestException('该项目不存在', 1);
        }
        $data = array('project' => $project_id, 'account' => $user_info['account']);
        $project_user_info = $model_project_user->getInfo($data);
        if ($project_user_info) {
            throw new WrongRequestException('该成员已加入本项目', 1);
        }
        $project_user_info = $model_project_user->getInfo(array('project' => $project_id));
        if (!$project_user_info) {
            $data['is_owner'] = 1;
            $data['is_business'] = 1;
            $content = "创建了项目";
            $ticket = '';
        } else {
            $content = "{$realname} 加入了项目";
            $ticket = '将';
        }
        $data['join'] = nowTime();
//        $data['ticket'] = '邀请';
        $insert_id = $model_project_user->insert($data);
        if ($insert_id) {
            addProjectLog($content, $project_id, $ticket);
        }
        return $insert_id;
    }

    public function getList($param)
    {
        if (!is_array($param)) {
            $param = get_object_vars($param);
        }
        if (isset($param['keyWord'])) {
            $param['where']["name LIKE ? or project_desc LIKE ? "] = array("%" . $param['keyWord'] . "%", "%" . $param['keyWord'] . "%");
        }
        $list = self::$Model->getList($param);
        return $list;
    }

    public function getProjectStatisticsByAll($type = 'week', $jixiao = false)
    {
        $model_project = new \App\Model\Project\Project();
        $model_level = new \App\Model\Project\Level();
        //RIGHT JOIN (SELECT MAX(id) AS id FROM pms_task GROUP BY id) AS t2 ON t.id = t2.id
        $sql = "SELECT * FROM pms_project AS t  WHERE t.deleted = '0'";
        $params = array();
        if ($type == 'week') {
            $week = \Time_Time::week();
            $sql .= " and t.begin <= :end_week_time and t.begin >= :begin_week_time ";
            $params[':end_week_time'] = date('Y-m-d', $week[1]);
            $params[':begin_week_time'] = date('Y-m-d', $week[0]);
        } else if ($type == 'month') {
            $month = \Time_Time::month();
            $sql .= " and t.begin <= :end_month_time and t.begin >= :begin_month_time ";
            $params[':end_month_time'] = date('Y-m-d', $month[1]);
            $params[':begin_month_time'] = date('Y-m-d', $month[0]);
        } else {
            $months = \Time_Time::lastCurrentMonth(20);
            $sql .= " and t.begin <= :end_month_time and t.begin >= :begin_month_time ";
            $params[':end_month_time'] = date('Y-m', $months[0]['current_date'] + 24 * 3600 * $months[count($months) - 1]['day_num']);
            $params[':begin_month_time'] = date('Y-m', $months[count($months) - 1]['current_date']);
        }
        $sql .= " group by t.id";
        $list = \PhalApi\DI()->notorm->notTable->queryRows($sql, $params);

//        $task_type_list = $this->getTaskTypeList();
        $task_type_list[]['name'] = '总量';
        $task_type_list_format = array();
        foreach ($task_type_list as $key => $task_type) {
            $task_type_list_format[] = $task_type['name'];
        }
        $data = array();
        if ($type == 'week') {
            $day_num = 7;
            $field = array('周一', '周二', '周三', '周四', '周五', '周六', '周日');
            $begin = \Time_Time::week();
        } else if ($type == 'month') {
            $day_num = 12;
            $field = array('一月', '二月', '三月', '四月', '五月', '六月', '七月', ' 八月', '九月', '十月', '十一月', '十二月');
            $begin = \Time_Time::lastYear();
            for ($i = 0; $i < $day_num; $i++) {
                $current_time = date('Y-m-d', $begin[0] + (3600 * 24 * 30 * $i));
//                $field[$i] = $current_time;
            }
        } else {
            $field = array();
            $months = \Time_Time::lastCurrentMonth(20);
            foreach ($months as $month) {
                $current_time = date('Y-m', $month['current_date']);
                $field[] = $current_time;
            }
        }
        foreach ($task_type_list as $key => $task_type) {
            $detail = array();
            $detail['areaStyle'] = array('color' => '#1890ff');
            $detail['itemStyle'] = array('color' => '#1890ff');
            $detail['barWidth'] = '50%';

            $detail['name'] = $task_type['name'];
            $detail['type'] = 'bar';
            $detail['smooth'] = true;
            $detail['data'] = array();
            foreach ($field as $key_month => $month) {
                if ($key_month == count($field) - 1) {
                    $last_time = 0;
                } else {
                    $last_time = $month;
                }
                if ($key_month == 0) {
                    $last_time = $month;
                    $current_time = date('Y-m', strtotime($month) + $months[$key_month]['day_num'] * 24 * 3600);
                } else {
                    $current_time = $field[$key_month - 1];
                }
                foreach ($list as $item) {
                    if ($jixiao) {
                        $level_info = $model_level->get($item['level_id'], 'money');
                        $num = !$level_info ? 0 : $level_info['money'];
                    } else {
                        $num = 1;
                    }
                    if (!isset($detail['data'][$key_month]) or !$detail['data'][$key_month]) {
                        $detail['data'][$key_month] = 0;
                    }
                    if ($item['begin'] >= $last_time and $item['begin'] <= $current_time) {
                        if ($task_type['name'] == '总量') {
                            $detail['data'][$key_month] += $num;
                        } else {
                            if ($item['task_type'] == $task_type['key']) {
                                $detail['data'][$key_month] += $num;
                            }
                        }
                    }
                    $detail['data'][$key_month] = rand(1, 100);
                }
//                $last_time = strtotime($current_time);
            }
            $data[$key] = $detail;
        }
//        echo json_encode($data);die;
        $total = $model_project->getCount(array('deleted' => "0"));
        $month = \Time_Time::month();
        $month_total = $model_project->getCount(array('deleted' => "0", 'begin >= ? ' => array(date('Y-m-d', $month[0]))));
        return array('task_type_list' => $task_type_list_format, 'field' => $field, 'data' => $data, 'list' => $list, 'total' => number_format($total), 'month_total' => $month_total);
    }

    public function getListForUser($param)
    {
        if (!is_array($param)) {
            $param = get_object_vars($param);
        }
        $model_project = self::$Model;
        $result = $model_project->getListForUser($param);
        return $result;
    }

    /**
     * @param $param
     * @param $user_id
     * @return \PhalApi\long
     * @throws WrongRequestException
     */
    public function addProject($param, $user_id)
    {
        if (!is_array($param)) {
            $param = get_object_vars($param);
        }
        \PhalApi\DI()->notorm->beginTransaction(DB_TICKET);
        try {
            $param['business_id'] = $user_id;
            $param['code'] = $param['name'];
            $param['begin'] = nowTime();
            $param['createDate'] = nowTime();
            $param['status'] = 'wait';
            $id = self::$Model->insert($param);
            if ($id === false) {
                throw new WrongRequestException('新增失败', 1);
            }
            $type_id = $param['type_id'];
            $model_task_type_template = new \App\Model\Project\TaskTypeTemplate();
            $template_list = $model_task_type_template->getListByWhere(array('project_type_id' => $type_id), '*', 'sort desc');
            if (!$template_list) {
                throw new WrongRequestException('该项目类型没有任务模板', 3);
            }
            $model_task_type = new \App\Model\Project\TaskType();
            foreach ($template_list as $template) {
                $task_type_data = array();
                $task_type_data['name'] = $template['name'];
                $task_type_data['project'] = $id;
//                $task_type_data['sort'] = $template['sort'];
                $task_type_data['create_time'] = nowTime();
                $task_type_id = $model_task_type->insert($task_type_data);
                $model_task_type->update($task_type_id,array('sort'=>$task_type_id));
            }
            $this->addProjectUser($id, $user_id);
        } catch (Exception $exception) {
            \PhalApi\DI()->notorm->rollback(DB_TICKET);
            throw new WrongRequestException($exception->getMessage(), $exception->getCode());
        }
        \PhalApi\DI()->notorm->commit(DB_TICKET);
        return $id;
    }

    /**
     * @param $id
     * @param $data
     * @throws WrongRequestException
     * @throws \PhalApi\Exception\BadRequestException
     */
    public function editProject($id, $data)
    {
        $leader_id = $data['leader_id'];
        $business_id = $data['business_id'];
        foreach ($data as $key => $item) {
            if ($item == null) {
                unset($data[$key]);
            }
        }
        $model_project_user = new User();
        $model_user = new \App\Model\User\User();
        $project_info = self::$Model->get($id);
        if (!$project_info) {
            throw new WrongRequestException('该项目不存在', 1);
        }
        if ($leader_id) {
            $user_info = $model_user->get($leader_id);
            $project_user = $model_project_user->getInfo(array('account' => $user_info['account'], 'project' => $id));
            $current_user = getCurrentUser();
            $realname = $user_info['realname'];
            $is_do = true;
            if (!$project_user) {
                $user_data['account'] = $user_info['account'];
                $user_data['is_leader'] = 1;
                $user_data['project'] = $id;
                $user_data['join'] = nowTime();
                $model_project_user->insert($user_data);

            } else {
                if ($project_user['is_leader'] != 1) {
                    $user_data['is_leader'] = 1;
                    $model_project_user->updateByWhere(array('project' => $id, 'is_leader' => 1), array('is_leader' => 0));
                    $model_project_user->update($project_user['id'], $user_data);
                } else {
                    $is_do = false;
                }
            }
            if ($is_do) {
                $ticket = '';
                if ($current_user['id'] == $leader_id) {
                    $content = "{$realname} 成为了项目负责人";
                } else {
                    $content = "{$realname} 设为了项目负责人";
                    $ticket = '将';
                }
                addProjectLog($content, $id, $ticket);
            }
        }
        if ($business_id) {
            $user_info = $model_user->get($business_id);
            $project_user = $model_project_user->getInfo(array('account' => $user_info['account'], 'project' => $id));
            $current_user = getCurrentUser();
            $realname = $user_info['realname'];
            $is_do = true;
            if (!$project_user) {
                $user_data['account'] = $user_info['account'];
                $user_data['is_business'] = 1;
                $user_data['project'] = $id;
                $user_data['join'] = nowTime();
                $model_project_user->insert($user_data);

            } else {
                if ($project_user['is_business'] != 1) {
                    $user_data['is_business'] = 1;
                    $model_project_user->updateByWhere(array('project' => $id, 'is_business' => 1), array('is_business' => 0));
                    $model_project_user->update($project_user['id'], $user_data);
                } else {
                    $is_do = false;
                }
            }
            if ($is_do) {
                $ticket = '';
                if ($current_user['id'] == $leader_id) {
                    $content = "{$realname} 成为了项目业务人员";
                } else {
                    $content = "{$realname} 设为了项目业务人员";
                    $ticket = '将';
                }
                addProjectLog($content, $id, $ticket);
            }
        }
        $result = self::$Model->update($id, $data);
        if ($result === false) {
            throw new WrongRequestException('保存失败', 1);
        }
        $content = "更新了项目信息";
        addProjectLog($content, $id);
    }

    public function doArchive($project_info)
    {
        $model_project = new Model_Project();
        DI()->notorm->beginTransaction(DB_TICKET);
        $result = $model_project->update($project_info['id'], $project_info);
        if (!$result) {
            DI()->notorm->rollback(DB_TICKET);
            $this->setCode(2, '操作失败');
        } else {
            DI()->notorm->commit(DB_TICKET);
            $this->setTips('操作成功');
        }
    }

    public function doComplete($project_id)
    {
        $model_project = new Model_Project();
        DI()->notorm->beginTransaction(DB_TICKET);
        $result = $model_project->update($project_id, array('state' => 5, 'complete_time' => time()));
        if (!$result) {
            DI()->notorm->rollback(DB_TICKET);
            $this->setCode(2, '操作失败');
        } else {
            DI()->notorm->commit(DB_TICKET);
            $this->setTips('操作成功');
        }
    }

    public function delProject($ids)
    {
        try {
            \PhalApi\DI()->notorm->beginTransaction(DB_TICKET);
            foreach ($ids as $project_id) {
                $project_info = self::$Model->get($project_id, 'name');
                $content = "删除了项目：{$project_info['name']}";
                addProjectLog($content, $project_id);
            }
            $result = self::$Model->updateByIds($ids, array('deleted' => '1'));
            $model_task = new \App\Model\Project\Task();
            foreach ($ids as $project_id) {
                $task_list = $model_task->getListByWhere(array('project' => $project_id));
                if ($task_list) {
                    foreach ($task_list as $task) {
                        $result = $model_task->update($task['id'], array('deleted' => '1'));
                    }
                }
            }
//            $result = self::$Model->delItems($ids);
            if (!$result) {
                throw new WrongRequestException('删除失败', 1);
            }
//            $model_project_user = new User();
//            $model_task = new \App\Model\Project\Task();
//            $model_task_user = new TaskUser();
//            foreach ($ids as $project_id) {
//                $result = $model_project_user->deleteByWhere(array('project_id'=>$project_id));
//                if (!$result) {
//                    throw new WrongRequestException('删除失败', 2);
//                }
//                $task_list = $model_task->getListByWhere(array('project_id' => $project_id));
//                if ($task_list) {
//                    foreach ($task_list as $task) {
//                        $model_task->delete($task['id']);
//                        $model_task_user->deleteTaskUser($task['id']);
//                    }
//                }
//            }
            \PhalApi\DI()->notorm->commit(DB_TICKET);

        } catch (Exception $exception) {
            \PhalApi\DI()->notorm->rollback(DB_TICKET);
            throw new WrongRequestException('删除失败', 3);
        }
    }

    public function getProjectFileList($project_id, $keyWord = '')
    {
        $model_task = new \App\Model\Project\Task();
        $model_task_file = new \App\Model\Project\File();
        $model_doc = new Doc();
        $model_user = new \App\Model\User\User();
        $task_list = $model_task->getListByWhere(array('project' => $project_id), 'id');
        $file_list = $model_task_file->getFileListByTaskIds($task_list, 'id desc', array('title LIKE ? ' => array("%" . $keyWord . "%")));
//        $doc_list = $model_doc->getListByWhere(array('project' => $project_id), 'id');
//        $file_list_doc = $model_task_file->getFileListByDocIds($doc_list, 'id desc', array('title LIKE ? ' => array("%" . $keyWord . "%")));
//        $file_list = array_merge($file_list, $file_list_doc);
        $file_list_project = $model_task_file->getListByWhere(array('objectID' => $project_id, 'objectType' => 'project'));
        $file_list = array_merge($file_list, $file_list_project);
        if ($file_list) {
            foreach ($file_list as &$item) {
                $item['user_info'] = $model_user->getInfo(array('account' => $item['addedBy']), 'account,realname');
            }
            unset($item);
        }
        return array('count' => count($file_list), 'list' => $file_list);
    }

    public function checkProjectName($user_id, $project_name, $project_id)
    {
        $model_project = new Model_Project();
        $project_info = $model_project->getInfo(array('id' => $user_id, 'project_name' => trim($project_name)));
        if ($project_info and $project_info['id'] != $project_id) {
            $this->setCode(2, '该项目已存在');
        }
    }
}
