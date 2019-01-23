#!/bin/bash
php src/App/Plugins/GateWayWorker/start_register.php start&
php src/App/Plugins/GateWayWorker/start_gateway.php start&
php src/App/Plugins/GateWayWorker/start_businessworker.php start;
