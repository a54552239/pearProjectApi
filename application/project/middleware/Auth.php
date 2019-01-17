<?php

namespace app\project\middleware;

use app\common\Model\ProjectNode;
use service\NodeService;
use think\facade\Response;
use think\facade\Session;
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
            session('currentOrganizationCode', $currentOrganizationCode);
        }
        // 登录状态检查
        if (!empty($access['is_login']) && !session('member')) {
            $msg = ['code' => 401, 'msg' => '抱歉，您还没有登录获取访问权限！'];
            return json($msg);
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
