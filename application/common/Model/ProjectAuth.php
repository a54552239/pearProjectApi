<?php

namespace app\common\Model;

class ProjectAuth extends CommonModel
{
    protected $pk = 'id';
    protected $append = ['canDelete'];

    /**
     * @param $id
     * @return bool|int
     * @throws \Exception
     */
    public function del($id)
    {
        //TODO 删除该权限后，拥有这个权限的账户将被在设置默认权限
        if ($this::destroy($id)) {
            $where = ['auth' => $id];
            $result = ProjectAuthNode::where($where)->delete();
            if ($result !== false) {
                return true;
            }
        }
        return false;
    }

    public function getIdAttr($value)
    {
        return strval($value);
    }

    public function getStatusTextAttr($value, $data)
    {
        $status = [0 => '禁用', 1 => '使用中'];
        return $status[$data['status']];
    }

    public function getCanDeleteAttr($value, $data)
    {
        if ($data['type'] == 'admin' || $data['type'] == 'member') {
            return 0;
        }
        return 1;
    }
}
