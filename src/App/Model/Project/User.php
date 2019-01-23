<?php
namespace App\Model\Project;
use App\Common\CommonModel;
use function App\getCurrentUser;
use PhalApi\Exception\BadRequestException;

/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2017/3/23 0023
 * Time: 9:37
 */
class User extends CommonModel
{
    public function checkProjectAccess($project_id,$user_account = '')
    {
        $model_project = new Project();
        $project_info = $model_project->get($project_id,'access_control_type');
        if ($project_info['access_control_type'] == 'private') {
            if (!$user_account) {
                $current_user = getCurrentUser();
                $user_account = $current_user['account'];
            }
            $project_user = self::getInfo(array('project' => $project_id, 'account' => $user_account));
            if (!$project_user) {
                throw new BadRequestException('您无权限访问该项目', 2);
            }
        }
    }

    protected function getTableName($id)
    {
        return 'team';
    }

}
