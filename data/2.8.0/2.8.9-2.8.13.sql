SET FOREIGN_KEY_CHECKS=0;

ALTER TABLE `pearProject`.`pear_task` ADD COLUMN `done_by` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '完成人' AFTER `create_by`;

ALTER TABLE `pearProject`.`pear_task` ADD COLUMN `done_time` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '完成时间' AFTER `done_by`;

ALTER TABLE `pearProject`.`pear_task` ADD COLUMN `status` tinyint(2) NULL DEFAULT 0 COMMENT '执行状态。0：未开始，1：已完成，2：进行中，3：挂起，4：测试中' AFTER `work_time`;

SET FOREIGN_KEY_CHECKS=1;
