<?php

namespace app\common\Model;

class SystemLog extends CommonModel
{
    protected $pk = 'id';

    public function actionGroup()
    {
        return $this->group('action')->column('action');
    }
}
