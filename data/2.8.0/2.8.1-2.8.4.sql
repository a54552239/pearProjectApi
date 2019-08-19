SET FOREIGN_KEY_CHECKS=0;

ALTER TABLE `pearProject`.`pear_notify` ADD COLUMN `source_code` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '资源code' AFTER `avatar`;

CREATE TABLE `pearproject`.`pear_project_report`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_code` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '项目编号',
  `date` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '日期',
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `create_time` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `update_time` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `union`(`project_code`, `date`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '项目报表统计表' ROW_FORMAT = Compact;

ALTER TABLE `pearproject`.`pear_collection` ADD UNIQUE INDEX `code`(`code`) USING BTREE;

ALTER TABLE `pearproject`.`pear_department` ADD UNIQUE INDEX `code`(`code`) USING BTREE;

ALTER TABLE `pearproject`.`pear_department_member` ADD UNIQUE INDEX `code`(`code`) USING BTREE;

ALTER TABLE `pearproject`.`pear_file` ADD UNIQUE INDEX `code`(`code`) USING BTREE;

ALTER TABLE `pearproject`.`pear_invite_link` ADD UNIQUE INDEX `code`(`code`) USING BTREE;

ALTER TABLE `pearproject`.`pear_member` ADD UNIQUE INDEX `code`(`code`) USING BTREE;

ALTER TABLE `pearproject`.`pear_member_account` ADD UNIQUE INDEX `code`(`code`) USING BTREE;

ALTER TABLE `pearproject`.`pear_organization` ADD UNIQUE INDEX `code`(`code`) USING BTREE;

ALTER TABLE `pearproject`.`pear_project` ADD UNIQUE INDEX `code`(`code`) USING BTREE;

ALTER TABLE `pearproject`.`pear_project_features` ADD UNIQUE INDEX `code`(`code`) USING BTREE;

ALTER TABLE `pearproject`.`pear_project_log` ADD UNIQUE INDEX `code`(`code`) USING BTREE;

ALTER TABLE `pearproject`.`pear_project_member` ADD UNIQUE INDEX `unique`(`project_code`, `member_code`) USING BTREE;

ALTER TABLE `pearproject`.`pear_project_report` ADD INDEX `code`(`project_code`) USING BTREE;

ALTER TABLE `pearproject`.`pear_project_template` ADD UNIQUE INDEX `code`(`code`) USING BTREE;

ALTER TABLE `pearproject`.`pear_project_version` ADD UNIQUE INDEX `code`(`code`) USING BTREE;

ALTER TABLE `pearproject`.`pear_project_version_log` ADD UNIQUE INDEX `code`(`code`) USING BTREE;

ALTER TABLE `pearproject`.`pear_source_link` ADD UNIQUE INDEX `code`(`code`) USING BTREE;

ALTER TABLE `pearproject`.`pear_task` DROP INDEX `task`;

ALTER TABLE `pearproject`.`pear_task` ADD UNIQUE INDEX `task`(`code`) USING BTREE;

ALTER TABLE `pearproject`.`pear_task_stages` ADD UNIQUE INDEX `code`(`code`) USING BTREE;

ALTER TABLE `pearproject`.`pear_task_stages_template` ADD UNIQUE INDEX `code`(`code`) USING BTREE;

ALTER TABLE `pearproject`.`pear_task_tag` ADD UNIQUE INDEX `code`(`code`) USING BTREE;

ALTER TABLE `pearproject`.`pear_task_to_tag` ADD UNIQUE INDEX `code`(`code`) USING BTREE;

ALTER TABLE `pearproject`.`pear_task_work_time` ADD UNIQUE INDEX `code`(`code`) USING BTREE;

ALTER TABLE `pearproject`.`pear_task_workflow` ADD UNIQUE INDEX `code`(`code`) USING BTREE;

ALTER TABLE `pearproject`.`pear_task_workflow_rule` ADD UNIQUE INDEX `code`(`code`) USING BTREE;

SET FOREIGN_KEY_CHECKS=1;
