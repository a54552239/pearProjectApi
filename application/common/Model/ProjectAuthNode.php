<?php

namespace app\common\Model;

class ProjectAuthNode extends CommonModel
{
    protected $pk = 'id';

    public function getIdAttr($value)
    {
        return strval($value);
    }
}
