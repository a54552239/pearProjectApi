#!/bin/bash
php src/App/Plugins/GateWayWorker/start_register.php stop&
php src/App/Plugins/GateWayWorker/start_gateway.php stop&
php src/App/Plugins/GateWayWorker/start_businessworker.php stop;
