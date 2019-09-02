SET FOREIGN_KEY_CHECKS=0;

ALTER TABLE `pearProject`.`pear_project` ADD COLUMN `auto_update_schedule` tinyint(1) NULL DEFAULT 0 COMMENT '自动更新项目进度' AFTER `end_time`;

ALTER TABLE `pearProject`.`pear_project_features` ADD INDEX `project_code`(`project_code`) USING BTREE;

ALTER TABLE `pearProject`.`pear_project_features` ADD INDEX `organization_code`(`organization_code`) USING BTREE;

ALTER TABLE `pearProject`.`pear_project_log` DROP INDEX `member_code`;

ALTER TABLE `pearProject`.`pear_project_log` ADD INDEX `source_code`(`source_code`) USING BTREE;

ALTER TABLE `pearProject`.`pear_project_version` ADD INDEX `organization_code`(`organization_code`) USING BTREE;

ALTER TABLE `pearProject`.`pear_project_version` ADD INDEX `features_code`(`features_code`) USING BTREE;

ALTER TABLE `pearProject`.`pear_project_version_log` ADD INDEX `project_code`(`project_code`) USING BTREE;

ALTER TABLE `pearProject`.`pear_project_version_log` ADD INDEX `features_code`(`features_code`) USING BTREE;

ALTER TABLE `pearProject`.`pear_task` ADD INDEX `stage_code`(`stage_code`) USING BTREE;

ALTER TABLE `pearProject`.`pear_task` ADD INDEX `project_code`(`project_code`) USING BTREE;

ALTER TABLE `pearProject`.`pear_task` ADD INDEX `pcode`(`pcode`) USING BTREE;

ALTER TABLE `pearProject`.`pear_task` ADD INDEX `sort`(`sort`) USING BTREE;

SET FOREIGN_KEY_CHECKS=1;
