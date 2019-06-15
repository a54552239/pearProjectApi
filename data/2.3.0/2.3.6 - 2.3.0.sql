SET FOREIGN_KEY_CHECKS=0;

ALTER TABLE `pearproject`.`pear_project` ADD COLUMN `open_begin_time` tinyint(1) NULL DEFAULT 0 COMMENT '是否开启任务开始时间' AFTER `archive_time`;

ALTER TABLE `pearproject`.`pear_project` ADD COLUMN `open_task_private` tinyint(1) NULL DEFAULT 0 COMMENT '是否开启新任务默认开启隐私模式' AFTER `open_begin_time`;

ALTER TABLE `pearProject`.`pear_project` ADD COLUMN `task_board_theme` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'default' COMMENT '看板风格' AFTER `open_task_private`;

ALTER TABLE `pearproject`.`pear_task` ADD COLUMN `schedule` int(3) NULL DEFAULT 0 COMMENT '进度百分比' AFTER `path`;

SET FOREIGN_KEY_CHECKS=1;
