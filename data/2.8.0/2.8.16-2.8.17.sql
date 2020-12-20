SET FOREIGN_KEY_CHECKS=0;

CREATE TABLE `pear_events`  (
                                                 `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT,
                                                 `title` varchar(90) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '名称',
                                                 `code` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '编号',
                                                 `description` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '描述',
                                                 `order` int(11) UNSIGNED NULL DEFAULT 0 COMMENT '排序',
                                                 `deleted` tinyint(1) NULL DEFAULT 0 COMMENT '删除标记',
                                                 `organization_code` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '组织id',
                                                 `deleted_time` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '删除时间',
                                                 `private` tinyint(1) NULL DEFAULT 1 COMMENT '是否私有',
                                                 `begin_time` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '项目开始日期',
                                                 `end_time` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '项目截止日期',
                                                 `all_day` tinyint(1) NULL DEFAULT NULL COMMENT '是否全天',
                                                 `project_code` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '项目编码',
                                                 `position` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '地点',
                                                 `created_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
                                                 PRIMARY KEY (`id`) USING BTREE,
                                                 UNIQUE INDEX `code`(`code`) USING BTREE,
                                                 INDEX `project`(`order`) USING BTREE,
                                                 INDEX `project_code`(`project_code`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '日程表' ROW_FORMAT = COMPACT;

CREATE TABLE `pear_events_log`  (
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
                                                     `events_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '版本库编号',
                                                     PRIMARY KEY (`id`) USING BTREE,
                                                     UNIQUE INDEX `code`(`code`) USING BTREE,
                                                     INDEX `project_code`(`project_code`) USING BTREE,
                                                     INDEX `features_code`(`events_code`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '日程日志表' ROW_FORMAT = COMPACT;

CREATE TABLE `pear_events_member`  (
                                                        `id` int(11) NOT NULL AUTO_INCREMENT,
                                                        `events_code` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '项目id',
                                                        `member_code` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '成员id',
                                                        `join_time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '加入时间',
                                                        `is_owner` int(11) NULL DEFAULT 0 COMMENT '拥有者',
                                                        `project_code` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '项目id',
                                                        `status` tinyint(1) NULL DEFAULT 0 COMMENT '确认状态',
                                                        `confirm_time` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '确认时间',
                                                        PRIMARY KEY (`id`) USING BTREE,
                                                        UNIQUE INDEX `unique`(`events_code`, `member_code`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '日程-成员表' ROW_FORMAT = COMPACT;

ALTER TABLE `pear_file` MODIFY COLUMN `size` int(12) UNSIGNED NULL DEFAULT 0 COMMENT '文件大小' AFTER `extension`;

ALTER TABLE `pear_project_log` MODIFY COLUMN `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '操作内容' AFTER `member_code`;

ALTER TABLE `pear_task` CHARACTER SET = utf8mb4, COLLATE = utf8mb4_general_ci;

ALTER TABLE `pear_task` MODIFY COLUMN `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL AFTER `project_code`;

SET FOREIGN_KEY_CHECKS=1;
