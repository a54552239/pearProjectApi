<?php

namespace app\common\Model;

class SystemConfig extends CommonModel
{
    protected $pk = 'id';

    public function info()
    {
        $config = $this->select();
        $data = [];
        foreach ($config as $item) {
            $data[$item['name']] = $item['value'];
        }
        return $data;
    }
}
