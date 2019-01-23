SET FOREIGN_KEY_CHECKS=0;

ALTER TABLE `pms`.`pms_project_level` MODIFY COLUMN `sort` int(11) NULL DEFAULT 0 COMMENT '排序' AFTER `money`;

ALTER TABLE `pms`.`pms_project_type` MODIFY COLUMN `sort` int(11) NULL DEFAULT 0 AFTER `memo`;

CREATE TABLE `pms`.`pms_task_tag`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project` int(11) NULL DEFAULT NULL COMMENT '项目id',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '标签名',
  `color` enum('blue','red','orange','green','brown','purple') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'blue' COMMENT '颜色',
  `create_time` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

CREATE TABLE `pms`.`pms_task_to_tag`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `task_id` int(11) NULL DEFAULT 0,
  `tag_id` int(11) NULL DEFAULT 0,
  `create_time` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Fixed;

ALTER TABLE `pms`.`pms_user_level` MODIFY COLUMN `sort` tinyint(11) NULL DEFAULT 0 COMMENT '排序' AFTER `level_desc`;

ALTER TABLE `pms`.`pms_user_position` MODIFY COLUMN `sort` tinyint(11) NULL DEFAULT 0 AFTER `position_desc`;

INSERT INTO `pms`.`pms_auth_rule`(`id`, `name`, `title`, `status`, `add_condition`, `pid`, `model`, `rule_desc`) VALUES (154, 'Project_Task.addTaskTag', '添加任务标签', 1, '', 50, 0, '添加任务标签');
INSERT INTO `pms`.`pms_auth_rule`(`id`, `name`, `title`, `status`, `add_condition`, `pid`, `model`, `rule_desc`) VALUES (155, 'Project_Task.editTaskTag', '编辑任务标签', 1, '', 50, 0, '编辑任务标签');
INSERT INTO `pms`.`pms_auth_rule`(`id`, `name`, `title`, `status`, `add_condition`, `pid`, `model`, `rule_desc`) VALUES (156, 'Project_Task.delTaskTag', '删除任务标签', 1, '', 50, 0, '删除任务标签');


UPDATE `pms`.`pms_auth_group` SET `rules` = '1,2,3,4,5,6,7,8,9,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73,74,75,76,77,78,79,80,81,82,83,84,85,86,87,88,89,90,91,92,93,94,95,96,97,98,99,100,101,102,103,104,105,106,107,108,109,110,111,112,113,114,115,116,117,119,120,121,122,123,124,125,126,127,128,129,130,131,132,133,134,135,136,137,138,139,140,141,142,143,144,145,146,147,148,149,150,151,152,153,154,155,156' WHERE `id` = 7;

SET FOREIGN_KEY_CHECKS=1;
