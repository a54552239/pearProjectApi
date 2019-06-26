SET FOREIGN_KEY_CHECKS=0;

ALTER TABLE `pearProject`.`pear_member` MODIFY COLUMN `dingtalk_userid` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '钉钉用户id' AFTER `dingtalk_unionid`;

ALTER TABLE `pearProject`.`pear_project_log` ADD COLUMN `is_robot` tinyint(1) NULL DEFAULT 0 COMMENT '是否机器人' AFTER `icon`;

CREATE TABLE `pearProject`.`pear_task_workflow`  (
                                                     `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
                                                     `code` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '编号',
                                                     `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '规则名称',
                                                     `create_time` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
                                                     `update_time` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
                                                     `organization_code` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '组织id',
                                                     `project_code` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '项目id',
                                                     PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '任务工作流表' ROW_FORMAT = Compact;

CREATE TABLE `pearProject`.`pear_task_workflow_rule`  (
                                                          `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
                                                          `code` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '编号',
                                                          `type` tinyint(1) NULL DEFAULT 0 COMMENT '规则类型，0：任务分组，1：人员，2：条件',
                                                          `object_code` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '对象id',
                                                          `action` tinyint(1) NULL DEFAULT 0 COMMENT '场景。0：任何条件，1：被完成，2：被重做，3：设置执行人，4：截止时间，5：优先级',
                                                          `create_time` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
                                                          `update_time` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
                                                          `workflow_code` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '工作流id',
                                                          `sort` int(10) NULL DEFAULT 0 COMMENT '排序',
                                                          PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '任务工作流规则表' ROW_FORMAT = Compact;

SET FOREIGN_KEY_CHECKS=1;
