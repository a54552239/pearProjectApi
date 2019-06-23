SET FOREIGN_KEY_CHECKS=0;

ALTER TABLE `pearProject`.`pear_department` ENGINE = InnoDB, ROW_FORMAT = Compact;

ALTER TABLE `pearProject`.`pear_file` ENGINE = InnoDB, ROW_FORMAT = Compact;

ALTER TABLE `pearProject`.`pear_member` ENGINE = InnoDB, ROW_FORMAT = Compact;

ALTER TABLE `pearProject`.`pear_member_account` ENGINE = InnoDB, ROW_FORMAT = Compact;

ALTER TABLE `pearProject`.`pear_project` ENGINE = InnoDB, ROW_FORMAT = Compact;

CREATE TABLE `pearProject`.`pear_project_features`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `code` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '编号',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '版本库名称',
  `description` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '描述',
  `create_time` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `update_time` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `organization_code` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '组织id',
  `project_code` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '项目id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '版本库表' ROW_FORMAT = Compact;

CREATE TABLE `pearProject`.`pear_project_version`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `code` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '编号',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '版本库名称',
  `description` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '描述',
  `create_time` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `update_time` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `organization_code` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '组织id',
  `publish_time` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '发布时间',
  `start_time` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '开始时间',
  `status` tinyint(1) NULL DEFAULT 0 COMMENT '状态。0：未开始，1：进行中，2：延期发布，3：已发布',
  `schedule` int(3) NULL DEFAULT 0 COMMENT '进度百分比',
  `plan_publish_time` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '预计发布时间',
  `features_code` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '版本库编号',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '项目版本表' ROW_FORMAT = Compact;

CREATE TABLE `pearProject`.`pear_project_version_log`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `member_code` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '操作人id',
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '操作内容',
  `remark` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '日志描述',
  `type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'create' COMMENT '操作类型',
  `create_time` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '添加时间',
  `source_code` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '任务id',
  `project_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '项目编号',
  `icon` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `features_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '版本库编号',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '项目日志表' ROW_FORMAT = Compact;

ALTER TABLE `pearProject`.`pear_task` ENGINE = InnoDB, ROW_FORMAT = Compact;

ALTER TABLE `pearProject`.`pear_task` ADD COLUMN `version_code` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '版本id' AFTER `schedule`;

ALTER TABLE `pearProject`.`pear_task` ADD COLUMN `features_code` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '版本库id' AFTER `version_code`;

ALTER TABLE `pearProject`.`pear_task_stages` ENGINE = InnoDB, ROW_FORMAT = Compact;

INSERT INTO `pear_project_menu`(`pid`, `title`, `icon`, `url`, `file_path`, `params`, `node`, `sort`, `status`, `create_by`, `create_at`, `is_inner`, `values`, `show_slider`) VALUES (153, '版本管理', '', 'project/space/features', 'project/space/features', ':code', 'project/index/info', 20, 1, 0, NULL, 1, '', 0);

SET FOREIGN_KEY_CHECKS=1;
