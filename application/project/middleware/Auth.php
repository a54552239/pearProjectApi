<?php

namespace app\project\middleware;

use app\common\Model\ProjectNode;
use Closure;
use service\JwtService;
use service\NodeService;
use think\db\exception\DataNotFoundException;
use think\db\exception\ModelNotFoundException;
use think\exception\DbException;
use think\facade\Cache;
use think\Request;

/**
 * 系统权限访问管理
 * Class Auth
 * @package app\admin\middleware
 */
class Auth
{
    /**
     * @param Request $request
     * @param Closure $next
     * @return mixed
     * @throws DataNotFoundException
     * @throws DbException
     * @throws ModelNotFoundException
     * @throws \think\Exception
     * @throws \think\exception\PDOException
     */
    public function handle($request, Closure $next)
    {
        list($module, $controller, $action) = [$request->module(), $request->controller(), $request->action()];
        $access = $this->buildAuth($node = NodeService::parseNodeStr("{$module}/{$controller}/{$action}"));
        $currentOrganizationCode = $request->header('organizationCode');
        if ($currentOrganizationCode) {
            setCurrentOrganizationCode($currentOrganizationCode);
        }
        // 登录状态检查
        if (!empty($access['is_login'])) {
            $authorization = $request->header('Authorization');
            $accessToken = '';
            if ($authorization) {
                $accessToken = explode(' ', $authorization)[1];
            }
            $data = JwtService::decodeToken($accessToken);
            if (isError($data)) {
                //TODO 启用refreshToken
                if ($data['errno'] == 3) {
                    $msg = ['code' => 401, 'msg' => 'accessToken过期'];
                    return json($msg);
                }
                $msg = ['code' => 401, 'msg' => '登录超时，请重新登录'];
                return json($msg);
            }
            $member = Cache::get('member:info:' . $data->data->code);
            if (!$member) {
                $msg = ['code' => 401, 'msg' => '登录超时，请重新登录'];
                return json($msg);
            }
            setCurrentMember($member);
        }
        // 访问权限检查
        if (!empty($access['is_auth']) && !auth($node, 'project')) {
            return json(['code' => 403, 'msg' => '无权限操作资源，访问被拒绝']);
        }

        //第三资源初始化
        $storageConfig = config('storage.');
        if ($storageConfig) {
            foreach ($storageConfig as $key => $config) {
                if ($key == 'qiniu' || $key == 'oss') {
                    foreach ($config as $itemKey => $item) {
                        sysconf($itemKey, $item);
                    }
                }else{
                    sysconf($key, $config);
                }
            }
        }
        return $next($request);
    }

    /**
     * 根据节点获取对应权限配置
     * @param string $node 权限节点
     * @return array
     * @throws DataNotFoundException
     * @throws ModelNotFoundException
     * @throws DbException
     */
    private function buildAuth($node)
    {
        $info = ProjectNode::cache(true, 30)->where(['node' => $node])->find();
        return [
            'is_menu' => intval(!empty($info['is_menu'])),
            'is_auth' => intval(!empty($info['is_auth'])),
            'is_login' => empty($info['is_auth']) ? intval(!empty($info['is_login'])) : 1,
        ];
    }
}
