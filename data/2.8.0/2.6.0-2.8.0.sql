SET FOREIGN_KEY_CHECKS=0;

ALTER TABLE `pearProject`.`pear_project` ADD COLUMN `begin_time` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '项目开始日期' AFTER `task_board_theme`;

ALTER TABLE `pearProject`.`pear_project` ADD COLUMN `end_time` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '项目截止日期' AFTER `begin_time`;

ALTER TABLE `pearProject`.`pear_task` ADD COLUMN `work_time` int(5) NULL DEFAULT 0 COMMENT '预估工时' AFTER `features_code`;

CREATE TABLE `pearProject`.`pear_task_work_time`  (
                                                      `id` int(11) NOT NULL AUTO_INCREMENT,
                                                      `task_code` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '任务ID',
                                                      `member_code` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '成员id',
                                                      `create_time` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
                                                      `content` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '描述',
                                                      `begin_time` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '开始时间',
                                                      `num` int(5) NULL DEFAULT 0 COMMENT '工时',
                                                      `code` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'id',
                                                      PRIMARY KEY (`id`) USING BTREE,
                                                      UNIQUE INDEX `id`(`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '任务工时表' ROW_FORMAT = Compact;

SET FOREIGN_KEY_CHECKS=1;
