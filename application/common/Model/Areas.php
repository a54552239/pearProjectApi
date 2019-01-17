<?php

namespace app\common\Model;

use service\ToolsService;
use think\facade\Cache;

class Areas extends CommonModel
{
    protected $append = [];

    /**
     * 构建AntDesign所需的行政区划数据
     * @return array
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public static function createJsonForAnt()
    {
        $list = Cache::store('redis')->get('areadData');
        if (!$list) {
            $list = self::where('id > 100000')->order('id asc')->select()->toArray();
            Cache::store('redis')->set('areadData', $list);
        }
        if ($list) {
            $list = ToolsService::arr2tree($list, 'ID', 'ParentId');
        }
        return $list;
    }
}
