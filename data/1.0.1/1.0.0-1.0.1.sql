SET FOREIGN_KEY_CHECKS=0;

ALTER TABLE `pms`.`pms_file` MODIFY COLUMN `extra` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' AFTER `downloads`;

ALTER TABLE `pms`.`pms_project` DROP COLUMN `days`;

ALTER TABLE `pms`.`pms_task` MODIFY COLUMN `pri` tinyint(3) UNSIGNED NULL DEFAULT 3 AFTER `type`;

ALTER TABLE `pms`.`pms_task` MODIFY COLUMN `status` enum('wait','doing','done','pause','cancel','closed') CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'wait' AFTER `pri`;

ALTER TABLE `pms`.`pms_task` MODIFY COLUMN `desc` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL AFTER `status`;

ALTER TABLE `pms`.`pms_task` MODIFY COLUMN `openedBy` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL AFTER `desc`;

ALTER TABLE `pms`.`pms_task` MODIFY COLUMN `openedDate` datetime(0) NULL DEFAULT NULL AFTER `openedBy`;

ALTER TABLE `pms`.`pms_task` MODIFY COLUMN `assignedTo` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL AFTER `openedDate`;

ALTER TABLE `pms`.`pms_task` MODIFY COLUMN `deleted` enum('0','1') CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' AFTER `assignedTo`;

ALTER TABLE `pms`.`pms_team` MODIFY COLUMN `join` date NULL DEFAULT '0000-00-00' AFTER `account`;

ALTER TABLE `pms`.`pms_team` DROP COLUMN `role`;

ALTER TABLE `pms`.`pms_team` DROP COLUMN `days`;

ALTER TABLE `pms`.`pms_team` DROP COLUMN `hours`;

SET FOREIGN_KEY_CHECKS=1;
