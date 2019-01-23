/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 50640
 Source Host           : localhost:3306
 Source Schema         : pms

 Target Server Type    : MySQL
 Target Server Version : 50640
 File Encoding         : 65001

 Date: 23/07/2018 12:34:44
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for pms_auth_group
-- ----------------------------
DROP TABLE IF EXISTS `pms_auth_group`;
CREATE TABLE `pms_auth_group`  (
  `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` char(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `rules` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `menus` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '菜单',
  `desc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '描述',
  `add_time` int(11) NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '权限/角色组' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of pms_auth_group
-- ----------------------------
INSERT INTO `pms_auth_group` VALUES (1, '默认用户', 1, '1,3,4,7,8,12,13,16,21,24,35,37,45,46,48,119,120', '2,4,5,6,26,27,49,50', '默认用户', 1503651576);
INSERT INTO `pms_auth_group` VALUES (3, '普通职员', 1, '50,51,56,57,58,59,62,63,64,65,66,67,69,70,71,72,76,77,78,82,83,84,85,86,87,88,91,92,93,94,95,96,97,98,99,100,101,102,103,104,105,106,107,108,109,110,111,112,113,114,116,117,122,124,151,152,153', '2,4,5,6,30,31,47', '普通职员', 1503651576);
INSERT INTO `pms_auth_group` VALUES (4, '主管', 1, '1,2,3,4,5,13,15,16,34,35,36,45,46,47,48,49,50,51,52,53,54,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,77,84,85,86,87,88,89,90,91,92,93,94,95,96,97,98,99,100,101,102,103,104,105,106,107,108,109,110,111,112,113,114,115,116,117,121,122,123', '1,2,3,30,31,35,36', '部门主管', 1503651576);
INSERT INTO `pms_auth_group` VALUES (7, '超级管理员', 1, '1,2,3,4,5,6,7,8,9,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73,74,75,76,77,78,79,80,81,82,83,84,85,86,87,88,89,90,91,92,93,94,95,96,97,98,99,100,101,102,103,104,105,106,107,108,109,110,111,112,113,114,115,116,117,119,120,121,122,123,124,125,126,127,128,129,130,131,132,133,134,135,136,137,138,139,140,141,142,143,144,145,146,147,148,149,150,151,152,153', '1,2,3,4,5,8,9,10,11,19,20,21,22,23,24,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52', '超级管理员', 1506156639);
INSERT INTO `pms_auth_group` VALUES (8, '演示用户', 1, '1,3,4,5,7,8,12,13,16,19,21,24,32,33,34,35,37,39,43,44,45,46,47,48,50,51,55,56,57,58,59,60,62,63,64,65,66,67,68,69,70,71,72,76,77,78,82,83,84,85,86,87,88,89,91,92,93,94,95,96,97,98,99,100,101,102,104,105,106,107,108,109,110,111,112,113,114,115,116,117,119,120,121,122,123,124,125,126,127,128,129,130,131,132,133,134,135,136,137,138,142,144,148,149,150,151,152,153', '1,3,8,9,10,11,19,20,21,22,23,24,28,29,30,31,32,33,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51', '演示用户', 1516259219);

-- ----------------------------
-- Table structure for pms_auth_group_access
-- ----------------------------
DROP TABLE IF EXISTS `pms_auth_group_access`;
CREATE TABLE `pms_auth_group_access`  (
  `uid` mediumint(8) UNSIGNED NOT NULL,
  `group_id` mediumint(8) UNSIGNED NOT NULL,
  UNIQUE INDEX `uid_group_id`(`uid`, `group_id`) USING BTREE,
  INDEX `uid`(`uid`) USING BTREE,
  INDEX `group_id`(`group_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户-角色表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of pms_auth_group_access
-- ----------------------------
INSERT INTO `pms_auth_group_access` VALUES (2, 1);
INSERT INTO `pms_auth_group_access` VALUES (2, 3);
INSERT INTO `pms_auth_group_access` VALUES (2, 4);
INSERT INTO `pms_auth_group_access` VALUES (3, 1);
INSERT INTO `pms_auth_group_access` VALUES (3, 3);
INSERT INTO `pms_auth_group_access` VALUES (3, 4);
INSERT INTO `pms_auth_group_access` VALUES (3, 7);
INSERT INTO `pms_auth_group_access` VALUES (4, 1);
INSERT INTO `pms_auth_group_access` VALUES (4, 3);
INSERT INTO `pms_auth_group_access` VALUES (5, 1);
INSERT INTO `pms_auth_group_access` VALUES (5, 3);
INSERT INTO `pms_auth_group_access` VALUES (6, 1);
INSERT INTO `pms_auth_group_access` VALUES (6, 3);
INSERT INTO `pms_auth_group_access` VALUES (7, 1);
INSERT INTO `pms_auth_group_access` VALUES (7, 3);
INSERT INTO `pms_auth_group_access` VALUES (8, 1);
INSERT INTO `pms_auth_group_access` VALUES (8, 3);
INSERT INTO `pms_auth_group_access` VALUES (9, 1);
INSERT INTO `pms_auth_group_access` VALUES (9, 3);
INSERT INTO `pms_auth_group_access` VALUES (10, 1);
INSERT INTO `pms_auth_group_access` VALUES (10, 3);
INSERT INTO `pms_auth_group_access` VALUES (11, 1);
INSERT INTO `pms_auth_group_access` VALUES (11, 3);
INSERT INTO `pms_auth_group_access` VALUES (11, 4);
INSERT INTO `pms_auth_group_access` VALUES (12, 1);
INSERT INTO `pms_auth_group_access` VALUES (12, 3);
INSERT INTO `pms_auth_group_access` VALUES (13, 1);
INSERT INTO `pms_auth_group_access` VALUES (13, 3);
INSERT INTO `pms_auth_group_access` VALUES (14, 1);
INSERT INTO `pms_auth_group_access` VALUES (14, 3);
INSERT INTO `pms_auth_group_access` VALUES (15, 1);
INSERT INTO `pms_auth_group_access` VALUES (15, 3);
INSERT INTO `pms_auth_group_access` VALUES (16, 1);
INSERT INTO `pms_auth_group_access` VALUES (16, 3);
INSERT INTO `pms_auth_group_access` VALUES (16, 4);
INSERT INTO `pms_auth_group_access` VALUES (17, 1);
INSERT INTO `pms_auth_group_access` VALUES (17, 3);
INSERT INTO `pms_auth_group_access` VALUES (18, 1);
INSERT INTO `pms_auth_group_access` VALUES (18, 3);
INSERT INTO `pms_auth_group_access` VALUES (19, 1);
INSERT INTO `pms_auth_group_access` VALUES (19, 3);
INSERT INTO `pms_auth_group_access` VALUES (20, 1);
INSERT INTO `pms_auth_group_access` VALUES (20, 3);
INSERT INTO `pms_auth_group_access` VALUES (21, 1);
INSERT INTO `pms_auth_group_access` VALUES (21, 3);
INSERT INTO `pms_auth_group_access` VALUES (22, 1);
INSERT INTO `pms_auth_group_access` VALUES (22, 3);
INSERT INTO `pms_auth_group_access` VALUES (23, 1);
INSERT INTO `pms_auth_group_access` VALUES (23, 3);
INSERT INTO `pms_auth_group_access` VALUES (24, 1);
INSERT INTO `pms_auth_group_access` VALUES (24, 3);
INSERT INTO `pms_auth_group_access` VALUES (25, 1);
INSERT INTO `pms_auth_group_access` VALUES (25, 3);
INSERT INTO `pms_auth_group_access` VALUES (26, 7);
INSERT INTO `pms_auth_group_access` VALUES (27, 1);
INSERT INTO `pms_auth_group_access` VALUES (27, 3);
INSERT INTO `pms_auth_group_access` VALUES (28, 1);
INSERT INTO `pms_auth_group_access` VALUES (28, 3);
INSERT INTO `pms_auth_group_access` VALUES (29, 1);
INSERT INTO `pms_auth_group_access` VALUES (29, 3);
INSERT INTO `pms_auth_group_access` VALUES (30, 1);
INSERT INTO `pms_auth_group_access` VALUES (30, 3);
INSERT INTO `pms_auth_group_access` VALUES (31, 1);
INSERT INTO `pms_auth_group_access` VALUES (31, 3);
INSERT INTO `pms_auth_group_access` VALUES (32, 1);
INSERT INTO `pms_auth_group_access` VALUES (32, 3);
INSERT INTO `pms_auth_group_access` VALUES (33, 1);
INSERT INTO `pms_auth_group_access` VALUES (33, 3);
INSERT INTO `pms_auth_group_access` VALUES (34, 1);
INSERT INTO `pms_auth_group_access` VALUES (34, 3);
INSERT INTO `pms_auth_group_access` VALUES (35, 1);
INSERT INTO `pms_auth_group_access` VALUES (35, 3);
INSERT INTO `pms_auth_group_access` VALUES (36, 1);
INSERT INTO `pms_auth_group_access` VALUES (36, 3);
INSERT INTO `pms_auth_group_access` VALUES (37, 1);
INSERT INTO `pms_auth_group_access` VALUES (37, 3);
INSERT INTO `pms_auth_group_access` VALUES (38, 1);
INSERT INTO `pms_auth_group_access` VALUES (38, 3);
INSERT INTO `pms_auth_group_access` VALUES (39, 1);
INSERT INTO `pms_auth_group_access` VALUES (39, 3);
INSERT INTO `pms_auth_group_access` VALUES (39, 4);
INSERT INTO `pms_auth_group_access` VALUES (40, 1);
INSERT INTO `pms_auth_group_access` VALUES (40, 3);
INSERT INTO `pms_auth_group_access` VALUES (41, 1);
INSERT INTO `pms_auth_group_access` VALUES (41, 3);
INSERT INTO `pms_auth_group_access` VALUES (42, 1);
INSERT INTO `pms_auth_group_access` VALUES (42, 3);
INSERT INTO `pms_auth_group_access` VALUES (43, 1);
INSERT INTO `pms_auth_group_access` VALUES (43, 3);
INSERT INTO `pms_auth_group_access` VALUES (44, 1);
INSERT INTO `pms_auth_group_access` VALUES (44, 3);
INSERT INTO `pms_auth_group_access` VALUES (45, 1);
INSERT INTO `pms_auth_group_access` VALUES (45, 3);
INSERT INTO `pms_auth_group_access` VALUES (46, 1);
INSERT INTO `pms_auth_group_access` VALUES (46, 3);
INSERT INTO `pms_auth_group_access` VALUES (46, 4);
INSERT INTO `pms_auth_group_access` VALUES (46, 7);
INSERT INTO `pms_auth_group_access` VALUES (47, 1);
INSERT INTO `pms_auth_group_access` VALUES (47, 3);
INSERT INTO `pms_auth_group_access` VALUES (48, 1);
INSERT INTO `pms_auth_group_access` VALUES (48, 3);
INSERT INTO `pms_auth_group_access` VALUES (49, 1);
INSERT INTO `pms_auth_group_access` VALUES (49, 3);
INSERT INTO `pms_auth_group_access` VALUES (50, 1);
INSERT INTO `pms_auth_group_access` VALUES (50, 3);
INSERT INTO `pms_auth_group_access` VALUES (51, 1);
INSERT INTO `pms_auth_group_access` VALUES (51, 3);
INSERT INTO `pms_auth_group_access` VALUES (52, 1);
INSERT INTO `pms_auth_group_access` VALUES (52, 3);
INSERT INTO `pms_auth_group_access` VALUES (53, 1);
INSERT INTO `pms_auth_group_access` VALUES (53, 3);
INSERT INTO `pms_auth_group_access` VALUES (54, 1);
INSERT INTO `pms_auth_group_access` VALUES (54, 3);
INSERT INTO `pms_auth_group_access` VALUES (55, 1);
INSERT INTO `pms_auth_group_access` VALUES (55, 3);
INSERT INTO `pms_auth_group_access` VALUES (56, 1);
INSERT INTO `pms_auth_group_access` VALUES (56, 3);
INSERT INTO `pms_auth_group_access` VALUES (57, 1);
INSERT INTO `pms_auth_group_access` VALUES (57, 3);
INSERT INTO `pms_auth_group_access` VALUES (57, 4);
INSERT INTO `pms_auth_group_access` VALUES (58, 1);
INSERT INTO `pms_auth_group_access` VALUES (58, 3);
INSERT INTO `pms_auth_group_access` VALUES (59, 1);
INSERT INTO `pms_auth_group_access` VALUES (59, 3);
INSERT INTO `pms_auth_group_access` VALUES (60, 1);
INSERT INTO `pms_auth_group_access` VALUES (60, 3);
INSERT INTO `pms_auth_group_access` VALUES (61, 1);
INSERT INTO `pms_auth_group_access` VALUES (61, 3);
INSERT INTO `pms_auth_group_access` VALUES (62, 1);
INSERT INTO `pms_auth_group_access` VALUES (62, 3);
INSERT INTO `pms_auth_group_access` VALUES (63, 1);
INSERT INTO `pms_auth_group_access` VALUES (63, 3);
INSERT INTO `pms_auth_group_access` VALUES (64, 1);
INSERT INTO `pms_auth_group_access` VALUES (64, 3);
INSERT INTO `pms_auth_group_access` VALUES (65, 1);
INSERT INTO `pms_auth_group_access` VALUES (65, 3);
INSERT INTO `pms_auth_group_access` VALUES (66, 1);
INSERT INTO `pms_auth_group_access` VALUES (66, 3);
INSERT INTO `pms_auth_group_access` VALUES (67, 1);
INSERT INTO `pms_auth_group_access` VALUES (67, 3);
INSERT INTO `pms_auth_group_access` VALUES (68, 1);
INSERT INTO `pms_auth_group_access` VALUES (68, 3);
INSERT INTO `pms_auth_group_access` VALUES (69, 1);
INSERT INTO `pms_auth_group_access` VALUES (69, 3);
INSERT INTO `pms_auth_group_access` VALUES (70, 1);
INSERT INTO `pms_auth_group_access` VALUES (70, 3);
INSERT INTO `pms_auth_group_access` VALUES (71, 1);
INSERT INTO `pms_auth_group_access` VALUES (71, 3);
INSERT INTO `pms_auth_group_access` VALUES (72, 1);
INSERT INTO `pms_auth_group_access` VALUES (72, 3);
INSERT INTO `pms_auth_group_access` VALUES (73, 1);
INSERT INTO `pms_auth_group_access` VALUES (73, 3);
INSERT INTO `pms_auth_group_access` VALUES (74, 1);
INSERT INTO `pms_auth_group_access` VALUES (74, 3);
INSERT INTO `pms_auth_group_access` VALUES (75, 1);
INSERT INTO `pms_auth_group_access` VALUES (75, 3);
INSERT INTO `pms_auth_group_access` VALUES (76, 1);
INSERT INTO `pms_auth_group_access` VALUES (76, 3);
INSERT INTO `pms_auth_group_access` VALUES (77, 1);
INSERT INTO `pms_auth_group_access` VALUES (77, 3);
INSERT INTO `pms_auth_group_access` VALUES (78, 1);
INSERT INTO `pms_auth_group_access` VALUES (78, 3);
INSERT INTO `pms_auth_group_access` VALUES (79, 1);
INSERT INTO `pms_auth_group_access` VALUES (79, 3);
INSERT INTO `pms_auth_group_access` VALUES (80, 1);
INSERT INTO `pms_auth_group_access` VALUES (80, 3);
INSERT INTO `pms_auth_group_access` VALUES (81, 1);
INSERT INTO `pms_auth_group_access` VALUES (81, 3);
INSERT INTO `pms_auth_group_access` VALUES (82, 1);
INSERT INTO `pms_auth_group_access` VALUES (82, 3);
INSERT INTO `pms_auth_group_access` VALUES (83, 1);
INSERT INTO `pms_auth_group_access` VALUES (83, 3);
INSERT INTO `pms_auth_group_access` VALUES (84, 1);
INSERT INTO `pms_auth_group_access` VALUES (84, 3);
INSERT INTO `pms_auth_group_access` VALUES (85, 1);
INSERT INTO `pms_auth_group_access` VALUES (85, 3);
INSERT INTO `pms_auth_group_access` VALUES (86, 1);
INSERT INTO `pms_auth_group_access` VALUES (86, 3);
INSERT INTO `pms_auth_group_access` VALUES (87, 1);
INSERT INTO `pms_auth_group_access` VALUES (87, 3);
INSERT INTO `pms_auth_group_access` VALUES (88, 1);
INSERT INTO `pms_auth_group_access` VALUES (88, 3);
INSERT INTO `pms_auth_group_access` VALUES (89, 1);
INSERT INTO `pms_auth_group_access` VALUES (89, 3);
INSERT INTO `pms_auth_group_access` VALUES (90, 1);
INSERT INTO `pms_auth_group_access` VALUES (90, 3);
INSERT INTO `pms_auth_group_access` VALUES (91, 1);
INSERT INTO `pms_auth_group_access` VALUES (91, 3);
INSERT INTO `pms_auth_group_access` VALUES (92, 1);
INSERT INTO `pms_auth_group_access` VALUES (92, 3);
INSERT INTO `pms_auth_group_access` VALUES (93, 1);
INSERT INTO `pms_auth_group_access` VALUES (93, 3);
INSERT INTO `pms_auth_group_access` VALUES (94, 1);
INSERT INTO `pms_auth_group_access` VALUES (94, 3);
INSERT INTO `pms_auth_group_access` VALUES (95, 1);
INSERT INTO `pms_auth_group_access` VALUES (95, 3);
INSERT INTO `pms_auth_group_access` VALUES (96, 1);
INSERT INTO `pms_auth_group_access` VALUES (96, 3);
INSERT INTO `pms_auth_group_access` VALUES (97, 1);
INSERT INTO `pms_auth_group_access` VALUES (97, 3);
INSERT INTO `pms_auth_group_access` VALUES (98, 1);
INSERT INTO `pms_auth_group_access` VALUES (98, 3);
INSERT INTO `pms_auth_group_access` VALUES (99, 1);
INSERT INTO `pms_auth_group_access` VALUES (99, 3);
INSERT INTO `pms_auth_group_access` VALUES (100, 1);
INSERT INTO `pms_auth_group_access` VALUES (100, 3);
INSERT INTO `pms_auth_group_access` VALUES (101, 1);
INSERT INTO `pms_auth_group_access` VALUES (101, 3);
INSERT INTO `pms_auth_group_access` VALUES (102, 1);
INSERT INTO `pms_auth_group_access` VALUES (102, 3);
INSERT INTO `pms_auth_group_access` VALUES (103, 1);
INSERT INTO `pms_auth_group_access` VALUES (103, 3);
INSERT INTO `pms_auth_group_access` VALUES (104, 1);
INSERT INTO `pms_auth_group_access` VALUES (104, 3);
INSERT INTO `pms_auth_group_access` VALUES (105, 1);
INSERT INTO `pms_auth_group_access` VALUES (105, 3);
INSERT INTO `pms_auth_group_access` VALUES (106, 1);
INSERT INTO `pms_auth_group_access` VALUES (106, 3);
INSERT INTO `pms_auth_group_access` VALUES (107, 1);
INSERT INTO `pms_auth_group_access` VALUES (107, 3);
INSERT INTO `pms_auth_group_access` VALUES (108, 1);
INSERT INTO `pms_auth_group_access` VALUES (108, 3);
INSERT INTO `pms_auth_group_access` VALUES (109, 1);
INSERT INTO `pms_auth_group_access` VALUES (109, 3);
INSERT INTO `pms_auth_group_access` VALUES (110, 1);
INSERT INTO `pms_auth_group_access` VALUES (110, 3);
INSERT INTO `pms_auth_group_access` VALUES (111, 1);
INSERT INTO `pms_auth_group_access` VALUES (111, 3);
INSERT INTO `pms_auth_group_access` VALUES (112, 1);
INSERT INTO `pms_auth_group_access` VALUES (112, 3);
INSERT INTO `pms_auth_group_access` VALUES (113, 1);
INSERT INTO `pms_auth_group_access` VALUES (113, 3);
INSERT INTO `pms_auth_group_access` VALUES (114, 1);
INSERT INTO `pms_auth_group_access` VALUES (114, 3);
INSERT INTO `pms_auth_group_access` VALUES (115, 1);
INSERT INTO `pms_auth_group_access` VALUES (115, 3);
INSERT INTO `pms_auth_group_access` VALUES (116, 1);
INSERT INTO `pms_auth_group_access` VALUES (116, 3);
INSERT INTO `pms_auth_group_access` VALUES (117, 1);
INSERT INTO `pms_auth_group_access` VALUES (117, 3);
INSERT INTO `pms_auth_group_access` VALUES (118, 1);
INSERT INTO `pms_auth_group_access` VALUES (118, 3);
INSERT INTO `pms_auth_group_access` VALUES (119, 1);
INSERT INTO `pms_auth_group_access` VALUES (119, 3);
INSERT INTO `pms_auth_group_access` VALUES (119, 8);
INSERT INTO `pms_auth_group_access` VALUES (120, 1);
INSERT INTO `pms_auth_group_access` VALUES (120, 3);
INSERT INTO `pms_auth_group_access` VALUES (120, 8);
INSERT INTO `pms_auth_group_access` VALUES (121, 1);
INSERT INTO `pms_auth_group_access` VALUES (121, 3);
INSERT INTO `pms_auth_group_access` VALUES (121, 8);
INSERT INTO `pms_auth_group_access` VALUES (122, 1);
INSERT INTO `pms_auth_group_access` VALUES (122, 3);
INSERT INTO `pms_auth_group_access` VALUES (122, 8);
INSERT INTO `pms_auth_group_access` VALUES (123, 1);
INSERT INTO `pms_auth_group_access` VALUES (123, 3);
INSERT INTO `pms_auth_group_access` VALUES (123, 8);
INSERT INTO `pms_auth_group_access` VALUES (124, 1);
INSERT INTO `pms_auth_group_access` VALUES (124, 3);
INSERT INTO `pms_auth_group_access` VALUES (124, 8);

-- ----------------------------
-- Table structure for pms_auth_rule
-- ----------------------------
DROP TABLE IF EXISTS `pms_auth_rule`;
CREATE TABLE `pms_auth_rule`  (
  `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` char(80) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `title` char(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `add_condition` char(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `pid` int(11) NOT NULL DEFAULT 0 COMMENT '上级节点',
  `model` int(11) NOT NULL DEFAULT 0 COMMENT '分组',
  `rule_desc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `name`(`name`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 154 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '权限规则' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of pms_auth_rule
-- ----------------------------
INSERT INTO `pms_auth_rule` VALUES (1, 'User_User.getUserList', '用户列表', 1, '', 4, 1, '权限描述');
INSERT INTO `pms_auth_rule` VALUES (2, 'User_User.editUser', '编辑用户', 1, '', 4, 1, '权限描述');
INSERT INTO `pms_auth_rule` VALUES (3, 'User_User.Login', '登录', 1, '', 4, 1, '权限描述');
INSERT INTO `pms_auth_rule` VALUES (4, 'User', '用户模块', 1, '', 0, 1, '权限描述');
INSERT INTO `pms_auth_rule` VALUES (5, 'User_User.addUser', '添加用户', 1, '', 4, 1, '权限描述');
INSERT INTO `pms_auth_rule` VALUES (6, 'User_User.delUser', '删除用户', 1, '', 4, 1, '权限描述');
INSERT INTO `pms_auth_rule` VALUES (7, 'Auth', '权限模块', 1, '', 0, 1, '权限描述');
INSERT INTO `pms_auth_rule` VALUES (8, 'System_AuthGroup.GetList', '用户组列表', 1, '', 7, 1, '权限描述');
INSERT INTO `pms_auth_rule` VALUES (9, 'System_AuthGroup.addGroup', '新增用户组', 1, '', 7, 1, '权限描述');
INSERT INTO `pms_auth_rule` VALUES (11, 'System_AuthGroup.editGroup', '编辑用户组', 1, '', 7, 1, '权限描述');
INSERT INTO `pms_auth_rule` VALUES (12, 'System_AuthGroup.getFullGroupOne', '查看用户组信息', 1, '', 7, 1, '权限描述');
INSERT INTO `pms_auth_rule` VALUES (13, 'System_AuthGroup.getGroupAccess', '用户所在用户组', 1, '', 4, 1, '权限描述');
INSERT INTO `pms_auth_rule` VALUES (14, 'System_AuthGroup.assGroupAccess', '用户授权', 1, '', 4, 1, '权限描述');
INSERT INTO `pms_auth_rule` VALUES (15, 'User_User.changeState', '禁用/启用用户', 1, '', 4, 1, '权限描述');
INSERT INTO `pms_auth_rule` VALUES (16, 'User_User.getUser', '用户信息', 1, '', 4, 1, '权限描述');
INSERT INTO `pms_auth_rule` VALUES (17, 'System_AuthMenu.addMenu', '添加菜单', 1, '', 55, 1, '权限描述');
INSERT INTO `pms_auth_rule` VALUES (18, 'System_AuthMenu.delMenu', '删除菜单', 1, '', 55, 1, '权限描述');
INSERT INTO `pms_auth_rule` VALUES (19, 'System_AuthMenu.getMenu', '菜单信息', 1, '', 55, 1, '权限描述');
INSERT INTO `pms_auth_rule` VALUES (20, 'System_AuthMenu.editMenu', '编辑菜单', 1, '', 55, 1, '权限描述');
INSERT INTO `pms_auth_rule` VALUES (21, 'System_AuthRule.getAllList', '权限列表', 1, '', 7, 1, '权限描述');
INSERT INTO `pms_auth_rule` VALUES (22, 'System_AuthRule.addRule', '新增权限', 1, '', 7, 1, '权限描述');
INSERT INTO `pms_auth_rule` VALUES (23, 'System_AuthRule.delRule', '删除权限', 1, '', 7, 1, '权限描述');
INSERT INTO `pms_auth_rule` VALUES (24, 'System_AuthRule.getRule', '权限信息', 1, '', 7, 1, '权限描述');
INSERT INTO `pms_auth_rule` VALUES (25, 'System_AuthRule.editRule', '编辑权限', 1, '', 7, 1, '权限描述');
INSERT INTO `pms_auth_rule` VALUES (31, 'System_AuthGroup.delGroup', '删除用户组', 1, '', 7, 0, '删除用户组');
INSERT INTO `pms_auth_rule` VALUES (32, 'Log', '日志模块', 1, '', 0, 0, '日志模块');
INSERT INTO `pms_auth_rule` VALUES (33, 'System_Log.getList', '日志列表', 1, '', 32, 0, '获取日志列表');
INSERT INTO `pms_auth_rule` VALUES (34, 'UserSetting', '用户配置', 1, '', 0, 0, '用户配置');
INSERT INTO `pms_auth_rule` VALUES (35, 'User_UserSetting_Setting.getSetting', '获取配置信息', 1, '', 34, 0, '');
INSERT INTO `pms_auth_rule` VALUES (36, 'User_UserSetting_Setting.doSetting', '提交配置信息', 1, '', 34, 0, '');
INSERT INTO `pms_auth_rule` VALUES (37, 'System_AuthGroup.getGroupUserList', '用户组用户', 1, '', 7, 0, '查看用户组用户列表');
INSERT INTO `pms_auth_rule` VALUES (38, 'System_AuthGroup.removeGroupUser', '移除用户', 1, '', 7, 0, '移除用户组用户');
INSERT INTO `pms_auth_rule` VALUES (39, 'System_MenuModel.getList', '菜单模块列表', 1, '', 55, 0, '获取菜单模块列表');
INSERT INTO `pms_auth_rule` VALUES (40, 'System_MenuModel.addModel', '新增菜单模块', 1, '', 55, 0, '新增菜单模块');
INSERT INTO `pms_auth_rule` VALUES (41, 'System_MenuModel.delModel', '删除菜单模块', 1, '', 55, 0, '删除菜单模块');
INSERT INTO `pms_auth_rule` VALUES (42, 'System_MenuModel.editModel', '编辑菜单模块', 1, '', 55, 0, '编辑菜单模块');
INSERT INTO `pms_auth_rule` VALUES (43, 'System_MenuModel.getModel', '菜单模块信息', 1, '', 55, 0, '获取菜单模块信息');
INSERT INTO `pms_auth_rule` VALUES (44, 'System_MenuModel.getAllList', '所有菜单模块', 1, '', 55, 0, '获取所有菜单模块，不分页');
INSERT INTO `pms_auth_rule` VALUES (45, 'User_User.uploadAvatarImg', '上传头像', 1, '', 4, 0, '上传用户头像');
INSERT INTO `pms_auth_rule` VALUES (46, 'User_User.changePassword', '修改密码', 1, '', 4, 0, '修改用户密码');
INSERT INTO `pms_auth_rule` VALUES (47, 'SystemSetting', '系统配置', 1, '', 0, 0, '系统配置');
INSERT INTO `pms_auth_rule` VALUES (48, 'System_Setting.getSetting', '获取配置信息', 1, '', 47, 0, '获取配置信息');
INSERT INTO `pms_auth_rule` VALUES (49, 'System_Setting.doSetting', '保存配置', 1, '', 47, 0, '保存配置');
INSERT INTO `pms_auth_rule` VALUES (50, 'Project', '项目管理', 1, '', 0, 0, '项目管理');
INSERT INTO `pms_auth_rule` VALUES (51, 'Project_Level.getList', '项目评级列表', 1, '', 50, 0, '获取项目评级列表');
INSERT INTO `pms_auth_rule` VALUES (52, 'Project_Level.addLevel', '新增等级', 1, '', 50, 0, '新增等级');
INSERT INTO `pms_auth_rule` VALUES (53, 'Project_Level.editLevel', '编辑等级', 1, '', 50, 0, '编辑等级');
INSERT INTO `pms_auth_rule` VALUES (54, 'Project_Level.delLevel', '删除等级', 1, '', 50, 0, '删除等级');
INSERT INTO `pms_auth_rule` VALUES (55, 'Menu', '菜单模块', 1, '', 0, 0, '菜单模块');
INSERT INTO `pms_auth_rule` VALUES (56, 'Project_Level.getInfo', '等级信息', 1, '', 50, 0, '获取等级信息');
INSERT INTO `pms_auth_rule` VALUES (57, 'Team', '团队管理', 1, '', 0, 0, '团队管理');
INSERT INTO `pms_auth_rule` VALUES (58, 'Team_Team.getList', '团队列表', 1, '', 57, 0, '获取');
INSERT INTO `pms_auth_rule` VALUES (59, 'Team_Team.changeState', '更改状态', 1, '', 57, 0, '更改团队状态');
INSERT INTO `pms_auth_rule` VALUES (60, 'Team_Team.addTeam', '新增团队', 1, '', 57, 0, '新增团队');
INSERT INTO `pms_auth_rule` VALUES (61, 'Team_Team.delTeam', '删除团队', 1, '', 57, 0, '删除团队');
INSERT INTO `pms_auth_rule` VALUES (62, 'Team_Team.editTeam', '保存团队信息', 1, '', 57, 0, '保存团队信息');
INSERT INTO `pms_auth_rule` VALUES (63, 'Team_Team.getInfo', '团队信息', 1, '', 57, 0, '获取团队信息');
INSERT INTO `pms_auth_rule` VALUES (64, 'TeamUser', '团队成员', 1, '', 0, 0, '团队成员');
INSERT INTO `pms_auth_rule` VALUES (65, 'Team_Team.getNoInTeamUser', '团队以外成员', 1, '', 64, 0, '获取团队以外成员');
INSERT INTO `pms_auth_rule` VALUES (66, 'Team_Team.addTeamUser', '添加成员至团队', 1, '', 64, 0, '添加成员至团队');
INSERT INTO `pms_auth_rule` VALUES (67, 'Team_Team.getTeamUser', '团队成员列表', 1, '', 64, 0, '获取本团队成员列表');
INSERT INTO `pms_auth_rule` VALUES (68, 'Team_Team.editLeader', '编辑团队负责人', 1, '', 57, 0, '编辑团队负责人');
INSERT INTO `pms_auth_rule` VALUES (69, 'Team_User.delTeamUser', '移除团队成员', 1, '', 64, 0, '移除团队成员');
INSERT INTO `pms_auth_rule` VALUES (70, 'UserLevel', '用户等级', 1, '', 0, 0, '用户等级');
INSERT INTO `pms_auth_rule` VALUES (71, 'User_Level.getInfo', '用户等级信息', 1, '', 70, 0, '获取用户等级信息');
INSERT INTO `pms_auth_rule` VALUES (72, 'User_Level.getList', '用户等级列表', 1, '', 70, 0, '获取用户等级列表');
INSERT INTO `pms_auth_rule` VALUES (73, 'User_Level.editLevel', '编辑用户等级', 1, '', 70, 0, '编辑用户等级');
INSERT INTO `pms_auth_rule` VALUES (74, 'User_Level.addLevel', '新增用户等级', 1, '', 70, 0, '新增用户等级');
INSERT INTO `pms_auth_rule` VALUES (75, 'User_Level.delLevel', '删除用户等级', 1, '', 70, 0, '删除用户等级');
INSERT INTO `pms_auth_rule` VALUES (76, 'UserPosition', '用户职位', 1, '', 0, 0, '用户职位');
INSERT INTO `pms_auth_rule` VALUES (77, 'User_Position.getInfo', '用户职位信息', 1, '', 76, 0, '获取用户职位信息');
INSERT INTO `pms_auth_rule` VALUES (78, 'User_Position.getList', '用户职位列表', 1, '', 76, 0, '获取用户职位列表');
INSERT INTO `pms_auth_rule` VALUES (80, 'User_Position.addPosition', '新增用户职位', 1, '', 76, 0, '新增用户职位');
INSERT INTO `pms_auth_rule` VALUES (81, 'User_Position.delPosition', '删除用户职位', 1, '', 76, 0, '删除用户职位');
INSERT INTO `pms_auth_rule` VALUES (79, 'User_Position.editPosition', '编辑用用户职位', 1, '', 76, 0, '编辑用户职位');
INSERT INTO `pms_auth_rule` VALUES (82, 'User_Position.getUserList', '职位用户列表', 1, '', 76, 0, '获取对应职位的用户列表');
INSERT INTO `pms_auth_rule` VALUES (83, 'User_Level.getUserList', '等级用户列表', 1, '', 76, 0, '获取对应等级的用户列表');
INSERT INTO `pms_auth_rule` VALUES (84, 'Project_Project.getList', '项目列表', 1, '', 50, 0, '获取项目列表');
INSERT INTO `pms_auth_rule` VALUES (85, 'Project_Project.getListForUser', '用户项目', 1, '', 50, 0, '获取对应用户的项目列表');
INSERT INTO `pms_auth_rule` VALUES (86, 'Project_Project.selectProjectUser', '选择项目成员', 1, '', 50, 0, '选择项目成员');
INSERT INTO `pms_auth_rule` VALUES (87, 'Project_Project.addProjectUser', '添加项目成员', 1, '', 50, 0, '添加项目成员');
INSERT INTO `pms_auth_rule` VALUES (88, 'Project_Project.addProject', '添加项目', 1, '', 50, 0, '添加项目');
INSERT INTO `pms_auth_rule` VALUES (89, 'Project_Project.editProject', '编辑项目', 1, '', 50, 0, '编辑项目');
INSERT INTO `pms_auth_rule` VALUES (90, 'Project_Project.delProject', '删除项目', 1, '', 50, 0, '删除项目');
INSERT INTO `pms_auth_rule` VALUES (91, 'Project_Project.getInfo', '项目信息', 1, '', 50, 0, '获取项目信息');
INSERT INTO `pms_auth_rule` VALUES (92, 'Project_Task.addTask', '添加任务', 1, '', 50, 0, '添加任务');
INSERT INTO `pms_auth_rule` VALUES (93, 'Project_Task.editTask', '编辑任务', 1, '', 50, 0, '编辑任务');
INSERT INTO `pms_auth_rule` VALUES (94, 'Project_Task.delTask', '删除任务', 1, '', 50, 0, '删除任务');
INSERT INTO `pms_auth_rule` VALUES (95, 'Project_Task.getInfo', '任务信息', 1, '', 50, 0, '获取任务信息');
INSERT INTO `pms_auth_rule` VALUES (96, 'Project_Task.getList', '任务列表', 1, '', 50, 0, '获取任务列表');
INSERT INTO `pms_auth_rule` VALUES (97, 'Project_Task.getTaskTypeList', '任务类型', 1, '', 50, 0, '获取任务类型');
INSERT INTO `pms_auth_rule` VALUES (98, 'Project_Task.setTaskState', '标记任务状态', 1, '', 50, 0, '标记任务状态');
INSERT INTO `pms_auth_rule` VALUES (99, 'Project_Task.getTaskLog', '任务日志', 1, '', 50, 0, '获取任务日志');
INSERT INTO `pms_auth_rule` VALUES (100, 'Project_Task.getTaskUserList', '项目成员', 1, '', 50, 0, '获取项目成员');
INSERT INTO `pms_auth_rule` VALUES (101, 'Project_Task.uploadTaskFile', '关联任务文件', 1, '', 50, 0, '关联任务文件');
INSERT INTO `pms_auth_rule` VALUES (102, 'Project_Task.getTaskFileList', '任务文件列表', 1, '', 50, 0, '获取任务文件列表');
INSERT INTO `pms_auth_rule` VALUES (103, 'Project_Task.delTaskFile', '删除任务文件', 1, '', 50, 0, '删除任务文件');
INSERT INTO `pms_auth_rule` VALUES (104, 'Project_Task.downloadTaskFile', '下载任务文件', 1, '', 50, 0, '下载任务文件');
INSERT INTO `pms_auth_rule` VALUES (105, 'Project_Task.uploadContentImg', '上传备注图片', 1, '', 50, 0, '上传备注图片');
INSERT INTO `pms_auth_rule` VALUES (106, 'Project_Project.getProjectUserList', '项目成员列表', 1, '', 50, 0, '获取项目成员列表');
INSERT INTO `pms_auth_rule` VALUES (107, 'Project_Task.addTaskUser', '添加任务成员', 1, '', 50, 0, '添加任务成员');
INSERT INTO `pms_auth_rule` VALUES (108, 'Project_Task.addTaskExecutorUser', '指派任务', 1, '', 50, 0, '指派任务');
INSERT INTO `pms_auth_rule` VALUES (109, 'Project_Task.getTaskLevelList', '任务优先级', 1, '', 50, 0, '获取任务优先级');
INSERT INTO `pms_auth_rule` VALUES (110, 'Project_Project.getProjectFileList', '项目文件库', 1, '', 50, 0, '目文件库');
INSERT INTO `pms_auth_rule` VALUES (111, 'Project_Project.batchDownloadTaskFile', '批量下载文件', 1, '', 50, 0, '批量下载文件');
INSERT INTO `pms_auth_rule` VALUES (112, 'project_Task.getTaskForUser', '成员任务', 1, '', 50, 0, '获取成员任务列表');
INSERT INTO `pms_auth_rule` VALUES (113, 'Project_Project.getProjectLogList', '项目日志', 1, '', 50, 0, '获取项目日志');
INSERT INTO `pms_auth_rule` VALUES (114, 'Project_Task.getTaskTagList', '任务标签', 1, '', 50, 0, '获取任务标签列表');
INSERT INTO `pms_auth_rule` VALUES (115, 'Project_Project.delProjectUser', '移出项目成员', 1, '', 50, 0, '移出项目成员');
INSERT INTO `pms_auth_rule` VALUES (116, 'Project_Task.getTaskExecuteStateList', '任务执行状态', 1, '', 50, 0, '获取任务执行状态');
INSERT INTO `pms_auth_rule` VALUES (117, 'Project_Project.getProjectStateList', '项目状态列表', 1, '', 50, 0, '获取项目状态列表');
INSERT INTO `pms_auth_rule` VALUES (120, 'Common_Notify.getListForUser', '用户通知列表', 1, '', 119, 0, '获取用户通知列表');
INSERT INTO `pms_auth_rule` VALUES (119, 'Common', '公共模块', 1, '', 0, 0, '公共模块');
INSERT INTO `pms_auth_rule` VALUES (121, 'Project_Task.getListOverview', '所有任务概况', 1, '', 50, 0, '获取所有任务概况');
INSERT INTO `pms_auth_rule` VALUES (122, 'Project_Task.getTeamTaskLog', '团队任务动态', 1, '', 50, 0, '获取团队任务动态');
INSERT INTO `pms_auth_rule` VALUES (123, 'Project_Project.exportTeamTimeProjectReport', '导出团队项目周报', 1, '', 50, 0, '导出团队项目周报');
INSERT INTO `pms_auth_rule` VALUES (124, 'Project_Task.getTaskStatisticsByTeam', '团队任务统计', 1, '', 50, 0, '获取团队任务统计');
INSERT INTO `pms_auth_rule` VALUES (125, 'Project_Project.getProjectBuildList', '项目版本列表', 1, '', 50, 0, '获取项目版本列表');
INSERT INTO `pms_auth_rule` VALUES (126, 'Project_Project.addProjectBuild', '发布版本', 1, '', 50, 0, '发布版本');
INSERT INTO `pms_auth_rule` VALUES (127, 'Project_Project.getBuildInfo', '版本信息', 1, '', 50, 0, '获取版本信息');
INSERT INTO `pms_auth_rule` VALUES (128, 'Project_Project.deleteProjectBuild', '删除版本', 1, '', 50, 0, '删除版本');
INSERT INTO `pms_auth_rule` VALUES (129, 'Project_Task.getTaskStatisticsByAll', '任务统计', 1, '', 50, 0, '任务统计');
INSERT INTO `pms_auth_rule` VALUES (130, 'Project_Project.getProjectStatisticsByAll', '项目统计', 1, '', 50, 0, '项目统计');
INSERT INTO `pms_auth_rule` VALUES (131, 'Project_Task.delTypeTask', '删除类型任务', 1, '', 50, 0, '删除类型任务');
INSERT INTO `pms_auth_rule` VALUES (132, 'Project_Task.setTypeTaskEndTime', '设置类型任务截止时间', 1, '', 50, 0, '设置类型任务截止时间');
INSERT INTO `pms_auth_rule` VALUES (133, 'Project_Task.setTypeTaskExecutor', '设置类型任务执行者', 1, '', 50, 0, '设置类型任务执行者');
INSERT INTO `pms_auth_rule` VALUES (137, 'Project_TaskType.getList', '任务类型列表', 1, '', 50, 0, '获取任务类型列表');
INSERT INTO `pms_auth_rule` VALUES (136, 'Project_TaskType.delTaskType', '删除任务类型', 1, '', 50, 0, '删除任务类型');
INSERT INTO `pms_auth_rule` VALUES (135, 'Project_TaskType.editTaskType', '编辑任务类型', 1, '', 50, 0, '编辑任务类型');
INSERT INTO `pms_auth_rule` VALUES (134, 'Project_TaskType.addTaskType', '添加任务类型', 1, '', 50, 0, '添加任务类型');
INSERT INTO `pms_auth_rule` VALUES (138, 'Project_ProjectType.getList', '项目类型列表', 1, '', 50, 0, '获取项目类型列表');
INSERT INTO `pms_auth_rule` VALUES (141, 'Project_ProjectType.addProjectType', '添加项目类型', 1, '', 50, 0, '添加项目类型');
INSERT INTO `pms_auth_rule` VALUES (140, 'Project_ProjectType.editProjectType', '编辑项目类型', 1, '', 50, 0, '编项目类型');
INSERT INTO `pms_auth_rule` VALUES (139, 'Project_ProjectType.delProjectType', '删项目类型', 1, '', 50, 0, '删除项目类型');
INSERT INTO `pms_auth_rule` VALUES (142, 'Project_ProjectType.getInfo', '项目类型信息', 1, '', 50, 0, '项目类型信息');
INSERT INTO `pms_auth_rule` VALUES (143, 'Project_TaskType.getInfo', '任务类型信息', 1, '', 50, 0, '任务类型信息');
INSERT INTO `pms_auth_rule` VALUES (144, 'Project_TaskTypeTemplate.getList', '任务类型模板列表', 1, '', 50, 0, '获取任务类型模板列表');
INSERT INTO `pms_auth_rule` VALUES (145, 'Project_TaskTypeTemplate.addTaskTypeTemplate', '添加任务类型模板', 1, '', 50, 0, '添加任务类型模板');
INSERT INTO `pms_auth_rule` VALUES (146, 'Project_TaskTypeTemplate.editTaskTypeTemplate', '编辑任务类型模板', 1, '', 50, 0, '编项目类型');
INSERT INTO `pms_auth_rule` VALUES (147, 'Project_TaskTypeTemplate.delTaskTypeTemplate', '删除任务类型模板', 1, '', 50, 0, '删除项目类型');
INSERT INTO `pms_auth_rule` VALUES (148, 'Project_TaskTypeTemplate.getInfo', '任务类型模板信息', 1, '', 50, 0, '任务类型模板信息');
INSERT INTO `pms_auth_rule` VALUES (149, 'Project_Task.exchangeTaskSort', '任务排序', 1, '', 50, 0, '任务排序');
INSERT INTO `pms_auth_rule` VALUES (150, 'Project_TaskType.exchangeTaskTypeSort', '任务类型排序', 1, '', 50, 0, '任务类型排序');
INSERT INTO `pms_auth_rule` VALUES (151, 'Project_Task.addTaskComment', '添加任务评论', 1, '', 50, 0, '添加任务评论');
INSERT INTO `pms_auth_rule` VALUES (152, 'Project_Task.editTaskComment', '编辑任务评论', 1, '', 50, 0, '编辑任务评论');
INSERT INTO `pms_auth_rule` VALUES (153, 'Project_Task.delTaskComment', '删除任务评论', 1, '', 50, 0, '删除任务评论');

-- ----------------------------
-- Table structure for pms_build
-- ----------------------------
DROP TABLE IF EXISTS `pms_build`;
CREATE TABLE `pms_build`  (
  `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT,
  `product` mediumint(8) UNSIGNED NOT NULL DEFAULT 0,
  `branch` mediumint(8) UNSIGNED NOT NULL DEFAULT 0,
  `project` mediumint(8) UNSIGNED NOT NULL DEFAULT 0,
  `name` char(150) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `scmPath` char(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `filePath` char(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `date` date NOT NULL,
  `stories` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `bugs` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `builder` char(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `desc` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `deleted` enum('0','1') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `build`(`product`, `project`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 75 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '版本表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of pms_build
-- ----------------------------
INSERT INTO `pms_build` VALUES (73, 0, 0, 1292, '2.13.0 King of Opera', '', '', '2018-04-30', '', '', 'admin', '<ul style=\"-webkit-tap-highlight-color: transparent; padding-left: 40px; list-style-type: circle; color: rgb(73, 80, 96); font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;\\\\5FAE软雅黑&quot;, Arial, sans-serif;\"><li style=\"-webkit-tap-highlight-color: transparent; margin-bottom: 5px; font-size: 14px;\">Table 列新增属性&nbsp;<code style=\"-webkit-tap-highlight-color: transparent; display: inline-block; background: rgb(247, 247, 247); margin-top: 8px; margin-bottom: 10px; padding: 1px 5px; border-radius: 3px; color: rgb(102, 102, 102); border: 1px solid rgb(238, 238, 238);\">minWidth</code>&nbsp;和&nbsp;<code style=\"-webkit-tap-highlight-color: transparent; display: inline-block; background: rgb(247, 247, 247); margin-top: 8px; margin-bottom: 10px; padding: 1px 5px; border-radius: 3px; color: rgb(102, 102, 102); border: 1px solid rgb(238, 238, 238);\">maxWidth</code>。<a href=\"https://github.com/iview/iview/issues/3284\" target=\"_blank\" style=\"-webkit-tap-highlight-color: transparent; background-position: 0px 0px; outline-style: initial; outline-width: 0px;\">#3284</a></li><li style=\"-webkit-tap-highlight-color: transparent; margin-bottom: 5px; font-size: 14px;\">DatePicker 的&nbsp;<code style=\"-webkit-tap-highlight-color: transparent; display: inline-block; background: rgb(247, 247, 247); margin-top: 8px; margin-bottom: 10px; padding: 1px 5px; border-radius: 3px; color: rgb(102, 102, 102); border: 1px solid rgb(238, 238, 238);\">disabledDate</code>&nbsp;功能，现在也能限制时、分、秒了。<a href=\"https://github.com/iview/iview/issues/3246\" target=\"_blank\" style=\"-webkit-tap-highlight-color: transparent; background-position: 0px 0px; outline-style: initial; outline-width: 0px;\">#3246</a></li><li style=\"-webkit-tap-highlight-color: transparent; margin-bottom: 5px; font-size: 14px;\">优化 Table 筛选样式。<a href=\"https://github.com/iview/iview/issues/3206\" target=\"_blank\" style=\"-webkit-tap-highlight-color: transparent; background-position: 0px 0px; outline-style: initial; outline-width: 0px;\">#3206</a></li><li style=\"-webkit-tap-highlight-color: transparent; margin-bottom: 5px; font-size: 14px;\">修复 Table 在多级表头里使用过滤和排序的 bug。<a href=\"https://github.com/iview/iview/issues/3339\" target=\"_blank\" style=\"-webkit-tap-highlight-color: transparent; background-position: 0px 0px; outline-style: initial; outline-width: 0px;\">#3339</a></li><li style=\"-webkit-tap-highlight-color: transparent; margin-bottom: 5px; font-size: 14px;\">修复 Table 在 2.12.0 版本，设置&nbsp;<code style=\"-webkit-tap-highlight-color: transparent; display: inline-block; background: rgb(247, 247, 247); margin-top: 8px; margin-bottom: 10px; padding: 1px 5px; border-radius: 3px; color: rgb(102, 102, 102); border: 1px solid rgb(238, 238, 238);\">show-header=\"false\"</code>&nbsp;报错的 bug。</li><li style=\"-webkit-tap-highlight-color: transparent; margin-bottom: 5px; font-size: 14px;\">修复 Poptip 和 Tooltip 有时方向识别错误的 bug，并支持自定义 popper.js 的 options 选项。</li><li style=\"-webkit-tap-highlight-color: transparent; margin-bottom: 5px; font-size: 14px;\">修复 DatePicker 在 daterange 模式下，选择年、月后显示值不正确的 bug。<a href=\"https://github.com/iview/iview/issues/3345\" target=\"_blank\" style=\"-webkit-tap-highlight-color: transparent; background-position: 0px 0px; outline-style: initial; outline-width: 0px;\">#3345</a></li><li style=\"-webkit-tap-highlight-color: transparent; margin-bottom: 5px; font-size: 14px;\">修复 DatePicker 在 Safari 浏览器下&nbsp;<code style=\"-webkit-tap-highlight-color: transparent; display: inline-block; background: rgb(247, 247, 247); margin-top: 8px; margin-bottom: 10px; padding: 1px 5px; border-radius: 3px; color: rgb(102, 102, 102); border: 1px solid rgb(238, 238, 238);\">on-change</code>&nbsp;事件返回值有时不正确的 bug。<a href=\"https://github.com/iview/iview/issues/3232\" target=\"_blank\" style=\"-webkit-tap-highlight-color: transparent; background-position: 0px 0px; outline-style: initial; outline-width: 0px;\">#3232</a></li><li style=\"-webkit-tap-highlight-color: transparent; margin-bottom: 5px; font-size: 14px;\">修复 DatePicker 的&nbsp;<code style=\"-webkit-tap-highlight-color: transparent; display: inline-block; background: rgb(247, 247, 247); margin-top: 8px; margin-bottom: 10px; padding: 1px 5px; border-radius: 3px; color: rgb(102, 102, 102); border: 1px solid rgb(238, 238, 238);\">show-week-numbers</code>&nbsp;无法动态设置的 bug。<a href=\"https://github.com/iview/iview/issues/3277\" target=\"_blank\" style=\"-webkit-tap-highlight-color: transparent; background-position: 0px 0px; outline-style: initial; outline-width: 0px;\">#3277</a></li></ul>', '0');
INSERT INTO `pms_build` VALUES (74, 0, 0, 1292, '2.13.1', '', '', '2018-04-30', '', '', 'admin', '<ul style=\"-webkit-tap-highlight-color: transparent; padding-left: 40px; list-style-type: circle; color: rgb(73, 80, 96); font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;\\\\5FAE软雅黑&quot;, Arial, sans-serif;\"><li style=\"-webkit-tap-highlight-color: transparent; margin-bottom: 5px; font-size: 14px;\">Tag 新增属性&nbsp;<code style=\"-webkit-tap-highlight-color: transparent; display: inline-block; background: rgb(247, 247, 247); margin-top: 8px; margin-bottom: 10px; padding: 1px 5px; border-radius: 3px; color: rgb(102, 102, 102); border: 1px solid rgb(238, 238, 238);\">fade</code>。</li><li style=\"-webkit-tap-highlight-color: transparent; margin-bottom: 5px; font-size: 14px;\">InputNumber 新增属性&nbsp;<code style=\"-webkit-tap-highlight-color: transparent; display: inline-block; background: rgb(247, 247, 247); margin-top: 8px; margin-bottom: 10px; padding: 1px 5px; border-radius: 3px; color: rgb(102, 102, 102); border: 1px solid rgb(238, 238, 238);\">placeholder</code>。<a href=\"https://github.com/iview/iview/issues/3424\" target=\"_blank\" style=\"-webkit-tap-highlight-color: transparent; background-position: 0px 0px; outline-style: initial; outline-width: 0px;\">#3424</a></li><li style=\"-webkit-tap-highlight-color: transparent; margin-bottom: 5px; font-size: 14px;\">InputNumber 的事件&nbsp;<code style=\"-webkit-tap-highlight-color: transparent; display: inline-block; background: rgb(247, 247, 247); margin-top: 8px; margin-bottom: 10px; padding: 1px 5px; border-radius: 3px; color: rgb(102, 102, 102); border: 1px solid rgb(238, 238, 238);\">on-focus</code>&nbsp;增加返回值 event。<a href=\"https://github.com/iview/iview/issues/3395\" target=\"_blank\" style=\"-webkit-tap-highlight-color: transparent; background-position: 0px 0px; outline-style: initial; outline-width: 0px;\">#3395</a></li><li style=\"-webkit-tap-highlight-color: transparent; margin-bottom: 5px; font-size: 14px;\">DatePicker 的事件&nbsp;<code style=\"-webkit-tap-highlight-color: transparent; display: inline-block; background: rgb(247, 247, 247); margin-top: 8px; margin-bottom: 10px; padding: 1px 5px; border-radius: 3px; color: rgb(102, 102, 102); border: 1px solid rgb(238, 238, 238);\">on-change</code>&nbsp;增加返回值 type。<a href=\"https://github.com/iview/iview/issues/3353\" target=\"_blank\" style=\"-webkit-tap-highlight-color: transparent; background-position: 0px 0px; outline-style: initial; outline-width: 0px;\">#3353</a></li><li style=\"-webkit-tap-highlight-color: transparent; margin-bottom: 5px; font-size: 14px;\">优化 popper.js 的配置及 dropdown 的展开动画。<a href=\"https://github.com/iview/iview/issues/3354\" target=\"_blank\" style=\"-webkit-tap-highlight-color: transparent; background-position: 0px 0px; outline-style: initial; outline-width: 0px;\">#3354</a></li><li style=\"-webkit-tap-highlight-color: transparent; margin-bottom: 5px; font-size: 14px;\">修复 Table 在动态调整页面宽度，有时滚动条显示错误的 bug。<a href=\"https://github.com/iview/iview/issues/3358\" target=\"_blank\" style=\"-webkit-tap-highlight-color: transparent; background-position: 0px 0px; outline-style: initial; outline-width: 0px;\">#3358</a></li><li style=\"-webkit-tap-highlight-color: transparent; margin-bottom: 5px; font-size: 14px;\">修复 Poptip / Tooltip 动态修改内容后，位置计算不准确的 bug。<a href=\"https://github.com/iview/iview/issues/3412\" target=\"_blank\" style=\"-webkit-tap-highlight-color: transparent; background-position: 0px 0px; outline-style: initial; outline-width: 0px;\">#3412</a></li><li style=\"-webkit-tap-highlight-color: transparent; margin-bottom: 5px; font-size: 14px;\">修复在 Form 内使用 Carousel 时，点击按钮会跳转的问题。<a href=\"https://github.com/iview/iview/issues/3426\" target=\"_blank\" style=\"-webkit-tap-highlight-color: transparent; background-position: 0px 0px; outline-style: initial; outline-width: 0px;\">#3426</a></li></ul>', '0');

-- ----------------------------
-- Table structure for pms_company_team
-- ----------------------------
DROP TABLE IF EXISTS `pms_company_team`;
CREATE TABLE `pms_company_team`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `leader_id` int(11) NULL DEFAULT 0 COMMENT '主要领导',
  `team_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '团队名称',
  `state` tinyint(1) NULL DEFAULT 1,
  `pid` int(11) NULL DEFAULT 0 COMMENT '上级团队',
  `create_time` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 19 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '团队表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of pms_company_team
-- ----------------------------
INSERT INTO `pms_company_team` VALUES (16, 119, '技术部', 1, 0, '2018-01-18 15:16:34');
INSERT INTO `pms_company_team` VALUES (17, 0, '开发三部', 1, 16, '2018-01-18 15:16:49');
INSERT INTO `pms_company_team` VALUES (18, 0, '111', 1, 17, '2018-01-23 14:35:01');

-- ----------------------------
-- Table structure for pms_file
-- ----------------------------
DROP TABLE IF EXISTS `pms_file`;
CREATE TABLE `pms_file`  (
  `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT,
  `pathname` char(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `title` char(90) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `extension` char(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `size` mediumint(8) UNSIGNED NOT NULL DEFAULT 0,
  `objectType` char(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `objectID` mediumint(9) NOT NULL,
  `addedBy` char(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `addedDate` datetime(0) NOT NULL,
  `downloads` mediumint(8) UNSIGNED NOT NULL DEFAULT 0,
  `extra` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `deleted` enum('0','1') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0',
  `file_url` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `from_new_system` tinyint(1) NULL DEFAULT 0,
  `file_type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `file`(`objectType`, `objectID`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 7223 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '文件表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of pms_file
-- ----------------------------
INSERT INTO `pms_file` VALUES (7222, '05784446306060183.jpg', 'qrcode_for_gh_8d9398505b59_344.jpg', 'jpg', 9149, 'task', 12162, 'admin', '2018-04-30 23:03:50', 0, '', '0', 'http://127.0.0.1/ApiForProjectManage/public/upload/file/project/1292/12162/05784446306060183.jpg', 1, 'image/jpeg');

-- ----------------------------
-- Table structure for pms_lock
-- ----------------------------
DROP TABLE IF EXISTS `pms_lock`;
CREATE TABLE `pms_lock`  (
  `pid` bigint(20) UNSIGNED NOT NULL COMMENT 'IP+TYPE',
  `pvalue` tinyint(3) UNSIGNED NOT NULL DEFAULT 1 COMMENT '次数',
  `expiretime` int(11) NOT NULL DEFAULT 0 COMMENT '锁定截止时间',
  PRIMARY KEY (`pid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '防灌水表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of pms_lock
-- ----------------------------
INSERT INTO `pms_lock` VALUES (21307064333, 2, 1475226020);

-- ----------------------------
-- Table structure for pms_mailqueue
-- ----------------------------
DROP TABLE IF EXISTS `pms_mailqueue`;
CREATE TABLE `pms_mailqueue`  (
  `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT,
  `toList` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `ccList` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `subject` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `body` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `addedBy` char(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `addedDate` datetime(0) NOT NULL,
  `sendTime` datetime(0) NOT NULL,
  `status` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'wait',
  `failReason` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `sendTime`(`sendTime`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 31858 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '邮件队列' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for pms_menu
-- ----------------------------
DROP TABLE IF EXISTS `pms_menu`;
CREATE TABLE `pms_menu`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '菜单标识',
  `path` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '路径',
  `model` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '模块名称',
  `menu_type` tinyint(1) NULL DEFAULT 0 COMMENT '菜单类型',
  `pid` int(11) NULL DEFAULT 0 COMMENT '上级菜单',
  `status` tinyint(1) NULL DEFAULT 1 COMMENT '启用',
  `icon` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图标',
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '菜单名称',
  `add_condition` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '规则',
  `sort` int(3) NULL DEFAULT 0 COMMENT '排序',
  `layout` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '位置',
  `menu_desc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '描述',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 53 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '菜单表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of pms_menu
-- ----------------------------
INSERT INTO `pms_menu` VALUES (1, 'user/profile', '', 'Project', 0, 0, 1, 'person', '用户概况', NULL, 93, 'slide', '菜单');
INSERT INTO `pms_menu` VALUES (3, 'user/list', 'user/list', 'Project', 0, 1, 1, 'ios-people', '用户列表', NULL, 2, 'slide', '菜单');
INSERT INTO `pms_menu` VALUES (8, 'system/auth', '', 'Project', 0, 0, 1, 'settings', '权限配置', NULL, 91, 'slide', '菜单');
INSERT INTO `pms_menu` VALUES (9, 'system/auth_group/list', 'system/auth_group/list', 'Project', 0, 8, 1, 'ios-people', '用户组列表', NULL, 2, 'slide', '菜单');
INSERT INTO `pms_menu` VALUES (10, 'system/auth_menu/list', 'system/auth_menu/list', 'Project', 0, 8, 1, 'ios-list-outline', '菜单列表', NULL, 1, 'slide', '菜单');
INSERT INTO `pms_menu` VALUES (11, 'system/auth_rule/list', 'system/auth_rule/list', 'Project', 0, 8, 1, 'ios-browsers-outline', '权限列表', NULL, 0, '', '菜单');
INSERT INTO `pms_menu` VALUES (19, 'system/log', '', 'Project', 0, 0, 1, 'ios-list-outline', '系统日志', NULL, 92, '', '系统日志');
INSERT INTO `pms_menu` VALUES (20, 'system/log/list', 'system/log/list', 'Project', 0, 19, 1, 'paperclip', '操作日志', NULL, 0, '', '日志列表');
INSERT INTO `pms_menu` VALUES (21, 'user/setting', '', 'Project', 0, 0, 1, 'gear-a', '用户配置', NULL, 90, '', '用户配置');
INSERT INTO `pms_menu` VALUES (22, 'user/base_setting', 'user/base_setting', 'Project', 0, 21, 1, 'gear-b', '基本配置', NULL, 0, '', '');
INSERT INTO `pms_menu` VALUES (23, 'user/register_setting', 'user/register_setting', 'Project', 0, 21, 1, 'android-options', '注册配置', NULL, 0, '', '');
INSERT INTO `pms_menu` VALUES (24, 'menu_model', 'system/menu_model/list', 'Project', 0, 8, 1, 'grid', '菜单模块', NULL, 2, '', '菜单模块');
INSERT INTO `pms_menu` VALUES (28, 'SystemSetting', '', 'Project', 0, 0, 1, 'wrench', '系统配置', NULL, 89, '', '系统配置');
INSERT INTO `pms_menu` VALUES (29, 'system/setting_base', 'system/setting_base', 'Project', 0, 28, 1, 'gear-b', '基础配置', NULL, 0, '', '基础设置');
INSERT INTO `pms_menu` VALUES (30, 'project', '', 'Project', 0, 0, 1, 'code-working', '项目', NULL, 100, '', '');
INSERT INTO `pms_menu` VALUES (31, 'myproject/list', 'project/my_project/list', 'Project', 0, 30, 1, 'ios-list-outline', '我的项目', NULL, 2, '', '');
INSERT INTO `pms_menu` VALUES (32, 'ProjectLevel', '', 'Project', 0, 0, 1, 'flag', '项目评级', NULL, 94, '', '项目评级');
INSERT INTO `pms_menu` VALUES (33, 'projectList', 'project/level/list', 'Project', 0, 32, 1, 'wand', '等级列表', NULL, 0, '', '');
INSERT INTO `pms_menu` VALUES (35, 'TeamManage', '', 'Project', 0, 0, 1, 'person-stalker', '团队', NULL, 98, '', '');
INSERT INTO `pms_menu` VALUES (36, 'TeamList', 'team/list', 'Project', 0, 35, 1, 'android-person', '团队列表', NULL, 0, '', '');
INSERT INTO `pms_menu` VALUES (37, 'TeamUser', '', 'Project', 0, 0, 0, '', '成员', NULL, 95, '', '');
INSERT INTO `pms_menu` VALUES (38, 'TeamUserAll', 'team/user/list_all', 'Project', 0, 37, 0, 'ios-person', '所有成员', NULL, 0, '', '');
INSERT INTO `pms_menu` VALUES (39, 'TeamUserNew', 'team/user/list_new', 'Project', 0, 37, 0, 'person-add', '新加入的成员', NULL, 0, '', '');
INSERT INTO `pms_menu` VALUES (40, 'TeamUserNoAssigned', 'team/user/list_noass', 'Project', 0, 37, 0, 'ios-body', '未分配团队成员', NULL, 0, '', '');
INSERT INTO `pms_menu` VALUES (41, 'TeamUserLeave', 'team/user/list_leave', 'Project', 0, 37, 0, 'ios-person', '已停用的成员', NULL, 0, '', '');
INSERT INTO `pms_menu` VALUES (42, 'UserLevel', '', 'Project', 0, 0, 1, 'wand', '职称', NULL, 96, '', '');
INSERT INTO `pms_menu` VALUES (43, 'levelList', 'team/user/level/list', 'Project', 0, 42, 1, 'wand', '等级列表', NULL, 0, '', '');
INSERT INTO `pms_menu` VALUES (44, 'UserPosition', '', 'Project', 0, 0, 1, 'ribbon-b', '职位', '', 97, '', '');
INSERT INTO `pms_menu` VALUES (45, 'positionList', 'team/user/position/list', 'Project', 0, 44, 1, 'ribbon-b', '职位列表', '', 0, '', '');
INSERT INTO `pms_menu` VALUES (46, 'AllProjectList', 'project/all_project/list', 'Project', 0, 30, 1, 'ios-paper-outline', '所有项目', NULL, 1, '', '所有项目');
INSERT INTO `pms_menu` VALUES (47, 'projectOverview', 'project/overview', 'Project', 0, 30, 1, 'ios-information-outline', '工作台', NULL, 3, '', '');
INSERT INTO `pms_menu` VALUES (48, 'projectTaskOverview', 'project/taskoverview/0', 'Project', 0, 30, 1, 'ios-information-outline', '任务一览', NULL, 2, '', NULL);
INSERT INTO `pms_menu` VALUES (49, 'personalNotice', '', 'Project', 0, 0, 1, 'email', '通知', '', 99, '', '');
INSERT INTO `pms_menu` VALUES (50, 'personalNoticeList', 'personal/notice/list', 'Project', 0, 49, 1, 'ios-bell', '消息列表', NULL, 0, '', NULL);
INSERT INTO `pms_menu` VALUES (51, 'projectStatistics', 'project/statistics', 'Project', 0, 30, 1, '', '分析页', '', 4, '', '');
INSERT INTO `pms_menu` VALUES (52, 'ProjectType', 'project/project_type/list', 'Project', 0, 30, 1, 'ios-paper-outline', '项目类型', '', 1, '', '项目类型');

-- ----------------------------
-- Table structure for pms_menu_model
-- ----------------------------
DROP TABLE IF EXISTS `pms_menu_model`;
CREATE TABLE `pms_menu_model`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '模块名称，唯一值',
  `path` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '路径',
  `status` tinyint(1) NULL DEFAULT 1,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '标题',
  `icon` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图标',
  `sort` int(5) NULL DEFAULT 0,
  `model_desc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '菜单模块' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of pms_menu_model
-- ----------------------------
INSERT INTO `pms_menu_model` VALUES (5, 'Project', 'project/overview', 1, '项目管理', ' ', 5, '项目管理');

-- ----------------------------
-- Table structure for pms_notify
-- ----------------------------
DROP TABLE IF EXISTS `pms_notify`;
CREATE TABLE `pms_notify`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '标题',
  `content` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '内容',
  `type` tinyint(2) NULL DEFAULT 0 COMMENT '通知类型',
  `to_user_id` int(11) NULL DEFAULT 0 COMMENT '送达用户id',
  `create_time` datetime(0) NULL DEFAULT NULL,
  `is_read` tinyint(1) NULL DEFAULT 0 COMMENT '是否已读',
  `read_time` datetime(0) NULL DEFAULT NULL COMMENT '阅读时间',
  `send_data` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '关联数据',
  `finally_send_time` datetime(0) NULL DEFAULT NULL COMMENT '最终发送时间',
  `send_time` datetime(0) NULL DEFAULT NULL COMMENT '发送时间',
  `action_id` int(11) NULL DEFAULT 0 COMMENT '动作id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 4031 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '动态通知表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of pms_notify
-- ----------------------------
INSERT INTO `pms_notify` VALUES (3979, '任务动态', '李维斯 指派给了 晓铭：修复在 Form 内使用 Carousel 时，点击按钮会跳转的问题', 1, 119, '2018-04-30 22:37:11', 0, NULL, '{\"id\":\"12162\",\"project\":\"1292\",\"module\":\"0\",\"story\":\"0\",\"storyVersion\":\"1\",\"fromBug\":\"0\",\"name\":\"\\u4fee\\u590d\\u5728 Form \\u5185\\u4f7f\\u7528 Carousel \\u65f6\\uff0c\\u70b9\\u51fb\\u6309\\u94ae\\u4f1a\\u8df3\\u8f6c\\u7684\\u95ee\\u9898\",\"type\":\"misc\",\"pri\":\"3\",\"estimate\":\"0\",\"consumed\":\"0\",\"left\":\"0\",\"deadline\":\"0000-00-00\",\"status\":\"wait\",\"color\":\"\",\"mailto\":\"\",\"desc\":\"\",\"openedBy\":\"admin\",\"openedDate\":\"2018-04-30 22:33:39\",\"assignedTo\":\"xiaoming\",\"assignedDate\":\"0000-00-00 00:00:00\",\"estStarted\":\"0000-00-00\",\"realStarted\":\"0000-00-00\",\"finishedBy\":\"\",\"finishedDate\":\"0000-00-00 00:00:00\",\"canceledBy\":\"\",\"canceledDate\":\"0000-00-00 00:00:00\",\"closedBy\":\"\",\"closedDate\":\"0000-00-00 00:00:00\",\"closedReason\":\"\",\"lastEditedBy\":\"\",\"lastEditedDate\":\"0000-00-00 00:00:00\",\"deleted\":\"0\",\"isbg\":null,\"timeout\":\"\",\"timeouts\":null,\"task_type\":\"15\",\"task_tag\":null,\"execute_state\":\"0\",\"task_state\":\"0\",\"end_time\":null,\"is_check\":\"0\",\"remind_time\":null,\"is_pushed\":\"0\"}', '2018-05-01 10:00:12', '2018-04-30 22:37:11', 12162);
INSERT INTO `pms_notify` VALUES (3981, '任务动态', '李维斯 指派给了 肖旺：InputNumber 新增属性 placeholder', 1, 120, '2018-04-30 22:37:18', 0, NULL, '{\"id\":\"12166\",\"project\":\"1292\",\"module\":\"0\",\"story\":\"0\",\"storyVersion\":\"1\",\"fromBug\":\"0\",\"name\":\"InputNumber \\u65b0\\u589e\\u5c5e\\u6027 placeholder\",\"type\":\"misc\",\"pri\":\"3\",\"estimate\":\"0\",\"consumed\":\"0\",\"left\":\"0\",\"deadline\":\"0000-00-00\",\"status\":\"wait\",\"color\":\"\",\"mailto\":\"\",\"desc\":\"\",\"openedBy\":\"admin\",\"openedDate\":\"2018-04-30 22:34:05\",\"assignedTo\":\"xiaowang\",\"assignedDate\":\"0000-00-00 00:00:00\",\"estStarted\":\"0000-00-00\",\"realStarted\":\"0000-00-00\",\"finishedBy\":\"\",\"finishedDate\":\"0000-00-00 00:00:00\",\"canceledBy\":\"\",\"canceledDate\":\"0000-00-00 00:00:00\",\"closedBy\":\"\",\"closedDate\":\"0000-00-00 00:00:00\",\"closedReason\":\"\",\"lastEditedBy\":\"\",\"lastEditedDate\":\"0000-00-00 00:00:00\",\"deleted\":\"0\",\"isbg\":null,\"timeout\":\"\",\"timeouts\":null,\"task_type\":\"16\",\"task_tag\":null,\"execute_state\":\"0\",\"task_state\":\"0\",\"end_time\":null,\"is_check\":\"0\",\"remind_time\":null,\"is_pushed\":\"0\"}', '2018-05-01 10:01:30', '2018-04-30 22:37:18', 12166);
INSERT INTO `pms_notify` VALUES (3983, '任务动态', '李维斯 指派给了 晓铭：优化 Table 筛选、排序样式', 1, 119, '2018-04-30 22:37:24', 0, NULL, '{\"id\":\"12173\",\"project\":\"1292\",\"module\":\"0\",\"story\":\"0\",\"storyVersion\":\"1\",\"fromBug\":\"0\",\"name\":\"\\u4f18\\u5316 Table \\u7b5b\\u9009\\u3001\\u6392\\u5e8f\\u6837\\u5f0f\",\"type\":\"misc\",\"pri\":\"3\",\"estimate\":\"0\",\"consumed\":\"0\",\"left\":\"0\",\"deadline\":\"0000-00-00\",\"status\":\"wait\",\"color\":\"\",\"mailto\":\"\",\"desc\":\"\",\"openedBy\":\"admin\",\"openedDate\":\"2018-04-30 22:35:10\",\"assignedTo\":\"xiaoming\",\"assignedDate\":\"0000-00-00 00:00:00\",\"estStarted\":\"0000-00-00\",\"realStarted\":\"0000-00-00\",\"finishedBy\":\"\",\"finishedDate\":\"0000-00-00 00:00:00\",\"canceledBy\":\"\",\"canceledDate\":\"0000-00-00 00:00:00\",\"closedBy\":\"\",\"closedDate\":\"0000-00-00 00:00:00\",\"closedReason\":\"\",\"lastEditedBy\":\"\",\"lastEditedDate\":\"0000-00-00 00:00:00\",\"deleted\":\"0\",\"isbg\":null,\"timeout\":\"\",\"timeouts\":null,\"task_type\":\"17\",\"task_tag\":null,\"execute_state\":\"0\",\"task_state\":\"0\",\"end_time\":null,\"is_check\":\"0\",\"remind_time\":null,\"is_pushed\":\"0\"}', '2018-05-01 10:00:12', '2018-04-30 22:37:24', 12173);
INSERT INTO `pms_notify` VALUES (3985, '任务动态', '李维斯 指派给了 肖旺：移除全局样式 ul 和 ol', 1, 120, '2018-04-30 22:37:30', 0, NULL, '{\"id\":\"12176\",\"project\":\"1292\",\"module\":\"0\",\"story\":\"0\",\"storyVersion\":\"1\",\"fromBug\":\"0\",\"name\":\"\\u79fb\\u9664\\u5168\\u5c40\\u6837\\u5f0f ul \\u548c ol\",\"type\":\"misc\",\"pri\":\"3\",\"estimate\":\"0\",\"consumed\":\"0\",\"left\":\"0\",\"deadline\":\"0000-00-00\",\"status\":\"wait\",\"color\":\"\",\"mailto\":\"\",\"desc\":\"\",\"openedBy\":\"admin\",\"openedDate\":\"2018-04-30 22:35:31\",\"assignedTo\":\"xiaowang\",\"assignedDate\":\"0000-00-00 00:00:00\",\"estStarted\":\"0000-00-00\",\"realStarted\":\"0000-00-00\",\"finishedBy\":\"\",\"finishedDate\":\"0000-00-00 00:00:00\",\"canceledBy\":\"\",\"canceledDate\":\"0000-00-00 00:00:00\",\"closedBy\":\"\",\"closedDate\":\"0000-00-00 00:00:00\",\"closedReason\":\"\",\"lastEditedBy\":\"\",\"lastEditedDate\":\"0000-00-00 00:00:00\",\"deleted\":\"0\",\"isbg\":null,\"timeout\":\"\",\"timeouts\":null,\"task_type\":\"18\",\"task_tag\":null,\"execute_state\":\"0\",\"task_state\":\"0\",\"end_time\":null,\"is_check\":\"0\",\"remind_time\":null,\"is_pushed\":\"0\"}', '2018-05-01 10:01:29', '2018-04-30 22:37:30', 12176);
INSERT INTO `pms_notify` VALUES (3987, '任务动态', '李维斯 指派给了 肖旺：DatePicker 的事件 on-change 增加返回值 type', 1, 120, '2018-04-30 22:37:38', 0, NULL, '{\"id\":\"12168\",\"project\":\"1292\",\"module\":\"0\",\"story\":\"0\",\"storyVersion\":\"1\",\"fromBug\":\"0\",\"name\":\"DatePicker \\u7684\\u4e8b\\u4ef6 on-change \\u589e\\u52a0\\u8fd4\\u56de\\u503c type\",\"type\":\"misc\",\"pri\":\"3\",\"estimate\":\"0\",\"consumed\":\"0\",\"left\":\"0\",\"deadline\":\"0000-00-00\",\"status\":\"done\",\"color\":\"\",\"mailto\":\"\",\"desc\":\"\",\"openedBy\":\"admin\",\"openedDate\":\"2018-04-30 22:34:16\",\"assignedTo\":\"xiaowang\",\"assignedDate\":\"0000-00-00 00:00:00\",\"estStarted\":\"0000-00-00\",\"realStarted\":\"0000-00-00\",\"finishedBy\":\"\",\"finishedDate\":\"0000-00-00 00:00:00\",\"canceledBy\":\"\",\"canceledDate\":\"0000-00-00 00:00:00\",\"closedBy\":\"\",\"closedDate\":\"0000-00-00 00:00:00\",\"closedReason\":\"\",\"lastEditedBy\":\"\",\"lastEditedDate\":\"0000-00-00 00:00:00\",\"deleted\":\"0\",\"isbg\":null,\"timeout\":\"\",\"timeouts\":null,\"task_type\":\"16\",\"task_tag\":null,\"execute_state\":\"0\",\"task_state\":\"1\",\"end_time\":null,\"is_check\":\"0\",\"remind_time\":null,\"is_pushed\":\"0\"}', '2018-05-01 10:01:29', '2018-04-30 22:37:38', 12168);
INSERT INTO `pms_notify` VALUES (3989, '任务动态', '李维斯 指派给了 晓铭：$Modal 支持 ESC 键关闭', 1, 119, '2018-04-30 22:37:49', 0, NULL, '{\"id\":\"12180\",\"project\":\"1292\",\"module\":\"0\",\"story\":\"0\",\"storyVersion\":\"1\",\"fromBug\":\"0\",\"name\":\"$Modal \\u652f\\u6301 ESC \\u952e\\u5173\\u95ed\",\"type\":\"misc\",\"pri\":\"3\",\"estimate\":\"0\",\"consumed\":\"0\",\"left\":\"0\",\"deadline\":\"0000-00-00\",\"status\":\"wait\",\"color\":\"\",\"mailto\":\"\",\"desc\":\"\",\"openedBy\":\"admin\",\"openedDate\":\"2018-04-30 22:36:18\",\"assignedTo\":\"xiaoming\",\"assignedDate\":\"0000-00-00 00:00:00\",\"estStarted\":\"0000-00-00\",\"realStarted\":\"0000-00-00\",\"finishedBy\":\"\",\"finishedDate\":\"0000-00-00 00:00:00\",\"canceledBy\":\"\",\"canceledDate\":\"0000-00-00 00:00:00\",\"closedBy\":\"\",\"closedDate\":\"0000-00-00 00:00:00\",\"closedReason\":\"\",\"lastEditedBy\":\"\",\"lastEditedDate\":\"0000-00-00 00:00:00\",\"deleted\":\"0\",\"isbg\":null,\"timeout\":\"\",\"timeouts\":null,\"task_type\":\"19\",\"task_tag\":null,\"execute_state\":\"0\",\"task_state\":\"0\",\"end_time\":null,\"is_check\":\"0\",\"remind_time\":null,\"is_pushed\":\"0\"}', '2018-05-01 10:00:09', '2018-04-30 22:37:49', 12180);
INSERT INTO `pms_notify` VALUES (3991, '任务动态', '李维斯 指派给了 晓铭：修复 Table 在多级表头里使用过滤和排序的 bug', 1, 119, '2018-04-30 22:38:01', 0, NULL, '{\"id\":\"12163\",\"project\":\"1292\",\"module\":\"0\",\"story\":\"0\",\"storyVersion\":\"1\",\"fromBug\":\"0\",\"name\":\"\\u4fee\\u590d Table \\u5728\\u591a\\u7ea7\\u8868\\u5934\\u91cc\\u4f7f\\u7528\\u8fc7\\u6ee4\\u548c\\u6392\\u5e8f\\u7684 bug\",\"type\":\"misc\",\"pri\":\"3\",\"estimate\":\"0\",\"consumed\":\"0\",\"left\":\"0\",\"deadline\":\"0000-00-00\",\"status\":\"done\",\"color\":\"\",\"mailto\":\"\",\"desc\":\"\",\"openedBy\":\"admin\",\"openedDate\":\"2018-04-30 22:33:45\",\"assignedTo\":\"xiaoming\",\"assignedDate\":\"0000-00-00 00:00:00\",\"estStarted\":\"0000-00-00\",\"realStarted\":\"0000-00-00\",\"finishedBy\":\"\",\"finishedDate\":\"0000-00-00 00:00:00\",\"canceledBy\":\"\",\"canceledDate\":\"0000-00-00 00:00:00\",\"closedBy\":\"\",\"closedDate\":\"0000-00-00 00:00:00\",\"closedReason\":\"\",\"lastEditedBy\":\"\",\"lastEditedDate\":\"0000-00-00 00:00:00\",\"deleted\":\"0\",\"isbg\":null,\"timeout\":\"\",\"timeouts\":null,\"task_type\":\"15\",\"task_tag\":null,\"execute_state\":\"0\",\"task_state\":\"1\",\"end_time\":null,\"is_check\":\"0\",\"remind_time\":null,\"is_pushed\":\"0\"}', '2018-05-01 10:00:09', '2018-04-30 22:38:01', 12163);
INSERT INTO `pms_notify` VALUES (4004, '项目动态', '李维斯 更新了项目信息【iView】', 2, 119, '2018-05-01 09:31:27', 0, NULL, '{\"id\":\"1292\",\"type\":\"sprint\",\"name\":\"iView\",\"code\":\"iView\",\"begin\":\"2018-04-30\",\"end\":\"2018-07-18\",\"days\":null,\"status\":\"doing\",\"statge\":\"1\",\"pri\":\"1\",\"desc\":null,\"openedBy\":\"\",\"openedDate\":\"0\",\"openedVersion\":null,\"closedBy\":\"\",\"closedDate\":\"0\",\"canceledBy\":\"\",\"canceledDate\":\"0\",\"PO\":\"\",\"PM\":\"\",\"QD\":\"\",\"RD\":\"\",\"team\":null,\"access_control_type\":\"private\",\"white_list\":null,\"order\":null,\"deleted\":\"0\",\"level_id\":\"12\",\"team_id\":\"0\",\"test_message\":null,\"test_ftp\":null,\"online_message\":null,\"online_ftp\":null,\"other_message\":null,\"leader_id\":\"0\",\"business_id\":\"26\",\"type_id\":\"10\",\"ticket\":\"1\",\"schedule\":\"33.00\",\"prepayDate\":\"2018-04-25\",\"project_desc\":\"\",\"createDate\":\"2018-04-30 22:29:18\"}', '2018-05-01 10:00:09', '2018-05-01 09:31:27', 1292);
INSERT INTO `pms_notify` VALUES (4005, '项目动态', '李维斯 更新了项目信息【iView】', 2, 120, '2018-05-01 09:31:27', 0, NULL, '{\"id\":\"1292\",\"type\":\"sprint\",\"name\":\"iView\",\"code\":\"iView\",\"begin\":\"2018-04-30\",\"end\":\"2018-07-18\",\"days\":null,\"status\":\"doing\",\"statge\":\"1\",\"pri\":\"1\",\"desc\":null,\"openedBy\":\"\",\"openedDate\":\"0\",\"openedVersion\":null,\"closedBy\":\"\",\"closedDate\":\"0\",\"canceledBy\":\"\",\"canceledDate\":\"0\",\"PO\":\"\",\"PM\":\"\",\"QD\":\"\",\"RD\":\"\",\"team\":null,\"access_control_type\":\"private\",\"white_list\":null,\"order\":null,\"deleted\":\"0\",\"level_id\":\"12\",\"team_id\":\"0\",\"test_message\":null,\"test_ftp\":null,\"online_message\":null,\"online_ftp\":null,\"other_message\":null,\"leader_id\":\"0\",\"business_id\":\"26\",\"type_id\":\"10\",\"ticket\":\"1\",\"schedule\":\"33.00\",\"prepayDate\":\"2018-04-25\",\"project_desc\":\"\",\"createDate\":\"2018-04-30 22:29:18\"}', '2018-05-01 10:01:29', '2018-05-01 09:31:27', 1292);
INSERT INTO `pms_notify` VALUES (4007, '任务动态', '晓铭 认领了任务：优化了 Select 样式与交互，增强键盘的可访问性，更接近原生', 1, 26, '2018-05-01 10:00:11', 0, NULL, '{\"id\":\"12174\",\"project\":\"1292\",\"module\":\"0\",\"story\":\"0\",\"storyVersion\":\"1\",\"fromBug\":\"0\",\"name\":\"\\u4f18\\u5316\\u4e86 Select \\u6837\\u5f0f\\u4e0e\\u4ea4\\u4e92\\uff0c\\u589e\\u5f3a\\u952e\\u76d8\\u7684\\u53ef\\u8bbf\\u95ee\\u6027\\uff0c\\u66f4\\u63a5\\u8fd1\\u539f\\u751f\",\"type\":\"misc\",\"pri\":\"3\",\"estimate\":\"0\",\"consumed\":\"0\",\"left\":\"0\",\"deadline\":\"0000-00-00\",\"status\":\"wait\",\"color\":\"\",\"mailto\":\"\",\"desc\":\"\",\"openedBy\":\"admin\",\"openedDate\":\"2018-04-30 22:35:10\",\"assignedTo\":\"xiaoming\",\"assignedDate\":\"0000-00-00 00:00:00\",\"estStarted\":\"0000-00-00\",\"realStarted\":\"0000-00-00\",\"finishedBy\":\"\",\"finishedDate\":\"0000-00-00 00:00:00\",\"canceledBy\":\"\",\"canceledDate\":\"0000-00-00 00:00:00\",\"closedBy\":\"\",\"closedDate\":\"0000-00-00 00:00:00\",\"closedReason\":\"\",\"lastEditedBy\":\"\",\"lastEditedDate\":\"0000-00-00 00:00:00\",\"deleted\":\"0\",\"isbg\":null,\"timeout\":\"\",\"timeouts\":null,\"task_type\":\"17\",\"task_tag\":null,\"execute_state\":\"0\",\"task_state\":\"0\",\"end_time\":null,\"is_check\":\"0\",\"remind_time\":null,\"is_pushed\":\"0\"}', '2018-07-14 12:52:26', '2018-05-01 10:00:11', 12174);
INSERT INTO `pms_notify` VALUES (4009, '任务动态', '晓铭 认领了任务：重构了 DatePicker 组件', 1, 26, '2018-05-01 10:00:21', 0, NULL, '{\"id\":\"12175\",\"project\":\"1292\",\"module\":\"0\",\"story\":\"0\",\"storyVersion\":\"1\",\"fromBug\":\"0\",\"name\":\"\\u91cd\\u6784\\u4e86 DatePicker \\u7ec4\\u4ef6\",\"type\":\"misc\",\"pri\":\"3\",\"estimate\":\"0\",\"consumed\":\"0\",\"left\":\"0\",\"deadline\":\"0000-00-00\",\"status\":\"wait\",\"color\":\"\",\"mailto\":\"\",\"desc\":\"\",\"openedBy\":\"admin\",\"openedDate\":\"2018-04-30 22:35:21\",\"assignedTo\":\"xiaoming\",\"assignedDate\":\"0000-00-00 00:00:00\",\"estStarted\":\"0000-00-00\",\"realStarted\":\"0000-00-00\",\"finishedBy\":\"\",\"finishedDate\":\"0000-00-00 00:00:00\",\"canceledBy\":\"\",\"canceledDate\":\"0000-00-00 00:00:00\",\"closedBy\":\"\",\"closedDate\":\"0000-00-00 00:00:00\",\"closedReason\":\"\",\"lastEditedBy\":\"\",\"lastEditedDate\":\"0000-00-00 00:00:00\",\"deleted\":\"0\",\"isbg\":null,\"timeout\":\"\",\"timeouts\":null,\"task_type\":\"18\",\"task_tag\":\"[\\\"3\\\"]\",\"execute_state\":\"0\",\"task_state\":\"0\",\"end_time\":null,\"is_check\":\"0\",\"remind_time\":\"2018-04-03 00:00:00\",\"is_pushed\":\"0\"}', '2018-05-01 10:18:31', '2018-05-01 10:00:21', 12175);
INSERT INTO `pms_notify` VALUES (4011, '任务动态', '晓铭 重做了任务：修复在 Form 内使用 Carousel 时，点击按钮会跳转的问题', 1, 26, '2018-05-01 10:00:24', 0, NULL, '{\"id\":\"12162\",\"project\":\"1292\",\"module\":\"0\",\"story\":\"0\",\"storyVersion\":\"1\",\"fromBug\":\"0\",\"name\":\"\\u4fee\\u590d\\u5728 Form \\u5185\\u4f7f\\u7528 Carousel \\u65f6\\uff0c\\u70b9\\u51fb\\u6309\\u94ae\\u4f1a\\u8df3\\u8f6c\\u7684\\u95ee\\u9898\",\"type\":\"misc\",\"pri\":\"3\",\"estimate\":\"0\",\"consumed\":\"0\",\"left\":\"0\",\"deadline\":\"0000-00-00\",\"status\":\"wait\",\"color\":\"\",\"mailto\":\"\",\"desc\":\"\\u4fee\\u590d\\u5728 Form \\u5185\\u4f7f\\u7528 Carousel \\u65f6\\uff0c\\u70b9\\u51fb\\u6309\\u94ae\\u4f1a\\u8df3\\u8f6c\\u7684\\u95ee\\u9898\",\"openedBy\":\"admin\",\"openedDate\":\"2018-04-30 22:33:39\",\"assignedTo\":\"xiaoming\",\"assignedDate\":\"0000-00-00 00:00:00\",\"estStarted\":\"0000-00-00\",\"realStarted\":\"0000-00-00\",\"finishedBy\":\"\",\"finishedDate\":\"0000-00-00 00:00:00\",\"canceledBy\":\"\",\"canceledDate\":\"0000-00-00 00:00:00\",\"closedBy\":\"\",\"closedDate\":\"0000-00-00 00:00:00\",\"closedReason\":\"\",\"lastEditedBy\":\"\",\"lastEditedDate\":\"0000-00-00 00:00:00\",\"deleted\":\"0\",\"isbg\":null,\"timeout\":\"\",\"timeouts\":null,\"task_type\":\"15\",\"task_tag\":null,\"execute_state\":\"0\",\"task_state\":\"0\",\"end_time\":null,\"is_check\":\"0\",\"remind_time\":\"2018-04-30 00:00:00\",\"is_pushed\":\"0\"}', '2018-05-01 10:18:31', '2018-05-01 10:00:24', 12162);
INSERT INTO `pms_notify` VALUES (4013, '任务动态', '肖旺 重做了任务：移除全局样式 ul 和 ol', 1, 26, '2018-05-01 10:01:29', 0, NULL, '{\"id\":\"12176\",\"project\":\"1292\",\"module\":\"0\",\"story\":\"0\",\"storyVersion\":\"1\",\"fromBug\":\"0\",\"name\":\"\\u79fb\\u9664\\u5168\\u5c40\\u6837\\u5f0f ul \\u548c ol\",\"type\":\"misc\",\"pri\":\"3\",\"estimate\":\"0\",\"consumed\":\"0\",\"left\":\"0\",\"deadline\":\"0000-00-00\",\"status\":\"wait\",\"color\":\"\",\"mailto\":\"\",\"desc\":\"\",\"openedBy\":\"admin\",\"openedDate\":\"2018-04-30 22:35:31\",\"assignedTo\":\"xiaowang\",\"assignedDate\":\"0000-00-00 00:00:00\",\"estStarted\":\"0000-00-00\",\"realStarted\":\"0000-00-00\",\"finishedBy\":\"\",\"finishedDate\":\"0000-00-00 00:00:00\",\"canceledBy\":\"\",\"canceledDate\":\"0000-00-00 00:00:00\",\"closedBy\":\"\",\"closedDate\":\"0000-00-00 00:00:00\",\"closedReason\":\"\",\"lastEditedBy\":\"\",\"lastEditedDate\":\"0000-00-00 00:00:00\",\"deleted\":\"0\",\"isbg\":null,\"timeout\":\"\",\"timeouts\":null,\"task_type\":\"18\",\"task_tag\":\"[\\\"3\\\",\\\"1\\\"]\",\"execute_state\":\"0\",\"task_state\":\"0\",\"end_time\":null,\"is_check\":\"0\",\"remind_time\":null,\"is_pushed\":\"0\"}', '2018-05-01 10:18:31', '2018-05-01 10:01:29', 12176);
INSERT INTO `pms_notify` VALUES (4015, '任务动态', '肖旺 重做了任务：InputNumber 新增属性 placeholder', 1, 26, '2018-05-01 10:01:35', 0, NULL, '{\"id\":\"12166\",\"project\":\"1292\",\"module\":\"0\",\"story\":\"0\",\"storyVersion\":\"1\",\"fromBug\":\"0\",\"name\":\"InputNumber \\u65b0\\u589e\\u5c5e\\u6027 placeholder\",\"type\":\"misc\",\"pri\":\"3\",\"estimate\":\"0\",\"consumed\":\"0\",\"left\":\"0\",\"deadline\":\"0000-00-00\",\"status\":\"wait\",\"color\":\"\",\"mailto\":\"\",\"desc\":\"\",\"openedBy\":\"admin\",\"openedDate\":\"2018-04-30 22:34:05\",\"assignedTo\":\"xiaowang\",\"assignedDate\":\"0000-00-00 00:00:00\",\"estStarted\":\"0000-00-00\",\"realStarted\":\"0000-00-00\",\"finishedBy\":\"\",\"finishedDate\":\"0000-00-00 00:00:00\",\"canceledBy\":\"\",\"canceledDate\":\"0000-00-00 00:00:00\",\"closedBy\":\"\",\"closedDate\":\"0000-00-00 00:00:00\",\"closedReason\":\"\",\"lastEditedBy\":\"\",\"lastEditedDate\":\"0000-00-00 00:00:00\",\"deleted\":\"0\",\"isbg\":null,\"timeout\":\"\",\"timeouts\":null,\"task_type\":\"16\",\"task_tag\":null,\"execute_state\":\"0\",\"task_state\":\"0\",\"end_time\":null,\"is_check\":\"0\",\"remind_time\":null,\"is_pushed\":\"0\"}', '2018-05-01 10:16:54', '2018-05-01 10:01:35', 12166);
INSERT INTO `pms_notify` VALUES (4016, '任务动态', '肖旺 重做了任务：DatePicker 的事件 on-change 增加返回值 type', 1, 26, '2018-05-01 10:01:35', 0, NULL, '{\"id\":\"12168\",\"project\":\"1292\",\"module\":\"0\",\"story\":\"0\",\"storyVersion\":\"1\",\"fromBug\":\"0\",\"name\":\"DatePicker \\u7684\\u4e8b\\u4ef6 on-change \\u589e\\u52a0\\u8fd4\\u56de\\u503c type\",\"type\":\"misc\",\"pri\":\"3\",\"estimate\":\"0\",\"consumed\":\"0\",\"left\":\"0\",\"deadline\":\"0000-00-00\",\"status\":\"wait\",\"color\":\"\",\"mailto\":\"\",\"desc\":\"\",\"openedBy\":\"admin\",\"openedDate\":\"2018-04-30 22:34:16\",\"assignedTo\":\"xiaowang\",\"assignedDate\":\"0000-00-00 00:00:00\",\"estStarted\":\"0000-00-00\",\"realStarted\":\"0000-00-00\",\"finishedBy\":\"\",\"finishedDate\":\"0000-00-00 00:00:00\",\"canceledBy\":\"\",\"canceledDate\":\"0000-00-00 00:00:00\",\"closedBy\":\"\",\"closedDate\":\"0000-00-00 00:00:00\",\"closedReason\":\"\",\"lastEditedBy\":\"\",\"lastEditedDate\":\"0000-00-00 00:00:00\",\"deleted\":\"0\",\"isbg\":null,\"timeout\":\"\",\"timeouts\":null,\"task_type\":\"16\",\"task_tag\":null,\"execute_state\":\"0\",\"task_state\":\"0\",\"end_time\":null,\"is_check\":\"0\",\"remind_time\":null,\"is_pushed\":\"0\"}', '2018-05-01 10:16:54', '2018-05-01 10:01:35', 12168);
INSERT INTO `pms_notify` VALUES (4019, '任务动态', '肖旺 指派给了 晓铭：Table 列新增属性 minWidth 和 maxWidth', 1, 119, '2018-05-01 10:01:42', 0, NULL, '{\"id\":\"12169\",\"project\":\"1292\",\"module\":\"0\",\"story\":\"0\",\"storyVersion\":\"1\",\"fromBug\":\"0\",\"name\":\"Table \\u5217\\u65b0\\u589e\\u5c5e\\u6027 minWidth \\u548c maxWidth\",\"type\":\"misc\",\"pri\":\"3\",\"estimate\":\"0\",\"consumed\":\"0\",\"left\":\"0\",\"deadline\":\"0000-00-00\",\"status\":\"done\",\"color\":\"\",\"mailto\":\"\",\"desc\":\"\",\"openedBy\":\"admin\",\"openedDate\":\"2018-04-30 22:34:24\",\"assignedTo\":\"xiaoming\",\"assignedDate\":\"0000-00-00 00:00:00\",\"estStarted\":\"0000-00-00\",\"realStarted\":\"0000-00-00\",\"finishedBy\":\"\",\"finishedDate\":\"0000-00-00 00:00:00\",\"canceledBy\":\"\",\"canceledDate\":\"0000-00-00 00:00:00\",\"closedBy\":\"\",\"closedDate\":\"0000-00-00 00:00:00\",\"closedReason\":\"\",\"lastEditedBy\":\"\",\"lastEditedDate\":\"0000-00-00 00:00:00\",\"deleted\":\"0\",\"isbg\":null,\"timeout\":\"\",\"timeouts\":null,\"task_type\":\"16\",\"task_tag\":null,\"execute_state\":\"0\",\"task_state\":\"1\",\"end_time\":null,\"is_check\":\"0\",\"remind_time\":null,\"is_pushed\":\"0\"}', NULL, '2018-05-01 10:01:42', 12169);
INSERT INTO `pms_notify` VALUES (4020, '任务动态', '肖旺 指派给了 晓铭：Table 列新增属性 minWidth 和 maxWidth', 1, 26, '2018-05-01 10:01:42', 0, NULL, '{\"id\":\"12169\",\"project\":\"1292\",\"module\":\"0\",\"story\":\"0\",\"storyVersion\":\"1\",\"fromBug\":\"0\",\"name\":\"Table \\u5217\\u65b0\\u589e\\u5c5e\\u6027 minWidth \\u548c maxWidth\",\"type\":\"misc\",\"pri\":\"3\",\"estimate\":\"0\",\"consumed\":\"0\",\"left\":\"0\",\"deadline\":\"0000-00-00\",\"status\":\"done\",\"color\":\"\",\"mailto\":\"\",\"desc\":\"\",\"openedBy\":\"admin\",\"openedDate\":\"2018-04-30 22:34:24\",\"assignedTo\":\"xiaoming\",\"assignedDate\":\"0000-00-00 00:00:00\",\"estStarted\":\"0000-00-00\",\"realStarted\":\"0000-00-00\",\"finishedBy\":\"\",\"finishedDate\":\"0000-00-00 00:00:00\",\"canceledBy\":\"\",\"canceledDate\":\"0000-00-00 00:00:00\",\"closedBy\":\"\",\"closedDate\":\"0000-00-00 00:00:00\",\"closedReason\":\"\",\"lastEditedBy\":\"\",\"lastEditedDate\":\"0000-00-00 00:00:00\",\"deleted\":\"0\",\"isbg\":null,\"timeout\":\"\",\"timeouts\":null,\"task_type\":\"16\",\"task_tag\":null,\"execute_state\":\"0\",\"task_state\":\"1\",\"end_time\":null,\"is_check\":\"0\",\"remind_time\":null,\"is_pushed\":\"0\"}', '2018-05-01 10:16:54', '2018-05-01 10:01:42', 12169);
INSERT INTO `pms_notify` VALUES (4027, '任务动态', '李维斯 完成了任务：筛选样式', 1, 119, '2018-07-14 13:58:44', 0, NULL, '{\"id\":\"12181\",\"project\":\"1292\",\"name\":\"\\u7b5b\\u9009\\u6837\\u5f0f\",\"type\":\"misc\",\"pri\":\"3\",\"status\":\"done\",\"desc\":\"\",\"openedBy\":\"xiaoming\",\"openedDate\":\"2018-07-14 13:58:33\",\"assignedTo\":\"xiaoming\",\"deleted\":\"0\",\"task_type\":\"17\",\"task_tag\":null,\"execute_state\":\"0\",\"task_state\":\"1\",\"end_time\":null,\"remind_time\":null,\"pid\":\"12173\",\"sort\":\"12181\"}', NULL, '2018-07-14 13:58:44', 12181);
INSERT INTO `pms_notify` VALUES (4026, '任务动态', '李维斯 重做了任务：排序样式', 1, 119, '2018-07-14 13:58:43', 0, NULL, '{\"id\":\"12182\",\"project\":\"1292\",\"name\":\"\\u6392\\u5e8f\\u6837\\u5f0f\",\"type\":\"misc\",\"pri\":\"3\",\"status\":\"wait\",\"desc\":\"\",\"openedBy\":\"xiaoming\",\"openedDate\":\"2018-07-14 13:58:36\",\"assignedTo\":\"xiaoming\",\"deleted\":\"0\",\"task_type\":\"17\",\"task_tag\":null,\"execute_state\":\"0\",\"task_state\":\"0\",\"end_time\":null,\"remind_time\":null,\"pid\":\"12173\",\"sort\":\"12182\"}', NULL, '2018-07-14 13:58:43', 12182);
INSERT INTO `pms_notify` VALUES (4030, '任务动态', '李维斯 邀请 肖旺 加入任务：优化 popper.js 的配置及 dropdown 的展开动画', 1, 119, '2018-07-19 15:17:13', 0, NULL, '{\"id\":\"12170\",\"project\":\"1292\",\"name\":\"\\u4f18\\u5316 popper.js \\u7684\\u914d\\u7f6e\\u53ca dropdown \\u7684\\u5c55\\u5f00\\u52a8\\u753b\",\"type\":\"misc\",\"pri\":\"3\",\"status\":\"wait\",\"desc\":\"\",\"openedBy\":\"admin\",\"openedDate\":\"2018-04-30 22:35:10\",\"assignedTo\":\"admin\",\"deleted\":\"0\",\"task_type\":\"17\",\"task_tag\":\"[\\\"4\\\"]\",\"execute_state\":\"0\",\"task_state\":\"0\",\"end_time\":null,\"remind_time\":\"2018-04-30 00:00:00\",\"pid\":\"0\",\"sort\":\"12170\"}', NULL, '2018-07-19 15:17:13', 12170);
INSERT INTO `pms_notify` VALUES (4029, '任务动态', '李维斯 邀请 肖旺 加入任务：优化 popper.js 的配置及 dropdown 的展开动画', 1, 120, '2018-07-19 15:17:13', 0, NULL, '{\"id\":\"12170\",\"project\":\"1292\",\"name\":\"\\u4f18\\u5316 popper.js \\u7684\\u914d\\u7f6e\\u53ca dropdown \\u7684\\u5c55\\u5f00\\u52a8\\u753b\",\"type\":\"misc\",\"pri\":\"3\",\"status\":\"wait\",\"desc\":\"\",\"openedBy\":\"admin\",\"openedDate\":\"2018-04-30 22:35:10\",\"assignedTo\":\"admin\",\"deleted\":\"0\",\"task_type\":\"17\",\"task_tag\":\"[\\\"4\\\"]\",\"execute_state\":\"0\",\"task_state\":\"0\",\"end_time\":null,\"remind_time\":\"2018-04-30 00:00:00\",\"pid\":\"0\",\"sort\":\"12170\"}', NULL, '2018-07-19 15:17:13', 12170);

-- ----------------------------
-- Table structure for pms_project
-- ----------------------------
DROP TABLE IF EXISTS `pms_project`;
CREATE TABLE `pms_project`  (
  `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT,
  `type` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'sprint',
  `name` varchar(90) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `code` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `begin` date NULL DEFAULT NULL,
  `end` date NULL DEFAULT NULL,
  `status` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `statge` enum('1','2','3','4','5') CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '1',
  `pri` enum('1','2','3','4') CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '1',
  `desc` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `access_control_type` enum('open','private','custom') CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'open' COMMENT '访问控制l类型',
  `white_list` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '可以访问项目的权限组（白名单）',
  `order` mediumint(8) UNSIGNED NULL DEFAULT NULL,
  `deleted` enum('0','1') CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0',
  `level_id` int(11) NULL DEFAULT 1,
  `team_id` int(11) NULL DEFAULT 0,
  `test_message` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `test_ftp` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `online_message` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `online_ftp` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `other_message` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `leader_id` int(11) NULL DEFAULT 0,
  `business_id` int(11) NULL DEFAULT 0,
  `type_id` int(11) NULL DEFAULT 0 COMMENT '项目类型',
  `ticket` tinyint(2) NULL DEFAULT 0,
  `schedule` double(11, 2) NULL DEFAULT 0.00,
  `prepayDate` date NULL DEFAULT NULL,
  `project_desc` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `createDate` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `project`(`begin`, `end`, `status`, `order`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1298 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '项目表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of pms_project
-- ----------------------------
INSERT INTO `pms_project` VALUES (1292, 'sprint', 'iView', 'iView', '2018-04-30', '2018-07-18', 'doing', '1', '1', NULL, 'private', NULL, NULL, '0', 12, 0, NULL, NULL, NULL, NULL, NULL, 0, 26, 10, 1, 30.00, '2018-04-25', '', '2018-04-30 22:29:18');
INSERT INTO `pms_project` VALUES (1293, 'sprint', 'Alipay', 'Alipay', '2018-05-01', '2018-05-16', 'wait', '1', '1', NULL, 'open', NULL, NULL, '0', 3, 0, NULL, NULL, NULL, NULL, NULL, 0, 26, 10, 1, 0.00, '2018-04-25', 'Alipay', '2018-05-01 09:28:36');
INSERT INTO `pms_project` VALUES (1296, 'sprint', 'Myna', 'Myna', '2018-05-01', '2018-05-15', 'wait', '1', '1', NULL, 'open', NULL, NULL, '0', 8, 0, NULL, NULL, NULL, NULL, NULL, 0, 26, 10, 2, 0.00, '2018-04-25', 'Myna', '2018-05-01 09:33:43');
INSERT INTO `pms_project` VALUES (1297, 'sprint', 'Fregata', 'Fregata', '2018-05-01', '2018-05-08', 'wait', '1', '1', NULL, 'private', NULL, NULL, '0', 12, 0, NULL, NULL, NULL, NULL, NULL, 0, 26, 13, 1, 0.00, '2018-05-19', 'Fregata', '2018-05-01 09:36:05');

-- ----------------------------
-- Table structure for pms_project_level
-- ----------------------------
DROP TABLE IF EXISTS `pms_project_level`;
CREATE TABLE `pms_project_level`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `level_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '等级名称',
  `money` decimal(10, 2) NULL DEFAULT 0.00 COMMENT '提成',
  `sort` tinyint(2) NULL DEFAULT 0 COMMENT '排序',
  `create_time` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '项目评级表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of pms_project_level
-- ----------------------------
INSERT INTO `pms_project_level` VALUES (1, 'C-', 50.00, 0, '2017-10-24 11:50:32');
INSERT INTO `pms_project_level` VALUES (3, 'C', 100.00, 1, '2017-10-27 09:24:02');
INSERT INTO `pms_project_level` VALUES (5, 'B-', 150.00, 2, '2017-10-27 09:42:35');
INSERT INTO `pms_project_level` VALUES (6, 'B', 200.00, 3, '2017-10-27 09:42:43');
INSERT INTO `pms_project_level` VALUES (7, 'B+', 250.00, 4, '2017-10-27 09:42:51');
INSERT INTO `pms_project_level` VALUES (8, 'A', 300.00, 5, '2017-10-27 09:43:25');
INSERT INTO `pms_project_level` VALUES (9, 'A+', 350.00, 6, '2017-10-27 09:43:47');
INSERT INTO `pms_project_level` VALUES (10, 'S', 500.00, 7, '2017-10-27 09:44:22');
INSERT INTO `pms_project_level` VALUES (11, 'S+', 750.00, 8, '2017-10-27 09:44:42');
INSERT INTO `pms_project_level` VALUES (12, 'SSS', 1000.00, 9, '2017-10-27 09:44:48');

-- ----------------------------
-- Table structure for pms_project_log
-- ----------------------------
DROP TABLE IF EXISTS `pms_project_log`;
CREATE TABLE `pms_project_log`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) NULL DEFAULT 0 COMMENT '项目id',
  `user_id` int(11) NULL DEFAULT 0,
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '内容',
  `create_time` datetime(0) NULL DEFAULT NULL,
  `ticket` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '操作标记',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1350 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '项目日志' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of pms_project_log
-- ----------------------------
INSERT INTO `pms_project_log` VALUES (1340, 1292, 26, '更新了项目信息', '2018-04-30 22:29:25', '');
INSERT INTO `pms_project_log` VALUES (1341, 1292, 26, ' 新版本 2.13.0 King of Opera', '2018-04-30 22:38:31', '发布了');
INSERT INTO `pms_project_log` VALUES (1342, 1292, 26, ' 新版本 2.13.1 ', '2018-04-30 22:38:47', '发布了');
INSERT INTO `pms_project_log` VALUES (1343, 1292, 26, '更新了项目信息', '2018-04-30 22:39:25', '');
INSERT INTO `pms_project_log` VALUES (1344, 1292, 26, '更新了项目信息', '2018-05-01 08:57:33', '');
INSERT INTO `pms_project_log` VALUES (1345, 1292, 26, '更新了项目信息', '2018-05-01 08:59:47', '');
INSERT INTO `pms_project_log` VALUES (1346, 1293, 26, '更新了项目信息', '2018-05-01 09:28:41', '');
INSERT INTO `pms_project_log` VALUES (1347, 1292, 26, '更新了项目信息', '2018-05-01 09:29:40', '');
INSERT INTO `pms_project_log` VALUES (1348, 1292, 26, '更新了项目信息', '2018-05-01 09:31:27', '');
INSERT INTO `pms_project_log` VALUES (1349, 1293, 26, '更新了项目信息', '2018-05-01 09:31:31', '');

-- ----------------------------
-- Table structure for pms_project_type
-- ----------------------------
DROP TABLE IF EXISTS `pms_project_type`;
CREATE TABLE `pms_project_type`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '类型名称',
  `memo` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '备注',
  `sort` tinyint(2) NULL DEFAULT 0,
  `create_time` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '项目类型表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of pms_project_type
-- ----------------------------
INSERT INTO `pms_project_type` VALUES (10, '研发', '产品研发', 0, '2018-04-30 22:13:35');
INSERT INTO `pms_project_type` VALUES (11, '产品进展', '适用于互联网产品人员对产品计划、跟进及发布管理', 0, '2018-04-30 22:15:10');
INSERT INTO `pms_project_type` VALUES (12, '需求管理', '适用于产品部门对需求的收集、评估及反馈管理', 0, '2018-04-30 22:16:29');
INSERT INTO `pms_project_type` VALUES (13, '机械制造', '适用于制造商对图纸设计及制造安装的工作流程管理', 0, '2018-04-30 22:19:06');

-- ----------------------------
-- Table structure for pms_project_user
-- ----------------------------
DROP TABLE IF EXISTS `pms_project_user`;
CREATE TABLE `pms_project_user`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) NULL DEFAULT 0 COMMENT '项目id',
  `user_id` int(11) NULL DEFAULT 0 COMMENT '成员id',
  `is_leader` tinyint(1) NULL DEFAULT 0 COMMENT '是否项目负责人',
  `is_developer` tinyint(1) NULL DEFAULT 0 COMMENT '是否主要开发者',
  `create_time` datetime(0) NULL DEFAULT NULL,
  `is_business` tinyint(1) NULL DEFAULT 0 COMMENT '是否业务',
  `is_owner` int(11) NULL DEFAULT 0 COMMENT '拥有者',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '项目-成员表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for pms_system_log
-- ----------------------------
DROP TABLE IF EXISTS `pms_system_log`;
CREATE TABLE `pms_system_log`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '日志内容',
  `user_id` int(11) NULL DEFAULT 0,
  `service` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `add_time` datetime(0) NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`, `add_time`) USING BTREE,
  INDEX `add_time`(`add_time`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 2518 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '日志表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of pms_system_log
-- ----------------------------
INSERT INTO `pms_system_log` VALUES (2008, '编辑用户，编号：26', 0, NULL, '2018-01-18 15:00:09');
INSERT INTO `pms_system_log` VALUES (2009, '编辑用户信息，编号：[26]', 0, NULL, '2018-01-18 15:00:09');
INSERT INTO `pms_system_log` VALUES (2010, '编辑用户，编号：26', NULL, NULL, '2018-01-18 15:00:42');
INSERT INTO `pms_system_log` VALUES (2011, '编辑用户信息，编号：[26]', NULL, NULL, '2018-01-18 15:00:42');
INSERT INTO `pms_system_log` VALUES (2012, '修改用户状态，编号：[26]，状态：[1]', NULL, NULL, '2018-01-18 15:00:46');
INSERT INTO `pms_system_log` VALUES (2013, '新增用户，编号：119', NULL, NULL, '2018-01-18 15:01:15');
INSERT INTO `pms_system_log` VALUES (2014, '用户登录，编号：[26]', 0, NULL, '2018-01-18 15:03:16');
INSERT INTO `pms_system_log` VALUES (2015, '新增用户组，编号：[8]', NULL, NULL, '2018-01-18 15:06:59');
INSERT INTO `pms_system_log` VALUES (2016, '修改用户配置，配置项：base_setting', NULL, NULL, '2018-01-18 15:07:23');
INSERT INTO `pms_system_log` VALUES (2017, '用户登录，编号：[119]', 0, NULL, '2018-01-18 15:07:41');
INSERT INTO `pms_system_log` VALUES (2018, '用户登录，编号：[26]', 0, NULL, '2018-01-18 15:08:06');
INSERT INTO `pms_system_log` VALUES (2019, '用户登录，编号：[119]', 0, NULL, '2018-01-18 15:08:23');
INSERT INTO `pms_system_log` VALUES (2020, '上传头像，编号：119', NULL, NULL, '2018-01-18 15:13:16');
INSERT INTO `pms_system_log` VALUES (2021, '上传头像，编号：119', NULL, NULL, '2018-01-18 15:13:38');
INSERT INTO `pms_system_log` VALUES (2022, '用户登录，编号：[119]', 0, NULL, '2018-01-18 15:14:05');
INSERT INTO `pms_system_log` VALUES (2023, '用户登录，编号：[119]', 0, NULL, '2018-01-18 15:14:14');
INSERT INTO `pms_system_log` VALUES (2024, '用户登录，编号：[119]', 0, NULL, '2018-01-18 15:15:06');
INSERT INTO `pms_system_log` VALUES (2025, '用户登录，编号：[26]', 0, NULL, '2018-01-18 15:15:55');
INSERT INTO `pms_system_log` VALUES (2026, '新增团队，编号：16', NULL, NULL, '2018-01-18 15:16:34');
INSERT INTO `pms_system_log` VALUES (2027, '新增团队，编号：17', NULL, NULL, '2018-01-18 15:16:49');
INSERT INTO `pms_system_log` VALUES (2028, '小明 加入了 开发三部', NULL, NULL, '2018-01-18 15:16:57');
INSERT INTO `pms_system_log` VALUES (2029, '开发三部主管-李维斯 加入了 开发三部', NULL, NULL, '2018-01-18 15:16:58');
INSERT INTO `pms_system_log` VALUES (2030, '设置 开发三部 负责人为 ', NULL, NULL, '2018-01-18 15:17:00');
INSERT INTO `pms_system_log` VALUES (2031, '用户登录，编号：[119]', 0, NULL, '2018-01-18 15:35:42');
INSERT INTO `pms_system_log` VALUES (2032, '上传头像，编号：119', NULL, NULL, '2018-01-18 15:36:46');
INSERT INTO `pms_system_log` VALUES (2033, '新增用户，编号：120', NULL, NULL, '2018-01-18 15:37:15');
INSERT INTO `pms_system_log` VALUES (2034, '用户登录，编号：[26]', 0, NULL, '2018-01-18 15:39:01');
INSERT INTO `pms_system_log` VALUES (2035, '编辑用户组，编号：[8]', NULL, NULL, '2018-01-18 15:39:15');
INSERT INTO `pms_system_log` VALUES (2036, '用户登录，编号：[119]', 0, NULL, '2018-01-18 15:39:20');
INSERT INTO `pms_system_log` VALUES (2037, '编辑用户，编号：119', NULL, NULL, '2018-01-18 15:44:23');
INSERT INTO `pms_system_log` VALUES (2038, '编辑用户信息，编号：[119]', NULL, NULL, '2018-01-18 15:44:23');
INSERT INTO `pms_system_log` VALUES (2039, '编辑用户，编号：119', NULL, NULL, '2018-01-18 15:44:24');
INSERT INTO `pms_system_log` VALUES (2040, '编辑用户信息，编号：[119]', NULL, NULL, '2018-01-18 15:44:24');
INSERT INTO `pms_system_log` VALUES (2041, '编辑用户，编号：119', NULL, NULL, '2018-01-18 15:44:43');
INSERT INTO `pms_system_log` VALUES (2042, '编辑用户信息，编号：[119]', NULL, NULL, '2018-01-18 15:44:43');
INSERT INTO `pms_system_log` VALUES (2043, '编辑用户，编号：119', NULL, NULL, '2018-01-18 15:44:44');
INSERT INTO `pms_system_log` VALUES (2044, '编辑用户信息，编号：[119]', NULL, NULL, '2018-01-18 15:44:44');
INSERT INTO `pms_system_log` VALUES (2045, '编辑用户，编号：119', NULL, NULL, '2018-01-18 15:44:45');
INSERT INTO `pms_system_log` VALUES (2046, '编辑用户信息，编号：[119]', NULL, NULL, '2018-01-18 15:44:45');
INSERT INTO `pms_system_log` VALUES (2047, '用户登录，编号：[26]', 0, NULL, '2018-01-18 15:44:51');
INSERT INTO `pms_system_log` VALUES (2048, '编辑用户组，编号：[8]', NULL, NULL, '2018-01-18 15:45:07');
INSERT INTO `pms_system_log` VALUES (2049, '用户登录，编号：[119]', 0, NULL, '2018-01-18 15:47:40');
INSERT INTO `pms_system_log` VALUES (2050, '用户登录，编号：[119]', 0, NULL, '2018-01-18 16:03:27');
INSERT INTO `pms_system_log` VALUES (2051, '用户登录，编号：[119]', 0, NULL, '2018-01-18 16:39:59');
INSERT INTO `pms_system_log` VALUES (2052, '用户登录，编号：[26]', 0, NULL, '2018-01-18 17:06:48');
INSERT INTO `pms_system_log` VALUES (2053, '用户登录，编号：[119]', 0, NULL, '2018-01-18 17:54:18');
INSERT INTO `pms_system_log` VALUES (2054, '用户登录，编号：[26]', 0, NULL, '2018-01-18 17:55:13');
INSERT INTO `pms_system_log` VALUES (2055, '用户登录，编号：[119]', 0, NULL, '2018-01-18 17:55:35');
INSERT INTO `pms_system_log` VALUES (2056, '用户登录，编号：[119]', NULL, NULL, '2018-01-18 17:55:37');
INSERT INTO `pms_system_log` VALUES (2057, '用户登录，编号：[119]', 0, NULL, '2018-01-18 17:55:53');
INSERT INTO `pms_system_log` VALUES (2058, '用户登录，编号：[119]', 0, NULL, '2018-01-18 17:59:40');
INSERT INTO `pms_system_log` VALUES (2059, '用户登录，编号：[119]', 0, NULL, '2018-01-18 18:01:10');
INSERT INTO `pms_system_log` VALUES (2060, '用户登录，编号：[119]', 0, NULL, '2018-01-18 18:23:11');
INSERT INTO `pms_system_log` VALUES (2061, '用户登录，编号：[119]', 0, NULL, '2018-01-18 18:42:52');
INSERT INTO `pms_system_log` VALUES (2062, '用户登录，编号：[119]', 0, NULL, '2018-01-18 19:20:04');
INSERT INTO `pms_system_log` VALUES (2063, '用户登录，编号：[119]', 0, NULL, '2018-01-18 19:57:58');
INSERT INTO `pms_system_log` VALUES (2064, '用户登录，编号：[119]', NULL, NULL, '2018-01-18 19:58:02');
INSERT INTO `pms_system_log` VALUES (2065, '用户登录，编号：[119]', NULL, NULL, '2018-01-18 19:58:04');
INSERT INTO `pms_system_log` VALUES (2066, '用户登录，编号：[119]', 0, NULL, '2018-01-19 08:48:41');
INSERT INTO `pms_system_log` VALUES (2067, '修改团队状态，编号：[0]，状态：[0]', NULL, NULL, '2018-01-19 08:50:58');
INSERT INTO `pms_system_log` VALUES (2068, '修改团队状态，编号：[0]，状态：[1]', NULL, NULL, '2018-01-19 08:50:59');
INSERT INTO `pms_system_log` VALUES (2069, '修改团队状态，编号：[0]，状态：[0]', NULL, NULL, '2018-01-19 08:51:01');
INSERT INTO `pms_system_log` VALUES (2070, '修改团队状态，编号：[0]，状态：[1]', NULL, NULL, '2018-01-19 08:51:02');
INSERT INTO `pms_system_log` VALUES (2071, '修改团队状态，编号：[0]，状态：[0]', NULL, NULL, '2018-01-19 08:51:03');
INSERT INTO `pms_system_log` VALUES (2072, '修改团队状态，编号：[0]，状态：[1]', NULL, NULL, '2018-01-19 08:51:03');
INSERT INTO `pms_system_log` VALUES (2073, '用户登录，编号：[26]', NULL, NULL, '2018-01-19 17:24:34');
INSERT INTO `pms_system_log` VALUES (2074, '用户登录，编号：[26]', NULL, NULL, '2018-01-19 17:39:34');
INSERT INTO `pms_system_log` VALUES (2075, '用户登录，编号：[26]', NULL, NULL, '2018-01-19 21:22:05');
INSERT INTO `pms_system_log` VALUES (2076, '用户登录，编号：[119]', 0, NULL, '2018-01-20 20:37:32');
INSERT INTO `pms_system_log` VALUES (2077, '用户登录，编号：[26]', 0, NULL, '2018-01-20 23:01:39');
INSERT INTO `pms_system_log` VALUES (2078, '用户登录，编号：[26]', NULL, NULL, '2018-01-21 11:37:31');
INSERT INTO `pms_system_log` VALUES (2079, '编辑用户，编号：26', NULL, NULL, '2018-01-21 12:21:57');
INSERT INTO `pms_system_log` VALUES (2080, '编辑用户信息，编号：[26]', NULL, NULL, '2018-01-21 12:21:57');
INSERT INTO `pms_system_log` VALUES (2081, '编辑用户，编号：26', NULL, NULL, '2018-01-21 12:22:25');
INSERT INTO `pms_system_log` VALUES (2082, '编辑用户信息，编号：[26]', NULL, NULL, '2018-01-21 12:22:25');
INSERT INTO `pms_system_log` VALUES (2083, '编辑用户，编号：119', NULL, NULL, '2018-01-21 12:23:09');
INSERT INTO `pms_system_log` VALUES (2084, '编辑用户信息，编号：[119]', NULL, NULL, '2018-01-21 12:23:09');
INSERT INTO `pms_system_log` VALUES (2085, '编辑用户，编号：120', NULL, NULL, '2018-01-21 12:23:18');
INSERT INTO `pms_system_log` VALUES (2086, '编辑用户信息，编号：[120]', NULL, NULL, '2018-01-21 12:23:18');
INSERT INTO `pms_system_log` VALUES (2087, '编辑用户，编号：26', NULL, NULL, '2018-01-21 12:23:37');
INSERT INTO `pms_system_log` VALUES (2088, '编辑用户信息，编号：[26]', NULL, NULL, '2018-01-21 12:23:37');
INSERT INTO `pms_system_log` VALUES (2089, '用户登录，编号：[26]', 0, NULL, '2018-01-21 12:26:46');
INSERT INTO `pms_system_log` VALUES (2090, '修改用户状态，编号：[120]，状态：[1]', NULL, NULL, '2018-01-21 12:26:52');
INSERT INTO `pms_system_log` VALUES (2091, '用户登录，编号：[120]', 0, NULL, '2018-01-21 12:27:03');
INSERT INTO `pms_system_log` VALUES (2092, '上传头像，编号：120', NULL, NULL, '2018-01-21 12:28:10');
INSERT INTO `pms_system_log` VALUES (2093, '用户登录，编号：[119]', 0, NULL, '2018-01-21 12:29:40');
INSERT INTO `pms_system_log` VALUES (2094, '用户登录，编号：[26]', 0, NULL, '2018-01-21 12:31:15');
INSERT INTO `pms_system_log` VALUES (2095, '用户登录，编号：[119]', 0, NULL, '2018-01-21 12:32:43');
INSERT INTO `pms_system_log` VALUES (2096, '用户登录，编号：[119]', 0, NULL, '2018-01-21 19:58:17');
INSERT INTO `pms_system_log` VALUES (2097, '用户登录，编号：[26]', NULL, NULL, '2018-01-21 21:49:07');
INSERT INTO `pms_system_log` VALUES (2098, '用户登录，编号：[119]', 0, NULL, '2018-01-22 11:16:44');
INSERT INTO `pms_system_log` VALUES (2099, '用户登录，编号：[119]', 0, NULL, '2018-01-22 11:34:34');
INSERT INTO `pms_system_log` VALUES (2100, '用户登录，编号：[119]', 0, NULL, '2018-01-23 09:42:02');
INSERT INTO `pms_system_log` VALUES (2101, '用户登录，编号：[119]', NULL, NULL, '2018-01-23 09:42:03');
INSERT INTO `pms_system_log` VALUES (2102, '用户登录，编号：[119]', 0, NULL, '2018-01-23 09:45:13');
INSERT INTO `pms_system_log` VALUES (2103, '用户登录，编号：[26]', 26, NULL, '2018-01-23 09:53:09');
INSERT INTO `pms_system_log` VALUES (2104, '用户登录，编号：[119]', 0, NULL, '2018-01-23 09:59:07');
INSERT INTO `pms_system_log` VALUES (2105, '用户登录，编号：[119]', 0, NULL, '2018-01-23 10:02:22');
INSERT INTO `pms_system_log` VALUES (2106, '用户登录，编号：[119]', 0, NULL, '2018-01-23 10:10:36');
INSERT INTO `pms_system_log` VALUES (2107, '用户登录，编号：[119]', 0, NULL, '2018-01-23 10:12:07');
INSERT INTO `pms_system_log` VALUES (2108, '用户登录，编号：[119]', 0, NULL, '2018-01-23 10:17:26');
INSERT INTO `pms_system_log` VALUES (2109, '用户登录，编号：[119]', 0, NULL, '2018-01-23 10:18:47');
INSERT INTO `pms_system_log` VALUES (2110, '用户登录，编号：[119]', 0, NULL, '2018-01-23 10:20:51');
INSERT INTO `pms_system_log` VALUES (2111, '用户登录，编号：[119]', 119, NULL, '2018-01-23 10:20:54');
INSERT INTO `pms_system_log` VALUES (2112, '用户登录，编号：[119]', 0, NULL, '2018-01-23 10:21:25');
INSERT INTO `pms_system_log` VALUES (2113, '用户登录，编号：[119]', 0, NULL, '2018-01-23 10:22:54');
INSERT INTO `pms_system_log` VALUES (2114, '用户登录，编号：[119]', 0, NULL, '2018-01-23 10:46:52');
INSERT INTO `pms_system_log` VALUES (2115, '用户登录，编号：[119]', 0, NULL, '2018-01-23 11:36:41');
INSERT INTO `pms_system_log` VALUES (2116, '用户登录，编号：[119]', 119, NULL, '2018-01-23 11:36:42');
INSERT INTO `pms_system_log` VALUES (2117, '用户登录，编号：[119]', 0, NULL, '2018-01-23 11:44:07');
INSERT INTO `pms_system_log` VALUES (2118, '用户登录，编号：[119]', 0, NULL, '2018-01-23 11:53:02');
INSERT INTO `pms_system_log` VALUES (2119, '用户登录，编号：[119]', 119, NULL, '2018-01-23 11:53:03');
INSERT INTO `pms_system_log` VALUES (2120, '用户登录，编号：[119]', 0, NULL, '2018-01-23 12:03:35');
INSERT INTO `pms_system_log` VALUES (2121, '用户登录，编号：[119]', 0, NULL, '2018-01-23 12:08:13');
INSERT INTO `pms_system_log` VALUES (2122, '用户登录，编号：[119]', 0, NULL, '2018-01-23 13:12:00');
INSERT INTO `pms_system_log` VALUES (2123, '用户登录，编号：[119]', 0, NULL, '2018-01-23 13:43:46');
INSERT INTO `pms_system_log` VALUES (2124, '用户登录，编号：[119]', 0, NULL, '2018-01-23 13:53:07');
INSERT INTO `pms_system_log` VALUES (2125, '修改团队状态，编号：[0]，状态：[0]', 119, NULL, '2018-01-23 13:56:49');
INSERT INTO `pms_system_log` VALUES (2126, '修改团队状态，编号：[0]，状态：[1]', 119, NULL, '2018-01-23 13:56:50');
INSERT INTO `pms_system_log` VALUES (2127, '用户登录，编号：[119]', 0, NULL, '2018-01-23 14:11:13');
INSERT INTO `pms_system_log` VALUES (2128, '用户登录，编号：[119]', 119, NULL, '2018-01-23 14:12:03');
INSERT INTO `pms_system_log` VALUES (2129, '用户登录，编号：[119]', 0, NULL, '2018-01-23 14:33:52');
INSERT INTO `pms_system_log` VALUES (2130, '新增团队，编号：18', 119, NULL, '2018-01-23 14:35:01');
INSERT INTO `pms_system_log` VALUES (2131, '用户登录，编号：[119]', 0, NULL, '2018-01-23 14:37:30');
INSERT INTO `pms_system_log` VALUES (2132, '用户登录，编号：[119]', 0, NULL, '2018-01-23 14:45:29');
INSERT INTO `pms_system_log` VALUES (2133, '用户登录，编号：[119]', 119, NULL, '2018-01-23 14:45:30');
INSERT INTO `pms_system_log` VALUES (2134, '用户登录，编号：[119]', 0, NULL, '2018-01-23 14:56:15');
INSERT INTO `pms_system_log` VALUES (2135, '用户登录，编号：[119]', 0, NULL, '2018-01-23 14:57:02');
INSERT INTO `pms_system_log` VALUES (2136, '用户登录，编号：[119]', 0, NULL, '2018-01-23 15:00:11');
INSERT INTO `pms_system_log` VALUES (2137, '用户登录，编号：[119]', 0, NULL, '2018-01-23 15:46:14');
INSERT INTO `pms_system_log` VALUES (2138, '用户登录，编号：[119]', 0, NULL, '2018-01-23 16:08:27');
INSERT INTO `pms_system_log` VALUES (2139, '用户登录，编号：[119]', 0, NULL, '2018-01-23 17:25:35');
INSERT INTO `pms_system_log` VALUES (2140, '用户登录，编号：[119]', 0, NULL, '2018-01-23 18:19:25');
INSERT INTO `pms_system_log` VALUES (2141, '用户登录，编号：[26]', 0, NULL, '2018-01-23 19:37:04');
INSERT INTO `pms_system_log` VALUES (2142, '用户登录，编号：[119]', 0, NULL, '2018-01-23 22:39:46');
INSERT INTO `pms_system_log` VALUES (2143, '用户登录，编号：[26]', 0, NULL, '2018-01-23 22:40:53');
INSERT INTO `pms_system_log` VALUES (2144, '修改团队状态，编号：[0]，状态：[0]', 119, NULL, '2018-01-23 22:42:22');
INSERT INTO `pms_system_log` VALUES (2145, '修改团队状态，编号：[0]，状态：[1]', 119, NULL, '2018-01-23 22:42:23');
INSERT INTO `pms_system_log` VALUES (2146, '用户登录，编号：[119]', 0, NULL, '2018-01-24 00:26:55');
INSERT INTO `pms_system_log` VALUES (2147, '用户登录，编号：[119]', 0, NULL, '2018-01-24 08:23:52');
INSERT INTO `pms_system_log` VALUES (2148, '用户登录，编号：[119]', 0, NULL, '2018-01-24 09:22:06');
INSERT INTO `pms_system_log` VALUES (2149, '用户登录，编号：[119]', 119, NULL, '2018-01-24 09:23:04');
INSERT INTO `pms_system_log` VALUES (2150, '用户登录，编号：[119]', 0, NULL, '2018-01-24 09:26:16');
INSERT INTO `pms_system_log` VALUES (2151, '肖旺 加入了 技术部', 119, NULL, '2018-01-24 09:30:08');
INSERT INTO `pms_system_log` VALUES (2152, '晓铭 加入了 技术部', 119, NULL, '2018-01-24 09:30:10');
INSERT INTO `pms_system_log` VALUES (2153, '李维斯 加入了 技术部', 119, NULL, '2018-01-24 09:30:14');
INSERT INTO `pms_system_log` VALUES (2154, '用户登录，编号：[119]', 0, NULL, '2018-01-24 10:18:00');
INSERT INTO `pms_system_log` VALUES (2155, '用户登录，编号：[119]', 0, NULL, '2018-01-24 11:10:02');
INSERT INTO `pms_system_log` VALUES (2156, '用户登录，编号：[119]', 119, NULL, '2018-01-24 11:10:56');
INSERT INTO `pms_system_log` VALUES (2157, '用户登录，编号：[119]', 119, NULL, '2018-01-24 11:10:57');
INSERT INTO `pms_system_log` VALUES (2158, '用户登录，编号：[119]', 119, NULL, '2018-01-24 11:11:02');
INSERT INTO `pms_system_log` VALUES (2159, '用户登录，编号：[119]', 119, NULL, '2018-01-24 11:11:21');
INSERT INTO `pms_system_log` VALUES (2160, '用户登录，编号：[119]', 0, NULL, '2018-01-24 11:18:58');
INSERT INTO `pms_system_log` VALUES (2161, '用户登录，编号：[119]', 0, NULL, '2018-01-24 11:44:44');
INSERT INTO `pms_system_log` VALUES (2162, '用户登录，编号：[119]', 0, NULL, '2018-01-24 13:30:47');
INSERT INTO `pms_system_log` VALUES (2163, '用户登录，编号：[119]', 0, NULL, '2018-01-24 13:52:52');
INSERT INTO `pms_system_log` VALUES (2164, '用户登录，编号：[119]', 0, NULL, '2018-01-24 13:59:10');
INSERT INTO `pms_system_log` VALUES (2165, '用户登录，编号：[119]', 0, NULL, '2018-01-24 14:12:59');
INSERT INTO `pms_system_log` VALUES (2166, '用户登录，编号：[119]', 119, NULL, '2018-01-24 14:13:00');
INSERT INTO `pms_system_log` VALUES (2167, '上传头像，编号：119', 119, NULL, '2018-01-24 14:13:35');
INSERT INTO `pms_system_log` VALUES (2168, '用户登录，编号：[119]', 0, NULL, '2018-01-24 14:44:06');
INSERT INTO `pms_system_log` VALUES (2169, '用户登录，编号：[119]', 119, NULL, '2018-01-24 14:44:07');
INSERT INTO `pms_system_log` VALUES (2170, '用户登录，编号：[119]', 0, NULL, '2018-01-24 14:50:11');
INSERT INTO `pms_system_log` VALUES (2171, '用户登录，编号：[119]', 119, NULL, '2018-01-24 14:50:12');
INSERT INTO `pms_system_log` VALUES (2172, '用户登录，编号：[119]', 119, NULL, '2018-01-24 14:51:27');
INSERT INTO `pms_system_log` VALUES (2173, '用户登录，编号：[119]', 119, NULL, '2018-01-24 14:53:29');
INSERT INTO `pms_system_log` VALUES (2174, '用户登录，编号：[119]', 0, NULL, '2018-01-24 14:56:09');
INSERT INTO `pms_system_log` VALUES (2175, '用户登录，编号：[119]', 0, NULL, '2018-01-24 15:31:06');
INSERT INTO `pms_system_log` VALUES (2176, '用户登录，编号：[119]', 119, NULL, '2018-01-24 15:31:11');
INSERT INTO `pms_system_log` VALUES (2177, '用户登录，编号：[119]', 0, NULL, '2018-01-24 15:42:27');
INSERT INTO `pms_system_log` VALUES (2178, '将 李维斯 从 开发三部 移除', 26, NULL, '2018-01-24 16:00:46');
INSERT INTO `pms_system_log` VALUES (2179, '将 晓铭 从 开发三部 移除', 26, NULL, '2018-01-24 16:00:47');
INSERT INTO `pms_system_log` VALUES (2180, '编辑用户组，编号：[8]', 26, NULL, '2018-01-24 16:03:19');
INSERT INTO `pms_system_log` VALUES (2181, '编辑用户组，编号：[8]', 26, NULL, '2018-01-24 16:03:52');
INSERT INTO `pms_system_log` VALUES (2182, '编辑用户组，编号：[7]', 26, NULL, '2018-01-24 16:04:00');
INSERT INTO `pms_system_log` VALUES (2183, '用户登录，编号：[119]', 0, NULL, '2018-01-24 16:47:18');
INSERT INTO `pms_system_log` VALUES (2184, '用户登录，编号：[119]', 0, NULL, '2018-01-24 16:56:26');
INSERT INTO `pms_system_log` VALUES (2185, '用户登录，编号：[119]', 0, NULL, '2018-01-24 16:56:31');
INSERT INTO `pms_system_log` VALUES (2186, '用户登录，编号：[119]', 0, NULL, '2018-01-24 16:56:33');
INSERT INTO `pms_system_log` VALUES (2187, '用户登录，编号：[119]', 0, NULL, '2018-01-24 16:56:34');
INSERT INTO `pms_system_log` VALUES (2188, '用户登录，编号：[119]', 0, NULL, '2018-01-24 16:56:34');
INSERT INTO `pms_system_log` VALUES (2189, '用户登录，编号：[119]', 0, NULL, '2018-01-24 16:56:34');
INSERT INTO `pms_system_log` VALUES (2190, '用户登录，编号：[119]', 0, NULL, '2018-01-24 16:56:35');
INSERT INTO `pms_system_log` VALUES (2191, '用户登录，编号：[119]', 0, NULL, '2018-01-24 16:56:35');
INSERT INTO `pms_system_log` VALUES (2192, '用户登录，编号：[119]', 0, NULL, '2018-01-24 16:56:35');
INSERT INTO `pms_system_log` VALUES (2193, '用户登录，编号：[119]', 0, NULL, '2018-01-24 16:56:36');
INSERT INTO `pms_system_log` VALUES (2194, '用户登录，编号：[119]', 0, NULL, '2018-01-24 16:56:36');
INSERT INTO `pms_system_log` VALUES (2195, '用户登录，编号：[119]', 0, NULL, '2018-01-24 16:56:36');
INSERT INTO `pms_system_log` VALUES (2196, '用户登录，编号：[119]', 0, NULL, '2018-01-24 16:56:36');
INSERT INTO `pms_system_log` VALUES (2197, '用户登录，编号：[119]', 0, NULL, '2018-01-24 16:56:37');
INSERT INTO `pms_system_log` VALUES (2198, '用户登录，编号：[119]', 0, NULL, '2018-01-24 16:56:43');
INSERT INTO `pms_system_log` VALUES (2199, '用户登录，编号：[119]', 0, NULL, '2018-01-24 16:56:44');
INSERT INTO `pms_system_log` VALUES (2200, '用户登录，编号：[119]', 0, NULL, '2018-01-24 16:56:44');
INSERT INTO `pms_system_log` VALUES (2201, '用户登录，编号：[119]', 0, NULL, '2018-01-24 16:56:44');
INSERT INTO `pms_system_log` VALUES (2202, '用户登录，编号：[119]', 0, NULL, '2018-01-24 16:56:44');
INSERT INTO `pms_system_log` VALUES (2203, '用户登录，编号：[119]', 0, NULL, '2018-01-24 16:56:45');
INSERT INTO `pms_system_log` VALUES (2204, '用户登录，编号：[119]', 0, NULL, '2018-01-24 17:18:16');
INSERT INTO `pms_system_log` VALUES (2205, '用户登录，编号：[119]', 0, NULL, '2018-01-24 17:18:17');
INSERT INTO `pms_system_log` VALUES (2206, '用户登录，编号：[119]', 119, NULL, '2018-01-24 17:18:21');
INSERT INTO `pms_system_log` VALUES (2207, '用户登录，编号：[119]', 0, NULL, '2018-01-24 17:18:30');
INSERT INTO `pms_system_log` VALUES (2208, '用户登录，编号：[119]', 0, NULL, '2018-01-24 17:18:45');
INSERT INTO `pms_system_log` VALUES (2209, '用户登录，编号：[119]', 0, NULL, '2018-01-24 17:19:01');
INSERT INTO `pms_system_log` VALUES (2210, '用户登录，编号：[119]', 119, NULL, '2018-01-24 17:19:03');
INSERT INTO `pms_system_log` VALUES (2211, '用户登录，编号：[119]', 119, NULL, '2018-01-24 17:19:04');
INSERT INTO `pms_system_log` VALUES (2212, '用户登录，编号：[119]', 119, NULL, '2018-01-24 17:19:05');
INSERT INTO `pms_system_log` VALUES (2213, '用户登录，编号：[119]', 119, NULL, '2018-01-24 17:19:06');
INSERT INTO `pms_system_log` VALUES (2214, '用户登录，编号：[119]', 0, NULL, '2018-01-24 17:19:16');
INSERT INTO `pms_system_log` VALUES (2215, '用户登录，编号：[119]', 119, NULL, '2018-01-24 17:19:28');
INSERT INTO `pms_system_log` VALUES (2216, '用户登录，编号：[119]', 119, NULL, '2018-01-24 17:19:29');
INSERT INTO `pms_system_log` VALUES (2217, '用户登录，编号：[119]', 119, NULL, '2018-01-24 17:19:30');
INSERT INTO `pms_system_log` VALUES (2218, '用户登录，编号：[119]', 0, NULL, '2018-01-24 17:19:41');
INSERT INTO `pms_system_log` VALUES (2219, '用户登录，编号：[119]', 119, NULL, '2018-01-24 17:19:43');
INSERT INTO `pms_system_log` VALUES (2220, '修改团队状态，编号：[0]，状态：[0]', 119, NULL, '2018-01-24 17:19:52');
INSERT INTO `pms_system_log` VALUES (2221, '用户登录，编号：[119]', 0, NULL, '2018-01-24 17:20:00');
INSERT INTO `pms_system_log` VALUES (2222, '用户登录，编号：[119]', 119, NULL, '2018-01-24 17:20:09');
INSERT INTO `pms_system_log` VALUES (2223, '用户登录，编号：[119]', 119, NULL, '2018-01-24 17:20:12');
INSERT INTO `pms_system_log` VALUES (2224, '用户登录，编号：[119]', 119, NULL, '2018-01-24 17:20:12');
INSERT INTO `pms_system_log` VALUES (2225, '用户登录，编号：[119]', 119, NULL, '2018-01-24 17:20:12');
INSERT INTO `pms_system_log` VALUES (2226, '用户登录，编号：[119]', 119, NULL, '2018-01-24 17:20:13');
INSERT INTO `pms_system_log` VALUES (2227, '用户登录，编号：[119]', 0, NULL, '2018-01-24 17:20:20');
INSERT INTO `pms_system_log` VALUES (2228, '用户登录，编号：[119]', 119, NULL, '2018-01-24 17:20:21');
INSERT INTO `pms_system_log` VALUES (2229, '用户登录，编号：[119]', 119, NULL, '2018-01-24 17:20:22');
INSERT INTO `pms_system_log` VALUES (2230, '用户登录，编号：[119]', 119, NULL, '2018-01-24 17:20:22');
INSERT INTO `pms_system_log` VALUES (2231, '用户登录，编号：[119]', 119, NULL, '2018-01-24 17:20:23');
INSERT INTO `pms_system_log` VALUES (2232, '用户登录，编号：[119]', 0, NULL, '2018-01-24 17:20:26');
INSERT INTO `pms_system_log` VALUES (2233, '用户登录，编号：[119]', 119, NULL, '2018-01-24 17:20:31');
INSERT INTO `pms_system_log` VALUES (2234, '用户登录，编号：[119]', 119, NULL, '2018-01-24 17:20:32');
INSERT INTO `pms_system_log` VALUES (2235, '用户登录，编号：[119]', 119, NULL, '2018-01-24 17:20:32');
INSERT INTO `pms_system_log` VALUES (2236, '用户登录，编号：[119]', 119, NULL, '2018-01-24 17:20:33');
INSERT INTO `pms_system_log` VALUES (2237, '用户登录，编号：[119]', 119, NULL, '2018-01-24 17:20:33');
INSERT INTO `pms_system_log` VALUES (2238, '用户登录，编号：[119]', 119, NULL, '2018-01-24 17:20:33');
INSERT INTO `pms_system_log` VALUES (2239, '用户登录，编号：[119]', 119, NULL, '2018-01-24 17:20:34');
INSERT INTO `pms_system_log` VALUES (2240, '用户登录，编号：[119]', 119, NULL, '2018-01-24 17:20:34');
INSERT INTO `pms_system_log` VALUES (2241, '用户登录，编号：[119]', 119, NULL, '2018-01-24 17:20:35');
INSERT INTO `pms_system_log` VALUES (2242, '用户登录，编号：[119]', 0, NULL, '2018-01-24 17:20:45');
INSERT INTO `pms_system_log` VALUES (2243, '用户登录，编号：[119]', 0, NULL, '2018-01-24 17:20:57');
INSERT INTO `pms_system_log` VALUES (2244, '用户登录，编号：[119]', 0, NULL, '2018-01-24 17:21:06');
INSERT INTO `pms_system_log` VALUES (2245, '用户登录，编号：[119]', 0, NULL, '2018-01-24 17:21:23');
INSERT INTO `pms_system_log` VALUES (2246, '用户登录，编号：[119]', 0, NULL, '2018-01-24 17:21:27');
INSERT INTO `pms_system_log` VALUES (2247, '用户登录，编号：[119]', 0, NULL, '2018-01-24 17:22:17');
INSERT INTO `pms_system_log` VALUES (2248, '修改团队状态，编号：[0]，状态：[0]', 119, NULL, '2018-01-24 17:22:18');
INSERT INTO `pms_system_log` VALUES (2249, '修改团队状态，编号：[0]，状态：[1]', 119, NULL, '2018-01-24 17:22:19');
INSERT INTO `pms_system_log` VALUES (2250, '修改团队状态，编号：[0]，状态：[0]', 119, NULL, '2018-01-24 17:22:20');
INSERT INTO `pms_system_log` VALUES (2251, '用户登录，编号：[119]', 0, NULL, '2018-01-24 17:22:44');
INSERT INTO `pms_system_log` VALUES (2252, '用户登录，编号：[119]', 0, NULL, '2018-01-24 17:22:45');
INSERT INTO `pms_system_log` VALUES (2253, '用户登录，编号：[119]', 0, NULL, '2018-01-24 17:22:46');
INSERT INTO `pms_system_log` VALUES (2254, '用户登录，编号：[119]', 119, NULL, '2018-01-24 17:22:48');
INSERT INTO `pms_system_log` VALUES (2255, '用户登录，编号：[119]', 119, NULL, '2018-01-24 17:22:49');
INSERT INTO `pms_system_log` VALUES (2256, '用户登录，编号：[119]', 119, NULL, '2018-01-24 17:22:58');
INSERT INTO `pms_system_log` VALUES (2257, '用户登录，编号：[119]', 119, NULL, '2018-01-24 17:22:59');
INSERT INTO `pms_system_log` VALUES (2258, '用户登录，编号：[119]', 0, NULL, '2018-01-24 17:23:28');
INSERT INTO `pms_system_log` VALUES (2259, '用户登录，编号：[119]', 0, NULL, '2018-01-24 17:23:39');
INSERT INTO `pms_system_log` VALUES (2260, '用户登录，编号：[119]', 0, NULL, '2018-01-24 17:23:43');
INSERT INTO `pms_system_log` VALUES (2261, '用户登录，编号：[119]', 0, NULL, '2018-01-24 17:24:44');
INSERT INTO `pms_system_log` VALUES (2262, '用户登录，编号：[119]', 0, NULL, '2018-01-24 17:24:48');
INSERT INTO `pms_system_log` VALUES (2263, '用户登录，编号：[119]', 0, NULL, '2018-01-24 17:24:48');
INSERT INTO `pms_system_log` VALUES (2264, '用户登录，编号：[119]', 119, NULL, '2018-01-24 17:24:52');
INSERT INTO `pms_system_log` VALUES (2265, '上传头像，编号：119', 119, NULL, '2018-01-24 17:24:57');
INSERT INTO `pms_system_log` VALUES (2266, '用户登录，编号：[119]', 119, NULL, '2018-01-24 17:25:01');
INSERT INTO `pms_system_log` VALUES (2267, '用户登录，编号：[119]', 119, NULL, '2018-01-24 17:25:08');
INSERT INTO `pms_system_log` VALUES (2268, '用户登录，编号：[119]', 0, NULL, '2018-01-24 17:25:40');
INSERT INTO `pms_system_log` VALUES (2269, '用户登录，编号：[119]', 0, NULL, '2018-01-24 17:25:43');
INSERT INTO `pms_system_log` VALUES (2270, '用户登录，编号：[119]', 0, NULL, '2018-01-24 17:25:44');
INSERT INTO `pms_system_log` VALUES (2271, '用户登录，编号：[119]', 119, NULL, '2018-01-24 17:25:46');
INSERT INTO `pms_system_log` VALUES (2272, '用户登录，编号：[119]', 119, NULL, '2018-01-24 17:25:48');
INSERT INTO `pms_system_log` VALUES (2273, '用户登录，编号：[119]', 119, NULL, '2018-01-24 17:25:48');
INSERT INTO `pms_system_log` VALUES (2274, '用户登录，编号：[119]', 119, NULL, '2018-01-24 17:25:49');
INSERT INTO `pms_system_log` VALUES (2275, '用户登录，编号：[119]', 119, NULL, '2018-01-24 17:25:49');
INSERT INTO `pms_system_log` VALUES (2276, '用户登录，编号：[119]', 0, NULL, '2018-01-24 17:26:04');
INSERT INTO `pms_system_log` VALUES (2277, '用户登录，编号：[119]', 119, NULL, '2018-01-24 17:26:07');
INSERT INTO `pms_system_log` VALUES (2278, '用户登录，编号：[119]', 119, NULL, '2018-01-24 17:26:08');
INSERT INTO `pms_system_log` VALUES (2279, '用户登录，编号：[119]', 119, NULL, '2018-01-25 08:51:46');
INSERT INTO `pms_system_log` VALUES (2280, '用户登录，编号：[26]', 119, NULL, '2018-01-25 08:51:59');
INSERT INTO `pms_system_log` VALUES (2281, '用户登录，编号：[119]', 26, NULL, '2018-01-25 09:00:33');
INSERT INTO `pms_system_log` VALUES (2282, '上传头像，编号：119', 119, NULL, '2018-01-25 09:00:50');
INSERT INTO `pms_system_log` VALUES (2283, '上传头像，编号：119', 119, NULL, '2018-01-25 09:01:37');
INSERT INTO `pms_system_log` VALUES (2284, '用户登录，编号：[119]', 0, NULL, '2018-01-25 09:12:25');
INSERT INTO `pms_system_log` VALUES (2285, '用户登录，编号：[119]', 0, NULL, '2018-01-25 09:21:47');
INSERT INTO `pms_system_log` VALUES (2286, '用户登录，编号：[119]', 119, NULL, '2018-01-25 09:21:53');
INSERT INTO `pms_system_log` VALUES (2287, '移除用户所属用户组，用户编号[26]，用户组编号[7]', 119, NULL, '2018-01-25 09:24:05');
INSERT INTO `pms_system_log` VALUES (2288, '用户登录，编号：[119]', 0, NULL, '2018-01-25 09:24:49');
INSERT INTO `pms_system_log` VALUES (2289, '用户登录，编号：[119]', 0, NULL, '2018-01-25 09:34:07');
INSERT INTO `pms_system_log` VALUES (2290, '用户登录，编号：[119]', 119, NULL, '2018-01-25 09:34:54');
INSERT INTO `pms_system_log` VALUES (2291, '用户登录，编号：[119]', 0, NULL, '2018-01-25 09:38:32');
INSERT INTO `pms_system_log` VALUES (2292, '用户登录，编号：[119]', 0, NULL, '2018-01-25 09:43:17');
INSERT INTO `pms_system_log` VALUES (2293, '用户登录，编号：[119]', 0, NULL, '2018-01-25 09:44:20');
INSERT INTO `pms_system_log` VALUES (2294, '用户登录，编号：[119]', 119, NULL, '2018-01-25 09:44:24');
INSERT INTO `pms_system_log` VALUES (2295, '用户登录，编号：[119]', 0, NULL, '2018-01-25 09:54:14');
INSERT INTO `pms_system_log` VALUES (2296, '用户登录，编号：[119]', 119, NULL, '2018-01-25 09:54:18');
INSERT INTO `pms_system_log` VALUES (2297, '用户登录，编号：[119]', 119, NULL, '2018-01-25 09:54:19');
INSERT INTO `pms_system_log` VALUES (2298, '用户登录，编号：[119]', 119, NULL, '2018-01-25 09:54:20');
INSERT INTO `pms_system_log` VALUES (2299, '用户登录，编号：[119]', 119, NULL, '2018-01-25 09:54:20');
INSERT INTO `pms_system_log` VALUES (2300, '用户登录，编号：[119]', 119, NULL, '2018-01-25 09:54:20');
INSERT INTO `pms_system_log` VALUES (2301, '用户登录，编号：[119]', 119, NULL, '2018-01-25 09:54:20');
INSERT INTO `pms_system_log` VALUES (2302, '用户登录，编号：[119]', 119, NULL, '2018-01-25 09:54:20');
INSERT INTO `pms_system_log` VALUES (2303, '用户登录，编号：[119]', 119, NULL, '2018-01-25 09:54:21');
INSERT INTO `pms_system_log` VALUES (2304, '用户登录，编号：[119]', 119, NULL, '2018-01-25 09:54:22');
INSERT INTO `pms_system_log` VALUES (2305, '用户登录，编号：[119]', 119, NULL, '2018-01-25 09:54:22');
INSERT INTO `pms_system_log` VALUES (2306, '用户登录，编号：[119]', 119, NULL, '2018-01-25 09:54:22');
INSERT INTO `pms_system_log` VALUES (2307, '用户登录，编号：[119]', 119, NULL, '2018-01-25 09:54:22');
INSERT INTO `pms_system_log` VALUES (2308, '用户登录，编号：[119]', 0, NULL, '2018-01-25 10:00:00');
INSERT INTO `pms_system_log` VALUES (2309, '用户登录，编号：[119]', 0, NULL, '2018-01-25 10:10:46');
INSERT INTO `pms_system_log` VALUES (2310, '用户登录，编号：[26]', 119, NULL, '2018-01-25 10:17:34');
INSERT INTO `pms_system_log` VALUES (2311, '用户登录，编号：[26]', 26, NULL, '2018-01-25 10:17:39');
INSERT INTO `pms_system_log` VALUES (2312, '用户登录，编号：[119]', 0, NULL, '2018-01-25 10:19:43');
INSERT INTO `pms_system_log` VALUES (2313, '用户登录，编号：[26]', 26, NULL, '2018-01-25 10:20:31');
INSERT INTO `pms_system_log` VALUES (2314, '编辑用户组，编号：[8]', 26, NULL, '2018-01-25 10:21:37');
INSERT INTO `pms_system_log` VALUES (2315, '编辑用户组，编号：[3]', 0, NULL, '2018-01-25 10:31:54');
INSERT INTO `pms_system_log` VALUES (2316, '编辑用户组，编号：[1]', 26, NULL, '2018-01-25 10:32:12');
INSERT INTO `pms_system_log` VALUES (2317, '设置 技术部 负责人为 ', 119, NULL, '2018-01-25 10:33:45');
INSERT INTO `pms_system_log` VALUES (2318, '取消 技术部  负责人身份', 119, NULL, '2018-01-25 10:33:47');
INSERT INTO `pms_system_log` VALUES (2319, '用户登录，编号：[119]', 26, NULL, '2018-01-25 10:34:51');
INSERT INTO `pms_system_log` VALUES (2320, '用户登录，编号：[120]', 119, NULL, '2018-01-25 10:35:15');
INSERT INTO `pms_system_log` VALUES (2321, '用户登录，编号：[26]', 120, NULL, '2018-01-25 10:35:56');
INSERT INTO `pms_system_log` VALUES (2322, '用户登录，编号：[119]', 124, NULL, '2018-02-25 08:56:18');
INSERT INTO `pms_system_log` VALUES (2323, '用户登录，编号：[119]', 0, NULL, '2018-02-25 13:41:11');
INSERT INTO `pms_system_log` VALUES (2324, '用户登录，编号：[119]', 119, NULL, '2018-02-25 13:50:13');
INSERT INTO `pms_system_log` VALUES (2325, '用户登录，编号：[119]', 0, NULL, '2018-02-25 14:35:39');
INSERT INTO `pms_system_log` VALUES (2326, '用户登录，编号：[119]', 119, NULL, '2018-02-25 14:36:46');
INSERT INTO `pms_system_log` VALUES (2327, '用户登录，编号：[119]', 0, NULL, '2018-02-25 15:27:49');
INSERT INTO `pms_system_log` VALUES (2328, '将 肖旺 从 技术部 移除', 119, NULL, '2018-02-25 15:28:24');
INSERT INTO `pms_system_log` VALUES (2329, '肖旺 加入了 技术部', 119, NULL, '2018-02-25 15:28:27');
INSERT INTO `pms_system_log` VALUES (2330, '设置 技术部 负责人为 ', 119, NULL, '2018-02-25 15:28:35');
INSERT INTO `pms_system_log` VALUES (2331, '取消 技术部  负责人身份', 119, NULL, '2018-02-25 15:28:37');
INSERT INTO `pms_system_log` VALUES (2332, '设置 技术部 负责人为 ', 119, NULL, '2018-02-25 15:28:38');
INSERT INTO `pms_system_log` VALUES (2333, '用户登录，编号：[119]', 0, NULL, '2018-02-25 15:50:29');
INSERT INTO `pms_system_log` VALUES (2334, '用户登录，编号：[119]', 0, NULL, '2018-02-25 16:23:14');
INSERT INTO `pms_system_log` VALUES (2335, '取消 技术部  负责人身份', 119, NULL, '2018-02-25 16:30:01');
INSERT INTO `pms_system_log` VALUES (2336, '设置 技术部 负责人为 ', 119, NULL, '2018-02-25 16:30:02');
INSERT INTO `pms_system_log` VALUES (2337, '取消 技术部  负责人身份', 119, NULL, '2018-02-25 16:30:03');
INSERT INTO `pms_system_log` VALUES (2338, '设置 技术部 负责人为 ', 119, NULL, '2018-02-25 16:30:04');
INSERT INTO `pms_system_log` VALUES (2339, '取消 技术部  负责人身份', 119, NULL, '2018-02-25 16:30:05');
INSERT INTO `pms_system_log` VALUES (2340, '设置 技术部 负责人为 ', 119, NULL, '2018-02-25 16:30:06');
INSERT INTO `pms_system_log` VALUES (2341, '用户登录，编号：[119]', 0, NULL, '2018-02-25 16:54:46');
INSERT INTO `pms_system_log` VALUES (2342, '用户登录，编号：[119]', 0, NULL, '2018-02-25 17:14:29');
INSERT INTO `pms_system_log` VALUES (2343, '修改团队状态，编号：[0]，状态：[0]', 119, NULL, '2018-02-25 17:19:33');
INSERT INTO `pms_system_log` VALUES (2344, '修改团队状态，编号：[0]，状态：[1]', 119, NULL, '2018-02-25 17:19:34');
INSERT INTO `pms_system_log` VALUES (2345, '修改团队状态，编号：[0]，状态：[0]', 119, NULL, '2018-02-25 17:19:34');
INSERT INTO `pms_system_log` VALUES (2346, '修改团队状态，编号：[0]，状态：[1]', 119, NULL, '2018-02-25 17:19:34');
INSERT INTO `pms_system_log` VALUES (2347, '修改团队状态，编号：[0]，状态：[0]', 119, NULL, '2018-02-25 17:19:34');
INSERT INTO `pms_system_log` VALUES (2348, '修改团队状态，编号：[0]，状态：[1]', 119, NULL, '2018-02-25 17:19:35');
INSERT INTO `pms_system_log` VALUES (2349, '用户登录，编号：[119]', 0, NULL, '2018-02-25 17:24:51');
INSERT INTO `pms_system_log` VALUES (2350, '用户登录，编号：[119]', 0, NULL, '2018-02-25 20:19:46');
INSERT INTO `pms_system_log` VALUES (2351, '用户登录，编号：[119]', 0, NULL, '2018-02-25 21:05:11');
INSERT INTO `pms_system_log` VALUES (2352, '用户登录，编号：[119]', 0, NULL, '2018-02-26 08:48:58');
INSERT INTO `pms_system_log` VALUES (2353, '用户登录，编号：[119]', 0, NULL, '2018-02-26 09:13:11');
INSERT INTO `pms_system_log` VALUES (2354, '用户登录，编号：[119]', 0, NULL, '2018-02-26 09:16:44');
INSERT INTO `pms_system_log` VALUES (2355, '用户登录，编号：[119]', 119, NULL, '2018-02-26 09:16:46');
INSERT INTO `pms_system_log` VALUES (2356, '用户登录，编号：[119]', 119, NULL, '2018-02-26 09:16:50');
INSERT INTO `pms_system_log` VALUES (2357, '用户登录，编号：[119]', 0, NULL, '2018-02-26 09:21:36');
INSERT INTO `pms_system_log` VALUES (2358, '用户登录，编号：[119]', 0, NULL, '2018-02-26 09:25:42');
INSERT INTO `pms_system_log` VALUES (2359, '用户登录，编号：[119]', 119, NULL, '2018-02-26 09:28:20');
INSERT INTO `pms_system_log` VALUES (2360, '用户登录，编号：[119]', 0, NULL, '2018-02-26 09:30:15');
INSERT INTO `pms_system_log` VALUES (2361, '用户登录，编号：[119]', 0, NULL, '2018-02-26 09:33:23');
INSERT INTO `pms_system_log` VALUES (2362, '用户登录，编号：[119]', 0, NULL, '2018-02-26 09:37:39');
INSERT INTO `pms_system_log` VALUES (2363, '用户登录，编号：[119]', 0, NULL, '2018-02-26 09:54:01');
INSERT INTO `pms_system_log` VALUES (2364, '用户登录，编号：[119]', 0, NULL, '2018-02-26 10:01:21');
INSERT INTO `pms_system_log` VALUES (2365, '用户登录，编号：[119]', 0, NULL, '2018-02-26 10:27:40');
INSERT INTO `pms_system_log` VALUES (2366, '用户登录，编号：[119]', 0, NULL, '2018-02-26 10:31:37');
INSERT INTO `pms_system_log` VALUES (2367, '用户登录，编号：[119]', 0, NULL, '2018-02-26 10:35:48');
INSERT INTO `pms_system_log` VALUES (2368, '用户登录，编号：[119]', 0, NULL, '2018-02-26 10:40:04');
INSERT INTO `pms_system_log` VALUES (2369, '用户登录，编号：[119]', 0, NULL, '2018-02-26 10:40:18');
INSERT INTO `pms_system_log` VALUES (2370, '用户登录，编号：[119]', 119, NULL, '2018-02-26 10:40:54');
INSERT INTO `pms_system_log` VALUES (2371, '用户登录，编号：[119]', 0, NULL, '2018-02-26 10:42:53');
INSERT INTO `pms_system_log` VALUES (2372, '修改团队状态，编号：[0]，状态：[0]', 119, NULL, '2018-02-26 10:43:04');
INSERT INTO `pms_system_log` VALUES (2373, '修改团队状态，编号：[0]，状态：[1]', 119, NULL, '2018-02-26 10:43:05');
INSERT INTO `pms_system_log` VALUES (2374, '用户登录，编号：[119]', 119, NULL, '2018-02-26 10:51:06');
INSERT INTO `pms_system_log` VALUES (2375, '用户登录，编号：[119]', 0, NULL, '2018-02-26 10:54:38');
INSERT INTO `pms_system_log` VALUES (2376, '用户登录，编号：[119]', 0, NULL, '2018-02-26 10:57:14');
INSERT INTO `pms_system_log` VALUES (2377, '用户登录，编号：[119]', 0, NULL, '2018-02-26 10:58:53');
INSERT INTO `pms_system_log` VALUES (2378, '用户登录，编号：[119]', 0, NULL, '2018-02-26 11:00:25');
INSERT INTO `pms_system_log` VALUES (2379, '用户登录，编号：[119]', 0, NULL, '2018-02-26 11:08:18');
INSERT INTO `pms_system_log` VALUES (2380, '修改团队状态，编号：[0]，状态：[0]', 119, NULL, '2018-02-26 11:09:04');
INSERT INTO `pms_system_log` VALUES (2381, '修改团队状态，编号：[0]，状态：[1]', 119, NULL, '2018-02-26 11:09:06');
INSERT INTO `pms_system_log` VALUES (2382, '用户登录，编号：[119]', 0, NULL, '2018-02-26 11:12:21');
INSERT INTO `pms_system_log` VALUES (2383, '用户登录，编号：[26]', 119, NULL, '2018-02-26 11:12:44');
INSERT INTO `pms_system_log` VALUES (2384, '用户登录，编号：[119]', 0, NULL, '2018-02-26 11:12:45');
INSERT INTO `pms_system_log` VALUES (2385, '编辑用户组，编号：[7]', 26, NULL, '2018-02-26 11:13:58');
INSERT INTO `pms_system_log` VALUES (2386, '编辑用户组，编号：[7]', 26, NULL, '2018-02-26 11:16:50');
INSERT INTO `pms_system_log` VALUES (2387, '编辑用户组，编号：[7]', 26, NULL, '2018-02-26 11:17:40');
INSERT INTO `pms_system_log` VALUES (2388, '用户登录，编号：[119]', 26, NULL, '2018-02-26 11:19:12');
INSERT INTO `pms_system_log` VALUES (2389, '用户登录，编号：[26]', 119, NULL, '2018-02-26 11:21:16');
INSERT INTO `pms_system_log` VALUES (2390, '用户登录，编号：[26]', 26, NULL, '2018-02-26 16:46:48');
INSERT INTO `pms_system_log` VALUES (2391, '新增用户，编号：121', 26, NULL, '2018-02-26 16:57:08');
INSERT INTO `pms_system_log` VALUES (2392, '新增用户，编号：122', 26, NULL, '2018-02-26 16:57:31');
INSERT INTO `pms_system_log` VALUES (2393, '新增用户，编号：123', 26, NULL, '2018-02-26 16:57:49');
INSERT INTO `pms_system_log` VALUES (2394, '新增用户，编号：124', 26, NULL, '2018-02-26 16:58:14');
INSERT INTO `pms_system_log` VALUES (2395, '何宛 加入了 技术部', 26, NULL, '2018-02-26 17:00:01');
INSERT INTO `pms_system_log` VALUES (2396, '方明 加入了 技术部', 26, NULL, '2018-02-26 17:00:02');
INSERT INTO `pms_system_log` VALUES (2397, '晓晨 加入了 技术部', 26, NULL, '2018-02-26 17:00:02');
INSERT INTO `pms_system_log` VALUES (2398, '小芳 加入了 技术部', 26, NULL, '2018-02-26 17:00:02');
INSERT INTO `pms_system_log` VALUES (2399, '用户登录，编号：[26]', 26, NULL, '2018-02-26 17:01:43');
INSERT INTO `pms_system_log` VALUES (2400, '编辑用户组，编号：[8]', 26, NULL, '2018-02-26 17:02:13');
INSERT INTO `pms_system_log` VALUES (2401, '用户登录，编号：[119]', 26, NULL, '2018-02-26 17:02:45');
INSERT INTO `pms_system_log` VALUES (2402, '用户登录，编号：[26]', 26, 'User_User.Login', '2018-04-10 15:42:26');
INSERT INTO `pms_system_log` VALUES (2403, '用户登录，编号：[26]', 26, 'User_User.Login', '2018-04-11 16:48:42');
INSERT INTO `pms_system_log` VALUES (2404, '用户登录，编号：[26]', 0, 'User_User.Login', '2018-04-11 17:25:06');
INSERT INTO `pms_system_log` VALUES (2405, '用户登录，编号：[26]', 26, 'User_User.Login', '2018-04-14 15:42:01');
INSERT INTO `pms_system_log` VALUES (2406, '编辑用户组，编号：[7]', 26, 'System_AuthGroup.editGroup', '2018-04-14 16:50:47');
INSERT INTO `pms_system_log` VALUES (2407, '用户登录，编号：[26]', 0, 'User_User.Login', '2018-04-16 08:32:08');
INSERT INTO `pms_system_log` VALUES (2408, '用户登录，编号：[26]', 0, 'User_User.Login', '2018-04-19 15:53:10');
INSERT INTO `pms_system_log` VALUES (2409, '编辑用户组，编号：[7]', 26, 'System_AuthGroup.editGroup', '2018-04-19 18:17:47');
INSERT INTO `pms_system_log` VALUES (2410, '编辑用户组，编号：[7]', 26, 'System_AuthGroup.editGroup', '2018-04-20 11:05:04');
INSERT INTO `pms_system_log` VALUES (2411, '修改用户状态，编号：[124]，状态：[0]', 26, 'User_User.changeState', '2018-04-20 11:40:10');
INSERT INTO `pms_system_log` VALUES (2412, '修改用户状态，编号：[124]，状态：[1]', 26, 'User_User.changeState', '2018-04-20 11:40:12');
INSERT INTO `pms_system_log` VALUES (2413, '用户登录，编号：[26]', 26, 'User_User.Login', '2018-04-20 22:04:46');
INSERT INTO `pms_system_log` VALUES (2414, '用户登录，编号：[26]', 0, 'User_User.Login', '2018-04-22 09:15:30');
INSERT INTO `pms_system_log` VALUES (2415, '编辑用户组，编号：[8]', 26, 'System_AuthGroup.editGroup', '2018-04-22 10:19:32');
INSERT INTO `pms_system_log` VALUES (2416, '修改密码，编号：26', 26, 'User_User.changePassword', '2018-04-22 10:19:48');
INSERT INTO `pms_system_log` VALUES (2417, '用户登录，编号：[26]', 26, 'User_User.Login', '2018-04-22 10:20:08');
INSERT INTO `pms_system_log` VALUES (2418, '用户登录，编号：[26]', 0, 'User_User.Login', '2018-04-22 13:26:50');
INSERT INTO `pms_system_log` VALUES (2419, '编辑用户组，编号：[7]', 26, 'System_AuthGroup.editGroup', '2018-04-22 15:22:17');
INSERT INTO `pms_system_log` VALUES (2420, '编辑用户组，编号：[8]', 26, 'System_AuthGroup.editGroup', '2018-04-22 15:22:27');
INSERT INTO `pms_system_log` VALUES (2421, '编辑用户组，编号：[7]', 26, 'System_AuthGroup.editGroup', '2018-04-22 18:59:44');
INSERT INTO `pms_system_log` VALUES (2422, '编辑用户组，编号：[8]', 26, 'System_AuthGroup.editGroup', '2018-04-22 18:59:59');
INSERT INTO `pms_system_log` VALUES (2423, '编辑用户组，编号：[7]', 26, 'System_AuthGroup.editGroup', '2018-04-22 19:06:56');
INSERT INTO `pms_system_log` VALUES (2424, '编辑用户组，编号：[7]', 26, 'System_AuthGroup.editGroup', '2018-04-22 19:21:36');
INSERT INTO `pms_system_log` VALUES (2425, '新增项目类型，编号：3', 26, 'Project_ProjectType.addProjectType', '2018-04-22 19:28:08');
INSERT INTO `pms_system_log` VALUES (2426, '新增项目类型，编号：4', 26, 'Project_ProjectType.addProjectType', '2018-04-22 19:29:23');
INSERT INTO `pms_system_log` VALUES (2427, '删除项目项目类型，编号：[null]', 26, 'Project_ProjectType.delProjectType', '2018-04-22 19:30:13');
INSERT INTO `pms_system_log` VALUES (2428, '删除项目项目类型，编号：[\"4\"]', 26, 'Project_ProjectType.delProjectType', '2018-04-22 19:31:08');
INSERT INTO `pms_system_log` VALUES (2429, '用户登录，编号：[26]', 26, 'User_User.Login', '2018-04-29 15:00:32');
INSERT INTO `pms_system_log` VALUES (2430, '用户登录，编号：[26]', 0, 'User_User.Login', '2018-04-30 18:31:03');
INSERT INTO `pms_system_log` VALUES (2431, '新增项目类型，编号：6', 26, 'Project_ProjectType.addProjectType', '2018-04-30 21:05:12');
INSERT INTO `pms_system_log` VALUES (2432, '编辑用户组，编号：[7]', 26, 'System_AuthGroup.editGroup', '2018-04-30 21:10:43');
INSERT INTO `pms_system_log` VALUES (2433, '编辑用户组，编号：[8]', 26, 'System_AuthGroup.editGroup', '2018-04-30 21:11:10');
INSERT INTO `pms_system_log` VALUES (2434, '修改任务类型模板，评级ID：5', 26, 'Project_TaskTypeTemplate.editTaskTypeTemplate', '2018-04-30 21:20:57');
INSERT INTO `pms_system_log` VALUES (2435, '修改任务类型模板，评级ID：5', 26, 'Project_TaskTypeTemplate.editTaskTypeTemplate', '2018-04-30 21:21:01');
INSERT INTO `pms_system_log` VALUES (2436, '新增任务类型模板，编号：6', 26, 'Project_TaskTypeTemplate.addTaskTypeTemplate', '2018-04-30 21:21:05');
INSERT INTO `pms_system_log` VALUES (2437, '删除项目任务类型模板，编号：[\"6\"]', 26, 'Project_TaskTypeTemplate.delTaskTypeTemplate', '2018-04-30 21:21:09');
INSERT INTO `pms_system_log` VALUES (2438, '新增项目类型，编号：7', 26, 'Project_ProjectType.addProjectType', '2018-04-30 21:37:07');
INSERT INTO `pms_system_log` VALUES (2439, '删除项目项目类型，编号：[\"1\"]', 26, 'Project_ProjectType.delProjectType', '2018-04-30 21:37:52');
INSERT INTO `pms_system_log` VALUES (2440, '删除项目项目类型，编号：[\"2\"]', 26, 'Project_ProjectType.delProjectType', '2018-04-30 21:37:57');
INSERT INTO `pms_system_log` VALUES (2441, '新增项目类型，编号：8', 26, 'Project_ProjectType.addProjectType', '2018-04-30 21:38:03');
INSERT INTO `pms_system_log` VALUES (2442, '删除项目项目类型，编号：[\"3\"]', 26, 'Project_ProjectType.delProjectType', '2018-04-30 21:38:14');
INSERT INTO `pms_system_log` VALUES (2443, '新增项目类型，编号：9', 26, 'Project_ProjectType.addProjectType', '2018-04-30 21:38:18');
INSERT INTO `pms_system_log` VALUES (2444, '删除项目任务类型模板，编号：[\"8\",\"7\"]', 26, 'Project_TaskTypeTemplate.delTaskTypeTemplate', '2018-04-30 22:03:32');
INSERT INTO `pms_system_log` VALUES (2445, '修改任务类型模板，评级ID：11', 26, 'Project_TaskTypeTemplate.editTaskTypeTemplate', '2018-04-30 22:03:52');
INSERT INTO `pms_system_log` VALUES (2446, '修改任务类型模板，评级ID：10', 26, 'Project_TaskTypeTemplate.editTaskTypeTemplate', '2018-04-30 22:03:56');
INSERT INTO `pms_system_log` VALUES (2447, '修改任务类型模板，评级ID：9', 26, 'Project_TaskTypeTemplate.editTaskTypeTemplate', '2018-04-30 22:04:00');
INSERT INTO `pms_system_log` VALUES (2448, '修改任务类型模板，评级ID：11', 26, 'Project_TaskTypeTemplate.editTaskTypeTemplate', '2018-04-30 22:04:07');
INSERT INTO `pms_system_log` VALUES (2449, '修改任务类型模板，评级ID：10', 26, 'Project_TaskTypeTemplate.editTaskTypeTemplate', '2018-04-30 22:04:10');
INSERT INTO `pms_system_log` VALUES (2450, '用户登录，编号：[26]', 26, 'User_User.Login', '2018-04-30 22:04:47');
INSERT INTO `pms_system_log` VALUES (2451, '用户登录，编号：[26]', 26, 'User_User.Login', '2018-04-30 22:08:22');
INSERT INTO `pms_system_log` VALUES (2452, '新增项目类型，编号：10', 26, 'Project_ProjectType.addProjectType', '2018-04-30 22:13:35');
INSERT INTO `pms_system_log` VALUES (2453, '删除项目任务类型模板，编号：[\"23\",\"22\"]', 26, 'Project_TaskTypeTemplate.delTaskTypeTemplate', '2018-04-30 22:14:15');
INSERT INTO `pms_system_log` VALUES (2454, '修改任务类型模板，评级ID：26', 26, 'Project_TaskTypeTemplate.editTaskTypeTemplate', '2018-04-30 22:14:29');
INSERT INTO `pms_system_log` VALUES (2455, '修改任务类型模板，评级ID：25', 26, 'Project_TaskTypeTemplate.editTaskTypeTemplate', '2018-04-30 22:14:35');
INSERT INTO `pms_system_log` VALUES (2456, '修改任务类型模板，评级ID：26', 26, 'Project_TaskTypeTemplate.editTaskTypeTemplate', '2018-04-30 22:14:38');
INSERT INTO `pms_system_log` VALUES (2457, '修改任务类型模板，评级ID：24', 26, 'Project_TaskTypeTemplate.editTaskTypeTemplate', '2018-04-30 22:14:43');
INSERT INTO `pms_system_log` VALUES (2458, '新增项目类型，编号：11', 26, 'Project_ProjectType.addProjectType', '2018-04-30 22:15:10');
INSERT INTO `pms_system_log` VALUES (2459, '修改任务类型模板，评级ID：31', 26, 'Project_TaskTypeTemplate.editTaskTypeTemplate', '2018-04-30 22:15:27');
INSERT INTO `pms_system_log` VALUES (2460, '修改任务类型模板，评级ID：30', 26, 'Project_TaskTypeTemplate.editTaskTypeTemplate', '2018-04-30 22:15:36');
INSERT INTO `pms_system_log` VALUES (2461, '修改任务类型模板，评级ID：29', 26, 'Project_TaskTypeTemplate.editTaskTypeTemplate', '2018-04-30 22:15:43');
INSERT INTO `pms_system_log` VALUES (2462, '修改任务类型模板，评级ID：28', 26, 'Project_TaskTypeTemplate.editTaskTypeTemplate', '2018-04-30 22:15:51');
INSERT INTO `pms_system_log` VALUES (2463, '修改任务类型模板，评级ID：27', 26, 'Project_TaskTypeTemplate.editTaskTypeTemplate', '2018-04-30 22:16:00');
INSERT INTO `pms_system_log` VALUES (2464, '修改任务类型模板，评级ID：28', 26, 'Project_TaskTypeTemplate.editTaskTypeTemplate', '2018-04-30 22:16:05');
INSERT INTO `pms_system_log` VALUES (2465, '修改任务类型模板，评级ID：27', 26, 'Project_TaskTypeTemplate.editTaskTypeTemplate', '2018-04-30 22:16:07');
INSERT INTO `pms_system_log` VALUES (2466, '新增项目类型，编号：12', 26, 'Project_ProjectType.addProjectType', '2018-04-30 22:16:29');
INSERT INTO `pms_system_log` VALUES (2467, '修改任务类型模板，评级ID：36', 26, 'Project_TaskTypeTemplate.editTaskTypeTemplate', '2018-04-30 22:16:38');
INSERT INTO `pms_system_log` VALUES (2468, '修改任务类型模板，评级ID：35', 26, 'Project_TaskTypeTemplate.editTaskTypeTemplate', '2018-04-30 22:16:44');
INSERT INTO `pms_system_log` VALUES (2469, '修改任务类型模板，评级ID：34', 26, 'Project_TaskTypeTemplate.editTaskTypeTemplate', '2018-04-30 22:16:51');
INSERT INTO `pms_system_log` VALUES (2470, '修改任务类型模板，评级ID：33', 26, 'Project_TaskTypeTemplate.editTaskTypeTemplate', '2018-04-30 22:16:56');
INSERT INTO `pms_system_log` VALUES (2471, '修改任务类型模板，评级ID：32', 26, 'Project_TaskTypeTemplate.editTaskTypeTemplate', '2018-04-30 22:17:04');
INSERT INTO `pms_system_log` VALUES (2472, '新增任务类型模板，编号：37', 26, 'Project_TaskTypeTemplate.addTaskTypeTemplate', '2018-04-30 22:17:09');
INSERT INTO `pms_system_log` VALUES (2473, '新增任务类型模板，编号：38', 26, 'Project_TaskTypeTemplate.addTaskTypeTemplate', '2018-04-30 22:17:15');
INSERT INTO `pms_system_log` VALUES (2474, '新增任务类型模板，编号：39', 26, 'Project_TaskTypeTemplate.addTaskTypeTemplate', '2018-04-30 22:17:20');
INSERT INTO `pms_system_log` VALUES (2475, '修改任务类型模板，评级ID：36', 26, 'Project_TaskTypeTemplate.editTaskTypeTemplate', '2018-04-30 22:17:45');
INSERT INTO `pms_system_log` VALUES (2476, '修改任务类型模板，评级ID：36', 26, 'Project_TaskTypeTemplate.editTaskTypeTemplate', '2018-04-30 22:17:54');
INSERT INTO `pms_system_log` VALUES (2477, '修改任务类型模板，评级ID：35', 26, 'Project_TaskTypeTemplate.editTaskTypeTemplate', '2018-04-30 22:18:02');
INSERT INTO `pms_system_log` VALUES (2478, '修改任务类型模板，评级ID：34', 26, 'Project_TaskTypeTemplate.editTaskTypeTemplate', '2018-04-30 22:18:07');
INSERT INTO `pms_system_log` VALUES (2479, '修改任务类型模板，评级ID：33', 26, 'Project_TaskTypeTemplate.editTaskTypeTemplate', '2018-04-30 22:18:10');
INSERT INTO `pms_system_log` VALUES (2480, '修改任务类型模板，评级ID：32', 26, 'Project_TaskTypeTemplate.editTaskTypeTemplate', '2018-04-30 22:18:29');
INSERT INTO `pms_system_log` VALUES (2481, '修改任务类型模板，评级ID：37', 26, 'Project_TaskTypeTemplate.editTaskTypeTemplate', '2018-04-30 22:18:35');
INSERT INTO `pms_system_log` VALUES (2482, '修改任务类型模板，评级ID：38', 26, 'Project_TaskTypeTemplate.editTaskTypeTemplate', '2018-04-30 22:18:41');
INSERT INTO `pms_system_log` VALUES (2483, '新增项目类型，编号：13', 26, 'Project_ProjectType.addProjectType', '2018-04-30 22:19:06');
INSERT INTO `pms_system_log` VALUES (2484, '删除项目任务类型模板，编号：[\"44\",\"43\",\"42\",\"41\",\"40\"]', 26, 'Project_TaskTypeTemplate.delTaskTypeTemplate', '2018-04-30 22:19:12');
INSERT INTO `pms_system_log` VALUES (2485, '新增任务类型模板，编号：45', 26, 'Project_TaskTypeTemplate.addTaskTypeTemplate', '2018-04-30 22:21:33');
INSERT INTO `pms_system_log` VALUES (2486, '新增任务类型模板，编号：46', 26, 'Project_TaskTypeTemplate.addTaskTypeTemplate', '2018-04-30 22:21:41');
INSERT INTO `pms_system_log` VALUES (2487, '新增任务类型模板，编号：47', 26, 'Project_TaskTypeTemplate.addTaskTypeTemplate', '2018-04-30 22:21:59');
INSERT INTO `pms_system_log` VALUES (2488, '新增任务类型模板，编号：48', 26, 'Project_TaskTypeTemplate.addTaskTypeTemplate', '2018-04-30 22:22:05');
INSERT INTO `pms_system_log` VALUES (2489, '新增任务类型模板，编号：49', 26, 'Project_TaskTypeTemplate.addTaskTypeTemplate', '2018-04-30 22:22:10');
INSERT INTO `pms_system_log` VALUES (2490, '新增任务类型模板，编号：50', 26, 'Project_TaskTypeTemplate.addTaskTypeTemplate', '2018-04-30 22:22:17');
INSERT INTO `pms_system_log` VALUES (2491, '新增任务类型模板，编号：51', 26, 'Project_TaskTypeTemplate.addTaskTypeTemplate', '2018-04-30 22:22:22');
INSERT INTO `pms_system_log` VALUES (2492, '修改项目类型，评级ID：10', 26, 'Project_ProjectType.editProjectType', '2018-04-30 22:22:50');
INSERT INTO `pms_system_log` VALUES (2493, '修改项目类型，评级ID：11', 26, 'Project_ProjectType.editProjectType', '2018-04-30 22:23:06');
INSERT INTO `pms_system_log` VALUES (2494, '修改项目类型，评级ID：12', 26, 'Project_ProjectType.editProjectType', '2018-04-30 22:23:19');
INSERT INTO `pms_system_log` VALUES (2495, '修改项目类型，评级ID：13', 26, 'Project_ProjectType.editProjectType', '2018-04-30 22:23:31');
INSERT INTO `pms_system_log` VALUES (2496, '修改项目类型，评级ID：13', 26, 'Project_ProjectType.editProjectType', '2018-04-30 22:23:35');
INSERT INTO `pms_system_log` VALUES (2497, '用户登录，编号：[26]', 0, 'User_User.Login', '2018-05-01 08:32:36');
INSERT INTO `pms_system_log` VALUES (2498, '用户登录，编号：[26]', 26, 'User_User.Login', '2018-05-01 09:15:24');
INSERT INTO `pms_system_log` VALUES (2499, '用户登录，编号：[26]', 26, 'User_User.Login', '2018-05-01 09:18:27');
INSERT INTO `pms_system_log` VALUES (2500, '用户登录，编号：[119]', 26, 'User_User.Login', '2018-05-01 09:59:40');
INSERT INTO `pms_system_log` VALUES (2501, '用户登录，编号：[120]', 119, 'User_User.Login', '2018-05-01 10:01:22');
INSERT INTO `pms_system_log` VALUES (2502, '用户登录，编号：[26]', 0, NULL, '2018-05-01 10:16:38');
INSERT INTO `pms_system_log` VALUES (2503, '用户登录，编号：[26]', 26, NULL, '2018-05-01 10:16:57');
INSERT INTO `pms_system_log` VALUES (2504, '用户登录，编号：[26]', 26, NULL, '2018-05-01 10:20:02');
INSERT INTO `pms_system_log` VALUES (2505, '用户登录，编号：[26]', 26, NULL, '2018-07-14 12:19:58');
INSERT INTO `pms_system_log` VALUES (2506, '用户登录，编号：[26]', 0, NULL, '2018-07-14 12:52:05');
INSERT INTO `pms_system_log` VALUES (2507, '用户登录，编号：[26]', 0, NULL, '2018-07-14 12:52:09');
INSERT INTO `pms_system_log` VALUES (2508, '编辑用户组，编号：[7]', 26, NULL, '2018-07-14 12:54:36');
INSERT INTO `pms_system_log` VALUES (2509, '编辑用户组，编号：[8]', 26, NULL, '2018-07-14 12:54:49');
INSERT INTO `pms_system_log` VALUES (2510, '用户登录，编号：[26]', 0, NULL, '2018-07-19 15:09:51');
INSERT INTO `pms_system_log` VALUES (2511, '编辑用户组，编号：[7]', 26, NULL, '2018-07-19 15:10:01');
INSERT INTO `pms_system_log` VALUES (2512, '编辑用户组，编号：[8]', 26, NULL, '2018-07-19 15:10:11');
INSERT INTO `pms_system_log` VALUES (2513, '编辑用户组，编号：[3]', 26, NULL, '2018-07-19 15:10:24');
INSERT INTO `pms_system_log` VALUES (2514, '用户登录，编号：[26]', 26, NULL, '2018-07-19 15:10:38');
INSERT INTO `pms_system_log` VALUES (2515, '用户登录，编号：[119]', 0, NULL, '2018-07-19 15:16:50');
INSERT INTO `pms_system_log` VALUES (2516, '用户登录，编号：[120]', 0, NULL, '2018-07-19 15:18:14');
INSERT INTO `pms_system_log` VALUES (2517, '用户登录，编号：[120]', 120, NULL, '2018-07-19 15:19:45');

-- ----------------------------
-- Table structure for pms_system_setting
-- ----------------------------
DROP TABLE IF EXISTS `pms_system_setting`;
CREATE TABLE `pms_system_setting`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `set_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '站点名称',
  `value` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '站点状态。1：开启。0：关闭',
  PRIMARY KEY (`id`, `set_name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '系统配置表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of pms_system_setting
-- ----------------------------
INSERT INTO `pms_system_setting` VALUES (1, 'base_setting', '{\"site_name\":\"Project Manage System\",\"status\":1}');

-- ----------------------------
-- Table structure for pms_task
-- ----------------------------
DROP TABLE IF EXISTS `pms_task`;
CREATE TABLE `pms_task`  (
  `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT,
  `project` mediumint(8) UNSIGNED NOT NULL DEFAULT 0,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `type` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `pri` tinyint(3) UNSIGNED NULL DEFAULT 3,
  `status` enum('wait','doing','done','pause','cancel','closed') CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'wait',
  `desc` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `openedBy` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `openedDate` datetime(0) NULL DEFAULT NULL,
  `assignedTo` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `deleted` enum('0','1') CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0',
  `task_type` int(11) NULL DEFAULT 1 COMMENT '任务类型',
  `task_tag` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `execute_state` tinyint(2) NULL DEFAULT 0,
  `task_state` tinyint(2) NULL DEFAULT 0,
  `end_time` datetime(0) NULL DEFAULT NULL,
  `remind_time` datetime(0) NULL DEFAULT NULL COMMENT '提醒时间',
  `pid` int(11) NULL DEFAULT 0 COMMENT '父任务id',
  `sort` int(11) NULL DEFAULT 0 COMMENT '0',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `task`(`project`, `assignedTo`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 12183 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '任务表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of pms_task
-- ----------------------------
INSERT INTO `pms_task` VALUES (12160, 1292, '修复 Table 在动态调整页面宽度，有时滚动条显示错误的 bug', 'misc', 3, 'pause', '', 'admin', '2018-04-30 22:33:22', 'admin', '0', 15, NULL, 2, 0, NULL, NULL, 0, 12160);
INSERT INTO `pms_task` VALUES (12161, 1292, '修复 Poptip / Tooltip 动态修改内容后，位置计算不准确的 bug', 'misc', 1, 'wait', '', 'admin', '2018-04-30 22:33:33', 'admin', '0', 15, '[\"1\",\"3\"]', 0, 0, '2018-05-10 00:00:00', NULL, 0, 12161);
INSERT INTO `pms_task` VALUES (12162, 1292, '修复在 Form 内使用 Carousel 时，点击按钮会跳转的问题', 'misc', 3, 'wait', '修复在 Form 内使用 Carousel 时，点击按钮会跳转的问题', 'admin', '2018-04-30 22:33:39', 'xiaoming', '0', 15, NULL, 0, 0, NULL, '2018-04-30 00:00:00', 0, 12162);
INSERT INTO `pms_task` VALUES (12163, 1292, '修复 Table 在多级表头里使用过滤和排序的 bug', 'misc', 3, 'done', '', 'admin', '2018-04-30 22:33:45', 'xiaoming', '0', 15, NULL, 0, 1, NULL, NULL, 0, 12163);
INSERT INTO `pms_task` VALUES (12164, 1292, '修复 Table 在 2.12.0 版本，设置 show-header=\"false\" 报错的 bug', 'misc', 3, 'done', '', 'admin', '2018-04-30 22:33:51', 'admin', '0', 15, NULL, 0, 1, NULL, NULL, 0, 12164);
INSERT INTO `pms_task` VALUES (12165, 1292, 'Tag 新增属性 fade', 'misc', 3, 'doing', '', 'admin', '2018-04-30 22:33:59', 'admin', '0', 16, '[\"2\"]', 1, 0, NULL, NULL, 0, 12165);
INSERT INTO `pms_task` VALUES (12166, 1292, 'InputNumber 新增属性 placeholder', 'misc', 3, 'wait', '', 'admin', '2018-04-30 22:34:05', 'xiaowang', '0', 16, NULL, 0, 0, NULL, NULL, 0, 12166);
INSERT INTO `pms_task` VALUES (12167, 1292, 'InputNumber 的事件 on-focus 增加返回值 event', 'misc', 3, 'done', '', 'admin', '2018-04-30 22:34:09', 'admin', '0', 16, NULL, 0, 1, NULL, NULL, 0, 12167);
INSERT INTO `pms_task` VALUES (12168, 1292, 'DatePicker 的事件 on-change 增加返回值 type', 'misc', 3, 'wait', '', 'admin', '2018-04-30 22:34:16', 'xiaowang', '0', 16, NULL, 0, 0, NULL, NULL, 0, 12168);
INSERT INTO `pms_task` VALUES (12169, 1292, 'Table 列新增属性 minWidth 和 maxWidth', 'misc', 3, 'done', '', 'admin', '2018-04-30 22:34:24', 'xiaoming', '0', 16, NULL, 0, 1, NULL, NULL, 0, 12169);
INSERT INTO `pms_task` VALUES (12170, 1292, '优化 popper.js 的配置及 dropdown 的展开动画', 'misc', 3, 'wait', '', 'admin', '2018-04-30 22:35:10', 'admin', '0', 17, '[\"4\"]', 0, 0, NULL, '2018-04-30 00:00:00', 0, 12170);
INSERT INTO `pms_task` VALUES (12171, 1292, '优化 Table 筛选样式', 'misc', 2, 'doing', '', 'admin', '2018-04-30 22:35:10', 'admin', '0', 17, NULL, 1, 0, NULL, NULL, 0, 12171);
INSERT INTO `pms_task` VALUES (12172, 1292, '优化 Input 在 clearable 模式下，无数据时不显示清空按钮', 'misc', 3, 'done', '', 'admin', '2018-04-30 22:35:10', 'admin', '0', 17, NULL, 0, 1, NULL, NULL, 0, 12172);
INSERT INTO `pms_task` VALUES (12173, 1292, '优化 Table 筛选、排序样式', 'misc', 3, 'wait', '优化 Table 筛选、排序样式', 'admin', '2018-04-30 22:35:10', 'xiaoming', '0', 17, NULL, 0, 0, NULL, NULL, 0, 12173);
INSERT INTO `pms_task` VALUES (12174, 1292, '优化了 Select 样式与交互，增强键盘的可访问性，更接近原生', 'misc', 3, 'wait', '', 'admin', '2018-04-30 22:35:10', 'xiaoming', '0', 17, NULL, 0, 0, NULL, NULL, 0, 12174);
INSERT INTO `pms_task` VALUES (12175, 1292, '重构了 DatePicker 组件', 'misc', 3, 'wait', '', 'admin', '2018-04-30 22:35:21', 'xiaoming', '0', 18, '[\"3\"]', 0, 0, NULL, '2018-04-03 00:00:00', 0, 12175);
INSERT INTO `pms_task` VALUES (12176, 1292, '移除全局样式 ul 和 ol', 'misc', 3, 'wait', '', 'admin', '2018-04-30 22:35:31', 'xiaowang', '0', 18, '[\"3\",\"1\"]', 0, 0, NULL, NULL, 0, 12176);
INSERT INTO `pms_task` VALUES (12177, 1292, '新增响应式布局组件 Layout（包括 Layout、Header、Sider、Content、Footer 5个组件）', 'misc', 2, 'wait', '', 'admin', '2018-04-30 22:35:55', 'admin', '0', 19, NULL, 0, 0, NULL, NULL, 0, 12177);
INSERT INTO `pms_task` VALUES (12178, 1292, '$Message 和 $Notice 支持 Render 函数', 'misc', 3, 'done', '', 'admin', '2018-04-30 22:36:07', 'admin', '0', 19, NULL, 0, 1, NULL, NULL, 0, 12178);
INSERT INTO `pms_task` VALUES (12179, 1292, 'Tag 支持自定义颜色', 'misc', 3, 'wait', '', 'admin', '2018-04-30 22:36:12', 'admin', '0', 19, '[\"1\",\"4\"]', 0, 0, '2018-05-02 00:00:00', NULL, 0, 12179);
INSERT INTO `pms_task` VALUES (12180, 1292, '$Modal 支持 ESC 键关闭', 'misc', 3, 'wait', '', 'admin', '2018-04-30 22:36:18', 'xiaoming', '0', 19, NULL, 0, 0, NULL, NULL, 0, 12180);
INSERT INTO `pms_task` VALUES (12181, 1292, '筛选样式', 'misc', 3, 'done', '', 'xiaoming', '2018-07-14 13:58:33', 'xiaoming', '0', 17, NULL, 0, 1, NULL, NULL, 12173, 12181);
INSERT INTO `pms_task` VALUES (12182, 1292, '排序样式', 'misc', 3, 'wait', '', 'xiaoming', '2018-07-14 13:58:36', 'xiaoming', '0', 17, NULL, 0, 0, NULL, NULL, 12173, 12182);

-- ----------------------------
-- Table structure for pms_task_file
-- ----------------------------
DROP TABLE IF EXISTS `pms_task_file`;
CREATE TABLE `pms_task_file`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `file_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '文件名',
  `file_type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '文件类型',
  `task_id` int(11) NULL DEFAULT NULL COMMENT '任务id',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '上传时间',
  `user_id` int(11) NULL DEFAULT NULL COMMENT '操作人',
  `old_file_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '原文件名',
  `file_ext` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '文件后缀',
  `file_size` int(20) NULL DEFAULT 0,
  `file_url` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '文件表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for pms_task_log
-- ----------------------------
DROP TABLE IF EXISTS `pms_task_log`;
CREATE TABLE `pms_task_log`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NULL DEFAULT 0 COMMENT '操作人id',
  `memo` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '操作内容',
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `log_type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'add' COMMENT '操作类型',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '添加时间',
  `task_id` int(11) NULL DEFAULT 0 COMMENT '任务id',
  `ticket` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `to_user_id` int(11) NULL DEFAULT 0,
  `is_comment` tinyint(1) NULL DEFAULT 0 COMMENT '是否评论，0：否',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3843 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '任务日志表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of pms_task_log
-- ----------------------------
INSERT INTO `pms_task_log` VALUES (3716, 26, '修复 Table 在动态调整页面宽度，有时滚动条显示错误的 bug', '创建了任务', 'add', '2018-04-30 22:33:22', 12160, '', 0, 0);
INSERT INTO `pms_task_log` VALUES (3717, 26, '', '加入并认领了任务', 'add_member', '2018-04-30 22:33:22', 12160, '', 0, 0);
INSERT INTO `pms_task_log` VALUES (3718, 26, '修复 Poptip / Tooltip 动态修改内容后，位置计算不准确的 bug', '创建了任务', 'add', '2018-04-30 22:33:33', 12161, '', 0, 0);
INSERT INTO `pms_task_log` VALUES (3719, 26, '', '加入并认领了任务', 'add_member', '2018-04-30 22:33:34', 12161, '', 0, 0);
INSERT INTO `pms_task_log` VALUES (3720, 26, '修复在 Form 内使用 Carousel 时，点击按钮会跳转的问题', '创建了任务', 'add', '2018-04-30 22:33:39', 12162, '', 0, 0);
INSERT INTO `pms_task_log` VALUES (3721, 26, '', '加入并认领了任务', 'add_member', '2018-04-30 22:33:39', 12162, '', 0, 0);
INSERT INTO `pms_task_log` VALUES (3722, 26, '修复 Table 在多级表头里使用过滤和排序的 bug', '创建了任务', 'add', '2018-04-30 22:33:45', 12163, '', 0, 0);
INSERT INTO `pms_task_log` VALUES (3723, 26, '', '加入并认领了任务', 'add_member', '2018-04-30 22:33:45', 12163, '', 0, 0);
INSERT INTO `pms_task_log` VALUES (3724, 26, '修复 Table 在 2.12.0 版本，设置 show-header=\"false\" 报错的 bug', '创建了任务', 'add', '2018-04-30 22:33:51', 12164, '', 0, 0);
INSERT INTO `pms_task_log` VALUES (3725, 26, '', '加入并认领了任务', 'add_member', '2018-04-30 22:33:51', 12164, '', 0, 0);
INSERT INTO `pms_task_log` VALUES (3726, 26, 'Tag 新增属性 fade', '创建了任务', 'add', '2018-04-30 22:33:59', 12165, '', 0, 0);
INSERT INTO `pms_task_log` VALUES (3727, 26, '', '加入并认领了任务', 'add_member', '2018-04-30 22:33:59', 12165, '', 0, 0);
INSERT INTO `pms_task_log` VALUES (3728, 26, 'InputNumber 新增属性 placeholder', '创建了任务', 'add', '2018-04-30 22:34:05', 12166, '', 0, 0);
INSERT INTO `pms_task_log` VALUES (3729, 26, '', '加入并认领了任务', 'add_member', '2018-04-30 22:34:05', 12166, '', 0, 0);
INSERT INTO `pms_task_log` VALUES (3730, 26, 'InputNumber 的事件 on-focus 增加返回值 event', '创建了任务', 'add', '2018-04-30 22:34:09', 12167, '', 0, 0);
INSERT INTO `pms_task_log` VALUES (3731, 26, '', '加入并认领了任务', 'add_member', '2018-04-30 22:34:09', 12167, '', 0, 0);
INSERT INTO `pms_task_log` VALUES (3732, 26, 'DatePicker 的事件 on-change 增加返回值 type', '创建了任务', 'add', '2018-04-30 22:34:16', 12168, '', 0, 0);
INSERT INTO `pms_task_log` VALUES (3733, 26, '', '加入并认领了任务', 'add_member', '2018-04-30 22:34:16', 12168, '', 0, 0);
INSERT INTO `pms_task_log` VALUES (3734, 26, 'Table 列新增属性 minWidth 和 maxWidth', '创建了任务', 'add', '2018-04-30 22:34:24', 12169, '', 0, 0);
INSERT INTO `pms_task_log` VALUES (3735, 26, '', '加入并认领了任务', 'add_member', '2018-04-30 22:34:24', 12169, '', 0, 0);
INSERT INTO `pms_task_log` VALUES (3736, 26, '优化 popper.js 的配置及 dropdown 的展开动画', '创建了任务', 'add', '2018-04-30 22:35:10', 12170, '', 0, 0);
INSERT INTO `pms_task_log` VALUES (3737, 26, '', '加入并认领了任务', 'add_member', '2018-04-30 22:35:10', 12170, '', 0, 0);
INSERT INTO `pms_task_log` VALUES (3738, 26, '优化 Table 筛选样式', '创建了任务', 'add', '2018-04-30 22:35:10', 12171, '', 0, 0);
INSERT INTO `pms_task_log` VALUES (3739, 26, '', '加入并认领了任务', 'add_member', '2018-04-30 22:35:10', 12171, '', 0, 0);
INSERT INTO `pms_task_log` VALUES (3740, 26, '优化 Input 在 clearable 模式下，无数据时不显示清空按钮', '创建了任务', 'add', '2018-04-30 22:35:10', 12172, '', 0, 0);
INSERT INTO `pms_task_log` VALUES (3741, 26, '', '加入并认领了任务', 'add_member', '2018-04-30 22:35:10', 12172, '', 0, 0);
INSERT INTO `pms_task_log` VALUES (3742, 26, '优化 Table 筛选、排序样式', '创建了任务', 'add', '2018-04-30 22:35:10', 12173, '', 0, 0);
INSERT INTO `pms_task_log` VALUES (3743, 26, '', '加入并认领了任务', 'add_member', '2018-04-30 22:35:10', 12173, '', 0, 0);
INSERT INTO `pms_task_log` VALUES (3744, 26, '优化了 Select 样式与交互，增强键盘的可访问性，更接近原生', '创建了任务', 'add', '2018-04-30 22:35:10', 12174, '', 0, 0);
INSERT INTO `pms_task_log` VALUES (3745, 26, '', '加入并认领了任务', 'add_member', '2018-04-30 22:35:10', 12174, '', 0, 0);
INSERT INTO `pms_task_log` VALUES (3746, 26, '重构了 DatePicker 组件', '创建了任务', 'add', '2018-04-30 22:35:21', 12175, '', 0, 0);
INSERT INTO `pms_task_log` VALUES (3747, 26, '', '加入并认领了任务', 'add_member', '2018-04-30 22:35:21', 12175, '', 0, 0);
INSERT INTO `pms_task_log` VALUES (3748, 26, '移除全局样式 ul 和 ol', '创建了任务', 'add', '2018-04-30 22:35:31', 12176, '', 0, 0);
INSERT INTO `pms_task_log` VALUES (3749, 26, '', '加入并认领了任务', 'add_member', '2018-04-30 22:35:32', 12176, '', 0, 0);
INSERT INTO `pms_task_log` VALUES (3750, 26, '新增响应式布局组件 Layout（包括 Layout、Header、Sider、Content、Footer 5个组件）', '创建了任务', 'add', '2018-04-30 22:35:55', 12177, '', 0, 0);
INSERT INTO `pms_task_log` VALUES (3751, 26, '', '加入并认领了任务', 'add_member', '2018-04-30 22:35:56', 12177, '', 0, 0);
INSERT INTO `pms_task_log` VALUES (3752, 26, '$Message 和 $Notice 支持 Render 函数', '创建了任务', 'add', '2018-04-30 22:36:07', 12178, '', 0, 0);
INSERT INTO `pms_task_log` VALUES (3753, 26, '', '加入并认领了任务', 'add_member', '2018-04-30 22:36:07', 12178, '', 0, 0);
INSERT INTO `pms_task_log` VALUES (3754, 26, 'Tag 支持自定义颜色', '创建了任务', 'add', '2018-04-30 22:36:12', 12179, '', 0, 0);
INSERT INTO `pms_task_log` VALUES (3755, 26, '', '加入并认领了任务', 'add_member', '2018-04-30 22:36:12', 12179, '', 0, 0);
INSERT INTO `pms_task_log` VALUES (3756, 26, '$Modal 支持 ESC 键关闭', '创建了任务', 'add', '2018-04-30 22:36:18', 12180, '', 0, 0);
INSERT INTO `pms_task_log` VALUES (3757, 26, '', '加入并认领了任务', 'add_member', '2018-04-30 22:36:19', 12180, '', 0, 0);
INSERT INTO `pms_task_log` VALUES (3758, 26, '', '完成了任务', 'done', '2018-04-30 22:36:26', 12163, '', 0, 0);
INSERT INTO `pms_task_log` VALUES (3759, 26, '', '完成了任务', 'done', '2018-04-30 22:36:27', 12164, '', 0, 0);
INSERT INTO `pms_task_log` VALUES (3760, 26, '', '完成了任务', 'done', '2018-04-30 22:36:27', 12168, '', 0, 0);
INSERT INTO `pms_task_log` VALUES (3761, 26, '', '完成了任务', 'done', '2018-04-30 22:36:29', 12172, '', 0, 0);
INSERT INTO `pms_task_log` VALUES (3762, 26, '', '完成了任务', 'done', '2018-04-30 22:36:29', 12178, '', 0, 0);
INSERT INTO `pms_task_log` VALUES (3763, 26, '', '完成了任务', 'done', '2018-04-30 22:36:35', 12169, '', 0, 0);
INSERT INTO `pms_task_log` VALUES (3764, 26, '', '完成了任务', 'done', '2018-04-30 22:36:36', 12167, '', 0, 0);
INSERT INTO `pms_task_log` VALUES (3765, 26, '', '邀请 晓铭 加入任务', 'add_member', '2018-04-30 22:37:09', 12162, '', 119, 0);
INSERT INTO `pms_task_log` VALUES (3766, 26, '', '指派给了 晓铭', 'add_executor', '2018-04-30 22:37:11', 12162, '', 119, 0);
INSERT INTO `pms_task_log` VALUES (3767, 26, '', '邀请 肖旺 加入任务', 'add_member', '2018-04-30 22:37:17', 12166, '', 120, 0);
INSERT INTO `pms_task_log` VALUES (3768, 26, '', '指派给了 肖旺', 'add_executor', '2018-04-30 22:37:18', 12166, '', 120, 0);
INSERT INTO `pms_task_log` VALUES (3769, 26, '', '邀请 晓铭 加入任务', 'add_member', '2018-04-30 22:37:23', 12173, '', 119, 0);
INSERT INTO `pms_task_log` VALUES (3770, 26, '', '指派给了 晓铭', 'add_executor', '2018-04-30 22:37:24', 12173, '', 119, 0);
INSERT INTO `pms_task_log` VALUES (3771, 26, '', '邀请 肖旺 加入任务', 'add_member', '2018-04-30 22:37:29', 12176, '', 120, 0);
INSERT INTO `pms_task_log` VALUES (3772, 26, '', '指派给了 肖旺', 'add_executor', '2018-04-30 22:37:30', 12176, '', 120, 0);
INSERT INTO `pms_task_log` VALUES (3773, 26, '', '邀请 肖旺 加入任务', 'add_member', '2018-04-30 22:37:34', 12168, '', 120, 0);
INSERT INTO `pms_task_log` VALUES (3774, 26, '', '指派给了 肖旺', 'add_executor', '2018-04-30 22:37:38', 12168, '', 120, 0);
INSERT INTO `pms_task_log` VALUES (3775, 26, '', '邀请 晓铭 加入任务', 'add_member', '2018-04-30 22:37:48', 12180, '', 119, 0);
INSERT INTO `pms_task_log` VALUES (3776, 26, '', '指派给了 晓铭', 'add_executor', '2018-04-30 22:37:49', 12180, '', 119, 0);
INSERT INTO `pms_task_log` VALUES (3777, 26, '', '邀请 晓铭 加入任务', 'add_member', '2018-04-30 22:38:00', 12163, '', 119, 0);
INSERT INTO `pms_task_log` VALUES (3778, 26, '', '指派给了 晓铭', 'add_executor', '2018-04-30 22:38:01', 12163, '', 119, 0);
INSERT INTO `pms_task_log` VALUES (3779, 26, '', '添加标签： Web', 'task_tag', '2018-04-30 22:44:15', 12161, '', 0, 0);
INSERT INTO `pms_task_log` VALUES (3780, 26, '', '添加标签： Web，Android', 'task_tag', '2018-04-30 22:44:20', 12161, '', 0, 0);
INSERT INTO `pms_task_log` VALUES (3781, 26, '', '添加标签： IOS', 'task_tag', '2018-04-30 22:44:24', 12165, '', 0, 0);
INSERT INTO `pms_task_log` VALUES (3782, 26, '', '添加标签： All', 'task_tag', '2018-04-30 22:44:28', 12170, '', 0, 0);
INSERT INTO `pms_task_log` VALUES (3783, 26, '', '添加标签： Android', 'task_tag', '2018-04-30 22:44:32', 12175, '', 0, 0);
INSERT INTO `pms_task_log` VALUES (3784, 26, '', '添加标签： Android', 'task_tag', '2018-04-30 22:44:36', 12176, '', 0, 0);
INSERT INTO `pms_task_log` VALUES (3785, 26, '', '添加标签： Android，Web', 'task_tag', '2018-04-30 22:44:38', 12176, '', 0, 0);
INSERT INTO `pms_task_log` VALUES (3786, 26, '', '添加标签： Web', 'task_tag', '2018-04-30 22:44:46', 12179, '', 0, 0);
INSERT INTO `pms_task_log` VALUES (3787, 26, '', '添加标签： Web，Android', 'task_tag', '2018-04-30 22:44:51', 12179, '', 0, 0);
INSERT INTO `pms_task_log` VALUES (3788, 26, '', '添加标签： Web，Android，All', 'task_tag', '2018-04-30 22:44:53', 12179, '', 0, 0);
INSERT INTO `pms_task_log` VALUES (3789, 26, '', '正在执行任务', 'task_execute', '2018-04-30 22:45:00', 12170, '', 0, 0);
INSERT INTO `pms_task_log` VALUES (3790, 26, '', '停止执行任务', 'task_execute', '2018-04-30 22:45:04', 12170, '', 0, 0);
INSERT INTO `pms_task_log` VALUES (3791, 26, '', '正在执行任务', 'task_execute', '2018-04-30 22:45:07', 12171, '', 0, 0);
INSERT INTO `pms_task_log` VALUES (3792, 26, '', '正在执行任务', 'task_execute', '2018-04-30 22:45:12', 12165, '', 0, 0);
INSERT INTO `pms_task_log` VALUES (3793, 26, '', '已暂停任务', 'task_execute', '2018-04-30 22:45:16', 12160, '', 0, 0);
INSERT INTO `pms_task_log` VALUES (3794, 26, '', '更新截止时间为 05月10日 00:00', 'date', '2018-04-30 22:45:23', 12161, '', 0, 0);
INSERT INTO `pms_task_log` VALUES (3795, 26, '修复在 Form 内使用 Carousel 时，点击按钮会跳转的问题', '更新了备注', 'content', '2018-04-30 22:45:39', 12162, '', 0, 0);
INSERT INTO `pms_task_log` VALUES (3796, 26, '', '关联了文件 qrcode_for_gh_8d9398505b59_344.jpg', 'upload', '2018-04-30 22:45:53', 12162, '', 0, 0);
INSERT INTO `pms_task_log` VALUES (3797, 26, '', '关联了文件 qrcode_for_gh_8d9398505b59_344.jpg', 'upload', '2018-04-30 22:46:07', 12162, '', 0, 0);
INSERT INTO `pms_task_log` VALUES (3798, 26, '', '关联了文件 qrcode_for_gh_8d9398505b59_344.jpg', 'upload', '2018-04-30 22:47:12', 12162, '', 0, 0);
INSERT INTO `pms_task_log` VALUES (3799, 26, '', '关联了文件 qrcode_for_gh_8d9398505b59_344.jpg', 'upload', '2018-04-30 22:54:53', 12162, '', 0, 0);
INSERT INTO `pms_task_log` VALUES (3800, 26, '', '关联了文件 qrcode_for_gh_8d9398505b59_344.jpg', 'upload', '2018-04-30 23:03:50', 12162, '', 0, 0);
INSERT INTO `pms_task_log` VALUES (3801, 26, '', '更新截止时间为 05月02日 00:00', 'date', '2018-04-30 23:24:02', 12179, '', 0, 0);
INSERT INTO `pms_task_log` VALUES (3802, 26, '', '添加标签： Web，All', 'task_tag', '2018-04-30 23:24:10', 12179, '', 0, 0);
INSERT INTO `pms_task_log` VALUES (3803, 26, '优化 Table 筛选、排序样式', '更新了备注', 'content', '2018-05-01 08:34:19', 12173, '', 0, 0);
INSERT INTO `pms_task_log` VALUES (3804, 119, '', '加入任务', 'add_member', '2018-05-01 10:00:08', 12174, '', 0, 0);
INSERT INTO `pms_task_log` VALUES (3805, 119, '', '认领了任务', 'add_executor', '2018-05-01 10:00:11', 12174, '', 119, 0);
INSERT INTO `pms_task_log` VALUES (3806, 119, '', '加入任务', 'add_member', '2018-05-01 10:00:18', 12175, '', 0, 0);
INSERT INTO `pms_task_log` VALUES (3807, 119, '', '认领了任务', 'add_executor', '2018-05-01 10:00:20', 12175, '', 119, 0);
INSERT INTO `pms_task_log` VALUES (3808, 119, '', '完成了任务', 'done', '2018-05-01 10:00:23', 12162, '', 0, 0);
INSERT INTO `pms_task_log` VALUES (3809, 119, '', '重做了任务', 'again', '2018-05-01 10:00:24', 12162, '', 0, 0);
INSERT INTO `pms_task_log` VALUES (3810, 120, '', '完成了任务', 'done', '2018-05-01 10:01:29', 12176, '', 0, 0);
INSERT INTO `pms_task_log` VALUES (3811, 120, '', '重做了任务', 'again', '2018-05-01 10:01:29', 12176, '', 0, 0);
INSERT INTO `pms_task_log` VALUES (3812, 120, '', '完成了任务', 'done', '2018-05-01 10:01:34', 12166, '', 0, 0);
INSERT INTO `pms_task_log` VALUES (3813, 120, '', '重做了任务', 'again', '2018-05-01 10:01:35', 12166, '', 0, 0);
INSERT INTO `pms_task_log` VALUES (3814, 120, '', '重做了任务', 'again', '2018-05-01 10:01:35', 12168, '', 0, 0);
INSERT INTO `pms_task_log` VALUES (3815, 120, '', '邀请 晓铭 加入任务', 'add_member', '2018-05-01 10:01:40', 12169, '', 119, 0);
INSERT INTO `pms_task_log` VALUES (3816, 120, '', '指派给了 晓铭', 'add_executor', '2018-05-01 10:01:42', 12169, '', 119, 0);
INSERT INTO `pms_task_log` VALUES (3817, 26, '', '更改任务级别为 非常紧急', 'task_level', '2018-05-01 10:26:12', 12161, '', 0, 0);
INSERT INTO `pms_task_log` VALUES (3818, 26, '', '更改任务级别为 紧急', 'task_level', '2018-05-01 10:26:16', 12171, '', 0, 0);
INSERT INTO `pms_task_log` VALUES (3819, 26, '', '更改任务级别为 紧急', 'task_level', '2018-05-01 10:26:28', 12177, '', 0, 0);
INSERT INTO `pms_task_log` VALUES (3820, 26, '', '添加了子任务 \"筛选样式\"', 'child_task', '2018-07-14 13:58:33', 12173, '', 0, 0);
INSERT INTO `pms_task_log` VALUES (3821, 26, '筛选样式', '在父任务 优化 Table 筛选、排序样式 下创建了任务', 'add', '2018-07-14 13:58:33', 12181, '', 0, 0);
INSERT INTO `pms_task_log` VALUES (3822, 26, '', '邀请 晓铭 加入任务', 'add_member', '2018-07-14 13:58:33', 12181, '', 119, 0);
INSERT INTO `pms_task_log` VALUES (3823, 26, '', '加入任务', 'add_member', '2018-07-14 13:58:33', 12181, '', 0, 0);
INSERT INTO `pms_task_log` VALUES (3824, 26, '', '添加了子任务 \"排序样式\"', 'child_task', '2018-07-14 13:58:36', 12173, '', 0, 0);
INSERT INTO `pms_task_log` VALUES (3825, 26, '排序样式', '在父任务 优化 Table 筛选、排序样式 下创建了任务', 'add', '2018-07-14 13:58:36', 12182, '', 0, 0);
INSERT INTO `pms_task_log` VALUES (3826, 26, '', '邀请 晓铭 加入任务', 'add_member', '2018-07-14 13:58:36', 12182, '', 119, 0);
INSERT INTO `pms_task_log` VALUES (3827, 26, '', '加入任务', 'add_member', '2018-07-14 13:58:36', 12182, '', 0, 0);
INSERT INTO `pms_task_log` VALUES (3828, 26, '', '完成了任务', 'done', '2018-07-14 13:58:39', 12182, '', 0, 0);
INSERT INTO `pms_task_log` VALUES (3829, 26, '', '完成了子任务 \"排序样式\"', 'child_task', '2018-07-14 13:58:39', 12173, '', 0, 0);
INSERT INTO `pms_task_log` VALUES (3830, 26, '', '重做了任务', 'again', '2018-07-14 13:58:43', 12182, '', 0, 0);
INSERT INTO `pms_task_log` VALUES (3831, 26, '', '重做了子任务 \"排序样式\"', 'child_task', '2018-07-14 13:58:43', 12173, '', 0, 0);
INSERT INTO `pms_task_log` VALUES (3832, 26, '', '完成了任务', 'done', '2018-07-14 13:58:44', 12181, '', 0, 0);
INSERT INTO `pms_task_log` VALUES (3833, 26, '', '完成了子任务 \"筛选样式\"', 'child_task', '2018-07-14 13:58:44', 12173, '', 0, 0);
INSERT INTO `pms_task_log` VALUES (3834, 26, '加油', NULL, 'comment', '2018-07-19 15:15:00', 12170, NULL, 0, 1);
INSERT INTO `pms_task_log` VALUES (3835, 26, '', '邀请 晓铭 加入任务', 'add_member', '2018-07-19 15:17:10', 12170, '', 119, 0);
INSERT INTO `pms_task_log` VALUES (3836, 26, '', '邀请 肖旺 加入任务', 'add_member', '2018-07-19 15:17:13', 12170, '', 120, 0);
INSERT INTO `pms_task_log` VALUES (3837, 119, '这边及时跟进', NULL, 'comment', '2018-07-19 15:17:29', 12170, NULL, 0, 1);
INSERT INTO `pms_task_log` VALUES (3838, 120, '表示关注', NULL, 'comment', '2018-07-19 15:18:33', 12170, NULL, 0, 1);
INSERT INTO `pms_task_log` VALUES (3839, 26, '细节的问题需要及时进行调整', NULL, 'comment', '2018-07-19 15:18:43', 12170, NULL, 0, 1);
INSERT INTO `pms_task_log` VALUES (3840, 119, '目前进展顺利', NULL, 'comment', '2018-07-19 15:19:09', 12170, NULL, 0, 1);
INSERT INTO `pms_task_log` VALUES (3841, 26, '给力', NULL, 'comment', '2018-07-19 15:19:16', 12170, NULL, 0, 1);
INSERT INTO `pms_task_log` VALUES (3842, 120, '厉害了', NULL, 'comment', '2018-07-19 15:19:24', 12170, NULL, 0, 1);

-- ----------------------------
-- Table structure for pms_task_type
-- ----------------------------
DROP TABLE IF EXISTS `pms_task_type`;
CREATE TABLE `pms_task_type`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '类型名称',
  `project` int(11) NULL DEFAULT 0 COMMENT '项目id',
  `sort` tinyint(2) NULL DEFAULT 0 COMMENT '排序',
  `memo` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `create_time` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 33 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '任务类型表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of pms_task_type
-- ----------------------------
INSERT INTO `pms_task_type` VALUES (15, '修复', 1292, 15, NULL, NULL);
INSERT INTO `pms_task_type` VALUES (16, '新增', 1292, 16, NULL, NULL);
INSERT INTO `pms_task_type` VALUES (17, '优化', 1292, 17, NULL, NULL);
INSERT INTO `pms_task_type` VALUES (18, '重构', 1292, 18, NULL, NULL);
INSERT INTO `pms_task_type` VALUES (19, '计划', 1292, 19, NULL, NULL);
INSERT INTO `pms_task_type` VALUES (20, '待处理', 1293, 20, NULL, '2018-05-01 09:28:36');
INSERT INTO `pms_task_type` VALUES (21, '进行中', 1293, 21, NULL, '2018-05-01 09:28:36');
INSERT INTO `pms_task_type` VALUES (22, '已完成', 1293, 22, NULL, '2018-05-01 09:28:36');
INSERT INTO `pms_task_type` VALUES (23, '待处理', 1296, 23, NULL, '2018-05-01 09:33:43');
INSERT INTO `pms_task_type` VALUES (24, '进行中', 1296, 24, NULL, '2018-05-01 09:33:43');
INSERT INTO `pms_task_type` VALUES (25, '已完成', 1296, 25, NULL, '2018-05-01 09:33:43');
INSERT INTO `pms_task_type` VALUES (26, '协议签订', 1297, 26, NULL, '2018-05-01 09:36:05');
INSERT INTO `pms_task_type` VALUES (27, '图纸设计', 1297, 27, NULL, '2018-05-01 09:36:05');
INSERT INTO `pms_task_type` VALUES (28, '评审及打样', 1297, 28, NULL, '2018-05-01 09:36:05');
INSERT INTO `pms_task_type` VALUES (29, '构件采购', 1297, 29, NULL, '2018-05-01 09:36:05');
INSERT INTO `pms_task_type` VALUES (30, '制造安装', 1297, 30, NULL, '2018-05-01 09:36:05');
INSERT INTO `pms_task_type` VALUES (31, '内部检验', 1297, 31, NULL, '2018-05-01 09:36:05');
INSERT INTO `pms_task_type` VALUES (32, '验收', 1297, 32, NULL, '2018-05-01 09:36:05');

-- ----------------------------
-- Table structure for pms_task_type_template
-- ----------------------------
DROP TABLE IF EXISTS `pms_task_type_template`;
CREATE TABLE `pms_task_type_template`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '类型名称',
  `project_type_id` int(11) NULL DEFAULT 0 COMMENT '项目id',
  `create_time` datetime(0) NULL DEFAULT NULL,
  `sort` int(11) NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 52 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '任务类型模板表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of pms_task_type_template
-- ----------------------------
INSERT INTO `pms_task_type_template` VALUES (24, '已完成', 10, '2018-04-30 22:13:35', 0);
INSERT INTO `pms_task_type_template` VALUES (25, '进行中', 10, '2018-04-30 22:13:35', 1);
INSERT INTO `pms_task_type_template` VALUES (26, '待处理', 10, '2018-04-30 22:13:35', 2);
INSERT INTO `pms_task_type_template` VALUES (27, '发布成功', 11, '2018-04-30 22:15:10', 1);
INSERT INTO `pms_task_type_template` VALUES (28, '准备发布', 11, '2018-04-30 22:15:10', 2);
INSERT INTO `pms_task_type_template` VALUES (29, '测试', 11, '2018-04-30 22:15:10', 3);
INSERT INTO `pms_task_type_template` VALUES (30, '即将发布', 11, '2018-04-30 22:15:10', 4);
INSERT INTO `pms_task_type_template` VALUES (31, '产品计划', 11, '2018-04-30 22:15:10', 5);
INSERT INTO `pms_task_type_template` VALUES (32, '研发中', 12, '2018-04-30 22:16:29', 3);
INSERT INTO `pms_task_type_template` VALUES (33, '需求暂缓', 12, '2018-04-30 22:16:29', 4);
INSERT INTO `pms_task_type_template` VALUES (34, '评估确认', 12, '2018-04-30 22:16:29', 5);
INSERT INTO `pms_task_type_template` VALUES (35, '需求归类', 12, '2018-04-30 22:16:29', 6);
INSERT INTO `pms_task_type_template` VALUES (36, '需求收集', 12, '2018-04-30 22:16:29', 8);
INSERT INTO `pms_task_type_template` VALUES (37, '内测中', 12, '2018-04-30 22:17:09', 2);
INSERT INTO `pms_task_type_template` VALUES (38, '通知用户', 12, '2018-04-30 22:17:15', 1);
INSERT INTO `pms_task_type_template` VALUES (39, '已完成&归档', 12, '2018-04-30 22:17:20', 0);
INSERT INTO `pms_task_type_template` VALUES (45, '协议签订', 13, '2018-04-30 22:21:33', 0);
INSERT INTO `pms_task_type_template` VALUES (46, '图纸设计', 13, '2018-04-30 22:21:41', 0);
INSERT INTO `pms_task_type_template` VALUES (47, '评审及打样', 13, '2018-04-30 22:21:58', 0);
INSERT INTO `pms_task_type_template` VALUES (48, '构件采购', 13, '2018-04-30 22:22:05', 0);
INSERT INTO `pms_task_type_template` VALUES (49, '制造安装', 13, '2018-04-30 22:22:10', 0);
INSERT INTO `pms_task_type_template` VALUES (50, '内部检验', 13, '2018-04-30 22:22:17', 0);
INSERT INTO `pms_task_type_template` VALUES (51, '验收', 13, '2018-04-30 22:22:22', 0);

-- ----------------------------
-- Table structure for pms_task_user
-- ----------------------------
DROP TABLE IF EXISTS `pms_task_user`;
CREATE TABLE `pms_task_user`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `task_id` int(11) NULL DEFAULT 0 COMMENT '任务ID',
  `is_executor` tinyint(1) NULL DEFAULT 0 COMMENT '执行者',
  `user_id` int(11) NULL DEFAULT 0 COMMENT '成员id',
  `create_time` datetime(0) NULL DEFAULT NULL,
  `account` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `id`(`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12832 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '任务-成员表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of pms_task_user
-- ----------------------------
INSERT INTO `pms_task_user` VALUES (12795, 12160, 1, 26, '2018-04-30 22:33:22', NULL);
INSERT INTO `pms_task_user` VALUES (12796, 12161, 1, 26, '2018-04-30 22:33:34', NULL);
INSERT INTO `pms_task_user` VALUES (12797, 12162, 0, 26, '2018-04-30 22:33:39', NULL);
INSERT INTO `pms_task_user` VALUES (12798, 12163, 0, 26, '2018-04-30 22:33:45', NULL);
INSERT INTO `pms_task_user` VALUES (12799, 12164, 1, 26, '2018-04-30 22:33:51', NULL);
INSERT INTO `pms_task_user` VALUES (12800, 12165, 1, 26, '2018-04-30 22:33:59', NULL);
INSERT INTO `pms_task_user` VALUES (12801, 12166, 0, 26, '2018-04-30 22:34:05', NULL);
INSERT INTO `pms_task_user` VALUES (12802, 12167, 1, 26, '2018-04-30 22:34:09', NULL);
INSERT INTO `pms_task_user` VALUES (12803, 12168, 0, 26, '2018-04-30 22:34:16', NULL);
INSERT INTO `pms_task_user` VALUES (12804, 12169, 0, 26, '2018-04-30 22:34:24', NULL);
INSERT INTO `pms_task_user` VALUES (12805, 12170, 1, 26, '2018-04-30 22:35:10', NULL);
INSERT INTO `pms_task_user` VALUES (12806, 12171, 1, 26, '2018-04-30 22:35:10', NULL);
INSERT INTO `pms_task_user` VALUES (12807, 12172, 1, 26, '2018-04-30 22:35:10', NULL);
INSERT INTO `pms_task_user` VALUES (12808, 12173, 0, 26, '2018-04-30 22:35:10', NULL);
INSERT INTO `pms_task_user` VALUES (12809, 12174, 0, 26, '2018-04-30 22:35:10', NULL);
INSERT INTO `pms_task_user` VALUES (12810, 12175, 0, 26, '2018-04-30 22:35:21', NULL);
INSERT INTO `pms_task_user` VALUES (12811, 12176, 0, 26, '2018-04-30 22:35:32', NULL);
INSERT INTO `pms_task_user` VALUES (12812, 12177, 1, 26, '2018-04-30 22:35:56', NULL);
INSERT INTO `pms_task_user` VALUES (12813, 12178, 1, 26, '2018-04-30 22:36:07', NULL);
INSERT INTO `pms_task_user` VALUES (12814, 12179, 1, 26, '2018-04-30 22:36:12', NULL);
INSERT INTO `pms_task_user` VALUES (12815, 12180, 0, 26, '2018-04-30 22:36:19', NULL);
INSERT INTO `pms_task_user` VALUES (12816, 12162, 1, 119, '2018-04-30 22:37:09', NULL);
INSERT INTO `pms_task_user` VALUES (12817, 12166, 1, 120, '2018-04-30 22:37:17', NULL);
INSERT INTO `pms_task_user` VALUES (12818, 12173, 1, 119, '2018-04-30 22:37:23', NULL);
INSERT INTO `pms_task_user` VALUES (12819, 12176, 1, 120, '2018-04-30 22:37:29', NULL);
INSERT INTO `pms_task_user` VALUES (12820, 12168, 1, 120, '2018-04-30 22:37:34', NULL);
INSERT INTO `pms_task_user` VALUES (12821, 12180, 1, 119, '2018-04-30 22:37:48', NULL);
INSERT INTO `pms_task_user` VALUES (12822, 12163, 1, 119, '2018-04-30 22:38:00', NULL);
INSERT INTO `pms_task_user` VALUES (12823, 12174, 1, 119, '2018-05-01 10:00:08', NULL);
INSERT INTO `pms_task_user` VALUES (12824, 12175, 1, 119, '2018-05-01 10:00:18', NULL);
INSERT INTO `pms_task_user` VALUES (12825, 12169, 1, 119, '2018-05-01 10:01:40', NULL);
INSERT INTO `pms_task_user` VALUES (12826, 12181, 1, 119, '2018-07-14 13:58:33', NULL);
INSERT INTO `pms_task_user` VALUES (12827, 12181, 0, 26, '2018-07-14 13:58:33', NULL);
INSERT INTO `pms_task_user` VALUES (12828, 12182, 1, 119, '2018-07-14 13:58:36', NULL);
INSERT INTO `pms_task_user` VALUES (12829, 12182, 0, 26, '2018-07-14 13:58:36', NULL);
INSERT INTO `pms_task_user` VALUES (12830, 12170, 0, 119, '2018-07-19 15:17:10', NULL);
INSERT INTO `pms_task_user` VALUES (12831, 12170, 0, 120, '2018-07-19 15:17:13', NULL);

-- ----------------------------
-- Table structure for pms_team
-- ----------------------------
DROP TABLE IF EXISTS `pms_team`;
CREATE TABLE `pms_team`  (
  `project` mediumint(8) UNSIGNED NOT NULL DEFAULT 0,
  `account` char(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `join` date NULL DEFAULT '0000-00-00',
  `is_leader` tinyint(1) NULL DEFAULT 0,
  `is_developer` tinyint(1) NULL DEFAULT 0,
  `is_business` tinyint(1) NULL DEFAULT 0,
  `is_owner` tinyint(1) NULL DEFAULT 0,
  `id` int(11) NULL DEFAULT 1,
  PRIMARY KEY (`project`, `account`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '项目团队' ROW_FORMAT = Fixed;

-- ----------------------------
-- Records of pms_team
-- ----------------------------
INSERT INTO `pms_team` VALUES (1292, 'admin', '2018-04-30', 0, 0, 1, 1, 1);
INSERT INTO `pms_team` VALUES (1292, 'xiaowang', '2018-04-30', 0, 0, 0, 0, 1);
INSERT INTO `pms_team` VALUES (1292, 'xiaoming', '2018-04-30', 0, 0, 0, 0, 1);
INSERT INTO `pms_team` VALUES (1293, 'admin', '2018-05-01', 0, 0, 1, 1, 1);
INSERT INTO `pms_team` VALUES (1296, 'admin', '2018-05-01', 0, 0, 1, 1, 1);
INSERT INTO `pms_team` VALUES (1297, 'admin', '2018-05-01', 0, 0, 1, 1, 1);

-- ----------------------------
-- Table structure for pms_team_user
-- ----------------------------
DROP TABLE IF EXISTS `pms_team_user`;
CREATE TABLE `pms_team_user`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `team_id` int(11) NULL DEFAULT 0 COMMENT '所属团队id',
  `user_id` int(11) NULL DEFAULT 0 COMMENT '成员id',
  `join_time` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 44 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '团队成员表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of pms_team_user
-- ----------------------------
INSERT INTO `pms_team_user` VALUES (37, 16, 119, '2018-01-24 09:30:10');
INSERT INTO `pms_team_user` VALUES (38, 16, 26, '2018-01-24 09:30:14');
INSERT INTO `pms_team_user` VALUES (39, 16, 120, '2018-02-25 15:28:27');
INSERT INTO `pms_team_user` VALUES (40, 16, 124, '2018-02-26 17:00:01');
INSERT INTO `pms_team_user` VALUES (41, 16, 123, '2018-02-26 17:00:02');
INSERT INTO `pms_team_user` VALUES (42, 16, 122, '2018-02-26 17:00:02');
INSERT INTO `pms_team_user` VALUES (43, 16, 121, '2018-02-26 17:00:02');

-- ----------------------------
-- Table structure for pms_user
-- ----------------------------
DROP TABLE IF EXISTS `pms_user`;
CREATE TABLE `pms_user`  (
  `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT,
  `account` char(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `password` char(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `realname` char(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `nickname` char(60) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `avatar` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `birthday` date NOT NULL DEFAULT '0000-00-00',
  `email` char(90) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `qq` char(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `mobile` char(11) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `phone` char(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `address` char(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `zipcode` char(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `join` date NOT NULL DEFAULT '0000-00-00',
  `visits` mediumint(8) UNSIGNED NOT NULL DEFAULT 0,
  `ip` char(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `last` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `deleted` enum('0','1') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0',
  `level_id` int(11) NULL DEFAULT 1,
  `position_id` int(11) NULL DEFAULT 1,
  `state` tinyint(2) NULL DEFAULT 1,
  `company` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `account`(`account`) USING BTREE,
  INDEX `user`(`email`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 125 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of pms_user
-- ----------------------------
INSERT INTO `pms_user` VALUES (119, 'xiaoming', 'e10adc3949ba59abbe56e057f20f883e', '晓铭', '', 'http://static.vilson.xyz/20180125090137_0f86640ec585672774958549f1bc3cda', '0000-00-00', '54553@qq.com', '545566999', '1868114085', '', '', '', '2018-01-18', 269, '112.93.135.137', 1531984610, '0', 1, 10, 1, 'xxx公司');
INSERT INTO `pms_user` VALUES (120, 'xiaowang', 'e10adc3949ba59abbe56e057f20f883e', '肖旺', '', 'http://static.vilson.xyz/20180121122810_a226e47ba2eb3c3619032d753c7a0142', '0000-00-00', '', '', '', '', '', '', '2018-01-18', 5, '112.93.135.137', 1531984785, '0', 4, 3, 1, NULL);
INSERT INTO `pms_user` VALUES (26, 'admin', 'e10adc3949ba59abbe56e057f20f883e', '李维斯', '', 'http://static.vilson.xyz/20171226162245_7d894600f17b942b8d3a08972b9504d3', '0000-00-00', '3317765884@qq.com', '', '', '18681140825', '', '', '2017-12-15', 839, '36.110.119.51', 1531984238, '0', 8, 4, 1, NULL);
INSERT INTO `pms_user` VALUES (121, 'xiaofang', 'e10adc3949ba59abbe56e057f20f883e', '小芳', '', 'http://static.vilson.xyz/20171110154948_53004a2d25f8c5ec929f2104950d1966', '0000-00-00', '', '', '', '', '', '', '2018-02-26', 0, '', 0, '0', 9, 8, 1, NULL);
INSERT INTO `pms_user` VALUES (122, 'xiaochen', 'e10adc3949ba59abbe56e057f20f883e', '晓晨', '', 'http://static.vilson.xyz/20171110154948_53004a2d25f8c5ec929f2104950d1966', '0000-00-00', '', '', '', '', '', '', '2018-02-26', 0, '', 0, '0', 8, 5, 1, NULL);
INSERT INTO `pms_user` VALUES (123, 'fangming', 'e10adc3949ba59abbe56e057f20f883e', '方明', '', 'http://static.vilson.xyz/20171110154948_53004a2d25f8c5ec929f2104950d1966', '0000-00-00', '', '', '', '', '', '', '2018-02-26', 0, '', 0, '0', 8, 9, 1, NULL);
INSERT INTO `pms_user` VALUES (124, 'hewan', 'e10adc3949ba59abbe56e057f20f883e', '何宛', '', 'http://static.vilson.xyz/20171110154948_53004a2d25f8c5ec929f2104950d1966', '0000-00-00', '', '', '', '', '', '', '2018-02-26', 0, '', 0, '0', 9, 6, 1, NULL);

-- ----------------------------
-- Table structure for pms_user_level
-- ----------------------------
DROP TABLE IF EXISTS `pms_user_level`;
CREATE TABLE `pms_user_level`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `level_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '等级名称',
  `level_desc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '描述',
  `sort` tinyint(3) NULL DEFAULT 0 COMMENT '排序',
  `eng_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '英文名称',
  `create_time` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户等级表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of pms_user_level
-- ----------------------------
INSERT INTO `pms_user_level` VALUES (1, '助理工程师', '助理工程师', 0, 'T1', NULL);
INSERT INTO `pms_user_level` VALUES (4, '助理工程师', '初级工程师', 0, 'T2', '2017-11-03 16:01:11');
INSERT INTO `pms_user_level` VALUES (6, '初级工程师', '初级工程师', 0, 'T3', '2017-11-03 17:18:14');
INSERT INTO `pms_user_level` VALUES (7, '中级工程师', '中级工程师', 0, 'T4', '2017-11-03 17:18:23');
INSERT INTO `pms_user_level` VALUES (8, '中级工程师', '', 0, 'T5', '2017-11-03 17:18:28');
INSERT INTO `pms_user_level` VALUES (9, '高级工程师', '', 0, 'T6', '2017-11-03 17:18:34');
INSERT INTO `pms_user_level` VALUES (10, '初级客户经理', '初级客户经理', 0, 'S1', '2017-11-17 16:09:13');

-- ----------------------------
-- Table structure for pms_user_position
-- ----------------------------
DROP TABLE IF EXISTS `pms_user_position`;
CREATE TABLE `pms_user_position`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `position_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '职位名称',
  `position_desc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '描述',
  `sort` tinyint(2) NULL DEFAULT 0,
  `create_time` datetime(0) NULL DEFAULT NULL,
  `eng_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 11 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '职位表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of pms_user_position
-- ----------------------------
INSERT INTO `pms_user_position` VALUES (4, '部门主管', '', 1, '2017-11-04 11:37:46', 'BM');
INSERT INTO `pms_user_position` VALUES (3, '普通职员', 'staff member', 0, '2017-11-04 11:37:21', 'SM');
INSERT INTO `pms_user_position` VALUES (5, '项目经理', '', 2, '2017-11-04 11:37:51', 'PM');
INSERT INTO `pms_user_position` VALUES (6, '技术总监', '', 3, '2017-11-04 11:37:56', 'CTO');
INSERT INTO `pms_user_position` VALUES (7, '总经理 ', '', 4, '2017-11-04 11:38:12', 'GM');
INSERT INTO `pms_user_position` VALUES (8, '运营总监', '', 3, '2017-11-04 11:41:46', 'OD');
INSERT INTO `pms_user_position` VALUES (9, '市场总监', '', 3, '2017-11-04 11:42:02', 'MD');
INSERT INTO `pms_user_position` VALUES (10, '攻城狮', 'Programmer', 0, '2017-12-22 13:52:38', 'PG');

-- ----------------------------
-- Table structure for pms_user_setting
-- ----------------------------
DROP TABLE IF EXISTS `pms_user_setting`;
CREATE TABLE `pms_user_setting`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `value` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `name`(`name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户配置表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of pms_user_setting
-- ----------------------------
INSERT INTO `pms_user_setting` VALUES (1, 'base_setting', '{\"user_name_length_min\":\"3\",\"user_name_length_max\":\"18\",\"nick_name_length_min\":\"3\",\"nick_name_length_max\":\"12\",\"password_length_min\":\"6\",\"password_length_max\":\"18\",\"default_user_group_list\":[\"1\",\"3\",\"8\"],\"realname_length_min\":\"3\",\"realname_length_max\":\"50\"}');

-- ----------------------------
-- Table structure for pms_user_token
-- ----------------------------
DROP TABLE IF EXISTS `pms_user_token`;
CREATE TABLE `pms_user_token`  (
  `token_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '令牌编号',
  `user_id` int(10) UNSIGNED NOT NULL COMMENT '用户编号',
  `user_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户名',
  `token` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '登录令牌',
  `login_time` int(10) UNSIGNED NOT NULL COMMENT '登录时间',
  `client_type` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '客户端类型 android wap',
  `login_ip` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '登录ip',
  PRIMARY KEY (`token_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1272 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'PC端登录令牌表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of pms_user_token
-- ----------------------------
INSERT INTO `pms_user_token` VALUES (117, 1, 'vilson', '6a46d0886e7be7c074984f728cd5073b', 1503373565, '', '127.0.0.1');
INSERT INTO `pms_user_token` VALUES (118, 1, 'vilson', 'c58776c7f3fad30f836ae80c99184d41', 1503373687, '', '127.0.0.1');
INSERT INTO `pms_user_token` VALUES (119, 1, 'vilson', '0f78b01df142d65c091bbe3cd45ffa08', 1503373708, '', '127.0.0.1');
INSERT INTO `pms_user_token` VALUES (120, 1, 'vilson', '828c51ffc67c5367965c0595bd18313e', 1503374109, '', '127.0.0.1');
INSERT INTO `pms_user_token` VALUES (121, 1, 'vilson', 'c6d96a6662150bcd0cf90f2539ec0a59', 1503408652, '', '127.0.0.1');
INSERT INTO `pms_user_token` VALUES (122, 1, 'vilson', '973e8859e99f6271eb694ff04de43792', 1503409450, '', '127.0.0.1');
INSERT INTO `pms_user_token` VALUES (123, 1, 'vilson', '3d0dd5728979ff4114b97814adb4a08c', 1503409506, '', '127.0.0.1');
INSERT INTO `pms_user_token` VALUES (124, 1, 'vilson', '4769847912a563c54bb4fd833e68b866', 1503410028, '', '127.0.0.1');
INSERT INTO `pms_user_token` VALUES (125, 1, 'vilson', 'bc21d9a17a08630afb27a0127a066d81', 1503410158, '', '127.0.0.1');
INSERT INTO `pms_user_token` VALUES (126, 1, 'vilson', 'fa2ef22e8962c88a1b057cfa0c642362', 1503448662, '', '127.0.0.1');
INSERT INTO `pms_user_token` VALUES (127, 1, 'vilson', '7c7fc3ffd65a48522c11ab107dd91c44', 1503475616, '', '127.0.0.1');
INSERT INTO `pms_user_token` VALUES (128, 1, 'vilson', '60e710e122905a4d767b1af390c03bd9', 1503476158, '', '127.0.0.1');
INSERT INTO `pms_user_token` VALUES (129, 1, 'vilson', 'e1ec1fac7c50887716646d99fd857504', 1503552618, '', '127.0.0.1');
INSERT INTO `pms_user_token` VALUES (130, 1, 'vilson', 'fb360ec6cac444d3fce97fd769b9a249', 1503552988, '', '127.0.0.1');
INSERT INTO `pms_user_token` VALUES (131, 1, 'vilson', 'cbb096f2ec1a57d56733498ddb490475', 1503553141, '', '127.0.0.1');
INSERT INTO `pms_user_token` VALUES (132, 1, 'vilson', '17235a2824b04a6893f890cc1fa9c707', 1503580069, '', '127.0.0.1');
INSERT INTO `pms_user_token` VALUES (133, 1, 'vilson', '04c327840f1343ec3adfbc19d5325ba1', 1503580095, '', '127.0.0.1');
INSERT INTO `pms_user_token` VALUES (134, 1, 'vilson', '98d3af335877a093ad81851d5477c93c', 1503580291, '', '127.0.0.1');
INSERT INTO `pms_user_token` VALUES (135, 1, 'vilson', 'b1f220c8aab006430921177729e99eaa', 1503582809, '', '127.0.0.1');
INSERT INTO `pms_user_token` VALUES (136, 1, 'vilson', '0856fb19190cc486effedebee5103637', 1503582971, '', '127.0.0.1');
INSERT INTO `pms_user_token` VALUES (137, 1, 'vilson', '772e14d2d77f3c379d47192dfae68247', 1503582982, '', '127.0.0.1');
INSERT INTO `pms_user_token` VALUES (138, 1, 'vilson', '2b89ba62c72e5762292ce43e36a9491b', 1503583011, '', '127.0.0.1');
INSERT INTO `pms_user_token` VALUES (139, 1, 'vilson', '8c4c31d5f2e17745e5e20a91597ff9c5', 1503583041, '', '127.0.0.1');
INSERT INTO `pms_user_token` VALUES (140, 1, 'vilson', 'c5d5863e1008ceb75ac97d782348b754', 1503583074, '', '127.0.0.1');
INSERT INTO `pms_user_token` VALUES (141, 1, 'vilson', 'c7de322246c240fe62a8d7c05eaaf3ce', 1503583331, '', '127.0.0.1');
INSERT INTO `pms_user_token` VALUES (142, 1, 'vilson', '28671f31a027c836be2eac0a7cd229ec', 1503583371, '', '127.0.0.1');
INSERT INTO `pms_user_token` VALUES (143, 1, 'vilson', 'bf7a876268f9f66ce83ee4b2fb9921ce', 1503583889, '', '127.0.0.1');
INSERT INTO `pms_user_token` VALUES (144, 1, 'vilson', '72e5556a861028d6c1f309a2222f7d1f', 1503584067, '', '127.0.0.1');
INSERT INTO `pms_user_token` VALUES (145, 1, 'vilson', '92d9b3c3af31d88b34683b755d5e5dc7', 1503584089, '', '127.0.0.1');
INSERT INTO `pms_user_token` VALUES (146, 1, 'vilson', '94f6a126fffc8609eb4c88304e399c3f', 1503625751, '', '127.0.0.1');
INSERT INTO `pms_user_token` VALUES (147, 1, 'vilson', 'd8f7be0a51bd27aec289559c64b77d47', 1503625865, '', '127.0.0.1');
INSERT INTO `pms_user_token` VALUES (148, 1, 'vilson', '1e8c0dfd9c126c1b10b7365681482c36', 1503626228, '', '127.0.0.1');
INSERT INTO `pms_user_token` VALUES (149, 1, 'vilson', 'e705ec79588844f2e660467ed6999cb6', 1503626380, '', '127.0.0.1');
INSERT INTO `pms_user_token` VALUES (150, 1, 'vilson', '3da0fb6f7e4d163cf1581f631a6585d6', 1503626534, '', '127.0.0.1');
INSERT INTO `pms_user_token` VALUES (151, 1, 'vilson', '6cf9b1aa0b6f437a69c36890df51f284', 1503628832, '', '127.0.0.1');
INSERT INTO `pms_user_token` VALUES (152, 1, 'vilson', 'a7e00db759ade3ee974a5209b2e06b5b', 1503628883, '', '127.0.0.1');
INSERT INTO `pms_user_token` VALUES (153, 1, 'vilson', '09a6ca0c7154530e989588bc803930af', 1503628962, '', '127.0.0.1');
INSERT INTO `pms_user_token` VALUES (154, 1, 'vilson', 'b2653a8558b7534671a46a5b67533d02', 1503629169, '', '127.0.0.1');
INSERT INTO `pms_user_token` VALUES (155, 1, 'vilson', '6ad931b11274e9a17bc31459d82cedeb', 1503643397, '', '127.0.0.1');
INSERT INTO `pms_user_token` VALUES (156, 1, 'vilson', '9a8d068be41932f21b1212f09d932561', 1503646468, '', '127.0.0.1');
INSERT INTO `pms_user_token` VALUES (157, 1, 'vilson', 'd038caf906c8c5d08d85a0d873f9ef65', 1503646507, '', '127.0.0.1');
INSERT INTO `pms_user_token` VALUES (158, 1, 'vilson', '705a0550794da59be3cf4707deb5fc6a', 1503646553, '', '127.0.0.1');
INSERT INTO `pms_user_token` VALUES (159, 1, 'vilson', 'de91d31c1d1943e496a34d0902d1a883', 1503651393, '', '127.0.0.1');
INSERT INTO `pms_user_token` VALUES (160, 1, 'vilson', '2e59ffcf2dfa605665fe6ce6165fd012', 1503651475, '', '127.0.0.1');
INSERT INTO `pms_user_token` VALUES (161, 1, 'vilson', 'a83db27e3dbd6956a6bed1161dcf16ed', 1503653689, '', '127.0.0.1');
INSERT INTO `pms_user_token` VALUES (162, 1, 'vilson', '39fbfe3e6f039616a3fdcfae06c73593', 1503653709, '', '127.0.0.1');
INSERT INTO `pms_user_token` VALUES (163, 1, 'vilson', '7a99e8837888c07055fb6e586b26397d', 1503664648, '', '127.0.0.1');
INSERT INTO `pms_user_token` VALUES (164, 1, 'vilson', '7b4a56cc6fdd560058510001a7310b2f', 1503664838, '', '127.0.0.1');
INSERT INTO `pms_user_token` VALUES (165, 1, 'vilson', 'f744858721afb7929d45b085739238ef', 1503881855, '', '127.0.0.1');
INSERT INTO `pms_user_token` VALUES (166, 1, 'vilson', '014ac787b371c16fcfa7821423da6684', 1503969042, '', '127.0.0.1');
INSERT INTO `pms_user_token` VALUES (167, 1, 'vilson', 'bb825f6da914f5a719e083274243982e', 1504071453, '', '127.0.0.1');
INSERT INTO `pms_user_token` VALUES (168, 1, 'vilson', '40ba4466b085e9cb0e2e4327ac97358e', 1504526947, '', '127.0.0.1');
INSERT INTO `pms_user_token` VALUES (169, 1, 'vilson', '3be2218a8c28a3d719602967bc315879', 1504571821, '', '127.0.0.1');
INSERT INTO `pms_user_token` VALUES (170, 1, 'vilson', '61e51d9fac0395d346d7978cae63e1f5', 1504601474, '', '127.0.0.1');
INSERT INTO `pms_user_token` VALUES (171, 1, 'vilson', '68b091ad6239c4b8de5bbea5816ba5eb', 1504601960, '', '127.0.0.1');
INSERT INTO `pms_user_token` VALUES (172, 1, 'vilson', '23e5a59f252a0333b77349f3a12b7273', 1504606842, '', '127.0.0.1');
INSERT INTO `pms_user_token` VALUES (173, 1, 'vilson', '88e56a3376b4f6a79990e7c567397af6', 1504663483, '', '127.0.0.1');
INSERT INTO `pms_user_token` VALUES (174, 4, 'test1', 'a539e57bfbe1a9109ecf5f843c4fe06d', 1504751138, '', '127.0.0.1');
INSERT INTO `pms_user_token` VALUES (175, 4, 'test1', 'da456151c5544330f900d56e2c13d268', 1504751150, '', '127.0.0.1');
INSERT INTO `pms_user_token` VALUES (176, 1, 'vilson', '5d2de8ed229d6ec2aebf441267528ced', 1504751163, '', '127.0.0.1');
INSERT INTO `pms_user_token` VALUES (177, 4, 'test1', 'd98381c6e667c45353e1419263897bb8', 1504753149, '', '127.0.0.1');
INSERT INTO `pms_user_token` VALUES (178, 1, 'vilson', '94cd37238086edec93fa975a6325290d', 1504753279, '', '127.0.0.1');
INSERT INTO `pms_user_token` VALUES (179, 1, 'vilson', '56c65cae26a4020f3d57728143cc0852', 1504753851, '', '127.0.0.1');
INSERT INTO `pms_user_token` VALUES (180, 4, 'test1', 'f33a64260a7a382a7b41f672b4748fa8', 1504753860, '', '127.0.0.1');
INSERT INTO `pms_user_token` VALUES (181, 1, 'vilson', 'df62d0913ace3bab41311cd4fd00afb4', 1504753924, '', '127.0.0.1');
INSERT INTO `pms_user_token` VALUES (182, 4, 'test1', 'a7700bc61d0f1e0e5809e875c6eda880', 1504754013, '', '127.0.0.1');
INSERT INTO `pms_user_token` VALUES (183, 1, 'vilson', '0e2ecf11f5d0296c867892c4bb195c78', 1504754119, '', '127.0.0.1');
INSERT INTO `pms_user_token` VALUES (184, 4, 'test1', 'f0f2e88d5b554fb9b1fe621609ced978', 1504754189, '', '127.0.0.1');
INSERT INTO `pms_user_token` VALUES (185, 1, 'vilson', 'b4349835f350959b829d288f4d162b1b', 1504754239, '', '127.0.0.1');
INSERT INTO `pms_user_token` VALUES (186, 4, 'test1', 'd217458694faad0c2ccac1cdc662394a', 1504754560, '', '127.0.0.1');
INSERT INTO `pms_user_token` VALUES (187, 1, 'vilson', '488b8b0c61a8d9420669efb0042b51b5', 1504754784, '', '127.0.0.1');
INSERT INTO `pms_user_token` VALUES (188, 4, 'test1', '3ce6695e2a13d0b3de8c0d15a455a8d4', 1504754989, '', '127.0.0.1');
INSERT INTO `pms_user_token` VALUES (189, 1, 'vilson', '6cf0d0a50ce0898b8e5fc94b8fe5fc74', 1504755327, '', '127.0.0.1');
INSERT INTO `pms_user_token` VALUES (190, 4, 'test1', '9fb0865f6bfc52a55bad89cc6af6081d', 1504755352, '', '127.0.0.1');
INSERT INTO `pms_user_token` VALUES (191, 1, 'vilson', '6a4eca5f7979cc8bb993b155ff5f91bb', 1504755569, '', '127.0.0.1');
INSERT INTO `pms_user_token` VALUES (192, 4, 'test1', '94e28a96de884673cd87d499bcafe518', 1504755599, '', '127.0.0.1');
INSERT INTO `pms_user_token` VALUES (193, 1, 'vilson', 'c21ed17b6fbed33cc3617ce6c853707d', 1504756172, '', '127.0.0.1');
INSERT INTO `pms_user_token` VALUES (194, 4, 'test1', '9cb720934440ce76891f7852ab1c23ad', 1504756181, '', '127.0.0.1');
INSERT INTO `pms_user_token` VALUES (195, 1, 'vilson', '1a1b00fc845a282e1db10046a504c7c6', 1504756203, '', '127.0.0.1');
INSERT INTO `pms_user_token` VALUES (196, 4, 'test1', '7524d8f1dda71387820d1ad76787559e', 1504756222, '', '127.0.0.1');
INSERT INTO `pms_user_token` VALUES (197, 1, 'vilson', 'a7d7a56e9274c584fa9aa60c006f4f06', 1504756262, '', '127.0.0.1');
INSERT INTO `pms_user_token` VALUES (198, 1, 'vilson', '9169273e3f9b143e17b61fc1a3607873', 1504756288, '', '127.0.0.1');
INSERT INTO `pms_user_token` VALUES (199, 4, 'test1', '40b9851b73200ff5ed2ac3b425b957ae', 1504756306, '', '127.0.0.1');
INSERT INTO `pms_user_token` VALUES (200, 1, 'vilson', '2af1b12b526736cc5a8c1199f52cf908', 1504756318, '', '127.0.0.1');
INSERT INTO `pms_user_token` VALUES (201, 1, 'vilson', '1fd3a4b2f96fe0c3b6e4a4453cb926cc', 1504756424, '', '127.0.0.1');
INSERT INTO `pms_user_token` VALUES (202, 4, 'test1', 'f4788c54c992eacfb7dc680a4d39838b', 1504756438, '', '127.0.0.1');
INSERT INTO `pms_user_token` VALUES (203, 1, 'vilson', 'e904e9da01a2f7c2bf5c149886b04807', 1504756449, '', '127.0.0.1');
INSERT INTO `pms_user_token` VALUES (204, 4, 'test1', '2eded5dec88d701c5e756f1d4b034958', 1504756467, '', '127.0.0.1');
INSERT INTO `pms_user_token` VALUES (205, 1, 'vilson', '05b567cabc3162d26bbbf78e7e2067a5', 1504756480, '', '127.0.0.1');
INSERT INTO `pms_user_token` VALUES (206, 4, 'test1', '9460b88d091c92a9a24f968b4950d3ff', 1504756506, '', '127.0.0.1');
INSERT INTO `pms_user_token` VALUES (207, 1, 'vilson', '7719e96c0ce557dc3d07e4268bf88049', 1504756522, '', '127.0.0.1');
INSERT INTO `pms_user_token` VALUES (208, 1, 'vilson', '6b670dffbe339cd6fde176251bcb652b', 1504756604, '', '127.0.0.1');
INSERT INTO `pms_user_token` VALUES (209, 4, 'test1', 'bc5dd5a8f608092c0b4d2bd2cd297ce3', 1504756629, '', '127.0.0.1');
INSERT INTO `pms_user_token` VALUES (210, 1, 'vilson', '4889fcbff3a460d30da0b72fc11f4bcd', 1504763014, '', '127.0.0.1');
INSERT INTO `pms_user_token` VALUES (211, 1, 'vilson', '0c02e1adfd905925268e47f692f66630', 1504763131, '', '127.0.0.1');
INSERT INTO `pms_user_token` VALUES (212, 1, 'vilson', '78696bcb8314078f6cd8e5cb19725e10', 1504763358, '', '127.0.0.1');
INSERT INTO `pms_user_token` VALUES (213, 1, 'vilson', 'd6f67567dbe943f6e71a31b7b4f2f18d', 1504763479, '', '127.0.0.1');
INSERT INTO `pms_user_token` VALUES (214, 1, 'vilson', 'd74ee1f09bd42bbad2f24921b043a1a8', 1504763683, '', '127.0.0.1');
INSERT INTO `pms_user_token` VALUES (215, 1, 'vilson', '90ba400c197ab5ed5d052bf3ea71e96d', 1504763722, '', '127.0.0.1');
INSERT INTO `pms_user_token` VALUES (216, 4, 'test1', '67e9e5b17fa900707fee031d0a17aca1', 1504763731, '', '127.0.0.1');
INSERT INTO `pms_user_token` VALUES (217, 1, 'vilson', 'ee632f1028df8b704ab762ba5105acca', 1504763811, '', '127.0.0.1');
INSERT INTO `pms_user_token` VALUES (218, 4, 'test1', 'c7366ed32770cc9ce7cf95ed50d56769', 1504764741, '', '127.0.0.1');
INSERT INTO `pms_user_token` VALUES (219, 1, 'vilson', 'e44e831e9bc32db9388958de268eb547', 1504768765, '', '127.0.0.1');
INSERT INTO `pms_user_token` VALUES (220, 1, 'vilson', '8a042edbcf7e832161e90f49572c3ed3', 1504839095, '', '127.0.0.1');
INSERT INTO `pms_user_token` VALUES (221, 1, 'vilson', '6ee9230bc0a192ed29987b540d100768', 1504839123, '', '127.0.0.1');
INSERT INTO `pms_user_token` VALUES (222, 1, 'vilson', '3e95c85da641d67e66d16d85c8225aed', 1504839162, '', '127.0.0.1');
INSERT INTO `pms_user_token` VALUES (223, 1, 'vilson', 'a1ea9cd64a589f6e0880c8b872b5e2a0', 1504848668, '', '127.0.0.1');
INSERT INTO `pms_user_token` VALUES (224, 1, 'vilson', '53d71a9c042ab121c044092aa2e185d5', 1504848768, '', '127.0.0.1');
INSERT INTO `pms_user_token` VALUES (225, 1, 'vilson', '1619d3dbd4cc15b8ebb4142ba084ede3', 1504855051, '', '127.0.0.1');
INSERT INTO `pms_user_token` VALUES (226, 1, 'vilson', '2703b85d83e10d74df763a55804ea731', 1505273988, '', '127.0.0.1');
INSERT INTO `pms_user_token` VALUES (227, 1, 'vilson', 'b559626ad7ad5be06aaf7daca14c6593', 1505360434, '', '127.0.0.1');
INSERT INTO `pms_user_token` VALUES (228, 1, 'vilson', '7e099cb92bda8e5bf341831c4e8c9177', 1505382328, '', '127.0.0.1');
INSERT INTO `pms_user_token` VALUES (229, 1, 'vilson', '5762731829087976c912e05719649cbc', 1505382479, '', '127.0.0.1');
INSERT INTO `pms_user_token` VALUES (230, 1, 'vilson', 'e912af4de34ad9e8a77c8855d20915e2', 1505438672, '', '127.0.0.1');
INSERT INTO `pms_user_token` VALUES (231, 5, 'test3', '1398a5b9abf16c3cfd48b93fac9cad15', 1505439861, '', '127.0.0.1');
INSERT INTO `pms_user_token` VALUES (232, 3, 'test2', 'a16f14c40bad36d58a9e602b34a1165c', 1505440124, '', '127.0.0.1');
INSERT INTO `pms_user_token` VALUES (233, 1, 'vilson', '090ea04a27828ff9cfa778cc8b29f0ee', 1505440135, '', '127.0.0.1');
INSERT INTO `pms_user_token` VALUES (234, 1, 'vilson', '0126dfe18b5b67cbf4608964e9c15759', 1505713267, '', '127.0.0.1');
INSERT INTO `pms_user_token` VALUES (235, 1, 'vilson', '9e7558e9f2675c556806de2461af9086', 1505874990, '', '127.0.0.1');
INSERT INTO `pms_user_token` VALUES (236, 1, 'vilson', '752fac10d58b7b53ed854620813d4130', 1505875037, '', '127.0.0.1');
INSERT INTO `pms_user_token` VALUES (237, 1, 'vilson', '2793bd699c5b03d8232b78b19fb88279', 1505875103, '', '127.0.0.1');
INSERT INTO `pms_user_token` VALUES (238, 5, 'test3', '518176768094da3a2332f2cd0f38374e', 1505876902, '', '127.0.0.1');
INSERT INTO `pms_user_token` VALUES (239, 1, 'vilson', '53431f0d5e781a415c4f173305cce4dd', 1505876922, '', '127.0.0.1');
INSERT INTO `pms_user_token` VALUES (240, 1, 'vilson', '60454cb559bfe3996a0ba87ba37a95ee', 1505879661, '', '127.0.0.1');
INSERT INTO `pms_user_token` VALUES (241, 1, 'vilson', '18b7008d544e49a1cf984c480912642e', 1505900540, '', '127.0.0.1');
INSERT INTO `pms_user_token` VALUES (242, 19, '6667', 'e5023ba585b3772e529418e2308d02fb', 1505900655, '', '127.0.0.1');
INSERT INTO `pms_user_token` VALUES (243, 19, '6667', '0b953d1e384b2a464e076fee1c81deed', 1505900691, '', '127.0.0.1');
INSERT INTO `pms_user_token` VALUES (244, 19, '6667', '4f0bd142359745cfcd6203e313d62547', 1505900694, '', '127.0.0.1');
INSERT INTO `pms_user_token` VALUES (245, 19, '6667', '22b9de044cb83bfaa035b44290177896', 1505900702, '', '127.0.0.1');
INSERT INTO `pms_user_token` VALUES (246, 1, 'vilson', '4d38f674e407b571f70fbfb430e11cc7', 1505900712, '', '127.0.0.1');
INSERT INTO `pms_user_token` VALUES (247, 1, 'vilson', '55d0ab6c7ab0a60ab49a6092bc77852b', 1505988870, '', '127.0.0.1');
INSERT INTO `pms_user_token` VALUES (248, 1, 'vilson', 'fc2c2545886dd8afd6ae4f2fa4fa8706', 1505988880, '', '127.0.0.1');
INSERT INTO `pms_user_token` VALUES (249, 1, 'vilson', '6d1491547f7b23d24dac52f4fe8e7c59', 1505988885, '', '127.0.0.1');
INSERT INTO `pms_user_token` VALUES (250, 1, 'vilson', 'e1674d2a3d79d1d32131988b37cfbe21', 1505988918, '', '127.0.0.1');
INSERT INTO `pms_user_token` VALUES (251, 1, 'vilson', 'b7604a84586221be8429f5adc0605df0', 1506042687, '', '127.0.0.1');
INSERT INTO `pms_user_token` VALUES (252, 1, 'vilson', '1ad89c89e3b3153a76b720c246419a26', 1506042728, '', '127.0.0.1');
INSERT INTO `pms_user_token` VALUES (253, 1, 'vilson', '939bd3364e8968a4f0356c42dba634a2', 1506064897, '', '127.0.0.1');
INSERT INTO `pms_user_token` VALUES (254, 1, 'vilson', 'f4288d013a586e5e3cf85f477c13fecd', 1506073011, '', '127.0.0.1');
INSERT INTO `pms_user_token` VALUES (255, 1, 'vilson', '17b55224332a59d7ffdc28ad2a896c84', 1506074513, '', '127.0.0.1');
INSERT INTO `pms_user_token` VALUES (256, 1, 'vilson', '692e578cbaa957198ab88588d6928469', 1506075184, '', '127.0.0.1');
INSERT INTO `pms_user_token` VALUES (257, 1, 'vilson', 'b683682a585ef54d6da028dd7c1abd0d', 1506081574, '', '127.0.0.1');
INSERT INTO `pms_user_token` VALUES (258, 1, 'vilson', '9f3edb3a884232f81f3c9430f5064652', 1506089378, '', '127.0.0.1');
INSERT INTO `pms_user_token` VALUES (259, 1, 'vilson', '388658469f4bcac6e6fef50f9249171b', 1506137668, '', '127.0.0.1');
INSERT INTO `pms_user_token` VALUES (260, 1, 'vilson', '630cbea46382fd07ee2b776b8d8097da', 1506148004, '', '127.0.0.1');
INSERT INTO `pms_user_token` VALUES (261, 1, 'vilson', 'f296cca4a3b82f4fc6cd78e728e59068', 1506148162, '', '127.0.0.1');
INSERT INTO `pms_user_token` VALUES (262, 1, 'vilson', 'd6ccc6acfd6d571c4aa90f9bfcdf37e6', 1506149143, '', '127.0.0.1');
INSERT INTO `pms_user_token` VALUES (263, 1, 'vilson', '4c9c06c413764d856f0bcc170a94530c', 1506149867, '', '127.0.0.1');
INSERT INTO `pms_user_token` VALUES (264, 1, 'vilson', '4aca9f2d5bbb899dc0b10cac3e73ac36', 1506150855, '', '127.0.0.1');
INSERT INTO `pms_user_token` VALUES (265, 1, 'vilson', 'bdee6b3d73a573cff615f276021f136c', 1506150934, '', '127.0.0.1');
INSERT INTO `pms_user_token` VALUES (266, 1, 'vilson', 'e1a75ea4480a7998e3ae13f0da94aff7', 1506151921, '', '127.0.0.1');
INSERT INTO `pms_user_token` VALUES (267, 1, 'vilson', '61ef0c91d9a5e5c654f1e3a3d7a38537', 1506152063, '', '127.0.0.1');
INSERT INTO `pms_user_token` VALUES (268, 1, 'vilson', '7479273748d6ee705c4ea4bc14d52744', 1506152089, '', '127.0.0.1');
INSERT INTO `pms_user_token` VALUES (269, 1, 'vilson', 'e097e5428a54ba8bf8b143c92a050f05', 1506152108, '', '127.0.0.1');
INSERT INTO `pms_user_token` VALUES (270, 1, 'vilson', 'd83770f724947564b83b3414e65ff2c9', 1506152377, '', '127.0.0.1');
INSERT INTO `pms_user_token` VALUES (271, 1, 'vilson', 'aa58c2e59549a9d3440245908a35d9a0', 1506152393, '', '127.0.0.1');
INSERT INTO `pms_user_token` VALUES (272, 1, 'vilson', 'a24324caf3f34c942a11ac43890879fb', 1506152427, '', '127.0.0.1');
INSERT INTO `pms_user_token` VALUES (273, 24, 'admin', '70c1a185cb8ad578e9e900062a4d6ae4', 1506156838, '', '127.0.0.1');
INSERT INTO `pms_user_token` VALUES (274, 1, 'vilson', '1e54f984652073e109c2910e33e663ef', 1506156898, '', '127.0.0.1');
INSERT INTO `pms_user_token` VALUES (275, 24, 'admin', '6c394730cbdee105f62b0031c569327d', 1506156931, '', '127.0.0.1');
INSERT INTO `pms_user_token` VALUES (276, 1, 'vilson', '7a93e3d949219c15f9acdc07e91dd239', 1506157061, '', '127.0.0.1');
INSERT INTO `pms_user_token` VALUES (277, 24, 'admin', '52f2c81e1fefd9186d0fb98cc5133849', 1506157083, '', '127.0.0.1');
INSERT INTO `pms_user_token` VALUES (278, 24, 'admin', 'be917aefd7c4f22dd8749e62aa062883', 1506159357, '', '127.0.0.1');
INSERT INTO `pms_user_token` VALUES (279, 24, 'admin', '3ad48791351fa148c9c54b4d6db58c20', 1506159644, '', '127.0.0.1');
INSERT INTO `pms_user_token` VALUES (280, 24, 'admin', 'a06cb32a6e38bcda10af90e76d24abf9', 1506322980, '', '127.0.0.1');
INSERT INTO `pms_user_token` VALUES (281, 24, 'admin', '3272ea1d8cd05751ee22b7ec6146aad9', 1506414050, '', '127.0.0.1');
INSERT INTO `pms_user_token` VALUES (282, 24, 'admin', 'b2a0782ad44f3393a1320265331f6dd3', 1506419233, '', '127.0.0.1');
INSERT INTO `pms_user_token` VALUES (283, 24, 'admin', 'bd4f9d71ff33752a3f2362edcbbdd574', 1506419722, '', '127.0.0.1');
INSERT INTO `pms_user_token` VALUES (284, 24, 'admin', '42a6cdafb3c927da91b9a6ec14a266bb', 1506419763, '', '127.0.0.1');
INSERT INTO `pms_user_token` VALUES (285, 24, 'admin', 'd52f660f3d35c06a4ae149eb148b8ad2', 1506419981, '', '127.0.0.1');
INSERT INTO `pms_user_token` VALUES (286, 24, 'admin', '8934eb8340c01283187eb19068a81765', 1506419987, '', '127.0.0.1');
INSERT INTO `pms_user_token` VALUES (287, 24, 'admin', '0437fbe4c49c19f7a947a20db66a9ff7', 1506419991, '', '127.0.0.1');
INSERT INTO `pms_user_token` VALUES (288, 24, 'admin', '418533cfd53ef553938d0d86c9733567', 1506421547, '', '127.0.0.1');
INSERT INTO `pms_user_token` VALUES (289, 24, 'admin', '16113c4739d3ae99e5758ccab449b71f', 1506421810, '', '127.0.0.1');
INSERT INTO `pms_user_token` VALUES (290, 24, 'admin', 'f2757a928964baabab0f58f644cc3bc5', 1506422011, '', '127.0.0.1');
INSERT INTO `pms_user_token` VALUES (291, 24, 'admin', '50ad8324f2c5f8f559a6d3f2caf0fe06', 1506433177, '', '127.0.0.1');
INSERT INTO `pms_user_token` VALUES (292, 24, 'admin', 'fed375662b797a643b905d25eb1c9c98', 1508147214, '', '127.0.0.1');
INSERT INTO `pms_user_token` VALUES (293, 24, 'admin', '61b99c262b3b3d73a37cdbd4fe1115c4', 1508148477, '', '127.0.0.1');
INSERT INTO `pms_user_token` VALUES (294, 24, 'admin', 'f26b5abfcc35f743b89c718718bb38da', 1508149133, '', '127.0.0.1');
INSERT INTO `pms_user_token` VALUES (295, 24, 'admin', '0f03f7346b98a8f5468db787fe9252fc', 1508149500, '', '127.0.0.1');
INSERT INTO `pms_user_token` VALUES (296, 1, 'vilson', '240dc41e1c17e66cac2ea0d44ec702ad', 1508163356, '', '127.0.0.1');
INSERT INTO `pms_user_token` VALUES (297, 1, 'vilson', '5aa02b03532699ae0e346ea14c59d8c3', 1508205677, '', '127.0.0.1');
INSERT INTO `pms_user_token` VALUES (298, 23, 'Jack', '2cb52cc54edd037c13dd51a98288cb6a', 1508212912, '', '127.0.0.1');
INSERT INTO `pms_user_token` VALUES (299, 1, 'vilson', '449553c38bbf4239a5ef01a9431ebbdd', 1508212954, '', '127.0.0.1');
INSERT INTO `pms_user_token` VALUES (300, 23, 'Jack', '1ce1dbca2224f618dec89a5050fa96d7', 1508212980, '', '127.0.0.1');
INSERT INTO `pms_user_token` VALUES (301, 1, 'vilson', 'efb58d68ab95cdfd69bf3290e05889e3', 1508213040, '', '127.0.0.1');
INSERT INTO `pms_user_token` VALUES (302, 1, 'vilson', 'd8bd0136a4914385e40e44d398844d96', 1508218835, '', '127.0.0.1');
INSERT INTO `pms_user_token` VALUES (303, 1, 'vilson', '30ce9432e194b7970767e2f39ae8676f', 1508328325, '', '127.0.0.1');
INSERT INTO `pms_user_token` VALUES (304, 1, 'vilson', 'd8e6fd4e256fd99d8fd848de622cd42b', 1508328412, '', '127.0.0.1');
INSERT INTO `pms_user_token` VALUES (305, 1, 'vilson', 'ef44d3b88a5b4741addbf5695a57c99c', 1508328608, '', '127.0.0.1');
INSERT INTO `pms_user_token` VALUES (306, 1, 'vilson', 'd522c11b9bc9fd3609c2a4614842706a', 1508328671, '', '127.0.0.1');
INSERT INTO `pms_user_token` VALUES (307, 1, 'vilson', 'a9012f4ff6fb74c7faa9b35a2ce29c99', 1508405252, '', '127.0.0.1');
INSERT INTO `pms_user_token` VALUES (308, 24, 'admin', '4961cbdd84430d26d66d30a81dcfad6c', 1508478161, '', '127.0.0.1');
INSERT INTO `pms_user_token` VALUES (309, 24, 'admin', '5c0de1d5cfcd1e9305cba7cbb1e19fd2', 1508478166, '', '127.0.0.1');
INSERT INTO `pms_user_token` VALUES (310, 24, 'admin', 'e21b74eca36d2cd5e2258942f03b9d6b', 1508478187, '', '127.0.0.1');
INSERT INTO `pms_user_token` VALUES (311, 24, 'admin', '88277f66e8c68246fc9224dbba3cc4d5', 1508478338, '', '127.0.0.1');
INSERT INTO `pms_user_token` VALUES (312, 1, 'vilson', '7ef3d1c3a1578f6ba9ffed9d18be4875', 1508488547, '', '127.0.0.1');
INSERT INTO `pms_user_token` VALUES (313, 1, 'vilson', '6d26bbedd04dd5d486106aeab71d7c21', 1508489331, '', '127.0.0.1');
INSERT INTO `pms_user_token` VALUES (314, 1, 'vilson', '816a67b87413645e00965a927e0eae50', 1508489375, '', '127.0.0.1');
INSERT INTO `pms_user_token` VALUES (315, 1, 'vilson', 'f80dd8aef534e72c1bd80c446d03f4ce', 1508507411, '', '127.0.0.1');
INSERT INTO `pms_user_token` VALUES (316, 1, 'vilson', '5eeee0d1203dca952dfb6658ada00627', 1508507506, '', '127.0.0.1');
INSERT INTO `pms_user_token` VALUES (317, 1, 'vilson', '12b3f32aabfc2cfcfcf9163720cacf8d', 1508596892, '', '127.0.0.1');
INSERT INTO `pms_user_token` VALUES (318, 1, 'vilson', '3f4b7f0d495e1d2d16ee0015734aff5a', 1508641111, '', '127.0.0.1');
INSERT INTO `pms_user_token` VALUES (319, 1, 'vilson', '8f1dbd2c9058ecad52213254777cf991', 1508641150, '', '127.0.0.1');
INSERT INTO `pms_user_token` VALUES (320, 1, 'vilson', 'ef26ccda154d632bd0e5c5f1ac6fefc8', 1508641277, '', '127.0.0.1');
INSERT INTO `pms_user_token` VALUES (321, 1, 'vilson', 'a63c4dce3fadae72c42462dd66af10c5', 1508641308, '', '127.0.0.1');
INSERT INTO `pms_user_token` VALUES (322, 1, 'vilson', 'ced1ed5443cb436a2af1d4977741a223', 1508642132, '', '127.0.0.1');
INSERT INTO `pms_user_token` VALUES (323, 1, 'vilson', '2ff82b69953256eec196c56a78f838f6', 1508642159, '', '127.0.0.1');
INSERT INTO `pms_user_token` VALUES (324, 1, 'vilson', '412eff5eec8f466b830e400c8b15974a', 1508642179, '', '127.0.0.1');
INSERT INTO `pms_user_token` VALUES (325, 1, 'vilson', '9d98f61e01993116d7f2aef2d1d5f24b', 1508720016, '', '127.0.0.1');
INSERT INTO `pms_user_token` VALUES (326, 1, 'vilson', 'cf7fbdddd609be041fda4a2cfdcd5312', 1508816660, '', '127.0.0.1');
INSERT INTO `pms_user_token` VALUES (327, 24, 'admin', '42cd08de9987d1a825ebb31ee23256fe', 1508816720, '', '127.0.0.1');
INSERT INTO `pms_user_token` VALUES (328, 24, 'admin', '3c1511917199730be08790a7f78fbd63', 1508816898, '', '127.0.0.1');
INSERT INTO `pms_user_token` VALUES (329, 1, 'vilson', '536f11012f17a1cd61d503caffd4da0f', 1508817008, '', '127.0.0.1');
INSERT INTO `pms_user_token` VALUES (330, 24, 'admin', 'adf40004e684be425a9ce5672a3edefb', 1508817032, '', '127.0.0.1');
INSERT INTO `pms_user_token` VALUES (331, 1, 'vilson', '2ab8c199b8115425bbffebe08c70504c', 1508817045, '', '127.0.0.1');
INSERT INTO `pms_user_token` VALUES (332, 1, 'vilson', '1b84d96d870a76b48afc94df79b01b72', 1508817272, '', '127.0.0.1');
INSERT INTO `pms_user_token` VALUES (333, 1, 'vilson', 'd3a268daa882913ca3264ab3102b0b20', 1508903738, '', '127.0.0.1');
INSERT INTO `pms_user_token` VALUES (334, 1, 'vilson', 'f294e2bab2ed86de3e501bc745862823', 1508911190, '', '127.0.0.1');
INSERT INTO `pms_user_token` VALUES (335, 1, 'vilson', 'b9d75cfdf916c73c78dcf34adacf09c4', 1508920005, '', '127.0.0.1');
INSERT INTO `pms_user_token` VALUES (336, 1, 'vilson', 'da87a58646927328c7fb298877f80e78', 1508920140, '', '127.0.0.1');
INSERT INTO `pms_user_token` VALUES (337, 1, 'vilson', '6b520bf69af069417277d8a30d5f7fc0', 1508920165, '', '127.0.0.1');
INSERT INTO `pms_user_token` VALUES (338, 1, 'vilson', '5dea2f56074fc8a3c4b3a6091ae612e5', 1508920214, '', '127.0.0.1');
INSERT INTO `pms_user_token` VALUES (339, 1, 'vilson', 'c0e82da686231ec5004419548df7fadd', 1508920279, '', '127.0.0.1');
INSERT INTO `pms_user_token` VALUES (340, 1, 'vilson', '618a9aab8ae2f17ab9d4c92f5d8a4fa0', 1508920300, '', '127.0.0.1');
INSERT INTO `pms_user_token` VALUES (341, 1, 'vilson', '1eb3c5cd48324bc9803254f7cd27b8ce', 1508920334, '', '127.0.0.1');
INSERT INTO `pms_user_token` VALUES (342, 1, 'vilson', 'e23bd33dddbec58a185fc3d33d06e893', 1508920369, '', '127.0.0.1');
INSERT INTO `pms_user_token` VALUES (343, 1, 'vilson', '33448e20283d98b0ae4f1f13b38f8b64', 1508920420, '', '127.0.0.1');
INSERT INTO `pms_user_token` VALUES (344, 1, 'vilson', 'c69b4382c7a851ad90c9ee0bce587d85', 1508920500, '', '127.0.0.1');
INSERT INTO `pms_user_token` VALUES (345, 1, 'vilson', 'eb8fded2fbb4c7e6b7658d36cb3bec37', 1508920542, '', '127.0.0.1');
INSERT INTO `pms_user_token` VALUES (346, 1, 'vilson', 'a8ea5a3f035b246712c1a109237058df', 1508920636, '', '127.0.0.1');
INSERT INTO `pms_user_token` VALUES (347, 1, 'vilson', '77052e4891497fc098b4e968144e8a6e', 1508920905, '', '127.0.0.1');
INSERT INTO `pms_user_token` VALUES (348, 1, 'vilson', '0c0b2983bed0eaa52300336ffad1122e', 1508921083, '', '127.0.0.1');
INSERT INTO `pms_user_token` VALUES (349, 1, 'vilson', 'b4dbd193a1befe93fc49384cb20c4eb3', 1508921718, '', '127.0.0.1');
INSERT INTO `pms_user_token` VALUES (350, 1, 'vilson', 'eac5722008a6c3c2137443fbe2daf465', 1508922003, '', '127.0.0.1');
INSERT INTO `pms_user_token` VALUES (351, 1, 'vilson', 'd12d3603547465fa43bea161ca9727f1', 1508922043, '', '127.0.0.1');
INSERT INTO `pms_user_token` VALUES (352, 1, 'vilson', '02d5db42d7837806539b5bed55e7dbf6', 1508922240, '', '127.0.0.1');
INSERT INTO `pms_user_token` VALUES (353, 1, 'vilson', '12e18fb10d31c6ed32f8667af951a0f0', 1508922429, '', '127.0.0.1');
INSERT INTO `pms_user_token` VALUES (354, 1, 'vilson', 'ee4a2ff146effb4bf11ec0adfb33687d', 1508922999, '', '127.0.0.1');
INSERT INTO `pms_user_token` VALUES (355, 1, 'vilson', 'd93574ae9d0e1c446d3ea5301eaf06d8', 1508923963, '', '127.0.0.1');
INSERT INTO `pms_user_token` VALUES (356, 1, 'vilson', '71f665b6f0111ea5b59bdf8fe5b64876', 1508924022, '', '127.0.0.1');
INSERT INTO `pms_user_token` VALUES (357, 1, 'vilson', '6f2c2f835c9b6af402569555a347a2f8', 1508924133, '', '127.0.0.1');
INSERT INTO `pms_user_token` VALUES (358, 1, 'vilson', '32910acf42add77f7cdd7e8eae577409', 1508924260, '', '127.0.0.1');
INSERT INTO `pms_user_token` VALUES (359, 1, 'vilson', '508460569dfbef1480101ed5bccdb188', 1508924307, '', '127.0.0.1');
INSERT INTO `pms_user_token` VALUES (360, 1, 'vilson', 'f522b3027c7d91356a1f6f1c2afb000c', 1508924351, '', '127.0.0.1');
INSERT INTO `pms_user_token` VALUES (361, 1, 'vilson', '62b43a6869dc3eacb8084812dd883e1f', 1508924471, '', '127.0.0.1');
INSERT INTO `pms_user_token` VALUES (362, 1, 'vilson', '33acf7f7254f58061f1283a7295b261c', 1508924515, '', '127.0.0.1');
INSERT INTO `pms_user_token` VALUES (363, 1, 'vilson', 'fbf43cfca4a8d9fbb5a0703a76fb1922', 1508924628, '', '127.0.0.1');
INSERT INTO `pms_user_token` VALUES (364, 1, 'vilson', '30b8c2b0e01e593645a09bf41cd8b475', 1508924669, '', '127.0.0.1');
INSERT INTO `pms_user_token` VALUES (365, 1, 'vilson', '9a57fd698c3d65a4c7963d33424f257c', 1508924685, '', '127.0.0.1');
INSERT INTO `pms_user_token` VALUES (366, 1, 'vilson', 'e8993e683d3b3e2c9581b5b0c7d22014', 1508934269, '', '127.0.0.1');
INSERT INTO `pms_user_token` VALUES (367, 1, 'vilson', '59fe4efdab54c87a5795772b7668d64e', 1508989427, '', '127.0.0.1');
INSERT INTO `pms_user_token` VALUES (368, 1, 'vilson', 'eaf37113dc3eb41baae664397421e835', 1508989647, '', '127.0.0.1');
INSERT INTO `pms_user_token` VALUES (369, 1, 'vilson', 'c39f14ee4881b69263a4e080f5d3523e', 1508989690, '', '127.0.0.1');
INSERT INTO `pms_user_token` VALUES (370, 1, 'vilson', '449c9e0a8216c8c38d9a146a2d7e28c3', 1508989759, '', '127.0.0.1');
INSERT INTO `pms_user_token` VALUES (371, 1, 'vilson', 'dd9a414fc573f365177a85dd67af1249', 1508998894, '', '127.0.0.1');
INSERT INTO `pms_user_token` VALUES (372, 1, 'vilson', 'cf649611b5d901e2f7d7e76d633ec8ee', 1508999022, '', '127.0.0.1');
INSERT INTO `pms_user_token` VALUES (373, 1, 'vilson', 'c32213a00a02b548693d3adb6e6e8d18', 1508999250, '', '127.0.0.1');
INSERT INTO `pms_user_token` VALUES (374, 1, 'vilson', 'c99409903ec41f2390d15d5005bffb22', 1509023229, '', '127.0.0.1');
INSERT INTO `pms_user_token` VALUES (375, 1, 'vilson', '1858cfe3e54f3ae3ccabab11b0c71b05', 1509023307, '', '127.0.0.1');
INSERT INTO `pms_user_token` VALUES (376, 1, 'vilson', '40b0a5a04b4e4cadf8897304f7b43417', 1509023338, '', '127.0.0.1');
INSERT INTO `pms_user_token` VALUES (377, 1, 'vilson', '748fbc3c5c30a084cee62517b626820c', 1509023371, '', '127.0.0.1');
INSERT INTO `pms_user_token` VALUES (378, 1, 'vilson', '13a7c073549f5cfcdb7b86d33063b1b4', 1509023414, '', '127.0.0.1');
INSERT INTO `pms_user_token` VALUES (379, 1, 'vilson', '06af87002322cc3b0c1e9b0f43dfe141', 1509023668, '', '127.0.0.1');
INSERT INTO `pms_user_token` VALUES (380, 1, 'vilson', '45ea387b679c86fbfe8644c5f843dea1', 1509023709, '', '127.0.0.1');
INSERT INTO `pms_user_token` VALUES (381, 1, 'vilson', '5b06b3261c034be273cd1de527e9f24a', 1509023987, '', '127.0.0.1');
INSERT INTO `pms_user_token` VALUES (382, 1, 'vilson', '5df430437573c63b52e1bff2b396c705', 1509024020, '', '127.0.0.1');
INSERT INTO `pms_user_token` VALUES (383, 1, 'vilson', '17411dfec9fcdf938175c8c092ea1957', 1509024048, '', '127.0.0.1');
INSERT INTO `pms_user_token` VALUES (384, 1, 'vilson', 'ba347c7778d3ba577348e8dac3d4977b', 1509024138, '', '127.0.0.1');
INSERT INTO `pms_user_token` VALUES (385, 1, 'vilson', 'c2827249b75ba16c6ea16357653e0d30', 1509065729, '', '127.0.0.1');
INSERT INTO `pms_user_token` VALUES (386, 1, 'vilson', '0e8815a376d2b8a2f4c4b4d537e2bd5a', 1509065786, '', '127.0.0.1');
INSERT INTO `pms_user_token` VALUES (387, 1, 'vilson', 'c588c9c8c33b19b3e233c88b3dead30e', 1509076382, '', '127.0.0.1');
INSERT INTO `pms_user_token` VALUES (388, 1, 'vilson', 'c922e56265cd915f8537e6dc1b96c86d', 1509083717, '', '127.0.0.1');
INSERT INTO `pms_user_token` VALUES (389, 1, 'vilson', 'd6d148a4422a81b32a71ec3acba6899b', 1509083728, '', '127.0.0.1');
INSERT INTO `pms_user_token` VALUES (390, 1, 'vilson', 'd29b7a0ca41401a15ae625f777cc9196', 1509098763, '', '127.0.0.1');
INSERT INTO `pms_user_token` VALUES (391, 1, 'vilson', 'b925209e4ceb839b8357ff933e159673', 1509102430, '', '127.0.0.1');
INSERT INTO `pms_user_token` VALUES (392, 1, 'vilson', 'ec1bf11ba974f89018777a8c69860f88', 1509102439, '', '127.0.0.1');
INSERT INTO `pms_user_token` VALUES (393, 1, 'vilson', 'ebc765bd596f43f67819899ca06180a7', 1509195644, '', '127.0.0.1');
INSERT INTO `pms_user_token` VALUES (394, 1, 'vilson', 'cd57299d09a9779886932d6289b46da0', 1509242309, '', '127.0.0.1');
INSERT INTO `pms_user_token` VALUES (395, 1, 'vilson', '796ba39ce808c69b6fad2e5040d44335', 1509242442, '', '127.0.0.1');
INSERT INTO `pms_user_token` VALUES (396, 1, 'vilson', 'eedd10f9383e99c8adf24318c17a37c7', 1509251535, '', '127.0.0.1');
INSERT INTO `pms_user_token` VALUES (397, 1, 'vilson', 'f22cf03f9d058d60091fc14433d1d4f9', 1509278618, '', '127.0.0.1');
INSERT INTO `pms_user_token` VALUES (398, 1, 'vilson', '2c1b23c03882f52f3044ead86191b05c', 1509278648, '', '127.0.0.1');
INSERT INTO `pms_user_token` VALUES (399, 1, 'vilson', 'b046f08efe49bc9dced93b18cc0a98ac', 1509278774, '', '127.0.0.1');
INSERT INTO `pms_user_token` VALUES (400, 1, 'vilson', 'b5970e68d2df300bdc6469185ea6b4e8', 1509278810, '', '127.0.0.1');
INSERT INTO `pms_user_token` VALUES (401, 1, 'vilson', 'eb2409104c3348063a4c56b5bae2b7ed', 1509278889, '', '127.0.0.1');
INSERT INTO `pms_user_token` VALUES (402, 1, 'vilson', '9ad2780793003d02bf4cf79571161d60', 1509278896, '', '127.0.0.1');
INSERT INTO `pms_user_token` VALUES (403, 1, 'vilson', '46044dbbba03afa0632aed8f5e674106', 1509286625, '', '127.0.0.1');
INSERT INTO `pms_user_token` VALUES (404, 1, 'vilson', '7cb0f49f014540eb1b142f13eafe0f3c', 1509286799, '', '127.0.0.1');
INSERT INTO `pms_user_token` VALUES (405, 1, 'vilson', '25de8f713bc9b160b7db1734d457d6e7', 1509286831, '', '127.0.0.1');
INSERT INTO `pms_user_token` VALUES (406, 1, 'vilson', '553c8ed9e7f2e61f815c15b807606d52', 1509287250, '', '127.0.0.1');
INSERT INTO `pms_user_token` VALUES (407, 1, 'vilson', '690766110c1eedf5c3d50019812fb9a8', 1509287404, '', '127.0.0.1');
INSERT INTO `pms_user_token` VALUES (408, 1, 'vilson', 'eb8bd5e99124ad8a62395a51ad1baf2a', 1509287436, '', '127.0.0.1');
INSERT INTO `pms_user_token` VALUES (409, 1, 'vilson', '157738e2f2b6becb768c2ad3262b6a6a', 1509323571, '', '127.0.0.1');
INSERT INTO `pms_user_token` VALUES (410, 1, 'vilson', '3ab84b81b9a2df1865bbbf2dbc7c6d7d', 1509325918, '', '127.0.0.1');
INSERT INTO `pms_user_token` VALUES (411, 1, 'vilson', 'b01ed2991855b925db446ccc9e361c66', 1509325953, '', '127.0.0.1');
INSERT INTO `pms_user_token` VALUES (412, 1, 'vilson', '708327ea5f10d054656e32968fb118d5', 1509334248, '', '127.0.0.1');
INSERT INTO `pms_user_token` VALUES (413, 1, 'vilson', '8276633f1cd63e1db4a05cc40c4041d0', 1509334286, '', '127.0.0.1');
INSERT INTO `pms_user_token` VALUES (414, 1, 'vilson', '78726f396e70ffc313db85d438f428b8', 1509334338, '', '127.0.0.1');
INSERT INTO `pms_user_token` VALUES (415, 1, 'vilson', '6eb669d3ecdb887c2f9cc2aecc7ee485', 1509616896, '', '127.0.0.1');
INSERT INTO `pms_user_token` VALUES (416, 1, 'vilson', 'ca79a2383312456b6c6f85ad6ecf14f6', 1509703405, '', '127.0.0.1');
INSERT INTO `pms_user_token` VALUES (417, 1, 'vilson', '413cecbd4fa6bb6129687962123683f0', 1509765964, '', '127.0.0.1');
INSERT INTO `pms_user_token` VALUES (418, 1, 'vilson', '9b1f26d460b9e9b67c61d47a8b59f5af', 1509766005, '', '127.0.0.1');
INSERT INTO `pms_user_token` VALUES (419, 1, 'vilson', '70efdd2be26725b1159d149abb555162', 1509766136, '', '127.0.0.1');
INSERT INTO `pms_user_token` VALUES (420, 1, 'vilson', 'dda088b72de37f5dfa08925a4583f15e', 1509766160, '', '127.0.0.1');
INSERT INTO `pms_user_token` VALUES (421, 1, 'vilson', 'cbabc00a8d0f0f34fd827bebd078be09', 1509766208, '', '127.0.0.1');
INSERT INTO `pms_user_token` VALUES (422, 1, 'vilson', 'fa0c270c5ca3fe8f4e0ceeb0be9d9e51', 1509766210, '', '127.0.0.1');
INSERT INTO `pms_user_token` VALUES (423, 1, 'vilson', '2738528ad7240b7cfb8568a3b821ed76', 1509892386, '', '127.0.0.1');
INSERT INTO `pms_user_token` VALUES (424, 1, 'vilson', '069a48646351f76983447e74f2bccf9c', 1510019856, '', '127.0.0.1');
INSERT INTO `pms_user_token` VALUES (425, 1, 'vilson', '4752e2333140fe05a834425e5fc64194', 1510048888, '', '127.0.0.1');
INSERT INTO `pms_user_token` VALUES (426, 1, 'vilson', '59860982f5ab6c180b22f42739d32036', 1510048898, '', '127.0.0.1');
INSERT INTO `pms_user_token` VALUES (427, 1, 'vilson', '6d2e0f7b4560d3333191b5ebce782a0e', 1510133780, '', '127.0.0.1');
INSERT INTO `pms_user_token` VALUES (428, 1, 'vilson', 'c5f6fe654bdbf74d9754d6f6d20709b3', 1510133844, '', '127.0.0.1');
INSERT INTO `pms_user_token` VALUES (429, 1, 'vilson', 'b21defc3de4b28edb5ec3363d627f40f', 1510133988, '', '127.0.0.1');
INSERT INTO `pms_user_token` VALUES (430, 1, 'vilson', 'da486fdb1995a9826ba911d7ad7e1d3a', 1510234720, '', '127.0.0.1');
INSERT INTO `pms_user_token` VALUES (431, 1, 'vilson', 'b5cdaf86e37793f2f503e635f88ce992', 1510323061, '', '127.0.0.1');
INSERT INTO `pms_user_token` VALUES (432, 1, 'vilson', '0e458621a9fb6b4baddac50bda5df291', 1510413740, '', '127.0.0.1');
INSERT INTO `pms_user_token` VALUES (433, 32, 'jiangzheng', 'a1b2f4ae60c5dd17fafb1313a889b548', 1510563339, '', '127.0.0.1');
INSERT INTO `pms_user_token` VALUES (434, 1, 'vilson', '5f651c2a2d59256fc0e532b154f54e64', 1510563351, '', '127.0.0.1');
INSERT INTO `pms_user_token` VALUES (435, 32, 'jiangzheng', '14bcd65a89d7f564b51fdb8c99c51a8e', 1510563465, '', '127.0.0.1');
INSERT INTO `pms_user_token` VALUES (436, 1, 'vilson', 'f73f089b657bf7bfa5b6367081a172e5', 1510565804, '', '127.0.0.1');
INSERT INTO `pms_user_token` VALUES (437, 32, 'jiangzheng', 'ed407be7d26f4762412ec794d3a5821a', 1510565981, '', '127.0.0.1');
INSERT INTO `pms_user_token` VALUES (438, 1, 'vilson', '2077a733b8fd1a71506b1d55da6553cc', 1510566007, '', '127.0.0.1');
INSERT INTO `pms_user_token` VALUES (439, 1, 'vilson', 'b4ea23f5fec19598f04d45433b1604e1', 1510652867, '', '127.0.0.1');
INSERT INTO `pms_user_token` VALUES (440, 1, 'vilson', '8b61f3d0e3c7d4cd1b1b56396f126527', 1510739985, '', '127.0.0.1');
INSERT INTO `pms_user_token` VALUES (441, 1, 'vilson', '83687a418958bf9e3baa9fc345719a1e', 1510795093, '', '127.0.0.1');
INSERT INTO `pms_user_token` VALUES (442, 32, 'jiangzheng', 'f0f1c7c3530d7c07cff33fe3de8ffdf1', 1510795109, '', '127.0.0.1');
INSERT INTO `pms_user_token` VALUES (443, 32, 'jiangzheng', 'fde4faed3818e662b5ce4d46b8e8f605', 1510795368, '', '127.0.0.1');
INSERT INTO `pms_user_token` VALUES (444, 1, 'vilson', '0cdfd9124b11f05b2ae8ac559a0bd064', 1510795846, '', '127.0.0.1');
INSERT INTO `pms_user_token` VALUES (445, 1, 'vilson', 'daf52fceaf005652ccee35e5c978b609', 1510797006, '', '127.0.0.1');
INSERT INTO `pms_user_token` VALUES (446, 32, 'jiangzheng', 'abbc7baaec883427761e40b7dde9774d', 1510798265, '', '127.0.0.1');
INSERT INTO `pms_user_token` VALUES (447, 1, 'liweisen', '10c65a10706f2a98e65d515c9554aef4', 1510800696, '', '127.0.0.1');
INSERT INTO `pms_user_token` VALUES (448, 1, 'liweisen', 'a8b85150246ade0698cebbaa0fe5fd4d', 1510800759, '', '127.0.0.1');
INSERT INTO `pms_user_token` VALUES (449, 1, 'liweisen', 'd810c2a23d88c11c6d5805ba9c351780', 1510800906, '', '127.0.0.1');
INSERT INTO `pms_user_token` VALUES (450, 31, 'luoxingchang', '359c66f9896a2d5e6524e1c690f82cfa', 1510800918, '', '127.0.0.1');
INSERT INTO `pms_user_token` VALUES (451, 1, 'liweisen', '132c41611ce13d67d8ac0e6dedc0a467', 1510800997, '', '127.0.0.1');
INSERT INTO `pms_user_token` VALUES (452, 1, 'liweisen', '283f72699abb4a57d5ba8bc1982a9407', 1510810628, '', '127.0.0.1');
INSERT INTO `pms_user_token` VALUES (453, 1, 'liweisen', 'e5002580b7cc41447765c3dbfa8e23b5', 1510810680, '', '127.0.0.1');
INSERT INTO `pms_user_token` VALUES (454, 31, 'luoxingchang', '036077d240b8e6f0b7efc331ab23b577', 1510811042, '', '127.0.0.1');
INSERT INTO `pms_user_token` VALUES (455, 1, 'liweisen', '281f8a010381791029932d20fcbdd973', 1510811151, '', '127.0.0.1');
INSERT INTO `pms_user_token` VALUES (456, 1, 'liweisen', 'b29016d8caf7cc8bd14005bb487abf88', 1510811304, '', '127.0.0.1');
INSERT INTO `pms_user_token` VALUES (457, 1, 'liweisen', 'eef033f4422143b034f11c1372d7f47d', 1510811525, '', '127.0.0.1');
INSERT INTO `pms_user_token` VALUES (458, 31, 'luoxingchang', '39812c96004a6e7612766d3246b3e112', 1510812221, '', '127.0.0.1');
INSERT INTO `pms_user_token` VALUES (459, 31, 'luoxingchang', 'b21fb76ae18faa013929b6a431a9400a', 1510812236, '', '127.0.0.1');
INSERT INTO `pms_user_token` VALUES (460, 31, 'luoxingchang', '99df7122e4809688abcbf385896e9c9d', 1510812305, '', '127.0.0.1');
INSERT INTO `pms_user_token` VALUES (461, 1, 'liweisen', '5d6b510eb5ec3af36168c6fdd7d06554', 1510812413, '', '127.0.0.1');
INSERT INTO `pms_user_token` VALUES (462, 1, 'liweisen', 'c11dcb34de7e484275485d4df51656a7', 1510812491, '', '127.0.0.1');
INSERT INTO `pms_user_token` VALUES (463, 1, 'liweisen', '4b85b9c346a869f61c9faccadaa81eb8', 1510812611, '', '127.0.0.1');
INSERT INTO `pms_user_token` VALUES (464, 1, 'liweisen', '2a7a7e6b04109cbd3b896f4f90b78b55', 1510812646, '', '127.0.0.1');
INSERT INTO `pms_user_token` VALUES (465, 1, 'liweisen', '8c1e79b7e258cbc4aab4bc13bfc4ec3f', 1510812791, '', '127.0.0.1');
INSERT INTO `pms_user_token` VALUES (466, 1, 'liweisen', '36804d1211502c2f960f36f7f9d684cc', 1510812935, '', '127.0.0.1');
INSERT INTO `pms_user_token` VALUES (467, 1, 'liweisen', '96c117cce5905ebbcd05d2f950b8b011', 1510812967, '', '127.0.0.1');
INSERT INTO `pms_user_token` VALUES (468, 1, 'liweisen', 'c2f9b2cffa5e98ea1f06ad54da8f1d8d', 1510819793, '', '192.168.1.143');
INSERT INTO `pms_user_token` VALUES (469, 33, 'wangpei', 'bb47450ea8afdc8e859e19e7806f8ceb', 1510820032, '', '192.168.1.143');
INSERT INTO `pms_user_token` VALUES (470, 33, 'wangpei', '052f9d9232642a6efc81594849c13115', 1510820041, '', '192.168.1.143');
INSERT INTO `pms_user_token` VALUES (471, 33, 'wangpei', 'bba734da9b0aabbd91e0f0a2638c6b48', 1510820042, '', '192.168.1.143');
INSERT INTO `pms_user_token` VALUES (472, 33, 'wangpei', 'e4cdd7eb617747506bb9e1cd80ab7914', 1510820043, '', '192.168.1.143');
INSERT INTO `pms_user_token` VALUES (473, 33, 'wangpei', 'd9bf5199f3337559820bdb9b07ed6118', 1510820043, '', '192.168.1.143');
INSERT INTO `pms_user_token` VALUES (474, 33, 'wangpei', '23548d28aba6aea4724030bb065ae5b6', 1510820046, '', '192.168.1.143');
INSERT INTO `pms_user_token` VALUES (475, 33, 'wangpei', '442754f67453ec476b29a5699ed88053', 1510820068, '', '192.168.1.143');
INSERT INTO `pms_user_token` VALUES (476, 1, 'liweisen', 'fa3c5fdfe2bfaab64e49cd823edd3011', 1510820073, '', '192.168.1.143');
INSERT INTO `pms_user_token` VALUES (477, 33, 'wangpei', '750a3a451dff9870fe76c169b8e8d0b0', 1510820099, '', '192.168.1.143');
INSERT INTO `pms_user_token` VALUES (478, 1, 'liweisen', '6cecd9d18b2a85aecd14554e66ba52a0', 1510820159, '', '192.168.1.143');
INSERT INTO `pms_user_token` VALUES (479, 31, 'luoxingchang', '6252e34ab539f8d98b830cc9f2e3dc71', 1510820192, '', '192.168.1.143');
INSERT INTO `pms_user_token` VALUES (480, 24, 'liushaowei', 'd2a2d2741b1ba2254d3c37a6ebc0d25b', 1510820215, '', '192.168.1.143');
INSERT INTO `pms_user_token` VALUES (481, 1, 'liweisen', 'a03289f40ae71b4f5cbe31d072acf9be', 1510820253, '', '192.168.1.143');
INSERT INTO `pms_user_token` VALUES (482, 1, 'liweisen', '2402b137ae87160e68f0c12dbc91a59b', 1510820287, '', '192.168.1.143');
INSERT INTO `pms_user_token` VALUES (483, 31, 'luoxingchang', '4e8609b72f3e712d5403a4948a216c76', 1510821005, '', '192.168.1.143');
INSERT INTO `pms_user_token` VALUES (484, 1, 'liweisen', 'c5af80c30203a31a9fb79f8684af4dd9', 1510821015, '', '192.168.1.143');
INSERT INTO `pms_user_token` VALUES (485, 32, 'jiangzheng', '4004cbc0ed10cbdf58f0e9068aed917c', 1510883246, '', '192.168.1.143');
INSERT INTO `pms_user_token` VALUES (486, 23, 'dengsheng', 'e7c1caafb0ccc347a8f5c44377b0de4d', 1510901612, '', '192.168.1.143');
INSERT INTO `pms_user_token` VALUES (487, 1, 'liweisen', '199880695219ce04271157b57ee5969a', 1510901805, '', '192.168.1.143');
INSERT INTO `pms_user_token` VALUES (488, 1, 'liweisen', '16908eca0cfdf5cf5dcb7542e265798d', 1510901835, '', '192.168.1.143');
INSERT INTO `pms_user_token` VALUES (489, 23, 'dengsheng', '335370ee8f5a7b2191e94abdef7fa8fd', 1510901847, '', '192.168.1.143');
INSERT INTO `pms_user_token` VALUES (490, 1, 'liweisen', '2356e311dd868e8ae9260efea90c8cb7', 1510901917, '', '192.168.1.143');
INSERT INTO `pms_user_token` VALUES (491, 1, 'liweisen', '534bc3d311d5c37e992b1a785fc3b3ea', 1510972284, '', '127.0.0.1');
INSERT INTO `pms_user_token` VALUES (492, 1, 'liweisen', '8638f9c8000aa4350e61f73f38ad7de9', 1511063780, '', '127.0.0.1');
INSERT INTO `pms_user_token` VALUES (493, 168, 'lxc', 'd7bfb6576c5e5cbc3b180d5f7458166a', 1511078289, '', '127.0.0.1');
INSERT INTO `pms_user_token` VALUES (494, 120, 'lws', '72117627ab087452014fac95dede438f', 1511078304, '', '127.0.0.1');
INSERT INTO `pms_user_token` VALUES (495, 203, 'lsw', '2aeba43a5049376069930b1f95566457', 1511078336, '', '127.0.0.1');
INSERT INTO `pms_user_token` VALUES (496, 1, 'liweisen', '836d6ea8c75c2d89de6e5392616eeb25', 1511078404, '', '127.0.0.1');
INSERT INTO `pms_user_token` VALUES (497, 1, 'liweisen', 'e2da90ce5ee105b3da5fc1df82552ace', 1511138796, '', '192.168.1.143');
INSERT INTO `pms_user_token` VALUES (498, 168, 'lxc', '1f99414c173e3881fec669c0970bfe5b', 1511139405, '', '192.168.1.143');
INSERT INTO `pms_user_token` VALUES (499, 1, 'liweisen', 'd48a6b2eef144894d11dcf185742dae0', 1511139455, '', '192.168.1.143');
INSERT INTO `pms_user_token` VALUES (500, 32, 'jiangzheng', 'b6dd813435b9286333bb4922f934ab1f', 1511147127, '', '192.168.1.143');
INSERT INTO `pms_user_token` VALUES (501, 32, 'jiangzheng', 'fafca0d1edba9440c9859f5c951f66b5', 1511147247, '', '192.168.1.143');
INSERT INTO `pms_user_token` VALUES (502, 1, 'liweisen', '8bd6152da7e6abcf840480b36abfe7c5', 1511147818, '', '192.168.1.143');
INSERT INTO `pms_user_token` VALUES (503, 32, 'jiangzheng', 'bba9be43e4b372f31dfbf1d8d2165723', 1511147956, '', '192.168.1.143');
INSERT INTO `pms_user_token` VALUES (504, 32, 'jiangzheng', '790a8d3717b061bb2e7bb6787d7710c0', 1511148082, '', '192.168.1.143');
INSERT INTO `pms_user_token` VALUES (505, 1, 'liweisen', '2ed2ec57251b4bdc7bcc9012ac6b0ec1', 1511311128, '', '192.168.1.143');
INSERT INTO `pms_user_token` VALUES (506, 186, 'helangyi', '2692438e2ceaf5b55d52508501e96cf2', 1511345894, '', '192.168.1.143');
INSERT INTO `pms_user_token` VALUES (507, 176, 'huanglitong', 'd9199b7ecad24c914a876ef5011c6d0b', 1511346100, '', '192.168.1.143');
INSERT INTO `pms_user_token` VALUES (508, 1, 'liweisen', '119690bcdd9a2b46ee097bb64390e80b', 1511346443, '', '192.168.1.143');
INSERT INTO `pms_user_token` VALUES (509, 1, 'liweisen', '2bb00f0e7da3c5b87d1f675b5b8900cc', 1511350895, '', '192.168.1.143');
INSERT INTO `pms_user_token` VALUES (510, 1, 'liweisen', 'e3becfeb21ea9462d2df3e9968fac350', 1511350947, '', '192.168.1.143');
INSERT INTO `pms_user_token` VALUES (511, 1, 'liweisen', '601734ea70fd6eb7d5dcec2eb833ce86', 1511351036, '', '192.168.1.143');
INSERT INTO `pms_user_token` VALUES (512, 1, 'liweisen', 'd5f12999d869fdf4faaff885eaa81094', 1511516887, '', '192.168.1.143');
INSERT INTO `pms_user_token` VALUES (513, 148, 'wuyin', 'b4730a8fba0eaac68d73fae0d5f8b347', 1511523790, '', '192.168.1.143');
INSERT INTO `pms_user_token` VALUES (514, 1, 'liweisen', '255889790abf2c54a5b6770ccbbea233', 1511525800, '', '192.168.1.143');
INSERT INTO `pms_user_token` VALUES (515, 1, 'liweisen', '9e1033c3cdc3bce83c6194dbbac3051b', 1511571588, '', '192.168.1.143');
INSERT INTO `pms_user_token` VALUES (516, 1, 'liweisen', '8d3ddd60df8612cf0c01e3093f0b3c11', 1511571622, '', '192.168.1.143');
INSERT INTO `pms_user_token` VALUES (517, 1, 'liweisen', 'fd0b3625d57bca1e6de6b4cb5488a3c3', 1511571828, '', '192.168.1.143');
INSERT INTO `pms_user_token` VALUES (518, 1, 'liweisen', '65aae7a0f4fa2d93d0985dc6565a45af', 1511573292, '', '192.168.1.143');
INSERT INTO `pms_user_token` VALUES (519, 168, 'lxc', '5302e66aa8edd9f84ce9360bc60cde2c', 1511596555, '', '192.168.1.143');
INSERT INTO `pms_user_token` VALUES (520, 1, 'liweisen', 'fa7f27d1078e4c5ace9afa5e6d5e7de4', 1511600178, '', '192.168.1.143');
INSERT INTO `pms_user_token` VALUES (521, 203, 'lsw', 'a8339df26c7299a3c4a280cb81eb8ee9', 1511659267, '', '192.168.1.143');
INSERT INTO `pms_user_token` VALUES (522, 1, 'liweisen', '30676b614a8e628b67b5fb9d7a9c6d99', 1511743585, '', '192.168.1.143');
INSERT INTO `pms_user_token` VALUES (523, 1, 'liweisen', 'fe7256ead50722f88afa4d079e83ae05', 1511743947, '', '192.168.1.143');
INSERT INTO `pms_user_token` VALUES (524, 1, 'liweisen', '1663e60380d0083ede26994a86d32024', 1511751873, '', '192.168.1.143');
INSERT INTO `pms_user_token` VALUES (525, 1, 'liweisen', 'aa914d7fdaa32910a3c05019de3a4be0', 1511751971, '', '192.168.1.143');
INSERT INTO `pms_user_token` VALUES (526, 1, 'liweisen', '70c1e6862cf6dcf995e3a40954481228', 1511752184, '', '192.168.1.143');
INSERT INTO `pms_user_token` VALUES (527, 1, 'liweisen', 'a2befb0834db98df04787dd3f14b66e0', 1511761322, '', '192.168.1.143');
INSERT INTO `pms_user_token` VALUES (528, 1, 'liweisen', 'd4e12c13f9b185ad58ff90372a102658', 1511761331, '', '192.168.1.143');
INSERT INTO `pms_user_token` VALUES (529, 1, 'liweisen', '2e95c7553812208f29f7c0ef68eebb84', 1511836385, '', '192.168.1.143');
INSERT INTO `pms_user_token` VALUES (530, 1, 'liweisen', '1708853b422ec774f90632f59b93d7b0', 1511836753, '', '192.168.1.143');
INSERT INTO `pms_user_token` VALUES (531, 1, 'liweisen', 'a6a99d45ecde3f86a7fa7d59b7b659ee', 1511837317, '', '192.168.1.143');
INSERT INTO `pms_user_token` VALUES (532, 1, 'liweisen', '347e9a5c0ecbd72a66bea5df06f7e900', 1511838064, '', '192.168.1.143');
INSERT INTO `pms_user_token` VALUES (533, 120, 'lws', 'f0060c3674be0fb9770b1024abca4fe4', 1511851949, '', '192.168.1.143');
INSERT INTO `pms_user_token` VALUES (534, 1, 'liweisen', 'edcbb519c0b6f20f734baf3b1a3cc006', 1511857710, '', '192.168.1.143');
INSERT INTO `pms_user_token` VALUES (535, 1, 'liweisen', 'dfa74329152355df722cebaeb85e0c2f', 1511872729, '', '192.168.1.143');
INSERT INTO `pms_user_token` VALUES (536, 1, 'liweisen', 'eb66808b762aba630721c7812906c41b', 1511872748, '', '192.168.1.143');
INSERT INTO `pms_user_token` VALUES (537, 1, 'liweisen', '4beb75a720b3c672e25a1532976bbc5a', 1511873662, '', '192.168.1.143');
INSERT INTO `pms_user_token` VALUES (538, 1, 'liweisen', 'e909a85ab9edd4da74ef0d45c3ef19d8', 1511959461, '', '192.168.1.143');
INSERT INTO `pms_user_token` VALUES (539, 231, 'lws', 'a0050c3f08a116bd453a6bfbcfd7328d', 1512026677, '', '192.168.1.143');
INSERT INTO `pms_user_token` VALUES (540, 231, 'lws', '7aed66f3dfad4c2d47807e46ccd3393f', 1512026884, '', '192.168.1.143');
INSERT INTO `pms_user_token` VALUES (541, 1, 'liweisen', '6192fcc15fe706070b7321a3285d36e3', 1512028439, '', '192.168.1.143');
INSERT INTO `pms_user_token` VALUES (542, 279, 'lxc', 'be36246402b0a6e8b152aa818b80ab69', 1512028461, '', '192.168.1.143');
INSERT INTO `pms_user_token` VALUES (543, 274, 'lyh', 'a94517eefdc96afc16f8de52a7524a19', 1512028482, '', '192.168.1.143');
INSERT INTO `pms_user_token` VALUES (544, 231, 'lws', '29757907aec1ff3dbca31dca570ae0bf', 1512028956, '', '192.168.1.143');
INSERT INTO `pms_user_token` VALUES (545, 1, 'liweisen', '25763d12205ac04fc1b8c154c7bd1448', 1512038359, '', '192.168.1.143');
INSERT INTO `pms_user_token` VALUES (546, 1, 'liweisen', '09b62a50d6d33b8a2b6e72b3a64fac9d', 1512046551, '', '192.168.1.143');
INSERT INTO `pms_user_token` VALUES (547, 231, 'lws', '29fdbc73ec864527b7f6bb4ec32e1ce1', 1512049292, '', '192.168.1.143');
INSERT INTO `pms_user_token` VALUES (548, 1, 'liweisen', '0c5fee288ab9b2a807432b2be9de8a72', 1512087928, '', '192.168.1.143');
INSERT INTO `pms_user_token` VALUES (549, 231, 'lws', '2cf7336c7420e173803f7eed3439f5e9', 1512101046, '', '192.168.1.143');
INSERT INTO `pms_user_token` VALUES (550, 32, 'jiangzheng', '8428ea15ac62c9f4420b20e50969e5d1', 1512118962, '', '192.168.1.143');
INSERT INTO `pms_user_token` VALUES (551, 1, 'liweisen', '56c2dab9d8af1f5814d9e06b395153f4', 1512118982, '', '192.168.1.143');
INSERT INTO `pms_user_token` VALUES (552, 32, 'jiangzheng', '1208863ecafed05322dec53623627a66', 1512119562, '', '192.168.1.143');
INSERT INTO `pms_user_token` VALUES (553, 231, 'lws', 'e1ce74b8c49271f387682adc437c8e37', 1512123749, '', '192.168.1.143');
INSERT INTO `pms_user_token` VALUES (554, 1, 'liweisen', 'fd4450ab32964209a9c8467cc535d392', 1512186556, '', '192.168.1.143');
INSERT INTO `pms_user_token` VALUES (555, 231, 'lws', '1f5c5fad738e0b44eb8391a16481c87c', 1512187275, '', '192.168.1.143');
INSERT INTO `pms_user_token` VALUES (556, 231, 'lws', '1d4344b21e6eb143b6ea003df3d56e3f', 1512192919, '', '192.168.1.143');
INSERT INTO `pms_user_token` VALUES (557, 1, 'liweisen', '06f5c57da5d128e2df09253c0c8bbfcc', 1512192928, '', '192.168.1.143');
INSERT INTO `pms_user_token` VALUES (558, 1, 'liweisen', 'ec332264adb9599ae6626a1b0d3d1f5c', 1512202569, '', '192.168.1.143');
INSERT INTO `pms_user_token` VALUES (559, 231, 'lws', '717e4975d0b6ec443e2ad36e14d4185c', 1512205007, '', '192.168.1.143');
INSERT INTO `pms_user_token` VALUES (560, 1, 'liweisen', '7621a80cde16d6eefdbcc3a830aceea6', 1512205559, '', '192.168.1.143');
INSERT INTO `pms_user_token` VALUES (561, 1, 'liweisen', '7af2bc0a5bc8632bfc1ad7222768dcc1', 1512205988, '', '192.168.1.143');
INSERT INTO `pms_user_token` VALUES (562, 1, 'liweisen', '076e6d49556cd1cc1e13bb3e8a4e065e', 1512205998, '', '192.168.1.143');
INSERT INTO `pms_user_token` VALUES (563, 231, 'lws', 'c7d48dd43322696ac3db6f1ae2177156', 1512206006, '', '192.168.1.143');
INSERT INTO `pms_user_token` VALUES (564, 297, 'helangyi', '3e588080b81508e47961b9f927cd014b', 1512206084, '', '192.168.1.143');
INSERT INTO `pms_user_token` VALUES (565, 32, 'jiangzheng', 'b778ce4d9a3ab9ba610c9ba7cfc4a4e0', 1512206119, '', '192.168.1.143');
INSERT INTO `pms_user_token` VALUES (566, 32, 'jiangzheng', '9bb8f04b873c2000b7dd1355bc7f3826', 1512206746, '', '192.168.1.143');
INSERT INTO `pms_user_token` VALUES (567, 1, 'liweisen', '6594ed9e15f83fffc16295acd9f5cccc', 1512347460, '', '192.168.1.143');
INSERT INTO `pms_user_token` VALUES (568, 231, 'lws', '2438f91caf6f574cf400357fee03101e', 1512349331, '', '192.168.1.143');
INSERT INTO `pms_user_token` VALUES (569, 1, 'liweisen', 'c8f5669cc914548c0099d28765ae64ec', 1512349599, '', '192.168.1.143');
INSERT INTO `pms_user_token` VALUES (570, 231, 'lws', '07683a2502e30fc2ba9e6ce3a46b76e2', 1512349651, '', '192.168.1.143');
INSERT INTO `pms_user_token` VALUES (571, 32, 'jiangzheng', 'afe56b681bdf605929a16361b3f23058', 1512349974, '', '192.168.1.143');
INSERT INTO `pms_user_token` VALUES (572, 231, 'lws', '745f33c0faca84c5ecab0f4d25eb9329', 1512359511, '', '192.168.1.143');
INSERT INTO `pms_user_token` VALUES (573, 1, 'liweisen', '61f26ce5c54bfc2d4e9a27b6788fbc5e', 1512376493, '', '192.168.1.143');
INSERT INTO `pms_user_token` VALUES (574, 231, 'lws', 'b8489da1c5772495c657f2d27128794a', 1512395749, '', '192.168.1.143');
INSERT INTO `pms_user_token` VALUES (575, 1, 'liweisen', '53fdb67cf0c523dca1303f38a14a11f7', 1512464829, '', '192.168.1.143');
INSERT INTO `pms_user_token` VALUES (576, 1, 'liweisen', 'ae3b7b882d1fb133833eaa1a54944ae9', 1512521061, '', '192.168.1.143');
INSERT INTO `pms_user_token` VALUES (577, 231, 'lws', '18c5fad79cc7dbf606c19f34138d8d8e', 1512530133, '', '192.168.1.143');
INSERT INTO `pms_user_token` VALUES (578, 1, 'liweisen', '7f8fd9dc064c6d5eeebf03a9904cff8a', 1512541925, '', '192.168.1.143');
INSERT INTO `pms_user_token` VALUES (579, 1, 'liweisen', 'f5375ac50420e6d5afacb69a90ddc43e', 1512562819, '', '192.168.1.143');
INSERT INTO `pms_user_token` VALUES (580, 1, 'liweisen', '69aa0d4c32af443abb1152ab7df95887', 1512608539, '', '192.168.1.143');
INSERT INTO `pms_user_token` VALUES (581, 1, 'liweisen', '291d444f6a9bcbbbfb41445281e6ff91', 1512613373, '', '192.168.1.143');
INSERT INTO `pms_user_token` VALUES (582, 231, 'lws', 'a15bcce02165e6adee79aae34907e56e', 1512613629, '', '192.168.1.143');
INSERT INTO `pms_user_token` VALUES (583, 314, 'lsw', '614c739ae2118f69da5f21a969b9d8ad', 1512617945, '', '192.168.1.143');
INSERT INTO `pms_user_token` VALUES (584, 1, 'liweisen', 'ad5c48153f23fd54e6e71fed62b02788', 1512619333, '', '192.168.1.143');
INSERT INTO `pms_user_token` VALUES (585, 231, 'lws', '928509586482d3171df3894ba5b7df32', 1512619549, '', '192.168.1.143');
INSERT INTO `pms_user_token` VALUES (586, 231, 'lws', '2f71c2147727d7672d005082a9e36ede', 1512630161, '', '192.168.1.143');
INSERT INTO `pms_user_token` VALUES (587, 1, 'liweisen', 'c7e18aa633fa0255d57a63369eab6ada', 1512630179, '', '192.168.1.143');
INSERT INTO `pms_user_token` VALUES (588, 286, 'zhangliping', 'c0d5c32bc7aa06c5b8c6a59bd53f1b96', 1512630202, '', '192.168.1.143');
INSERT INTO `pms_user_token` VALUES (589, 1, 'liweisen', 'ee3412be2e6b329ac1e0cd0e650cb237', 1512630237, '', '192.168.1.143');
INSERT INTO `pms_user_token` VALUES (590, 231, 'lws', 'ce5187cc598d62f8ee2aa5288750b305', 1512630294, '', '192.168.1.143');
INSERT INTO `pms_user_token` VALUES (591, 1, 'liweisen', 'c64c55771c87db9049cca8ac335b4b70', 1512630328, '', '192.168.1.143');
INSERT INTO `pms_user_token` VALUES (592, 231, 'lws', '68861c445f2e3f384dae4022ceb476fa', 1512630384, '', '192.168.1.143');
INSERT INTO `pms_user_token` VALUES (593, 1, 'liweisen', '63da0f981386cbe3191f163e93759876', 1512630427, '', '192.168.1.143');
INSERT INTO `pms_user_token` VALUES (594, 231, 'lws', '4c1d894e23f222acfd88dc4f1d879a4d', 1512630482, '', '192.168.1.143');
INSERT INTO `pms_user_token` VALUES (595, 1, 'liweisen', '15abee5707a1c8545d46b3b3e780f509', 1512630530, '', '192.168.1.143');
INSERT INTO `pms_user_token` VALUES (596, 231, 'lws', '190f80e2abe34ff044040a3910267b2d', 1512630542, '', '192.168.1.143');
INSERT INTO `pms_user_token` VALUES (597, 286, 'zhangliping', 'f380b733e658a2f61cc5ec8c2a360c61', 1512631797, '', '192.168.1.143');
INSERT INTO `pms_user_token` VALUES (598, 1, 'liweisen', '51050db2f8f0e61d8b4ef5148d662472', 1512648109, '', '192.168.1.143');
INSERT INTO `pms_user_token` VALUES (599, 231, 'lws', '85eb167eb60d3df9505ff69b9ae20f26', 1512695135, '', '192.168.1.143');
INSERT INTO `pms_user_token` VALUES (600, 1, 'liweisen', '1a8ac524fcc54f10c65e7e6115ad5fb9', 1512695575, '', '192.168.1.143');
INSERT INTO `pms_user_token` VALUES (601, 1, 'liweisen', 'c08efc1d7cd62c136e74fd0428642def', 1512695999, '', '192.168.1.143');
INSERT INTO `pms_user_token` VALUES (602, 1, 'liweisen', '2ff3a87a2767343afb7b83dc5a674377', 1512696043, '', '192.168.1.143');
INSERT INTO `pms_user_token` VALUES (603, 1, 'liweisen', 'f68f8a61f9ae585c9a1344dc61348d70', 1512696551, '', '192.168.1.143');
INSERT INTO `pms_user_token` VALUES (604, 1, 'liweisen', 'b10bee41aafd8acef017df2448af5944', 1512696619, '', '192.168.1.143');
INSERT INTO `pms_user_token` VALUES (605, 1, 'liweisen', '1ebbc5acc976287edd5ebb511bce2bcb', 1512696701, '', '192.168.1.143');
INSERT INTO `pms_user_token` VALUES (606, 1, 'liweisen', 'b269c675022a03dbc81d7780158b0634', 1512698170, '', '192.168.1.143');
INSERT INTO `pms_user_token` VALUES (607, 1, 'liweisen', 'cf2d8631b0ca5ad34c9d402a587a72f7', 1512698273, '', '192.168.1.143');
INSERT INTO `pms_user_token` VALUES (608, 231, 'lws', '8bd7bd22f0b727d4a9769a2dc37766a8', 1512705369, '', '192.168.1.143');
INSERT INTO `pms_user_token` VALUES (609, 1, 'liweisen', 'b6d5384f7ba72ddb355144e7695baa67', 1512705560, '', '192.168.1.143');
INSERT INTO `pms_user_token` VALUES (610, 1, 'liweisen', '2ecee4032960b0dae9950705e673002e', 1512705652, '', '192.168.1.143');
INSERT INTO `pms_user_token` VALUES (611, 314, 'lsw', '7d2210b40152ef01e1487df50f4aa397', 1512705664, '', '192.168.1.143');
INSERT INTO `pms_user_token` VALUES (612, 231, 'lws', '844c5d3d1a26bb19005f77040be74e91', 1512712328, '', '192.168.1.143');
INSERT INTO `pms_user_token` VALUES (613, 1, 'liweisen', '00e2c5cf7bcf6cb48cd9e0c51f51e034', 1512713133, '', '192.168.1.143');
INSERT INTO `pms_user_token` VALUES (614, 231, 'lws', '555b220b85e294b6c550fac5f4be929c', 1512713172, '', '192.168.1.143');
INSERT INTO `pms_user_token` VALUES (615, 231, 'lws', '07631d798788d2ce65e196c758bb8957', 1512719576, '', '192.168.1.143');
INSERT INTO `pms_user_token` VALUES (616, 231, 'lws', '5a3c639960e4e41de0155a00ee4c513c', 1512719702, '', '192.168.1.143');
INSERT INTO `pms_user_token` VALUES (617, 231, 'lws', '59b481bc3ed0f1278da46f0f900d2be2', 1512719734, '', '192.168.1.143');
INSERT INTO `pms_user_token` VALUES (618, 231, 'lws', '91c17606863e2c5a97b68662e1e57dde', 1512720006, '', '192.168.1.143');
INSERT INTO `pms_user_token` VALUES (619, 314, 'lsw', 'a4cbecaa457b1cd2b7ba2c69613b5e83', 1512721009, '', '192.168.1.143');
INSERT INTO `pms_user_token` VALUES (620, 314, 'lsw', '56e14dfc83f20cf95e792ffb4d9cb04c', 1512738844, '', '192.168.1.143');
INSERT INTO `pms_user_token` VALUES (621, 314, 'lsw', '7d877b247223b9fe128b700eccc0290e', 1512785346, '', '192.168.1.143');
INSERT INTO `pms_user_token` VALUES (622, 1, 'liweisen', 'd7be75ba05e9bf9941ab629d94c2d90b', 1512802258, '', '192.168.1.143');
INSERT INTO `pms_user_token` VALUES (623, 231, 'lws', '78e5ec168ed9d4301737fb8ad0313d51', 1512802566, '', '192.168.1.143');
INSERT INTO `pms_user_token` VALUES (624, 1, 'liweisen', 'ed75684a8911176eb2ff4db7dfeae407', 1512802615, '', '192.168.1.143');
INSERT INTO `pms_user_token` VALUES (625, 1, 'liweisen', '62752af0089cc4dd65be8ac04eb44e15', 1512802642, '', '192.168.1.143');
INSERT INTO `pms_user_token` VALUES (626, 1, 'liweisen', 'f238e8e55c9a510a6259e4ca1af5222e', 1512802658, '', '192.168.1.143');
INSERT INTO `pms_user_token` VALUES (627, 231, 'lws', 'a71f48bd4234786db2010f298eb4062c', 1512805056, '', '192.168.1.143');
INSERT INTO `pms_user_token` VALUES (628, 1, 'liweisen', '16c56bdbe31865af18636eec42e38033', 1512805805, '', '192.168.1.143');
INSERT INTO `pms_user_token` VALUES (629, 251, 'ljh', 'b77c5e8836d74d444593c13908ce6c91', 1512805856, '', '192.168.1.143');
INSERT INTO `pms_user_token` VALUES (630, 314, 'lsw', '3b0b9aff825ffc2249df83f284724b04', 1512805983, '', '192.168.1.143');
INSERT INTO `pms_user_token` VALUES (631, 251, 'ljh', 'e296dca315c044b516a47b465d4f0b88', 1512807455, '', '192.168.1.143');
INSERT INTO `pms_user_token` VALUES (632, 231, 'lws', '497b906eed2c7b7217d6351d2559ad41', 1512807807, '', '192.168.1.143');
INSERT INTO `pms_user_token` VALUES (633, 1, 'liweisen', 'f3e9f570fc57a4e2a07cd3c015cba172', 1512814871, '', '192.168.1.143');
INSERT INTO `pms_user_token` VALUES (634, 231, 'lws', '2b4b1f001571cb60393a837ffd6eb12a', 1512814901, '', '192.168.1.143');
INSERT INTO `pms_user_token` VALUES (635, 1, 'liweisen', 'a41ebc8d5ef00e5e48c573a845fd1142', 1512917979, '', '192.168.1.143');
INSERT INTO `pms_user_token` VALUES (636, 231, 'lws', '3148ffb838b1b27cbd55bf1049b4c150', 1512951988, '', '192.168.1.143');
INSERT INTO `pms_user_token` VALUES (637, 1, 'liweisen', '8093339ee2e07e75d304d792dffe1e30', 1512953694, '', '192.168.1.143');
INSERT INTO `pms_user_token` VALUES (638, 1, 'liweisen', '10ffdc0132320da71dc216fa56b65fe0', 1512954043, '', '192.168.1.143');
INSERT INTO `pms_user_token` VALUES (639, 1, 'liweisen', 'c7bfd06983a5e698559a6f6f2bd4644a', 1512954157, '', '192.168.1.143');
INSERT INTO `pms_user_token` VALUES (640, 1, 'liweisen', '7b4138be15de5d2a399c7b571242edb1', 1512954427, '', '192.168.1.143');
INSERT INTO `pms_user_token` VALUES (641, 314, 'lsw', 'a32c9462213c319f90b9b4785441ef1b', 1512956168, '', '192.168.1.143');
INSERT INTO `pms_user_token` VALUES (642, 314, 'lsw', 'b496d50ba03444d1456ab2185f53ea50', 1512956290, '', '192.168.1.143');
INSERT INTO `pms_user_token` VALUES (643, 314, 'lsw', 'da8736b3afd052ecca68427846f9553b', 1512956313, '', '192.168.1.143');
INSERT INTO `pms_user_token` VALUES (644, 279, 'lxc', '9d4ba81eed268f05ef56ffede181b616', 1512956330, '', '192.168.1.143');
INSERT INTO `pms_user_token` VALUES (645, 279, 'lxc', '4639a2459aa1aa6bfce5fcb8757a9e91', 1512957861, '', '192.168.1.143');
INSERT INTO `pms_user_token` VALUES (646, 279, 'lxc', 'b822d6e2d95bc9b918fbc3f1d4f3bf0e', 1512958137, '', '192.168.1.143');
INSERT INTO `pms_user_token` VALUES (647, 279, 'lxc', '0afa418eaa45bf0ed8892c158202b2cf', 1512958519, '', '192.168.1.143');
INSERT INTO `pms_user_token` VALUES (648, 279, 'lxc', '09a04a5f5a1ac86664c8a2c812cd0598', 1512958788, '', '192.168.1.143');
INSERT INTO `pms_user_token` VALUES (649, 279, 'lxc', '972d13d4e930124a14b48f97ec79facb', 1512959286, '', '192.168.1.143');
INSERT INTO `pms_user_token` VALUES (650, 279, 'lxc', 'b23b4daf089d29ad22adcc73fe48cb2d', 1512959320, '', '192.168.1.143');
INSERT INTO `pms_user_token` VALUES (651, 279, 'lxc', 'bf598a6c382ab5790eddf3c4c794a799', 1512959332, '', '192.168.1.143');
INSERT INTO `pms_user_token` VALUES (652, 279, 'lxc', 'eaf2f67c4577e3764a69413b29c1c397', 1512959402, '', '192.168.1.143');
INSERT INTO `pms_user_token` VALUES (653, 279, 'lxc', 'ed72428d8463f3fd9db2536423a2a517', 1512959622, '', '192.168.1.143');
INSERT INTO `pms_user_token` VALUES (654, 279, 'lxc', '94fb49f0d09af2d4f3dce1a472489b5f', 1512959683, '', '192.168.1.143');
INSERT INTO `pms_user_token` VALUES (655, 279, 'lxc', 'ed294add1a423c0e7a53d90b87d8a764', 1512959726, '', '192.168.1.143');
INSERT INTO `pms_user_token` VALUES (656, 279, 'lxc', 'c92b88c92c3ca8e91bd4cb68105fa012', 1512959757, '', '192.168.1.143');
INSERT INTO `pms_user_token` VALUES (657, 279, 'lxc', 'dfdf3a3f0de31f87d924ab606d6da827', 1512959799, '', '192.168.1.143');
INSERT INTO `pms_user_token` VALUES (658, 279, 'lxc', 'f4cbb9f363f26e170a5b9df38d1dc853', 1512959987, '', '192.168.1.143');
INSERT INTO `pms_user_token` VALUES (659, 279, 'lxc', 'bf662cbbeea3c3e1cf21d7dab2e0f82c', 1512960132, '', '192.168.1.143');
INSERT INTO `pms_user_token` VALUES (660, 279, 'lxc', '829bf8773695abcda217124cc3cb4f93', 1512960484, '', '192.168.1.143');
INSERT INTO `pms_user_token` VALUES (661, 279, 'lxc', 'f295c1938dd438cc02a3cbd8c80d9359', 1512960569, '', '192.168.1.143');
INSERT INTO `pms_user_token` VALUES (662, 279, 'lxc', '24e5b0a43600e20846f31a900b6c15f9', 1512960724, '', '192.168.1.143');
INSERT INTO `pms_user_token` VALUES (663, 279, 'lxc', 'fa811042bd5bc43a224a5aded7f433af', 1512961081, '', '192.168.1.143');
INSERT INTO `pms_user_token` VALUES (664, 279, 'lxc', '4da5b0cc4607261cb757adc48c713ce2', 1512961117, '', '192.168.1.143');
INSERT INTO `pms_user_token` VALUES (665, 279, 'lxc', 'fa61a5fbde16019c9dc66179150644b8', 1512961201, '', '192.168.1.143');
INSERT INTO `pms_user_token` VALUES (666, 279, 'lxc', '859adabd187ace528dcbfb1e93ead72a', 1512961265, '', '192.168.1.143');
INSERT INTO `pms_user_token` VALUES (667, 279, 'lxc', '7fb62b03174c3ff1a730210d6bee09a2', 1512961333, '', '192.168.1.143');
INSERT INTO `pms_user_token` VALUES (668, 279, 'lxc', 'f939b9c7deda7d2699850e382ec1aefb', 1512961398, '', '192.168.1.143');
INSERT INTO `pms_user_token` VALUES (669, 279, 'lxc', '8834e3eeeb801ac3383e4ac4ccae6688', 1512961414, '', '192.168.1.143');
INSERT INTO `pms_user_token` VALUES (670, 279, 'lxc', '3dac0ffbcbbc3935514d832901a11128', 1512961498, '', '192.168.1.143');
INSERT INTO `pms_user_token` VALUES (671, 279, 'lxc', 'a34ac1e81aac91440133198c4a8c2708', 1512961505, '', '192.168.1.143');
INSERT INTO `pms_user_token` VALUES (672, 279, 'lxc', '90f3bd134be66fb8c7cb03204ba6e59d', 1512961514, '', '192.168.1.143');
INSERT INTO `pms_user_token` VALUES (673, 279, 'lxc', 'bb021c08b16e0b701572edbf3cce528d', 1512961520, '', '192.168.1.143');
INSERT INTO `pms_user_token` VALUES (674, 279, 'lxc', '88a0ff148e3a620d48a64e0a892497ce', 1512961658, '', '192.168.1.143');
INSERT INTO `pms_user_token` VALUES (675, 279, 'lxc', 'd2b17783657496ff4aafd72aae3b2dc7', 1512961673, '', '192.168.1.143');
INSERT INTO `pms_user_token` VALUES (676, 279, 'lxc', '93c9a8ae12e4cc84319d5bae876c1a11', 1512961695, '', '192.168.1.143');
INSERT INTO `pms_user_token` VALUES (677, 279, 'lxc', '3fc804f89fd1cf332f37e486c5f5f3da', 1512961859, '', '192.168.1.143');
INSERT INTO `pms_user_token` VALUES (678, 231, 'lws', '798afd1cbe09f198fb78f29c8f245dcd', 1512962085, '', '192.168.1.143');
INSERT INTO `pms_user_token` VALUES (679, 231, 'lws', '17a6b5602bffade1806a18bd60461db4', 1512962158, '', '192.168.1.143');
INSERT INTO `pms_user_token` VALUES (680, 279, 'lxc', 'd7d71efbcaeff71af0ce1a6e5ec012d6', 1512962275, '', '192.168.1.143');
INSERT INTO `pms_user_token` VALUES (681, 279, 'lxc', 'd7dca135b37be6a0a1b30817a1663a2d', 1512963493, '', '192.168.1.143');
INSERT INTO `pms_user_token` VALUES (682, 279, 'lxc', '95abc25c635252eb17617b70b0a10e26', 1512963635, '', '192.168.1.143');
INSERT INTO `pms_user_token` VALUES (683, 279, 'lxc', '593d29bd28e0afa05b3ae3d5ad085643', 1512963702, '', '192.168.1.143');
INSERT INTO `pms_user_token` VALUES (684, 1, 'liweisen', '207e803eaa6e3fccb9e2caf57719e71a', 1512963711, '', '192.168.1.143');
INSERT INTO `pms_user_token` VALUES (685, 279, 'lxc', '42e1e3c9348ddab77fc5469c391988f7', 1512963768, '', '192.168.1.143');
INSERT INTO `pms_user_token` VALUES (686, 231, 'lws', '060aa5dcd8de8517ed9ce0c9541a5fb5', 1512963779, '', '192.168.1.143');
INSERT INTO `pms_user_token` VALUES (687, 231, 'lws', '925ab0117fbbf85c421a749caa1596f0', 1512963787, '', '192.168.1.143');
INSERT INTO `pms_user_token` VALUES (688, 231, 'lws', '80af498c6d38ae96f2e65c98a74b6535', 1512963967, '', '192.168.1.143');
INSERT INTO `pms_user_token` VALUES (689, 231, 'lws', 'a1d5ac9d690438a0592a89ff6af62b76', 1512964072, '', '192.168.1.143');
INSERT INTO `pms_user_token` VALUES (690, 231, 'lws', 'aaadf13b417a3a6223f7706be2b9e990', 1512964167, '', '192.168.1.143');
INSERT INTO `pms_user_token` VALUES (691, 231, 'lws', 'e8c1701492ab75d298785dc8c86be143', 1512964241, '', '192.168.1.143');
INSERT INTO `pms_user_token` VALUES (692, 279, 'lxc', '819bde7f2b372fb031546aa077e8d055', 1512964290, '', '192.168.1.143');
INSERT INTO `pms_user_token` VALUES (693, 279, 'lxc', '9c5255ef57cca03f0d085d741d3111f5', 1512964383, '', '192.168.1.143');
INSERT INTO `pms_user_token` VALUES (694, 279, 'lxc', '773cb5e72fbefab69ef3ae0a6e95f4b3', 1512964589, '', '192.168.1.143');
INSERT INTO `pms_user_token` VALUES (695, 279, 'lxc', 'f0f0b84fc1be17ac895335b8752819bd', 1512964679, '', '192.168.1.143');
INSERT INTO `pms_user_token` VALUES (696, 279, 'lxc', '5fb9d3c8b9b93dae7a5c517397ffc87e', 1512970317, '', '192.168.1.143');
INSERT INTO `pms_user_token` VALUES (697, 279, 'lxc', '3167c177f4a98416df1bc7baacfdf45b', 1512970350, '', '192.168.1.143');
INSERT INTO `pms_user_token` VALUES (698, 279, 'lxc', '896b6fec9a2897f1fb1d18b6705e1f29', 1512970378, '', '192.168.1.143');
INSERT INTO `pms_user_token` VALUES (699, 231, 'lws', '5d10bd5530c4cd164bb7f1333580c6e7', 1512970407, '', '192.168.1.143');
INSERT INTO `pms_user_token` VALUES (700, 279, 'lxc', '5d9e8306e2b236a350f4e0db2d9c6939', 1512970423, '', '192.168.1.143');
INSERT INTO `pms_user_token` VALUES (701, 279, 'lxc', 'ef51c0a18a5ec0cf4b14bc271b156da4', 1512970598, '', '192.168.1.143');
INSERT INTO `pms_user_token` VALUES (702, 279, 'lxc', '2ff48043a5957a36e2bf62b5cfa55fe8', 1512970627, '', '192.168.1.143');
INSERT INTO `pms_user_token` VALUES (703, 279, 'lxc', '48a09c6a9157c6633223494ce9198542', 1512970713, '', '192.168.1.143');
INSERT INTO `pms_user_token` VALUES (704, 314, 'lsw', '0627c9fb93d9658788b9aef75040aa31', 1512973320, '', '192.168.1.143');
INSERT INTO `pms_user_token` VALUES (705, 314, 'lsw', '2cecbe8c20fca07c8c85b8e3f72d737d', 1512973323, '', '192.168.1.143');
INSERT INTO `pms_user_token` VALUES (706, 314, 'lsw', '58983844a887b49583e4640f893b69ae', 1512973327, '', '192.168.1.143');
INSERT INTO `pms_user_token` VALUES (707, 314, 'lsw', '8dd69931117fb2dc523b21ce3c7d4a61', 1512973336, '', '192.168.1.143');
INSERT INTO `pms_user_token` VALUES (708, 314, 'lsw', 'a819cab786e0a8409da3848b0076e332', 1512974482, '', '192.168.1.143');
INSERT INTO `pms_user_token` VALUES (709, 314, 'lsw', 'cf8b4c450365b2aa9c73d3d5c6f47a5c', 1512974581, '', '192.168.1.143');
INSERT INTO `pms_user_token` VALUES (710, 314, 'lsw', '55b0aa4aafd5bee10ee8ebbaca0d37fa', 1512980502, '', '192.168.1.143');
INSERT INTO `pms_user_token` VALUES (711, 314, 'lsw', '87eeead7911ac9e9668130baaf8ff90b', 1512980527, '', '192.168.1.143');
INSERT INTO `pms_user_token` VALUES (712, 314, 'lsw', '280855a63293c7e0a790d65121bb367a', 1512980529, '', '192.168.1.143');
INSERT INTO `pms_user_token` VALUES (713, 314, 'lsw', 'c55c993756055fad65957501c63fd5ca', 1512980538, '', '192.168.1.143');
INSERT INTO `pms_user_token` VALUES (714, 314, 'lsw', '7dc8a3cdc43dc754c25d029742a0eb96', 1512980572, '', '192.168.1.143');
INSERT INTO `pms_user_token` VALUES (715, 314, 'lsw', 'a1a08271676c1eab61f92d4194239f6e', 1512980596, '', '192.168.1.143');
INSERT INTO `pms_user_token` VALUES (716, 314, 'lsw', '30ca5370f8f1587d873c95645787f451', 1512980617, '', '192.168.1.143');
INSERT INTO `pms_user_token` VALUES (717, 314, 'lsw', '178f2fc934de8b0d4678939db9292a53', 1512980646, '', '192.168.1.143');
INSERT INTO `pms_user_token` VALUES (718, 314, 'lsw', '92cd3e22b62d32db208e43a4d5f0aed9', 1512980697, '', '192.168.1.143');
INSERT INTO `pms_user_token` VALUES (719, 314, 'lsw', 'e0ea318dedd9042d937ec7fac93a3b40', 1512980701, '', '192.168.1.143');
INSERT INTO `pms_user_token` VALUES (720, 314, 'lsw', 'd8a8bd2726d7309cdbd12f31a0a293b7', 1512980759, '', '192.168.1.143');
INSERT INTO `pms_user_token` VALUES (721, 314, 'lsw', '04d51541d36b3c01b4ab47aab856e08e', 1512980799, '', '192.168.1.143');
INSERT INTO `pms_user_token` VALUES (722, 314, 'lsw', 'b156101c49ea5c9844ef0fdcb931ca4d', 1512980893, '', '192.168.1.143');
INSERT INTO `pms_user_token` VALUES (723, 314, 'lsw', '19ecac184dcd777b875cd80717bb7680', 1512981058, '', '192.168.1.143');
INSERT INTO `pms_user_token` VALUES (724, 231, 'lws', 'f4505be8e872b891327259dab4ab0df3', 1512981153, '', '192.168.1.143');
INSERT INTO `pms_user_token` VALUES (725, 314, 'lsw', '7b1d7a827f2fb179e75cff35124930d8', 1512981197, '', '192.168.1.143');
INSERT INTO `pms_user_token` VALUES (726, 314, 'lsw', '6f9fcd50338c57e6ea710abe9517bce7', 1512981351, '', '192.168.1.143');
INSERT INTO `pms_user_token` VALUES (727, 314, 'lsw', '948ad0e3008f36e41736209474ea1147', 1512981379, '', '192.168.1.143');
INSERT INTO `pms_user_token` VALUES (728, 314, 'lsw', '152d76342f3a6ba9135bab4a1f1c55e5', 1512981392, '', '192.168.1.143');
INSERT INTO `pms_user_token` VALUES (729, 231, 'lws', 'ab9748a493dc30367f56e535195c3e40', 1513127612, '', '192.168.1.143');
INSERT INTO `pms_user_token` VALUES (730, 231, 'lws', '019efb57c14388d4c02ed2afa38b4cfe', 1513127673, '', '192.168.1.143');
INSERT INTO `pms_user_token` VALUES (731, 231, 'lws', 'e6b5a81d86467241461094e3980b7647', 1513127793, '', '192.168.1.143');
INSERT INTO `pms_user_token` VALUES (732, 231, 'lws', 'b290fac2ee5beafab25c2af0a34915dd', 1513127802, '', '192.168.1.143');
INSERT INTO `pms_user_token` VALUES (733, 231, 'lws', '17cad635b520ddbf4aef466c3823cee6', 1513127839, '', '192.168.1.143');
INSERT INTO `pms_user_token` VALUES (734, 314, 'lsw', 'ba0cc1d38a6d771f138f6d42483377b2', 1513127891, '', '192.168.1.143');
INSERT INTO `pms_user_token` VALUES (735, 314, 'lsw', '761be7699f36a5f02c78af1a0263ac90', 1513127926, '', '192.168.1.143');
INSERT INTO `pms_user_token` VALUES (736, 279, 'lxc', '76036d193ae8a56730a9fa7b7d925cc0', 1513128048, '', '192.168.1.143');
INSERT INTO `pms_user_token` VALUES (737, 279, 'lxc', 'cd833920f216bcc5a3459e6b4a2382e8', 1513128064, '', '192.168.1.143');
INSERT INTO `pms_user_token` VALUES (738, 231, 'lws', '8015a272d512608e747f606f3cea51fe', 1513130775, '', '192.168.1.143');
INSERT INTO `pms_user_token` VALUES (739, 231, 'lws', 'dfb1c01854f5b7bcbd5386c05323e0ed', 1513135634, '', '192.168.1.135');
INSERT INTO `pms_user_token` VALUES (740, 32, 'jiangzheng', 'ddcd23ce97cbab0c7ae46b8f03b262c2', 1513135668, '', '192.168.1.135');
INSERT INTO `pms_user_token` VALUES (741, 26, 'lws', '0fb65947f9f2b2cbdf90e77f22ad06ee', 1513301854, '', '192.168.1.135');
INSERT INTO `pms_user_token` VALUES (742, 26, 'lws', '7fdf73cd8be2978cd42b2ce631e0f89d', 1513301868, '', '192.168.1.135');
INSERT INTO `pms_user_token` VALUES (743, 26, 'lws', '6484b70ffdeb97f60811111bb835147f', 1513301968, '', '192.168.1.135');
INSERT INTO `pms_user_token` VALUES (744, 26, 'lws', 'a5fb582bb5424be7aac9815fd8ee1fc0', 1513303778, '', '192.168.1.135');
INSERT INTO `pms_user_token` VALUES (745, 94, 'jiangzheng', '9dd360a25cd097609ca0ac9b92a34bc9', 1513304292, '', '192.168.1.135');
INSERT INTO `pms_user_token` VALUES (746, 46, 'ljh', '481813626dbf61a922175eacfad1115e', 1513316749, '', '192.168.1.135');
INSERT INTO `pms_user_token` VALUES (747, 16, 'wangpei', '4d837b083bc937e9b944735fb9cb9d52', 1513319991, '', '192.168.1.135');
INSERT INTO `pms_user_token` VALUES (748, 26, 'lws', '3c4b11c2418cb10408fe202144774377', 1513320293, '', '192.168.1.135');
INSERT INTO `pms_user_token` VALUES (749, 26, 'lws', '524ccaece176ed8b5ea83bda2d82af3b', 1513320377, '', '192.168.1.135');
INSERT INTO `pms_user_token` VALUES (750, 46, 'ljh', 'd23cc580b214da7c1d42b014823334d9', 1513333142, '', '192.168.1.135');
INSERT INTO `pms_user_token` VALUES (751, 57, 'lxt', '26d73db72f9e64ca835d91305928d173', 1513390280, '', '192.168.1.135');
INSERT INTO `pms_user_token` VALUES (752, 26, 'lws', '045edc82e77bd4f0884f7c1bb105a0be', 1513406928, '', '192.168.1.135');
INSERT INTO `pms_user_token` VALUES (753, 103, 'lsw', 'f84554d16539d312411d8c2f4a0dd8b7', 1513409783, '', '192.168.1.135');
INSERT INTO `pms_user_token` VALUES (754, 26, 'lws', '04454a4076054ce135ac4e725a9dcbe8', 1513410005, '', '192.168.1.135');
INSERT INTO `pms_user_token` VALUES (755, 46, 'ljh', '4e346cc6c6600861f8d6b7f89c85991f', 1513416135, '', '192.168.1.135');
INSERT INTO `pms_user_token` VALUES (756, 26, 'lws', '29c240608b7681aae2e6b06d43ab2bc7', 1513418398, '', '192.168.1.135');
INSERT INTO `pms_user_token` VALUES (757, 89, 'zys', '012cdf55aec3515a5beb550c97cc71d2', 1513556488, '', '192.168.1.135');
INSERT INTO `pms_user_token` VALUES (758, 67, 'lxc', 'f3e92db2b9ec55a650d78206e0720727', 1513575023, '', '192.168.1.135');
INSERT INTO `pms_user_token` VALUES (759, 67, 'lxc', 'ebd9d0daf4e5348fae9c7cc1c1fb477b', 1513575155, '', '192.168.1.135');
INSERT INTO `pms_user_token` VALUES (760, 67, 'lxc', '207fb8662af28b3fedafcb751035ab52', 1513575192, '', '192.168.1.135');
INSERT INTO `pms_user_token` VALUES (761, 67, 'lxc', '8eb9f8ab8dd43151ff0449b1aaa44edd', 1513575295, '', '192.168.1.135');
INSERT INTO `pms_user_token` VALUES (762, 67, 'lxc', '5e916d9a61a7ba96034b0f43a9a4db15', 1513575336, '', '192.168.1.135');
INSERT INTO `pms_user_token` VALUES (763, 67, 'lxc', 'bb76500964ab69fc03a1d8ef75a90417', 1513575373, '', '192.168.1.135');
INSERT INTO `pms_user_token` VALUES (764, 67, 'lxc', '127dc035af615262e3a0f61fb1e47155', 1513575476, '', '192.168.1.135');
INSERT INTO `pms_user_token` VALUES (765, 103, 'lsw', 'ebc194c24646cdba5947e3f243118444', 1513575506, '', '192.168.1.135');
INSERT INTO `pms_user_token` VALUES (766, 103, 'lsw', '746bfdcf62c6730f6e7d0709ec63b265', 1513575508, '', '192.168.1.135');
INSERT INTO `pms_user_token` VALUES (767, 26, 'lws', 'a768c8a35b99f727427cb982360d38c3', 1513575512, '', '192.168.1.135');
INSERT INTO `pms_user_token` VALUES (768, 26, 'lws', '751e60e5951b840d41e73bd864e4a0cc', 1513579722, '', '192.168.1.135');
INSERT INTO `pms_user_token` VALUES (769, 94, 'jiangzheng', '334872169d1d374c1d55773180993c3c', 1513581748, '', '192.168.1.135');
INSERT INTO `pms_user_token` VALUES (770, 94, 'jiangzheng', '5cf9c99064ea811fe6e07ba4b7d15bca', 1513581750, '', '192.168.1.135');
INSERT INTO `pms_user_token` VALUES (771, 94, 'jiangzheng', 'bddf39ed41992d327f6e734ef182585a', 1513581751, '', '192.168.1.135');
INSERT INTO `pms_user_token` VALUES (772, 94, 'jiangzheng', '29933e005cc41d46ea4f6c65cc863a17', 1513581755, '', '192.168.1.135');
INSERT INTO `pms_user_token` VALUES (773, 94, 'jiangzheng', 'dd5fa5fcc1fb7e1c57584270fe7b52e1', 1513581760, '', '192.168.1.135');
INSERT INTO `pms_user_token` VALUES (774, 94, 'jiangzheng', '611fc40e0e230c6f731e052e3ccb3077', 1513581766, '', '192.168.1.135');
INSERT INTO `pms_user_token` VALUES (775, 94, 'jiangzheng', 'b52abaaedf20826dc2fb78fd4071f74b', 1513581790, '', '192.168.1.135');
INSERT INTO `pms_user_token` VALUES (776, 57, 'lxt', 'fdb8135200fcf38fb3767cc04a5aba09', 1513647709, '', '192.168.1.135');
INSERT INTO `pms_user_token` VALUES (777, 94, 'jiangzheng', 'ff6aa3fc355fc91e4e225c9efff794e7', 1513649419, '', '192.168.1.135');
INSERT INTO `pms_user_token` VALUES (778, 26, 'lws', 'a1cfcab754f345f0287e6f205ba98348', 1513670228, '', '192.168.1.135');
INSERT INTO `pms_user_token` VALUES (779, 70, 'liyonghen', 'c09b760adb1809d4264866d39359248e', 1513673259, '', '192.168.1.135');
INSERT INTO `pms_user_token` VALUES (780, 26, 'lws', '67c723c20c2adb53d1edc69ec10ffd92', 1513674208, '', '192.168.1.135');
INSERT INTO `pms_user_token` VALUES (781, 70, 'liyonghen', '6d4f2e41993e428218a96501c1298fc9', 1513731737, '', '192.168.1.135');
INSERT INTO `pms_user_token` VALUES (782, 103, 'lsw', 'c3e5b1db3bc44a93948bf1e58508f8a0', 1513741895, '', '192.168.1.135');
INSERT INTO `pms_user_token` VALUES (783, 26, 'lws', '58c933c7620a2bf7b8755bafa078f506', 1513749406, '', '192.168.1.135');
INSERT INTO `pms_user_token` VALUES (784, 26, 'lws', 'd037f9ef6b8be5ca6397cc30d0eabf64', 1513761863, '', '192.168.1.135');
INSERT INTO `pms_user_token` VALUES (785, 26, 'lws', '9cf22fa0314eb281483786e416b6aa38', 1513820925, '', '192.168.1.135');
INSERT INTO `pms_user_token` VALUES (786, 70, 'liyonghen', '90a3f9803131a00722127bef1a1b503c', 1513821672, '', '192.168.1.135');
INSERT INTO `pms_user_token` VALUES (787, 26, 'lws', '7e5c70e5d6c7ddc4f89fa1c982c6f0ba', 1513821998, '', '192.168.1.135');
INSERT INTO `pms_user_token` VALUES (788, 26, 'lws', '51821c4b3134ff15c75316c36f8222ea', 1513823508, '', '192.168.1.135');
INSERT INTO `pms_user_token` VALUES (789, 94, 'jiangzheng', 'af4610eb9d0b58b3445be987fcc54d14', 1513823687, '', '192.168.1.135');
INSERT INTO `pms_user_token` VALUES (790, 26, 'lws', '032d26174faf69b6465697d2cc38268f', 1513823711, '', '192.168.1.135');
INSERT INTO `pms_user_token` VALUES (791, 26, 'lws', '4b1172cceeda39e7f7a6b39684413bb9', 1513825096, '', '192.168.1.135');
INSERT INTO `pms_user_token` VALUES (792, 26, 'lws', 'ebc6d3653940accd32120c2fcfb81bf4', 1513825130, '', '192.168.1.135');
INSERT INTO `pms_user_token` VALUES (793, 26, 'lws', '52c9b87db58901736a0931938e377346', 1513826416, '', '192.168.1.135');
INSERT INTO `pms_user_token` VALUES (794, 26, 'lws', '994037ecd68ae2b0749dbf954815cb1c', 1513826554, '', '192.168.1.135');
INSERT INTO `pms_user_token` VALUES (795, 26, 'lws', '63a3b85b129f824ec14c770aa6c4a698', 1513826598, '', '192.168.1.135');
INSERT INTO `pms_user_token` VALUES (796, 103, 'lsw', 'fb0535aa884c2cc4ce70c9d26ffe53b4', 1513835455, '', '192.168.1.135');
INSERT INTO `pms_user_token` VALUES (797, 26, 'lws', '9eee8fe2b24c60721dadc585d2124896', 1513861189, '', '192.168.1.135');
INSERT INTO `pms_user_token` VALUES (798, 26, 'lws', '46cfeb7be62c615da12dde22ca26d2c4', 1513861729, '', '192.168.1.135');
INSERT INTO `pms_user_token` VALUES (799, 26, 'lws', 'c4208b960c0f63f1f5581651666c1b07', 1513862035, '', '192.168.1.135');
INSERT INTO `pms_user_token` VALUES (800, 26, 'lws', 'e6494698217f43b95ade1ef0b4de03d9', 1513862515, '', '192.168.1.135');
INSERT INTO `pms_user_token` VALUES (801, 26, 'lws', '37aae9164536135f465dff754ea26b3f', 1513862526, '', '192.168.1.135');
INSERT INTO `pms_user_token` VALUES (802, 26, 'lws', '3d1f4c16d5b719bb3d8b693e87309941', 1513903286, '', '192.168.1.135');
INSERT INTO `pms_user_token` VALUES (803, 26, 'lws', '99fb7d141cbbfdbc6bd4a8eb88e3ef89', 1513921703, '', '192.168.1.135');
INSERT INTO `pms_user_token` VALUES (804, 70, 'liyonghen', '249769aacc30d3706a7f41e790c8ab2a', 1513921738, '', '192.168.1.135');
INSERT INTO `pms_user_token` VALUES (805, 26, 'lws', '614e21df97012dc0c749361fc126fb31', 1513921750, '', '192.168.1.135');
INSERT INTO `pms_user_token` VALUES (806, 26, 'lws', '58a3afab4f0a651bf11a9e4e9cfc145c', 1513921783, '', '192.168.1.135');
INSERT INTO `pms_user_token` VALUES (807, 26, 'lws', 'd1c041c4eeb64ebf6469afd1687014a7', 1513921901, '', '192.168.1.135');
INSERT INTO `pms_user_token` VALUES (808, 26, 'lws', 'b3dbf40ff375a55f2fab1f53f293cfb6', 1513923060, '', '192.168.1.135');
INSERT INTO `pms_user_token` VALUES (809, 103, 'lsw', '5f0200acf1cd8c1ce36ab64bbcd48e17', 1513994224, '', '192.168.1.135');
INSERT INTO `pms_user_token` VALUES (810, 26, 'lws', 'd25e2fb0491cb839d9e68a36b7634a71', 1514010790, '', '192.168.1.135');
INSERT INTO `pms_user_token` VALUES (811, 26, 'lws', 'd3d2f3d06808b2152c6b502008e65379', 1514013446, '', '116.18.229.79, 121.40.36.119');
INSERT INTO `pms_user_token` VALUES (812, 26, 'lws', '7f247e1c48b04158deaeb910ffb6f7c2', 1514014878, '', '192.168.1.135');
INSERT INTO `pms_user_token` VALUES (813, 26, 'lws', '9b0bdfab506619c658f40db3f3135ecc', 1514015156, '', '127.0.0.1');
INSERT INTO `pms_user_token` VALUES (814, 94, 'jiangzheng', 'b239d8264aecce5fd48aed8875a647eb', 1514015988, '', '192.168.1.135');
INSERT INTO `pms_user_token` VALUES (815, 70, 'liyonghen', '886bcce68fc8dd27066b68afafa7ef78', 1514023565, '', '192.168.1.135');
INSERT INTO `pms_user_token` VALUES (816, 26, 'lws', 'e15927362423e93d9677d3c38a22388a', 1514042829, '', '119.141.254.182, 121.40.36.119');
INSERT INTO `pms_user_token` VALUES (817, 26, 'lws', '9f1178021f5555ff100c872603e18c65', 1514042974, '', '119.141.254.182, 121.40.36.119');
INSERT INTO `pms_user_token` VALUES (818, 26, 'lws', '8231f5d06d4e82fe63a1746547d3cc4a', 1514092684, '', '119.141.254.172, 121.40.36.119');
INSERT INTO `pms_user_token` VALUES (819, 26, 'lws', '12a5d6ee185754fc2c15ffdecc6ddca1', 1514161644, '', '192.168.1.135');
INSERT INTO `pms_user_token` VALUES (820, 70, 'liyonghen', '99362da4b53f7dcea26c2b3b6ddbe200', 1514162973, '', '192.168.1.135');
INSERT INTO `pms_user_token` VALUES (821, 26, 'lws', 'b8fd572664d7ddc822af9188c1464354', 1514248996, '', '192.168.1.135');
INSERT INTO `pms_user_token` VALUES (822, 67, 'lxc', '1626ac1cd0af7454fb1f69de203402e1', 1514255389, '', '192.168.1.135');
INSERT INTO `pms_user_token` VALUES (823, 16, 'wangpei', '0dfa21a76cdd21d87322fda2f45d2c0a', 1514257193, '', '192.168.1.135');
INSERT INTO `pms_user_token` VALUES (824, 70, 'liyonghen', '93b37eb982d4be7d9c6cc68cffcdf7eb', 1514268315, '', '192.168.1.135');
INSERT INTO `pms_user_token` VALUES (825, 67, 'lxc', '1878ff6a15796e27825237e9c14bbe93', 1514276156, '', '192.168.1.135');
INSERT INTO `pms_user_token` VALUES (826, 26, 'lws', '99fc59a3b114e65cd77f78cda926173d', 1514295021, '', '119.141.254.181, 121.40.36.119');
INSERT INTO `pms_user_token` VALUES (827, 26, 'lws', '7cdea3c8fabc29b73dff3e555cc6ee37', 1514335727, '', '192.168.1.135');
INSERT INTO `pms_user_token` VALUES (828, 70, 'liyonghen', '882e4707bd1f2bce3d74c59ecd7d99bc', 1514341660, '', '192.168.1.135');
INSERT INTO `pms_user_token` VALUES (829, 16, 'wangpei', '625a0fbbcbdd09c4a944e7c456a00fe4', 1514346493, '', '192.168.1.135');
INSERT INTO `pms_user_token` VALUES (830, 26, 'lws', '72c370dbccb8ac9a8cbd9f6956b822fc', 1514354057, '', '192.168.1.135');
INSERT INTO `pms_user_token` VALUES (831, 67, 'lxc', '3643fc69f650e697f254af7192d7fa74', 1514357079, '', '192.168.1.135');
INSERT INTO `pms_user_token` VALUES (832, 57, 'lxt', 'acceb269097f8938107a48893c09b837', 1514368199, '', '192.168.1.135');
INSERT INTO `pms_user_token` VALUES (833, 70, 'liyonghen', 'f1dee57ea0d29f3aefbe576c7887732e', 1514431971, '', '192.168.1.135');
INSERT INTO `pms_user_token` VALUES (834, 26, 'lws', '30c4f961c0218aff4cdd381eaacd26be', 1514440474, '', '192.168.1.135');
INSERT INTO `pms_user_token` VALUES (835, 67, 'lxc', '38245018572f7f57b1186a57af8e015f', 1514446597, '', '192.168.1.135');
INSERT INTO `pms_user_token` VALUES (836, 26, 'lws', '230bb869e410b3b0dae3aa905ea23efe', 1514451723, '', '192.168.1.135');
INSERT INTO `pms_user_token` VALUES (837, 70, 'liyonghen', '9fb4d421e1543b2737c2fc73ec49b9e2', 1514509335, '', '192.168.1.135');
INSERT INTO `pms_user_token` VALUES (838, 67, 'lxc', 'a2387af8149e91cdc75384ae6af5e2f3', 1514511018, '', '192.168.1.135');
INSERT INTO `pms_user_token` VALUES (839, 70, 'liyonghen', 'a90366ba7d7950db0c8ed4a70fd9f15f', 1514526400, '', '192.168.1.135');
INSERT INTO `pms_user_token` VALUES (840, 26, 'lws', 'f283d19858cbcaa304d5a3b8e2ca2507', 1514539561, '', '192.168.1.135');
INSERT INTO `pms_user_token` VALUES (841, 26, 'lws', '3824c2d39d8485b1372344276c44b7d5', 1514855045, '', '192.168.1.135');
INSERT INTO `pms_user_token` VALUES (842, 70, 'liyonghen', '4b886eaa9c994a2a510e7858592f6555', 1514862407, '', '192.168.1.135');
INSERT INTO `pms_user_token` VALUES (843, 67, 'lxc', '8cdf6b3c7ab294d9f0ba566ec31d95de', 1514876033, '', '192.168.1.135');
INSERT INTO `pms_user_token` VALUES (844, 67, 'lxc', '3e92e26b16ec94c41fdb8f58f70e5c9d', 1514883145, '', '192.168.1.135');
INSERT INTO `pms_user_token` VALUES (845, 26, 'lws', '0be5369aa026419617015c63d7a26627', 1514940550, '', '192.168.1.135');
INSERT INTO `pms_user_token` VALUES (846, 67, 'lxc', 'd774606f5580626bffce6d95d7e4ab62', 1514943342, '', '192.168.1.135');
INSERT INTO `pms_user_token` VALUES (847, 16, 'wangpei', '5f93f3f461481e12d6a57da30c808ecc', 1514964211, '', '192.168.1.135');
INSERT INTO `pms_user_token` VALUES (848, 70, 'liyonghen', 'c1e0148df706bb86aa197b54c44c61a3', 1515027134, '', '192.168.1.135');
INSERT INTO `pms_user_token` VALUES (849, 26, 'lws', '9a85eb0c82edf53adec317d70099c1bf', 1515027284, '', '192.168.1.135');
INSERT INTO `pms_user_token` VALUES (850, 70, 'liyonghen', 'a72ddbaa5fe017bbb65e90c474d24c66', 1515031683, '', '192.168.1.135');
INSERT INTO `pms_user_token` VALUES (851, 70, 'liyonghen', 'cc968b38b69d70851bca1c90154590c1', 1515112708, '', '192.168.1.135');
INSERT INTO `pms_user_token` VALUES (852, 67, 'lxc', '4be0599125013740cce6b07c858cc864', 1515115130, '', '192.168.1.135');
INSERT INTO `pms_user_token` VALUES (853, 26, 'lws', 'd6ecbf9fcbb25f345ed53a953ecfc3a6', 1515115369, '', '192.168.1.135');
INSERT INTO `pms_user_token` VALUES (854, 16, 'wangpei', 'bfb4f5846035d1c40cefe0b9f47f701c', 1515121070, '', '192.168.1.135');
INSERT INTO `pms_user_token` VALUES (855, 118, 'lgx', 'd4d5c6f92105e237d5e382e210a55eae', 1515135724, '', '192.168.1.135');
INSERT INTO `pms_user_token` VALUES (856, 70, 'liyonghen', '301dd127fda044ad84c808d4da378913', 1515141647, '', '192.168.1.135');
INSERT INTO `pms_user_token` VALUES (857, 57, 'lxt', 'b299946704b70dfd196efd1e4caaee85', 1515144735, '', '192.168.1.135');
INSERT INTO `pms_user_token` VALUES (858, 26, 'lws', '168f186660681ffbcf79f67132a44895', 1515201777, '', '192.168.1.135');
INSERT INTO `pms_user_token` VALUES (859, 26, 'lws', 'cd508173162659c544942a121dfce4ed', 1515203606, '', '192.168.1.135');
INSERT INTO `pms_user_token` VALUES (860, 67, 'lxc', '18722f38dfbf8ca5590367e2460e6384', 1515203639, '', '192.168.1.135');
INSERT INTO `pms_user_token` VALUES (861, 26, 'lws', '5ff7a24fbde284385899153f1e7d015f', 1515203694, '', '192.168.1.135');
INSERT INTO `pms_user_token` VALUES (862, 67, 'lxc', '08c11725881e02ca2aa6ed431a15476a', 1515203898, '', '192.168.1.135');
INSERT INTO `pms_user_token` VALUES (863, 26, 'lws', 'd0906f81a28351a2748a13d2893e21ec', 1515204106, '', '192.168.1.135');
INSERT INTO `pms_user_token` VALUES (864, 16, 'wangpei', 'ee28a5500b1f27930f3f2ac6c71c2deb', 1515219070, '', '192.168.1.135');
INSERT INTO `pms_user_token` VALUES (865, 82, 'lijialiang', '68911c18f35aaf3a669f828834689fe2', 1515225858, '', '192.168.1.135');
INSERT INTO `pms_user_token` VALUES (866, 26, 'lws', '08c6612cd1c054b72e7566704befbb03', 1515226163, '', '192.168.1.135');
INSERT INTO `pms_user_token` VALUES (867, 82, 'lijialiang', '0adb490a97164cf4629d4d3d9f08e006', 1515226265, '', '192.168.1.135');
INSERT INTO `pms_user_token` VALUES (868, 26, 'lws', '5cffa1b491320f3aea8d5c90f7b6f138', 1515372448, '', '192.168.1.135');
INSERT INTO `pms_user_token` VALUES (869, 70, 'liyonghen', '9dcc37cb0890d2f072fd2a7cb87f9873', 1515373245, '', '192.168.1.135');
INSERT INTO `pms_user_token` VALUES (870, 16, 'wangpei', 'd85fa588d90e9170723458c80737ac1e', 1515375711, '', '192.168.1.135');
INSERT INTO `pms_user_token` VALUES (871, 70, 'liyonghen', 'da7d08bf6b09780c02bb64f25fefa478', 1515390800, '', '192.168.1.135');
INSERT INTO `pms_user_token` VALUES (872, 11, 'dengl', '5257980b3e7502f536fcee9e7f69b459', 1515401733, '', '192.168.1.135');
INSERT INTO `pms_user_token` VALUES (873, 62, 'lyh', 'c3452bcedfca8ed4fd2281f9dfcb5d42', 1515401848, '', '192.168.1.135');
INSERT INTO `pms_user_token` VALUES (874, 62, 'lyh', '02fb7c6f06bf48c4207c4ed23343a74f', 1515401996, '', '192.168.1.135');
INSERT INTO `pms_user_token` VALUES (875, 82, 'lijialiang', 'd49b05afc832e824be1e13a8ddb085ae', 1515402175, '', '192.168.1.135');
INSERT INTO `pms_user_token` VALUES (876, 11, 'dengl', '8aeeaf04efbd0ccba3cbb8f1ce17721d', 1515402547, '', '192.168.1.135');
INSERT INTO `pms_user_token` VALUES (877, 11, 'dengl', '402011bed964b834850df7ec1c34163a', 1515402574, '', '192.168.1.135');
INSERT INTO `pms_user_token` VALUES (878, 67, 'lxc', 'f2b03eb84c96e6b7d55daced2753d164', 1515458826, '', '192.168.1.135');
INSERT INTO `pms_user_token` VALUES (879, 26, 'lws', '2ec4ba8b744ee53e1f218cdf5d5410d3', 1515458879, '', '192.168.1.135');
INSERT INTO `pms_user_token` VALUES (880, 70, 'liyonghen', '996aac4e202f62e84d994c623ce2c192', 1515459068, '', '192.168.1.135');
INSERT INTO `pms_user_token` VALUES (881, 26, 'lws', '7a5d7e2a190b8cc562928d1b8897987c', 1515460417, '', '192.168.1.135');
INSERT INTO `pms_user_token` VALUES (882, 66, 'zjj', 'e489401b17fbe4e8c7a74efbcac92cf6', 1515460609, '', '192.168.1.135');
INSERT INTO `pms_user_token` VALUES (883, 82, 'lijialiang', 'd125d58782ed76bd66ad1d515fe309ed', 1515461138, '', '192.168.1.135');
INSERT INTO `pms_user_token` VALUES (884, 26, 'lws', '14004bde252aeacfba52731367252da2', 1515461557, '', '192.168.1.135');
INSERT INTO `pms_user_token` VALUES (885, 16, 'wangpei', 'e8c5a4047b7f3dc82350a6fbe46bab72', 1515462709, '', '192.168.1.135');
INSERT INTO `pms_user_token` VALUES (886, 67, 'lxc', '2601c4c78a1ce7860f1b9db98eb05018', 1515546930, '', '192.168.1.135');
INSERT INTO `pms_user_token` VALUES (887, 26, 'lws', '0df3769386e8975e36e96f77f26bac3b', 1515548198, '', '192.168.1.135');
INSERT INTO `pms_user_token` VALUES (888, 26, 'lws', '7e3a8bd7411fbd2cab72d698ec796f41', 1515551586, '', '192.168.1.135');
INSERT INTO `pms_user_token` VALUES (889, 26, 'lws', '1c6e5da500442d4e250cc160043175c1', 1515551929, '', '192.168.1.135');
INSERT INTO `pms_user_token` VALUES (890, 16, 'wangpei', 'd7e0ae5a19c83986d87b9f3eb993d991', 1515554822, '', '192.168.1.135');
INSERT INTO `pms_user_token` VALUES (891, 2, 'lzj', 'b19a3b8652494bb2916c69956b4c1512', 1515557585, '', '192.168.1.135');
INSERT INTO `pms_user_token` VALUES (892, 66, 'zjj', 'c2260d8c5f8675c73b5197cc2cc21ac5', 1515630887, '', '192.168.1.135');
INSERT INTO `pms_user_token` VALUES (893, 70, 'liyonghen', 'd3e7ea8af61d2df3f5d0c0c57776ee7e', 1515633585, '', '192.168.1.135');
INSERT INTO `pms_user_token` VALUES (894, 94, 'jiangzheng', 'c255623dc943f5f45978d340b38ec300', 1515638513, '', '192.168.1.135');
INSERT INTO `pms_user_token` VALUES (895, 16, 'wangpei', '1c81ac7fea2a1ec436c826f81961bffe', 1515650647, '', '192.168.1.135');
INSERT INTO `pms_user_token` VALUES (896, 70, 'liyonghen', '0775df3c2741832fbed0c29114fcc538', 1515717846, '', '192.168.1.135');
INSERT INTO `pms_user_token` VALUES (897, 67, 'lxc', '299b42680fe2ef5b94bf5952b5392bf3', 1515718854, '', '192.168.1.135');
INSERT INTO `pms_user_token` VALUES (898, 67, 'lxc', 'bb0d4b3958bfc76ee324a7d803bd753f', 1515750339, '', '192.168.1.135');
INSERT INTO `pms_user_token` VALUES (899, 70, 'liyonghen', 'd6ea62ecd2c0b106e1afde65c5892a77', 1515751943, '', '192.168.1.135');
INSERT INTO `pms_user_token` VALUES (900, 66, 'zjj', '664e19ee6ad9bc708f279b7854d9b5c9', 1515803680, '', '192.168.1.135');
INSERT INTO `pms_user_token` VALUES (901, 67, 'lxc', '65dae9df9433e0da9fce39059d3d346c', 1515803698, '', '192.168.1.135');
INSERT INTO `pms_user_token` VALUES (902, 26, 'lws', 'd9e00a31a9a5d737460ae7754fc410c6', 1515807255, '', '192.168.1.135');
INSERT INTO `pms_user_token` VALUES (903, 26, 'lws', 'daeb191b00e743be3690be4743271cea', 1515976982, '', '192.168.1.135');
INSERT INTO `pms_user_token` VALUES (904, 26, 'lws', '769618e02080d7f794c349e0b80a768b', 1516062777, '', '192.168.1.135');
INSERT INTO `pms_user_token` VALUES (905, 66, 'zjj', 'c4bfbfc6149ec9e493577da067c6aa87', 1516065564, '', '192.168.1.135');
INSERT INTO `pms_user_token` VALUES (906, 26, 'lws', '4b8844007a7317d5422f17a9f63a3865', 1516065982, '', '192.168.1.135');
INSERT INTO `pms_user_token` VALUES (907, 26, 'lws', '01834f0f9282ac2ba0729cafb4ba3355', 1516065982, '', '192.168.1.135');
INSERT INTO `pms_user_token` VALUES (908, 66, 'zjj', '21a37199a94e14f9e45ab2ebbbaf585b', 1516065983, '', '192.168.1.135');
INSERT INTO `pms_user_token` VALUES (909, 66, 'zjj', '47a9a0772ea7ebd3b761152136112a6a', 1516065983, '', '192.168.1.135');
INSERT INTO `pms_user_token` VALUES (910, 26, 'lws', 'd588c0bb1770118785543f8bee6b12a9', 1516066031, '', '192.168.1.135');
INSERT INTO `pms_user_token` VALUES (911, 11, 'dengl', 'f4efb3f8e06e92c69f274689c5eec738', 1516066923, '', '192.168.1.135');
INSERT INTO `pms_user_token` VALUES (912, 26, 'lws', '8e8adf90d8249056c5d3f2c0da86f6ca', 1516086465, '', '192.168.1.135');
INSERT INTO `pms_user_token` VALUES (913, 101, 'yjb', 'cd098a6e963979adbe16b886d0e0fde7', 1516086498, '', '192.168.1.135');
INSERT INTO `pms_user_token` VALUES (914, 11, 'dengl', '59693ca58a78596f7ce96dd6c453b008', 1516154529, '', '192.168.1.135');
INSERT INTO `pms_user_token` VALUES (915, 62, 'lyh', 'bed252194f128a0821f3ea9f657e9a1c', 1516155543, '', '192.168.1.135');
INSERT INTO `pms_user_token` VALUES (916, 11, 'dengl', '6b22b38df456507c427f9fbb67f5e75a', 1516169851, '', '192.168.1.135');
INSERT INTO `pms_user_token` VALUES (917, 2, 'lzj', '33f1ade1e5d99d99716b259c6ba05901', 1516169999, '', '192.168.1.135');
INSERT INTO `pms_user_token` VALUES (918, 2, 'lzj', '14685452af44fcf58e6b6e3023502382', 1516170127, '', '192.168.1.135');
INSERT INTO `pms_user_token` VALUES (919, 11, 'dengl', '1a8039dfab9dad62b0f777d4bd709737', 1516170382, '', '192.168.1.135');
INSERT INTO `pms_user_token` VALUES (920, 66, 'zjj', 'bf3c0d6618eb64a1d7f69e90b10e993e', 1516171225, '', '192.168.1.135');
INSERT INTO `pms_user_token` VALUES (921, 26, 'lws', '9804cdb1ede0bd8346524ede1570f3ab', 1516173886, '', '192.168.1.135');
INSERT INTO `pms_user_token` VALUES (922, 94, 'jiangzheng', '4f9c056480a3df91275ed23ec7541590', 1516182703, '', '192.168.1.135');
INSERT INTO `pms_user_token` VALUES (923, 26, 'lws', '01f8a3223dd826300db13a549aed7693', 1516193487, '', '192.168.1.135');
INSERT INTO `pms_user_token` VALUES (924, 26, 'lws', 'a701b72b9215198a12805dbd37ebe781', 1516194003, '', '192.168.1.135');
INSERT INTO `pms_user_token` VALUES (925, 26, 'lws', '734227e0d8da7e1f2046a366f4a62547', 1516194215, '', '192.168.1.135');
INSERT INTO `pms_user_token` VALUES (926, 26, 'lws', 'f86fbfe46540fa232cbb0e6fbeda713e', 1516195222, '', '192.168.1.135');
INSERT INTO `pms_user_token` VALUES (927, 26, 'lws', '6efad5c9798bf23df68763fc2be70196', 1516197240, '', '192.168.1.135');
INSERT INTO `pms_user_token` VALUES (928, 26, 'lws', 'ef55a90a802a7a34944802735413ea01', 1516236341, '', '192.168.1.135');
INSERT INTO `pms_user_token` VALUES (929, 94, 'jiangzheng', 'c6889a18c519b5a8fa31b1311a07ead1', 1516236711, '', '192.168.1.135');
INSERT INTO `pms_user_token` VALUES (930, 66, 'zjj', 'b3ddb605517da4830b483922d3a708e6', 1516256162, '', '192.168.1.135');
INSERT INTO `pms_user_token` VALUES (931, 62, 'lyh', 'dbbff4ca04a3371b49fe9c1a1f7cce2d', 1516256715, '', '192.168.1.135');
INSERT INTO `pms_user_token` VALUES (932, 62, 'lyh', 'f8f5fa9459117b692b9ff4bf385acd34', 1516256727, '', '192.168.1.135');
INSERT INTO `pms_user_token` VALUES (933, 62, 'lyh', 'abed16e360ab8fff2860efa31fcea5bd', 1516256729, '', '192.168.1.135');
INSERT INTO `pms_user_token` VALUES (934, 62, 'lyh', '7318c4599bd6fa980eb5aff2da1cf24a', 1516256740, '', '192.168.1.135');
INSERT INTO `pms_user_token` VALUES (935, 62, 'lyh', 'cdac6d6f684d691c45d1097d2487e8f2', 1516256750, '', '192.168.1.135');
INSERT INTO `pms_user_token` VALUES (936, 62, 'lyh', 'b47e5121a98582a357dc60f2b6e5a4d1', 1516256753, '', '192.168.1.135');
INSERT INTO `pms_user_token` VALUES (937, 62, 'lyh', '07552d57bea0dc4a58eda401f236c51f', 1516256760, '', '192.168.1.135');
INSERT INTO `pms_user_token` VALUES (938, 26, 'lws', '17bf8954128d78b9ddc8b28890be2d8b', 1516258571, '', '116.18.228.173');
INSERT INTO `pms_user_token` VALUES (939, 26, 'lws', '56b91d8dbcc1579cc1f3f31a7991b7e6', 1516258996, '', '116.18.228.173');
INSERT INTO `pms_user_token` VALUES (940, 119, 'xiaoming', '9fbd8bf67f596cdb6adbd81be14c7ccc', 1516259261, '', '116.18.228.173');
INSERT INTO `pms_user_token` VALUES (941, 26, 'lws', 'eb1d05622df4a5ed17b767ea44fa95b5', 1516259286, '', '116.18.228.173');
INSERT INTO `pms_user_token` VALUES (942, 119, 'xiaoming', '584b1c5e05e81edb31949b27e8a0a611', 1516259303, '', '116.18.228.173');
INSERT INTO `pms_user_token` VALUES (943, 119, 'xiaoming', 'f0cc11bb6955e750c9bb11db8761708a', 1516259645, '', '116.18.228.173');
INSERT INTO `pms_user_token` VALUES (944, 119, 'xiaoming', 'd8f0c6c3b03885c9a938bed5990a6582', 1516259654, '', '116.18.228.173');
INSERT INTO `pms_user_token` VALUES (945, 119, 'xiaoming', '2b415448380db5f016b1a5728df5b299', 1516259706, '', '116.18.228.173');
INSERT INTO `pms_user_token` VALUES (946, 26, 'lws', 'f1fe5597925c70c5a5e292b30dc39151', 1516259755, '', '116.18.228.173');
INSERT INTO `pms_user_token` VALUES (947, 119, 'xiaoming', '67eb0d28b4f4ececb5615e66a2458b9b', 1516260942, '', '116.18.228.173');
INSERT INTO `pms_user_token` VALUES (948, 26, 'lws', 'f6872f4fe43555520c001630ca573cc2', 1516261141, '', '116.18.228.173');
INSERT INTO `pms_user_token` VALUES (949, 119, 'xiaoming', '953a2e7a33f55ca1a1977d5f98989dd4', 1516261160, '', '116.18.228.173');
INSERT INTO `pms_user_token` VALUES (950, 26, 'lws', '08ec6d5423ff6685d3028fa62b16871d', 1516261491, '', '116.18.228.173');
INSERT INTO `pms_user_token` VALUES (951, 119, 'xiaoming', '3b2c33f596c2d7f01621cedcc7cf07f0', 1516261660, '', '116.18.228.173');
INSERT INTO `pms_user_token` VALUES (952, 119, 'xiaoming', '1c414d21ab57d179da85a946f6ca4149', 1516262607, '', '14.25.238.141');
INSERT INTO `pms_user_token` VALUES (953, 119, 'xiaoming', '8c10ba3c9331670d5548115ad4a5e328', 1516264799, '', '116.18.228.173');
INSERT INTO `pms_user_token` VALUES (954, 26, 'lws', '6d286e2f289054ab4c54aa7061fc2056', 1516266408, '', '116.18.228.173');
INSERT INTO `pms_user_token` VALUES (955, 119, 'xiaoming', '352441794e3f91af7e63bfa3bf8d86de', 1516269258, '', '116.18.228.173');
INSERT INTO `pms_user_token` VALUES (956, 26, 'lws', '936cad700fe7a8d10d64e945ec9708d0', 1516269313, '', '116.18.228.173');
INSERT INTO `pms_user_token` VALUES (957, 119, 'xiaoming', 'd519ce55a14ab5988ec012ea3fcd9c09', 1516269335, '', '183.14.29.71');
INSERT INTO `pms_user_token` VALUES (958, 119, 'xiaoming', 'd20ec3f5b6dde2782a0cd332c654f150', 1516269337, '', '183.14.29.71');
INSERT INTO `pms_user_token` VALUES (959, 119, 'xiaoming', '197a84442f4fba163a8bafa3d2482e02', 1516269353, '', '183.14.31.142');
INSERT INTO `pms_user_token` VALUES (960, 119, 'xiaoming', '3d44cdd47401ddc8d4ade72c675cb9ea', 1516269580, '', '113.87.180.108');
INSERT INTO `pms_user_token` VALUES (961, 119, 'xiaoming', '225fbeeb24daedd8225a99268023bb94', 1516269670, '', '59.42.144.47');
INSERT INTO `pms_user_token` VALUES (962, 119, 'xiaoming', 'fcbfa7c50090ff6c2c4974a7008d9c42', 1516270991, '', '113.65.19.123');
INSERT INTO `pms_user_token` VALUES (963, 119, 'xiaoming', 'e99225199d4880a92f7f1834413d739c', 1516272172, '', '110.53.252.100');
INSERT INTO `pms_user_token` VALUES (964, 119, 'xiaoming', 'baf124236e48fe99cae65cbd6034921a', 1516274404, '', '223.104.248.7');
INSERT INTO `pms_user_token` VALUES (965, 119, 'xiaoming', 'ea522f05edd0723f2bfd6482ad323827', 1516276678, '', '182.137.222.23');
INSERT INTO `pms_user_token` VALUES (966, 119, 'xiaoming', '48931dd85b9698a4d1d8557405d83600', 1516276682, '', '182.137.222.23');
INSERT INTO `pms_user_token` VALUES (967, 119, 'xiaoming', '5eddb8025b3899d4569f112b41cc003f', 1516276684, '', '182.137.222.23');
INSERT INTO `pms_user_token` VALUES (968, 119, 'xiaoming', '463029f1863b85f462889bb433f9a669', 1516322921, '', '106.7.172.154');
INSERT INTO `pms_user_token` VALUES (969, 26, 'lws', '2bbd398635baea6fb31c2cdc25b637e4', 1516353874, '', '116.18.228.173');
INSERT INTO `pms_user_token` VALUES (970, 26, 'lws', '5ed489d1e1590d2c59b89d3ea7736dc9', 1516354774, '', '116.18.228.173');
INSERT INTO `pms_user_token` VALUES (971, 26, 'lws', '98e30764cd54683bed579b682e3e9383', 1516368125, '', '116.18.228.173');
INSERT INTO `pms_user_token` VALUES (972, 119, 'xiaoming', '3aaf3ac3018cf0e506b4b89b87908837', 1516411863, '', '59.52.113.66');
INSERT INTO `pms_user_token` VALUES (973, 119, 'xiaoming', 'a04118f3fc6b108c5a13c010d36801b9', 1516411870, '', '59.52.113.66');
INSERT INTO `pms_user_token` VALUES (974, 119, 'xiaoming', 'e32c90574af45682e1f76dd750c87d06', 1516411888, '', '59.52.113.66');
INSERT INTO `pms_user_token` VALUES (975, 119, 'xiaoming', '87d5210897c59e832da1d85d49459f6b', 1516411918, '', '59.52.113.66');
INSERT INTO `pms_user_token` VALUES (976, 119, 'xiaoming', '3ce18296e8750ac4f536eded2c335c82', 1516411920, '', '59.52.113.66');
INSERT INTO `pms_user_token` VALUES (977, 119, 'xiaoming', 'fc7efc8f5a1d1e1b8a97a444870ce3af', 1516411932, '', '59.52.113.66');
INSERT INTO `pms_user_token` VALUES (978, 119, 'xiaoming', 'ae5d1099182b24a0fca8a9606ac1e936', 1516412031, '', '59.52.113.66');
INSERT INTO `pms_user_token` VALUES (979, 119, 'xiaoming', '0b5bee6e15cdefccd072443a29937b02', 1516413410, '', '106.7.174.187');
INSERT INTO `pms_user_token` VALUES (980, 119, 'xiaoming', 'a691bf77f4e9307c1cf742e0493b7120', 1516451852, '', '223.104.210.174');
INSERT INTO `pms_user_token` VALUES (981, 26, 'lws', '8b607a611e3673b34084b05e8e38811a', 1516460499, '', '119.141.254.147');
INSERT INTO `pms_user_token` VALUES (982, 26, 'lws', '3ac544a2281bf0529b64e89170c36857', 1516505851, '', '119.141.254.139');
INSERT INTO `pms_user_token` VALUES (983, 26, 'lws', '73399523b0710ddd7b184633af738d1b', 1516508806, '', '119.141.254.139');
INSERT INTO `pms_user_token` VALUES (984, 120, 'xiaowang', '81cc025528de61a77206a2f6b8c14502', 1516508823, '', '119.141.254.139');
INSERT INTO `pms_user_token` VALUES (985, 119, 'xiaoming', '5622c30b79585deb78800988fd414324', 1516508980, '', '119.141.254.139');
INSERT INTO `pms_user_token` VALUES (986, 26, 'lws', '6f46d39f1075bcc6014b54524a2ca82b', 1516509075, '', '119.141.254.139');
INSERT INTO `pms_user_token` VALUES (987, 119, 'xiaoming', 'e69678e6e336c86e9adc6b9265a22230', 1516509163, '', '119.141.254.139');
INSERT INTO `pms_user_token` VALUES (988, 119, 'xiaoming', '4548e2d0dd8edb322e175773bc75806c', 1516535897, '', '223.223.196.174');
INSERT INTO `pms_user_token` VALUES (989, 26, 'lws', '4637ca56766632dc827db3b405f7383c', 1516542547, '', '119.141.254.134');
INSERT INTO `pms_user_token` VALUES (990, 119, 'xiaoming', 'd6fb32b22ecb5a3f7d3471ad07d53ed8', 1516591004, '', '222.173.82.98');
INSERT INTO `pms_user_token` VALUES (991, 119, 'xiaoming', '43a77d4c786203a17d648e9df47c47b3', 1516592074, '', '211.147.226.130');
INSERT INTO `pms_user_token` VALUES (992, 119, 'xiaoming', 'a2b6d152f879190f727b341194ea2eba', 1516671722, '', '112.17.87.192');
INSERT INTO `pms_user_token` VALUES (993, 119, 'xiaoming', 'f90a93796a83ee6821df21165f1d4df2', 1516671723, '', '112.17.87.192');
INSERT INTO `pms_user_token` VALUES (994, 119, 'xiaoming', 'c79c743b06a1eb325db8ebb5dde7962d', 1516671913, '', '223.99.59.246');
INSERT INTO `pms_user_token` VALUES (995, 26, 'lws', '36cc5aa853d57d78c0a8e6240878be09', 1516672223, '', '116.18.228.69');
INSERT INTO `pms_user_token` VALUES (996, 26, 'lws', 'ecd2437f6d1d5d35f2fbe2f136ea697c', 1516672229, '', '116.18.228.69');
INSERT INTO `pms_user_token` VALUES (997, 26, 'lws', '9af8f30e67cf065a952e6f0b92466e17', 1516672236, '', '116.18.228.69');
INSERT INTO `pms_user_token` VALUES (998, 119, 'xiaoming', '79e890dc0d22bca7d58420cbd926ba44', 1516672252, '', '116.18.228.69');
INSERT INTO `pms_user_token` VALUES (999, 26, 'lws', 'afffa5227b106bbed5f8794256e405ac', 1516672273, '', '116.18.228.69');
INSERT INTO `pms_user_token` VALUES (1000, 26, 'lws', 'c3395b122427e0e9b94d1174657ebf1c', 1516672389, '', '116.18.228.69');
INSERT INTO `pms_user_token` VALUES (1001, 119, 'xiaoming', 'cccb352d005eb95244927b30587f2f00', 1516672747, '', '113.65.32.43');
INSERT INTO `pms_user_token` VALUES (1002, 119, 'xiaoming', '89c229b581cefc54730075d8e7fe07cc', 1516672942, '', '183.62.218.42');
INSERT INTO `pms_user_token` VALUES (1003, 119, 'xiaoming', '3d04b02a8a5614265bd24123c799e548', 1516673436, '', '118.122.120.53');
INSERT INTO `pms_user_token` VALUES (1004, 119, 'xiaoming', '5f6df2caf915102bac02b3f94486fb92', 1516673527, '', '121.32.129.20');
INSERT INTO `pms_user_token` VALUES (1005, 119, 'xiaoming', 'c268e2baaca0ded5564329321648e6f0', 1516673846, '', '118.187.57.15');
INSERT INTO `pms_user_token` VALUES (1006, 119, 'xiaoming', '305292eb2ba5242b5f4361309f52be58', 1516673927, '', '182.148.13.191');
INSERT INTO `pms_user_token` VALUES (1007, 119, 'xiaoming', '652250e9f68f5cdc21dce9a06f127850', 1516674051, '', '111.204.156.194');
INSERT INTO `pms_user_token` VALUES (1008, 119, 'xiaoming', '722b801366e24a20527d74a8c1fb72ea', 1516674054, '', '111.204.156.194');
INSERT INTO `pms_user_token` VALUES (1009, 119, 'xiaoming', 'e08df0faf2b985629196c705a0e318cf', 1516674085, '', '218.2.210.118');
INSERT INTO `pms_user_token` VALUES (1010, 119, 'xiaoming', '8b2d3ceb22823cfb7d56fc810460bf87', 1516674174, '', '218.2.210.118');
INSERT INTO `pms_user_token` VALUES (1011, 119, 'xiaoming', '3ac37ea89381289699b5275eecb1e600', 1516675612, '', '180.110.49.150');
INSERT INTO `pms_user_token` VALUES (1012, 119, 'xiaoming', '29a962ef3a657e512fd3ec6cb26436ed', 1516678601, '', '115.57.138.236');
INSERT INTO `pms_user_token` VALUES (1013, 119, 'xiaoming', '24404935ecda480a1e976fccb11ec426', 1516678602, '', '115.57.138.236');
INSERT INTO `pms_user_token` VALUES (1014, 119, 'xiaoming', 'f12579eb49356b3d33dfa33a0e0eadbf', 1516679047, '', '114.253.70.250');
INSERT INTO `pms_user_token` VALUES (1015, 119, 'xiaoming', '969f5cf98837b15fee2cbd6e066f4ec3', 1516679582, '', '59.41.93.89');
INSERT INTO `pms_user_token` VALUES (1016, 119, 'xiaoming', '22e4f20d3f9d23cf0b90abb709c3fdd6', 1516679583, '', '59.41.93.89');
INSERT INTO `pms_user_token` VALUES (1017, 119, 'xiaoming', 'f81223ad3fd54fd16493bc88c17c4854', 1516680215, '', '115.57.138.236');
INSERT INTO `pms_user_token` VALUES (1018, 119, 'xiaoming', 'da5ef88b631de7d65553a0b2807eb18e', 1516680493, '', '61.144.96.101');
INSERT INTO `pms_user_token` VALUES (1019, 119, 'xiaoming', '96f3ce69eba4233d8e74efee6b1e9107', 1516684320, '', '171.11.145.7');
INSERT INTO `pms_user_token` VALUES (1020, 119, 'xiaoming', '9ca4e6c6d38b8d3220a404a9bce5fe2a', 1516686226, '', '113.68.252.141');
INSERT INTO `pms_user_token` VALUES (1021, 119, 'xiaoming', 'f20712bfa82a25fcef5e91c9899ceb32', 1516686787, '', '1.24.210.5');
INSERT INTO `pms_user_token` VALUES (1022, 119, 'xiaoming', 'd9ccea1ed54588aab496cd005ffc9b9c', 1516687873, '', '222.43.126.209');
INSERT INTO `pms_user_token` VALUES (1023, 119, 'xiaoming', '3ddb01d00c158ab5c140b9501486cdbf', 1516687923, '', '222.43.126.209');
INSERT INTO `pms_user_token` VALUES (1024, 119, 'xiaoming', 'a4c4d7e8005ee5af47ac9839780e5fbb', 1516689232, '', '36.40.34.100');
INSERT INTO `pms_user_token` VALUES (1025, 119, 'xiaoming', '25eefb3eb63b6fce37aba0585c69de01', 1516689450, '', '183.6.104.208');
INSERT INTO `pms_user_token` VALUES (1026, 119, 'xiaoming', '7e806c8c98d14521298e962cc78b167e', 1516689929, '', '111.200.62.30');
INSERT INTO `pms_user_token` VALUES (1027, 119, 'xiaoming', 'b11819d5717b36c52b9ef9e71ce5f609', 1516689930, '', '111.200.62.30');
INSERT INTO `pms_user_token` VALUES (1028, 119, 'xiaoming', 'acc3e3dad7d091fd1fd3725345dd6805', 1516690575, '', '123.139.28.229');
INSERT INTO `pms_user_token` VALUES (1029, 119, 'xiaoming', '03a83e3e9f1934ac1280a079a339bc07', 1516690622, '', '101.95.189.42');
INSERT INTO `pms_user_token` VALUES (1030, 119, 'xiaoming', 'a73fd05ec1e85543b4259b39be78141d', 1516690811, '', '101.81.193.163');
INSERT INTO `pms_user_token` VALUES (1031, 119, 'xiaoming', '19a3dae1c414532640201b65c132a265', 1516693574, '', '114.242.249.144');
INSERT INTO `pms_user_token` VALUES (1032, 119, 'xiaoming', '21bb4cc49bbcc7e9f3537b9c7c8b5638', 1516694907, '', '171.34.164.172');
INSERT INTO `pms_user_token` VALUES (1033, 119, 'xiaoming', '8c3942302cc56fe6df85f92392b745ae', 1516699535, '', '218.90.124.243');
INSERT INTO `pms_user_token` VALUES (1034, 119, 'xiaoming', 'dc0872dba045f172450e7fe581511b73', 1516702765, '', '101.130.55.157');
INSERT INTO `pms_user_token` VALUES (1035, 26, 'lws', '41d4658a8c00f21b59aca77a1e75c545', 1516707424, '', '116.18.228.69');
INSERT INTO `pms_user_token` VALUES (1036, 119, 'xiaoming', '2702cf8a32df6c336a754f03d0645c8b', 1516718386, '', '114.84.28.82');
INSERT INTO `pms_user_token` VALUES (1037, 26, 'lws', 'f9f8179c4d2fbe3b5fd015fc7635e3a9', 1516718453, '', '119.141.254.183');
INSERT INTO `pms_user_token` VALUES (1038, 119, 'xiaoming', '12e934a420b1cf5f362beeaab0a1f156', 1516724815, '', '58.247.35.146');
INSERT INTO `pms_user_token` VALUES (1039, 119, 'xiaoming', '5df7eb7e9ae95e45f54790ced252d293', 1516753432, '', '202.109.248.171');
INSERT INTO `pms_user_token` VALUES (1040, 119, 'xiaoming', '726cf0f3a8980a6678837b4be81fcdba', 1516756926, '', '221.14.170.229');
INSERT INTO `pms_user_token` VALUES (1041, 119, 'xiaoming', 'fffb13c5bb830e4fe98ad9c610858f51', 1516756984, '', '221.14.170.229');
INSERT INTO `pms_user_token` VALUES (1042, 119, 'xiaoming', 'd5a5f3112dc2de51f13e19224d7bf659', 1516757176, '', '1.85.221.174');
INSERT INTO `pms_user_token` VALUES (1043, 119, 'xiaoming', 'd832c422de7be90aadf8463ed373a2f7', 1516760280, '', '180.167.68.158');
INSERT INTO `pms_user_token` VALUES (1044, 119, 'xiaoming', '1df8d5820c9cae3082caa06bac5b0d52', 1516763402, '', '58.248.178.212');
INSERT INTO `pms_user_token` VALUES (1045, 119, 'xiaoming', 'd504d415c0469c5496cbd128dc382b9d', 1516763456, '', '58.248.178.212');
INSERT INTO `pms_user_token` VALUES (1046, 119, 'xiaoming', '926fa05918c40940bc36d5c90e694f23', 1516763457, '', '58.248.178.212');
INSERT INTO `pms_user_token` VALUES (1047, 119, 'xiaoming', '89f586e69d03a450ce829380042da57d', 1516763462, '', '58.248.178.212');
INSERT INTO `pms_user_token` VALUES (1048, 119, 'xiaoming', '966af9bcc33998d4da246cbf892b5db3', 1516763481, '', '58.248.178.212');
INSERT INTO `pms_user_token` VALUES (1049, 119, 'xiaoming', 'd69440e6460c7031dfb477613e3daaeb', 1516763938, '', '14.205.89.225');
INSERT INTO `pms_user_token` VALUES (1050, 119, 'xiaoming', '28ef706149d9a7f634600b15c83ea20c', 1516765484, '', '120.236.178.156');
INSERT INTO `pms_user_token` VALUES (1051, 119, 'xiaoming', '1093681f608b03607f877af617949007', 1516771847, '', '125.110.238.72');
INSERT INTO `pms_user_token` VALUES (1052, 119, 'xiaoming', 'd771ccaa40f2db52eb1036fdbe074c2b', 1516773172, '', '223.104.1.109');
INSERT INTO `pms_user_token` VALUES (1053, 119, 'xiaoming', '816453f1c65131b73ed6fdde9e3c4271', 1516773550, '', '218.2.97.91');
INSERT INTO `pms_user_token` VALUES (1054, 119, 'xiaoming', '664bcd3f1c69d204130dd63f1b3ad291', 1516774379, '', '113.200.156.101');
INSERT INTO `pms_user_token` VALUES (1055, 119, 'xiaoming', 'a712c0068d91300de3f36840f7f27e1f', 1516774380, '', '113.200.156.101');
INSERT INTO `pms_user_token` VALUES (1056, 119, 'xiaoming', '4930319120524d2a258138459d93d071', 1516776246, '', '61.190.89.62');
INSERT INTO `pms_user_token` VALUES (1057, 119, 'xiaoming', 'f2dcdc668dd36eab9fc9a6235ab850cf', 1516776247, '', '61.190.89.62');
INSERT INTO `pms_user_token` VALUES (1058, 119, 'xiaoming', 'a5e4390d85ec36a20a916c2de882c5d5', 1516776611, '', '42.249.37.5');
INSERT INTO `pms_user_token` VALUES (1059, 119, 'xiaoming', 'd4f60ff508f9485d292257852909f952', 1516776612, '', '42.249.37.5');
INSERT INTO `pms_user_token` VALUES (1060, 119, 'xiaoming', '36dfc7f2aa4f448d9077fe9c5becd161', 1516776687, '', '42.249.37.5');
INSERT INTO `pms_user_token` VALUES (1061, 119, 'xiaoming', '84c5d3c616235a73ef9d291fee1b9fd8', 1516776809, '', '42.249.37.5');
INSERT INTO `pms_user_token` VALUES (1062, 119, 'xiaoming', 'dd00c6d154a84a543911bdc945305dea', 1516776969, '', '42.249.37.5');
INSERT INTO `pms_user_token` VALUES (1063, 119, 'xiaoming', '49d6ab6c9c3448e2e4b90935021bdad3', 1516779066, '', '120.40.3.140');
INSERT INTO `pms_user_token` VALUES (1064, 119, 'xiaoming', '9a56adac88f77c8bebb251d98d9a7206', 1516779071, '', '120.40.3.140');
INSERT INTO `pms_user_token` VALUES (1065, 119, 'xiaoming', '300206d9dc5000d126c6233462a09a35', 1516779747, '', '221.226.125.130');
INSERT INTO `pms_user_token` VALUES (1066, 119, 'xiaoming', '5ff4c48c881b1afda2be9fb499f6916a', 1516783638, '', '118.122.250.93');
INSERT INTO `pms_user_token` VALUES (1067, 119, 'xiaoming', '660a63bc5cd70a325eea0593c7275630', 1516784186, '', '116.19.112.63');
INSERT INTO `pms_user_token` VALUES (1068, 119, 'xiaoming', 'ae9f4a2b9b40ed4a65da440399380c26', 1516784191, '', '116.19.112.63');
INSERT INTO `pms_user_token` VALUES (1069, 119, 'xiaoming', '870d17d34a29c2ec89a5bcba5515b52c', 1516784193, '', '116.19.112.63');
INSERT INTO `pms_user_token` VALUES (1070, 119, 'xiaoming', '7f092ea776ddcdbc18d74af663684453', 1516784194, '', '116.19.112.63');
INSERT INTO `pms_user_token` VALUES (1071, 119, 'xiaoming', '6d7192de786bfdd8553a6ed2799e2112', 1516784194, '', '116.19.112.63');
INSERT INTO `pms_user_token` VALUES (1072, 119, 'xiaoming', '8be3a7d79e51247cef821172cf528ad0', 1516784194, '', '116.19.112.63');
INSERT INTO `pms_user_token` VALUES (1073, 119, 'xiaoming', '9324abc1edd1d432c96ccc8266cff843', 1516784195, '', '116.19.112.63');
INSERT INTO `pms_user_token` VALUES (1074, 119, 'xiaoming', '3b8d084db5fef4c7d62078d7297675b1', 1516784195, '', '116.19.112.63');
INSERT INTO `pms_user_token` VALUES (1075, 119, 'xiaoming', '0244fda71ca6155154ef7aee8beee95f', 1516784195, '', '116.19.112.63');
INSERT INTO `pms_user_token` VALUES (1076, 119, 'xiaoming', '7d303195869346255beb7f16bb5d0156', 1516784196, '', '116.19.112.63');
INSERT INTO `pms_user_token` VALUES (1077, 119, 'xiaoming', '2e7a54fdc560f64655ba620ffff2621d', 1516784196, '', '116.19.112.63');
INSERT INTO `pms_user_token` VALUES (1078, 119, 'xiaoming', 'aa10d4c667733e6b72f079eea2e024e6', 1516784196, '', '116.19.112.63');
INSERT INTO `pms_user_token` VALUES (1079, 119, 'xiaoming', '69b22b82c4ea01fce3dcd09de7754767', 1516784196, '', '116.19.112.63');
INSERT INTO `pms_user_token` VALUES (1080, 119, 'xiaoming', '174fdfb62274c13512a635f880d3fd20', 1516784197, '', '116.19.112.63');
INSERT INTO `pms_user_token` VALUES (1081, 119, 'xiaoming', '3a60501f6acf6ae93e247e1c722b3a84', 1516784203, '', '116.19.112.63');
INSERT INTO `pms_user_token` VALUES (1082, 119, 'xiaoming', 'da4493cdaeafbfc519c459c19a38c7a4', 1516784204, '', '116.19.112.63');
INSERT INTO `pms_user_token` VALUES (1083, 119, 'xiaoming', 'eeef8e383ebe305ce13de7cae76a6f73', 1516784204, '', '116.19.112.63');
INSERT INTO `pms_user_token` VALUES (1084, 119, 'xiaoming', '6f766b4397fbcac613d3df38b924cd37', 1516784204, '', '116.19.112.63');
INSERT INTO `pms_user_token` VALUES (1085, 119, 'xiaoming', 'f9d877cef39295050e21dfe797c90f70', 1516784204, '', '116.19.112.63');
INSERT INTO `pms_user_token` VALUES (1086, 119, 'xiaoming', '1d06d1e3da26ccc021beca7e50744a89', 1516784205, '', '116.19.112.63');
INSERT INTO `pms_user_token` VALUES (1087, 119, 'xiaoming', '55e600daa8a1c35bf290e4922dcb56f1', 1516785496, '', '183.14.132.205');
INSERT INTO `pms_user_token` VALUES (1088, 119, 'xiaoming', '9a83fdcd3b63e39601c4b8e9e75944f5', 1516785497, '', '101.231.51.241');
INSERT INTO `pms_user_token` VALUES (1089, 119, 'xiaoming', 'c8db74b6dc3fd6b55453bd9b8cba49e2', 1516785501, '', '101.231.51.241');
INSERT INTO `pms_user_token` VALUES (1090, 119, 'xiaoming', '083e2d0b4873def64c669ca3b409c644', 1516785510, '', '110.209.251.75');
INSERT INTO `pms_user_token` VALUES (1091, 119, 'xiaoming', 'd19ecbb73d182a106e758f878aa0fb2b', 1516785525, '', '58.251.217.102');
INSERT INTO `pms_user_token` VALUES (1092, 119, 'xiaoming', '078543e8558f925cf8a26104b611773b', 1516785541, '', '111.193.228.204');
INSERT INTO `pms_user_token` VALUES (1093, 119, 'xiaoming', '7b74a260ae648593ee89fed048167943', 1516785543, '', '111.193.228.204');
INSERT INTO `pms_user_token` VALUES (1094, 119, 'xiaoming', 'b21df08b81e63b9859fbb4b029b8510a', 1516785544, '', '111.193.228.204');
INSERT INTO `pms_user_token` VALUES (1095, 119, 'xiaoming', 'cb24213ad4ec43cfd2fd5e14ae158769', 1516785545, '', '111.193.228.204');
INSERT INTO `pms_user_token` VALUES (1096, 119, 'xiaoming', '3936a77d3741ee5f11fd58e047c169cc', 1516785546, '', '111.193.228.204');
INSERT INTO `pms_user_token` VALUES (1097, 119, 'xiaoming', '69aa6010d1a4a1ca16f4b62c88265650', 1516785556, '', '118.112.75.246');
INSERT INTO `pms_user_token` VALUES (1098, 119, 'xiaoming', 'b0093204084a05f0c782b7fa2610fd15', 1516785568, '', '118.112.75.246');
INSERT INTO `pms_user_token` VALUES (1099, 119, 'xiaoming', 'ece89ab2ffe46f9a3b70164feead8811', 1516785569, '', '118.112.75.246');
INSERT INTO `pms_user_token` VALUES (1100, 119, 'xiaoming', '2140cdd3e4ae3e3f2e274119208c6960', 1516785570, '', '118.112.75.246');
INSERT INTO `pms_user_token` VALUES (1101, 119, 'xiaoming', 'a48dc32cd7eb2b6dedbbe9cd2f910c2c', 1516785581, '', '113.89.57.172');
INSERT INTO `pms_user_token` VALUES (1102, 119, 'xiaoming', 'b322de0146fd034d23a491193f5be22e', 1516785583, '', '118.112.75.246');
INSERT INTO `pms_user_token` VALUES (1103, 119, 'xiaoming', '4bf9453cd8d61e04b16b6fab4546f5ef', 1516785600, '', '124.74.132.230');
INSERT INTO `pms_user_token` VALUES (1104, 119, 'xiaoming', '53cf3b1438050be021b4e3f4bbcc3fde', 1516785609, '', '124.74.132.230');
INSERT INTO `pms_user_token` VALUES (1105, 119, 'xiaoming', '766b801bee271634b6e0cad0a0f37fc1', 1516785612, '', '124.74.132.230');
INSERT INTO `pms_user_token` VALUES (1106, 119, 'xiaoming', '349ad78dc2eb3b3801b50f37c279a244', 1516785612, '', '124.74.132.230');
INSERT INTO `pms_user_token` VALUES (1107, 119, 'xiaoming', '3f03df40e3f699ea59fd48dd95444a52', 1516785612, '', '124.74.132.230');
INSERT INTO `pms_user_token` VALUES (1108, 119, 'xiaoming', '515c686cce138eb21f997c95d47d40eb', 1516785613, '', '124.74.132.230');
INSERT INTO `pms_user_token` VALUES (1109, 119, 'xiaoming', 'f2ad0953e929fb50f91b8680e9b95f73', 1516785620, '', '112.94.163.231');
INSERT INTO `pms_user_token` VALUES (1110, 119, 'xiaoming', 'fe73ab338b2333cb80b0302dde346dd3', 1516785621, '', '112.94.163.231');
INSERT INTO `pms_user_token` VALUES (1111, 119, 'xiaoming', '4fb9efb2970a5f0bda0c441e90fd2225', 1516785622, '', '112.94.163.231');
INSERT INTO `pms_user_token` VALUES (1112, 119, 'xiaoming', '1c72208d6a745e856ff7d047f81f5a12', 1516785622, '', '112.94.163.231');
INSERT INTO `pms_user_token` VALUES (1113, 119, 'xiaoming', 'e69ef3abace40869c4b324fcfdc7e2e8', 1516785623, '', '112.94.163.231');
INSERT INTO `pms_user_token` VALUES (1114, 119, 'xiaoming', '7f20ae020cd6e996c479d3b3002090f3', 1516785626, '', '14.23.152.199');
INSERT INTO `pms_user_token` VALUES (1115, 119, 'xiaoming', '4e28f0bfdd7567f211c8556d2bda209e', 1516785631, '', '112.94.163.231');
INSERT INTO `pms_user_token` VALUES (1116, 119, 'xiaoming', '294755024f16bb4b0384be8159f1a516', 1516785632, '', '112.94.163.231');
INSERT INTO `pms_user_token` VALUES (1117, 119, 'xiaoming', '4f2ac29c6f1516cd6da91aaeb827a358', 1516785632, '', '112.94.163.231');
INSERT INTO `pms_user_token` VALUES (1118, 119, 'xiaoming', 'd1e336c465eed559397d4b92154a6f53', 1516785633, '', '112.94.163.231');
INSERT INTO `pms_user_token` VALUES (1119, 119, 'xiaoming', '17fc8ef0ba948406ed691d4a546aa502', 1516785633, '', '112.94.163.231');
INSERT INTO `pms_user_token` VALUES (1120, 119, 'xiaoming', 'ba12cb77014467cd9adf3c852473c416', 1516785633, '', '112.94.163.231');
INSERT INTO `pms_user_token` VALUES (1121, 119, 'xiaoming', 'c1f95fb6feca7bf58764fcf8afc6ecbb', 1516785634, '', '112.94.163.231');
INSERT INTO `pms_user_token` VALUES (1122, 119, 'xiaoming', 'bf0d66428dec32eee6689c755881585f', 1516785634, '', '112.94.163.231');
INSERT INTO `pms_user_token` VALUES (1123, 119, 'xiaoming', 'c5d07c6bc16b4d3ac1eed3ef8884d257', 1516785635, '', '112.94.163.231');
INSERT INTO `pms_user_token` VALUES (1124, 119, 'xiaoming', '5188e1e1517c3db7b76a823d852f98c3', 1516785645, '', '36.60.27.76');
INSERT INTO `pms_user_token` VALUES (1125, 119, 'xiaoming', 'a6bbc186ff7032f0af5b3532dd8a0386', 1516785657, '', '101.90.127.91');
INSERT INTO `pms_user_token` VALUES (1126, 119, 'xiaoming', '2acea7ab9e371c226ad901437b2f4ef5', 1516785666, '', '61.140.237.174');
INSERT INTO `pms_user_token` VALUES (1127, 119, 'xiaoming', '80bf1233dee81212cbe5badbeba0c59b', 1516785683, '', '106.41.63.27');
INSERT INTO `pms_user_token` VALUES (1128, 119, 'xiaoming', 'd83f79dccdcd8848d2988778708d40ff', 1516785687, '', '202.111.6.69');
INSERT INTO `pms_user_token` VALUES (1129, 119, 'xiaoming', 'a4e12427f258fc45da1e679a2c8bec0b', 1516785737, '', '58.214.9.50');
INSERT INTO `pms_user_token` VALUES (1130, 119, 'xiaoming', 'f578adf7f21b987502950d7733f548e0', 1516785764, '', '36.110.59.42');
INSERT INTO `pms_user_token` VALUES (1131, 119, 'xiaoming', '7c59fa4dffa9755a2bf2f93b22ecd0db', 1516785765, '', '112.244.154.110');
INSERT INTO `pms_user_token` VALUES (1132, 119, 'xiaoming', 'd92f4c8638bfc767b4c1631e3867ea95', 1516785766, '', '61.132.50.162');
INSERT INTO `pms_user_token` VALUES (1133, 119, 'xiaoming', 'c5b362febb5f409090021b54808c3775', 1516785768, '', '61.132.50.162');
INSERT INTO `pms_user_token` VALUES (1134, 119, 'xiaoming', '27273519e66b449834689762710ce1ba', 1516785769, '', '112.244.154.110');
INSERT INTO `pms_user_token` VALUES (1135, 119, 'xiaoming', '60c32a3ffa69343b1344b7c95baadfcd', 1516785778, '', '61.132.50.162');
INSERT INTO `pms_user_token` VALUES (1136, 119, 'xiaoming', '4aef2c0008651334877d77fd6dc06b62', 1516785779, '', '61.132.50.162');
INSERT INTO `pms_user_token` VALUES (1137, 119, 'xiaoming', 'be93552ec389c604ef515bdb701714ac', 1516785808, '', '220.160.57.198');
INSERT INTO `pms_user_token` VALUES (1138, 119, 'xiaoming', 'c3c5b6b2b44f0ad7ef45da0278f930c0', 1516785819, '', '14.146.95.247');
INSERT INTO `pms_user_token` VALUES (1139, 119, 'xiaoming', 'bcf1b2b3d216aa320bb2822f0e6fb993', 1516785823, '', '220.181.102.176');
INSERT INTO `pms_user_token` VALUES (1140, 119, 'xiaoming', 'c9728fb6ccfcbdaed8b70c70856321bc', 1516785884, '', '222.173.10.98');
INSERT INTO `pms_user_token` VALUES (1141, 119, 'xiaoming', '9f052c89f82921460bb3b73f948edbb5', 1516785888, '', '115.199.179.41');
INSERT INTO `pms_user_token` VALUES (1142, 119, 'xiaoming', '025bfc4d68cb3e64cd6892a8e62825b4', 1516785888, '', '210.21.36.149');
INSERT INTO `pms_user_token` VALUES (1143, 119, 'xiaoming', 'fb58bc39aa4d7a06842811eba92620c1', 1516785892, '', '115.199.179.41');
INSERT INTO `pms_user_token` VALUES (1144, 119, 'xiaoming', 'f1e939dff4f8ce34d405cca2a4d1422c', 1516785901, '', '210.21.36.149');
INSERT INTO `pms_user_token` VALUES (1145, 119, 'xiaoming', 'd8a29ce1a331a7be82228b551252d422', 1516785908, '', '115.199.179.41');
INSERT INTO `pms_user_token` VALUES (1146, 119, 'xiaoming', 'bd067160e115db107f5320727179a25d', 1516785940, '', '36.110.59.42');
INSERT INTO `pms_user_token` VALUES (1147, 119, 'xiaoming', '1adcf7270e5124813c68290c1c27ccea', 1516785943, '', '58.247.46.122');
INSERT INTO `pms_user_token` VALUES (1148, 119, 'xiaoming', '0690327aac8eca1a0f8fea2ed7498599', 1516785944, '', '1.192.177.23');
INSERT INTO `pms_user_token` VALUES (1149, 119, 'xiaoming', 'ecbef64477a75e3f4da5eb91633e1f4e', 1516785946, '', '36.110.59.42');
INSERT INTO `pms_user_token` VALUES (1150, 119, 'xiaoming', '1db12eb2a1bda10565f062288b7e68c0', 1516785948, '', '36.110.59.42');
INSERT INTO `pms_user_token` VALUES (1151, 119, 'xiaoming', 'beb3ea12204d32b2b3c6ba532f9c689a', 1516785948, '', '36.110.59.42');
INSERT INTO `pms_user_token` VALUES (1152, 119, 'xiaoming', '12de3ba5067218219654337d06b1f1a1', 1516785949, '', '36.110.59.42');
INSERT INTO `pms_user_token` VALUES (1153, 119, 'xiaoming', '629349405cbd6566728e11042b29891e', 1516785949, '', '36.110.59.42');
INSERT INTO `pms_user_token` VALUES (1154, 119, 'xiaoming', '152bd2ce9a97d75aa22b314c4812f24a', 1516785964, '', '113.91.19.164');
INSERT INTO `pms_user_token` VALUES (1155, 119, 'xiaoming', 'c84834530c27ffa724ce87b421523296', 1516785967, '', '113.91.19.164');
INSERT INTO `pms_user_token` VALUES (1156, 119, 'xiaoming', '4dfcaf67372386249441517abd2af4cd', 1516785968, '', '113.91.19.164');
INSERT INTO `pms_user_token` VALUES (1157, 119, 'xiaoming', 'f877c97071a6dd66b5d6e13a1c045e7e', 1516841506, '', '116.18.228.69');
INSERT INTO `pms_user_token` VALUES (1158, 26, 'lws', '2b8867a1669dc36a7253b4df3a965a31', 1516841519, '', '116.18.228.69');
INSERT INTO `pms_user_token` VALUES (1159, 119, 'xiaoming', 'ee5fdc2b78da90c0540d04b8d5119d54', 1516842033, '', '116.18.228.69');
INSERT INTO `pms_user_token` VALUES (1160, 119, 'xiaoming', 'af2941521576985463a076b0351cbf1e', 1516842745, '', '58.248.178.212');
INSERT INTO `pms_user_token` VALUES (1161, 119, 'xiaoming', '3f3a94b8ad5b36bb56f1b926453eacc5', 1516843307, '', '210.21.83.229');
INSERT INTO `pms_user_token` VALUES (1162, 119, 'xiaoming', '7584f9e7ea42017dabbead225785869f', 1516843313, '', '210.21.83.229');
INSERT INTO `pms_user_token` VALUES (1163, 119, 'xiaoming', 'b59cc4fc6b403a7f7039a76168a1fcaf', 1516843489, '', '111.196.101.114');
INSERT INTO `pms_user_token` VALUES (1164, 119, 'xiaoming', 'c3deb2df4bf034df4030503907cb99ad', 1516844047, '', '113.140.249.102');
INSERT INTO `pms_user_token` VALUES (1165, 119, 'xiaoming', '9366e515adb8d29614b3163840b743ec', 1516844094, '', '113.140.249.102');
INSERT INTO `pms_user_token` VALUES (1166, 119, 'xiaoming', 'bc1906ca65fb0416ece672ff15b6e2e2', 1516844312, '', '203.166.220.176');
INSERT INTO `pms_user_token` VALUES (1167, 119, 'xiaoming', 'da9e485cbe8f99be2e4ec992e070cf00', 1516844597, '', '125.82.187.98');
INSERT INTO `pms_user_token` VALUES (1168, 119, 'xiaoming', '7c8d932a84806d7b651c52eb16d44110', 1516844660, '', '103.218.216.130');
INSERT INTO `pms_user_token` VALUES (1169, 119, 'xiaoming', '966abe64360134b34c09d68b24ce69c4', 1516844664, '', '103.218.216.130');
INSERT INTO `pms_user_token` VALUES (1170, 119, 'xiaoming', 'e96bb793d2d7d5da69b8d51f6879d40b', 1516845254, '', '114.220.192.193');
INSERT INTO `pms_user_token` VALUES (1171, 119, 'xiaoming', '31804e4ed26e011fa2009f34b11f7a34', 1516845258, '', '114.220.192.193');
INSERT INTO `pms_user_token` VALUES (1172, 119, 'xiaoming', 'baf98ccf46b927b642059488fb0395a3', 1516845259, '', '114.220.192.193');
INSERT INTO `pms_user_token` VALUES (1173, 119, 'xiaoming', '44beb5ff210481d2e4bd986efbc47ce5', 1516845260, '', '114.220.192.193');
INSERT INTO `pms_user_token` VALUES (1174, 119, 'xiaoming', 'f3f2fbfb0dc135a2b8b1a712184d2594', 1516845260, '', '114.220.192.193');
INSERT INTO `pms_user_token` VALUES (1175, 119, 'xiaoming', 'cd1d4ed4d82b9b2363606c66e8da07f8', 1516845260, '', '114.220.192.193');
INSERT INTO `pms_user_token` VALUES (1176, 119, 'xiaoming', 'b20dbcc26356cc0c4b8a58c932b0cb70', 1516845260, '', '114.220.192.193');
INSERT INTO `pms_user_token` VALUES (1177, 119, 'xiaoming', '14a93f035f73b28a13299316046957be', 1516845260, '', '114.220.192.193');
INSERT INTO `pms_user_token` VALUES (1178, 119, 'xiaoming', '84ecf8fec37646b0bcb45cc045ef97da', 1516845261, '', '114.220.192.193');
INSERT INTO `pms_user_token` VALUES (1179, 119, 'xiaoming', '59e8cab76523ba59e46a40783069ae89', 1516845262, '', '114.220.192.193');
INSERT INTO `pms_user_token` VALUES (1180, 119, 'xiaoming', '439fa3341b65a3491c9ee060501e11b5', 1516845262, '', '114.220.192.193');
INSERT INTO `pms_user_token` VALUES (1181, 119, 'xiaoming', 'f215de261cfc1395f9ddb2b044675e93', 1516845262, '', '114.220.192.193');
INSERT INTO `pms_user_token` VALUES (1182, 119, 'xiaoming', 'ba06255aceb7efd27cb7e3455c74a020', 1516845262, '', '114.220.192.193');
INSERT INTO `pms_user_token` VALUES (1183, 119, 'xiaoming', '89ffa3d29f62bb177ab0f92cb406265c', 1516845600, '', '122.224.233.146');
INSERT INTO `pms_user_token` VALUES (1184, 119, 'xiaoming', '299086329b05ed48482d0ea230960b6b', 1516846246, '', '14.118.234.52');
INSERT INTO `pms_user_token` VALUES (1185, 26, 'lws', 'c7f7e7d1a2b5a6970da5260312e8dfe1', 1516846654, '', '116.18.228.69');
INSERT INTO `pms_user_token` VALUES (1186, 26, 'lws', 'b47abff5214ab3ba67bdc44b1cf9dc60', 1516846659, '', '116.18.228.69');
INSERT INTO `pms_user_token` VALUES (1187, 119, 'xiaoming', '0d14ad87995d5f9950fd7305ce2920f7', 1516846783, '', '61.154.159.193');
INSERT INTO `pms_user_token` VALUES (1188, 26, 'lws', 'b08c400150c7ad31c92e49da13901e51', 1516846831, '', '116.18.228.69');
INSERT INTO `pms_user_token` VALUES (1189, 119, 'xiaoming', '3a9ce49c92c2738043fb22b2ad24c116', 1516847691, '', '116.18.228.69');
INSERT INTO `pms_user_token` VALUES (1190, 120, 'xiaowang', 'db1fd994926931eb5d27cb7ec0185500', 1516847715, '', '116.18.228.69');
INSERT INTO `pms_user_token` VALUES (1191, 26, 'lws', 'd0ec455f0acc15978db0384847fa810b', 1516847756, '', '116.18.228.69');
INSERT INTO `pms_user_token` VALUES (1192, 119, 'xiaoming', 'f687187988aad9001b5d8bd7879cb012', 1519520178, '', '116.18.228.32');
INSERT INTO `pms_user_token` VALUES (1193, 119, 'xiaoming', '4f3a02d5af435646c6bd253362d18d4b', 1519537271, '', '111.20.150.250');
INSERT INTO `pms_user_token` VALUES (1194, 119, 'xiaoming', 'c04e31bbe7d8228a8fc9644a8e23fbb9', 1519537813, '', '111.20.150.250');
INSERT INTO `pms_user_token` VALUES (1195, 119, 'xiaoming', '80dd4a2c7a313174275c8a70d825fc5e', 1519540539, '', '116.30.30.216');
INSERT INTO `pms_user_token` VALUES (1196, 119, 'xiaoming', 'cf70bc0af558cb8c8bcf0a441d650cb8', 1519540606, '', '116.30.30.216');
INSERT INTO `pms_user_token` VALUES (1197, 119, 'xiaoming', 'd1858121748d7f3dde02e5c687a0aadb', 1519543669, '', '115.60.163.42');
INSERT INTO `pms_user_token` VALUES (1198, 119, 'xiaoming', '12455724d64fbb980416bfbe942e8f17', 1519545029, '', '113.64.200.43');
INSERT INTO `pms_user_token` VALUES (1199, 119, 'xiaoming', 'd0fbe83b68a6a17246a942703937c795', 1519546994, '', '183.192.85.216');
INSERT INTO `pms_user_token` VALUES (1200, 119, 'xiaoming', 'e7d9ccb2c5cbf165f74d89b695586c3c', 1519548886, '', '125.110.74.143');
INSERT INTO `pms_user_token` VALUES (1201, 119, 'xiaoming', 'c9dcc41ccca5f3856acf5f90a8c0edb0', 1519550069, '', '121.69.44.6');
INSERT INTO `pms_user_token` VALUES (1202, 119, 'xiaoming', '2525c916eeecef8f6c4dd27094a818ff', 1519550691, '', '36.7.79.167');
INSERT INTO `pms_user_token` VALUES (1203, 119, 'xiaoming', '109d93ff5716f53af7ce4886c1880ebe', 1519561186, '', '180.136.202.129');
INSERT INTO `pms_user_token` VALUES (1204, 119, 'xiaoming', 'faabc83a5e5b81b2c5fb3a49baac15af', 1519563911, '', '183.14.135.140');
INSERT INTO `pms_user_token` VALUES (1205, 119, 'xiaoming', 'b6a85e565c264d319bd6c22354288e3d', 1519606138, '', '115.236.73.105');
INSERT INTO `pms_user_token` VALUES (1206, 119, 'xiaoming', 'b76082c9f8ba59b6a08845738ea1ac06', 1519607591, '', '27.154.111.39');
INSERT INTO `pms_user_token` VALUES (1207, 119, 'xiaoming', 'dd5ff026013410728c5fd656b7b1a90d', 1519607804, '', '202.60.227.65');
INSERT INTO `pms_user_token` VALUES (1208, 119, 'xiaoming', 'c28dfb8bc9faf223e27e86bd755557f7', 1519607806, '', '202.60.227.65');
INSERT INTO `pms_user_token` VALUES (1209, 119, 'xiaoming', '7e5c6538b27882f8ce262a8b2b26f3ea', 1519607810, '', '202.60.227.65');
INSERT INTO `pms_user_token` VALUES (1210, 119, 'xiaoming', 'b04576d5f92ec96a9fb97934c831143d', 1519608096, '', '222.90.121.208');
INSERT INTO `pms_user_token` VALUES (1211, 119, 'xiaoming', '095fbc55f4ca0417ad879d7579267dba', 1519608342, '', '124.72.23.73');
INSERT INTO `pms_user_token` VALUES (1212, 119, 'xiaoming', '6194d5d9db0136c997d36e54416d59b6', 1519608500, '', '202.60.227.65');
INSERT INTO `pms_user_token` VALUES (1213, 119, 'xiaoming', 'fd1a6074aaf0909fb0fd24ecc6d937c7', 1519608615, '', '106.46.10.160');
INSERT INTO `pms_user_token` VALUES (1214, 119, 'xiaoming', 'a8dde6acbc874e1a435f4e77745372d7', 1519608803, '', '211.152.39.44');
INSERT INTO `pms_user_token` VALUES (1215, 119, 'xiaoming', 'a1265c70324f0832ff2e9893ad16671b', 1519609059, '', '180.167.84.250');
INSERT INTO `pms_user_token` VALUES (1216, 119, 'xiaoming', '7679e62699803eb91122a3e2e73f0371', 1519610041, '', '180.105.40.155');
INSERT INTO `pms_user_token` VALUES (1217, 119, 'xiaoming', '6e9546f4b4391e1ce587361da6b48a0d', 1519610481, '', '121.33.61.160');
INSERT INTO `pms_user_token` VALUES (1218, 119, 'xiaoming', '4316c397eed29f7091f279c9f4e7dd20', 1519612059, '', '182.150.57.62');
INSERT INTO `pms_user_token` VALUES (1219, 119, 'xiaoming', '39a042db8c79a6f8f22492fe6c4d8907', 1519612297, '', '113.140.250.24');
INSERT INTO `pms_user_token` VALUES (1220, 119, 'xiaoming', 'a9dfe356ca5336a0030d9144f46df687', 1519612548, '', '111.50.75.182');
INSERT INTO `pms_user_token` VALUES (1221, 119, 'xiaoming', '0e95c803037c6418259572d899902f4a', 1519612804, '', '116.226.114.201');
INSERT INTO `pms_user_token` VALUES (1222, 119, 'xiaoming', '3d73968b246d6b1ab437d0a34c5aa6f9', 1519612818, '', '60.212.43.136');
INSERT INTO `pms_user_token` VALUES (1223, 119, 'xiaoming', '34ecd50db8474fcdf4bbb60c9efab1bf', 1519612854, '', '116.18.228.32');
INSERT INTO `pms_user_token` VALUES (1224, 119, 'xiaoming', 'a452b6dec608625b70d19981154eb98a', 1519612973, '', '210.22.143.82');
INSERT INTO `pms_user_token` VALUES (1225, 119, 'xiaoming', '61972617d5f5c4794394bb5594cae7b9', 1519613466, '', '210.22.143.82');
INSERT INTO `pms_user_token` VALUES (1226, 119, 'xiaoming', '763e4ec0c87f6b014c14aab381e6b7ac', 1519613678, '', '125.69.28.36');
INSERT INTO `pms_user_token` VALUES (1227, 119, 'xiaoming', 'd420de046d5e92bc0bf99fc690e8fcff', 1519613834, '', '124.114.98.79');
INSERT INTO `pms_user_token` VALUES (1228, 119, 'xiaoming', '7a921bcc53a4df41ce539ee239fd9318', 1519613933, '', '112.224.17.34');
INSERT INTO `pms_user_token` VALUES (1229, 119, 'xiaoming', '6eb62b78c580f44c6b5f037a37b79ca8', 1519614025, '', '36.106.250.204');
INSERT INTO `pms_user_token` VALUES (1230, 119, 'xiaoming', '55dd74107012ed3e5737e2e625650125', 1519614498, '', '110.53.191.19');
INSERT INTO `pms_user_token` VALUES (1231, 119, 'xiaoming', '225695e0453bb7aa5821678c2441abc5', 1519614741, '', '218.15.218.228');
INSERT INTO `pms_user_token` VALUES (1232, 26, 'lws', '01114ca2a1c8901a1cb6277114f045e6', 1519614764, '', '116.18.228.32');
INSERT INTO `pms_user_token` VALUES (1233, 119, 'xiaoming', 'bfc2591a42e6e7b2ebf89ce036e97a99', 1519614765, '', '118.114.117.88');
INSERT INTO `pms_user_token` VALUES (1234, 119, 'xiaoming', 'e224e535474bfc269a3d98d9a621d1d8', 1519615152, '', '116.18.228.32');
INSERT INTO `pms_user_token` VALUES (1235, 26, 'lws', '9bc53d556ca921effcebb705cee7e0b5', 1519615276, '', '116.18.228.32');
INSERT INTO `pms_user_token` VALUES (1236, 26, 'lws', 'a974e510e143213d7e16cf96d4406cce', 1519634808, '', '116.18.228.32');
INSERT INTO `pms_user_token` VALUES (1237, 26, 'lws', '6a66495d6965f7d5e0dd7a548889be6e', 1519635703, '', '116.18.228.32');
INSERT INTO `pms_user_token` VALUES (1238, 119, 'xiaoming', '568732e311321fcb620df45fcff979c9', 1519635765, '', '116.18.228.32');
INSERT INTO `pms_user_token` VALUES (1239, 26, 'lws', 'd0f08f5f8eab8e61757bb8bf38025ab0', 1523346146, '', '127.0.0.1');
INSERT INTO `pms_user_token` VALUES (1240, 26, 'lws', '006dd821fe41a7efb974723ae7ff9eae', 1523436522, '', '127.0.0.1');
INSERT INTO `pms_user_token` VALUES (1241, 26, 'lws', '1dde36b6ae9c062524973bcc28e0a34a', 1523438706, '', '127.0.0.1');
INSERT INTO `pms_user_token` VALUES (1242, 26, 'lws', '29ba9b24125d5b292d8dbe9a2d486516', 1523691721, '', '127.0.0.1');
INSERT INTO `pms_user_token` VALUES (1243, 26, 'lws', '35db0ba9d939cb84ca2989f9e895a762', 1523838728, '', '127.0.0.1');
INSERT INTO `pms_user_token` VALUES (1244, 26, 'lws', '5db1f127a334e7f883c223c16ea10a8b', 1524124390, '', '127.0.0.1');
INSERT INTO `pms_user_token` VALUES (1245, 26, 'lws', '2227db6fb6cf8722717564b2dcc32661', 1524233086, '', '127.0.0.1');
INSERT INTO `pms_user_token` VALUES (1246, 26, 'lws', '2932e569974f4c03b2da286760457c9e', 1524359729, '', '127.0.0.1');
INSERT INTO `pms_user_token` VALUES (1247, 26, 'admin', '24a5ae47cfc4bf6d95df9640e8e4ba30', 1524363608, '', '127.0.0.1');
INSERT INTO `pms_user_token` VALUES (1248, 26, 'admin', 'c6049030441546a518e6320d128489e2', 1524374810, '', '127.0.0.1');
INSERT INTO `pms_user_token` VALUES (1249, 26, 'admin', '44f045590b328206f410a4ddd1a335f4', 1524985232, '', '127.0.0.1');
INSERT INTO `pms_user_token` VALUES (1250, 26, 'admin', '2897b0284a8d48aac2d9b9ca9f4dc5af', 1525084263, '', '127.0.0.1');
INSERT INTO `pms_user_token` VALUES (1251, 26, 'admin', '15520362a1349a3fe9d1ee0b115b3cc8', 1525097087, '', '127.0.0.1');
INSERT INTO `pms_user_token` VALUES (1252, 26, 'admin', 'd64003a229ae0457da7cbbed839fddcd', 1525097302, '', '127.0.0.1');
INSERT INTO `pms_user_token` VALUES (1253, 26, 'admin', 'e949364167fa5bb0464f3a94b5d71716', 1525134756, '', '127.0.0.1');
INSERT INTO `pms_user_token` VALUES (1254, 26, 'admin', 'f3b8b696923312af2dbc8c1da348546d', 1525137324, '', '127.0.0.1');
INSERT INTO `pms_user_token` VALUES (1255, 26, 'admin', 'fea7e70d9c0ecfa5ac00925684c7631a', 1525137507, '', '127.0.0.1');
INSERT INTO `pms_user_token` VALUES (1256, 119, 'xiaoming', 'bb6b55e4aeb84292d494d7fad724c798', 1525139980, '', '127.0.0.1');
INSERT INTO `pms_user_token` VALUES (1257, 120, 'xiaowang', '5926329eca8342d8675ced6eba9218fa', 1525140082, '', '127.0.0.1');
INSERT INTO `pms_user_token` VALUES (1258, 26, 'admin', '1dd14445cb8bc5d6fa89c174c3f39f47', 1525140998, '', '119.141.254.176');
INSERT INTO `pms_user_token` VALUES (1259, 26, 'admin', '8f7d953392d42898fcd1e22ddd03eb8d', 1525141017, '', '119.141.254.176');
INSERT INTO `pms_user_token` VALUES (1260, 26, 'admin', '7b39ce3055da8532761c9af925a7bfd1', 1525141202, '', '119.141.254.176');
INSERT INTO `pms_user_token` VALUES (1261, 26, 'admin', 'a7bd5bc71b39fd4dafb4b545b6f45198', 1531541998, NULL, '27.44.5.244');
INSERT INTO `pms_user_token` VALUES (1262, 26, 'admin', '45ab35b778f80c0cd1628bab24343068', 1531542892, NULL, '27.44.5.244');
INSERT INTO `pms_user_token` VALUES (1263, 26, 'admin', '88207a369c947b9be6a838f3a86bf0bb', 1531543558, NULL, '27.44.5.244');
INSERT INTO `pms_user_token` VALUES (1264, 26, 'admin', '899c33d7c893a3d49bee168958c6efd0', 1531543786, NULL, '27.44.5.244');
INSERT INTO `pms_user_token` VALUES (1265, 26, 'admin', 'fd143f179fbf64d60482c3d212e2340a', 1531543925, NULL, '27.44.5.244');
INSERT INTO `pms_user_token` VALUES (1266, 26, 'admin', 'af9f31be6c86b403edc8676747aada9e', 1531543929, NULL, '27.44.5.244');
INSERT INTO `pms_user_token` VALUES (1267, 26, 'admin', '9cd5cd3eb9cdabfc763ccfe2ab0b54db', 1531984191, NULL, '112.93.135.137');
INSERT INTO `pms_user_token` VALUES (1268, 26, 'admin', 'fbfcf578ce125754e898783a41d41db5', 1531984238, NULL, '36.110.119.51');
INSERT INTO `pms_user_token` VALUES (1269, 119, 'xiaoming', '5a8ff1cd1315bc6c3031c368ae661b6a', 1531984610, NULL, '112.93.135.137');
INSERT INTO `pms_user_token` VALUES (1270, 120, 'xiaowang', '9b4a8da575f8ef4d6c68daa2a5c18b59', 1531984694, NULL, '112.93.135.137');
INSERT INTO `pms_user_token` VALUES (1271, 120, 'xiaowang', '7b26185376e9ebc2ebfdf226a6f6005e', 1531984785, NULL, '112.93.135.137');

SET FOREIGN_KEY_CHECKS = 1;
