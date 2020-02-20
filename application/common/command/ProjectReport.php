<?php

namespace app\common\command;

use think\console\Command;
use think\console\Input;
use think\console\Output;

class ProjectReport extends Command
{
    protected function configure()
    {
        $this->setName('ProjectReport');
    }

    protected function execute(Input $input, Output $output)
    {
        \app\common\Model\ProjectReport::setDayilyProejctReport();
        $output->writeln('success_at ' . nowTime());
    }
}
