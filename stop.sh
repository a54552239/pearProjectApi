#!/bin/bash
php application/common/Plugins/GateWayWorker/start_register.php stop&
php application/common/Plugins/GateWayWorker/start_gateway.php stop&
php application/common/Plugins/GateWayWorker/start_businessworker.php stop;
