SET FOREIGN_KEY_CHECKS=0;

ALTER TABLE `pearproject`.`pear_member` ADD COLUMN `dingtalk_openid` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '钉钉openid' AFTER `code`;

ALTER TABLE `pearproject`.`pear_member` ADD COLUMN `dingtalk_unionid` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '钉钉unionid' AFTER `dingtalk_openid`;

SET FOREIGN_KEY_CHECKS=1;
