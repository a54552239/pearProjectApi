SET FOREIGN_KEY_CHECKS=0;

ALTER TABLE `pms`.`pms_task_tag` ADD COLUMN `color_value` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL AFTER `create_time`;

SET FOREIGN_KEY_CHECKS=1;
