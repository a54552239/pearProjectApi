SET FOREIGN_KEY_CHECKS=0;

CREATE TABLE `pearproject`.`pear_invite_link`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '邀请码',
  `create_by` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '邀请人',
  `invite_type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '链接类型',
  `source_code` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '资源编码',
  `create_time` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建时间',
  `over_time` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '过期时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '邀请链接表' ROW_FORMAT = Compact;

ALTER TABLE `pearproject`.`pear_notify` ADD COLUMN `avatar` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '头像/图片' AFTER `from_type`;

ALTER TABLE `pearproject`.`pear_notify` MODIFY COLUMN `type` enum('notice','message','task') CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '通知类型。通知：notice，消息：message，待办：task' AFTER `content`;

ALTER TABLE `pearproject`.`pear_notify` MODIFY COLUMN `from` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '发送人id' AFTER `type`;

ALTER TABLE `pearproject`.`pear_notify` MODIFY COLUMN `to` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '送达用户id' AFTER `from`;

ALTER TABLE `pearproject`.`pear_notify` MODIFY COLUMN `action` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'none' COMMENT '场景：task，project' AFTER `send_time`;

ALTER TABLE `pearproject`.`pear_notify` MODIFY COLUMN `terminal` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '推送终端。pc端：project，移动端：wap' AFTER `action`;

ALTER TABLE `pearproject`.`pear_notify` MODIFY COLUMN `from_type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '\'project\',\'system\'' AFTER `terminal`;

ALTER TABLE `pearproject`.`pear_task` ADD COLUMN `path` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '上级任务路径' AFTER `id_num`;

SET FOREIGN_KEY_CHECKS=1;
