#!/bin/bash
php application/common/Plugins/GateWayWorker/start_register.php start&
php application/common/Plugins/GateWayWorker/start_gateway.php start&
php application/common/Plugins/GateWayWorker/start_businessworker.php start;
