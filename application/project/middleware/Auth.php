<?php

namespace app\project\middleware;

use app\common\Model\ProjectNode;
use service\JwtService;
use service\NodeService;
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
     * @param \Closure $next
     * @return mixed
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public function handle($request, \Closure $next)
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
            $isError = isError($data);
            if ($isError) {
                //TODO 启用refreshToken
                if ($data['errno'] == 3) {
                    $msg = ['code' => 401, 'msg' => 'accessToken过期'];
                    return json($msg);
                }
                $msg = ['code' => 401, 'msg' => 'token过期，请重新登录'];
                return json($msg);
            }
            setCurrentMember(get_object_vars($data->data));
        }
        // 访问权限检查
        if (!empty($access['is_auth']) && !auth($node, 'project')) {
            return json(['code' => 403, 'msg' => '无权限操作资源，访问被拒绝']);
        }
        return $next($request);
    }

    /**
     * 根据节点获取对应权限配置
     * @param string $node 权限节点
     * @return array
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
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
