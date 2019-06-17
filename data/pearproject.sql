/*
 Navicat Premium Data Transfer

 Source Server         : 本地
 Source Server Type    : MySQL
 Source Server Version : 50642
 Source Host           : 127.0.0.1:3306
 Source Schema         : pearproject

 Target Server Type    : MySQL
 Target Server Version : 50642
 File Encoding         : 65001

 Date: 17/06/2019 17:54:03
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for pear_build
-- ----------------------------
DROP TABLE IF EXISTS `pear_build`;
CREATE TABLE `pear_build`  (
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
-- Records of pear_build
-- ----------------------------
INSERT INTO `pear_build` VALUES (73, 0, 0, 1292, '2.13.0 King of Opera', '', '', '2018-04-30', '', '', 'admin', '<ul style=\"-webkit-tap-highlight-color: transparent; padding-left: 40px; list-style-type: circle; color: rgb(73, 80, 96); font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;\\\\5FAE软雅黑&quot;, Arial, sans-serif;\"><li style=\"-webkit-tap-highlight-color: transparent; margin-bottom: 5px; font-size: 14px;\">Table 列新增属性&nbsp;<code style=\"-webkit-tap-highlight-color: transparent; display: inline-block; background: rgb(247, 247, 247); margin-top: 8px; margin-bottom: 10px; padding: 1px 5px; border-radius: 3px; color: rgb(102, 102, 102); border: 1px solid rgb(238, 238, 238);\">minWidth</code>&nbsp;和&nbsp;<code style=\"-webkit-tap-highlight-color: transparent; display: inline-block; background: rgb(247, 247, 247); margin-top: 8px; margin-bottom: 10px; padding: 1px 5px; border-radius: 3px; color: rgb(102, 102, 102); border: 1px solid rgb(238, 238, 238);\">maxWidth</code>。<a href=\"https://github.com/iview/iview/issues/3284\" target=\"_blank\" style=\"-webkit-tap-highlight-color: transparent; background-position: 0px 0px; outline-style: initial; outline-width: 0px;\">#3284</a></li><li style=\"-webkit-tap-highlight-color: transparent; margin-bottom: 5px; font-size: 14px;\">DatePicker 的&nbsp;<code style=\"-webkit-tap-highlight-color: transparent; display: inline-block; background: rgb(247, 247, 247); margin-top: 8px; margin-bottom: 10px; padding: 1px 5px; border-radius: 3px; color: rgb(102, 102, 102); border: 1px solid rgb(238, 238, 238);\">disabledDate</code>&nbsp;功能，现在也能限制时、分、秒了。<a href=\"https://github.com/iview/iview/issues/3246\" target=\"_blank\" style=\"-webkit-tap-highlight-color: transparent; background-position: 0px 0px; outline-style: initial; outline-width: 0px;\">#3246</a></li><li style=\"-webkit-tap-highlight-color: transparent; margin-bottom: 5px; font-size: 14px;\">优化 Table 筛选样式。<a href=\"https://github.com/iview/iview/issues/3206\" target=\"_blank\" style=\"-webkit-tap-highlight-color: transparent; background-position: 0px 0px; outline-style: initial; outline-width: 0px;\">#3206</a></li><li style=\"-webkit-tap-highlight-color: transparent; margin-bottom: 5px; font-size: 14px;\">修复 Table 在多级表头里使用过滤和排序的 bug。<a href=\"https://github.com/iview/iview/issues/3339\" target=\"_blank\" style=\"-webkit-tap-highlight-color: transparent; background-position: 0px 0px; outline-style: initial; outline-width: 0px;\">#3339</a></li><li style=\"-webkit-tap-highlight-color: transparent; margin-bottom: 5px; font-size: 14px;\">修复 Table 在 2.12.0 版本，设置&nbsp;<code style=\"-webkit-tap-highlight-color: transparent; display: inline-block; background: rgb(247, 247, 247); margin-top: 8px; margin-bottom: 10px; padding: 1px 5px; border-radius: 3px; color: rgb(102, 102, 102); border: 1px solid rgb(238, 238, 238);\">show-header=\"false\"</code>&nbsp;报错的 bug。</li><li style=\"-webkit-tap-highlight-color: transparent; margin-bottom: 5px; font-size: 14px;\">修复 Poptip 和 Tooltip 有时方向识别错误的 bug，并支持自定义 popper.js 的 options 选项。</li><li style=\"-webkit-tap-highlight-color: transparent; margin-bottom: 5px; font-size: 14px;\">修复 DatePicker 在 daterange 模式下，选择年、月后显示值不正确的 bug。<a href=\"https://github.com/iview/iview/issues/3345\" target=\"_blank\" style=\"-webkit-tap-highlight-color: transparent; background-position: 0px 0px; outline-style: initial; outline-width: 0px;\">#3345</a></li><li style=\"-webkit-tap-highlight-color: transparent; margin-bottom: 5px; font-size: 14px;\">修复 DatePicker 在 Safari 浏览器下&nbsp;<code style=\"-webkit-tap-highlight-color: transparent; display: inline-block; background: rgb(247, 247, 247); margin-top: 8px; margin-bottom: 10px; padding: 1px 5px; border-radius: 3px; color: rgb(102, 102, 102); border: 1px solid rgb(238, 238, 238);\">on-change</code>&nbsp;事件返回值有时不正确的 bug。<a href=\"https://github.com/iview/iview/issues/3232\" target=\"_blank\" style=\"-webkit-tap-highlight-color: transparent; background-position: 0px 0px; outline-style: initial; outline-width: 0px;\">#3232</a></li><li style=\"-webkit-tap-highlight-color: transparent; margin-bottom: 5px; font-size: 14px;\">修复 DatePicker 的&nbsp;<code style=\"-webkit-tap-highlight-color: transparent; display: inline-block; background: rgb(247, 247, 247); margin-top: 8px; margin-bottom: 10px; padding: 1px 5px; border-radius: 3px; color: rgb(102, 102, 102); border: 1px solid rgb(238, 238, 238);\">show-week-numbers</code>&nbsp;无法动态设置的 bug。<a href=\"https://github.com/iview/iview/issues/3277\" target=\"_blank\" style=\"-webkit-tap-highlight-color: transparent; background-position: 0px 0px; outline-style: initial; outline-width: 0px;\">#3277</a></li></ul>', '0');
INSERT INTO `pear_build` VALUES (74, 0, 0, 1292, '2.13.1', '', '', '2018-04-30', '', '', 'admin', '<ul style=\"-webkit-tap-highlight-color: transparent; padding-left: 40px; list-style-type: circle; color: rgb(73, 80, 96); font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;\\\\5FAE软雅黑&quot;, Arial, sans-serif;\"><li style=\"-webkit-tap-highlight-color: transparent; margin-bottom: 5px; font-size: 14px;\">Tag 新增属性&nbsp;<code style=\"-webkit-tap-highlight-color: transparent; display: inline-block; background: rgb(247, 247, 247); margin-top: 8px; margin-bottom: 10px; padding: 1px 5px; border-radius: 3px; color: rgb(102, 102, 102); border: 1px solid rgb(238, 238, 238);\">fade</code>。</li><li style=\"-webkit-tap-highlight-color: transparent; margin-bottom: 5px; font-size: 14px;\">InputNumber 新增属性&nbsp;<code style=\"-webkit-tap-highlight-color: transparent; display: inline-block; background: rgb(247, 247, 247); margin-top: 8px; margin-bottom: 10px; padding: 1px 5px; border-radius: 3px; color: rgb(102, 102, 102); border: 1px solid rgb(238, 238, 238);\">placeholder</code>。<a href=\"https://github.com/iview/iview/issues/3424\" target=\"_blank\" style=\"-webkit-tap-highlight-color: transparent; background-position: 0px 0px; outline-style: initial; outline-width: 0px;\">#3424</a></li><li style=\"-webkit-tap-highlight-color: transparent; margin-bottom: 5px; font-size: 14px;\">InputNumber 的事件&nbsp;<code style=\"-webkit-tap-highlight-color: transparent; display: inline-block; background: rgb(247, 247, 247); margin-top: 8px; margin-bottom: 10px; padding: 1px 5px; border-radius: 3px; color: rgb(102, 102, 102); border: 1px solid rgb(238, 238, 238);\">on-focus</code>&nbsp;增加返回值 event。<a href=\"https://github.com/iview/iview/issues/3395\" target=\"_blank\" style=\"-webkit-tap-highlight-color: transparent; background-position: 0px 0px; outline-style: initial; outline-width: 0px;\">#3395</a></li><li style=\"-webkit-tap-highlight-color: transparent; margin-bottom: 5px; font-size: 14px;\">DatePicker 的事件&nbsp;<code style=\"-webkit-tap-highlight-color: transparent; display: inline-block; background: rgb(247, 247, 247); margin-top: 8px; margin-bottom: 10px; padding: 1px 5px; border-radius: 3px; color: rgb(102, 102, 102); border: 1px solid rgb(238, 238, 238);\">on-change</code>&nbsp;增加返回值 type。<a href=\"https://github.com/iview/iview/issues/3353\" target=\"_blank\" style=\"-webkit-tap-highlight-color: transparent; background-position: 0px 0px; outline-style: initial; outline-width: 0px;\">#3353</a></li><li style=\"-webkit-tap-highlight-color: transparent; margin-bottom: 5px; font-size: 14px;\">优化 popper.js 的配置及 dropdown 的展开动画。<a href=\"https://github.com/iview/iview/issues/3354\" target=\"_blank\" style=\"-webkit-tap-highlight-color: transparent; background-position: 0px 0px; outline-style: initial; outline-width: 0px;\">#3354</a></li><li style=\"-webkit-tap-highlight-color: transparent; margin-bottom: 5px; font-size: 14px;\">修复 Table 在动态调整页面宽度，有时滚动条显示错误的 bug。<a href=\"https://github.com/iview/iview/issues/3358\" target=\"_blank\" style=\"-webkit-tap-highlight-color: transparent; background-position: 0px 0px; outline-style: initial; outline-width: 0px;\">#3358</a></li><li style=\"-webkit-tap-highlight-color: transparent; margin-bottom: 5px; font-size: 14px;\">修复 Poptip / Tooltip 动态修改内容后，位置计算不准确的 bug。<a href=\"https://github.com/iview/iview/issues/3412\" target=\"_blank\" style=\"-webkit-tap-highlight-color: transparent; background-position: 0px 0px; outline-style: initial; outline-width: 0px;\">#3412</a></li><li style=\"-webkit-tap-highlight-color: transparent; margin-bottom: 5px; font-size: 14px;\">修复在 Form 内使用 Carousel 时，点击按钮会跳转的问题。<a href=\"https://github.com/iview/iview/issues/3426\" target=\"_blank\" style=\"-webkit-tap-highlight-color: transparent; background-position: 0px 0px; outline-style: initial; outline-width: 0px;\">#3426</a></li></ul>', '0');

-- ----------------------------
-- Table structure for pear_collection
-- ----------------------------
DROP TABLE IF EXISTS `pear_collection`;
CREATE TABLE `pear_collection`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `type` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '类型',
  `source_code` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '任务ID',
  `member_code` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '成员id',
  `create_time` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `id`(`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 113 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '收藏表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of pear_collection
-- ----------------------------
INSERT INTO `pear_collection` VALUES (108, 'aut9wrz1pn0elf5s47ivx26o', 'task', 'aut9wrz1pn0elf5s47ivx26o', '6v7be19pwman2fird04gqu53', '2018-12-30 17:14:23');
INSERT INTO `pear_collection` VALUES (109, 'mv4usefb06dxv8ez2spkl223', 'task', 'mv4usefb06dxv8ez2spkl223', '6v7be19pwman2fird04gqu53', '2018-12-30 22:16:05');
INSERT INTO `pear_collection` VALUES (110, 'twb8f52jasn9vry6iko0dqg4', 'task', 'twb8f52jasn9vry6iko0dqg4', '6v7be19pwman2fird04gqu53', '2019-01-13 19:44:34');
INSERT INTO `pear_collection` VALUES (112, 'na6uwxzi2fg3sre5qy9vb8m1', NULL, 'uwq87z2f0hnvrl6o9gtcb3iy', '6v7be19pwman2fird04gqu53', '2019-01-13 20:47:37');

-- ----------------------------
-- Table structure for pear_department
-- ----------------------------
DROP TABLE IF EXISTS `pear_department`;
CREATE TABLE `pear_department`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '编号',
  `organization_code` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '组织编号',
  `name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '名称',
  `sort` int(11) NULL DEFAULT 0 COMMENT '排序',
  `pcode` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '上级编号',
  `icon` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '图标',
  `create_time` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建时间',
  `path` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '上级路径',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '部门表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of pear_department
-- ----------------------------
INSERT INTO `pear_department` VALUES (1, '6v7be19pwman2fird04gqu53', '6v7be19pwman2fird04gqu53', '技术部', 0, '', NULL, NULL, NULL);
INSERT INTO `pear_department` VALUES (2, '6v7be19pwman2fird04gqu11', '6v7be19pwman2fird04gqu53', '开发1部', 0, '6v7be19pwman2fird04gqu53', NULL, NULL, '6v7be19pwman2fird04gqu53');
INSERT INTO `pear_department` VALUES (3, 'pn6fyumbd9clz0t32kxr1qj8', 'bhlmq6n5edixkwct17a2gpv3', '太阳总部', 0, '', NULL, '2019-01-13 11:09:58', '');
INSERT INTO `pear_department` VALUES (4, 'szdc5ojkgb802urvyxah196e', 'bhlmq6n5edixkwct17a2gpv3', '黑子1部', 0, 'pn6fyumbd9clz0t32kxr1qj8', NULL, '2019-01-13 11:10:24', 'pn6fyumbd9clz0t32kxr1qj8');

-- ----------------------------
-- Table structure for pear_department_member
-- ----------------------------
DROP TABLE IF EXISTS `pear_department_member`;
CREATE TABLE `pear_department_member`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT 'id',
  `department_code` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '部门id',
  `organization_code` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '组织id',
  `account_code` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '成员id',
  `join_time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '加入时间',
  `is_principal` tinyint(1) NULL DEFAULT NULL COMMENT '是否负责人',
  `is_owner` tinyint(1) NULL DEFAULT 0 COMMENT '拥有者',
  `authorize` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '角色',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 39 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '部门-成员表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of pear_department_member
-- ----------------------------
INSERT INTO `pear_department_member` VALUES (34, 'fze7qr03v1dhtaygpjco9254', '6v7be19pwman2fird04gqu53', '6v7be19pwman2fird04gqu53', '6v7be19pwman2fird04gqu22', '2019-01-07 09:36:39', 0, 0, NULL);
INSERT INTO `pear_department_member` VALUES (35, 'tjf432lxcuoizvhk95rgm78w', '6v7be19pwman2fird04gqu11', '6v7be19pwman2fird04gqu53', '6v7be19pwman2fird04gqu22', '2019-01-07 09:37:08', 0, 0, NULL);
INSERT INTO `pear_department_member` VALUES (36, '2tyvcl53bdr1a9h4ofxuepg8', '6v7be19pwman2fird04gqu53', '6v7be19pwman2fird04gqu53', '6v7be19pwman2fird04gqu55', '2019-01-07 09:48:37', 0, 0, NULL);
INSERT INTO `pear_department_member` VALUES (37, 'gd6f5a8qmzor239kvlixn071', '6v7be19pwman2fird04gqu53', '6v7be19pwman2fird04gqu53', '6v7be19pwman2fird04gqu11', '2019-01-07 09:49:03', 0, 0, NULL);
INSERT INTO `pear_department_member` VALUES (38, 'uzodyahgnc5pqk1iv2sef86x', '6v7be19pwman2fird04gqu11', '6v7be19pwman2fird04gqu53', '6v7be19pwman2fird04gqu55', '2019-01-07 09:52:29', 0, 0, NULL);

-- ----------------------------
-- Table structure for pear_file
-- ----------------------------
DROP TABLE IF EXISTS `pear_file`;
CREATE TABLE `pear_file`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `code` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '编号',
  `path_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '相对路径',
  `title` char(90) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '名称',
  `extension` char(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '扩展名',
  `size` mediumint(8) UNSIGNED NULL DEFAULT 0 COMMENT '文件大小',
  `object_type` char(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '对象类型',
  `organization_code` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '组织编码',
  `task_code` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '任务编码',
  `project_code` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '项目编码',
  `create_by` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '上传人',
  `create_time` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建时间',
  `downloads` mediumint(8) UNSIGNED NULL DEFAULT 0 COMMENT '下载次数',
  `extra` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '额外信息',
  `deleted` tinyint(1) NULL DEFAULT 0 COMMENT '删除标记',
  `file_url` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '完整地址',
  `file_type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '文件类型',
  `deleted_time` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '删除时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 44 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '文件表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of pear_file
-- ----------------------------
INSERT INTO `pear_file` VALUES (34, 'lhp9dfz831jquoam6g4nbery', 'static/upload/file/default/6v7be19pwman2fird04gqu53/6v7be19pwman2fird04gqu53/20190111/20190111104540-ioncube_loaders_win_nonts_vc11_x86.zip', 'ioncube_loaders_win_nonts_vc11_x86', 'zip', 793854, '', '6v7be19pwman2fird04gqu53', NULL, 'mo4uqwfb06dxv8ez2spkl3rg', '6v7be19pwman2fird04gqu53', '2019-01-11 10:45:40', 0, '', 0, 'http://easyproject.net/static/upload/file/default/6v7be19pwman2fird04gqu53/6v7be19pwman2fird04gqu53/20190111/20190111104540-ioncube_loaders_win_nonts_vc11_x86.zip', 'application/x-zip-compressed', '');
INSERT INTO `pear_file` VALUES (35, 'lr08qzj5bucy2p1osinhkdef', 'static/upload/file/default/6v7be19pwman2fird04gqu53/6v7be19pwman2fird04gqu53/20190111/20190111104540-技术部项目周报.xlsx', '技术部项目周报', 'xlsx', 8, '', '6v7be19pwman2fird04gqu53', NULL, 'mo4uqwfb06dxv8ez2spkl3rg', '6v7be19pwman2fird04gqu53', '2019-01-11 10:45:40', 0, '', 0, 'http://easyproject.net/static/upload/file/default/6v7be19pwman2fird04gqu53/6v7be19pwman2fird04gqu53/20190111/20190111104540-技术部项目周报.xlsx', 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet', '');
INSERT INTO `pear_file` VALUES (36, 'gf1zm573upka8htwlydsjxcr', 'static/upload/file/default/6v7be19pwman2fird04gqu53/6v7be19pwman2fird04gqu53/20190111/20190111104607-cover.png', 'cover', 'png', 99467, '', '6v7be19pwman2fird04gqu53', NULL, 'mo4uqwfb06dxv8ez2spkl3rg', '6v7be19pwman2fird04gqu53', '2019-01-11 10:46:07', 0, '', 0, 'http://easyproject.net/static/upload/file/default/6v7be19pwman2fird04gqu53/6v7be19pwman2fird04gqu53/20190111/20190111104607-cover.png', 'image/png', '');
INSERT INTO `pear_file` VALUES (37, '0vr64cpylg3sbhkuij8a2en5', 'static/upload/file/default/6v7be19pwman2fird04gqu53/6v7be19pwman2fird04gqu53/20190112/20190112184705-2.jpg', '2', 'jpg', 176083, '', '6v7be19pwman2fird04gqu53', NULL, 'mo4uqwfb06dxv8ez2spkl3rg', '6v7be19pwman2fird04gqu53', '2019-01-12 18:47:05', 0, '', 0, 'http://easyproject.net/static/upload/file/default/6v7be19pwman2fird04gqu53/6v7be19pwman2fird04gqu53/20190112/20190112184705-2.jpg', 'image/jpeg', '');
INSERT INTO `pear_file` VALUES (38, 'qr18x4eja9vs35ftudck7w2m', 'static/upload/file/default/6v7be19pwman2fird04gqu53/6v7be19pwman2fird04gqu53/20190112/20190112184705-1.jpg', '1', 'jpg', 157751, '', '6v7be19pwman2fird04gqu53', NULL, 'mo4uqwfb06dxv8ez2spkl3rg', '6v7be19pwman2fird04gqu53', '2019-01-12 18:47:05', 0, '', 0, 'http://easyproject.net/static/upload/file/default/6v7be19pwman2fird04gqu53/6v7be19pwman2fird04gqu53/20190112/20190112184705-1.jpg', 'image/jpeg', '');
INSERT INTO `pear_file` VALUES (39, 'txu5z7rg6bavnk4h3y8wq9i2', 'static/upload/file/default/6v7be19pwman2fird04gqu53/6v7be19pwman2fird04gqu53/20190112/20190112184705-3.jpg', '3', 'jpg', 150189, '', '6v7be19pwman2fird04gqu53', NULL, 'mo4uqwfb06dxv8ez2spkl3rg', '6v7be19pwman2fird04gqu53', '2019-01-12 18:47:05', 0, '', 0, 'http://easyproject.net/static/upload/file/default/6v7be19pwman2fird04gqu53/6v7be19pwman2fird04gqu53/20190112/20190112184705-3.jpg', 'image/jpeg', '');
INSERT INTO `pear_file` VALUES (40, 'dqkx4o6wp2r9uzt15fyaenlv', 'static/upload/file/default/6v7be19pwman2fird04gqu53/6v7be19pwman2fird04gqu53/20190112/20190112184741-5a1d10000fc8c.jpg', '5a1d10000fc8c', 'jpg', 445137, '', '6v7be19pwman2fird04gqu53', NULL, 'mo4uqwfb06dxv8ez2spkl3rg', '6v7be19pwman2fird04gqu53', '2019-01-12 18:47:41', 0, '', 0, 'http://easyproject.net/static/upload/file/default/6v7be19pwman2fird04gqu53/6v7be19pwman2fird04gqu53/20190112/20190112184741-5a1d10000fc8c.jpg', 'image/jpeg', '');
INSERT INTO `pear_file` VALUES (42, '7ru54lhm6i198stqkdcy3ap2', 'static/upload/file/default/6v7be19pwman2fird04gqu53/6v7be19pwman2fird04gqu53/20190112/20190112184757-05990022176026337.jpg', '05990022176026337', 'jpg', 45930, '', '6v7be19pwman2fird04gqu53', NULL, 'mo4uqwfb06dxv8ez2spkl3rg', '6v7be19pwman2fird04gqu53', '2019-01-12 18:47:57', 0, '', 0, 'http://easyproject.net/static/upload/file/default/6v7be19pwman2fird04gqu53/6v7be19pwman2fird04gqu53/20190112/20190112184757-05990022176026337.jpg', 'image/jpeg', '2019-01-12 22:26:56');
INSERT INTO `pear_file` VALUES (43, 'tfydkno68i4b7ha0q1x2uwcs', 'static/upload/file/default/bh5mdpzy7wg46kiqx9uclns2/6v7be19pwman2fird04gqu53/20190113/20190113122337-avatar.png', 'avatar', 'png', 51574, '', 'bh5mdpzy7wg46kiqx9uclns2', NULL, 'mo4uqwfb06dxv8ez2spkl3rg', '6v7be19pwman2fird04gqu53', '2019-01-13 12:23:37', 0, '', 0, 'http://easyproject.net/static/upload/file/default/bh5mdpzy7wg46kiqx9uclns2/6v7be19pwman2fird04gqu53/20190113/20190113122337-avatar.png', 'image/png', '');

-- ----------------------------
-- Table structure for pear_invite_link
-- ----------------------------
DROP TABLE IF EXISTS `pear_invite_link`;
CREATE TABLE `pear_invite_link`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '邀请码',
  `create_by` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '邀请人',
  `invite_type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '链接类型',
  `source_code` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '资源编码',
  `create_time` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建时间',
  `over_time` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '过期时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '邀请链接表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of pear_invite_link
-- ----------------------------
INSERT INTO `pear_invite_link` VALUES (1, 'n732zdcgafhiykp0lvsbu91t', '6v7be19pwman2fird04gqu53', 'organization', '6v7be19pwman2fird04gqu53', '2019-01-23 15:07:50', '2019-01-24 15:07:50');

-- ----------------------------
-- Table structure for pear_lock
-- ----------------------------
DROP TABLE IF EXISTS `pear_lock`;
CREATE TABLE `pear_lock`  (
  `pid` bigint(20) UNSIGNED NOT NULL COMMENT 'IP+TYPE',
  `pvalue` tinyint(3) UNSIGNED NOT NULL DEFAULT 1 COMMENT '次数',
  `expiretime` int(11) NOT NULL DEFAULT 0 COMMENT '锁定截止时间',
  PRIMARY KEY (`pid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '防灌水表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of pear_lock
-- ----------------------------
INSERT INTO `pear_lock` VALUES (21307064333, 2, 1475226020);

-- ----------------------------
-- Table structure for pear_mailqueue
-- ----------------------------
DROP TABLE IF EXISTS `pear_mailqueue`;
CREATE TABLE `pear_mailqueue`  (
  `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT,
  `toList` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `ccList` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `subject` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `body` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `addedBy` char(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `addedDate` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `sendTime` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `status` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'wait',
  `failReason` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `sendTime`(`sendTime`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 31858 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '邮件队列' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for pear_member
-- ----------------------------
DROP TABLE IF EXISTS `pear_member`;
CREATE TABLE `pear_member`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '系统前台用户表',
  `account` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '用户登陆账号',
  `password` char(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '登陆密码，32位加密串',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '用户昵称',
  `mobile` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '手机',
  `realname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '真实姓名',
  `create_time` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建时间',
  `status` tinyint(1) NULL DEFAULT 0 COMMENT '状态',
  `last_login_time` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '上次登录时间',
  `sex` char(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '性别',
  `avatar` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '头像',
  `idcard` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '身份证',
  `province` int(11) NULL DEFAULT 0 COMMENT '省',
  `city` int(11) NULL DEFAULT 0 COMMENT '市',
  `area` int(11) NULL DEFAULT 0 COMMENT '区',
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '所在地址',
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '备注',
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `code` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '编号',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `username`(`account`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 589 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of pear_member
-- ----------------------------
INSERT INTO `pear_member` VALUES (586, 'Alians', 'e10adc3949ba59abbe56e057f20f883e', 'Alians', '18377893857', 'vilson', NULL, 1, '2019-01-26 07:29:41', '', 'https://gw.alipayobjects.com/zos/rmsportal/zOsKZmFRdUtvpqCImOVY.png', NULL, 0, 0, 0, NULL, NULL, 'vilson@qq.com', 'kqdcn2w40p58r31zyo6efjib');
INSERT INTO `pear_member` VALUES (582, '123456', 'e10adc3949ba59abbe56e057f20f883e', 'vilson', '18681140825', 'juli', NULL, 1, '2019-02-16 10:22:45', '', 'https://static.vilson.xyz/cover.png', '', 0, 0, 0, NULL, NULL, '545522390@qq.com', '6v7be19pwman2fird04gqu53');
INSERT INTO `pear_member` VALUES (587, 'Chihiro', 'e10adc3949ba59abbe56e057f20f883e', 'Chihiro', '18278881051', 'Chihiro', NULL, 1, '2019-01-24 11:15:09', '', 'https://gw.alipayobjects.com/zos/rmsportal/BiazfanxmamNRoxxVxka.png', NULL, 0, 0, 0, NULL, NULL, '741648282@qq.com', 'y680trgedcavbhnz24u7i5m3');
INSERT INTO `pear_member` VALUES (588, 'Json', 'f9f02f39d6d2048d760d8add98265ba1', 'Json', '18681140821', 'Json', '2019-01-05 21:57:01', 1, '2019-01-06 08:21:42', '', 'https://static.vilson.xyz/cover.png', NULL, 0, 0, 0, NULL, NULL, '123456@qq.com', 'vys8gd32cfui6brtwzj4pqho');

-- ----------------------------
-- Table structure for pear_member_account
-- ----------------------------
DROP TABLE IF EXISTS `pear_member_account`;
CREATE TABLE `pear_member_account`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `member_code` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '所属账号id',
  `organization_code` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '所属组织',
  `department_code` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '部门编号',
  `authorize` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '角色',
  `is_owner` tinyint(1) NULL DEFAULT 0 COMMENT '是否主账号',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '姓名',
  `mobile` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '手机号码',
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '邮件',
  `create_time` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建时间',
  `last_login_time` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '上次登录时间',
  `status` tinyint(1) NULL DEFAULT 0 COMMENT '状态',
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '描述',
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '头像',
  `position` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '职位',
  `department` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '部门',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 31 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '组织账号表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of pear_member_account
-- ----------------------------
INSERT INTO `pear_member_account` VALUES (21, '6v7be19pwman2fird04gqu11', '6v7be19pwman2fird04gqu53', '6v7be19pwman2fird04gqu53', '6v7be19pwman2fird04gqu53', '4', 1, 'vilson', '18681140825', '545522390@qq.com', '2019-01-05 21:57:01', NULL, 1, NULL, 'http://easyproject.net/static/upload/member/avatar/20181221/c3438c50fbc1b19607949893b42abee8.png', '资深工程师', '某某公司－某某某事业群－某某平台部－某某技术部－BM');
INSERT INTO `pear_member_account` VALUES (22, '6v7be19pwman2fird04gqu22', 'kqdcn2w40p58r31zyo6efjib', '6v7be19pwman2fird04gqu53', '6v7be19pwman2fird04gqu53,6v7be19pwman2fird04gqu11', '4', 0, 'Alians', '18377893857', 'vilson@qq.com', '2019-01-05 21:57:01', NULL, 1, 'eee', 'https://gw.alipayobjects.com/zos/rmsportal/zOsKZmFRdUtvpqCImOVY.png', '资深工程师', '某某公司－某某某事业群－某某平台部－某某技术部－BM');
INSERT INTO `pear_member_account` VALUES (28, '0n52te9psyukd1g84frajwzv', '6v7be19pwman2fird04gqu53', 'bh5mdpzy7wg46kiqx9uclns2', '', NULL, 1, 'vilson', NULL, '545522390@qq.com', '2019-01-13 10:24:47', NULL, 1, NULL, 'https://static.vilson.xyz/cover.png', '资深工程师', '某某公司－某某某事业群－某某平台部－某某技术部－BM');
INSERT INTO `pear_member_account` VALUES (24, '6v7be19pwman2fird04gqu44', 'kqdcn2w40p58r31zyo6efjib', '6v7be19pwman2fird04gqsss', '', NULL, 1, 'Alians', '18377893857', 'vilson@qq.com', '2019-01-05 21:57:01', NULL, 1, NULL, 'https://gw.alipayobjects.com/zos/rmsportal/zOsKZmFRdUtvpqCImOVY.png', NULL, NULL);
INSERT INTO `pear_member_account` VALUES (25, '6v7be19pwman2fird04gqu55', 'y680trgedcavbhnz24u7i5m3', '6v7be19pwman2fird04gqu53', '6v7be19pwman2fird04gqu53,6v7be19pwman2fird04gqu11', '4', 0, 'Chihiro', '18278881051', '741648282@qq.com', '2019-01-05 21:57:01', NULL, 1, 'eee', 'https://gw.alipayobjects.com/zos/rmsportal/BiazfanxmamNRoxxVxka.png', NULL, NULL);
INSERT INTO `pear_member_account` VALUES (26, '6v7be19pwman2fird04gqu66', 'vys8gd32cfui6brtwzj4pqho', '4ni58wts2egcybvodfh1kmaj', '', NULL, 1, 'Json', NULL, '123456@qq.com', '2019-01-05 21:57:01', NULL, 1, NULL, NULL, '资深工程师', '某某公司－某某某事业群－某某平台部－某某技术部－BM');
INSERT INTO `pear_member_account` VALUES (30, 'if34h2lvdu06twxce1npmog7', 'vys8gd32cfui6brtwzj4pqho', '6v7be19pwman2fird04gqu53', '', '4', 0, 'Json', NULL, '123456@qq.com', '2019-01-16 15:18:29', NULL, 1, NULL, NULL, '资深工程师', '某某公司－某某某事业群－某某平台部－某某技术部－BM');
INSERT INTO `pear_member_account` VALUES (29, 'vg10jpez6w4odt87mnyfhax5', '6v7be19pwman2fird04gqu53', 'bhlmq6n5edixkwct17a2gpv3', '', NULL, 1, 'vilson', NULL, '545522390@qq.com', '2019-01-13 10:26:44', NULL, 1, NULL, 'https://static.vilson.xyz/cover.png', '资深工程师', '某某公司－某某某事业群－某某平台部－某某技术部－BM');

-- ----------------------------
-- Table structure for pear_notify
-- ----------------------------
DROP TABLE IF EXISTS `pear_notify`;
CREATE TABLE `pear_notify`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '标题',
  `content` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '内容',
  `type` enum('notice','message','task') CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '通知类型。通知：notice，消息：message，待办：task',
  `from` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '发送人id',
  `to` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '送达用户id',
  `create_time` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '生成时间',
  `is_read` tinyint(1) NULL DEFAULT 0 COMMENT '是否已读',
  `read_time` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '阅读时间',
  `send_data` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '关联数据',
  `finally_send_time` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '最终发送时间',
  `send_time` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '发送时间',
  `action` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'none' COMMENT '场景：task，project',
  `terminal` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '推送终端。pc端：project，移动端：wap',
  `from_type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '\'project\',\'system\'',
  `avatar` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '头像/图片',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 4325 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '动态通知表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of pear_notify
-- ----------------------------
INSERT INTO `pear_notify` VALUES (4297, 'vilson 指派给了 Chihiro', '修复了 Divider 与浮动元素一起使用时的样式问题', 'message', '6v7be19pwman2fird04gqu53', 'y680trgedcavbhnz24u7i5m3', '2019-01-22 15:33:47', 0, NULL, '{\"id\":12311,\"code\":\"g15scwqm9zxroy7p8bvjt632\",\"project_code\":\"mo4uqwfb06dxv8ez2spkl3rg\",\"name\":\"\\u4fee\\u590d\\u4e86 Divider \\u4e0e\\u6d6e\\u52a8\\u5143\\u7d20\\u4e00\\u8d77\\u4f7f\\u7528\\u65f6\\u7684\\u6837\\u5f0f\\u95ee\\u9898\",\"pri\":0,\"execute_status\":\"wait\",\"description\":null,\"create_by\":\"6v7be19pwman2fird04gqu53\",\"create_time\":\"2019-01-03 22:28:21\",\"assign_to\":\"y680trgedcavbhnz24u7i5m3\",\"deleted\":0,\"stage_code\":\"7z8tgb6xevy2aj9nui5fk0w1\",\"task_tag\":null,\"done\":0,\"begin_time\":null,\"end_time\":null,\"remind_time\":null,\"pcode\":\"\",\"sort\":0,\"like\":0,\"star\":0,\"deleted_time\":null,\"private\":1,\"id_num\":22,\"priText\":\"\\u666e\\u901a\",\"liked\":0,\"stared\":0,\"childCount\":[0,0],\"hasComment\":0,\"hasSource\":2,\"canRead\":true}', NULL, NULL, 'task', 'project', 'system', 'https://static.vilson.xyz/cover.png');
INSERT INTO `pear_notify` VALUES (4296, 'vilson 指派给了 Chihiro', '增加 less 变量 @font-variant-base 定制 font-variant 样式', 'message', '6v7be19pwman2fird04gqu53', 'y680trgedcavbhnz24u7i5m3', '2019-01-22 11:17:25', 0, NULL, '{\"id\":12301,\"code\":\"xkic58d20srnu9jm7ohqw14f\",\"project_code\":\"mo4uqwfb06dxv8ez2spkl3rg\",\"name\":\"\\u589e\\u52a0 less \\u53d8\\u91cf @font-variant-base \\u5b9a\\u5236 font-variant \\u6837\\u5f0f\",\"pri\":0,\"execute_status\":\"wait\",\"description\":null,\"create_by\":\"6v7be19pwman2fird04gqu53\",\"create_time\":\"2019-01-03 22:25:53\",\"assign_to\":\"y680trgedcavbhnz24u7i5m3\",\"deleted\":0,\"stage_code\":\"jvyswuxz34qk2cpt9o7ldb60\",\"task_tag\":null,\"done\":0,\"begin_time\":null,\"end_time\":null,\"remind_time\":null,\"pcode\":\"\",\"sort\":0,\"like\":0,\"star\":0,\"deleted_time\":null,\"private\":0,\"id_num\":12,\"priText\":\"\\u666e\\u901a\",\"liked\":0,\"stared\":0,\"childCount\":[0,0],\"hasComment\":0,\"hasSource\":0}', NULL, NULL, 'task', 'project', 'system', 'https://static.vilson.xyz/cover.png');
INSERT INTO `pear_notify` VALUES (4295, 'vilson 指派给了 Chihiro', '增加 less 变量 @font-variant-base 定制 font-variant 样式', 'message', '6v7be19pwman2fird04gqu53', 'kqdcn2w40p58r31zyo6efjib', '2019-01-22 11:17:25', 0, NULL, '{\"id\":12301,\"code\":\"xkic58d20srnu9jm7ohqw14f\",\"project_code\":\"mo4uqwfb06dxv8ez2spkl3rg\",\"name\":\"\\u589e\\u52a0 less \\u53d8\\u91cf @font-variant-base \\u5b9a\\u5236 font-variant \\u6837\\u5f0f\",\"pri\":0,\"execute_status\":\"wait\",\"description\":null,\"create_by\":\"6v7be19pwman2fird04gqu53\",\"create_time\":\"2019-01-03 22:25:53\",\"assign_to\":\"y680trgedcavbhnz24u7i5m3\",\"deleted\":0,\"stage_code\":\"jvyswuxz34qk2cpt9o7ldb60\",\"task_tag\":null,\"done\":0,\"begin_time\":null,\"end_time\":null,\"remind_time\":null,\"pcode\":\"\",\"sort\":0,\"like\":0,\"star\":0,\"deleted_time\":null,\"private\":0,\"id_num\":12,\"priText\":\"\\u666e\\u901a\",\"liked\":0,\"stared\":0,\"childCount\":[0,0],\"hasComment\":0,\"hasSource\":0}', NULL, NULL, 'task', 'project', 'system', 'https://static.vilson.xyz/cover.png');
INSERT INTO `pear_notify` VALUES (4293, 'Chihiro 完成了任务 ', '微调 Card 头部和加载中的样式细节', 'message', 'y680trgedcavbhnz24u7i5m3', '6v7be19pwman2fird04gqu53', '2019-01-22 11:00:51', 0, '2019-01-22 11:13:27', '{\"id\":12305,\"code\":\"uwq87z2f0hnvrl6o9gtcb3iy\",\"project_code\":\"mo4uqwfb06dxv8ez2spkl3rg\",\"name\":\"\\u5fae\\u8c03 Card \\u5934\\u90e8\\u548c\\u52a0\\u8f7d\\u4e2d\\u7684\\u6837\\u5f0f\\u7ec6\\u8282\",\"pri\":0,\"execute_status\":\"wait\",\"description\":null,\"create_by\":\"6v7be19pwman2fird04gqu53\",\"create_time\":\"2019-01-03 22:26:21\",\"assign_to\":\"y680trgedcavbhnz24u7i5m3\",\"deleted\":0,\"stage_code\":\"p56enm7zck4id2rb0tx9lguh\",\"task_tag\":null,\"done\":1,\"begin_time\":null,\"end_time\":null,\"remind_time\":null,\"pcode\":\"\",\"sort\":0,\"like\":0,\"star\":2,\"deleted_time\":null,\"private\":0,\"id_num\":16,\"priText\":\"\\u666e\\u901a\",\"liked\":0,\"stared\":0,\"childCount\":[0,0],\"hasComment\":0,\"hasSource\":0}', NULL, NULL, 'task', 'project', 'system', 'https://gw.alipayobjects.com/zos/rmsportal/BiazfanxmamNRoxxVxka.png');
INSERT INTO `pear_notify` VALUES (4292, 'Chihiro 完成了任务 ', '优化 Spin 样式并略微提升了切换状态的性能', 'message', 'y680trgedcavbhnz24u7i5m3', '6v7be19pwman2fird04gqu53', '2019-01-22 11:00:34', 0, '2019-01-22 11:13:27', '{\"id\":12304,\"code\":\"gjmotpbrwva079ukde4izn38\",\"project_code\":\"mo4uqwfb06dxv8ez2spkl3rg\",\"name\":\"\\u4f18\\u5316 Spin \\u6837\\u5f0f\\u5e76\\u7565\\u5fae\\u63d0\\u5347\\u4e86\\u5207\\u6362\\u72b6\\u6001\\u7684\\u6027\\u80fd\",\"pri\":0,\"execute_status\":\"wait\",\"description\":null,\"create_by\":\"6v7be19pwman2fird04gqu53\",\"create_time\":\"2019-01-03 22:26:16\",\"assign_to\":\"6v7be19pwman2fird04gqu53\",\"deleted\":0,\"stage_code\":\"p56enm7zck4id2rb0tx9lguh\",\"task_tag\":null,\"done\":1,\"begin_time\":null,\"end_time\":null,\"remind_time\":null,\"pcode\":\"\",\"sort\":0,\"like\":0,\"star\":0,\"deleted_time\":null,\"private\":0,\"id_num\":15,\"priText\":\"\\u666e\\u901a\",\"liked\":0,\"stared\":0,\"childCount\":[0,0],\"hasComment\":0,\"hasSource\":0}', NULL, NULL, 'task', 'project', 'system', 'https://gw.alipayobjects.com/zos/rmsportal/BiazfanxmamNRoxxVxka.png');
INSERT INTO `pear_notify` VALUES (4291, 'vilson 重做了任务 ', '微调 Card 头部和加载中的样式细节', 'message', '6v7be19pwman2fird04gqu53', 'y680trgedcavbhnz24u7i5m3', '2019-01-22 11:00:24', 0, NULL, '{\"id\":12305,\"code\":\"uwq87z2f0hnvrl6o9gtcb3iy\",\"project_code\":\"mo4uqwfb06dxv8ez2spkl3rg\",\"name\":\"\\u5fae\\u8c03 Card \\u5934\\u90e8\\u548c\\u52a0\\u8f7d\\u4e2d\\u7684\\u6837\\u5f0f\\u7ec6\\u8282\",\"pri\":0,\"execute_status\":\"wait\",\"description\":null,\"create_by\":\"6v7be19pwman2fird04gqu53\",\"create_time\":\"2019-01-03 22:26:21\",\"assign_to\":\"y680trgedcavbhnz24u7i5m3\",\"deleted\":0,\"stage_code\":\"p56enm7zck4id2rb0tx9lguh\",\"task_tag\":null,\"done\":0,\"begin_time\":null,\"end_time\":null,\"remind_time\":null,\"pcode\":\"\",\"sort\":0,\"like\":0,\"star\":2,\"deleted_time\":null,\"private\":0,\"id_num\":16,\"priText\":\"\\u666e\\u901a\",\"liked\":0,\"stared\":0,\"childCount\":[0,0],\"hasComment\":0,\"hasSource\":0}', NULL, NULL, 'task', 'project', 'system', 'https://static.vilson.xyz/cover.png');
INSERT INTO `pear_notify` VALUES (4290, 'vilson 完成了任务 ', '微调 Card 头部和加载中的样式细节', 'message', '6v7be19pwman2fird04gqu53', 'y680trgedcavbhnz24u7i5m3', '2019-01-22 11:00:01', 0, NULL, '{\"id\":12305,\"code\":\"uwq87z2f0hnvrl6o9gtcb3iy\",\"project_code\":\"mo4uqwfb06dxv8ez2spkl3rg\",\"name\":\"\\u5fae\\u8c03 Card \\u5934\\u90e8\\u548c\\u52a0\\u8f7d\\u4e2d\\u7684\\u6837\\u5f0f\\u7ec6\\u8282\",\"pri\":0,\"execute_status\":\"wait\",\"description\":null,\"create_by\":\"6v7be19pwman2fird04gqu53\",\"create_time\":\"2019-01-03 22:26:21\",\"assign_to\":\"y680trgedcavbhnz24u7i5m3\",\"deleted\":0,\"stage_code\":\"p56enm7zck4id2rb0tx9lguh\",\"task_tag\":null,\"done\":1,\"begin_time\":null,\"end_time\":null,\"remind_time\":null,\"pcode\":\"\",\"sort\":0,\"like\":0,\"star\":2,\"deleted_time\":null,\"private\":0,\"id_num\":16,\"priText\":\"\\u666e\\u901a\",\"liked\":0,\"stared\":0,\"childCount\":[0,0],\"hasComment\":0,\"hasSource\":0}', NULL, NULL, 'task', 'project', 'system', 'https://static.vilson.xyz/cover.png');
INSERT INTO `pear_notify` VALUES (4294, 'vilson 重做了任务 ', '微调 Card 头部和加载中的样式细节', 'message', '6v7be19pwman2fird04gqu53', 'y680trgedcavbhnz24u7i5m3', '2019-01-22 11:17:09', 0, NULL, '{\"id\":12305,\"code\":\"uwq87z2f0hnvrl6o9gtcb3iy\",\"project_code\":\"mo4uqwfb06dxv8ez2spkl3rg\",\"name\":\"\\u5fae\\u8c03 Card \\u5934\\u90e8\\u548c\\u52a0\\u8f7d\\u4e2d\\u7684\\u6837\\u5f0f\\u7ec6\\u8282\",\"pri\":0,\"execute_status\":\"wait\",\"description\":null,\"create_by\":\"6v7be19pwman2fird04gqu53\",\"create_time\":\"2019-01-03 22:26:21\",\"assign_to\":\"y680trgedcavbhnz24u7i5m3\",\"deleted\":0,\"stage_code\":\"p56enm7zck4id2rb0tx9lguh\",\"task_tag\":null,\"done\":0,\"begin_time\":null,\"end_time\":null,\"remind_time\":null,\"pcode\":\"\",\"sort\":0,\"like\":0,\"star\":2,\"deleted_time\":null,\"private\":0,\"id_num\":16,\"priText\":\"\\u666e\\u901a\",\"liked\":0,\"stared\":0,\"childCount\":[0,0],\"hasComment\":0,\"hasSource\":0}', NULL, NULL, 'task', 'project', 'system', 'https://static.vilson.xyz/cover.png');
INSERT INTO `pear_notify` VALUES (4298, 'vilson 完成了任务 ', 'action 属性支持作为一个返回 Promise 对象的函数，使用更加灵活', 'message', '6v7be19pwman2fird04gqu53', 'kqdcn2w40p58r31zyo6efjib', '2019-01-24 10:40:49', 0, NULL, '{\"id\":12324,\"code\":\"orycwlhf7n2qx1pta038dzjk\",\"project_code\":\"mo4uqwfb06dxv8ez2spkl3rg\",\"name\":\"action \\u5c5e\\u6027\\u652f\\u6301\\u4f5c\\u4e3a\\u4e00\\u4e2a\\u8fd4\\u56de Promise \\u5bf9\\u8c61\\u7684\\u51fd\\u6570\\uff0c\\u4f7f\\u7528\\u66f4\\u52a0\\u7075\\u6d3b\",\"pri\":0,\"execute_status\":\"wait\",\"description\":null,\"create_by\":\"kqdcn2w40p58r31zyo6efjib\",\"create_time\":\"2019-01-04 09:18:24\",\"assign_to\":\"6v7be19pwman2fird04gqu53\",\"deleted\":0,\"stage_code\":\"psemnf3ugo89vc5r2hkxid1t\",\"task_tag\":null,\"done\":1,\"begin_time\":null,\"end_time\":null,\"remind_time\":null,\"pcode\":\"yctbsv81x6dmahkf7ei5o4r9\",\"sort\":0,\"like\":0,\"star\":0,\"deleted_time\":null,\"private\":0,\"id_num\":35,\"priText\":\"\\u666e\\u901a\",\"liked\":0,\"stared\":0,\"childCount\":[0,0],\"hasComment\":0,\"hasSource\":0,\"canRead\":1}', NULL, NULL, 'task', 'project', 'system', 'https://static.vilson.xyz/cover.png');
INSERT INTO `pear_notify` VALUES (4299, 'vilson 完成了任务 ', '微调 Card 头部和加载中的样式细节', 'message', '6v7be19pwman2fird04gqu53', 'y680trgedcavbhnz24u7i5m3', '2019-01-24 11:14:06', 0, NULL, '{\"id\":12305,\"code\":\"uwq87z2f0hnvrl6o9gtcb3iy\",\"project_code\":\"mo4uqwfb06dxv8ez2spkl3rg\",\"name\":\"\\u5fae\\u8c03 Card \\u5934\\u90e8\\u548c\\u52a0\\u8f7d\\u4e2d\\u7684\\u6837\\u5f0f\\u7ec6\\u8282\",\"pri\":0,\"execute_status\":\"wait\",\"description\":null,\"create_by\":\"6v7be19pwman2fird04gqu53\",\"create_time\":\"2019-01-03 22:26:21\",\"assign_to\":\"y680trgedcavbhnz24u7i5m3\",\"deleted\":0,\"stage_code\":\"p56enm7zck4id2rb0tx9lguh\",\"task_tag\":null,\"done\":1,\"begin_time\":null,\"end_time\":null,\"remind_time\":null,\"pcode\":\"\",\"sort\":0,\"like\":0,\"star\":2,\"deleted_time\":null,\"private\":0,\"id_num\":16,\"priText\":\"\\u666e\\u901a\",\"liked\":0,\"stared\":0,\"childCount\":[0,0],\"hasComment\":0,\"hasSource\":0,\"canRead\":1}', NULL, NULL, 'task', 'project', 'system', 'https://static.vilson.xyz/cover.png');
INSERT INTO `pear_notify` VALUES (4300, 'Chihiro 重做了任务 ', '微调 Card 头部和加载中的样式细节', 'message', 'y680trgedcavbhnz24u7i5m3', '6v7be19pwman2fird04gqu53', '2019-01-24 11:15:19', 0, NULL, '{\"id\":12305,\"code\":\"uwq87z2f0hnvrl6o9gtcb3iy\",\"project_code\":\"mo4uqwfb06dxv8ez2spkl3rg\",\"name\":\"\\u5fae\\u8c03 Card \\u5934\\u90e8\\u548c\\u52a0\\u8f7d\\u4e2d\\u7684\\u6837\\u5f0f\\u7ec6\\u8282\",\"pri\":0,\"execute_status\":\"wait\",\"description\":null,\"create_by\":\"6v7be19pwman2fird04gqu53\",\"create_time\":\"2019-01-03 22:26:21\",\"assign_to\":\"y680trgedcavbhnz24u7i5m3\",\"deleted\":0,\"stage_code\":\"p56enm7zck4id2rb0tx9lguh\",\"task_tag\":null,\"done\":0,\"begin_time\":null,\"end_time\":null,\"remind_time\":null,\"pcode\":\"\",\"sort\":0,\"like\":0,\"star\":2,\"deleted_time\":null,\"private\":0,\"id_num\":16,\"priText\":\"\\u666e\\u901a\",\"liked\":0,\"stared\":0,\"childCount\":[0,0],\"hasComment\":0,\"hasSource\":0,\"canRead\":1}', NULL, NULL, 'task', 'project', 'system', 'https://gw.alipayobjects.com/zos/rmsportal/BiazfanxmamNRoxxVxka.png');
INSERT INTO `pear_notify` VALUES (4301, 'Chihiro 完成了任务 ', '微调 Card 头部和加载中的样式细节', 'message', 'y680trgedcavbhnz24u7i5m3', '6v7be19pwman2fird04gqu53', '2019-01-24 11:16:41', 0, NULL, '{\"id\":12305,\"code\":\"uwq87z2f0hnvrl6o9gtcb3iy\",\"project_code\":\"mo4uqwfb06dxv8ez2spkl3rg\",\"name\":\"\\u5fae\\u8c03 Card \\u5934\\u90e8\\u548c\\u52a0\\u8f7d\\u4e2d\\u7684\\u6837\\u5f0f\\u7ec6\\u8282\",\"pri\":0,\"execute_status\":\"wait\",\"description\":null,\"create_by\":\"6v7be19pwman2fird04gqu53\",\"create_time\":\"2019-01-03 22:26:21\",\"assign_to\":\"y680trgedcavbhnz24u7i5m3\",\"deleted\":0,\"stage_code\":\"p56enm7zck4id2rb0tx9lguh\",\"task_tag\":null,\"done\":1,\"begin_time\":null,\"end_time\":null,\"remind_time\":null,\"pcode\":\"\",\"sort\":0,\"like\":0,\"star\":2,\"deleted_time\":null,\"private\":0,\"id_num\":16,\"priText\":\"\\u666e\\u901a\",\"liked\":0,\"stared\":0,\"childCount\":[0,0],\"hasComment\":0,\"hasSource\":0,\"canRead\":1}', NULL, NULL, 'task', 'project', 'system', 'https://gw.alipayobjects.com/zos/rmsportal/BiazfanxmamNRoxxVxka.png');
INSERT INTO `pear_notify` VALUES (4302, 'Chihiro 完成了任务 ', '优化 Spin 样式并略微提升了切换状态的性能', 'message', 'y680trgedcavbhnz24u7i5m3', '6v7be19pwman2fird04gqu53', '2019-01-24 11:16:53', 0, NULL, '{\"id\":12304,\"code\":\"gjmotpbrwva079ukde4izn38\",\"project_code\":\"mo4uqwfb06dxv8ez2spkl3rg\",\"name\":\"\\u4f18\\u5316 Spin \\u6837\\u5f0f\\u5e76\\u7565\\u5fae\\u63d0\\u5347\\u4e86\\u5207\\u6362\\u72b6\\u6001\\u7684\\u6027\\u80fd\",\"pri\":0,\"execute_status\":\"wait\",\"description\":null,\"create_by\":\"6v7be19pwman2fird04gqu53\",\"create_time\":\"2019-01-03 22:26:16\",\"assign_to\":\"6v7be19pwman2fird04gqu53\",\"deleted\":0,\"stage_code\":\"p56enm7zck4id2rb0tx9lguh\",\"task_tag\":null,\"done\":1,\"begin_time\":null,\"end_time\":null,\"remind_time\":null,\"pcode\":\"\",\"sort\":0,\"like\":0,\"star\":0,\"deleted_time\":null,\"private\":0,\"id_num\":15,\"priText\":\"\\u666e\\u901a\",\"liked\":0,\"stared\":0,\"childCount\":[0,0],\"hasComment\":0,\"hasSource\":0,\"canRead\":1}', NULL, NULL, 'task', 'project', 'system', 'https://gw.alipayobjects.com/zos/rmsportal/BiazfanxmamNRoxxVxka.png');
INSERT INTO `pear_notify` VALUES (4303, 'vilson 完成了任务 ', '优化鼠标悬停在可排序的表头上时 title 的显示', 'message', '6v7be19pwman2fird04gqu53', 'y680trgedcavbhnz24u7i5m3', '2019-01-24 14:56:21', 0, NULL, '{\"id\":12302,\"code\":\"6hj43ueim2bk187sqzcoy59v\",\"project_code\":\"mo4uqwfb06dxv8ez2spkl3rg\",\"name\":\"\\u4f18\\u5316\\u9f20\\u6807\\u60ac\\u505c\\u5728\\u53ef\\u6392\\u5e8f\\u7684\\u8868\\u5934\\u4e0a\\u65f6 title \\u7684\\u663e\\u793a\",\"pri\":2,\"execute_status\":\"wait\",\"description\":\"<p><a href=\\\"https:\\/\\/www.baidu.com\\\" target=\\\"_blank\\\">\\u8fd9\\u91cc\\u662f\\u5907\\u6ce8\\u5185\\u5bb9<\\/a><br><\\/p><p><img src=\\\"https:\\/\\/beta.vilson.xyz\\/static\\/upload\\/image\\/default\\/20181229\\/54cd2d50d19731f3231fc96d26a823bf.png\\\" style=\\\"max-width:100%;\\\"><br><\\/p>\",\"create_by\":\"6v7be19pwman2fird04gqu53\",\"create_time\":\"2019-01-03 22:26:01\",\"assign_to\":\"y680trgedcavbhnz24u7i5m3\",\"deleted\":0,\"stage_code\":\"psemnf3ugo89vc5r2hkxid1t\",\"task_tag\":null,\"done\":1,\"begin_time\":null,\"end_time\":\"2019-01-06 18:00\",\"remind_time\":null,\"pcode\":\"\",\"sort\":1,\"like\":1,\"star\":0,\"deleted_time\":null,\"private\":0,\"id_num\":13,\"priText\":\"\\u975e\\u5e38\\u7d27\\u6025\",\"liked\":1,\"stared\":0,\"childCount\":[1,0],\"hasUnDone\":1,\"parentDone\":1,\"hasComment\":0,\"hasSource\":0,\"canRead\":1}', NULL, NULL, 'task', 'project', 'system', 'https://static.vilson.xyz/cover.png');
INSERT INTO `pear_notify` VALUES (4304, 'vilson 完成了任务 ', '优化鼠标悬停在可排序的表头上时 title 的显示', 'message', '6v7be19pwman2fird04gqu53', 'kqdcn2w40p58r31zyo6efjib', '2019-01-24 14:56:21', 0, NULL, '{\"id\":12302,\"code\":\"6hj43ueim2bk187sqzcoy59v\",\"project_code\":\"mo4uqwfb06dxv8ez2spkl3rg\",\"name\":\"\\u4f18\\u5316\\u9f20\\u6807\\u60ac\\u505c\\u5728\\u53ef\\u6392\\u5e8f\\u7684\\u8868\\u5934\\u4e0a\\u65f6 title \\u7684\\u663e\\u793a\",\"pri\":2,\"execute_status\":\"wait\",\"description\":\"<p><a href=\\\"https:\\/\\/www.baidu.com\\\" target=\\\"_blank\\\">\\u8fd9\\u91cc\\u662f\\u5907\\u6ce8\\u5185\\u5bb9<\\/a><br><\\/p><p><img src=\\\"https:\\/\\/beta.vilson.xyz\\/static\\/upload\\/image\\/default\\/20181229\\/54cd2d50d19731f3231fc96d26a823bf.png\\\" style=\\\"max-width:100%;\\\"><br><\\/p>\",\"create_by\":\"6v7be19pwman2fird04gqu53\",\"create_time\":\"2019-01-03 22:26:01\",\"assign_to\":\"y680trgedcavbhnz24u7i5m3\",\"deleted\":0,\"stage_code\":\"psemnf3ugo89vc5r2hkxid1t\",\"task_tag\":null,\"done\":1,\"begin_time\":null,\"end_time\":\"2019-01-06 18:00\",\"remind_time\":null,\"pcode\":\"\",\"sort\":1,\"like\":1,\"star\":0,\"deleted_time\":null,\"private\":0,\"id_num\":13,\"priText\":\"\\u975e\\u5e38\\u7d27\\u6025\",\"liked\":1,\"stared\":0,\"childCount\":[1,0],\"hasUnDone\":1,\"parentDone\":1,\"hasComment\":0,\"hasSource\":0,\"canRead\":1}', NULL, NULL, 'task', 'project', 'system', 'https://static.vilson.xyz/cover.png');
INSERT INTO `pear_notify` VALUES (4305, 'vilson 重做了任务 ', '优化鼠标悬停在可排序的表头上时 title 的显示', 'message', '6v7be19pwman2fird04gqu53', 'y680trgedcavbhnz24u7i5m3', '2019-01-24 14:56:33', 0, NULL, '{\"id\":12302,\"code\":\"6hj43ueim2bk187sqzcoy59v\",\"project_code\":\"mo4uqwfb06dxv8ez2spkl3rg\",\"name\":\"\\u4f18\\u5316\\u9f20\\u6807\\u60ac\\u505c\\u5728\\u53ef\\u6392\\u5e8f\\u7684\\u8868\\u5934\\u4e0a\\u65f6 title \\u7684\\u663e\\u793a\",\"pri\":2,\"execute_status\":\"wait\",\"description\":\"<p><a href=\\\"https:\\/\\/www.baidu.com\\\" target=\\\"_blank\\\">\\u8fd9\\u91cc\\u662f\\u5907\\u6ce8\\u5185\\u5bb9<\\/a><br><\\/p><p><img src=\\\"https:\\/\\/beta.vilson.xyz\\/static\\/upload\\/image\\/default\\/20181229\\/54cd2d50d19731f3231fc96d26a823bf.png\\\" style=\\\"max-width:100%;\\\"><br><\\/p>\",\"create_by\":\"6v7be19pwman2fird04gqu53\",\"create_time\":\"2019-01-03 22:26:01\",\"assign_to\":\"y680trgedcavbhnz24u7i5m3\",\"deleted\":0,\"stage_code\":\"psemnf3ugo89vc5r2hkxid1t\",\"task_tag\":null,\"done\":0,\"begin_time\":null,\"end_time\":\"2019-01-06 18:00\",\"remind_time\":null,\"pcode\":\"\",\"sort\":1,\"like\":1,\"star\":0,\"deleted_time\":null,\"private\":0,\"id_num\":13,\"priText\":\"\\u975e\\u5e38\\u7d27\\u6025\",\"liked\":1,\"stared\":0,\"childCount\":[1,0],\"hasUnDone\":1,\"parentDone\":1,\"hasComment\":0,\"hasSource\":0,\"canRead\":1}', NULL, NULL, 'task', 'project', 'system', 'https://static.vilson.xyz/cover.png');
INSERT INTO `pear_notify` VALUES (4306, 'vilson 重做了任务 ', '优化鼠标悬停在可排序的表头上时 title 的显示', 'message', '6v7be19pwman2fird04gqu53', 'kqdcn2w40p58r31zyo6efjib', '2019-01-24 14:56:33', 0, NULL, '{\"id\":12302,\"code\":\"6hj43ueim2bk187sqzcoy59v\",\"project_code\":\"mo4uqwfb06dxv8ez2spkl3rg\",\"name\":\"\\u4f18\\u5316\\u9f20\\u6807\\u60ac\\u505c\\u5728\\u53ef\\u6392\\u5e8f\\u7684\\u8868\\u5934\\u4e0a\\u65f6 title \\u7684\\u663e\\u793a\",\"pri\":2,\"execute_status\":\"wait\",\"description\":\"<p><a href=\\\"https:\\/\\/www.baidu.com\\\" target=\\\"_blank\\\">\\u8fd9\\u91cc\\u662f\\u5907\\u6ce8\\u5185\\u5bb9<\\/a><br><\\/p><p><img src=\\\"https:\\/\\/beta.vilson.xyz\\/static\\/upload\\/image\\/default\\/20181229\\/54cd2d50d19731f3231fc96d26a823bf.png\\\" style=\\\"max-width:100%;\\\"><br><\\/p>\",\"create_by\":\"6v7be19pwman2fird04gqu53\",\"create_time\":\"2019-01-03 22:26:01\",\"assign_to\":\"y680trgedcavbhnz24u7i5m3\",\"deleted\":0,\"stage_code\":\"psemnf3ugo89vc5r2hkxid1t\",\"task_tag\":null,\"done\":0,\"begin_time\":null,\"end_time\":\"2019-01-06 18:00\",\"remind_time\":null,\"pcode\":\"\",\"sort\":1,\"like\":1,\"star\":0,\"deleted_time\":null,\"private\":0,\"id_num\":13,\"priText\":\"\\u975e\\u5e38\\u7d27\\u6025\",\"liked\":1,\"stared\":0,\"childCount\":[1,0],\"hasUnDone\":1,\"parentDone\":1,\"hasComment\":0,\"hasSource\":0,\"canRead\":1}', NULL, NULL, 'task', 'project', 'system', 'https://static.vilson.xyz/cover.png');
INSERT INTO `pear_notify` VALUES (4307, 'vilson 完成了任务 ', '新增 directory 属性，支持上传一个文件夹', 'message', '6v7be19pwman2fird04gqu53', 'kqdcn2w40p58r31zyo6efjib', '2019-01-24 14:58:08', 0, NULL, '{\"id\":12323,\"code\":\"o61b3s24exmcy8njkparwthd\",\"project_code\":\"mo4uqwfb06dxv8ez2spkl3rg\",\"name\":\"\\u65b0\\u589e directory \\u5c5e\\u6027\\uff0c\\u652f\\u6301\\u4e0a\\u4f20\\u4e00\\u4e2a\\u6587\\u4ef6\\u5939\",\"pri\":0,\"execute_status\":\"wait\",\"description\":null,\"create_by\":\"kqdcn2w40p58r31zyo6efjib\",\"create_time\":\"2019-01-04 09:18:18\",\"assign_to\":\"6v7be19pwman2fird04gqu53\",\"deleted\":0,\"stage_code\":\"psemnf3ugo89vc5r2hkxid1t\",\"task_tag\":null,\"done\":1,\"begin_time\":null,\"end_time\":null,\"remind_time\":null,\"pcode\":\"yctbsv81x6dmahkf7ei5o4r9\",\"sort\":0,\"like\":0,\"star\":0,\"deleted_time\":null,\"private\":0,\"id_num\":34,\"priText\":\"\\u666e\\u901a\",\"liked\":0,\"stared\":0,\"childCount\":[0,0],\"hasUnDone\":0,\"parentDone\":0,\"hasComment\":0,\"hasSource\":0,\"canRead\":1}', NULL, NULL, 'task', 'project', 'system', 'https://static.vilson.xyz/cover.png');
INSERT INTO `pear_notify` VALUES (4308, 'vilson 完成了任务 ', 'Upload 组件升级 rc-upload 到 2.5.0', 'message', '6v7be19pwman2fird04gqu53', 'kqdcn2w40p58r31zyo6efjib', '2019-01-24 14:58:13', 0, NULL, '{\"id\":12307,\"code\":\"yctbsv81x6dmahkf7ei5o4r9\",\"project_code\":\"mo4uqwfb06dxv8ez2spkl3rg\",\"name\":\"Upload \\u7ec4\\u4ef6\\u5347\\u7ea7 rc-upload \\u5230 2.5.0\",\"pri\":0,\"execute_status\":\"wait\",\"description\":null,\"create_by\":\"6v7be19pwman2fird04gqu53\",\"create_time\":\"2019-01-03 22:27:17\",\"assign_to\":\"kqdcn2w40p58r31zyo6efjib\",\"deleted\":0,\"stage_code\":\"psemnf3ugo89vc5r2hkxid1t\",\"task_tag\":null,\"done\":1,\"begin_time\":null,\"end_time\":null,\"remind_time\":null,\"pcode\":\"\",\"sort\":4,\"like\":0,\"star\":0,\"deleted_time\":null,\"private\":0,\"id_num\":18,\"priText\":\"\\u666e\\u901a\",\"liked\":0,\"stared\":0,\"childCount\":[2,2],\"hasUnDone\":0,\"parentDone\":1,\"hasComment\":0,\"hasSource\":0,\"canRead\":1}', NULL, NULL, 'task', 'project', 'system', 'https://static.vilson.xyz/cover.png');
INSERT INTO `pear_notify` VALUES (4309, 'vilson 重做了任务 ', '新增 directory 属性，支持上传一个文件夹', 'message', '6v7be19pwman2fird04gqu53', 'kqdcn2w40p58r31zyo6efjib', '2019-01-24 15:00:20', 0, NULL, '{\"id\":12323,\"code\":\"o61b3s24exmcy8njkparwthd\",\"project_code\":\"mo4uqwfb06dxv8ez2spkl3rg\",\"name\":\"\\u65b0\\u589e directory \\u5c5e\\u6027\\uff0c\\u652f\\u6301\\u4e0a\\u4f20\\u4e00\\u4e2a\\u6587\\u4ef6\\u5939\",\"pri\":0,\"execute_status\":\"wait\",\"description\":null,\"create_by\":\"kqdcn2w40p58r31zyo6efjib\",\"create_time\":\"2019-01-04 09:18:18\",\"assign_to\":\"6v7be19pwman2fird04gqu53\",\"deleted\":0,\"stage_code\":\"psemnf3ugo89vc5r2hkxid1t\",\"task_tag\":null,\"done\":0,\"begin_time\":null,\"end_time\":null,\"remind_time\":null,\"pcode\":\"yctbsv81x6dmahkf7ei5o4r9\",\"sort\":0,\"like\":0,\"star\":0,\"deleted_time\":null,\"private\":0,\"id_num\":34,\"priText\":\"\\u666e\\u901a\",\"liked\":0,\"stared\":0,\"childCount\":[0,0],\"hasUnDone\":0,\"parentDone\":1,\"hasComment\":0,\"hasSource\":0,\"canRead\":1}', NULL, NULL, 'task', 'project', 'system', 'https://static.vilson.xyz/cover.png');
INSERT INTO `pear_notify` VALUES (4310, 'vilson 完成了任务 ', '新增 directory 属性，支持上传一个文件夹', 'message', '6v7be19pwman2fird04gqu53', 'kqdcn2w40p58r31zyo6efjib', '2019-01-24 15:00:22', 0, NULL, '{\"id\":12323,\"code\":\"o61b3s24exmcy8njkparwthd\",\"project_code\":\"mo4uqwfb06dxv8ez2spkl3rg\",\"name\":\"\\u65b0\\u589e directory \\u5c5e\\u6027\\uff0c\\u652f\\u6301\\u4e0a\\u4f20\\u4e00\\u4e2a\\u6587\\u4ef6\\u5939\",\"pri\":0,\"execute_status\":\"wait\",\"description\":null,\"create_by\":\"kqdcn2w40p58r31zyo6efjib\",\"create_time\":\"2019-01-04 09:18:18\",\"assign_to\":\"6v7be19pwman2fird04gqu53\",\"deleted\":0,\"stage_code\":\"psemnf3ugo89vc5r2hkxid1t\",\"task_tag\":null,\"done\":1,\"begin_time\":null,\"end_time\":null,\"remind_time\":null,\"pcode\":\"yctbsv81x6dmahkf7ei5o4r9\",\"sort\":0,\"like\":0,\"star\":0,\"deleted_time\":null,\"private\":0,\"id_num\":34,\"priText\":\"\\u666e\\u901a\",\"liked\":0,\"stared\":0,\"childCount\":[0,0],\"hasUnDone\":0,\"parentDone\":1,\"hasComment\":0,\"hasSource\":0,\"canRead\":1}', NULL, NULL, 'task', 'project', 'system', 'https://static.vilson.xyz/cover.png');
INSERT INTO `pear_notify` VALUES (4311, 'vilson 重做了任务 ', 'Upload 组件升级 rc-upload 到 2.5.0', 'message', '6v7be19pwman2fird04gqu53', 'kqdcn2w40p58r31zyo6efjib', '2019-01-24 15:00:53', 0, NULL, '{\"id\":12307,\"code\":\"yctbsv81x6dmahkf7ei5o4r9\",\"project_code\":\"mo4uqwfb06dxv8ez2spkl3rg\",\"name\":\"Upload \\u7ec4\\u4ef6\\u5347\\u7ea7 rc-upload \\u5230 2.5.0\",\"pri\":0,\"execute_status\":\"wait\",\"description\":null,\"create_by\":\"6v7be19pwman2fird04gqu53\",\"create_time\":\"2019-01-03 22:27:17\",\"assign_to\":\"kqdcn2w40p58r31zyo6efjib\",\"deleted\":0,\"stage_code\":\"psemnf3ugo89vc5r2hkxid1t\",\"task_tag\":null,\"done\":0,\"begin_time\":null,\"end_time\":null,\"remind_time\":null,\"pcode\":\"\",\"sort\":4,\"like\":0,\"star\":0,\"deleted_time\":null,\"private\":0,\"id_num\":18,\"priText\":\"\\u666e\\u901a\",\"liked\":0,\"stared\":0,\"childCount\":[2,2],\"hasUnDone\":0,\"parentDone\":1,\"hasComment\":0,\"hasSource\":0,\"canRead\":1}', NULL, NULL, 'task', 'project', 'system', 'https://static.vilson.xyz/cover.png');
INSERT INTO `pear_notify` VALUES (4312, 'vilson 完成了任务 ', 'Upload 组件升级 rc-upload 到 2.5.0', 'message', '6v7be19pwman2fird04gqu53', 'kqdcn2w40p58r31zyo6efjib', '2019-01-24 15:07:23', 0, NULL, '{\"id\":12307,\"code\":\"yctbsv81x6dmahkf7ei5o4r9\",\"project_code\":\"mo4uqwfb06dxv8ez2spkl3rg\",\"name\":\"Upload \\u7ec4\\u4ef6\\u5347\\u7ea7 rc-upload \\u5230 2.5.0\",\"pri\":0,\"execute_status\":\"wait\",\"description\":null,\"create_by\":\"6v7be19pwman2fird04gqu53\",\"create_time\":\"2019-01-03 22:27:17\",\"assign_to\":\"kqdcn2w40p58r31zyo6efjib\",\"deleted\":0,\"stage_code\":\"psemnf3ugo89vc5r2hkxid1t\",\"task_tag\":null,\"done\":1,\"begin_time\":null,\"end_time\":null,\"remind_time\":null,\"pcode\":\"\",\"sort\":4,\"like\":0,\"star\":0,\"deleted_time\":null,\"private\":0,\"id_num\":18,\"priText\":\"\\u666e\\u901a\",\"liked\":0,\"stared\":0,\"childCount\":[2,2],\"hasUnDone\":0,\"parentDone\":1,\"hasComment\":0,\"hasSource\":0,\"canRead\":1}', NULL, NULL, 'task', 'project', 'system', 'https://static.vilson.xyz/cover.png');
INSERT INTO `pear_notify` VALUES (4313, 'vilson 重做了任务 ', 'Upload 组件升级 rc-upload 到 2.5.0', 'message', '6v7be19pwman2fird04gqu53', 'kqdcn2w40p58r31zyo6efjib', '2019-01-24 15:07:36', 0, NULL, '{\"id\":12307,\"code\":\"yctbsv81x6dmahkf7ei5o4r9\",\"project_code\":\"mo4uqwfb06dxv8ez2spkl3rg\",\"name\":\"Upload \\u7ec4\\u4ef6\\u5347\\u7ea7 rc-upload \\u5230 2.5.0\",\"pri\":0,\"execute_status\":\"wait\",\"description\":null,\"create_by\":\"6v7be19pwman2fird04gqu53\",\"create_time\":\"2019-01-03 22:27:17\",\"assign_to\":\"kqdcn2w40p58r31zyo6efjib\",\"deleted\":0,\"stage_code\":\"psemnf3ugo89vc5r2hkxid1t\",\"task_tag\":null,\"done\":0,\"begin_time\":null,\"end_time\":null,\"remind_time\":null,\"pcode\":\"\",\"sort\":4,\"like\":0,\"star\":0,\"deleted_time\":null,\"private\":0,\"id_num\":18,\"priText\":\"\\u666e\\u901a\",\"liked\":0,\"stared\":0,\"childCount\":[2,2],\"hasUnDone\":0,\"parentDone\":1,\"hasComment\":0,\"hasSource\":0,\"canRead\":1}', NULL, NULL, 'task', 'project', 'system', 'https://static.vilson.xyz/cover.png');
INSERT INTO `pear_notify` VALUES (4314, 'vilson 重做了任务 ', '新增 directory 属性，支持上传一个文件夹', 'message', '6v7be19pwman2fird04gqu53', 'kqdcn2w40p58r31zyo6efjib', '2019-01-24 15:14:37', 0, NULL, '{\"id\":12323,\"code\":\"o61b3s24exmcy8njkparwthd\",\"project_code\":\"mo4uqwfb06dxv8ez2spkl3rg\",\"name\":\"\\u65b0\\u589e directory \\u5c5e\\u6027\\uff0c\\u652f\\u6301\\u4e0a\\u4f20\\u4e00\\u4e2a\\u6587\\u4ef6\\u5939\",\"pri\":0,\"execute_status\":\"wait\",\"description\":null,\"create_by\":\"kqdcn2w40p58r31zyo6efjib\",\"create_time\":\"2019-01-04 09:18:18\",\"assign_to\":\"6v7be19pwman2fird04gqu53\",\"deleted\":0,\"stage_code\":\"psemnf3ugo89vc5r2hkxid1t\",\"task_tag\":null,\"done\":0,\"begin_time\":null,\"end_time\":null,\"remind_time\":null,\"pcode\":\"yctbsv81x6dmahkf7ei5o4r9\",\"sort\":0,\"like\":0,\"star\":0,\"deleted_time\":null,\"private\":0,\"id_num\":34,\"priText\":\"\\u666e\\u901a\",\"liked\":0,\"stared\":0,\"childCount\":[0,0],\"hasUnDone\":0,\"parentDone\":0,\"hasComment\":0,\"hasSource\":0,\"canRead\":1}', NULL, NULL, 'task', 'project', 'system', 'https://static.vilson.xyz/cover.png');
INSERT INTO `pear_notify` VALUES (4315, 'vilson 完成了任务 ', '新增 directory 属性，支持上传一个文件夹', 'message', '6v7be19pwman2fird04gqu53', 'kqdcn2w40p58r31zyo6efjib', '2019-01-24 15:14:43', 0, NULL, '{\"id\":12323,\"code\":\"o61b3s24exmcy8njkparwthd\",\"project_code\":\"mo4uqwfb06dxv8ez2spkl3rg\",\"name\":\"\\u65b0\\u589e directory \\u5c5e\\u6027\\uff0c\\u652f\\u6301\\u4e0a\\u4f20\\u4e00\\u4e2a\\u6587\\u4ef6\\u5939\",\"pri\":0,\"execute_status\":\"wait\",\"description\":null,\"create_by\":\"kqdcn2w40p58r31zyo6efjib\",\"create_time\":\"2019-01-04 09:18:18\",\"assign_to\":\"6v7be19pwman2fird04gqu53\",\"deleted\":0,\"stage_code\":\"psemnf3ugo89vc5r2hkxid1t\",\"task_tag\":null,\"done\":1,\"begin_time\":null,\"end_time\":null,\"remind_time\":null,\"pcode\":\"yctbsv81x6dmahkf7ei5o4r9\",\"sort\":0,\"like\":0,\"star\":0,\"deleted_time\":null,\"private\":0,\"id_num\":34,\"priText\":\"\\u666e\\u901a\",\"liked\":0,\"stared\":0,\"childCount\":[0,0],\"hasUnDone\":0,\"parentDone\":0,\"hasComment\":0,\"hasSource\":0,\"canRead\":1}', NULL, NULL, 'task', 'project', 'system', 'https://static.vilson.xyz/cover.png');
INSERT INTO `pear_notify` VALUES (4316, 'vilson 重做了任务 ', '新增 directory 属性，支持上传一个文件夹', 'message', '6v7be19pwman2fird04gqu53', 'kqdcn2w40p58r31zyo6efjib', '2019-01-24 15:15:08', 0, NULL, '{\"id\":12323,\"code\":\"o61b3s24exmcy8njkparwthd\",\"project_code\":\"mo4uqwfb06dxv8ez2spkl3rg\",\"name\":\"\\u65b0\\u589e directory \\u5c5e\\u6027\\uff0c\\u652f\\u6301\\u4e0a\\u4f20\\u4e00\\u4e2a\\u6587\\u4ef6\\u5939\",\"pri\":0,\"execute_status\":\"wait\",\"description\":null,\"create_by\":\"kqdcn2w40p58r31zyo6efjib\",\"create_time\":\"2019-01-04 09:18:18\",\"assign_to\":\"6v7be19pwman2fird04gqu53\",\"deleted\":0,\"stage_code\":\"psemnf3ugo89vc5r2hkxid1t\",\"task_tag\":null,\"done\":0,\"begin_time\":null,\"end_time\":null,\"remind_time\":null,\"pcode\":\"yctbsv81x6dmahkf7ei5o4r9\",\"sort\":0,\"like\":0,\"star\":0,\"deleted_time\":null,\"private\":0,\"id_num\":34,\"priText\":\"\\u666e\\u901a\",\"liked\":0,\"stared\":0,\"childCount\":[0,0],\"hasUnDone\":0,\"parentDone\":0,\"hasComment\":0,\"hasSource\":0,\"canRead\":1}', NULL, NULL, 'task', 'project', 'system', 'https://static.vilson.xyz/cover.png');
INSERT INTO `pear_notify` VALUES (4317, 'vilson 完成了任务 ', '新增 directory 属性，支持上传一个文件夹', 'message', '6v7be19pwman2fird04gqu53', 'kqdcn2w40p58r31zyo6efjib', '2019-01-24 15:15:43', 0, NULL, '{\"id\":12323,\"code\":\"o61b3s24exmcy8njkparwthd\",\"project_code\":\"mo4uqwfb06dxv8ez2spkl3rg\",\"name\":\"\\u65b0\\u589e directory \\u5c5e\\u6027\\uff0c\\u652f\\u6301\\u4e0a\\u4f20\\u4e00\\u4e2a\\u6587\\u4ef6\\u5939\",\"pri\":0,\"execute_status\":\"wait\",\"description\":null,\"create_by\":\"kqdcn2w40p58r31zyo6efjib\",\"create_time\":\"2019-01-04 09:18:18\",\"assign_to\":\"6v7be19pwman2fird04gqu53\",\"deleted\":0,\"stage_code\":\"psemnf3ugo89vc5r2hkxid1t\",\"task_tag\":null,\"done\":1,\"begin_time\":null,\"end_time\":null,\"remind_time\":null,\"pcode\":\"yctbsv81x6dmahkf7ei5o4r9\",\"sort\":0,\"like\":0,\"star\":0,\"deleted_time\":null,\"private\":0,\"id_num\":34,\"priText\":\"\\u666e\\u901a\",\"liked\":0,\"stared\":0,\"childCount\":[0,0],\"hasUnDone\":0,\"parentDone\":0,\"hasComment\":0,\"hasSource\":0,\"canRead\":1}', NULL, NULL, 'task', 'project', 'system', 'https://static.vilson.xyz/cover.png');
INSERT INTO `pear_notify` VALUES (4318, 'vilson 重做了任务 ', '新增 directory 属性，支持上传一个文件夹', 'message', '6v7be19pwman2fird04gqu53', 'kqdcn2w40p58r31zyo6efjib', '2019-01-24 15:16:53', 0, NULL, '{\"id\":12323,\"code\":\"o61b3s24exmcy8njkparwthd\",\"project_code\":\"mo4uqwfb06dxv8ez2spkl3rg\",\"name\":\"\\u65b0\\u589e directory \\u5c5e\\u6027\\uff0c\\u652f\\u6301\\u4e0a\\u4f20\\u4e00\\u4e2a\\u6587\\u4ef6\\u5939\",\"pri\":0,\"execute_status\":\"wait\",\"description\":null,\"create_by\":\"kqdcn2w40p58r31zyo6efjib\",\"create_time\":\"2019-01-04 09:18:18\",\"assign_to\":\"6v7be19pwman2fird04gqu53\",\"deleted\":0,\"stage_code\":\"psemnf3ugo89vc5r2hkxid1t\",\"task_tag\":null,\"done\":0,\"begin_time\":null,\"end_time\":null,\"remind_time\":null,\"pcode\":\"yctbsv81x6dmahkf7ei5o4r9\",\"sort\":0,\"like\":0,\"star\":0,\"deleted_time\":null,\"private\":0,\"id_num\":34,\"priText\":\"\\u666e\\u901a\",\"liked\":0,\"stared\":0,\"childCount\":[0,0],\"hasUnDone\":0,\"parentDone\":0,\"hasComment\":0,\"hasSource\":0,\"canRead\":1}', NULL, NULL, 'task', 'project', 'system', 'https://static.vilson.xyz/cover.png');
INSERT INTO `pear_notify` VALUES (4319, 'vilson 完成了任务 ', '新增 directory 属性，支持上传一个文件夹', 'message', '6v7be19pwman2fird04gqu53', 'kqdcn2w40p58r31zyo6efjib', '2019-01-24 15:17:50', 0, NULL, '{\"id\":12323,\"code\":\"o61b3s24exmcy8njkparwthd\",\"project_code\":\"mo4uqwfb06dxv8ez2spkl3rg\",\"name\":\"\\u65b0\\u589e directory \\u5c5e\\u6027\\uff0c\\u652f\\u6301\\u4e0a\\u4f20\\u4e00\\u4e2a\\u6587\\u4ef6\\u5939\",\"pri\":0,\"execute_status\":\"wait\",\"description\":null,\"create_by\":\"kqdcn2w40p58r31zyo6efjib\",\"create_time\":\"2019-01-04 09:18:18\",\"assign_to\":\"6v7be19pwman2fird04gqu53\",\"deleted\":0,\"stage_code\":\"psemnf3ugo89vc5r2hkxid1t\",\"task_tag\":null,\"done\":1,\"begin_time\":null,\"end_time\":null,\"remind_time\":null,\"pcode\":\"yctbsv81x6dmahkf7ei5o4r9\",\"sort\":0,\"like\":0,\"star\":0,\"deleted_time\":null,\"private\":0,\"id_num\":34,\"priText\":\"\\u666e\\u901a\",\"liked\":0,\"stared\":0,\"childCount\":[0,0],\"hasUnDone\":0,\"parentDone\":0,\"hasComment\":0,\"hasSource\":0,\"canRead\":1}', NULL, NULL, 'task', 'project', 'system', 'https://static.vilson.xyz/cover.png');
INSERT INTO `pear_notify` VALUES (4320, 'vilson 重做了任务 ', '新增 directory 属性，支持上传一个文件夹', 'message', '6v7be19pwman2fird04gqu53', 'kqdcn2w40p58r31zyo6efjib', '2019-01-24 15:19:23', 0, NULL, '{\"id\":12323,\"code\":\"o61b3s24exmcy8njkparwthd\",\"project_code\":\"mo4uqwfb06dxv8ez2spkl3rg\",\"name\":\"\\u65b0\\u589e directory \\u5c5e\\u6027\\uff0c\\u652f\\u6301\\u4e0a\\u4f20\\u4e00\\u4e2a\\u6587\\u4ef6\\u5939\",\"pri\":0,\"execute_status\":\"wait\",\"description\":null,\"create_by\":\"kqdcn2w40p58r31zyo6efjib\",\"create_time\":\"2019-01-04 09:18:18\",\"assign_to\":\"6v7be19pwman2fird04gqu53\",\"deleted\":0,\"stage_code\":\"psemnf3ugo89vc5r2hkxid1t\",\"task_tag\":null,\"done\":0,\"begin_time\":null,\"end_time\":null,\"remind_time\":null,\"pcode\":\"yctbsv81x6dmahkf7ei5o4r9\",\"sort\":0,\"like\":0,\"star\":0,\"deleted_time\":null,\"private\":0,\"id_num\":34,\"priText\":\"\\u666e\\u901a\",\"liked\":0,\"stared\":0,\"childCount\":[0,0],\"hasUnDone\":0,\"parentDone\":0,\"hasComment\":0,\"hasSource\":0,\"canRead\":1}', NULL, NULL, 'task', 'project', 'system', 'https://static.vilson.xyz/cover.png');
INSERT INTO `pear_notify` VALUES (4321, 'vilson 重做了任务 ', 'action 属性支持作为一个返回 Promise 对象的函数，使用更加灵活', 'message', '6v7be19pwman2fird04gqu53', 'kqdcn2w40p58r31zyo6efjib', '2019-01-24 15:19:31', 0, NULL, '{\"id\":12324,\"code\":\"orycwlhf7n2qx1pta038dzjk\",\"project_code\":\"mo4uqwfb06dxv8ez2spkl3rg\",\"name\":\"action \\u5c5e\\u6027\\u652f\\u6301\\u4f5c\\u4e3a\\u4e00\\u4e2a\\u8fd4\\u56de Promise \\u5bf9\\u8c61\\u7684\\u51fd\\u6570\\uff0c\\u4f7f\\u7528\\u66f4\\u52a0\\u7075\\u6d3b\",\"pri\":0,\"execute_status\":\"wait\",\"description\":null,\"create_by\":\"kqdcn2w40p58r31zyo6efjib\",\"create_time\":\"2019-01-04 09:18:24\",\"assign_to\":\"6v7be19pwman2fird04gqu53\",\"deleted\":0,\"stage_code\":\"psemnf3ugo89vc5r2hkxid1t\",\"task_tag\":null,\"done\":0,\"begin_time\":null,\"end_time\":null,\"remind_time\":null,\"pcode\":\"yctbsv81x6dmahkf7ei5o4r9\",\"sort\":0,\"like\":0,\"star\":0,\"deleted_time\":null,\"private\":0,\"id_num\":35,\"priText\":\"\\u666e\\u901a\",\"liked\":0,\"stared\":0,\"childCount\":[0,0],\"hasUnDone\":0,\"parentDone\":0,\"hasComment\":0,\"hasSource\":0,\"canRead\":1}', NULL, NULL, 'task', 'project', 'system', 'https://static.vilson.xyz/cover.png');
INSERT INTO `pear_notify` VALUES (4322, 'vilson 完成了任务 ', '新增 directory 属性，支持上传一个文件夹', 'message', '6v7be19pwman2fird04gqu53', 'kqdcn2w40p58r31zyo6efjib', '2019-01-24 15:21:56', 0, NULL, '{\"id\":12323,\"code\":\"o61b3s24exmcy8njkparwthd\",\"project_code\":\"mo4uqwfb06dxv8ez2spkl3rg\",\"name\":\"\\u65b0\\u589e directory \\u5c5e\\u6027\\uff0c\\u652f\\u6301\\u4e0a\\u4f20\\u4e00\\u4e2a\\u6587\\u4ef6\\u5939\",\"pri\":0,\"execute_status\":\"wait\",\"description\":null,\"create_by\":\"kqdcn2w40p58r31zyo6efjib\",\"create_time\":\"2019-01-04 09:18:18\",\"assign_to\":\"6v7be19pwman2fird04gqu53\",\"deleted\":0,\"stage_code\":\"psemnf3ugo89vc5r2hkxid1t\",\"task_tag\":null,\"done\":1,\"begin_time\":null,\"end_time\":null,\"remind_time\":null,\"pcode\":\"yctbsv81x6dmahkf7ei5o4r9\",\"sort\":0,\"like\":0,\"star\":0,\"deleted_time\":null,\"private\":0,\"id_num\":34,\"priText\":\"\\u666e\\u901a\",\"liked\":0,\"stared\":0,\"childCount\":[0,0],\"hasUnDone\":0,\"parentDone\":0,\"hasComment\":0,\"hasSource\":0,\"canRead\":1}', NULL, NULL, 'task', 'project', 'system', 'https://static.vilson.xyz/cover.png');
INSERT INTO `pear_notify` VALUES (4323, 'vilson 完成了任务 ', 'action 属性支持作为一个返回 Promise 对象的函数，使用更加灵活', 'message', '6v7be19pwman2fird04gqu53', 'kqdcn2w40p58r31zyo6efjib', '2019-01-24 15:21:58', 0, NULL, '{\"id\":12324,\"code\":\"orycwlhf7n2qx1pta038dzjk\",\"project_code\":\"mo4uqwfb06dxv8ez2spkl3rg\",\"name\":\"action \\u5c5e\\u6027\\u652f\\u6301\\u4f5c\\u4e3a\\u4e00\\u4e2a\\u8fd4\\u56de Promise \\u5bf9\\u8c61\\u7684\\u51fd\\u6570\\uff0c\\u4f7f\\u7528\\u66f4\\u52a0\\u7075\\u6d3b\",\"pri\":0,\"execute_status\":\"wait\",\"description\":null,\"create_by\":\"kqdcn2w40p58r31zyo6efjib\",\"create_time\":\"2019-01-04 09:18:24\",\"assign_to\":\"6v7be19pwman2fird04gqu53\",\"deleted\":0,\"stage_code\":\"psemnf3ugo89vc5r2hkxid1t\",\"task_tag\":null,\"done\":1,\"begin_time\":null,\"end_time\":null,\"remind_time\":null,\"pcode\":\"yctbsv81x6dmahkf7ei5o4r9\",\"sort\":0,\"like\":0,\"star\":0,\"deleted_time\":null,\"private\":0,\"id_num\":35,\"priText\":\"\\u666e\\u901a\",\"liked\":0,\"stared\":0,\"childCount\":[0,0],\"hasUnDone\":0,\"parentDone\":0,\"hasComment\":0,\"hasSource\":0,\"canRead\":1}', NULL, NULL, 'task', 'project', 'system', 'https://static.vilson.xyz/cover.png');
INSERT INTO `pear_notify` VALUES (4324, 'vilson 重做了任务 ', '新增 directory 属性，支持上传一个文件夹', 'message', '6v7be19pwman2fird04gqu53', 'kqdcn2w40p58r31zyo6efjib', '2019-01-24 15:22:36', 0, NULL, '{\"id\":12323,\"code\":\"o61b3s24exmcy8njkparwthd\",\"project_code\":\"mo4uqwfb06dxv8ez2spkl3rg\",\"name\":\"\\u65b0\\u589e directory \\u5c5e\\u6027\\uff0c\\u652f\\u6301\\u4e0a\\u4f20\\u4e00\\u4e2a\\u6587\\u4ef6\\u5939\",\"pri\":0,\"execute_status\":\"wait\",\"description\":null,\"create_by\":\"kqdcn2w40p58r31zyo6efjib\",\"create_time\":\"2019-01-04 09:18:18\",\"assign_to\":\"6v7be19pwman2fird04gqu53\",\"deleted\":0,\"stage_code\":\"psemnf3ugo89vc5r2hkxid1t\",\"task_tag\":null,\"done\":0,\"begin_time\":null,\"end_time\":null,\"remind_time\":null,\"pcode\":\"yctbsv81x6dmahkf7ei5o4r9\",\"sort\":0,\"like\":0,\"star\":0,\"deleted_time\":null,\"private\":0,\"id_num\":34,\"priText\":\"\\u666e\\u901a\",\"liked\":0,\"stared\":0,\"childCount\":[0,0],\"hasUnDone\":0,\"parentDone\":0,\"hasComment\":0,\"hasSource\":0,\"canRead\":1}', NULL, NULL, 'task', 'project', 'system', 'https://static.vilson.xyz/cover.png');

-- ----------------------------
-- Table structure for pear_organization
-- ----------------------------
DROP TABLE IF EXISTS `pear_organization`;
CREATE TABLE `pear_organization`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '名称',
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '头像',
  `description` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '描述',
  `owner_code` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '拥有者',
  `create_time` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建时间',
  `personal` tinyint(1) NULL DEFAULT 0 COMMENT '是否个人项目',
  `code` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '编号',
  `address` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '地址',
  `province` int(10) NULL DEFAULT 0 COMMENT '省',
  `city` int(10) NULL DEFAULT 0 COMMENT '市',
  `area` int(10) NULL DEFAULT 0 COMMENT '区',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '组织表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of pear_organization
-- ----------------------------
INSERT INTO `pear_organization` VALUES (1, 'vilson的个人项目', NULL, NULL, '6v7be19pwman2fird04gqu53', '2018-10-12', 1, '6v7be19pwman2fird04gqu53', NULL, 0, 0, 0);
INSERT INTO `pear_organization` VALUES (3, 'Alians的个人项目', NULL, NULL, 'kqdcn2w40p58r31zyo6efjib', '2018-10-12', 1, '6v7be19pwman2fird04gqsss', NULL, 0, 0, 0);
INSERT INTO `pear_organization` VALUES (4, 'Json的个人项目', NULL, NULL, 'vys8gd32cfui6brtwzj4pqho', '2019-01-05 21:57:01', 1, '4ni58wts2egcybvodfh1kmaj', NULL, 0, 0, 0);
INSERT INTO `pear_organization` VALUES (5, '星星联盟', NULL, NULL, '6v7be19pwman2fird04gqu53', '2019-01-13 10:24:42', 1, 'bh5mdpzy7wg46kiqx9uclns2', '星星联盟', 150000, 150300, 150303);
INSERT INTO `pear_organization` VALUES (6, '太阳联盟', NULL, NULL, '6v7be19pwman2fird04gqu53', '2019-01-13 10:26:39', 1, 'bhlmq6n5edixkwct17a2gpv3', '太阳联盟', 140000, 140300, 140303);

-- ----------------------------
-- Table structure for pear_project
-- ----------------------------
DROP TABLE IF EXISTS `pear_project`;
CREATE TABLE `pear_project`  (
  `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT,
  `cover` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '封面',
  `name` varchar(90) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '名称',
  `code` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '编号',
  `description` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '描述',
  `access_control_type` enum('open','private','custom') CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'open' COMMENT '访问控制l类型',
  `white_list` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '可以访问项目的权限组（白名单）',
  `order` int(11) UNSIGNED NULL DEFAULT 0 COMMENT '排序',
  `deleted` tinyint(1) NULL DEFAULT 0 COMMENT '删除标记',
  `template_code` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '项目类型',
  `schedule` double(5, 2) NULL DEFAULT 0.00 COMMENT '进度',
  `create_time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建时间',
  `organization_code` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '组织id',
  `deleted_time` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '删除时间',
  `private` tinyint(1) NULL DEFAULT 1 COMMENT '是否私有',
  `prefix` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '项目前缀',
  `open_prefix` tinyint(1) NULL DEFAULT 0 COMMENT '是否开启项目前缀',
  `archive` tinyint(1) NULL DEFAULT 0 COMMENT '是否归档',
  `archive_time` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '归档时间',
  `open_begin_time` tinyint(1) NULL DEFAULT 0 COMMENT '是否开启任务开始时间',
  `open_task_private` tinyint(1) NULL DEFAULT 0 COMMENT '是否开启新任务默认开启隐私模式',
  `task_board_theme` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'default' COMMENT '看板风格',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `project`(`order`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 13043 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '项目表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of pear_project
-- ----------------------------
INSERT INTO `pear_project` VALUES (1, 'https://beta.vilson.xyz/static/upload//20190103/f9ad4e304ea0be7609e3236188f7547d.png', 'iView', 'a8mpr6tvbndk10hj2lwcqzuo', '那是一种内在的东西， 他们到达不了，也无法触及的', 'private', NULL, NULL, 0, '10', 39.00, '2018-04-30 22:29:18', '6v7be19pwman2fird04gqu53', NULL, 1, '', 0, 0, NULL, 0, 0, 'default');
INSERT INTO `pear_project` VALUES (2, 'https://beta.vilson.xyz/static/upload//20190103/aaacec0e2001580b44dffbb967804349.png', 'Alipay', '8rlqyh56smzpoc1wef7390t2', '城镇中有那么多的酒馆，她却偏偏走进了我的酒馆', 'open', NULL, NULL, 0, '10', 75.00, '2018-05-01 09:28:36', '6v7be19pwman2fird04gqu53', NULL, 1, '', 0, 0, NULL, 0, 0, 'default');
INSERT INTO `pear_project` VALUES (3, 'https://beta.vilson.xyz/static/upload//20190103/9ba2134d72cc3cec58f61024b89eb798.png', 'Vue', 'nkp4gulsb6oxqyi80fhead39', '生命就像一盒巧克力，结果往往出人意料', 'open', NULL, NULL, 0, '10', 63.00, '2018-05-01 09:33:43', '6v7be19pwman2fird04gqu53', '2019-01-03 22:20:10', 1, '', 0, 0, NULL, 0, 0, 'default');
INSERT INTO `pear_project` VALUES (4, 'https://beta.vilson.xyz/static/upload//20190103/6fc14133651ee1c6ee1abaafcea76d01.png', 'Angular', 'sbklfvyouc0qpmwhitn47j5z', '希望是一个好东西，也许是最好的，好东西是不会消亡的', 'private', NULL, NULL, 0, '13', 100.00, '2018-05-01 09:36:05', '6v7be19pwman2fird04gqu53', NULL, 1, '', 0, 0, NULL, 0, 0, 'default');
INSERT INTO `pear_project` VALUES (5, 'https://beta.vilson.xyz/static/upload//20190103/5d2a6e2d2cb235bb6888b884331bb516.png', 'EasyUI', 'n5opgqevrz1l03h48uwx67d2', '那时候我只会想自己想要什么，从不想自己拥有什么', 'open', NULL, NULL, 1, '0', 0.00, '2018-12-22 10:52:25', '6v7be19pwman2fird04gqu53', '2019-01-03 22:19:50', 1, '', 0, 0, NULL, 0, 0, 'default');
INSERT INTO `pear_project` VALUES (1304, 'https://beta.vilson.xyz/static/upload//20190103/f5187655ceab8b52a335443664dffb3c.png', 'Vant', 'tnxpbov8kez6m4wl2hfjucd9', '现在的魏无羡，离开了蓝忘机就不行', 'open', NULL, 0, 0, '0', 50.00, '2018-12-23 08:31:53', '6v7be19pwman2fird04gqu53', '2019-01-04 11:33:02', 1, '', 0, 1, '2019-01-13 13:53:42', 0, 0, 'default');
INSERT INTO `pear_project` VALUES (1303, 'https://beta.vilson.xyz/static/upload//20190103/30bdd62b610f5a4e3f788ec37e6c4a5b.png', 'Material UI', 'elqa703jyvfhpt1dsxkzi8on', '这个项目你不是项目成员，将不能进行操作（只读）', 'open', NULL, 0, 0, '0', 35.00, '2018-12-23 09:33:46', '6v7be19pwman2fird04gqu53', NULL, 0, '', 0, 0, NULL, 0, 0, 'default');
INSERT INTO `pear_project` VALUES (1302, 'https://beta.vilson.xyz/static/upload//20190103/271ec382566f0d2ca187740330b19a17.png', 'Ant Motion', 'ibag9hw3o1tusd5qlpxrk782', '如果我真的存在，也是因为你需要我', 'open', NULL, 0, 1, '0', 50.00, '2018-12-23 09:53:25', '6v7be19pwman2fird04gqu53', '2019-01-04 21:48:33', 0, '', 0, 0, '2019-01-02 21:01:12', 0, 0, 'default');
INSERT INTO `pear_project` VALUES (1305, 'https://beta.vilson.xyz/static/upload//20190103/d86b104c0e1131b2fbd06dce615470df.png', 'Ant Design', 'mo4uqwfb06dxv8ez2spkl3rg', '那时候我只会想自己想要什么，从不想自己拥有什么', 'open', NULL, 0, 0, '0', 24.00, '2018-12-25 07:20:36', '6v7be19pwman2fird04gqu53', '2019-01-02 22:06:02', 1, 'EP', 0, 0, '2019-01-02 20:59:09', 1, 0, 'simple');
INSERT INTO `pear_project` VALUES (1307, 'https://beta.vilson.xyz/static/upload//20190103/271ec382566f0d2ca187740330b19a17.png', '测试', '8ulzfth64cd0k1x5peivowm2', '测试11', 'open', NULL, 0, 1, '', 0.00, '2019-01-03 09:15:11', '6v7be19pwman2fird04gqu53', '2019-01-03 22:18:30', 1, '', 0, 0, '2019-01-03 10:52:54', 0, 0, 'default');
INSERT INTO `pear_project` VALUES (13042, 'http://easyproject.net/static/image/default/project-cover.png', 'OKR 管理', 'gbim9jpevkh7qr6ufa1t3wl4', 'OKR 管理', 'open', NULL, 0, 1, '', 0.00, '2019-01-05 21:57:31', '4ni58wts2egcybvodfh1kmaj', '2019-01-06 08:21:49', 1, NULL, 0, 0, NULL, 0, 0, 'default');

-- ----------------------------
-- Table structure for pear_project_auth
-- ----------------------------
DROP TABLE IF EXISTS `pear_project_auth`;
CREATE TABLE `pear_project_auth`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '权限名称',
  `status` tinyint(1) UNSIGNED NULL DEFAULT 1 COMMENT '状态(1:禁用,2:启用)',
  `sort` smallint(6) UNSIGNED NULL DEFAULT 0 COMMENT '排序权重',
  `desc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注说明',
  `create_by` bigint(11) UNSIGNED NULL DEFAULT 0 COMMENT '创建人',
  `create_at` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建时间',
  `organization_code` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '所属组织',
  `is_default` tinyint(1) NULL DEFAULT 0 COMMENT '是否默认',
  `type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '权限类型',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '项目权限表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of pear_project_auth
-- ----------------------------
INSERT INTO `pear_project_auth` VALUES (1, '管理员', 1, 0, '管理员', 0, '2018-08-01 14:20:46', '', 0, 'admin');
INSERT INTO `pear_project_auth` VALUES (2, '成员', 1, 0, '成员', 0, '2018-12-20 13:39:59', '', 1, 'member');
INSERT INTO `pear_project_auth` VALUES (3, '管理员', 1, 0, '管理员', 0, '2018-08-01 14:20:46', '6v7be19pwman2fird04gqu53', 0, 'admin');
INSERT INTO `pear_project_auth` VALUES (4, '成员', 1, 0, '成员', 0, '2018-12-20 13:39:59', '6v7be19pwman2fird04gqu53', 1, 'member');
INSERT INTO `pear_project_auth` VALUES (6, '管理员', 1, 0, '管理员', 0, '2018-08-01 14:20:46', 'bh5mdpzy7wg46kiqx9uclns2', 0, 'admin');
INSERT INTO `pear_project_auth` VALUES (7, '成员', 1, 0, '成员', 0, '2018-12-20 13:39:59', 'bh5mdpzy7wg46kiqx9uclns2', 1, 'member');
INSERT INTO `pear_project_auth` VALUES (8, '管理员', 1, 0, '管理员', 0, '2018-08-01 14:20:46', 'bhlmq6n5edixkwct17a2gpv3', 0, 'admin');
INSERT INTO `pear_project_auth` VALUES (9, '成员', 1, 0, '成员', 0, '2018-12-20 13:39:59', 'bhlmq6n5edixkwct17a2gpv3', 1, 'member');

-- ----------------------------
-- Table structure for pear_project_auth_node
-- ----------------------------
DROP TABLE IF EXISTS `pear_project_auth_node`;
CREATE TABLE `pear_project_auth_node`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `auth` bigint(20) UNSIGNED NULL DEFAULT NULL COMMENT '角色ID',
  `node` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '节点路径',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `index_system_auth_auth`(`auth`) USING BTREE,
  INDEX `index_system_auth_node`(`node`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4452 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '项目角色与节点绑定' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of pear_project_auth_node
-- ----------------------------
INSERT INTO `pear_project_auth_node` VALUES (3097, 1, 'project');
INSERT INTO `pear_project_auth_node` VALUES (3098, 1, 'project/account');
INSERT INTO `pear_project_auth_node` VALUES (3099, 1, 'project/account/index');
INSERT INTO `pear_project_auth_node` VALUES (3100, 1, 'project/account/auth');
INSERT INTO `pear_project_auth_node` VALUES (3101, 1, 'project/account/add');
INSERT INTO `pear_project_auth_node` VALUES (3102, 1, 'project/account/edit');
INSERT INTO `pear_project_auth_node` VALUES (3103, 1, 'project/account/del');
INSERT INTO `pear_project_auth_node` VALUES (3104, 1, 'project/account/forbid');
INSERT INTO `pear_project_auth_node` VALUES (3105, 1, 'project/account/resume');
INSERT INTO `pear_project_auth_node` VALUES (3106, 1, 'project/auth');
INSERT INTO `pear_project_auth_node` VALUES (3107, 1, 'project/auth/index');
INSERT INTO `pear_project_auth_node` VALUES (3108, 1, 'project/auth/apply');
INSERT INTO `pear_project_auth_node` VALUES (3109, 1, 'project/auth/add');
INSERT INTO `pear_project_auth_node` VALUES (3110, 1, 'project/auth/edit');
INSERT INTO `pear_project_auth_node` VALUES (3111, 1, 'project/auth/forbid');
INSERT INTO `pear_project_auth_node` VALUES (3112, 1, 'project/auth/resume');
INSERT INTO `pear_project_auth_node` VALUES (3113, 1, 'project/auth/setdefault');
INSERT INTO `pear_project_auth_node` VALUES (3114, 1, 'project/auth/del');
INSERT INTO `pear_project_auth_node` VALUES (3115, 1, 'project/department');
INSERT INTO `pear_project_auth_node` VALUES (3116, 1, 'project/department/index');
INSERT INTO `pear_project_auth_node` VALUES (3117, 1, 'project/department/read');
INSERT INTO `pear_project_auth_node` VALUES (3118, 1, 'project/department/save');
INSERT INTO `pear_project_auth_node` VALUES (3119, 1, 'project/department/edit');
INSERT INTO `pear_project_auth_node` VALUES (3120, 1, 'project/department/delete');
INSERT INTO `pear_project_auth_node` VALUES (3121, 1, 'project/department_member');
INSERT INTO `pear_project_auth_node` VALUES (3122, 1, 'project/department_member/index');
INSERT INTO `pear_project_auth_node` VALUES (3123, 1, 'project/department_member/searchinvitemember');
INSERT INTO `pear_project_auth_node` VALUES (3124, 1, 'project/department_member/invitemember');
INSERT INTO `pear_project_auth_node` VALUES (3125, 1, 'project/department_member/removemember');
INSERT INTO `pear_project_auth_node` VALUES (3126, 1, 'project/index');
INSERT INTO `pear_project_auth_node` VALUES (3127, 1, 'project/index/index');
INSERT INTO `pear_project_auth_node` VALUES (3128, 1, 'project/index/changecurrentorganization');
INSERT INTO `pear_project_auth_node` VALUES (3129, 1, 'project/index/systemconfig');
INSERT INTO `pear_project_auth_node` VALUES (3130, 1, 'project/index/info');
INSERT INTO `pear_project_auth_node` VALUES (3131, 1, 'project/index/editpersonal');
INSERT INTO `pear_project_auth_node` VALUES (3132, 1, 'project/index/editpassword');
INSERT INTO `pear_project_auth_node` VALUES (3133, 1, 'project/index/uploadimg');
INSERT INTO `pear_project_auth_node` VALUES (3134, 1, 'project/index/uploadavatar');
INSERT INTO `pear_project_auth_node` VALUES (3135, 1, 'project/menu');
INSERT INTO `pear_project_auth_node` VALUES (3136, 1, 'project/menu/menu');
INSERT INTO `pear_project_auth_node` VALUES (3137, 1, 'project/menu/menuadd');
INSERT INTO `pear_project_auth_node` VALUES (3138, 1, 'project/menu/menuedit');
INSERT INTO `pear_project_auth_node` VALUES (3139, 1, 'project/menu/menuforbid');
INSERT INTO `pear_project_auth_node` VALUES (3140, 1, 'project/menu/menuresume');
INSERT INTO `pear_project_auth_node` VALUES (3141, 1, 'project/menu/menudel');
INSERT INTO `pear_project_auth_node` VALUES (3142, 1, 'project/node');
INSERT INTO `pear_project_auth_node` VALUES (3143, 1, 'project/node/index');
INSERT INTO `pear_project_auth_node` VALUES (3144, 1, 'project/node/alllist');
INSERT INTO `pear_project_auth_node` VALUES (3145, 1, 'project/node/clear');
INSERT INTO `pear_project_auth_node` VALUES (3146, 1, 'project/node/save');
INSERT INTO `pear_project_auth_node` VALUES (3147, 1, 'project/notify');
INSERT INTO `pear_project_auth_node` VALUES (3148, 1, 'project/notify/index');
INSERT INTO `pear_project_auth_node` VALUES (3149, 1, 'project/notify/noreads');
INSERT INTO `pear_project_auth_node` VALUES (3150, 1, 'project/notify/setreadied');
INSERT INTO `pear_project_auth_node` VALUES (3151, 1, 'project/notify/batchdel');
INSERT INTO `pear_project_auth_node` VALUES (3152, 1, 'project/notify/read');
INSERT INTO `pear_project_auth_node` VALUES (3153, 1, 'project/notify/delete');
INSERT INTO `pear_project_auth_node` VALUES (3154, 1, 'project/organization');
INSERT INTO `pear_project_auth_node` VALUES (3155, 1, 'project/organization/index');
INSERT INTO `pear_project_auth_node` VALUES (3156, 1, 'project/organization/save');
INSERT INTO `pear_project_auth_node` VALUES (3157, 1, 'project/organization/read');
INSERT INTO `pear_project_auth_node` VALUES (3158, 1, 'project/organization/edit');
INSERT INTO `pear_project_auth_node` VALUES (3159, 1, 'project/organization/delete');
INSERT INTO `pear_project_auth_node` VALUES (3160, 1, 'project/project');
INSERT INTO `pear_project_auth_node` VALUES (3161, 1, 'project/project/index');
INSERT INTO `pear_project_auth_node` VALUES (3162, 1, 'project/project/selflist');
INSERT INTO `pear_project_auth_node` VALUES (3163, 1, 'project/project/save');
INSERT INTO `pear_project_auth_node` VALUES (3164, 1, 'project/project/read');
INSERT INTO `pear_project_auth_node` VALUES (3165, 1, 'project/project/edit');
INSERT INTO `pear_project_auth_node` VALUES (3166, 1, 'project/project/uploadcover');
INSERT INTO `pear_project_auth_node` VALUES (3167, 1, 'project/project/recycle');
INSERT INTO `pear_project_auth_node` VALUES (3168, 1, 'project/project/recovery');
INSERT INTO `pear_project_auth_node` VALUES (3169, 1, 'project/project/archive');
INSERT INTO `pear_project_auth_node` VALUES (3170, 1, 'project/project/recoveryarchive');
INSERT INTO `pear_project_auth_node` VALUES (3171, 1, 'project/project/quit');
INSERT INTO `pear_project_auth_node` VALUES (3172, 1, 'project/project_collect');
INSERT INTO `pear_project_auth_node` VALUES (3173, 1, 'project/project_collect/collect');
INSERT INTO `pear_project_auth_node` VALUES (3174, 1, 'project/project_member');
INSERT INTO `pear_project_auth_node` VALUES (3175, 1, 'project/project_member/index');
INSERT INTO `pear_project_auth_node` VALUES (3176, 1, 'project/project_member/searchinvitemember');
INSERT INTO `pear_project_auth_node` VALUES (3177, 1, 'project/project_member/invitemember');
INSERT INTO `pear_project_auth_node` VALUES (3178, 1, 'project/project_template');
INSERT INTO `pear_project_auth_node` VALUES (3179, 1, 'project/project_template/index');
INSERT INTO `pear_project_auth_node` VALUES (3180, 1, 'project/project_template/save');
INSERT INTO `pear_project_auth_node` VALUES (3181, 1, 'project/project_template/uploadcover');
INSERT INTO `pear_project_auth_node` VALUES (3182, 1, 'project/project_template/edit');
INSERT INTO `pear_project_auth_node` VALUES (3183, 1, 'project/project_template/delete');
INSERT INTO `pear_project_auth_node` VALUES (3184, 1, 'project/task');
INSERT INTO `pear_project_auth_node` VALUES (3185, 1, 'project/task/index');
INSERT INTO `pear_project_auth_node` VALUES (3186, 1, 'project/task/selflist');
INSERT INTO `pear_project_auth_node` VALUES (3187, 1, 'project/task/read');
INSERT INTO `pear_project_auth_node` VALUES (3188, 1, 'project/task/save');
INSERT INTO `pear_project_auth_node` VALUES (3189, 1, 'project/task/taskdone');
INSERT INTO `pear_project_auth_node` VALUES (3190, 1, 'project/task/assigntask');
INSERT INTO `pear_project_auth_node` VALUES (3191, 1, 'project/task/sort');
INSERT INTO `pear_project_auth_node` VALUES (3192, 1, 'project/task/createcomment');
INSERT INTO `pear_project_auth_node` VALUES (3193, 1, 'project/task/edit');
INSERT INTO `pear_project_auth_node` VALUES (3194, 1, 'project/task/like');
INSERT INTO `pear_project_auth_node` VALUES (3195, 1, 'project/task/star');
INSERT INTO `pear_project_auth_node` VALUES (3196, 1, 'project/task/recycle');
INSERT INTO `pear_project_auth_node` VALUES (3197, 1, 'project/task/recovery');
INSERT INTO `pear_project_auth_node` VALUES (3198, 1, 'project/task/delete');
INSERT INTO `pear_project_auth_node` VALUES (3199, 1, 'project/task_log');
INSERT INTO `pear_project_auth_node` VALUES (3200, 1, 'project/task_log/index');
INSERT INTO `pear_project_auth_node` VALUES (3201, 1, 'project/task_log/getlistbyselfproject');
INSERT INTO `pear_project_auth_node` VALUES (3202, 1, 'project/task_member');
INSERT INTO `pear_project_auth_node` VALUES (3203, 1, 'project/task_member/index');
INSERT INTO `pear_project_auth_node` VALUES (3204, 1, 'project/task_member/searchinvitemember');
INSERT INTO `pear_project_auth_node` VALUES (3205, 1, 'project/task_member/invitemember');
INSERT INTO `pear_project_auth_node` VALUES (3206, 1, 'project/task_member/invitememberbatch');
INSERT INTO `pear_project_auth_node` VALUES (3207, 1, 'project/task_stages');
INSERT INTO `pear_project_auth_node` VALUES (3208, 1, 'project/task_stages/index');
INSERT INTO `pear_project_auth_node` VALUES (3209, 1, 'project/task_stages/tasks');
INSERT INTO `pear_project_auth_node` VALUES (3210, 1, 'project/task_stages/sort');
INSERT INTO `pear_project_auth_node` VALUES (3211, 1, 'project/task_stages/save');
INSERT INTO `pear_project_auth_node` VALUES (3212, 1, 'project/task_stages/edit');
INSERT INTO `pear_project_auth_node` VALUES (3213, 1, 'project/task_stages/delete');
INSERT INTO `pear_project_auth_node` VALUES (3214, 1, 'project/task_stages_template');
INSERT INTO `pear_project_auth_node` VALUES (3215, 1, 'project/task_stages_template/index');
INSERT INTO `pear_project_auth_node` VALUES (3216, 1, 'project/task_stages_template/save');
INSERT INTO `pear_project_auth_node` VALUES (3217, 1, 'project/task_stages_template/edit');
INSERT INTO `pear_project_auth_node` VALUES (3218, 1, 'project/task_stages_template/delete');
INSERT INTO `pear_project_auth_node` VALUES (3219, 2, 'project/account/index');
INSERT INTO `pear_project_auth_node` VALUES (3220, 2, 'project/auth/index');
INSERT INTO `pear_project_auth_node` VALUES (3221, 2, 'project/index/index');
INSERT INTO `pear_project_auth_node` VALUES (3222, 2, 'project/index');
INSERT INTO `pear_project_auth_node` VALUES (3223, 2, 'project/index/changecurrentorganization');
INSERT INTO `pear_project_auth_node` VALUES (3224, 2, 'project/index/systemconfig');
INSERT INTO `pear_project_auth_node` VALUES (3225, 2, 'project/index/info');
INSERT INTO `pear_project_auth_node` VALUES (3226, 2, 'project/index/editpersonal');
INSERT INTO `pear_project_auth_node` VALUES (3227, 2, 'project/index/editpassword');
INSERT INTO `pear_project_auth_node` VALUES (3228, 2, 'project/index/uploadimg');
INSERT INTO `pear_project_auth_node` VALUES (3229, 2, 'project/index/uploadavatar');
INSERT INTO `pear_project_auth_node` VALUES (3230, 2, 'project/menu/menu');
INSERT INTO `pear_project_auth_node` VALUES (3231, 2, 'project/node/index');
INSERT INTO `pear_project_auth_node` VALUES (3232, 2, 'project/node/alllist');
INSERT INTO `pear_project_auth_node` VALUES (3233, 2, 'project/notify/index');
INSERT INTO `pear_project_auth_node` VALUES (3234, 2, 'project/notify');
INSERT INTO `pear_project_auth_node` VALUES (3235, 2, 'project/notify/noreads');
INSERT INTO `pear_project_auth_node` VALUES (3236, 2, 'project/notify/setreadied');
INSERT INTO `pear_project_auth_node` VALUES (3237, 2, 'project/notify/batchdel');
INSERT INTO `pear_project_auth_node` VALUES (3238, 2, 'project/notify/read');
INSERT INTO `pear_project_auth_node` VALUES (3239, 2, 'project/notify/delete');
INSERT INTO `pear_project_auth_node` VALUES (3240, 2, 'project/organization/index');
INSERT INTO `pear_project_auth_node` VALUES (3241, 2, 'project/organization');
INSERT INTO `pear_project_auth_node` VALUES (3242, 2, 'project/organization/save');
INSERT INTO `pear_project_auth_node` VALUES (3243, 2, 'project/organization/read');
INSERT INTO `pear_project_auth_node` VALUES (3244, 2, 'project/organization/edit');
INSERT INTO `pear_project_auth_node` VALUES (3245, 2, 'project/organization/delete');
INSERT INTO `pear_project_auth_node` VALUES (3246, 2, 'project/project/index');
INSERT INTO `pear_project_auth_node` VALUES (3247, 2, 'project/project/read');
INSERT INTO `pear_project_auth_node` VALUES (3248, 2, 'project/project_collect/collect');
INSERT INTO `pear_project_auth_node` VALUES (3249, 2, 'project/project_collect');
INSERT INTO `pear_project_auth_node` VALUES (3250, 2, 'project/project_member/index');
INSERT INTO `pear_project_auth_node` VALUES (3251, 2, 'project/project_template/index');
INSERT INTO `pear_project_auth_node` VALUES (3252, 2, 'project/task/index');
INSERT INTO `pear_project_auth_node` VALUES (3253, 2, 'project/task/read');
INSERT INTO `pear_project_auth_node` VALUES (3254, 2, 'project/task/save');
INSERT INTO `pear_project_auth_node` VALUES (3255, 2, 'project/task/taskdone');
INSERT INTO `pear_project_auth_node` VALUES (3256, 2, 'project/task/assigntask');
INSERT INTO `pear_project_auth_node` VALUES (3257, 2, 'project/task/sort');
INSERT INTO `pear_project_auth_node` VALUES (3258, 2, 'project/task/createcomment');
INSERT INTO `pear_project_auth_node` VALUES (3259, 2, 'project/task/like');
INSERT INTO `pear_project_auth_node` VALUES (3260, 2, 'project/task/star');
INSERT INTO `pear_project_auth_node` VALUES (3261, 2, 'project/task_log/index');
INSERT INTO `pear_project_auth_node` VALUES (3262, 2, 'project/task_log');
INSERT INTO `pear_project_auth_node` VALUES (3263, 2, 'project/task_log/getlistbyselfproject');
INSERT INTO `pear_project_auth_node` VALUES (3264, 2, 'project/task_member/index');
INSERT INTO `pear_project_auth_node` VALUES (3265, 2, 'project/task_member/searchinvitemember');
INSERT INTO `pear_project_auth_node` VALUES (3266, 2, 'project/task_stages/index');
INSERT INTO `pear_project_auth_node` VALUES (3267, 2, 'project/task_stages/tasks');
INSERT INTO `pear_project_auth_node` VALUES (3268, 2, 'project/task_stages/sort');
INSERT INTO `pear_project_auth_node` VALUES (3269, 2, 'project/task_stages_template/index');
INSERT INTO `pear_project_auth_node` VALUES (3270, 2, 'project/department/index');
INSERT INTO `pear_project_auth_node` VALUES (3271, 2, 'project/department/read');
INSERT INTO `pear_project_auth_node` VALUES (3272, 2, 'project/department_member/index');
INSERT INTO `pear_project_auth_node` VALUES (3273, 2, 'project/department_member/searchinvitemember');
INSERT INTO `pear_project_auth_node` VALUES (3274, 2, 'project/project/selflist');
INSERT INTO `pear_project_auth_node` VALUES (3275, 2, 'project/project/save');
INSERT INTO `pear_project_auth_node` VALUES (3276, 2, 'project/task/selflist');
INSERT INTO `pear_project_auth_node` VALUES (3636, 6, 'project');
INSERT INTO `pear_project_auth_node` VALUES (3637, 6, 'project/account');
INSERT INTO `pear_project_auth_node` VALUES (3638, 6, 'project/account/index');
INSERT INTO `pear_project_auth_node` VALUES (3639, 6, 'project/account/auth');
INSERT INTO `pear_project_auth_node` VALUES (3640, 6, 'project/account/add');
INSERT INTO `pear_project_auth_node` VALUES (3641, 6, 'project/account/edit');
INSERT INTO `pear_project_auth_node` VALUES (3642, 6, 'project/account/del');
INSERT INTO `pear_project_auth_node` VALUES (3643, 6, 'project/account/forbid');
INSERT INTO `pear_project_auth_node` VALUES (3644, 6, 'project/account/resume');
INSERT INTO `pear_project_auth_node` VALUES (3645, 6, 'project/auth');
INSERT INTO `pear_project_auth_node` VALUES (3646, 6, 'project/auth/index');
INSERT INTO `pear_project_auth_node` VALUES (3647, 6, 'project/auth/apply');
INSERT INTO `pear_project_auth_node` VALUES (3648, 6, 'project/auth/add');
INSERT INTO `pear_project_auth_node` VALUES (3649, 6, 'project/auth/edit');
INSERT INTO `pear_project_auth_node` VALUES (3650, 6, 'project/auth/forbid');
INSERT INTO `pear_project_auth_node` VALUES (3651, 6, 'project/auth/resume');
INSERT INTO `pear_project_auth_node` VALUES (3652, 6, 'project/auth/setdefault');
INSERT INTO `pear_project_auth_node` VALUES (3653, 6, 'project/auth/del');
INSERT INTO `pear_project_auth_node` VALUES (3654, 6, 'project/department');
INSERT INTO `pear_project_auth_node` VALUES (3655, 6, 'project/department/index');
INSERT INTO `pear_project_auth_node` VALUES (3656, 6, 'project/department/read');
INSERT INTO `pear_project_auth_node` VALUES (3657, 6, 'project/department/save');
INSERT INTO `pear_project_auth_node` VALUES (3658, 6, 'project/department/edit');
INSERT INTO `pear_project_auth_node` VALUES (3659, 6, 'project/department/delete');
INSERT INTO `pear_project_auth_node` VALUES (3660, 6, 'project/department_member');
INSERT INTO `pear_project_auth_node` VALUES (3661, 6, 'project/department_member/index');
INSERT INTO `pear_project_auth_node` VALUES (3662, 6, 'project/department_member/searchinvitemember');
INSERT INTO `pear_project_auth_node` VALUES (3663, 6, 'project/department_member/invitemember');
INSERT INTO `pear_project_auth_node` VALUES (3664, 6, 'project/department_member/removemember');
INSERT INTO `pear_project_auth_node` VALUES (3665, 6, 'project/index');
INSERT INTO `pear_project_auth_node` VALUES (3666, 6, 'project/index/index');
INSERT INTO `pear_project_auth_node` VALUES (3667, 6, 'project/index/changecurrentorganization');
INSERT INTO `pear_project_auth_node` VALUES (3668, 6, 'project/index/systemconfig');
INSERT INTO `pear_project_auth_node` VALUES (3669, 6, 'project/index/info');
INSERT INTO `pear_project_auth_node` VALUES (3670, 6, 'project/index/editpersonal');
INSERT INTO `pear_project_auth_node` VALUES (3671, 6, 'project/index/editpassword');
INSERT INTO `pear_project_auth_node` VALUES (3672, 6, 'project/index/uploadimg');
INSERT INTO `pear_project_auth_node` VALUES (3673, 6, 'project/index/uploadavatar');
INSERT INTO `pear_project_auth_node` VALUES (3674, 6, 'project/menu');
INSERT INTO `pear_project_auth_node` VALUES (3675, 6, 'project/menu/menu');
INSERT INTO `pear_project_auth_node` VALUES (3676, 6, 'project/menu/menuadd');
INSERT INTO `pear_project_auth_node` VALUES (3677, 6, 'project/menu/menuedit');
INSERT INTO `pear_project_auth_node` VALUES (3678, 6, 'project/menu/menuforbid');
INSERT INTO `pear_project_auth_node` VALUES (3679, 6, 'project/menu/menuresume');
INSERT INTO `pear_project_auth_node` VALUES (3680, 6, 'project/menu/menudel');
INSERT INTO `pear_project_auth_node` VALUES (3681, 6, 'project/node');
INSERT INTO `pear_project_auth_node` VALUES (3682, 6, 'project/node/index');
INSERT INTO `pear_project_auth_node` VALUES (3683, 6, 'project/node/alllist');
INSERT INTO `pear_project_auth_node` VALUES (3684, 6, 'project/node/clear');
INSERT INTO `pear_project_auth_node` VALUES (3685, 6, 'project/node/save');
INSERT INTO `pear_project_auth_node` VALUES (3686, 6, 'project/notify');
INSERT INTO `pear_project_auth_node` VALUES (3687, 6, 'project/notify/index');
INSERT INTO `pear_project_auth_node` VALUES (3688, 6, 'project/notify/noreads');
INSERT INTO `pear_project_auth_node` VALUES (3689, 6, 'project/notify/setreadied');
INSERT INTO `pear_project_auth_node` VALUES (3690, 6, 'project/notify/batchdel');
INSERT INTO `pear_project_auth_node` VALUES (3691, 6, 'project/notify/read');
INSERT INTO `pear_project_auth_node` VALUES (3692, 6, 'project/notify/delete');
INSERT INTO `pear_project_auth_node` VALUES (3693, 6, 'project/organization');
INSERT INTO `pear_project_auth_node` VALUES (3694, 6, 'project/organization/index');
INSERT INTO `pear_project_auth_node` VALUES (3695, 6, 'project/organization/save');
INSERT INTO `pear_project_auth_node` VALUES (3696, 6, 'project/organization/read');
INSERT INTO `pear_project_auth_node` VALUES (3697, 6, 'project/organization/edit');
INSERT INTO `pear_project_auth_node` VALUES (3698, 6, 'project/organization/delete');
INSERT INTO `pear_project_auth_node` VALUES (3699, 6, 'project/project');
INSERT INTO `pear_project_auth_node` VALUES (3700, 6, 'project/project/index');
INSERT INTO `pear_project_auth_node` VALUES (3701, 6, 'project/project/selflist');
INSERT INTO `pear_project_auth_node` VALUES (3702, 6, 'project/project/save');
INSERT INTO `pear_project_auth_node` VALUES (3703, 6, 'project/project/read');
INSERT INTO `pear_project_auth_node` VALUES (3704, 6, 'project/project/edit');
INSERT INTO `pear_project_auth_node` VALUES (3705, 6, 'project/project/uploadcover');
INSERT INTO `pear_project_auth_node` VALUES (3706, 6, 'project/project/recycle');
INSERT INTO `pear_project_auth_node` VALUES (3707, 6, 'project/project/recovery');
INSERT INTO `pear_project_auth_node` VALUES (3708, 6, 'project/project/archive');
INSERT INTO `pear_project_auth_node` VALUES (3709, 6, 'project/project/recoveryarchive');
INSERT INTO `pear_project_auth_node` VALUES (3710, 6, 'project/project/quit');
INSERT INTO `pear_project_auth_node` VALUES (3711, 6, 'project/project_collect');
INSERT INTO `pear_project_auth_node` VALUES (3712, 6, 'project/project_collect/collect');
INSERT INTO `pear_project_auth_node` VALUES (3713, 6, 'project/project_member');
INSERT INTO `pear_project_auth_node` VALUES (3714, 6, 'project/project_member/index');
INSERT INTO `pear_project_auth_node` VALUES (3715, 6, 'project/project_member/searchinvitemember');
INSERT INTO `pear_project_auth_node` VALUES (3716, 6, 'project/project_member/invitemember');
INSERT INTO `pear_project_auth_node` VALUES (3717, 6, 'project/project_template');
INSERT INTO `pear_project_auth_node` VALUES (3718, 6, 'project/project_template/index');
INSERT INTO `pear_project_auth_node` VALUES (3719, 6, 'project/project_template/save');
INSERT INTO `pear_project_auth_node` VALUES (3720, 6, 'project/project_template/uploadcover');
INSERT INTO `pear_project_auth_node` VALUES (3721, 6, 'project/project_template/edit');
INSERT INTO `pear_project_auth_node` VALUES (3722, 6, 'project/project_template/delete');
INSERT INTO `pear_project_auth_node` VALUES (3723, 6, 'project/task');
INSERT INTO `pear_project_auth_node` VALUES (3724, 6, 'project/task/index');
INSERT INTO `pear_project_auth_node` VALUES (3725, 6, 'project/task/selflist');
INSERT INTO `pear_project_auth_node` VALUES (3726, 6, 'project/task/read');
INSERT INTO `pear_project_auth_node` VALUES (3727, 6, 'project/task/save');
INSERT INTO `pear_project_auth_node` VALUES (3728, 6, 'project/task/taskdone');
INSERT INTO `pear_project_auth_node` VALUES (3729, 6, 'project/task/assigntask');
INSERT INTO `pear_project_auth_node` VALUES (3730, 6, 'project/task/sort');
INSERT INTO `pear_project_auth_node` VALUES (3731, 6, 'project/task/createcomment');
INSERT INTO `pear_project_auth_node` VALUES (3732, 6, 'project/task/edit');
INSERT INTO `pear_project_auth_node` VALUES (3733, 6, 'project/task/like');
INSERT INTO `pear_project_auth_node` VALUES (3734, 6, 'project/task/star');
INSERT INTO `pear_project_auth_node` VALUES (3735, 6, 'project/task/recycle');
INSERT INTO `pear_project_auth_node` VALUES (3736, 6, 'project/task/recovery');
INSERT INTO `pear_project_auth_node` VALUES (3737, 6, 'project/task/delete');
INSERT INTO `pear_project_auth_node` VALUES (3738, 6, 'project/task_log');
INSERT INTO `pear_project_auth_node` VALUES (3739, 6, 'project/task_log/index');
INSERT INTO `pear_project_auth_node` VALUES (3740, 6, 'project/task_log/getlistbyselfproject');
INSERT INTO `pear_project_auth_node` VALUES (3741, 6, 'project/task_member');
INSERT INTO `pear_project_auth_node` VALUES (3742, 6, 'project/task_member/index');
INSERT INTO `pear_project_auth_node` VALUES (3743, 6, 'project/task_member/searchinvitemember');
INSERT INTO `pear_project_auth_node` VALUES (3744, 6, 'project/task_member/invitemember');
INSERT INTO `pear_project_auth_node` VALUES (3745, 6, 'project/task_member/invitememberbatch');
INSERT INTO `pear_project_auth_node` VALUES (3746, 6, 'project/task_stages');
INSERT INTO `pear_project_auth_node` VALUES (3747, 6, 'project/task_stages/index');
INSERT INTO `pear_project_auth_node` VALUES (3748, 6, 'project/task_stages/tasks');
INSERT INTO `pear_project_auth_node` VALUES (3749, 6, 'project/task_stages/sort');
INSERT INTO `pear_project_auth_node` VALUES (3750, 6, 'project/task_stages/save');
INSERT INTO `pear_project_auth_node` VALUES (3751, 6, 'project/task_stages/edit');
INSERT INTO `pear_project_auth_node` VALUES (3752, 6, 'project/task_stages/delete');
INSERT INTO `pear_project_auth_node` VALUES (3753, 6, 'project/task_stages_template');
INSERT INTO `pear_project_auth_node` VALUES (3754, 6, 'project/task_stages_template/index');
INSERT INTO `pear_project_auth_node` VALUES (3755, 6, 'project/task_stages_template/save');
INSERT INTO `pear_project_auth_node` VALUES (3756, 6, 'project/task_stages_template/edit');
INSERT INTO `pear_project_auth_node` VALUES (3757, 6, 'project/task_stages_template/delete');
INSERT INTO `pear_project_auth_node` VALUES (3758, 7, 'project/account/index');
INSERT INTO `pear_project_auth_node` VALUES (3759, 7, 'project/auth/index');
INSERT INTO `pear_project_auth_node` VALUES (3760, 7, 'project/index/index');
INSERT INTO `pear_project_auth_node` VALUES (3761, 7, 'project/index');
INSERT INTO `pear_project_auth_node` VALUES (3762, 7, 'project/index/changecurrentorganization');
INSERT INTO `pear_project_auth_node` VALUES (3763, 7, 'project/index/systemconfig');
INSERT INTO `pear_project_auth_node` VALUES (3764, 7, 'project/index/info');
INSERT INTO `pear_project_auth_node` VALUES (3765, 7, 'project/index/editpersonal');
INSERT INTO `pear_project_auth_node` VALUES (3766, 7, 'project/index/editpassword');
INSERT INTO `pear_project_auth_node` VALUES (3767, 7, 'project/index/uploadimg');
INSERT INTO `pear_project_auth_node` VALUES (3768, 7, 'project/index/uploadavatar');
INSERT INTO `pear_project_auth_node` VALUES (3769, 7, 'project/menu/menu');
INSERT INTO `pear_project_auth_node` VALUES (3770, 7, 'project/node/index');
INSERT INTO `pear_project_auth_node` VALUES (3771, 7, 'project/node/alllist');
INSERT INTO `pear_project_auth_node` VALUES (3772, 7, 'project/notify/index');
INSERT INTO `pear_project_auth_node` VALUES (3773, 7, 'project/notify');
INSERT INTO `pear_project_auth_node` VALUES (3774, 7, 'project/notify/noreads');
INSERT INTO `pear_project_auth_node` VALUES (3775, 7, 'project/notify/setreadied');
INSERT INTO `pear_project_auth_node` VALUES (3776, 7, 'project/notify/batchdel');
INSERT INTO `pear_project_auth_node` VALUES (3777, 7, 'project/notify/read');
INSERT INTO `pear_project_auth_node` VALUES (3778, 7, 'project/notify/delete');
INSERT INTO `pear_project_auth_node` VALUES (3779, 7, 'project/organization/index');
INSERT INTO `pear_project_auth_node` VALUES (3780, 7, 'project/organization');
INSERT INTO `pear_project_auth_node` VALUES (3781, 7, 'project/organization/save');
INSERT INTO `pear_project_auth_node` VALUES (3782, 7, 'project/organization/read');
INSERT INTO `pear_project_auth_node` VALUES (3783, 7, 'project/organization/edit');
INSERT INTO `pear_project_auth_node` VALUES (3784, 7, 'project/organization/delete');
INSERT INTO `pear_project_auth_node` VALUES (3785, 7, 'project/project/index');
INSERT INTO `pear_project_auth_node` VALUES (3786, 7, 'project/project/read');
INSERT INTO `pear_project_auth_node` VALUES (3787, 7, 'project/project_collect/collect');
INSERT INTO `pear_project_auth_node` VALUES (3788, 7, 'project/project_collect');
INSERT INTO `pear_project_auth_node` VALUES (3789, 7, 'project/project_member/index');
INSERT INTO `pear_project_auth_node` VALUES (3790, 7, 'project/project_template/index');
INSERT INTO `pear_project_auth_node` VALUES (3791, 7, 'project/task/index');
INSERT INTO `pear_project_auth_node` VALUES (3792, 7, 'project/task/read');
INSERT INTO `pear_project_auth_node` VALUES (3793, 7, 'project/task/save');
INSERT INTO `pear_project_auth_node` VALUES (3794, 7, 'project/task/taskdone');
INSERT INTO `pear_project_auth_node` VALUES (3795, 7, 'project/task/assigntask');
INSERT INTO `pear_project_auth_node` VALUES (3796, 7, 'project/task/sort');
INSERT INTO `pear_project_auth_node` VALUES (3797, 7, 'project/task/createcomment');
INSERT INTO `pear_project_auth_node` VALUES (3798, 7, 'project/task/like');
INSERT INTO `pear_project_auth_node` VALUES (3799, 7, 'project/task/star');
INSERT INTO `pear_project_auth_node` VALUES (3800, 7, 'project/task_log/index');
INSERT INTO `pear_project_auth_node` VALUES (3801, 7, 'project/task_log');
INSERT INTO `pear_project_auth_node` VALUES (3802, 7, 'project/task_log/getlistbyselfproject');
INSERT INTO `pear_project_auth_node` VALUES (3803, 7, 'project/task_member/index');
INSERT INTO `pear_project_auth_node` VALUES (3804, 7, 'project/task_member/searchinvitemember');
INSERT INTO `pear_project_auth_node` VALUES (3805, 7, 'project/task_stages/index');
INSERT INTO `pear_project_auth_node` VALUES (3806, 7, 'project/task_stages/tasks');
INSERT INTO `pear_project_auth_node` VALUES (3807, 7, 'project/task_stages/sort');
INSERT INTO `pear_project_auth_node` VALUES (3808, 7, 'project/task_stages_template/index');
INSERT INTO `pear_project_auth_node` VALUES (3809, 7, 'project/department/index');
INSERT INTO `pear_project_auth_node` VALUES (3810, 7, 'project/department/read');
INSERT INTO `pear_project_auth_node` VALUES (3811, 7, 'project/department_member/index');
INSERT INTO `pear_project_auth_node` VALUES (3812, 7, 'project/department_member/searchinvitemember');
INSERT INTO `pear_project_auth_node` VALUES (3813, 7, 'project/project/selflist');
INSERT INTO `pear_project_auth_node` VALUES (3814, 7, 'project/project/save');
INSERT INTO `pear_project_auth_node` VALUES (3815, 7, 'project/task/selflist');
INSERT INTO `pear_project_auth_node` VALUES (3816, 8, 'project');
INSERT INTO `pear_project_auth_node` VALUES (3817, 8, 'project/account');
INSERT INTO `pear_project_auth_node` VALUES (3818, 8, 'project/account/index');
INSERT INTO `pear_project_auth_node` VALUES (3819, 8, 'project/account/auth');
INSERT INTO `pear_project_auth_node` VALUES (3820, 8, 'project/account/add');
INSERT INTO `pear_project_auth_node` VALUES (3821, 8, 'project/account/edit');
INSERT INTO `pear_project_auth_node` VALUES (3822, 8, 'project/account/del');
INSERT INTO `pear_project_auth_node` VALUES (3823, 8, 'project/account/forbid');
INSERT INTO `pear_project_auth_node` VALUES (3824, 8, 'project/account/resume');
INSERT INTO `pear_project_auth_node` VALUES (3825, 8, 'project/auth');
INSERT INTO `pear_project_auth_node` VALUES (3826, 8, 'project/auth/index');
INSERT INTO `pear_project_auth_node` VALUES (3827, 8, 'project/auth/apply');
INSERT INTO `pear_project_auth_node` VALUES (3828, 8, 'project/auth/add');
INSERT INTO `pear_project_auth_node` VALUES (3829, 8, 'project/auth/edit');
INSERT INTO `pear_project_auth_node` VALUES (3830, 8, 'project/auth/forbid');
INSERT INTO `pear_project_auth_node` VALUES (3831, 8, 'project/auth/resume');
INSERT INTO `pear_project_auth_node` VALUES (3832, 8, 'project/auth/setdefault');
INSERT INTO `pear_project_auth_node` VALUES (3833, 8, 'project/auth/del');
INSERT INTO `pear_project_auth_node` VALUES (3834, 8, 'project/department');
INSERT INTO `pear_project_auth_node` VALUES (3835, 8, 'project/department/index');
INSERT INTO `pear_project_auth_node` VALUES (3836, 8, 'project/department/read');
INSERT INTO `pear_project_auth_node` VALUES (3837, 8, 'project/department/save');
INSERT INTO `pear_project_auth_node` VALUES (3838, 8, 'project/department/edit');
INSERT INTO `pear_project_auth_node` VALUES (3839, 8, 'project/department/delete');
INSERT INTO `pear_project_auth_node` VALUES (3840, 8, 'project/department_member');
INSERT INTO `pear_project_auth_node` VALUES (3841, 8, 'project/department_member/index');
INSERT INTO `pear_project_auth_node` VALUES (3842, 8, 'project/department_member/searchinvitemember');
INSERT INTO `pear_project_auth_node` VALUES (3843, 8, 'project/department_member/invitemember');
INSERT INTO `pear_project_auth_node` VALUES (3844, 8, 'project/department_member/removemember');
INSERT INTO `pear_project_auth_node` VALUES (3845, 8, 'project/index');
INSERT INTO `pear_project_auth_node` VALUES (3846, 8, 'project/index/index');
INSERT INTO `pear_project_auth_node` VALUES (3847, 8, 'project/index/changecurrentorganization');
INSERT INTO `pear_project_auth_node` VALUES (3848, 8, 'project/index/systemconfig');
INSERT INTO `pear_project_auth_node` VALUES (3849, 8, 'project/index/info');
INSERT INTO `pear_project_auth_node` VALUES (3850, 8, 'project/index/editpersonal');
INSERT INTO `pear_project_auth_node` VALUES (3851, 8, 'project/index/editpassword');
INSERT INTO `pear_project_auth_node` VALUES (3852, 8, 'project/index/uploadimg');
INSERT INTO `pear_project_auth_node` VALUES (3853, 8, 'project/index/uploadavatar');
INSERT INTO `pear_project_auth_node` VALUES (3854, 8, 'project/menu');
INSERT INTO `pear_project_auth_node` VALUES (3855, 8, 'project/menu/menu');
INSERT INTO `pear_project_auth_node` VALUES (3856, 8, 'project/menu/menuadd');
INSERT INTO `pear_project_auth_node` VALUES (3857, 8, 'project/menu/menuedit');
INSERT INTO `pear_project_auth_node` VALUES (3858, 8, 'project/menu/menuforbid');
INSERT INTO `pear_project_auth_node` VALUES (3859, 8, 'project/menu/menuresume');
INSERT INTO `pear_project_auth_node` VALUES (3860, 8, 'project/menu/menudel');
INSERT INTO `pear_project_auth_node` VALUES (3861, 8, 'project/node');
INSERT INTO `pear_project_auth_node` VALUES (3862, 8, 'project/node/index');
INSERT INTO `pear_project_auth_node` VALUES (3863, 8, 'project/node/alllist');
INSERT INTO `pear_project_auth_node` VALUES (3864, 8, 'project/node/clear');
INSERT INTO `pear_project_auth_node` VALUES (3865, 8, 'project/node/save');
INSERT INTO `pear_project_auth_node` VALUES (3866, 8, 'project/notify');
INSERT INTO `pear_project_auth_node` VALUES (3867, 8, 'project/notify/index');
INSERT INTO `pear_project_auth_node` VALUES (3868, 8, 'project/notify/noreads');
INSERT INTO `pear_project_auth_node` VALUES (3869, 8, 'project/notify/setreadied');
INSERT INTO `pear_project_auth_node` VALUES (3870, 8, 'project/notify/batchdel');
INSERT INTO `pear_project_auth_node` VALUES (3871, 8, 'project/notify/read');
INSERT INTO `pear_project_auth_node` VALUES (3872, 8, 'project/notify/delete');
INSERT INTO `pear_project_auth_node` VALUES (3873, 8, 'project/organization');
INSERT INTO `pear_project_auth_node` VALUES (3874, 8, 'project/organization/index');
INSERT INTO `pear_project_auth_node` VALUES (3875, 8, 'project/organization/save');
INSERT INTO `pear_project_auth_node` VALUES (3876, 8, 'project/organization/read');
INSERT INTO `pear_project_auth_node` VALUES (3877, 8, 'project/organization/edit');
INSERT INTO `pear_project_auth_node` VALUES (3878, 8, 'project/organization/delete');
INSERT INTO `pear_project_auth_node` VALUES (3879, 8, 'project/project');
INSERT INTO `pear_project_auth_node` VALUES (3880, 8, 'project/project/index');
INSERT INTO `pear_project_auth_node` VALUES (3881, 8, 'project/project/selflist');
INSERT INTO `pear_project_auth_node` VALUES (3882, 8, 'project/project/save');
INSERT INTO `pear_project_auth_node` VALUES (3883, 8, 'project/project/read');
INSERT INTO `pear_project_auth_node` VALUES (3884, 8, 'project/project/edit');
INSERT INTO `pear_project_auth_node` VALUES (3885, 8, 'project/project/uploadcover');
INSERT INTO `pear_project_auth_node` VALUES (3886, 8, 'project/project/recycle');
INSERT INTO `pear_project_auth_node` VALUES (3887, 8, 'project/project/recovery');
INSERT INTO `pear_project_auth_node` VALUES (3888, 8, 'project/project/archive');
INSERT INTO `pear_project_auth_node` VALUES (3889, 8, 'project/project/recoveryarchive');
INSERT INTO `pear_project_auth_node` VALUES (3890, 8, 'project/project/quit');
INSERT INTO `pear_project_auth_node` VALUES (3891, 8, 'project/project_collect');
INSERT INTO `pear_project_auth_node` VALUES (3892, 8, 'project/project_collect/collect');
INSERT INTO `pear_project_auth_node` VALUES (3893, 8, 'project/project_member');
INSERT INTO `pear_project_auth_node` VALUES (3894, 8, 'project/project_member/index');
INSERT INTO `pear_project_auth_node` VALUES (3895, 8, 'project/project_member/searchinvitemember');
INSERT INTO `pear_project_auth_node` VALUES (3896, 8, 'project/project_member/invitemember');
INSERT INTO `pear_project_auth_node` VALUES (3897, 8, 'project/project_template');
INSERT INTO `pear_project_auth_node` VALUES (3898, 8, 'project/project_template/index');
INSERT INTO `pear_project_auth_node` VALUES (3899, 8, 'project/project_template/save');
INSERT INTO `pear_project_auth_node` VALUES (3900, 8, 'project/project_template/uploadcover');
INSERT INTO `pear_project_auth_node` VALUES (3901, 8, 'project/project_template/edit');
INSERT INTO `pear_project_auth_node` VALUES (3902, 8, 'project/project_template/delete');
INSERT INTO `pear_project_auth_node` VALUES (3903, 8, 'project/task');
INSERT INTO `pear_project_auth_node` VALUES (3904, 8, 'project/task/index');
INSERT INTO `pear_project_auth_node` VALUES (3905, 8, 'project/task/selflist');
INSERT INTO `pear_project_auth_node` VALUES (3906, 8, 'project/task/read');
INSERT INTO `pear_project_auth_node` VALUES (3907, 8, 'project/task/save');
INSERT INTO `pear_project_auth_node` VALUES (3908, 8, 'project/task/taskdone');
INSERT INTO `pear_project_auth_node` VALUES (3909, 8, 'project/task/assigntask');
INSERT INTO `pear_project_auth_node` VALUES (3910, 8, 'project/task/sort');
INSERT INTO `pear_project_auth_node` VALUES (3911, 8, 'project/task/createcomment');
INSERT INTO `pear_project_auth_node` VALUES (3912, 8, 'project/task/edit');
INSERT INTO `pear_project_auth_node` VALUES (3913, 8, 'project/task/like');
INSERT INTO `pear_project_auth_node` VALUES (3914, 8, 'project/task/star');
INSERT INTO `pear_project_auth_node` VALUES (3915, 8, 'project/task/recycle');
INSERT INTO `pear_project_auth_node` VALUES (3916, 8, 'project/task/recovery');
INSERT INTO `pear_project_auth_node` VALUES (3917, 8, 'project/task/delete');
INSERT INTO `pear_project_auth_node` VALUES (3918, 8, 'project/task_log');
INSERT INTO `pear_project_auth_node` VALUES (3919, 8, 'project/task_log/index');
INSERT INTO `pear_project_auth_node` VALUES (3920, 8, 'project/task_log/getlistbyselfproject');
INSERT INTO `pear_project_auth_node` VALUES (3921, 8, 'project/task_member');
INSERT INTO `pear_project_auth_node` VALUES (3922, 8, 'project/task_member/index');
INSERT INTO `pear_project_auth_node` VALUES (3923, 8, 'project/task_member/searchinvitemember');
INSERT INTO `pear_project_auth_node` VALUES (3924, 8, 'project/task_member/invitemember');
INSERT INTO `pear_project_auth_node` VALUES (3925, 8, 'project/task_member/invitememberbatch');
INSERT INTO `pear_project_auth_node` VALUES (3926, 8, 'project/task_stages');
INSERT INTO `pear_project_auth_node` VALUES (3927, 8, 'project/task_stages/index');
INSERT INTO `pear_project_auth_node` VALUES (3928, 8, 'project/task_stages/tasks');
INSERT INTO `pear_project_auth_node` VALUES (3929, 8, 'project/task_stages/sort');
INSERT INTO `pear_project_auth_node` VALUES (3930, 8, 'project/task_stages/save');
INSERT INTO `pear_project_auth_node` VALUES (3931, 8, 'project/task_stages/edit');
INSERT INTO `pear_project_auth_node` VALUES (3932, 8, 'project/task_stages/delete');
INSERT INTO `pear_project_auth_node` VALUES (3933, 8, 'project/task_stages_template');
INSERT INTO `pear_project_auth_node` VALUES (3934, 8, 'project/task_stages_template/index');
INSERT INTO `pear_project_auth_node` VALUES (3935, 8, 'project/task_stages_template/save');
INSERT INTO `pear_project_auth_node` VALUES (3936, 8, 'project/task_stages_template/edit');
INSERT INTO `pear_project_auth_node` VALUES (3937, 8, 'project/task_stages_template/delete');
INSERT INTO `pear_project_auth_node` VALUES (3938, 9, 'project/account/index');
INSERT INTO `pear_project_auth_node` VALUES (3939, 9, 'project/auth/index');
INSERT INTO `pear_project_auth_node` VALUES (3940, 9, 'project/index/index');
INSERT INTO `pear_project_auth_node` VALUES (3941, 9, 'project/index');
INSERT INTO `pear_project_auth_node` VALUES (3942, 9, 'project/index/changecurrentorganization');
INSERT INTO `pear_project_auth_node` VALUES (3943, 9, 'project/index/systemconfig');
INSERT INTO `pear_project_auth_node` VALUES (3944, 9, 'project/index/info');
INSERT INTO `pear_project_auth_node` VALUES (3945, 9, 'project/index/editpersonal');
INSERT INTO `pear_project_auth_node` VALUES (3946, 9, 'project/index/editpassword');
INSERT INTO `pear_project_auth_node` VALUES (3947, 9, 'project/index/uploadimg');
INSERT INTO `pear_project_auth_node` VALUES (3948, 9, 'project/index/uploadavatar');
INSERT INTO `pear_project_auth_node` VALUES (3949, 9, 'project/menu/menu');
INSERT INTO `pear_project_auth_node` VALUES (3950, 9, 'project/node/index');
INSERT INTO `pear_project_auth_node` VALUES (3951, 9, 'project/node/alllist');
INSERT INTO `pear_project_auth_node` VALUES (3952, 9, 'project/notify/index');
INSERT INTO `pear_project_auth_node` VALUES (3953, 9, 'project/notify');
INSERT INTO `pear_project_auth_node` VALUES (3954, 9, 'project/notify/noreads');
INSERT INTO `pear_project_auth_node` VALUES (3955, 9, 'project/notify/setreadied');
INSERT INTO `pear_project_auth_node` VALUES (3956, 9, 'project/notify/batchdel');
INSERT INTO `pear_project_auth_node` VALUES (3957, 9, 'project/notify/read');
INSERT INTO `pear_project_auth_node` VALUES (3958, 9, 'project/notify/delete');
INSERT INTO `pear_project_auth_node` VALUES (3959, 9, 'project/organization/index');
INSERT INTO `pear_project_auth_node` VALUES (3960, 9, 'project/organization');
INSERT INTO `pear_project_auth_node` VALUES (3961, 9, 'project/organization/save');
INSERT INTO `pear_project_auth_node` VALUES (3962, 9, 'project/organization/read');
INSERT INTO `pear_project_auth_node` VALUES (3963, 9, 'project/organization/edit');
INSERT INTO `pear_project_auth_node` VALUES (3964, 9, 'project/organization/delete');
INSERT INTO `pear_project_auth_node` VALUES (3965, 9, 'project/project/index');
INSERT INTO `pear_project_auth_node` VALUES (3966, 9, 'project/project/read');
INSERT INTO `pear_project_auth_node` VALUES (3967, 9, 'project/project_collect/collect');
INSERT INTO `pear_project_auth_node` VALUES (3968, 9, 'project/project_collect');
INSERT INTO `pear_project_auth_node` VALUES (3969, 9, 'project/project_member/index');
INSERT INTO `pear_project_auth_node` VALUES (3970, 9, 'project/project_template/index');
INSERT INTO `pear_project_auth_node` VALUES (3971, 9, 'project/task/index');
INSERT INTO `pear_project_auth_node` VALUES (3972, 9, 'project/task/read');
INSERT INTO `pear_project_auth_node` VALUES (3973, 9, 'project/task/save');
INSERT INTO `pear_project_auth_node` VALUES (3974, 9, 'project/task/taskdone');
INSERT INTO `pear_project_auth_node` VALUES (3975, 9, 'project/task/assigntask');
INSERT INTO `pear_project_auth_node` VALUES (3976, 9, 'project/task/sort');
INSERT INTO `pear_project_auth_node` VALUES (3977, 9, 'project/task/createcomment');
INSERT INTO `pear_project_auth_node` VALUES (3978, 9, 'project/task/like');
INSERT INTO `pear_project_auth_node` VALUES (3979, 9, 'project/task/star');
INSERT INTO `pear_project_auth_node` VALUES (3980, 9, 'project/task_log/index');
INSERT INTO `pear_project_auth_node` VALUES (3981, 9, 'project/task_log');
INSERT INTO `pear_project_auth_node` VALUES (3982, 9, 'project/task_log/getlistbyselfproject');
INSERT INTO `pear_project_auth_node` VALUES (3983, 9, 'project/task_member/index');
INSERT INTO `pear_project_auth_node` VALUES (3984, 9, 'project/task_member/searchinvitemember');
INSERT INTO `pear_project_auth_node` VALUES (3985, 9, 'project/task_stages/index');
INSERT INTO `pear_project_auth_node` VALUES (3986, 9, 'project/task_stages/tasks');
INSERT INTO `pear_project_auth_node` VALUES (3987, 9, 'project/task_stages/sort');
INSERT INTO `pear_project_auth_node` VALUES (3988, 9, 'project/task_stages_template/index');
INSERT INTO `pear_project_auth_node` VALUES (3989, 9, 'project/department/index');
INSERT INTO `pear_project_auth_node` VALUES (3990, 9, 'project/department/read');
INSERT INTO `pear_project_auth_node` VALUES (3991, 9, 'project/department_member/index');
INSERT INTO `pear_project_auth_node` VALUES (3992, 9, 'project/department_member/searchinvitemember');
INSERT INTO `pear_project_auth_node` VALUES (3993, 9, 'project/project/selflist');
INSERT INTO `pear_project_auth_node` VALUES (3994, 9, 'project/project/save');
INSERT INTO `pear_project_auth_node` VALUES (3995, 9, 'project/task/selflist');
INSERT INTO `pear_project_auth_node` VALUES (4057, 3, 'project/account/index');
INSERT INTO `pear_project_auth_node` VALUES (4058, 3, 'project/account');
INSERT INTO `pear_project_auth_node` VALUES (4059, 3, 'project/account/auth');
INSERT INTO `pear_project_auth_node` VALUES (4060, 3, 'project/account/add');
INSERT INTO `pear_project_auth_node` VALUES (4061, 3, 'project/account/edit');
INSERT INTO `pear_project_auth_node` VALUES (4062, 3, 'project/account/del');
INSERT INTO `pear_project_auth_node` VALUES (4063, 3, 'project/account/forbid');
INSERT INTO `pear_project_auth_node` VALUES (4064, 3, 'project/account/resume');
INSERT INTO `pear_project_auth_node` VALUES (4065, 3, 'project/auth/index');
INSERT INTO `pear_project_auth_node` VALUES (4066, 3, 'project/auth');
INSERT INTO `pear_project_auth_node` VALUES (4067, 3, 'project/auth/apply');
INSERT INTO `pear_project_auth_node` VALUES (4068, 3, 'project/auth/add');
INSERT INTO `pear_project_auth_node` VALUES (4069, 3, 'project/auth/edit');
INSERT INTO `pear_project_auth_node` VALUES (4070, 3, 'project/auth/forbid');
INSERT INTO `pear_project_auth_node` VALUES (4071, 3, 'project/auth/resume');
INSERT INTO `pear_project_auth_node` VALUES (4072, 3, 'project/auth/setdefault');
INSERT INTO `pear_project_auth_node` VALUES (4073, 3, 'project/auth/del');
INSERT INTO `pear_project_auth_node` VALUES (4074, 3, 'project/department/index');
INSERT INTO `pear_project_auth_node` VALUES (4075, 3, 'project/department');
INSERT INTO `pear_project_auth_node` VALUES (4076, 3, 'project/department/read');
INSERT INTO `pear_project_auth_node` VALUES (4077, 3, 'project/department/save');
INSERT INTO `pear_project_auth_node` VALUES (4078, 3, 'project/department/edit');
INSERT INTO `pear_project_auth_node` VALUES (4079, 3, 'project/department/delete');
INSERT INTO `pear_project_auth_node` VALUES (4080, 3, 'project/department_member/index');
INSERT INTO `pear_project_auth_node` VALUES (4081, 3, 'project/department_member');
INSERT INTO `pear_project_auth_node` VALUES (4082, 3, 'project/department_member/searchinvitemember');
INSERT INTO `pear_project_auth_node` VALUES (4083, 3, 'project/department_member/invitemember');
INSERT INTO `pear_project_auth_node` VALUES (4084, 3, 'project/department_member/removemember');
INSERT INTO `pear_project_auth_node` VALUES (4085, 3, 'project/index/index');
INSERT INTO `pear_project_auth_node` VALUES (4086, 3, 'project/index');
INSERT INTO `pear_project_auth_node` VALUES (4087, 3, 'project/index/changecurrentorganization');
INSERT INTO `pear_project_auth_node` VALUES (4088, 3, 'project/index/systemconfig');
INSERT INTO `pear_project_auth_node` VALUES (4089, 3, 'project/index/info');
INSERT INTO `pear_project_auth_node` VALUES (4090, 3, 'project/index/editpersonal');
INSERT INTO `pear_project_auth_node` VALUES (4091, 3, 'project/index/editpassword');
INSERT INTO `pear_project_auth_node` VALUES (4092, 3, 'project/index/uploadimg');
INSERT INTO `pear_project_auth_node` VALUES (4093, 3, 'project/index/uploadavatar');
INSERT INTO `pear_project_auth_node` VALUES (4094, 3, 'project/menu/menu');
INSERT INTO `pear_project_auth_node` VALUES (4095, 3, 'project/menu');
INSERT INTO `pear_project_auth_node` VALUES (4096, 3, 'project/menu/menuadd');
INSERT INTO `pear_project_auth_node` VALUES (4097, 3, 'project/menu/menuedit');
INSERT INTO `pear_project_auth_node` VALUES (4098, 3, 'project/menu/menuforbid');
INSERT INTO `pear_project_auth_node` VALUES (4099, 3, 'project/menu/menuresume');
INSERT INTO `pear_project_auth_node` VALUES (4100, 3, 'project/menu/menudel');
INSERT INTO `pear_project_auth_node` VALUES (4101, 3, 'project/node/index');
INSERT INTO `pear_project_auth_node` VALUES (4102, 3, 'project/node');
INSERT INTO `pear_project_auth_node` VALUES (4103, 3, 'project/node/alllist');
INSERT INTO `pear_project_auth_node` VALUES (4104, 3, 'project/node/clear');
INSERT INTO `pear_project_auth_node` VALUES (4105, 3, 'project/node/save');
INSERT INTO `pear_project_auth_node` VALUES (4106, 3, 'project/notify/index');
INSERT INTO `pear_project_auth_node` VALUES (4107, 3, 'project/notify');
INSERT INTO `pear_project_auth_node` VALUES (4108, 3, 'project/notify/noreads');
INSERT INTO `pear_project_auth_node` VALUES (4109, 3, 'project/notify/setreadied');
INSERT INTO `pear_project_auth_node` VALUES (4110, 3, 'project/notify/batchdel');
INSERT INTO `pear_project_auth_node` VALUES (4111, 3, 'project/notify/read');
INSERT INTO `pear_project_auth_node` VALUES (4112, 3, 'project/notify/delete');
INSERT INTO `pear_project_auth_node` VALUES (4113, 3, 'project/organization/index');
INSERT INTO `pear_project_auth_node` VALUES (4114, 3, 'project/organization');
INSERT INTO `pear_project_auth_node` VALUES (4115, 3, 'project/organization/save');
INSERT INTO `pear_project_auth_node` VALUES (4116, 3, 'project/organization/read');
INSERT INTO `pear_project_auth_node` VALUES (4117, 3, 'project/organization/edit');
INSERT INTO `pear_project_auth_node` VALUES (4118, 3, 'project/organization/delete');
INSERT INTO `pear_project_auth_node` VALUES (4119, 3, 'project/project/index');
INSERT INTO `pear_project_auth_node` VALUES (4120, 3, 'project/project');
INSERT INTO `pear_project_auth_node` VALUES (4121, 3, 'project/project/selflist');
INSERT INTO `pear_project_auth_node` VALUES (4122, 3, 'project/project/save');
INSERT INTO `pear_project_auth_node` VALUES (4123, 3, 'project/project/read');
INSERT INTO `pear_project_auth_node` VALUES (4124, 3, 'project/project/edit');
INSERT INTO `pear_project_auth_node` VALUES (4125, 3, 'project/project/getlogbyselfproject');
INSERT INTO `pear_project_auth_node` VALUES (4126, 3, 'project/project/uploadcover');
INSERT INTO `pear_project_auth_node` VALUES (4127, 3, 'project/project/recycle');
INSERT INTO `pear_project_auth_node` VALUES (4128, 3, 'project/project/recovery');
INSERT INTO `pear_project_auth_node` VALUES (4129, 3, 'project/project/archive');
INSERT INTO `pear_project_auth_node` VALUES (4130, 3, 'project/project/recoveryarchive');
INSERT INTO `pear_project_auth_node` VALUES (4131, 3, 'project/project/quit');
INSERT INTO `pear_project_auth_node` VALUES (4132, 3, 'project/project_collect/collect');
INSERT INTO `pear_project_auth_node` VALUES (4133, 3, 'project/project_collect');
INSERT INTO `pear_project_auth_node` VALUES (4134, 3, 'project/project_member/index');
INSERT INTO `pear_project_auth_node` VALUES (4135, 3, 'project/project_member');
INSERT INTO `pear_project_auth_node` VALUES (4136, 3, 'project/project_member/searchinvitemember');
INSERT INTO `pear_project_auth_node` VALUES (4137, 3, 'project/project_member/invitemember');
INSERT INTO `pear_project_auth_node` VALUES (4138, 3, 'project/project_member/removemember');
INSERT INTO `pear_project_auth_node` VALUES (4139, 3, 'project/project_template/index');
INSERT INTO `pear_project_auth_node` VALUES (4140, 3, 'project/project_template');
INSERT INTO `pear_project_auth_node` VALUES (4141, 3, 'project/project_template/save');
INSERT INTO `pear_project_auth_node` VALUES (4142, 3, 'project/project_template/uploadcover');
INSERT INTO `pear_project_auth_node` VALUES (4143, 3, 'project/project_template/edit');
INSERT INTO `pear_project_auth_node` VALUES (4144, 3, 'project/project_template/delete');
INSERT INTO `pear_project_auth_node` VALUES (4145, 3, 'project/task/index');
INSERT INTO `pear_project_auth_node` VALUES (4146, 3, 'project/task');
INSERT INTO `pear_project_auth_node` VALUES (4147, 3, 'project/task/datetotalforproject');
INSERT INTO `pear_project_auth_node` VALUES (4148, 3, 'project/task/selflist');
INSERT INTO `pear_project_auth_node` VALUES (4149, 3, 'project/task/tasksources');
INSERT INTO `pear_project_auth_node` VALUES (4150, 3, 'project/task/read');
INSERT INTO `pear_project_auth_node` VALUES (4151, 3, 'project/task/save');
INSERT INTO `pear_project_auth_node` VALUES (4152, 3, 'project/task/taskdone');
INSERT INTO `pear_project_auth_node` VALUES (4153, 3, 'project/task/assigntask');
INSERT INTO `pear_project_auth_node` VALUES (4154, 3, 'project/task/sort');
INSERT INTO `pear_project_auth_node` VALUES (4155, 3, 'project/task/createcomment');
INSERT INTO `pear_project_auth_node` VALUES (4156, 3, 'project/task/edit');
INSERT INTO `pear_project_auth_node` VALUES (4157, 3, 'project/task/like');
INSERT INTO `pear_project_auth_node` VALUES (4158, 3, 'project/task/star');
INSERT INTO `pear_project_auth_node` VALUES (4159, 3, 'project/task/recycle');
INSERT INTO `pear_project_auth_node` VALUES (4160, 3, 'project/task/recovery');
INSERT INTO `pear_project_auth_node` VALUES (4161, 3, 'project/task/delete');
INSERT INTO `pear_project_auth_node` VALUES (4162, 3, 'project/task_member/index');
INSERT INTO `pear_project_auth_node` VALUES (4163, 3, 'project/task_member');
INSERT INTO `pear_project_auth_node` VALUES (4164, 3, 'project/task_member/searchinvitemember');
INSERT INTO `pear_project_auth_node` VALUES (4165, 3, 'project/task_member/invitemember');
INSERT INTO `pear_project_auth_node` VALUES (4166, 3, 'project/task_member/invitememberbatch');
INSERT INTO `pear_project_auth_node` VALUES (4167, 3, 'project/task_stages/index');
INSERT INTO `pear_project_auth_node` VALUES (4168, 3, 'project/task_stages');
INSERT INTO `pear_project_auth_node` VALUES (4169, 3, 'project/task_stages/tasks');
INSERT INTO `pear_project_auth_node` VALUES (4170, 3, 'project/task_stages/sort');
INSERT INTO `pear_project_auth_node` VALUES (4171, 3, 'project/task_stages/save');
INSERT INTO `pear_project_auth_node` VALUES (4172, 3, 'project/task_stages/edit');
INSERT INTO `pear_project_auth_node` VALUES (4173, 3, 'project/task_stages/delete');
INSERT INTO `pear_project_auth_node` VALUES (4174, 3, 'project/task_stages_template/index');
INSERT INTO `pear_project_auth_node` VALUES (4175, 3, 'project/task_stages_template');
INSERT INTO `pear_project_auth_node` VALUES (4176, 3, 'project/task_stages_template/save');
INSERT INTO `pear_project_auth_node` VALUES (4177, 3, 'project/task_stages_template/edit');
INSERT INTO `pear_project_auth_node` VALUES (4178, 3, 'project/task_stages_template/delete');
INSERT INTO `pear_project_auth_node` VALUES (4179, 3, 'project/source_link');
INSERT INTO `pear_project_auth_node` VALUES (4180, 3, 'project/source_link/delete');
INSERT INTO `pear_project_auth_node` VALUES (4181, 3, 'project/task/tasklog');
INSERT INTO `pear_project_auth_node` VALUES (4182, 3, 'project/task/recyclebatch');
INSERT INTO `pear_project_auth_node` VALUES (4183, 3, 'project/file');
INSERT INTO `pear_project_auth_node` VALUES (4184, 3, 'project/file/index');
INSERT INTO `pear_project_auth_node` VALUES (4185, 3, 'project/file/read');
INSERT INTO `pear_project_auth_node` VALUES (4186, 3, 'project/file/uploadfiles');
INSERT INTO `pear_project_auth_node` VALUES (4187, 3, 'project/file/edit');
INSERT INTO `pear_project_auth_node` VALUES (4188, 3, 'project/file/recycle');
INSERT INTO `pear_project_auth_node` VALUES (4189, 3, 'project/file/recovery');
INSERT INTO `pear_project_auth_node` VALUES (4190, 3, 'project/file/delete');
INSERT INTO `pear_project_auth_node` VALUES (4191, 3, 'project');
INSERT INTO `pear_project_auth_node` VALUES (4381, 4, 'project/account/index');
INSERT INTO `pear_project_auth_node` VALUES (4382, 4, 'project/account/read');
INSERT INTO `pear_project_auth_node` VALUES (4383, 4, 'project/auth/index');
INSERT INTO `pear_project_auth_node` VALUES (4384, 4, 'project/department/index');
INSERT INTO `pear_project_auth_node` VALUES (4385, 4, 'project/department/read');
INSERT INTO `pear_project_auth_node` VALUES (4386, 4, 'project/department_member/index');
INSERT INTO `pear_project_auth_node` VALUES (4387, 4, 'project/department_member/searchinvitemember');
INSERT INTO `pear_project_auth_node` VALUES (4388, 4, 'project/file/index');
INSERT INTO `pear_project_auth_node` VALUES (4389, 4, 'project/file/read');
INSERT INTO `pear_project_auth_node` VALUES (4390, 4, 'project/file/uploadfiles');
INSERT INTO `pear_project_auth_node` VALUES (4391, 4, 'project/index/index');
INSERT INTO `pear_project_auth_node` VALUES (4392, 4, 'project/index');
INSERT INTO `pear_project_auth_node` VALUES (4393, 4, 'project/index/changecurrentorganization');
INSERT INTO `pear_project_auth_node` VALUES (4394, 4, 'project/index/systemconfig');
INSERT INTO `pear_project_auth_node` VALUES (4395, 4, 'project/index/info');
INSERT INTO `pear_project_auth_node` VALUES (4396, 4, 'project/index/editpersonal');
INSERT INTO `pear_project_auth_node` VALUES (4397, 4, 'project/index/editpassword');
INSERT INTO `pear_project_auth_node` VALUES (4398, 4, 'project/index/uploadimg');
INSERT INTO `pear_project_auth_node` VALUES (4399, 4, 'project/index/uploadavatar');
INSERT INTO `pear_project_auth_node` VALUES (4400, 4, 'project/menu/menu');
INSERT INTO `pear_project_auth_node` VALUES (4401, 4, 'project/node/index');
INSERT INTO `pear_project_auth_node` VALUES (4402, 4, 'project/node/alllist');
INSERT INTO `pear_project_auth_node` VALUES (4403, 4, 'project/notify/index');
INSERT INTO `pear_project_auth_node` VALUES (4404, 4, 'project/notify');
INSERT INTO `pear_project_auth_node` VALUES (4405, 4, 'project/notify/noreads');
INSERT INTO `pear_project_auth_node` VALUES (4406, 4, 'project/notify/setreadied');
INSERT INTO `pear_project_auth_node` VALUES (4407, 4, 'project/notify/batchdel');
INSERT INTO `pear_project_auth_node` VALUES (4408, 4, 'project/notify/read');
INSERT INTO `pear_project_auth_node` VALUES (4409, 4, 'project/notify/delete');
INSERT INTO `pear_project_auth_node` VALUES (4410, 4, 'project/organization/index');
INSERT INTO `pear_project_auth_node` VALUES (4411, 4, 'project/organization');
INSERT INTO `pear_project_auth_node` VALUES (4412, 4, 'project/organization/save');
INSERT INTO `pear_project_auth_node` VALUES (4413, 4, 'project/organization/read');
INSERT INTO `pear_project_auth_node` VALUES (4414, 4, 'project/organization/edit');
INSERT INTO `pear_project_auth_node` VALUES (4415, 4, 'project/organization/delete');
INSERT INTO `pear_project_auth_node` VALUES (4416, 4, 'project/project/index');
INSERT INTO `pear_project_auth_node` VALUES (4417, 4, 'project/project/selflist');
INSERT INTO `pear_project_auth_node` VALUES (4418, 4, 'project/project/save');
INSERT INTO `pear_project_auth_node` VALUES (4419, 4, 'project/project/read');
INSERT INTO `pear_project_auth_node` VALUES (4420, 4, 'project/project/getlogbyselfproject');
INSERT INTO `pear_project_auth_node` VALUES (4421, 4, 'project/project/quit');
INSERT INTO `pear_project_auth_node` VALUES (4422, 4, 'project/project_collect/collect');
INSERT INTO `pear_project_auth_node` VALUES (4423, 4, 'project/project_collect');
INSERT INTO `pear_project_auth_node` VALUES (4424, 4, 'project/project_member/index');
INSERT INTO `pear_project_auth_node` VALUES (4425, 4, 'project/project_template/index');
INSERT INTO `pear_project_auth_node` VALUES (4426, 4, 'project/task/index');
INSERT INTO `pear_project_auth_node` VALUES (4427, 4, 'project/task/datetotalforproject');
INSERT INTO `pear_project_auth_node` VALUES (4428, 4, 'project/task/selflist');
INSERT INTO `pear_project_auth_node` VALUES (4429, 4, 'project/task/read');
INSERT INTO `pear_project_auth_node` VALUES (4430, 4, 'project/task/save');
INSERT INTO `pear_project_auth_node` VALUES (4431, 4, 'project/task/taskdone');
INSERT INTO `pear_project_auth_node` VALUES (4432, 4, 'project/task/assigntask');
INSERT INTO `pear_project_auth_node` VALUES (4433, 4, 'project/task/sort');
INSERT INTO `pear_project_auth_node` VALUES (4434, 4, 'project/task/createcomment');
INSERT INTO `pear_project_auth_node` VALUES (4435, 4, 'project/task/setprivate');
INSERT INTO `pear_project_auth_node` VALUES (4436, 4, 'project/task/like');
INSERT INTO `pear_project_auth_node` VALUES (4437, 4, 'project/task/star');
INSERT INTO `pear_project_auth_node` VALUES (4438, 4, 'project/task/tasklog');
INSERT INTO `pear_project_auth_node` VALUES (4439, 4, 'project/task_member/index');
INSERT INTO `pear_project_auth_node` VALUES (4440, 4, 'project/task_member/searchinvitemember');
INSERT INTO `pear_project_auth_node` VALUES (4441, 4, 'project/task_stages/index');
INSERT INTO `pear_project_auth_node` VALUES (4442, 4, 'project/task_stages/tasks');
INSERT INTO `pear_project_auth_node` VALUES (4443, 4, 'project/task_stages/sort');
INSERT INTO `pear_project_auth_node` VALUES (4444, 4, 'project/task_stages_template/index');
INSERT INTO `pear_project_auth_node` VALUES (4445, 4, 'project/task/tasktotags');
INSERT INTO `pear_project_auth_node` VALUES (4446, 4, 'project/task/settag');
INSERT INTO `pear_project_auth_node` VALUES (4447, 4, 'project/task_tag');
INSERT INTO `pear_project_auth_node` VALUES (4448, 4, 'project/task_tag/index');
INSERT INTO `pear_project_auth_node` VALUES (4449, 4, 'project/task_tag/save');
INSERT INTO `pear_project_auth_node` VALUES (4450, 4, 'project/task_tag/edit');
INSERT INTO `pear_project_auth_node` VALUES (4451, 4, 'project/task_tag/delete');

-- ----------------------------
-- Table structure for pear_project_collection
-- ----------------------------
DROP TABLE IF EXISTS `pear_project_collection`;
CREATE TABLE `pear_project_collection`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_code` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '项目id',
  `member_code` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '成员id',
  `create_time` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '加入时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 48 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '项目-收藏表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of pear_project_collection
-- ----------------------------
INSERT INTO `pear_project_collection` VALUES (29, 'n5opgqevrz1l03h48uwx67d2', '6v7be19pwman2fird04gqu53', '2019-01-02 17:40:18');
INSERT INTO `pear_project_collection` VALUES (30, '8ulzfth64cd0k1x5peivowm2', 'kqdcn2w40p58r31zyo6efjib', '2019-01-03 09:16:15');
INSERT INTO `pear_project_collection` VALUES (46, 'elqa703jyvfhpt1dsxkzi8on', '6v7be19pwman2fird04gqu53', '2019-01-23 22:33:41');

-- ----------------------------
-- Table structure for pear_project_config
-- ----------------------------
DROP TABLE IF EXISTS `pear_project_config`;
CREATE TABLE `pear_project_config`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `project_code` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '项目配置表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for pear_project_log
-- ----------------------------
DROP TABLE IF EXISTS `pear_project_log`;
CREATE TABLE `pear_project_log`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `member_code` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '操作人id',
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '操作内容',
  `remark` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'create' COMMENT '操作类型',
  `create_time` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '添加时间',
  `source_code` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '任务id',
  `action_type` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '场景类型',
  `to_member_code` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0',
  `is_comment` tinyint(1) NULL DEFAULT 0 COMMENT '是否评论，0：否',
  `project_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `icon` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4458 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '项目日志表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of pear_project_log
-- ----------------------------
INSERT INTO `pear_project_log` VALUES (3865, 'hb8l9ca23fv6konryzetwid5', '6v7be19pwman2fird04gqu53', '', '重做了任务', 'redo', '2018-12-29 10:15:50', 'aut9wrz1pn0elf5s47ivx26o', 'task', '', 0, NULL, 'undo');
INSERT INTO `pear_project_log` VALUES (3866, '7x0cmb8jezoihy2nrspqdav6', '6v7be19pwman2fird04gqu53', '', '完成了任务', 'done', '2018-12-29 10:15:55', 'aut9wrz1pn0elf5s47ivx26o', 'task', '', 0, NULL, 'check');
INSERT INTO `pear_project_log` VALUES (3867, 'l5pem3zy2ts0oa87rf64cv9u', '6v7be19pwman2fird04gqu53', '正在测试66', '更新了内容', 'name', '2018-12-29 10:16:10', 'aut9wrz1pn0elf5s47ivx26o', 'task', '', 0, NULL, 'edit');
INSERT INTO `pear_project_log` VALUES (3868, 'va9og4r2e076puhw8d3k51xl', '6v7be19pwman2fird04gqu53', '正在测试66', '更新了内容', 'name', '2018-12-29 10:16:10', 'aut9wrz1pn0elf5s47ivx26o', 'task', '', 0, NULL, 'edit');
INSERT INTO `pear_project_log` VALUES (3869, 'u8yzk57ndfpj60rwes4b1la3', '6v7be19pwman2fird04gqu53', '正在测试66', '更新了内容', 'name', '2018-12-29 10:16:56', 'aut9wrz1pn0elf5s47ivx26o', 'task', '', 0, NULL, 'edit');
INSERT INTO `pear_project_log` VALUES (3870, '4ys53x2eoaimgpdrhuzk9ncw', '6v7be19pwman2fird04gqu53', '正在测试66', '更新了备注', 'content', '2018-12-29 10:17:20', 'aut9wrz1pn0elf5s47ivx26o', 'task', '', 0, NULL, 'file-text');
INSERT INTO `pear_project_log` VALUES (3871, '3jnmaiwh2k0gse5z6ycb9qul', '6v7be19pwman2fird04gqu53', '', '更新截止时间为DecDec月SunSun日 2222:1212', 'setEndTime', '2018-12-29 10:21:25', 'aut9wrz1pn0elf5s47ivx26o', 'task', '', 0, NULL, 'calendar');
INSERT INTO `pear_project_log` VALUES (3872, 'yxdhomi1jzu38plq42v0gar7', '6v7be19pwman2fird04gqu53', '', '更新截止时间为12月30日 22:04', 'setEndTime', '2018-12-29 10:23:47', 'aut9wrz1pn0elf5s47ivx26o', 'task', '', 0, NULL, 'calendar');
INSERT INTO `pear_project_log` VALUES (3873, '9vnih5ysb6aj2gd1rpu47xzk', '6v7be19pwman2fird04gqu53', '', '更新截止时间为 12月30日 22:04', 'setEndTime', '2018-12-29 10:24:26', 'aut9wrz1pn0elf5s47ivx26o', 'task', '', 0, NULL, 'calendar');
INSERT INTO `pear_project_log` VALUES (3874, 'b7qloh6psyzevmr84fcd3n9x', '6v7be19pwman2fird04gqu53', '', '清除了截止时间 ', 'clearEndTime', '2018-12-29 10:25:41', 'aut9wrz1pn0elf5s47ivx26o', 'task', '', 0, NULL, 'calendar');
INSERT INTO `pear_project_log` VALUES (3875, 'j3oiehapycrg16v8km9zdq2f', '6v7be19pwman2fird04gqu53', '', '移除了执行者 vilson.2', 'removeExecutor', '2018-12-29 10:49:20', 'aut9wrz1pn0elf5s47ivx26o', 'task', 'kqdcn2w40p58r31zyo6efjib', 0, NULL, 'user-delete');
INSERT INTO `pear_project_log` VALUES (3876, 'azp3jxlsk04w9vfdqg1ho27y', '6v7be19pwman2fird04gqu53', '', '指派给了 vilson', 'assign', '2018-12-29 10:51:06', 'aut9wrz1pn0elf5s47ivx26o', 'task', '6v7be19pwman2fird04gqu53', 0, NULL, 'user');
INSERT INTO `pear_project_log` VALUES (3877, 'crjuwktfns89d2l6ypog3qbm', '6v7be19pwman2fird04gqu53', '', '指派给了 Chihiro', 'assign', '2018-12-29 10:52:00', 'aut9wrz1pn0elf5s47ivx26o', 'task', 'y680trgedcavbhnz24u7i5m3', 0, NULL, 'user');
INSERT INTO `pear_project_log` VALUES (3878, '3pbxrfhc5nyil20gzjdweva6', '6v7be19pwman2fird04gqu53', '', '认领了任务 ', 'claim', '2018-12-29 10:52:06', 'aut9wrz1pn0elf5s47ivx26o', 'task', '6v7be19pwman2fird04gqu53', 0, NULL, 'user');
INSERT INTO `pear_project_log` VALUES (3879, 'bal3tv27mjqn1riusfywokcz', '6v7be19pwman2fird04gqu53', '', '移除了参与者 vilson.2', 'removeMember', '2018-12-29 10:52:12', 'aut9wrz1pn0elf5s47ivx26o', 'task', 'kqdcn2w40p58r31zyo6efjib', 0, NULL, 'user-delete');
INSERT INTO `pear_project_log` VALUES (3880, 't4o85dv2mi6qr9yn7e30asbh', '6v7be19pwman2fird04gqu53', '', '添加了参与者 vilson.2', 'inviteMember', '2018-12-29 10:52:26', 'aut9wrz1pn0elf5s47ivx26o', 'task', 'kqdcn2w40p58r31zyo6efjib', 0, NULL, 'user-add');
INSERT INTO `pear_project_log` VALUES (3881, '0gd32z4bwmexs7lthurfynqv', '6v7be19pwman2fird04gqu53', '', '移除了执行者 vilson', 'removeExecutor', '2018-12-29 10:52:32', 'aut9wrz1pn0elf5s47ivx26o', 'task', '6v7be19pwman2fird04gqu53', 0, NULL, 'user-delete');
INSERT INTO `pear_project_log` VALUES (3882, '6bzg8p1u5f0j9dintrhoak37', '6v7be19pwman2fird04gqu53', '', '移除了参与者 vilson', 'removeMember', '2018-12-29 10:52:32', 'aut9wrz1pn0elf5s47ivx26o', 'task', '6v7be19pwman2fird04gqu53', 0, NULL, 'user-delete');
INSERT INTO `pear_project_log` VALUES (3883, '7z0pdbgmkfqnhyc9wsrau2vx', '6v7be19pwman2fird04gqu53', '', '移除了参与者 vilson.2', 'removeMember', '2018-12-29 10:52:32', 'aut9wrz1pn0elf5s47ivx26o', 'task', 'kqdcn2w40p58r31zyo6efjib', 0, NULL, 'user-delete');
INSERT INTO `pear_project_log` VALUES (3884, '0ca81iu4d5m9zj3o6ekvw7sq', '6v7be19pwman2fird04gqu53', '', '添加了参与者 vilson', 'inviteMember', '2018-12-29 10:53:23', 'aut9wrz1pn0elf5s47ivx26o', 'task', '6v7be19pwman2fird04gqu53', 0, NULL, 'user-add');
INSERT INTO `pear_project_log` VALUES (3885, '6w0ylbu1si5pg9mtjovqhrnd', '6v7be19pwman2fird04gqu53', '', '添加了参与者 vilson.2', 'inviteMember', '2018-12-29 10:53:23', 'aut9wrz1pn0elf5s47ivx26o', 'task', 'kqdcn2w40p58r31zyo6efjib', 0, NULL, 'user-add');
INSERT INTO `pear_project_log` VALUES (3886, 'c6s7evftijkbal5huo8mqrwd', '6v7be19pwman2fird04gqu53', '', '移除了参与者 vilson', 'removeMember', '2018-12-29 10:53:32', 'aut9wrz1pn0elf5s47ivx26o', 'task', '6v7be19pwman2fird04gqu53', 0, NULL, 'user-delete');
INSERT INTO `pear_project_log` VALUES (3887, '7c6qswjvx95rne8dy10h2bli', '6v7be19pwman2fird04gqu53', '', '移除了参与者 vilson.2', 'removeMember', '2018-12-29 10:53:32', 'aut9wrz1pn0elf5s47ivx26o', 'task', 'kqdcn2w40p58r31zyo6efjib', 0, NULL, 'user-delete');
INSERT INTO `pear_project_log` VALUES (3888, 'gs2ykol8h95af76mczx04jbd', '6v7be19pwman2fird04gqu53', '', '完成了任务 ', 'done', '2018-12-29 10:57:21', 'hj5s73zk6amd9wfvbxoygpic', 'task', '', 0, NULL, 'check');
INSERT INTO `pear_project_log` VALUES (3889, '54pznxmvueifhrok3lbj17a9', '6v7be19pwman2fird04gqu53', '', '完成了子任务 ', 'doneChild', '2018-12-29 10:57:21', 'aut9wrz1pn0elf5s47ivx26o', 'task', '', 0, NULL, 'bars');
INSERT INTO `pear_project_log` VALUES (3890, '5uqkjha30czp4xltbv12dmwy', '6v7be19pwman2fird04gqu53', '', '重做了任务 ', 'redo', '2018-12-29 10:57:25', '4mtnhwbe0gjdkaur2ic7xsv6', 'task', '', 0, NULL, 'undo');
INSERT INTO `pear_project_log` VALUES (3891, 'dtbn6e3kiz42aly05qjuf9v8', '6v7be19pwman2fird04gqu53', '', '重做了子任务 ', 'redoChild', '2018-12-29 10:57:25', 'aut9wrz1pn0elf5s47ivx26o', 'task', '', 0, NULL, 'undo');
INSERT INTO `pear_project_log` VALUES (3892, 'tpeohjivxzds8n7mwk4ba6yg', '6v7be19pwman2fird04gqu53', '', '完成了任务 ', 'done', '2018-12-29 10:57:31', 'g83vs5t47dfnprchqzel1a29', 'task', '', 0, NULL, 'check');
INSERT INTO `pear_project_log` VALUES (3893, 'n82qfxou094y5vg76rdcsbph', '6v7be19pwman2fird04gqu53', '', '完成了子任务 ', 'doneChild', '2018-12-29 10:57:31', 'aut9wrz1pn0elf5s47ivx26o', 'task', '', 0, NULL, 'bars');
INSERT INTO `pear_project_log` VALUES (3894, 'waog819ziun43ql5ptf7hs2r', '6v7be19pwman2fird04gqu53', '', '重做了任务 ', 'redo', '2018-12-29 10:58:47', 'hj5s73zk6amd9wfvbxoygpic', 'task', '', 0, NULL, 'undo');
INSERT INTO `pear_project_log` VALUES (3895, 'imy4zkq7v8ehb02nl9uos16x', '6v7be19pwman2fird04gqu53', '', '重做了子任务 \'正在测试66\'', 'redoChild', '2018-12-29 10:58:47', 'aut9wrz1pn0elf5s47ivx26o', 'task', '', 0, NULL, 'undo');
INSERT INTO `pear_project_log` VALUES (3896, 'r1hsabj6xm74p5qvf0ltcw92', '6v7be19pwman2fird04gqu53', '', '重做了任务 ', 'redo', '2018-12-29 10:59:38', '0zvn3ug6fiqhdpkljos79xaw', 'task', '', 0, NULL, 'undo');
INSERT INTO `pear_project_log` VALUES (3897, '0k6zht3acignxrs785b9pewl', '6v7be19pwman2fird04gqu53', '', '重做了子任务 “正在测试66”', 'redoChild', '2018-12-29 10:59:38', 'aut9wrz1pn0elf5s47ivx26o', 'task', '', 0, NULL, 'undo');
INSERT INTO `pear_project_log` VALUES (3898, '967lzeit5d4an3yxbwhpomqg', '6v7be19pwman2fird04gqu53', '', '完成了任务 ', 'done', '2018-12-29 11:00:21', '6kqh4b1mce05rzvuljsg3ow8', 'task', '', 0, NULL, 'check');
INSERT INTO `pear_project_log` VALUES (3899, 'eizs4oy06gdkb9rvu1x2q7jc', '6v7be19pwman2fird04gqu53', '', '完成了子任务 \"正在测试66\"', 'doneChild', '2018-12-29 11:00:21', 'aut9wrz1pn0elf5s47ivx26o', 'task', '', 0, NULL, 'bars');
INSERT INTO `pear_project_log` VALUES (3900, 'src7od6qp4age5umt3yb1kf2', '6v7be19pwman2fird04gqu53', '12', '创建了任务 ', 'create', '2018-12-29 11:02:39', 'oz2xwp8v0niahdc7lekjtsrg', 'task', '', 0, NULL, 'plus');
INSERT INTO `pear_project_log` VALUES (3901, 'uiyh86tmclzv75pwojefdrq1', '6v7be19pwman2fird04gqu53', '', '认领了任务 ', 'claim', '2018-12-29 11:02:39', 'oz2xwp8v0niahdc7lekjtsrg', 'task', '', 0, NULL, 'user');
INSERT INTO `pear_project_log` VALUES (3902, 'qj59cy1iom4axe8znvhgfl2k', '6v7be19pwman2fird04gqu53', '88', '创建了任务 ', 'create', '2018-12-29 11:02:49', 'v2kr731dihezctslmx9agb5w', 'task', '', 0, NULL, 'plus');
INSERT INTO `pear_project_log` VALUES (3903, 'ngcptv1mkb08sde5uorfa4zw', '6v7be19pwman2fird04gqu53', '', '指派给了 vilson.2', 'assign', '2018-12-29 11:02:49', 'v2kr731dihezctslmx9agb5w', 'task', 'kqdcn2w40p58r31zyo6efjib', 0, NULL, 'user');
INSERT INTO `pear_project_log` VALUES (3904, 'rjyt3nkd6bs4e9owf2qv0xpu', '6v7be19pwman2fird04gqu53', '', '完成了任务 ', 'done', '2018-12-29 11:03:30', 'v2kr731dihezctslmx9agb5w', 'task', '', 0, NULL, 'check');
INSERT INTO `pear_project_log` VALUES (3905, '6du4nlszheact9v7rpqjkbgw', '6v7be19pwman2fird04gqu53', '', '重做了任务 ', 'redo', '2018-12-29 11:16:37', 'aut9wrz1pn0elf5s47ivx26o', 'task', '', 0, NULL, 'undo');
INSERT INTO `pear_project_log` VALUES (3906, 'e6n89tqal4pkf3c02xo1i7vh', '6v7be19pwman2fird04gqu53', '正在测试66', '更新了备注 ', 'content', '2018-12-29 12:09:11', 'aut9wrz1pn0elf5s47ivx26o', 'task', '', 0, NULL, 'file-text');
INSERT INTO `pear_project_log` VALUES (3907, 'dgt56ixya7bm9ljp8cr2wsh4', '6v7be19pwman2fird04gqu53', '', '完成了任务 ', 'done', '2018-12-29 12:10:01', 'edbn6rz89fmh7a3ilgvukw14', 'task', '', 0, NULL, 'check');
INSERT INTO `pear_project_log` VALUES (3908, '9uxe30yni8lhpbdcm2t74fjq', '6v7be19pwman2fird04gqu53', '', '移除了执行者 ', 'removeExecutor', '2018-12-29 12:10:03', 'edbn6rz89fmh7a3ilgvukw14', 'task', 'y680trgedcavbhnz24u7i5m3', 0, NULL, 'user-delete');
INSERT INTO `pear_project_log` VALUES (3909, 'xdnbuiyl36etvzwhp9f5o07g', '6v7be19pwman2fird04gqu53', '', '更新截止时间为 12月29日 18:00', 'setEndTime', '2018-12-29 12:10:06', 'edbn6rz89fmh7a3ilgvukw14', 'task', '', 0, NULL, 'calendar');
INSERT INTO `pear_project_log` VALUES (3910, 'zjirf8e054oscx3mlu2b9gp1', '6v7be19pwman2fird04gqu53', '22', '更新了备注 ', 'content', '2018-12-29 12:10:10', 'edbn6rz89fmh7a3ilgvukw14', 'task', '', 0, NULL, 'file-text');
INSERT INTO `pear_project_log` VALUES (3911, 'bjsgzv69hap8xoc4i5umq1re', '6v7be19pwman2fird04gqu53', '22', '更新了内容 ', 'name', '2018-12-29 12:10:11', 'edbn6rz89fmh7a3ilgvukw14', 'task', '', 0, NULL, 'edit');
INSERT INTO `pear_project_log` VALUES (3912, 'zk6vu1pin4jy2f9w0gc5b73m', '6v7be19pwman2fird04gqu53', '88', '创建了任务 ', 'create', '2018-12-29 12:10:16', '1vqt5zg4shbkum2dc8jxow7f', 'task', '', 0, NULL, 'plus');
INSERT INTO `pear_project_log` VALUES (3913, 'qw03pol295t1diz846erycsj', '6v7be19pwman2fird04gqu53', '', '指派给了 Chihiro', 'assign', '2018-12-29 12:10:16', '1vqt5zg4shbkum2dc8jxow7f', 'task', 'y680trgedcavbhnz24u7i5m3', 0, NULL, 'user');
INSERT INTO `pear_project_log` VALUES (3914, 'bml3dzxq6a07tgv9k1u8nwe2', '6v7be19pwman2fird04gqu53', '99', '创建了任务 ', 'create', '2018-12-29 12:11:40', '2hg0yfa9jpxz6q58ckrdol1u', 'task', '', 0, NULL, 'plus');
INSERT INTO `pear_project_log` VALUES (3915, 'oynufrwkag4lvqc7pbszm62d', '6v7be19pwman2fird04gqu53', '', '完成了子任务 \"22\"', 'createChild', '2018-12-29 12:11:40', 'edbn6rz89fmh7a3ilgvukw14', 'task', '', 0, NULL, 'bars');
INSERT INTO `pear_project_log` VALUES (3916, 't69wv1zanypbxj2srg34ifkm', '6v7be19pwman2fird04gqu53', '', '指派给了 Chihiro', 'assign', '2018-12-29 12:11:40', '2hg0yfa9jpxz6q58ckrdol1u', 'task', 'y680trgedcavbhnz24u7i5m3', 0, NULL, 'user');
INSERT INTO `pear_project_log` VALUES (3917, '7k6rt1vmhcdb89jxawsiz23n', '6v7be19pwman2fird04gqu53', '77', '创建了任务 ', 'create', '2018-12-29 12:11:57', 'bi5ajpmxfsk9rwdg4l32yv1n', 'task', '', 0, NULL, 'plus');
INSERT INTO `pear_project_log` VALUES (3918, 'bs85197y2hl4gzaowp6ujxfc', '6v7be19pwman2fird04gqu53', '', '完成了子任务 \"22\"', 'createChild', '2018-12-29 12:11:57', 'edbn6rz89fmh7a3ilgvukw14', 'task', '', 0, NULL, 'bars');
INSERT INTO `pear_project_log` VALUES (3919, 'klijc6v9hy8dx457mfp3otra', '6v7be19pwman2fird04gqu53', '', '指派给了 Chihiro', 'assign', '2018-12-29 12:11:57', 'bi5ajpmxfsk9rwdg4l32yv1n', 'task', 'y680trgedcavbhnz24u7i5m3', 0, NULL, 'user');
INSERT INTO `pear_project_log` VALUES (3920, 'h72aki9vsqzf0lrwb18n6yd3', '6v7be19pwman2fird04gqu53', '12', '创建了任务 ', 'create', '2018-12-29 12:12:32', 'dmbtgy3phi2sz7j89q10xcoa', 'task', '', 0, NULL, 'plus');
INSERT INTO `pear_project_log` VALUES (3921, '97t5lacuwmre4v8jsh0g3q2p', '6v7be19pwman2fird04gqu53', '', '添加了子任务 \"22\"', 'createChild', '2018-12-29 12:12:32', 'edbn6rz89fmh7a3ilgvukw14', 'task', '', 0, NULL, 'bars');
INSERT INTO `pear_project_log` VALUES (3922, '9dok2m0rjq81zsbptc45x7yf', '6v7be19pwman2fird04gqu53', '', '指派给了 Chihiro', 'assign', '2018-12-29 12:12:32', 'dmbtgy3phi2sz7j89q10xcoa', 'task', 'y680trgedcavbhnz24u7i5m3', 0, NULL, 'user');
INSERT INTO `pear_project_log` VALUES (3923, 'jhmi9ud8nxv7t26bzf5wspc0', '6v7be19pwman2fird04gqu53', '1', '创建了任务 ', 'create', '2018-12-29 12:12:41', 'ywiahqcb50rkem376js9nflv', 'task', '', 0, NULL, 'plus');
INSERT INTO `pear_project_log` VALUES (3924, 'vswa2btoujq5ycmfz4193npk', '6v7be19pwman2fird04gqu53', '', '添加了子任务 \"789\"', 'createChild', '2018-12-29 12:12:41', '3urs09e57btygqhjdfx2pwmn', 'task', '', 0, NULL, 'bars');
INSERT INTO `pear_project_log` VALUES (3925, 'm8195lgdibutzjrqo23aeh06', '6v7be19pwman2fird04gqu53', '', '认领了任务 ', 'claim', '2018-12-29 12:12:41', 'ywiahqcb50rkem376js9nflv', 'task', '', 0, NULL, 'user');
INSERT INTO `pear_project_log` VALUES (3926, 'ylz9erqbjn3d0hxv8go6fitm', '6v7be19pwman2fird04gqu53', '2', '创建了任务 ', 'create', '2018-12-29 12:12:42', 'xebf08p2uc9sj6mkr5714lat', 'task', '', 0, NULL, 'plus');
INSERT INTO `pear_project_log` VALUES (3927, 'oy0f23w568vg9jlqapebmdns', '6v7be19pwman2fird04gqu53', '', '添加了子任务 \"789\"', 'createChild', '2018-12-29 12:12:42', '3urs09e57btygqhjdfx2pwmn', 'task', '', 0, NULL, 'bars');
INSERT INTO `pear_project_log` VALUES (3928, 'xsfe94pvt87mbyi36oqrk10c', '6v7be19pwman2fird04gqu53', '', '认领了任务 ', 'claim', '2018-12-29 12:12:42', 'xebf08p2uc9sj6mkr5714lat', 'task', '', 0, NULL, 'user');
INSERT INTO `pear_project_log` VALUES (3929, 'hxajk4rplqoe9gn1tu8672fb', '6v7be19pwman2fird04gqu53', '3', '创建了任务 ', 'create', '2018-12-29 12:12:44', 'p5axvq94lr7enmhb83o2zfks', 'task', '', 0, NULL, 'plus');
INSERT INTO `pear_project_log` VALUES (3930, 'zmb27c59vxne6jar3if04hlk', '6v7be19pwman2fird04gqu53', '', '添加了子任务 \"789\"', 'createChild', '2018-12-29 12:12:44', '3urs09e57btygqhjdfx2pwmn', 'task', '', 0, NULL, 'bars');
INSERT INTO `pear_project_log` VALUES (3931, 'v0t2yzoch1a6urex3lb8npfw', '6v7be19pwman2fird04gqu53', '', '认领了任务 ', 'claim', '2018-12-29 12:12:44', 'p5axvq94lr7enmhb83o2zfks', 'task', '', 0, NULL, 'user');
INSERT INTO `pear_project_log` VALUES (3932, '2kvg64szutj5amh89d1q0i7w', '6v7be19pwman2fird04gqu53', '4', '创建了任务 ', 'create', '2018-12-29 12:14:21', 'lert5uyi790q2jfpbmzgak1o', 'task', '', 0, NULL, 'plus');
INSERT INTO `pear_project_log` VALUES (3933, 'b8l3jgk10a6h5mq2pyz9eoiv', '6v7be19pwman2fird04gqu53', '', '添加了子任务 \"789\"', 'createChild', '2018-12-29 12:14:21', '3urs09e57btygqhjdfx2pwmn', 'task', '', 0, NULL, 'bars');
INSERT INTO `pear_project_log` VALUES (3934, 'pe7mrlxw2iqoyg6ka3bcfszh', '6v7be19pwman2fird04gqu53', '', '认领了任务 ', 'claim', '2018-12-29 12:14:21', 'lert5uyi790q2jfpbmzgak1o', 'task', '', 0, NULL, 'user');
INSERT INTO `pear_project_log` VALUES (3935, 'ouci27hjl9f56mxekwypdv3g', '6v7be19pwman2fird04gqu53', '5', '创建了任务 ', 'create', '2018-12-29 12:14:30', '25rzhoykix6pajsw9cgm1408', 'task', '', 0, NULL, 'plus');
INSERT INTO `pear_project_log` VALUES (3936, '2pma6dyvwj9ktrbe0u58igzl', '6v7be19pwman2fird04gqu53', '', '添加了子任务 \"789\"', 'createChild', '2018-12-29 12:14:30', '3urs09e57btygqhjdfx2pwmn', 'task', '', 0, NULL, 'bars');
INSERT INTO `pear_project_log` VALUES (3937, 'bj6hlw48vcmori9es0pzfdun', '6v7be19pwman2fird04gqu53', '', '认领了任务 ', 'claim', '2018-12-29 12:14:30', '25rzhoykix6pajsw9cgm1408', 'task', '', 0, NULL, 'user');
INSERT INTO `pear_project_log` VALUES (3938, '06sw7kf1ricaqg2yoxnd8buj', '6v7be19pwman2fird04gqu53', '1', '创建了任务 ', 'create', '2018-12-29 12:15:33', 'cmrdn8soz4g26fy0qa3ib7te', 'task', '', 0, NULL, 'plus');
INSERT INTO `pear_project_log` VALUES (3939, 'pu8jn0labrgs3w7qxoh2i1ct', '6v7be19pwman2fird04gqu53', '', '添加了子任务 \"333\"', 'createChild', '2018-12-29 12:15:33', 'tx6loaugrd0s3e1mhk52iznp', 'task', '', 0, NULL, 'bars');
INSERT INTO `pear_project_log` VALUES (3940, 'jsyp6c5a1elmidvnk89g472r', '6v7be19pwman2fird04gqu53', '', '认领了任务 ', 'claim', '2018-12-29 12:15:33', 'cmrdn8soz4g26fy0qa3ib7te', 'task', '', 0, NULL, 'user');
INSERT INTO `pear_project_log` VALUES (3942, 'wkdzbvgh6stn7r1i4yxpoj9q', '6v7be19pwman2fird04gqu53', '3', '创建了任务 ', 'create', '2018-12-29 12:16:19', 'qfakryig3ztpv5uw6e2obx08', 'task', '', 0, NULL, 'plus');
INSERT INTO `pear_project_log` VALUES (3943, 'e3z5lfu497no06hqrwdmcxgb', '6v7be19pwman2fird04gqu53', '', '添加了子任务 \"3\"', 'createChild', '2018-12-29 12:16:19', 'tx6loaugrd0s3e1mhk52iznp', 'task', '', 0, NULL, 'bars');
INSERT INTO `pear_project_log` VALUES (3944, 'g8d693u0qopr5msa2itvhejc', '6v7be19pwman2fird04gqu53', '', '认领了任务 ', 'claim', '2018-12-29 12:16:19', 'qfakryig3ztpv5uw6e2obx08', 'task', '', 0, NULL, 'user');
INSERT INTO `pear_project_log` VALUES (3945, 'thw032pbsjf8q61yoadk94eg', '6v7be19pwman2fird04gqu53', '4', '创建了任务 ', 'create', '2018-12-29 12:22:17', 'e16tvkg4uoixnz9hjaf5l3wr', 'task', '', 0, NULL, 'plus');
INSERT INTO `pear_project_log` VALUES (3946, 'km0t9szd1gc37alpujqhf8ry', '6v7be19pwman2fird04gqu53', '', '添加了子任务 \"4\"', 'createChild', '2018-12-29 12:22:17', 'tx6loaugrd0s3e1mhk52iznp', 'task', '', 0, NULL, 'bars');
INSERT INTO `pear_project_log` VALUES (3947, 'witaxj3zvcf58rbq0y6s97nm', '6v7be19pwman2fird04gqu53', '', '认领了任务 ', 'claim', '2018-12-29 12:22:17', 'e16tvkg4uoixnz9hjaf5l3wr', 'task', '', 0, NULL, 'user');
INSERT INTO `pear_project_log` VALUES (3948, 'l1u2ncj9deq6i5bp8tysrg3z', '6v7be19pwman2fird04gqu53', '5', '创建了任务 ', 'create', '2018-12-29 12:22:18', 'f35oyrln286s7p4u9vmeghdw', 'task', '', 0, NULL, 'plus');
INSERT INTO `pear_project_log` VALUES (3949, 'efgjtyv1d3uckbos62xa078h', '6v7be19pwman2fird04gqu53', '', '添加了子任务 \"5\"', 'createChild', '2018-12-29 12:22:18', 'tx6loaugrd0s3e1mhk52iznp', 'task', '', 0, NULL, 'bars');
INSERT INTO `pear_project_log` VALUES (3950, 'w1n6gshr5ftk3b0pjvqxyld2', '6v7be19pwman2fird04gqu53', '', '认领了任务 ', 'claim', '2018-12-29 12:22:18', 'f35oyrln286s7p4u9vmeghdw', 'task', '', 0, NULL, 'user');
INSERT INTO `pear_project_log` VALUES (3951, '6wfip04jx5h8nvdzes29gb1y', '6v7be19pwman2fird04gqu53', '6', '创建了任务 ', 'create', '2018-12-29 12:22:19', 'yqwe2aiupvg5zj1so4krm86l', 'task', '', 0, NULL, 'plus');
INSERT INTO `pear_project_log` VALUES (3952, 'rt7jwfvlsi0hbazod9mc2x6n', '6v7be19pwman2fird04gqu53', '', '添加了子任务 \"6\"', 'createChild', '2018-12-29 12:22:19', 'tx6loaugrd0s3e1mhk52iznp', 'task', '', 0, NULL, 'bars');
INSERT INTO `pear_project_log` VALUES (3953, '3y5rmwga8dfi9npulbv2c01q', '6v7be19pwman2fird04gqu53', '', '认领了任务 ', 'claim', '2018-12-29 12:22:19', 'yqwe2aiupvg5zj1so4krm86l', 'task', '', 0, NULL, 'user');
INSERT INTO `pear_project_log` VALUES (3954, 'jnlt9q7udp86rme0h4vogk3s', '6v7be19pwman2fird04gqu53', '7', '创建了任务 ', 'create', '2018-12-29 12:22:22', 'yhs4xb7g3vu9pnwfq5l1zioa', 'task', '', 0, NULL, 'plus');
INSERT INTO `pear_project_log` VALUES (3955, 'd5ji698spacgwzq7n2tky3ru', '6v7be19pwman2fird04gqu53', '', '添加了子任务 \"7\"', 'createChild', '2018-12-29 12:22:22', 'tx6loaugrd0s3e1mhk52iznp', 'task', '', 0, NULL, 'bars');
INSERT INTO `pear_project_log` VALUES (3956, '4b90ze26hmprkw5adxjy8ivt', '6v7be19pwman2fird04gqu53', '', '认领了任务 ', 'claim', '2018-12-29 12:22:22', 'yhs4xb7g3vu9pnwfq5l1zioa', 'task', '', 0, NULL, 'user');
INSERT INTO `pear_project_log` VALUES (3957, '5f0xugvdj3wp46hyte7lnamk', '6v7be19pwman2fird04gqu53', '5', '创建了任务 ', 'create', '2018-12-29 12:22:52', 'jo3vbswk8ze57filmcptun2g', 'task', '', 0, NULL, 'plus');
INSERT INTO `pear_project_log` VALUES (3958, '7bmtyslzh0w8aeu213onq69p', '6v7be19pwman2fird04gqu53', '', '添加了子任务 \"5\"', 'createChild', '2018-12-29 12:22:52', 'oz2xwp8v0niahdc7lekjtsrg', 'task', '', 0, NULL, 'bars');
INSERT INTO `pear_project_log` VALUES (3959, 'rwy5p9fnkbc0ds4ltoeiz7am', '6v7be19pwman2fird04gqu53', '', '认领了任务 ', 'claim', '2018-12-29 12:22:52', 'jo3vbswk8ze57filmcptun2g', 'task', '', 0, NULL, 'user');
INSERT INTO `pear_project_log` VALUES (3960, 'paxcuosjmf7g831zl0ndvhbe', '6v7be19pwman2fird04gqu53', '8', '创建了任务 ', 'create', '2018-12-29 12:22:53', '35i8ptd1fs9hrbk0glv47ycj', 'task', '', 0, NULL, 'plus');
INSERT INTO `pear_project_log` VALUES (3961, 'mh0fe4tr9iup72jn85z6xay3', '6v7be19pwman2fird04gqu53', '', '添加了子任务 \"8\"', 'createChild', '2018-12-29 12:22:53', 'oz2xwp8v0niahdc7lekjtsrg', 'task', '', 0, NULL, 'bars');
INSERT INTO `pear_project_log` VALUES (3962, '6jurq17m9fl43ekcn5x8y2oa', '6v7be19pwman2fird04gqu53', '', '认领了任务 ', 'claim', '2018-12-29 12:22:53', '35i8ptd1fs9hrbk0glv47ycj', 'task', '', 0, NULL, 'user');
INSERT INTO `pear_project_log` VALUES (3963, '7o12ivmp9ygu5kjclzn6rwd3', '6v7be19pwman2fird04gqu53', '7', '创建了任务 ', 'create', '2018-12-29 12:22:54', 'pn3dmjavhrc1bewgi4yz25x9', 'task', '', 0, NULL, 'plus');
INSERT INTO `pear_project_log` VALUES (3964, 'k7dht9cq4e01vns2ojxgiyb8', '6v7be19pwman2fird04gqu53', '', '添加了子任务 \"7\"', 'createChild', '2018-12-29 12:22:54', 'oz2xwp8v0niahdc7lekjtsrg', 'task', '', 0, NULL, 'bars');
INSERT INTO `pear_project_log` VALUES (3965, 'cl5s4ro3m1x9hejf8dbyzatk', '6v7be19pwman2fird04gqu53', '', '认领了任务 ', 'claim', '2018-12-29 12:22:54', 'pn3dmjavhrc1bewgi4yz25x9', 'task', '', 0, NULL, 'user');
INSERT INTO `pear_project_log` VALUES (3966, '54taxf2qnbymd9wiczo0rpve', '6v7be19pwman2fird04gqu53', '9', '创建了任务 ', 'create', '2018-12-29 12:22:55', 'p5r8a4gwfxmn9sqit2jvkl71', 'task', '', 0, NULL, 'plus');
INSERT INTO `pear_project_log` VALUES (3967, 'y10gb254fwrimqnu9jszkc73', '6v7be19pwman2fird04gqu53', '', '添加了子任务 \"9\"', 'createChild', '2018-12-29 12:22:55', 'oz2xwp8v0niahdc7lekjtsrg', 'task', '', 0, NULL, 'bars');
INSERT INTO `pear_project_log` VALUES (3968, 'j8m1lxeschgiw6ot95n4r2av', '6v7be19pwman2fird04gqu53', '', '认领了任务 ', 'claim', '2018-12-29 12:22:55', 'p5r8a4gwfxmn9sqit2jvkl71', 'task', '', 0, NULL, 'user');
INSERT INTO `pear_project_log` VALUES (3969, 'xvlo3je8y61trsi0wdm7ac45', '6v7be19pwman2fird04gqu53', '1', '创建了任务 ', 'create', '2018-12-29 12:23:00', 'aenxk82rgwm5qcsuo0b7hi4f', 'task', '', 0, NULL, 'plus');
INSERT INTO `pear_project_log` VALUES (3970, '3ynx5bf61qmev4rjl2w8gksc', '6v7be19pwman2fird04gqu53', '', '添加了子任务 \"1\"', 'createChild', '2018-12-29 12:23:00', 'oz2xwp8v0niahdc7lekjtsrg', 'task', '', 0, NULL, 'bars');
INSERT INTO `pear_project_log` VALUES (3971, 'hkpx0i56wftbj7o2c84agl1m', '6v7be19pwman2fird04gqu53', '', '认领了任务 ', 'claim', '2018-12-29 12:23:00', 'aenxk82rgwm5qcsuo0b7hi4f', 'task', '', 0, NULL, 'user');
INSERT INTO `pear_project_log` VALUES (3972, 'cuhw96e2mk5ft0rpalgb8doq', '6v7be19pwman2fird04gqu53', '7', '创建了任务 ', 'create', '2018-12-29 12:24:25', 'vf8xtpclba3od21kmih5us9q', 'task', '', 0, NULL, 'plus');
INSERT INTO `pear_project_log` VALUES (3973, 'fm9oyz65ajn0xqb81wc3ievr', '6v7be19pwman2fird04gqu53', '', '添加了子任务 \"7\"', 'createChild', '2018-12-29 12:24:25', '3urs09e57btygqhjdfx2pwmn', 'task', '', 0, NULL, 'bars');
INSERT INTO `pear_project_log` VALUES (3974, '952evikzqod30sh6a41mbgru', '6v7be19pwman2fird04gqu53', '', '认领了任务 ', 'claim', '2018-12-29 12:24:25', 'vf8xtpclba3od21kmih5us9q', 'task', '', 0, NULL, 'user');
INSERT INTO `pear_project_log` VALUES (3975, 'l4merydg0x3jkbiuowqc28fs', '6v7be19pwman2fird04gqu53', '9', '创建了任务 ', 'create', '2018-12-29 12:24:26', '2ohuv1jm3abrs8ldni5p9z06', 'task', '', 0, NULL, 'plus');
INSERT INTO `pear_project_log` VALUES (3976, 'u1d53a8ecxvnl9zpth0qgw4j', '6v7be19pwman2fird04gqu53', '', '添加了子任务 \"9\"', 'createChild', '2018-12-29 12:24:26', '3urs09e57btygqhjdfx2pwmn', 'task', '', 0, NULL, 'bars');
INSERT INTO `pear_project_log` VALUES (3977, 'wtc2u0jsx9h4o8vz1p376mrl', '6v7be19pwman2fird04gqu53', '', '认领了任务 ', 'claim', '2018-12-29 12:24:26', '2ohuv1jm3abrs8ldni5p9z06', 'task', '', 0, NULL, 'user');
INSERT INTO `pear_project_log` VALUES (3978, '0adg97cq2ipl5bmvj13rkt4w', '6v7be19pwman2fird04gqu53', '1', '创建了任务 ', 'create', '2018-12-29 12:29:39', 'wamzl34n6jfrhiyoe09v2ktb', 'task', '', 0, NULL, 'plus');
INSERT INTO `pear_project_log` VALUES (3979, 'cjf17vsmiz84raxk52eunwdh', '6v7be19pwman2fird04gqu53', '', '添加了子任务 \"1\"', 'createChild', '2018-12-29 12:29:39', '98lqy4vaiprk60uzbojdmsgx', 'task', '', 0, NULL, 'bars');
INSERT INTO `pear_project_log` VALUES (3980, 'buw4ozsyxakdit6e5vf3l7q9', '6v7be19pwman2fird04gqu53', '', '认领了任务 ', 'claim', '2018-12-29 12:29:39', 'wamzl34n6jfrhiyoe09v2ktb', 'task', '', 0, NULL, 'user');
INSERT INTO `pear_project_log` VALUES (3981, '4osxw90np216glrhumzk7fcj', '6v7be19pwman2fird04gqu53', '2', '创建了任务 ', 'create', '2018-12-29 12:29:40', 'rgshi61c4xol5ue9f2n8m3bd', 'task', '', 0, NULL, 'plus');
INSERT INTO `pear_project_log` VALUES (3982, 'e0u7act8qihwdm3nor9bxv5z', '6v7be19pwman2fird04gqu53', '', '添加了子任务 \"2\"', 'createChild', '2018-12-29 12:29:40', '98lqy4vaiprk60uzbojdmsgx', 'task', '', 0, NULL, 'bars');
INSERT INTO `pear_project_log` VALUES (3983, 'pi7y3njsxumgchbf6r2vozqd', '6v7be19pwman2fird04gqu53', '', '认领了任务 ', 'claim', '2018-12-29 12:29:40', 'rgshi61c4xol5ue9f2n8m3bd', 'task', '', 0, NULL, 'user');
INSERT INTO `pear_project_log` VALUES (3984, 'cbx4gq9voi51dz06lfykhp2w', '6v7be19pwman2fird04gqu53', '3', '创建了任务 ', 'create', '2018-12-29 12:29:41', 'kny3xf7o41rli9s0pwjmhdqc', 'task', '', 0, NULL, 'plus');
INSERT INTO `pear_project_log` VALUES (3985, 'mt8qukh2w6xdypoger7zis54', '6v7be19pwman2fird04gqu53', '', '添加了子任务 \"3\"', 'createChild', '2018-12-29 12:29:41', '98lqy4vaiprk60uzbojdmsgx', 'task', '', 0, NULL, 'bars');
INSERT INTO `pear_project_log` VALUES (3986, 'wy2ch8xs7ftmk93rlnivbeu4', '6v7be19pwman2fird04gqu53', '', '认领了任务 ', 'claim', '2018-12-29 12:29:41', 'kny3xf7o41rli9s0pwjmhdqc', 'task', '', 0, NULL, 'user');
INSERT INTO `pear_project_log` VALUES (3987, 'dmike23ryw5qhf0anxpt46bj', '6v7be19pwman2fird04gqu53', '4', '创建了任务 ', 'create', '2018-12-29 12:29:42', 'y2zos3hg9058alwet46xmukp', 'task', '', 0, NULL, 'plus');
INSERT INTO `pear_project_log` VALUES (3988, '9juosez4wvklpdchq37826nt', '6v7be19pwman2fird04gqu53', '', '添加了子任务 \"4\"', 'createChild', '2018-12-29 12:29:42', '98lqy4vaiprk60uzbojdmsgx', 'task', '', 0, NULL, 'bars');
INSERT INTO `pear_project_log` VALUES (3989, 'fpjz6s58owxd20b3irhkynm1', '6v7be19pwman2fird04gqu53', '', '认领了任务 ', 'claim', '2018-12-29 12:29:42', 'y2zos3hg9058alwet46xmukp', 'task', '', 0, NULL, 'user');
INSERT INTO `pear_project_log` VALUES (3990, 'xmudezpvr4613atijfqlwhyn', '6v7be19pwman2fird04gqu53', '5', '创建了任务 ', 'create', '2018-12-29 12:29:43', 'wqu7verc5i4p19h0y32x6tmo', 'task', '', 0, NULL, 'plus');
INSERT INTO `pear_project_log` VALUES (3991, 'upa9vqkys30fmejcz4nh1rwd', '6v7be19pwman2fird04gqu53', '', '添加了子任务 \"5\"', 'createChild', '2018-12-29 12:29:43', '98lqy4vaiprk60uzbojdmsgx', 'task', '', 0, NULL, 'bars');
INSERT INTO `pear_project_log` VALUES (3992, 'uwvdnqm1y893irt5jc46sze0', '6v7be19pwman2fird04gqu53', '', '认领了任务 ', 'claim', '2018-12-29 12:29:43', 'wqu7verc5i4p19h0y32x6tmo', 'task', '', 0, NULL, 'user');
INSERT INTO `pear_project_log` VALUES (3993, 'egms06q7hnw4ulf3p1jvotkb', '6v7be19pwman2fird04gqu53', '6', '创建了任务 ', 'create', '2018-12-29 12:29:44', '0h8mt7sw1ki5fuxv2y6d3jag', 'task', '', 0, NULL, 'plus');
INSERT INTO `pear_project_log` VALUES (3994, 'ax842wv1uenslbizyth7om0p', '6v7be19pwman2fird04gqu53', '', '添加了子任务 \"6\"', 'createChild', '2018-12-29 12:29:44', '98lqy4vaiprk60uzbojdmsgx', 'task', '', 0, NULL, 'bars');
INSERT INTO `pear_project_log` VALUES (3995, '85hnga9li4mfqv1weo6tyzds', '6v7be19pwman2fird04gqu53', '', '认领了任务 ', 'claim', '2018-12-29 12:29:44', '0h8mt7sw1ki5fuxv2y6d3jag', 'task', '', 0, NULL, 'user');
INSERT INTO `pear_project_log` VALUES (3996, 's0oqyw9z1ukhmd7ce2xpf5v4', '6v7be19pwman2fird04gqu53', '7', '创建了任务 ', 'create', '2018-12-29 12:29:46', '1hcrmvgfjtu5qnadl869bkxo', 'task', '', 0, NULL, 'plus');
INSERT INTO `pear_project_log` VALUES (3997, 'c4hdo7sxeqam9gt5runbl0py', '6v7be19pwman2fird04gqu53', '', '添加了子任务 \"7\"', 'createChild', '2018-12-29 12:29:46', '98lqy4vaiprk60uzbojdmsgx', 'task', '', 0, NULL, 'bars');
INSERT INTO `pear_project_log` VALUES (3998, 'udfj9135zixo7g2rway6mknc', '6v7be19pwman2fird04gqu53', '', '认领了任务 ', 'claim', '2018-12-29 12:29:46', '1hcrmvgfjtu5qnadl869bkxo', 'task', '', 0, NULL, 'user');
INSERT INTO `pear_project_log` VALUES (3999, 'k6h170ma4zteuyb9dp8nicsf', '6v7be19pwman2fird04gqu53', '6', '创建了任务 ', 'create', '2018-12-29 12:29:54', 'puj84l5av3f0e7k9oyw2zqcr', 'task', '', 0, NULL, 'plus');
INSERT INTO `pear_project_log` VALUES (4000, 'gk7bdt2pmilwc8hunx19y6zq', '6v7be19pwman2fird04gqu53', '', '添加了子任务 \"6\"', 'createChild', '2018-12-29 12:29:54', '98lqy4vaiprk60uzbojdmsgx', 'task', '', 0, NULL, 'bars');
INSERT INTO `pear_project_log` VALUES (4001, 'adhr0wxonpt27zk9ecq4m6u1', '6v7be19pwman2fird04gqu53', '', '认领了任务 ', 'claim', '2018-12-29 12:29:54', 'puj84l5av3f0e7k9oyw2zqcr', 'task', '', 0, NULL, 'user');
INSERT INTO `pear_project_log` VALUES (4002, 'se7w26u1xzk8cbm4oqfn3rpy', '6v7be19pwman2fird04gqu53', '8', '创建了任务 ', 'create', '2018-12-29 12:29:56', 'jftz4y5is1hwrlmac07nd8q6', 'task', '', 0, NULL, 'plus');
INSERT INTO `pear_project_log` VALUES (4003, '0m3hn9v7x2q4ig6etzwfo8kd', '6v7be19pwman2fird04gqu53', '', '添加了子任务 \"8\"', 'createChild', '2018-12-29 12:29:56', '98lqy4vaiprk60uzbojdmsgx', 'task', '', 0, NULL, 'bars');
INSERT INTO `pear_project_log` VALUES (4004, 'm7azwxsht603859gykcdpo2v', '6v7be19pwman2fird04gqu53', '', '认领了任务 ', 'claim', '2018-12-29 12:29:56', 'jftz4y5is1hwrlmac07nd8q6', 'task', '', 0, NULL, 'user');
INSERT INTO `pear_project_log` VALUES (4005, 'jc7a30ur8bzgsvw29lxyinok', '6v7be19pwman2fird04gqu53', '415', NULL, 'comment', '2018-12-29 12:40:02', '98lqy4vaiprk60uzbojdmsgx', 'task', '0', 1, NULL, NULL);
INSERT INTO `pear_project_log` VALUES (4006, 'za961k07mbpd34vuoxfn8wc5', '6v7be19pwman2fird04gqu53', '8989', NULL, 'comment', '2018-12-29 12:40:21', '98lqy4vaiprk60uzbojdmsgx', 'task', '0', 1, NULL, NULL);
INSERT INTO `pear_project_log` VALUES (4007, 'j0k1h37iuqnocylw6fe94za2', '6v7be19pwman2fird04gqu53', '88ss', '更新了内容 ', 'name', '2018-12-29 12:47:25', '98lqy4vaiprk60uzbojdmsgx', 'task', '', 0, NULL, 'edit');
INSERT INTO `pear_project_log` VALUES (4008, 'v1e4dhlq7giuwk2bmz35ncf8', '6v7be19pwman2fird04gqu53', '88ss', '更新了备注 ', 'content', '2018-12-29 12:47:35', '98lqy4vaiprk60uzbojdmsgx', 'task', '', 0, NULL, 'file-text');
INSERT INTO `pear_project_log` VALUES (4009, 'sdjkuz4bniprcha3qy6ow51m', '6v7be19pwman2fird04gqu53', '88ss', '更新了备注 ', 'content', '2018-12-29 12:47:41', '98lqy4vaiprk60uzbojdmsgx', 'task', '', 0, NULL, 'file-text');
INSERT INTO `pear_project_log` VALUES (4010, 'rdnplfaxjvsuy8q39504eb7c', '6v7be19pwman2fird04gqu53', '88ss', '更新了备注 ', 'content', '2018-12-29 12:47:46', '98lqy4vaiprk60uzbojdmsgx', 'task', '', 0, NULL, 'file-text');
INSERT INTO `pear_project_log` VALUES (4011, 'f4vq6utlabw7my1gnzx8390k', '6v7be19pwman2fird04gqu53', '99', NULL, 'comment', '2018-12-29 12:52:47', '98lqy4vaiprk60uzbojdmsgx', 'task', '0', 1, NULL, NULL);
INSERT INTO `pear_project_log` VALUES (4012, '5ope0jf6ytgqvl3m8xdh7bkz', '6v7be19pwman2fird04gqu53', 'dff', NULL, 'comment', '2018-12-29 12:58:22', '98lqy4vaiprk60uzbojdmsgx', 'task', '0', 1, NULL, NULL);
INSERT INTO `pear_project_log` VALUES (4013, 'd3b0xn69ljvpikcf2az4eg81', '6v7be19pwman2fird04gqu53', '8989', NULL, 'comment', '2018-12-29 12:58:24', '98lqy4vaiprk60uzbojdmsgx', 'task', '0', 1, NULL, NULL);
INSERT INTO `pear_project_log` VALUES (4014, 'aum2zlh4y38cj9t1nriebp07', '6v7be19pwman2fird04gqu53', '13\n55\n', NULL, 'comment', '2018-12-29 12:58:28', '98lqy4vaiprk60uzbojdmsgx', 'task', '0', 1, NULL, NULL);
INSERT INTO `pear_project_log` VALUES (4015, 'elwir0n5yzh4tbx1om87s3gk', '6v7be19pwman2fird04gqu53', '89\n\n\n66\n\n66\n', NULL, 'comment', '2018-12-29 12:59:23', '98lqy4vaiprk60uzbojdmsgx', 'task', '0', 1, NULL, NULL);
INSERT INTO `pear_project_log` VALUES (4016, 'tkxr8zwagy106f3ipmed7boj', '6v7be19pwman2fird04gqu53', 'sss</br>ee', NULL, 'comment', '2018-12-29 13:00:39', '98lqy4vaiprk60uzbojdmsgx', 'task', '0', 1, NULL, NULL);
INSERT INTO `pear_project_log` VALUES (4017, '5zdypx9jarfk836onmq2ibge', '6v7be19pwman2fird04gqu53', '9', NULL, 'comment', '2018-12-29 13:01:48', '98lqy4vaiprk60uzbojdmsgx', 'task', '0', 1, NULL, NULL);
INSERT INTO `pear_project_log` VALUES (4018, 'wh0v2fqp9nkix1sg56z8mljo', '6v7be19pwman2fird04gqu53', '测试', NULL, 'comment', '2018-12-29 13:01:52', '98lqy4vaiprk60uzbojdmsgx', 'task', '0', 1, NULL, NULL);
INSERT INTO `pear_project_log` VALUES (4019, '3xwke78sl49bragtovjhfp20', '6v7be19pwman2fird04gqu53', '', '完成了任务 ', 'done', '2018-12-29 13:03:57', '98lqy4vaiprk60uzbojdmsgx', 'task', '', 0, NULL, 'check');
INSERT INTO `pear_project_log` VALUES (4020, 'sdhi9e6kugrj2bnc83qt7y4w', '6v7be19pwman2fird04gqu53', '10', '创建了任务 ', 'create', '2018-12-29 13:05:03', '4fua38vpqgk706csx2lb9etj', 'task', '', 0, NULL, 'plus');
INSERT INTO `pear_project_log` VALUES (4021, '6a14fuo902x73zqsrkvnywhg', '6v7be19pwman2fird04gqu53', '', '添加了子任务 \"10\"', 'createChild', '2018-12-29 13:05:03', '98lqy4vaiprk60uzbojdmsgx', 'task', '', 0, NULL, 'bars');
INSERT INTO `pear_project_log` VALUES (4022, 'fn3bho7stwlm92r6g4j1a5pk', '6v7be19pwman2fird04gqu53', '', '认领了任务 ', 'claim', '2018-12-29 13:05:03', '4fua38vpqgk706csx2lb9etj', 'task', '', 0, NULL, 'user');
INSERT INTO `pear_project_log` VALUES (4023, 'o7v31qb6ysi4fugat25chxmd', '6v7be19pwman2fird04gqu53', '正在测试', '更新了内容 ', 'name', '2018-12-29 13:09:27', 'aut9wrz1pn0elf5s47ivx26o', 'task', '', 0, NULL, 'edit');
INSERT INTO `pear_project_log` VALUES (4024, 'eycx8z7s3juo4git9pradqvh', '6v7be19pwman2fird04gqu53', '<p><a href=\"https://www.baidu.com\" target=\"_blank\">这里是备注内容</a><br></p>', '更新了备注 ', 'content', '2018-12-29 13:10:28', 'aut9wrz1pn0elf5s47ivx26o', 'task', '', 0, NULL, 'file-text');
INSERT INTO `pear_project_log` VALUES (4025, 'q9hsz2valnwy0rfg8umpe3b7', '6v7be19pwman2fird04gqu53', '<p><a href=\"https://www.baidu.com\" target=\"_blank\">这里是备注内容</a><img src=\"http://easyproject.net/static/upload/image/default/20181229/83de513fff744399ab2a9d8f486f107c.png\" style=\"max-width: 100%;\"><br></p>', '更新了备注 ', 'content', '2018-12-29 13:10:58', 'aut9wrz1pn0elf5s47ivx26o', 'task', '', 0, NULL, 'file-text');
INSERT INTO `pear_project_log` VALUES (4026, 'zgonswqe0xvky469d2tfm3hj', '6v7be19pwman2fird04gqu53', 'dd', NULL, 'comment', '2018-12-29 13:16:32', 'aut9wrz1pn0elf5s47ivx26o', 'task', '0', 1, NULL, NULL);
INSERT INTO `pear_project_log` VALUES (4027, 'pjntgqukcr041hazbsv29imd', '6v7be19pwman2fird04gqu53', '正在测试', '更新了内容 ', 'name', '2018-12-29 13:18:40', 'aut9wrz1pn0elf5s47ivx26o', 'task', '', 0, NULL, 'edit');
INSERT INTO `pear_project_log` VALUES (4028, 'cqigul6pm3y4vrnabf2xowt9', '6v7be19pwman2fird04gqu53', '正在测试', '更新了内容 ', 'name', '2018-12-29 13:18:42', 'aut9wrz1pn0elf5s47ivx26o', 'task', '', 0, NULL, 'edit');
INSERT INTO `pear_project_log` VALUES (4029, 'jv7s1q0mw2hxdgfpk8r5zbuc', '6v7be19pwman2fird04gqu53', '正在测试', '更新了内容 ', 'name', '2018-12-29 13:18:50', 'aut9wrz1pn0elf5s47ivx26o', 'task', '', 0, NULL, 'edit');
INSERT INTO `pear_project_log` VALUES (4030, '5fgsnwq7xb2luvm6edz43yih', '6v7be19pwman2fird04gqu53', '正在测试', '更新了内容 ', 'name', '2018-12-29 13:18:58', 'aut9wrz1pn0elf5s47ivx26o', 'task', '', 0, NULL, 'edit');
INSERT INTO `pear_project_log` VALUES (4031, '7f3485jcnsz69a0dwtgrbvlu', '6v7be19pwman2fird04gqu53', '', '指派给了 Chihiro', 'assign', '2018-12-29 13:19:29', 'aut9wrz1pn0elf5s47ivx26o', 'task', 'y680trgedcavbhnz24u7i5m3', 0, NULL, 'user');
INSERT INTO `pear_project_log` VALUES (4032, 'lagx0bjhvmdt61ufrqi37zw8', '6v7be19pwman2fird04gqu53', '', '更新任务优先级为 非常紧急', 'pri', '2018-12-29 13:21:38', 'aut9wrz1pn0elf5s47ivx26o', 'task', '', 0, NULL, 'user');
INSERT INTO `pear_project_log` VALUES (4033, 'qfyrd27bjm93otwkne58p4ia', '6v7be19pwman2fird04gqu53', '', '更新任务优先级为 普通', 'pri', '2018-12-29 13:21:42', 'aut9wrz1pn0elf5s47ivx26o', 'task', '', 0, NULL, 'user');
INSERT INTO `pear_project_log` VALUES (4034, '576y0p2s8zkvqejcfga341ud', '6v7be19pwman2fird04gqu53', '', '更新任务优先级为 非常紧急', 'pri', '2018-12-29 13:21:46', 'aut9wrz1pn0elf5s47ivx26o', 'task', '', 0, NULL, 'user');
INSERT INTO `pear_project_log` VALUES (4035, 'lmn8pc5r0j39zvq26wsatoxf', '6v7be19pwman2fird04gqu53', '<p><a href=\"https://www.baidu.com\" target=\"_blank\">这里是备注内容</a><br></p><p><img src=\"http://easyproject.net/static/upload/image/default/20181229/34e9726ba24cfe286b33c2a8f388a144.png\" style=\"max-width:100%;\"><br></p>', '更新了备注 ', 'content', '2018-12-29 13:25:21', 'aut9wrz1pn0elf5s47ivx26o', 'task', '', 0, NULL, 'file-text');
INSERT INTO `pear_project_log` VALUES (4036, 'qibmkuh0pfnatdcs4j2xyw1o', '6v7be19pwman2fird04gqu53', '', '添加了参与者 vilson.2', 'inviteMember', '2018-12-29 13:25:31', 'aut9wrz1pn0elf5s47ivx26o', 'task', 'kqdcn2w40p58r31zyo6efjib', 0, NULL, 'user-add');
INSERT INTO `pear_project_log` VALUES (4037, 'wc7u9qmy628okg0zpt1iejb3', '6v7be19pwman2fird04gqu53', '', '指派给了 vilson.2', 'assign', '2018-12-29 13:25:36', 'aut9wrz1pn0elf5s47ivx26o', 'task', 'kqdcn2w40p58r31zyo6efjib', 0, NULL, 'user');
INSERT INTO `pear_project_log` VALUES (4038, 'l0z6a8u1rcjkxnte3pwobfv5', '6v7be19pwman2fird04gqu53', 'Tree 的 @on-select-change 和 @on-check-change 事件返回参数新增当前项', '更新了内容 ', 'name', '2018-12-29 13:27:16', 'aut9wrz1pn0elf5s47ivx26o', 'task', '', 0, NULL, 'edit');
INSERT INTO `pear_project_log` VALUES (4039, 'x8bgefzjv0p4iqhtlmwad7s3', '6v7be19pwman2fird04gqu53', '修复 Table 动态设置表头分组报错的问题', '更新了内容 ', 'name', '2018-12-29 13:27:35', '4mtnhwbe0gjdkaur2ic7xsv6', 'task', '', 0, NULL, 'edit');
INSERT INTO `pear_project_log` VALUES (4040, 'hlm2ei7403a9g1byzdvrkowc', '6v7be19pwman2fird04gqu53', '新增阿拉伯语', '更新了内容 ', 'name', '2018-12-29 13:27:51', 'hj5s73zk6amd9wfvbxoygpic', 'task', '', 0, NULL, 'edit');
INSERT INTO `pear_project_log` VALUES (4041, 'ctm4v1hlno20ksafdb8qjew9', '6v7be19pwman2fird04gqu53', 'Table 支持 slot-scope 用法', '更新了内容 ', 'name', '2018-12-29 13:28:02', 'l027b1dyrv93zu4ewmtoa6q5', 'task', '', 0, NULL, 'edit');
INSERT INTO `pear_project_log` VALUES (4042, 'e95h10orj3pu78lvbtdmczsk', '6v7be19pwman2fird04gqu53', 'Table 新增取消全选事件 @on-select-all-cancel。', '更新了内容 ', 'name', '2018-12-29 13:28:24', 'rqb7vi254tna3uzhdgo0f6ey', 'task', '', 0, NULL, 'edit');
INSERT INTO `pear_project_log` VALUES (4043, '5v8hz7qt2kgdjwaf46ui3nrl', '6v7be19pwman2fird04gqu53', 'Table 新增取消全选事件 @on-select-all-cancel', '更新了内容 ', 'name', '2018-12-29 13:28:26', 'rqb7vi254tna3uzhdgo0f6ey', 'task', '', 0, NULL, 'edit');
INSERT INTO `pear_project_log` VALUES (4044, 'pm524anfjqdvl1ukwr3gzhyx', '6v7be19pwman2fird04gqu53', '123', '创建了任务 ', 'create', '2018-12-29 16:08:33', 's5bxrym2p8qtjch1i6gnkvaw', 'task', '', 0, NULL, 'plus');
INSERT INTO `pear_project_log` VALUES (4045, 'qlyenmbjf264ochakvu39r0w', '6v7be19pwman2fird04gqu53', '', '认领了任务 ', 'claim', '2018-12-29 16:08:33', 's5bxrym2p8qtjch1i6gnkvaw', 'task', '', 0, NULL, 'user');
INSERT INTO `pear_project_log` VALUES (4046, '4eagjuoc15v3f6z0brkdsxwm', '6v7be19pwman2fird04gqu53', '', '完成了任务 ', 'done', '2018-12-29 21:44:15', 'aut9wrz1pn0elf5s47ivx26o', 'task', '', 0, NULL, 'check');
INSERT INTO `pear_project_log` VALUES (4047, 'b7z84xwlmr3cyjt15p9dqhoi', '6v7be19pwman2fird04gqu53', '', '重做了任务 ', 'redo', '2018-12-29 21:45:14', 'aut9wrz1pn0elf5s47ivx26o', 'task', '', 0, NULL, 'undo');
INSERT INTO `pear_project_log` VALUES (4048, '9krvs6f5j03hyxoduae4n7gm', '6v7be19pwman2fird04gqu53', '<p><a href=\"https://www.baidu.com\" target=\"_blank\">这里是备注内容</a><br></p><p><img src=\"https://beta.vilson.xyz/static/upload/image/default/20181229/54cd2d50d19731f3231fc96d26a823bf.png\" style=\"max-width:100%;\"><br></p>', '更新了备注 ', 'content', '2018-12-29 21:45:42', 'aut9wrz1pn0elf5s47ivx26o', 'task', '', 0, NULL, 'file-text');
INSERT INTO `pear_project_log` VALUES (4049, 'scxy36o5gpkltiujn1rm0v79', '6v7be19pwman2fird04gqu53', '', '添加了参与者 vilson', 'inviteMember', '2018-12-29 21:47:17', 'aut9wrz1pn0elf5s47ivx26o', 'task', '6v7be19pwman2fird04gqu53', 0, NULL, 'user-add');
INSERT INTO `pear_project_log` VALUES (4050, '24x68z9pivtjlqabsdcg3ywk', '6v7be19pwman2fird04gqu53', '', '指派给了 Chihiro', 'assign', '2018-12-29 21:47:20', 'aut9wrz1pn0elf5s47ivx26o', 'task', 'y680trgedcavbhnz24u7i5m3', 0, NULL, 'user');
INSERT INTO `pear_project_log` VALUES (4051, '21ycsgt58k9urfql4nep7bda', '6v7be19pwman2fird04gqu53', 'Hi~', NULL, 'comment', '2018-12-29 21:47:28', 'aut9wrz1pn0elf5s47ivx26o', 'task', '0', 1, NULL, NULL);
INSERT INTO `pear_project_log` VALUES (4052, '4m9cj3eg6srqou2i5abxlwzh', '6v7be19pwman2fird04gqu53', '', '把任务移到了回收站 ', 'recycle', '2018-12-30 09:04:09', 's5bxrym2p8qtjch1i6gnkvaw', 'task', '', 0, NULL, 'delete');
INSERT INTO `pear_project_log` VALUES (4053, 'f5x7v3sqhi1m4joy6cdbpu9t', '6v7be19pwman2fird04gqu53', '', '把任务移到了回收站 ', 'recycle', '2018-12-30 10:22:49', 's5bxrym2p8qtjch1i6gnkvaw', 'task', '', 0, NULL, 'delete');
INSERT INTO `pear_project_log` VALUES (4054, '84bnae6csizdo3vph9kjw1q0', '6v7be19pwman2fird04gqu53', '123', '创建了任务 ', 'create', '2018-12-30 10:24:40', 'w80m92aopfbcru6s5qe7z3ti', 'task', '', 0, NULL, 'plus');
INSERT INTO `pear_project_log` VALUES (4055, '1hyxiz4kt7j0pu9fs8enl5g6', '6v7be19pwman2fird04gqu53', '', '添加了子任务 \"123\"', 'createChild', '2018-12-30 10:24:40', 's5bxrym2p8qtjch1i6gnkvaw', 'task', '', 0, NULL, 'bars');
INSERT INTO `pear_project_log` VALUES (4056, 'djzr3kv7wicolasp2hmx96ub', '6v7be19pwman2fird04gqu53', '', '认领了任务 ', 'claim', '2018-12-30 10:24:40', 'w80m92aopfbcru6s5qe7z3ti', 'task', '', 0, NULL, 'user');
INSERT INTO `pear_project_log` VALUES (4057, 'vf8t0o5sp36hgazmijn1uewc', '6v7be19pwman2fird04gqu53', '222', '创建了任务 ', 'create', '2018-12-30 10:24:42', 'wrjgk84t2beam0yvxs61qinu', 'task', '', 0, NULL, 'plus');
INSERT INTO `pear_project_log` VALUES (4058, 'zaf14de3jrpobvins2kxm86u', '6v7be19pwman2fird04gqu53', '', '添加了子任务 \"222\"', 'createChild', '2018-12-30 10:24:42', 's5bxrym2p8qtjch1i6gnkvaw', 'task', '', 0, NULL, 'bars');
INSERT INTO `pear_project_log` VALUES (4059, 'agweirnvb41plzsfkx8jyt9c', '6v7be19pwman2fird04gqu53', '', '认领了任务 ', 'claim', '2018-12-30 10:24:42', 'wrjgk84t2beam0yvxs61qinu', 'task', '', 0, NULL, 'user');
INSERT INTO `pear_project_log` VALUES (4060, 'usiaxdk1538bcty0mlgjrqoh', '6v7be19pwman2fird04gqu53', '', '完成了任务 ', 'done', '2018-12-30 10:35:33', 'w80m92aopfbcru6s5qe7z3ti', 'task', '', 0, NULL, 'check');
INSERT INTO `pear_project_log` VALUES (4061, '5nyzc7djiefg80xtkqa32mpr', '6v7be19pwman2fird04gqu53', '', '完成了子任务 \"123\"', 'doneChild', '2018-12-30 10:35:33', 's5bxrym2p8qtjch1i6gnkvaw', 'task', '', 0, NULL, 'bars');
INSERT INTO `pear_project_log` VALUES (4062, '0zj738s1fit5blokvwgrmpy2', '6v7be19pwman2fird04gqu53', '', '重做了任务 ', 'redo', '2018-12-30 10:35:35', 'w80m92aopfbcru6s5qe7z3ti', 'task', '', 0, NULL, 'undo');
INSERT INTO `pear_project_log` VALUES (4063, 'heyz2qimsw6un7txjc8pklvg', '6v7be19pwman2fird04gqu53', '', '重做了子任务 \"123\"', 'redoChild', '2018-12-30 10:35:35', 's5bxrym2p8qtjch1i6gnkvaw', 'task', '', 0, NULL, 'undo');
INSERT INTO `pear_project_log` VALUES (4064, 'fgwdb84p9oazs6xk3cmynlj7', '6v7be19pwman2fird04gqu53', '789', NULL, 'comment', '2018-12-30 10:38:05', 's5bxrym2p8qtjch1i6gnkvaw', 'task', '0', 1, NULL, NULL);
INSERT INTO `pear_project_log` VALUES (4065, 'xioz6hrkbtelsmfw4cgyv983', '6v7be19pwman2fird04gqu53', '', '恢复了任务 ', 'recovery', '2018-12-30 11:22:14', 's5bxrym2p8qtjch1i6gnkvaw', 'task', '', 0, NULL, 'undo');
INSERT INTO `pear_project_log` VALUES (4066, 'l7ncz0t8fxj4sam5u6whq39p', '6v7be19pwman2fird04gqu53', '', '把任务移到了回收站 ', 'recycle', '2018-12-30 11:23:39', 's5bxrym2p8qtjch1i6gnkvaw', 'task', '', 0, NULL, 'delete');
INSERT INTO `pear_project_log` VALUES (4067, '32hzsjagcwdr0817f9o6i5vu', '6v7be19pwman2fird04gqu53', '', '恢复了任务 ', 'recovery', '2018-12-30 11:23:43', 's5bxrym2p8qtjch1i6gnkvaw', 'task', '', 0, NULL, 'undo');
INSERT INTO `pear_project_log` VALUES (4070, 'a58ekv7lmy4dx0tqjzs2iwr9', '6v7be19pwman2fird04gqu53', '阅读「分享」中的使用案例，为新产品发布计划建立一个公示板吧！', '更新了内容 ', 'name', '2018-12-30 13:31:43', '0tjma1un2gz8rf4ywo7c6de9', 'task', '', 0, NULL, 'edit');
INSERT INTO `pear_project_log` VALUES (4071, '4isl2cgedqz7utjo6kbv81ar', '6v7be19pwman2fird04gqu53', '', '把任务移到了回收站 ', 'recycle', '2018-12-30 15:30:09', 's5bxrym2p8qtjch1i6gnkvaw', 'task', '', 0, NULL, 'delete');
INSERT INTO `pear_project_log` VALUES (4072, 'phm3ed5l1vogjycaqntxwk8b', '6v7be19pwman2fird04gqu53', '123', '创建了任务 ', 'create', '2018-12-30 15:38:02', 'n9pe164krv8zghofilw750jq', 'task', '', 0, NULL, 'plus');
INSERT INTO `pear_project_log` VALUES (4073, 'ca8ixjvhk3p40mfqo7lue6gy', '6v7be19pwman2fird04gqu53', '', '认领了任务 ', 'claim', '2018-12-30 15:38:03', 'n9pe164krv8zghofilw750jq', 'task', '', 0, NULL, 'user');
INSERT INTO `pear_project_log` VALUES (4074, 'yz4urfgdkslc9jahq73vwt01', '6v7be19pwman2fird04gqu53', '', '把任务移到了回收站 ', 'recycle', '2018-12-30 15:38:35', 'n9pe164krv8zghofilw750jq', 'task', '', 0, NULL, 'delete');
INSERT INTO `pear_project_log` VALUES (4075, 'z26cd0s5ntgj7prh1x9vk3uq', '6v7be19pwman2fird04gqu53', '444', '创建了任务 ', 'create', '2018-12-30 15:39:15', 'oq7d3wbklenf12pgvuxhimr8', 'task', '', 0, NULL, 'plus');
INSERT INTO `pear_project_log` VALUES (4076, 'prgjo7vtns9k6qha43b0uled', '6v7be19pwman2fird04gqu53', '', '认领了任务 ', 'claim', '2018-12-30 15:39:15', 'oq7d3wbklenf12pgvuxhimr8', 'task', '', 0, NULL, 'user');
INSERT INTO `pear_project_log` VALUES (4077, 'yp26orn0w4am59xl3utiqsdg', '6v7be19pwman2fird04gqu53', '', '把任务移到了回收站 ', 'recycle', '2018-12-30 15:39:19', 'oq7d3wbklenf12pgvuxhimr8', 'task', '', 0, NULL, 'delete');
INSERT INTO `pear_project_log` VALUES (4081, '63a1jteb4qflz9pnig8c2k5u', '6v7be19pwman2fird04gqu53', '', '清除了截止时间 ', 'clearEndTime', '2018-12-30 22:15:33', 'mv4usefb06dxv8ez2spkl223', 'task', '', 0, NULL, 'calendar');
INSERT INTO `pear_project_log` VALUES (4082, 'urzst152ka3ep4w7ndm06qyg', '6v7be19pwman2fird04gqu53', '', '更新截止时间为 12月28日 18:00', 'setEndTime', '2018-12-30 22:15:36', 'mv4usefb06dxv8ez2spkl223', 'task', '', 0, NULL, 'calendar');
INSERT INTO `pear_project_log` VALUES (4083, 'xbf1rpj8nmv7l9u4d3w0qke5', '6v7be19pwman2fird04gqu53', '', '完成了任务 ', 'done', '2018-12-31 08:50:07', 'mv4usefb06dxv8ez2spkl223', 'task', '', 0, NULL, 'check');
INSERT INTO `pear_project_log` VALUES (4084, 'mroi3xe1wchq9t2p0bvg7uf5', '6v7be19pwman2fird04gqu53', '', '重做了任务 ', 'redo', '2018-12-31 08:50:10', 'mv4usefb06dxv8ez2spkl223', 'task', '', 0, NULL, 'border');
INSERT INTO `pear_project_log` VALUES (4085, 'iok3hc24sn6eftjr0lx9b7dv', '6v7be19pwman2fird04gqu53', '', '更新截止时间为 12月31日 18:00', 'setEndTime', '2018-12-31 09:18:10', 'mv4usefb06dxv8ez2spkl223', 'task', '', 0, NULL, 'calendar');
INSERT INTO `pear_project_log` VALUES (4086, 'ukx5mvn7lihws3gobc2ty1pf', '6v7be19pwman2fird04gqu53', '', '更新截止时间为 01月01日 18:00', 'setEndTime', '2018-12-31 09:20:39', 'mv4usefb06dxv8ez2spkl223', 'task', '', 0, NULL, 'calendar');
INSERT INTO `pear_project_log` VALUES (4087, '21y6n8o9f5p3xa7ihkglqrv0', '6v7be19pwman2fird04gqu53', '', '更新截止时间为 12月31日 18:00', 'setEndTime', '2018-12-31 09:27:09', 'mv4usefb06dxv8ez2spkl223', 'task', '', 0, NULL, 'calendar');
INSERT INTO `pear_project_log` VALUES (4088, 'v4g7qblyhwuat5p2c3znor1s', '6v7be19pwman2fird04gqu53', '', '更新截止时间为 12月30日 18:00', 'setEndTime', '2018-12-31 09:28:02', 'mv4usefb06dxv8ez2spkl223', 'task', '', 0, NULL, 'calendar');
INSERT INTO `pear_project_log` VALUES (4089, 'f86ehji9spwlaubgv4m2qnz5', '6v7be19pwman2fird04gqu53', '', '更新截止时间为 12月29日 18:00', 'setEndTime', '2018-12-31 09:28:18', 'mv4usefb06dxv8ez2spkl223', 'task', '', 0, NULL, 'calendar');
INSERT INTO `pear_project_log` VALUES (4090, 'y3x41uv5tacmnpq7gofji28r', '6v7be19pwman2fird04gqu53', '', '更新截止时间为 12月23日 18:00', 'setEndTime', '2018-12-31 09:28:30', 'mv4usefb06dxv8ez2spkl223', 'task', '', 0, NULL, 'calendar');
INSERT INTO `pear_project_log` VALUES (4091, 'em5bhyangxtiu7voczpwd3js', '6v7be19pwman2fird04gqu53', '', '更新截止时间为 12月31日 18:00', 'setEndTime', '2018-12-31 09:31:09', 'mv4usefb06dxv8ez2spkl223', 'task', '', 0, NULL, 'calendar');
INSERT INTO `pear_project_log` VALUES (4092, 'nbteasyp9hfg3z06wvkj71qi', '6v7be19pwman2fird04gqu53', '', '更新截止时间为 12月30日 18:00', 'setEndTime', '2018-12-31 09:32:06', 'mv4usefb06dxv8ez2spkl223', 'task', '', 0, NULL, 'calendar');
INSERT INTO `pear_project_log` VALUES (4093, 'ba26fwrk5q8x0tsvn4hmoedi', '6v7be19pwman2fird04gqu53', '', '更新截止时间为 12月23日 18:00', 'setEndTime', '2018-12-31 09:38:24', 'mv4usefb06dxv8ez2spkl223', 'task', '', 0, NULL, 'calendar');
INSERT INTO `pear_project_log` VALUES (4094, 'ionamswe2gj7hzdqx9br01f8', '6v7be19pwman2fird04gqu53', '', '更新截止时间为 12月28日 18:00', 'setEndTime', '2018-12-31 09:38:27', 'mv4usefb06dxv8ez2spkl223', 'task', '', 0, NULL, 'calendar');
INSERT INTO `pear_project_log` VALUES (4095, 'l6fhtq2gneva8yj571cd43zu', '6v7be19pwman2fird04gqu53', '', '更新截止时间为 01月03日 18:00', 'setEndTime', '2018-12-31 09:38:31', 'mv4usefb06dxv8ez2spkl223', 'task', '', 0, NULL, 'calendar');
INSERT INTO `pear_project_log` VALUES (4096, 'ifroz4bhkla789quv6x3dcsm', '6v7be19pwman2fird04gqu53', '', '更新截止时间为 12月31日 18:00', 'setEndTime', '2018-12-31 09:45:14', 'mv4usefb06dxv8ez2spkl223', 'task', '', 0, NULL, 'calendar');
INSERT INTO `pear_project_log` VALUES (4097, 'ob0m4yrs6uglxdkatfqj52zw', '6v7be19pwman2fird04gqu53', '', '更新截止时间为 12月30日 18:00', 'setEndTime', '2018-12-31 09:45:22', 'mv4usefb06dxv8ez2spkl223', 'task', '', 0, NULL, 'calendar');
INSERT INTO `pear_project_log` VALUES (4098, 'm6faqh85rlxvedy3cpzujnbw', '6v7be19pwman2fird04gqu53', '', '更新截止时间为 12月31日 18:00', 'setEndTime', '2018-12-31 09:46:20', 'mv4usefb06dxv8ez2spkl223', 'task', '', 0, NULL, 'calendar');
INSERT INTO `pear_project_log` VALUES (4099, 'slroc7k1x3twdva50m28hf6p', '6v7be19pwman2fird04gqu53', '', '更新截止时间为 01月01日 18:00', 'setEndTime', '2018-12-31 09:46:26', 'mv4usefb06dxv8ez2spkl223', 'task', '', 0, NULL, 'calendar');
INSERT INTO `pear_project_log` VALUES (4100, 'ncyk4b5ozwvuhrxd1sgp386f', '6v7be19pwman2fird04gqu53', '', '更新截止时间为 01月08日 18:00', 'setEndTime', '2018-12-31 09:49:53', 'mv4usefb06dxv8ez2spkl223', 'task', '', 0, NULL, 'calendar');
INSERT INTO `pear_project_log` VALUES (4101, 'c5fynatdm0wgvqk1rhijsopz', '6v7be19pwman2fird04gqu53', '', '添加了参与者 vilson', 'inviteMember', '2018-12-31 10:49:34', 'mv4usefb06dxv8ez2spkl223', 'task', '6v7be19pwman2fird04gqu53', 0, NULL, 'user-add');
INSERT INTO `pear_project_log` VALUES (4102, '51hc28jqn64zyspxlwmvrgak', '6v7be19pwman2fird04gqu53', '', '添加了参与者 Chihiro', 'inviteMember', '2018-12-31 10:49:34', 'mv4usefb06dxv8ez2spkl223', 'task', 'y680trgedcavbhnz24u7i5m3', 0, NULL, 'user-add');
INSERT INTO `pear_project_log` VALUES (4103, '96rdvspjbz1qfnxcogeam7h8', '6v7be19pwman2fird04gqu53', '', '完成了任务 ', 'done', '2018-12-31 14:07:44', 'mv4usefb06dxv8ez2spkl223', 'task', '', 0, NULL, 'check');
INSERT INTO `pear_project_log` VALUES (4104, '05k4jw2tv9zu67yhbd1oigsr', '6v7be19pwman2fird04gqu53', '', '重做了任务 ', 'redo', '2018-12-31 14:08:02', 'mv4usefb06dxv8ez2spkl223', 'task', '', 0, NULL, 'border');
INSERT INTO `pear_project_log` VALUES (4105, '186hgmstdjxa2b50cqovpfez', '6v7be19pwman2fird04gqu53', '', '完成了任务 ', 'done', '2018-12-31 14:08:10', 'mv4usefb06dxv8ez2spkl223', 'task', '', 0, NULL, 'check');
INSERT INTO `pear_project_log` VALUES (4106, 'dkx85glpe20r7uw9osa13z4j', '6v7be19pwman2fird04gqu53', '', '重做了任务 ', 'redo', '2018-12-31 14:19:55', 'mv4usefb06dxv8ez2spkl223', 'task', '', 0, NULL, 'border');
INSERT INTO `pear_project_log` VALUES (4107, 'bw3iz9a6fc2ylq5sngxp8md7', '6v7be19pwman2fird04gqu53', '', '指派给了 Chihiro', 'assign', '2018-12-31 14:26:54', 'mv4usefb06dxv8ez2spkl223', 'task', 'y680trgedcavbhnz24u7i5m3', 0, NULL, 'user');
INSERT INTO `pear_project_log` VALUES (4108, 'uy8b34ph5qlas0t6cej7wfir', '6v7be19pwman2fird04gqu53', '', '指派给了 vilson.2', 'assign', '2018-12-31 14:55:20', 'mv4usefb06dxv8ez2spkl223', 'task', 'kqdcn2w40p58r31zyo6efjib', 0, NULL, 'user');
INSERT INTO `pear_project_log` VALUES (4109, 'tawsz234c90xm71ko5yg6uev', '6v7be19pwman2fird04gqu53', '', '完成了任务 ', 'done', '2018-12-31 15:00:09', 'mv4usefb06dxv8ez2spkl223', 'task', '', 0, NULL, 'check');
INSERT INTO `pear_project_log` VALUES (4110, 'kysizpn5rf2t90o3jvgw7ubl', '6v7be19pwman2fird04gqu53', '', '移除了执行者 ', 'removeExecutor', '2018-12-31 15:04:04', 'mv4usefb06dxv8ez2spkl223', 'task', 'kqdcn2w40p58r31zyo6efjib', 0, NULL, 'user-delete');
INSERT INTO `pear_project_log` VALUES (4111, 'wgzq1pyexs8lk9jinh5btvm2', '6v7be19pwman2fird04gqu53', '1', '创建了任务 ', 'create', '2018-12-31 15:04:43', 'qscug70y98zpk6edbnf3livr', 'task', '', 0, NULL, 'plus');
INSERT INTO `pear_project_log` VALUES (4112, '83rkucdwm5xos7aqlztjn4ih', '6v7be19pwman2fird04gqu53', '', '认领了任务 ', 'claim', '2018-12-31 15:04:43', 'qscug70y98zpk6edbnf3livr', 'task', '', 0, NULL, 'user');
INSERT INTO `pear_project_log` VALUES (4113, 'khgazoxwlesn325uftdyb948', '6v7be19pwman2fird04gqu53', '2', '创建了任务 ', 'create', '2018-12-31 15:04:44', 'rzpu5cxl63fvb2y8gwdnsjqk', 'task', '', 0, NULL, 'plus');
INSERT INTO `pear_project_log` VALUES (4114, 'm0iwj9q5duxbsnarp86tk31h', '6v7be19pwman2fird04gqu53', '', '认领了任务 ', 'claim', '2018-12-31 15:04:44', 'rzpu5cxl63fvb2y8gwdnsjqk', 'task', '', 0, NULL, 'user');
INSERT INTO `pear_project_log` VALUES (4115, 'i603csgvdzwh7ouajbfp2ren', '6v7be19pwman2fird04gqu53', '3', '创建了任务 ', 'create', '2018-12-31 15:04:45', 'ozi8awms1lpcbde4fuq5ktgj', 'task', '', 0, NULL, 'plus');
INSERT INTO `pear_project_log` VALUES (4116, 'hpycx4681ijk3bn59gzsml2a', '6v7be19pwman2fird04gqu53', '', '认领了任务 ', 'claim', '2018-12-31 15:04:45', 'ozi8awms1lpcbde4fuq5ktgj', 'task', '', 0, NULL, 'user');
INSERT INTO `pear_project_log` VALUES (4117, 'ncp9o3q2y4mzuvx7e5rb0jga', '6v7be19pwman2fird04gqu53', '4', '创建了任务 ', 'create', '2018-12-31 15:04:46', 'xejt6431q8ly97bkid5z2pun', 'task', '', 0, NULL, 'plus');
INSERT INTO `pear_project_log` VALUES (4118, 'kyrlbu51ofmtsv9qax82p0ni', '6v7be19pwman2fird04gqu53', '', '认领了任务 ', 'claim', '2018-12-31 15:04:46', 'xejt6431q8ly97bkid5z2pun', 'task', '', 0, NULL, 'user');
INSERT INTO `pear_project_log` VALUES (4119, 'wdm01ato3hpjfubvc9n4z7ge', '6v7be19pwman2fird04gqu53', '5', '创建了任务 ', 'create', '2018-12-31 15:04:47', 'zkqb6if5ogdts27lx13r4yju', 'task', '', 0, NULL, 'plus');
INSERT INTO `pear_project_log` VALUES (4120, 'rklwiogfxd48qytpvne5zhmu', '6v7be19pwman2fird04gqu53', '', '认领了任务 ', 'claim', '2018-12-31 15:04:47', 'zkqb6if5ogdts27lx13r4yju', 'task', '', 0, NULL, 'user');
INSERT INTO `pear_project_log` VALUES (4121, 'w581csf97ojqytu0hderx4bz', '6v7be19pwman2fird04gqu53', '6', '创建了任务 ', 'create', '2018-12-31 15:04:49', '9wsohy8jgapl6x2iutbm7k34', 'task', '', 0, NULL, 'plus');
INSERT INTO `pear_project_log` VALUES (4122, '93047cqlbavx8wr2puie61zg', '6v7be19pwman2fird04gqu53', '', '认领了任务 ', 'claim', '2018-12-31 15:04:49', '9wsohy8jgapl6x2iutbm7k34', 'task', '', 0, NULL, 'user');
INSERT INTO `pear_project_log` VALUES (4123, 'zmf9i5tv6ryuxjol71e3hw40', '6v7be19pwman2fird04gqu53', '', '更新截止时间为 12月31日 18:00', 'setEndTime', '2018-12-31 15:05:09', 'qscug70y98zpk6edbnf3livr', 'task', '', 0, NULL, 'calendar');
INSERT INTO `pear_project_log` VALUES (4124, 'xzduq1jiesmht89vkfo0p645', '6v7be19pwman2fird04gqu53', '', '更新任务优先级为 紧急', 'pri', '2018-12-31 15:05:22', 'qscug70y98zpk6edbnf3livr', 'task', '', 0, NULL, 'user');
INSERT INTO `pear_project_log` VALUES (4125, 'dgt7mbakn1zx5huv93le4rj0', '6v7be19pwman2fird04gqu53', '', '移除了执行者 ', 'removeExecutor', '2018-12-31 15:20:11', '9wsohy8jgapl6x2iutbm7k34', 'task', '6v7be19pwman2fird04gqu53', 0, NULL, 'user-delete');
INSERT INTO `pear_project_log` VALUES (4126, 'dq4j60pcg9st1maxwv7hozki', '6v7be19pwman2fird04gqu53', '', '完成了任务 ', 'done', '2018-12-31 15:22:38', 'xkqg60sld15fcphwt4ya3rb8', 'task', '', 0, NULL, 'check');
INSERT INTO `pear_project_log` VALUES (4127, 'brc67fhgxdsmv9kojtpan4ez', '6v7be19pwman2fird04gqu53', '', '重做了任务 ', 'redo', '2018-12-31 15:22:40', 'xkqg60sld15fcphwt4ya3rb8', 'task', '', 0, NULL, 'border');
INSERT INTO `pear_project_log` VALUES (4128, 'fvxzwo24tur1np3s07qdbya9', '6v7be19pwman2fird04gqu53', '', '完成了任务 ', 'done', '2018-12-31 15:23:01', 'xkqg60sld15fcphwt4ya3rb8', 'task', '', 0, NULL, 'check');
INSERT INTO `pear_project_log` VALUES (4129, 'in2b7tx1pmfwjkhl38v54zoc', '6v7be19pwman2fird04gqu53', '', '完成了任务 ', 'done', '2018-12-31 15:23:03', 'xejt6431q8ly97bkid5z2pun', 'task', '', 0, NULL, 'check');
INSERT INTO `pear_project_log` VALUES (4130, 'lbt86sej72gwca0uno4kdh51', '6v7be19pwman2fird04gqu53', '', '指派给了 Chihiro', 'assign', '2018-12-31 15:23:08', 'xejt6431q8ly97bkid5z2pun', 'task', 'y680trgedcavbhnz24u7i5m3', 0, NULL, 'user');
INSERT INTO `pear_project_log` VALUES (4131, 'j7xqfgbtns0huywr9po4z1va', '6v7be19pwman2fird04gqu53', '', '重做了任务 ', 'redo', '2018-12-31 17:55:13', 'mv4usefb06dxv8ez2spkl223', 'task', '', 0, NULL, 'border');
INSERT INTO `pear_project_log` VALUES (4132, 'pykstuo3210bn5iq76jg8wfz', '6v7be19pwman2fird04gqu53', '', '完成了任务 ', 'done', '2018-12-31 17:55:15', 'mv4usefb06dxv8ez2spkl223', 'task', '', 0, NULL, 'check');
INSERT INTO `pear_project_log` VALUES (4133, 'me1ofzi6acr72hkb4pwtyvjg', '6v7be19pwman2fird04gqu53', '', '重做了任务 ', 'redo', '2019-01-01 12:41:11', 'mv4usefb06dxv8ez2spkl223', 'task', '', 0, NULL, 'border');
INSERT INTO `pear_project_log` VALUES (4134, 'uim9z48hg0p5jro23sfkxe67', '6v7be19pwman2fird04gqu53', '', '完成了任务 ', 'done', '2019-01-01 12:41:13', 'mv4usefb06dxv8ez2spkl223', 'task', '', 0, NULL, 'check');
INSERT INTO `pear_project_log` VALUES (4135, 'gyrtq8b26ocxu3kdn4ef07z5', '6v7be19pwman2fird04gqu53', '', '重做了任务 ', 'redo', '2019-01-01 12:41:13', 'mv4usefb06dxv8ez2spkl223', 'task', '', 0, NULL, 'border');
INSERT INTO `pear_project_log` VALUES (4136, 's2unk6cav84ozqg7dtb10mrf', '6v7be19pwman2fird04gqu53', '', '指派给了 vilson.2', 'assign', '2019-01-01 21:20:22', 'mv4usefb06dxv8ez2spkl223', 'task', 'kqdcn2w40p58r31zyo6efjib', 0, NULL, 'user');
INSERT INTO `pear_project_log` VALUES (4137, 'tqbgjrp6vd8iks0hfnm91wc7', 'kqdcn2w40p58r31zyo6efjib', '', '完成了任务 ', 'done', '2019-01-03 10:26:45', 'aut9wrz1pn0elf5s47ivx26o', 'task', '', 0, NULL, 'check');
INSERT INTO `pear_project_log` VALUES (4138, 't7eor5w2x6sf4u3n8hajlgic', 'kqdcn2w40p58r31zyo6efjib', '1', '创建了任务 ', 'create', '2019-01-03 10:46:04', 'q9y6ksvtifwpuhna0e32jgm1', 'task', '', 0, NULL, 'plus');
INSERT INTO `pear_project_log` VALUES (4139, 'evbyapm7qck64i89j3rgohw5', 'kqdcn2w40p58r31zyo6efjib', '', '认领了任务 ', 'claim', '2019-01-03 10:46:04', 'q9y6ksvtifwpuhna0e32jgm1', 'task', '', 0, NULL, 'user');
INSERT INTO `pear_project_log` VALUES (4140, 'v20o3mcpb65awy4zf8le7h1i', 'kqdcn2w40p58r31zyo6efjib', '2', '创建了任务 ', 'create', '2019-01-03 10:46:13', 'wyklgmhpt5qr47x3zsf9nibj', 'task', '', 0, NULL, 'plus');
INSERT INTO `pear_project_log` VALUES (4141, '5ori2dcnubymxgz7j3968s1e', 'kqdcn2w40p58r31zyo6efjib', '', '认领了任务 ', 'claim', '2019-01-03 10:46:14', 'wyklgmhpt5qr47x3zsf9nibj', 'task', '', 0, NULL, 'user');
INSERT INTO `pear_project_log` VALUES (4142, '7h6fiyn52vmt1kcqs9pgolab', 'kqdcn2w40p58r31zyo6efjib', '', '完成了任务 ', 'done', '2019-01-03 10:49:35', 'wyklgmhpt5qr47x3zsf9nibj', 'task', '', 0, NULL, 'check');
INSERT INTO `pear_project_log` VALUES (4143, 'qakjgy7sxw25rvnize8pfdtm', 'kqdcn2w40p58r31zyo6efjib', '', '重做了任务 ', 'redo', '2019-01-03 10:49:37', 'wyklgmhpt5qr47x3zsf9nibj', 'task', '', 0, NULL, 'border');
INSERT INTO `pear_project_log` VALUES (4144, 'qehcwy2mupsi8jrb4105lv7t', 'kqdcn2w40p58r31zyo6efjib', '', '添加了参与者 vilson', 'inviteMember', '2019-01-03 10:51:44', 'wyklgmhpt5qr47x3zsf9nibj', 'task', '6v7be19pwman2fird04gqu53', 0, NULL, 'user-add');
INSERT INTO `pear_project_log` VALUES (4145, 'tmr1xvy4hz97fj8nsegoib0w', 'kqdcn2w40p58r31zyo6efjib', '', '指派给了 vilson', 'assign', '2019-01-03 10:51:51', 'wyklgmhpt5qr47x3zsf9nibj', 'task', '6v7be19pwman2fird04gqu53', 0, NULL, 'user');
INSERT INTO `pear_project_log` VALUES (4146, '8fubhgml3dx16krpto2e5sv9', 'kqdcn2w40p58r31zyo6efjib', '', '移除了执行者 ', 'removeExecutor', '2019-01-03 10:51:53', 'wyklgmhpt5qr47x3zsf9nibj', 'task', '6v7be19pwman2fird04gqu53', 0, NULL, 'user-delete');
INSERT INTO `pear_project_log` VALUES (4147, 'qgsbed0ozp27nwirlfk8yatj', 'kqdcn2w40p58r31zyo6efjib', '<p>66</p>', '更新了备注 ', 'content', '2019-01-03 10:52:06', 'wyklgmhpt5qr47x3zsf9nibj', 'task', '', 0, NULL, 'file-text');
INSERT INTO `pear_project_log` VALUES (4148, 'zh3k4aotncqu2bw16yr75mfg', 'kqdcn2w40p58r31zyo6efjib', '', '移除了参与者 vilson.2', 'removeMember', '2019-01-03 10:58:16', 'aut9wrz1pn0elf5s47ivx26o', 'task', 'kqdcn2w40p58r31zyo6efjib', 0, NULL, 'user-delete');
INSERT INTO `pear_project_log` VALUES (4149, 'zfewmyds7q14li2vj56rngpc', 'kqdcn2w40p58r31zyo6efjib', '99', '创建了任务 ', 'create', '2019-01-03 11:00:15', 'm6cloqrbh7tf0wg1jsvp9nay', 'task', '', 0, NULL, 'plus');
INSERT INTO `pear_project_log` VALUES (4150, 'h7pilc01go6a2qj5e3stxwzb', 'kqdcn2w40p58r31zyo6efjib', '', '添加了子任务 \"99\"', 'createChild', '2019-01-03 11:00:15', 'aut9wrz1pn0elf5s47ivx26o', 'task', '', 0, NULL, 'bars');
INSERT INTO `pear_project_log` VALUES (4151, '9kpj26uxbdetlgiqcsm5a8zh', 'kqdcn2w40p58r31zyo6efjib', '', '指派给了 Chihiro', 'assign', '2019-01-03 11:00:15', 'm6cloqrbh7tf0wg1jsvp9nay', 'task', 'y680trgedcavbhnz24u7i5m3', 0, NULL, 'user');
INSERT INTO `pear_project_log` VALUES (4152, 'd1onu8sbwl62hy9tcpjkfeaq', 'kqdcn2w40p58r31zyo6efjib', '', '完成了任务 ', 'done', '2019-01-03 11:01:30', 'm6cloqrbh7tf0wg1jsvp9nay', 'task', '', 0, NULL, 'check');
INSERT INTO `pear_project_log` VALUES (4153, '148jmclitfbvkx95ry2ed3nz', 'kqdcn2w40p58r31zyo6efjib', '', '完成了子任务 \"Tree 的 @on-select-change 和 @on-check-change 事件返回参数新增当前项\"', 'doneChild', '2019-01-03 11:01:30', 'aut9wrz1pn0elf5s47ivx26o', 'task', '', 0, NULL, 'bars');
INSERT INTO `pear_project_log` VALUES (4154, 'rchx5tm41wposf780yjz6egu', 'kqdcn2w40p58r31zyo6efjib', '', '完成了任务 ', 'done', '2019-01-03 11:16:12', 'q9y6ksvtifwpuhna0e32jgm1', 'task', '', 0, NULL, 'check');
INSERT INTO `pear_project_log` VALUES (4155, '9qnt6l7hej1s4i238pukxvmr', 'kqdcn2w40p58r31zyo6efjib', '', '重做了任务 ', 'redo', '2019-01-03 11:16:13', 'q9y6ksvtifwpuhna0e32jgm1', 'task', '', 0, NULL, 'border');
INSERT INTO `pear_project_log` VALUES (4156, 'a6psv8onwmyq1e2i0g95bk3d', 'kqdcn2w40p58r31zyo6efjib', '', '完成了任务 ', 'done', '2019-01-03 11:16:15', 'wyklgmhpt5qr47x3zsf9nibj', 'task', '', 0, NULL, 'check');
INSERT INTO `pear_project_log` VALUES (4157, '6xqhe5l4pokcg0m2v7yd1tbs', 'kqdcn2w40p58r31zyo6efjib', '', '指派给了 vilson', 'assign', '2019-01-03 11:16:18', 'wyklgmhpt5qr47x3zsf9nibj', 'task', '6v7be19pwman2fird04gqu53', 0, NULL, 'user');
INSERT INTO `pear_project_log` VALUES (4158, 'lv23ua5jdypmoes7cgz89rxb', '6v7be19pwman2fird04gqu53', '增加了一个新组件 Comment', '创建了任务 ', 'create', '2019-01-03 22:25:29', 'p1aujdigrlxky76h8cs3z4w0', 'task', '', 0, NULL, 'plus');
INSERT INTO `pear_project_log` VALUES (4159, 'mnbz7hw2oi94u6fk3r5xqpdc', '6v7be19pwman2fird04gqu53', '', '认领了任务 ', 'claim', '2019-01-03 22:25:30', 'p1aujdigrlxky76h8cs3z4w0', 'task', '', 0, NULL, 'user');
INSERT INTO `pear_project_log` VALUES (4160, 'basihz6npvt2xf71reog45ud', '6v7be19pwman2fird04gqu53', '增加了一个新组件 ConfigProvider 为组件提供统一的全局化配置', '创建了任务 ', 'create', '2019-01-03 22:25:37', '2bn918l6ejyzousa73dkpgci', 'task', '', 0, NULL, 'plus');
INSERT INTO `pear_project_log` VALUES (4161, '9lgmtpoj613bwevfasq4i0dk', '6v7be19pwman2fird04gqu53', '', '认领了任务 ', 'claim', '2019-01-03 22:25:37', '2bn918l6ejyzousa73dkpgci', 'task', '', 0, NULL, 'user');
INSERT INTO `pear_project_log` VALUES (4162, 'z4cx5uvmfsjakr2b38w0geld', '6v7be19pwman2fird04gqu53', 'Avatar 组件增加 srcSet 属性，用于设置图片类头像响应式资源地址', '创建了任务 ', 'create', '2019-01-03 22:25:45', '3qz5hfsin69xt8cgbd70lkew', 'task', '', 0, NULL, 'plus');
INSERT INTO `pear_project_log` VALUES (4163, 'bde7mgz60ylicx4tap1rf82w', '6v7be19pwman2fird04gqu53', '', '认领了任务 ', 'claim', '2019-01-03 22:25:45', '3qz5hfsin69xt8cgbd70lkew', 'task', '', 0, NULL, 'user');
INSERT INTO `pear_project_log` VALUES (4164, '3oktw2hblvn9f7e8mj01rduz', '6v7be19pwman2fird04gqu53', '增加 less 变量 @font-variant-base 定制 font-variant 样式', '创建了任务 ', 'create', '2019-01-03 22:25:53', 'xkic58d20srnu9jm7ohqw14f', 'task', '', 0, NULL, 'plus');
INSERT INTO `pear_project_log` VALUES (4165, '8721mxbo0quri9jydg3halwv', '6v7be19pwman2fird04gqu53', '', '认领了任务 ', 'claim', '2019-01-03 22:25:53', 'xkic58d20srnu9jm7ohqw14f', 'task', '', 0, NULL, 'user');
INSERT INTO `pear_project_log` VALUES (4166, 'cld81p5er0bsxnmj934w7qgf', '6v7be19pwman2fird04gqu53', '优化鼠标悬停在可排序的表头上时 title 的显示', '创建了任务 ', 'create', '2019-01-03 22:26:01', '6hj43ueim2bk187sqzcoy59v', 'task', '', 0, NULL, 'plus');
INSERT INTO `pear_project_log` VALUES (4167, 'efj1xhpr9i5a0tq7y4knzub2', '6v7be19pwman2fird04gqu53', '', '认领了任务 ', 'claim', '2019-01-03 22:26:01', '6hj43ueim2bk187sqzcoy59v', 'task', '', 0, NULL, 'user');
INSERT INTO `pear_project_log` VALUES (4168, 'xelf9v7kzin6tj5bqoyaw1rg', '6v7be19pwman2fird04gqu53', '修正 Comment author 属性的类型为 ReactNode', '创建了任务 ', 'create', '2019-01-03 22:26:09', 'twb8f52jasn9vry6iko0dqg4', 'task', '', 0, NULL, 'plus');
INSERT INTO `pear_project_log` VALUES (4169, 'uiq9yv85f7zgba01w4ln6x3r', '6v7be19pwman2fird04gqu53', '', '认领了任务 ', 'claim', '2019-01-03 22:26:09', 'twb8f52jasn9vry6iko0dqg4', 'task', '', 0, NULL, 'user');
INSERT INTO `pear_project_log` VALUES (4170, 'f10hn732taevsdpygjbcl5w8', '6v7be19pwman2fird04gqu53', '优化 Spin 样式并略微提升了切换状态的性能', '创建了任务 ', 'create', '2019-01-03 22:26:16', 'gjmotpbrwva079ukde4izn38', 'task', '', 0, NULL, 'plus');
INSERT INTO `pear_project_log` VALUES (4171, 'q237mcahkzp1sd8ij4ry6fvn', '6v7be19pwman2fird04gqu53', '', '认领了任务 ', 'claim', '2019-01-03 22:26:16', 'gjmotpbrwva079ukde4izn38', 'task', '', 0, NULL, 'user');
INSERT INTO `pear_project_log` VALUES (4172, '9tc5erp8lgdxon1muhas4wyk', '6v7be19pwman2fird04gqu53', '微调 Card 头部和加载中的样式细节', '创建了任务 ', 'create', '2019-01-03 22:26:21', 'uwq87z2f0hnvrl6o9gtcb3iy', 'task', '', 0, NULL, 'plus');
INSERT INTO `pear_project_log` VALUES (4173, 'im06nuj924kzy3lhwqert8vp', '6v7be19pwman2fird04gqu53', '', '认领了任务 ', 'claim', '2019-01-03 22:26:21', 'uwq87z2f0hnvrl6o9gtcb3iy', 'task', '', 0, NULL, 'user');
INSERT INTO `pear_project_log` VALUES (4174, 'zj73kmhg5yicqlse09v824dn', '6v7be19pwman2fird04gqu53', 'Notification 组件升级 rc-notification 到 3.3.0，增加 onClick 属性，点击通知时触发的回调函数', '更新了内容 ', 'name', '2019-01-03 22:26:36', 'mv4usefb06dxv8ez2spkl223', 'task', '', 0, NULL, 'edit');
INSERT INTO `pear_project_log` VALUES (4175, 'ohl1jfb4wqkcad0gs76my9n5', '6v7be19pwman2fird04gqu53', 'Notification 组件升级 rc-notification 到 3.3.0', '更新了内容 ', 'name', '2019-01-03 22:26:50', 'mv4usefb06dxv8ez2spkl223', 'task', '', 0, NULL, 'edit');
INSERT INTO `pear_project_log` VALUES (4176, 'ubrczedhjpwfv5ygnl1089s2', '6v7be19pwman2fird04gqu53', 'Cascader 升级 rc-calendar', '创建了任务 ', 'create', '2019-01-03 22:27:04', 'qug5e4alndm7930ipxwyvc2h', 'task', '', 0, NULL, 'plus');
INSERT INTO `pear_project_log` VALUES (4177, '71veqsi6pomnlz4fd3k85x90', '6v7be19pwman2fird04gqu53', '', '认领了任务 ', 'claim', '2019-01-03 22:27:04', 'qug5e4alndm7930ipxwyvc2h', 'task', '', 0, NULL, 'user');
INSERT INTO `pear_project_log` VALUES (4178, 'fvc1z3rbgslkhwto498qpie0', '6v7be19pwman2fird04gqu53', 'Upload 组件升级 rc-upload 到 2.5.0', '创建了任务 ', 'create', '2019-01-03 22:27:17', 'yctbsv81x6dmahkf7ei5o4r9', 'task', '', 0, NULL, 'plus');
INSERT INTO `pear_project_log` VALUES (4179, 'a5ixq9onv1h0sm2ydr6wbult', '6v7be19pwman2fird04gqu53', '', '认领了任务 ', 'claim', '2019-01-03 22:27:17', 'yctbsv81x6dmahkf7ei5o4r9', 'task', '', 0, NULL, 'user');
INSERT INTO `pear_project_log` VALUES (4180, '8jnxw6ot03yb5ms1lae9ivuq', '6v7be19pwman2fird04gqu53', '重构 Tag 组件，简化代码并提升性能', '创建了任务 ', 'create', '2019-01-03 22:27:30', 'm7u8fdp41cwrtkjxyzq2ion3', 'task', '', 0, NULL, 'plus');
INSERT INTO `pear_project_log` VALUES (4181, 'lo3fs4d610v98imxaertkcgw', '6v7be19pwman2fird04gqu53', '', '认领了任务 ', 'claim', '2019-01-03 22:27:30', 'm7u8fdp41cwrtkjxyzq2ion3', 'task', '', 0, NULL, 'user');
INSERT INTO `pear_project_log` VALUES (4182, '2t8wh5zk3ad79rb4q0oijm1g', '6v7be19pwman2fird04gqu53', 'Badge 进行了重构，count 支持自定义组件', '创建了任务 ', 'create', '2019-01-03 22:27:36', 'jo0i8fq2579kbdgsmcw1nev4', 'task', '', 0, NULL, 'plus');
INSERT INTO `pear_project_log` VALUES (4183, '9mvrcztjylsghin1qwae8o67', '6v7be19pwman2fird04gqu53', '', '认领了任务 ', 'claim', '2019-01-03 22:27:36', 'jo0i8fq2579kbdgsmcw1nev4', 'task', '', 0, NULL, 'user');
INSERT INTO `pear_project_log` VALUES (4184, 'phb9kdnt45ir32vojcmwl1g6', '6v7be19pwman2fird04gqu53', '重构了 Tree 底层的代码，以解决一些存在了很久的问题', '创建了任务 ', 'create', '2019-01-03 22:27:54', 'owrs04m3e2klj8uqac6tiy17', 'task', '', 0, NULL, 'plus');
INSERT INTO `pear_project_log` VALUES (4185, '3q4sxlb6jogair159w8h0u27', '6v7be19pwman2fird04gqu53', '', '认领了任务 ', 'claim', '2019-01-03 22:27:54', 'owrs04m3e2klj8uqac6tiy17', 'task', '', 0, NULL, 'user');
INSERT INTO `pear_project_log` VALUES (4186, 'sufbt1amn9c8eqd6yil7rvx0', '6v7be19pwman2fird04gqu53', '修复了 Badge 代码错误引起的 TypeScript 类型报错', '更新了内容 ', 'name', '2019-01-03 22:28:13', 'aut9wrz1pn0elf5s47ivx26o', 'task', '', 0, NULL, 'edit');
INSERT INTO `pear_project_log` VALUES (4187, 'q5lpxoh7mrzj2cbgtv0u4698', '6v7be19pwman2fird04gqu53', '修复了 Divider 与浮动元素一起使用时的样式问题', '创建了任务 ', 'create', '2019-01-03 22:28:21', 'g15scwqm9zxroy7p8bvjt632', 'task', '', 0, NULL, 'plus');
INSERT INTO `pear_project_log` VALUES (4188, 'tog9yrh7ekjc6q31fanmxwpz', '6v7be19pwman2fird04gqu53', '', '认领了任务 ', 'claim', '2019-01-03 22:28:21', 'g15scwqm9zxroy7p8bvjt632', 'task', '', 0, NULL, 'user');
INSERT INTO `pear_project_log` VALUES (4189, 'gf0psdotxqblcy918wznaih7', '6v7be19pwman2fird04gqu53', '修复了 Form 高级搜索模式下的样式问题', '创建了任务 ', 'create', '2019-01-03 22:28:25', '0a84xkg12enqjml7rz6dbifw', 'task', '', 0, NULL, 'plus');
INSERT INTO `pear_project_log` VALUES (4190, 'ob51ay942rmpgk8c3vxlftdn', '6v7be19pwman2fird04gqu53', '', '认领了任务 ', 'claim', '2019-01-03 22:28:25', '0a84xkg12enqjml7rz6dbifw', 'task', '', 0, NULL, 'user');
INSERT INTO `pear_project_log` VALUES (4191, 'fb9uj15xn2zs6wihpo8lmecy', '6v7be19pwman2fird04gqu53', '修复了 Upload 对无扩展名图片地址的预览展示问题', '创建了任务 ', 'create', '2019-01-03 22:28:29', 'fax4gez2jlk15tvsu3dc6p98', 'task', '', 0, NULL, 'plus');
INSERT INTO `pear_project_log` VALUES (4192, 'kjs527dh3qfzuolyt1i0map9', '6v7be19pwman2fird04gqu53', '', '认领了任务 ', 'claim', '2019-01-03 22:28:29', 'fax4gez2jlk15tvsu3dc6p98', 'task', '', 0, NULL, 'user');
INSERT INTO `pear_project_log` VALUES (4193, 'wefjuogckp7n90qm6384bhrz', '6v7be19pwman2fird04gqu53', '修复一处 less 语法错误', '创建了任务 ', 'create', '2019-01-03 22:28:33', 'zv4hx1ugpn98be5skc3wym72', 'task', '', 0, NULL, 'plus');
INSERT INTO `pear_project_log` VALUES (4194, 'u3986mxveapdh7oj1rift2zg', '6v7be19pwman2fird04gqu53', '', '认领了任务 ', 'claim', '2019-01-03 22:28:33', 'zv4hx1ugpn98be5skc3wym72', 'task', '', 0, NULL, 'user');
INSERT INTO `pear_project_log` VALUES (4195, 'bwtvydrazh8emo1x9up3sj27', '6v7be19pwman2fird04gqu53', '修复 LocaleProvider 中 moment.locale 调用报错的问题', '创建了任务 ', 'create', '2019-01-03 22:28:39', 'jiy25eobh1cnp7ruvg9d0m6s', 'task', '', 0, NULL, 'plus');
INSERT INTO `pear_project_log` VALUES (4196, 'ri6tevk1y7m2zsjwuqa45g3c', '6v7be19pwman2fird04gqu53', '', '认领了任务 ', 'claim', '2019-01-03 22:28:39', 'jiy25eobh1cnp7ruvg9d0m6s', 'task', '', 0, NULL, 'user');
INSERT INTO `pear_project_log` VALUES (4197, 'ow3r8pkn7bet16x9jlh5a0d4', '6v7be19pwman2fird04gqu53', '修复 WeekPicker 的 style 属性不生效的问题', '创建了任务 ', 'create', '2019-01-03 22:28:43', '4pv9brqnm0cigwu5f3zeyxdk', 'task', '', 0, NULL, 'plus');
INSERT INTO `pear_project_log` VALUES (4198, 'ncagwsky8df3lm61027ore45', '6v7be19pwman2fird04gqu53', '', '认领了任务 ', 'claim', '2019-01-03 22:28:43', '4pv9brqnm0cigwu5f3zeyxdk', 'task', '', 0, NULL, 'user');
INSERT INTO `pear_project_log` VALUES (4199, 'bnry5391jzg84sd72pthxlfv', '6v7be19pwman2fird04gqu53', 'Carousel: 升级 react-slick 版本以修复宽度计算错误', '创建了任务 ', 'create', '2019-01-03 22:28:50', 'td1qznl9ms65gbcfej0k4vup', 'task', '', 0, NULL, 'plus');
INSERT INTO `pear_project_log` VALUES (4200, 'qx8fcy1s37mo4th5kwvb69d2', '6v7be19pwman2fird04gqu53', '', '认领了任务 ', 'claim', '2019-01-03 22:28:50', 'td1qznl9ms65gbcfej0k4vup', 'task', '', 0, NULL, 'user');
INSERT INTO `pear_project_log` VALUES (4201, '3d8szi6qx7t9v5ljc1yueag4', '6v7be19pwman2fird04gqu53', '修复 enterButton 的值为 button 元素时显示错误的问题', '创建了任务 ', 'create', '2019-01-03 22:28:56', 'fkrsvpzmj8xyo045hiugqt92', 'task', '', 0, NULL, 'plus');
INSERT INTO `pear_project_log` VALUES (4202, 'lgdti7me3ao62hxy18cpurz9', '6v7be19pwman2fird04gqu53', '', '认领了任务 ', 'claim', '2019-01-03 22:28:56', 'fkrsvpzmj8xyo045hiugqt92', 'task', '', 0, NULL, 'user');
INSERT INTO `pear_project_log` VALUES (4203, '7apl461qkdgm9ui5jftsobe8', '6v7be19pwman2fird04gqu53', '修复表单校验文字消失的时候输入框会抖一下的问题', '创建了任务 ', 'create', '2019-01-03 22:29:02', '0b6wlc3754fr8gdvupx9aoys', 'task', '', 0, NULL, 'plus');
INSERT INTO `pear_project_log` VALUES (4204, 'gr8ibowa7mvu4k5031z9tqfe', '6v7be19pwman2fird04gqu53', '', '认领了任务 ', 'claim', '2019-01-03 22:29:02', '0b6wlc3754fr8gdvupx9aoys', 'task', '', 0, NULL, 'user');
INSERT INTO `pear_project_log` VALUES (4205, 'ie2jn0u4dxbszq9wtyvc7r85', '6v7be19pwman2fird04gqu53', '重构了 DatePicker 相关 type 定义', '创建了任务 ', 'create', '2019-01-03 22:29:18', 'bl1t7xjwpi9m2aocnsz83fk6', 'task', '', 0, NULL, 'plus');
INSERT INTO `pear_project_log` VALUES (4206, 'm9qkjn18zs0u3f6grpae2wo4', '6v7be19pwman2fird04gqu53', '', '认领了任务 ', 'claim', '2019-01-03 22:29:18', 'bl1t7xjwpi9m2aocnsz83fk6', 'task', '', 0, NULL, 'user');
INSERT INTO `pear_project_log` VALUES (4207, 'bxf0ydu7zcp2g5h1jaekinol', '6v7be19pwman2fird04gqu53', 'Steps 进行了重构，首次渲染的时候不会再闪烁', '创建了任务 ', 'create', '2019-01-03 22:29:24', 'hxntygarp3094c7w1856iujm', 'task', '', 0, NULL, 'plus');
INSERT INTO `pear_project_log` VALUES (4208, 'rq7em12fog9ulpcjiynx3zv0', '6v7be19pwman2fird04gqu53', '', '认领了任务 ', 'claim', '2019-01-03 22:29:24', 'hxntygarp3094c7w1856iujm', 'task', '', 0, NULL, 'user');
INSERT INTO `pear_project_log` VALUES (4209, 'dkq4c2thuzwopgy8l5vrj3es', '6v7be19pwman2fird04gqu53', '', '指派给了 Chihiro', 'assign', '2019-01-03 22:29:42', 'bl1t7xjwpi9m2aocnsz83fk6', 'task', 'y680trgedcavbhnz24u7i5m3', 0, NULL, 'user');
INSERT INTO `pear_project_log` VALUES (4210, 'm5jgeyqv168nrzitb2xf0wuc', '6v7be19pwman2fird04gqu53', '', '指派给了 vilson.2', 'assign', '2019-01-03 22:30:00', '0a84xkg12enqjml7rz6dbifw', 'task', 'kqdcn2w40p58r31zyo6efjib', 0, NULL, 'user');
INSERT INTO `pear_project_log` VALUES (4211, '93auio1dnj5t7qzf0lb2kxh4', '6v7be19pwman2fird04gqu53', '', '移除了执行者 ', 'removeExecutor', '2019-01-03 22:30:07', 'jiy25eobh1cnp7ruvg9d0m6s', 'task', '6v7be19pwman2fird04gqu53', 0, NULL, 'user-delete');
INSERT INTO `pear_project_log` VALUES (4212, 'mf4zgw5j60atlxh1pndko38s', '6v7be19pwman2fird04gqu53', '', '指派给了 Chihiro', 'assign', '2019-01-03 22:30:15', 'td1qznl9ms65gbcfej0k4vup', 'task', 'y680trgedcavbhnz24u7i5m3', 0, NULL, 'user');
INSERT INTO `pear_project_log` VALUES (4213, 'l4fdhpo65mx0ji3geu7y8qsn', '6v7be19pwman2fird04gqu53', '', '移除了执行者 ', 'removeExecutor', '2019-01-03 22:30:22', 'twb8f52jasn9vry6iko0dqg4', 'task', '6v7be19pwman2fird04gqu53', 0, NULL, 'user-delete');
INSERT INTO `pear_project_log` VALUES (4214, 'ukx9ozqe8d27cvbifrwmjy54', '6v7be19pwman2fird04gqu53', '', '指派给了 Chihiro', 'assign', '2019-01-03 22:30:27', 'uwq87z2f0hnvrl6o9gtcb3iy', 'task', 'y680trgedcavbhnz24u7i5m3', 0, NULL, 'user');
INSERT INTO `pear_project_log` VALUES (4215, 'x2o3euprgi1nzf8mt70kyl6s', '6v7be19pwman2fird04gqu53', '', '指派给了 vilson.2', 'assign', '2019-01-03 22:30:31', '3qz5hfsin69xt8cgbd70lkew', 'task', 'kqdcn2w40p58r31zyo6efjib', 0, NULL, 'user');
INSERT INTO `pear_project_log` VALUES (4216, 'kyg8xpuovtaw2lc91765fn4j', '6v7be19pwman2fird04gqu53', '', '指派给了 vilson.2', 'assign', '2019-01-03 22:30:38', 'xkic58d20srnu9jm7ohqw14f', 'task', 'kqdcn2w40p58r31zyo6efjib', 0, NULL, 'user');
INSERT INTO `pear_project_log` VALUES (4217, 'a53r0dg7o2cbli4pfqewuy8m', '6v7be19pwman2fird04gqu53', '', '指派给了 Chihiro', 'assign', '2019-01-03 22:30:46', 'owrs04m3e2klj8uqac6tiy17', 'task', 'y680trgedcavbhnz24u7i5m3', 0, NULL, 'user');
INSERT INTO `pear_project_log` VALUES (4218, 'r18ygstu75v4d2xewqfckhln', '6v7be19pwman2fird04gqu53', '', '完成了任务 ', 'done', '2019-01-03 22:30:57', 'bl1t7xjwpi9m2aocnsz83fk6', 'task', '', 0, NULL, 'check');
INSERT INTO `pear_project_log` VALUES (4219, '3jxrfzquwc29yptg1bovm8i7', '6v7be19pwman2fird04gqu53', '', '完成了任务 ', 'done', '2019-01-03 22:30:59', 'hxntygarp3094c7w1856iujm', 'task', '', 0, NULL, 'check');
INSERT INTO `pear_project_log` VALUES (4220, '96wnyl4kut1sdxj2bzop3ivr', '6v7be19pwman2fird04gqu53', '', '完成了任务 ', 'done', '2019-01-03 22:30:59', 'gjmotpbrwva079ukde4izn38', 'task', '', 0, NULL, 'check');
INSERT INTO `pear_project_log` VALUES (4221, 'vmxe7qcidhsrpn3k94wb2af5', '6v7be19pwman2fird04gqu53', '', '完成了任务 ', 'done', '2019-01-03 22:31:02', 'xkic58d20srnu9jm7ohqw14f', 'task', '', 0, NULL, 'check');
INSERT INTO `pear_project_log` VALUES (4222, 'jf65y3tiredw8lkh1xpgzb0q', '6v7be19pwman2fird04gqu53', '', '完成了任务 ', 'done', '2019-01-03 22:31:07', 'zv4hx1ugpn98be5skc3wym72', 'task', '', 0, NULL, 'check');
INSERT INTO `pear_project_log` VALUES (4223, 'gaihuw7petn3y165lcjvrk42', '6v7be19pwman2fird04gqu53', '', '重做了任务 ', 'redo', '2019-01-03 22:31:13', 'zv4hx1ugpn98be5skc3wym72', 'task', '', 0, NULL, 'border');
INSERT INTO `pear_project_log` VALUES (4224, 'w4jxovd6bsfinz0tq7rhleau', '6v7be19pwman2fird04gqu53', '<ul><li><input type=\"checkbox\" id=\"\" disabled=\"\" checked=\"\">&nbsp;I have searched the&nbsp;<a href=\"https://github.com/ant-design/ant-design/issues\">issues</a>&nbsp;of this repository and believe that this is not a duplicate.</li></ul><h3>Version</h3><p>3.10.9</p><h3>Environment</h3><p>Any every green browsers</p><h3>Reproduction link</h3><p><a href=\"https://codesandbox.io/s/qk663j3w3w\" rel=\"nofollow\"><img src=\"https://camo.githubusercontent.com/416c7a7433e9d81b4e430b561d92f22ac4f15988/68747470733a2f2f636f646573616e64626f782e696f2f7374617469632f696d672f706c61792d636f646573616e64626f782e737667\" alt=\"Edit on CodeSandbox\"></a></p><h3>Steps to reproduce</h3><p>Please see the linked example in \"Link to minimal reproduction\".<br>The hover over message on column \"Name\" is \"sort\", however, it should be \"hello\" based on the code logic.</p><h3>What is expected?</h3><p>When using a Popover for the title of a column, the hover over message on that column\'s header should be the value passed to Popover\'s title prop instead of \"sort\"</p><h3>What is actually happening?</h3><p>The hover over message on all sortable columns is \"sort\".</p>', '更新了备注 ', 'content', '2019-01-04 08:54:41', '6hj43ueim2bk187sqzcoy59v', 'task', '', 0, NULL, 'file-text');
INSERT INTO `pear_project_log` VALUES (4225, 'ezcbv40idx8urkswg7yoj2mq', '6v7be19pwman2fird04gqu53', '', '更新任务优先级为 紧急', 'pri', '2019-01-04 08:56:41', '6hj43ueim2bk187sqzcoy59v', 'task', '', 0, NULL, 'user');
INSERT INTO `pear_project_log` VALUES (4226, 'sbal18knrhvtwj0zc5g4i3dq', '6v7be19pwman2fird04gqu53', '', '更新截止时间为 01月06日 18:00', 'setEndTime', '2019-01-04 08:56:45', '6hj43ueim2bk187sqzcoy59v', 'task', '', 0, NULL, 'calendar');
INSERT INTO `pear_project_log` VALUES (4227, '1b6h9dnxq27w48eygut5acmk', '6v7be19pwman2fird04gqu53', '', '添加了参与者 Chihiro', 'inviteMember', '2019-01-04 08:57:04', '6hj43ueim2bk187sqzcoy59v', 'task', 'y680trgedcavbhnz24u7i5m3', 0, NULL, 'user-add');
INSERT INTO `pear_project_log` VALUES (4228, 'o8khyma5vz9rbs63pdwx7iej', '6v7be19pwman2fird04gqu53', '', '指派给了 Chihiro', 'assign', '2019-01-04 08:57:09', '6hj43ueim2bk187sqzcoy59v', 'task', 'y680trgedcavbhnz24u7i5m3', 0, NULL, 'user');
INSERT INTO `pear_project_log` VALUES (4229, '6f5g1qt4oj98ysrdhawx2c3k', '6v7be19pwman2fird04gqu53', 'this seems more like a question to @afc163 , but here\'s my two cents: it might be better to add an additional prop called something like hoverOverTitle so that it will show up when you hover over on a column header. If the consumer uses a Popover for column\'s title, the hover over behavior should honor whatever sets in that Popover component.', NULL, 'comment', '2019-01-04 08:57:35', '6hj43ueim2bk187sqzcoy59v', 'task', '0', 1, NULL, NULL);
INSERT INTO `pear_project_log` VALUES (4230, '90l6k8b7hngpymoacietrf1j', 'kqdcn2w40p58r31zyo6efjib', 'I want to take this and have a question,\n\nwhen hover on column Age, it should show Sort or Age?', NULL, 'comment', '2019-01-04 09:04:33', '6hj43ueim2bk187sqzcoy59v', 'task', '0', 1, NULL, NULL);
INSERT INTO `pear_project_log` VALUES (4231, 'fvtby5am906l87g1cxjshe32', 'y680trgedcavbhnz24u7i5m3', 'In my opinion, when type of title is string, it should show Sort, if it\'s a ReactNode, it should show the last step of prop title, maybe add prop is not a good way for user.', NULL, 'comment', '2019-01-04 09:08:23', '6hj43ueim2bk187sqzcoy59v', 'task', '0', 1, NULL, NULL);
INSERT INTO `pear_project_log` VALUES (4232, 'sxe2dy5wcb6hn38mig97zavq', 'y680trgedcavbhnz24u7i5m3', 'Change hover over message of Column', '创建了任务 ', 'create', '2019-01-04 09:09:28', 'gk8ipqm5406br7cwd9l1zefs', 'task', '', 0, NULL, 'plus');
INSERT INTO `pear_project_log` VALUES (4233, '56l3m84euzs7cypgb9qfijnv', 'y680trgedcavbhnz24u7i5m3', '', '添加了子任务 \"Change hover over message of Column\"', 'createChild', '2019-01-04 09:09:28', '6hj43ueim2bk187sqzcoy59v', 'task', '', 0, NULL, 'bars');
INSERT INTO `pear_project_log` VALUES (4234, 'kyeuzfgnxoms658bd3tq12p7', 'y680trgedcavbhnz24u7i5m3', '', '认领了任务 ', 'claim', '2019-01-04 09:09:29', 'gk8ipqm5406br7cwd9l1zefs', 'task', '', 0, NULL, 'user');
INSERT INTO `pear_project_log` VALUES (4235, '98p7g6n1ltzbfre3oxkyhv2d', 'kqdcn2w40p58r31zyo6efjib', '', '认领了任务 ', 'claim', '2019-01-04 09:17:51', 'm7u8fdp41cwrtkjxyzq2ion3', 'task', '', 0, NULL, 'user');
INSERT INTO `pear_project_log` VALUES (4236, '8rvy3inbt46ckxu59fld7pqz', 'kqdcn2w40p58r31zyo6efjib', '新增 directory 属性，支持上传一个文件夹', '创建了任务 ', 'create', '2019-01-04 09:18:18', 'o61b3s24exmcy8njkparwthd', 'task', '', 0, NULL, 'plus');
INSERT INTO `pear_project_log` VALUES (4237, 'nkr94lumsqbgi2ofhp7d8c5x', 'kqdcn2w40p58r31zyo6efjib', '', '添加了子任务 \"新增 directory 属性，支持上传一个文件夹\"', 'createChild', '2019-01-04 09:18:18', 'yctbsv81x6dmahkf7ei5o4r9', 'task', '', 0, NULL, 'bars');
INSERT INTO `pear_project_log` VALUES (4238, 'zy5t9lmv671r4qxf8bpcwjsn', 'kqdcn2w40p58r31zyo6efjib', '', '指派给了 vilson', 'assign', '2019-01-04 09:18:18', 'o61b3s24exmcy8njkparwthd', 'task', '6v7be19pwman2fird04gqu53', 0, NULL, 'user');
INSERT INTO `pear_project_log` VALUES (4239, 'yp58fhjvoxanqbtirwz92m3c', 'kqdcn2w40p58r31zyo6efjib', 'action 属性支持作为一个返回 Promise 对象的函数，使用更加灵活', '创建了任务 ', 'create', '2019-01-04 09:18:24', 'orycwlhf7n2qx1pta038dzjk', 'task', '', 0, NULL, 'plus');
INSERT INTO `pear_project_log` VALUES (4240, 'sm4bhc5v2fqo70ja6twrzyuk', 'kqdcn2w40p58r31zyo6efjib', '', '添加了子任务 \"action 属性支持作为一个返回 Promise 对象的函数，使用更加灵活\"', 'createChild', '2019-01-04 09:18:24', 'yctbsv81x6dmahkf7ei5o4r9', 'task', '', 0, NULL, 'bars');
INSERT INTO `pear_project_log` VALUES (4241, 'e9k6u3vtrwb48njmzhgipcxl', 'kqdcn2w40p58r31zyo6efjib', '', '指派给了 vilson', 'assign', '2019-01-04 09:18:24', 'orycwlhf7n2qx1pta038dzjk', 'task', '6v7be19pwman2fird04gqu53', 0, NULL, 'user');
INSERT INTO `pear_project_log` VALUES (4242, 'e8o2chmva49yb670g5ld1n3j', 'kqdcn2w40p58r31zyo6efjib', '', '认领了任务 ', 'claim', '2019-01-04 09:18:50', 'yctbsv81x6dmahkf7ei5o4r9', 'task', '', 0, NULL, 'user');
INSERT INTO `pear_project_log` VALUES (4243, 'yxv4b1kd0zntahm63sfj2cpi', 'kqdcn2w40p58r31zyo6efjib', '', '更新任务优先级为 非常紧急', 'pri', '2019-01-04 09:19:16', '3qz5hfsin69xt8cgbd70lkew', 'task', '', 0, NULL, 'user');
INSERT INTO `pear_project_log` VALUES (4244, 'gxq2b46fh7t8rudnvcsimeaz', 'kqdcn2w40p58r31zyo6efjib', '', '更新截止时间为 01月04日 18:00', 'setEndTime', '2019-01-04 09:19:42', '0a84xkg12enqjml7rz6dbifw', 'task', '', 0, NULL, 'calendar');
INSERT INTO `pear_project_log` VALUES (4245, '053rfobwtegvy7mnq4s8k1c9', 'kqdcn2w40p58r31zyo6efjib', '', '更新截止时间为 01月01日 18:00', 'setEndTime', '2019-01-04 09:19:51', 'p1aujdigrlxky76h8cs3z4w0', 'task', '', 0, NULL, 'calendar');
INSERT INTO `pear_project_log` VALUES (4246, 'dyj9z6wvmrh84bx07ofsacnq', 'kqdcn2w40p58r31zyo6efjib', '', '指派给了 Chihiro', 'assign', '2019-01-04 09:19:58', 'p1aujdigrlxky76h8cs3z4w0', 'task', 'y680trgedcavbhnz24u7i5m3', 0, NULL, 'user');
INSERT INTO `pear_project_log` VALUES (4247, 'usbyo9z8x12frq7lgmvp0tk3', 'y680trgedcavbhnz24u7i5m3', '', '完成了任务 ', 'done', '2019-01-04 09:23:11', 'ozi8awms1lpcbde4fuq5ktgj', 'task', '', 0, NULL, 'check');
INSERT INTO `pear_project_log` VALUES (4248, 'undfg6m57a1wkojy0i9l4bcq', 'y680trgedcavbhnz24u7i5m3', '', '重做了任务 ', 'redo', '2019-01-04 09:23:12', 'ozi8awms1lpcbde4fuq5ktgj', 'task', '', 0, NULL, 'border');
INSERT INTO `pear_project_log` VALUES (4249, 'u5j06pz2gqky9m8341aervnc', '6v7be19pwman2fird04gqu53', 'Add variant prop and deprecate fullWidth and scrollable props', '创建了任务 ', 'create', '2019-01-04 21:17:13', 'up6hn9bd34c8mglwaj1ytefz', 'task', '', 0, NULL, 'plus');
INSERT INTO `pear_project_log` VALUES (4250, 'hv9jscyrzu6fb5q1xpnm7wdl', '6v7be19pwman2fird04gqu53', '', '认领了任务 ', 'claim', '2019-01-04 21:17:13', 'up6hn9bd34c8mglwaj1ytefz', 'task', '', 0, NULL, 'user');
INSERT INTO `pear_project_log` VALUES (4251, 'ecb7pyij8q9w42tkfgh3s5xv', '6v7be19pwman2fird04gqu53', 'Add styles to make size property work with extended property', '创建了任务 ', 'create', '2019-01-04 21:17:19', 'krj4p7ix2cf605vyltmudq1e', 'task', '', 0, NULL, 'plus');
INSERT INTO `pear_project_log` VALUES (4252, 'smkh91f8r4p5ayjqxnl2utgz', '6v7be19pwman2fird04gqu53', '', '认领了任务 ', 'claim', '2019-01-04 21:17:19', 'krj4p7ix2cf605vyltmudq1e', 'task', '', 0, NULL, 'user');
INSERT INTO `pear_project_log` VALUES (4253, 'vi0nwtrzx62bqluc9hd1pf73', '6v7be19pwman2fird04gqu53', 'Add cross references from Modal docs to other components', '创建了任务 ', 'create', '2019-01-04 21:17:46', '1g3vc8tkyla20fp5rdhxe7mo', 'task', '', 0, NULL, 'plus');
INSERT INTO `pear_project_log` VALUES (4254, 'h18qzjuxwfsrtck5gb37dey2', '6v7be19pwman2fird04gqu53', '', '指派给了 Chihiro', 'assign', '2019-01-04 21:17:46', '1g3vc8tkyla20fp5rdhxe7mo', 'task', 'y680trgedcavbhnz24u7i5m3', 0, NULL, 'user');
INSERT INTO `pear_project_log` VALUES (4255, 'lnd73yz9tp4sha8mgc6jbofx', '6v7be19pwman2fird04gqu53', 'Add createSvgIcon type definition', '创建了任务 ', 'create', '2019-01-04 21:18:25', 'nqrleu2c90zsdaj1yph4m8bt', 'task', '', 0, NULL, 'plus');
INSERT INTO `pear_project_log` VALUES (4256, '69fd13ekwabg072incpjtzxq', '6v7be19pwman2fird04gqu53', '', '指派给了 Alians', 'assign', '2019-01-04 21:18:25', 'nqrleu2c90zsdaj1yph4m8bt', 'task', 'kqdcn2w40p58r31zyo6efjib', 0, NULL, 'user');
INSERT INTO `pear_project_log` VALUES (4257, 'fwcql690r7pd2jmoit53h1sy', '6v7be19pwman2fird04gqu53', 'Add customized demo', '创建了任务 ', 'create', '2019-01-04 21:18:37', 'mix3cg2eh1u60fknd7yz9v5t', 'task', '', 0, NULL, 'plus');
INSERT INTO `pear_project_log` VALUES (4258, 'o7xejsdzrcygia48bflh2mn9', '6v7be19pwman2fird04gqu53', '', '指派给了 Chihiro', 'assign', '2019-01-04 21:18:37', 'mix3cg2eh1u60fknd7yz9v5t', 'task', 'y680trgedcavbhnz24u7i5m3', 0, NULL, 'user');
INSERT INTO `pear_project_log` VALUES (4259, 'jibgsz3vh728qpxdnywtalmc', '6v7be19pwman2fird04gqu53', 'Add defaultTheme option for makeStyles', '创建了任务 ', 'create', '2019-01-04 21:18:45', 'dckxz1vpujtafshgr20mwo7e', 'task', '', 0, NULL, 'plus');
INSERT INTO `pear_project_log` VALUES (4260, 'i1d3zsf5hb4ujwvcy6lp09rg', '6v7be19pwman2fird04gqu53', '', '指派给了 Chihiro', 'assign', '2019-01-04 21:18:45', 'dckxz1vpujtafshgr20mwo7e', 'task', 'y680trgedcavbhnz24u7i5m3', 0, NULL, 'user');
INSERT INTO `pear_project_log` VALUES (4261, 'faneshd15vcx782mpo4qjrz0', '6v7be19pwman2fird04gqu53', 'Add nextjs-hooks-with-typescript', '创建了任务 ', 'create', '2019-01-04 21:18:53', 'fd1avskez2q43w80xhb7ypc9', 'task', '', 0, NULL, 'plus');
INSERT INTO `pear_project_log` VALUES (4262, 'jxfa2oiru6by80lg3hcv4s9q', '6v7be19pwman2fird04gqu53', '', '指派给了 Chihiro', 'assign', '2019-01-04 21:18:53', 'fd1avskez2q43w80xhb7ypc9', 'task', 'y680trgedcavbhnz24u7i5m3', 0, NULL, 'user');
INSERT INTO `pear_project_log` VALUES (4263, '036qie8nhvp1wmjs4bfgkua5', '6v7be19pwman2fird04gqu53', 'Add note on archived components', '创建了任务 ', 'create', '2019-01-04 21:19:01', 'as2y4r6mwxuhgvncop3f8z90', 'task', '', 0, NULL, 'plus');
INSERT INTO `pear_project_log` VALUES (4264, 'fjb157v0mexsh8qwig2ay3n4', '6v7be19pwman2fird04gqu53', '', '认领了任务 ', 'claim', '2019-01-04 21:19:01', 'as2y4r6mwxuhgvncop3f8z90', 'task', '', 0, NULL, 'user');
INSERT INTO `pear_project_log` VALUES (4265, 'q7majphuec3wlbyig9r4kons', '6v7be19pwman2fird04gqu53', 'Add Instagram theme', '创建了任务 ', 'create', '2019-01-04 21:19:08', '8zj3vpx0b7qud24ylfgces1m', 'task', '', 0, NULL, 'plus');
INSERT INTO `pear_project_log` VALUES (4266, 'egxlqbr1d27p49yafkv3cn0u', '6v7be19pwman2fird04gqu53', '', '指派给了 Alians', 'assign', '2019-01-04 21:19:08', '8zj3vpx0b7qud24ylfgces1m', 'task', 'kqdcn2w40p58r31zyo6efjib', 0, NULL, 'user');
INSERT INTO `pear_project_log` VALUES (4267, 'ebpjx21r0yhkwcsm59gn3auo', '6v7be19pwman2fird04gqu53', 'Add component prop', '创建了任务 ', 'create', '2019-01-04 21:19:18', 'hcrdvbuzwgojst2f0p134qxi', 'task', '', 0, NULL, 'plus');
INSERT INTO `pear_project_log` VALUES (4268, 'kd3bmhtc0nwi9ojeu2axgqrz', '6v7be19pwman2fird04gqu53', '', '指派给了 Alians', 'assign', '2019-01-04 21:19:18', 'hcrdvbuzwgojst2f0p134qxi', 'task', 'kqdcn2w40p58r31zyo6efjib', 0, NULL, 'user');
INSERT INTO `pear_project_log` VALUES (4269, 'af0puzmxh5dvi1yr8c2q96kw', '6v7be19pwman2fird04gqu53', 'Fix utils.chainPropTypes issue', '创建了任务 ', 'create', '2019-01-04 21:19:37', 'lmognshqz21dbewcu9a3rx87', 'task', '', 0, NULL, 'plus');
INSERT INTO `pear_project_log` VALUES (4270, 'subp5hco4z30x8ml629wtv7a', '6v7be19pwman2fird04gqu53', '', '指派给了 Alians', 'assign', '2019-01-04 21:19:37', 'lmognshqz21dbewcu9a3rx87', 'task', 'kqdcn2w40p58r31zyo6efjib', 0, NULL, 'user');
INSERT INTO `pear_project_log` VALUES (4271, 'ig7evacluxktjm865oy0241w', '6v7be19pwman2fird04gqu53', 'Fix vertical text alignment by reducing padding', '创建了任务 ', 'create', '2019-01-04 21:19:51', 'n6ulc7ebxpqahi50dy9k1sgf', 'task', '', 0, NULL, 'plus');
INSERT INTO `pear_project_log` VALUES (4272, 'c734zkl1hs9ef5p8vmgrow2y', '6v7be19pwman2fird04gqu53', '', '认领了任务 ', 'claim', '2019-01-04 21:19:51', 'n6ulc7ebxpqahi50dy9k1sgf', 'task', '', 0, NULL, 'user');
INSERT INTO `pear_project_log` VALUES (4273, 'blspvm6321oqxw5ekd8fgrzh', '6v7be19pwman2fird04gqu53', 'Fix infinite loop in the scroll button logic', '创建了任务 ', 'create', '2019-01-04 21:19:57', 'rqjng1kfcp4wyiamt6o23zbu', 'task', '', 0, NULL, 'plus');
INSERT INTO `pear_project_log` VALUES (4274, 'ce7qy51oun6xsvgjz8lt29wp', '6v7be19pwman2fird04gqu53', '', '指派给了 Chihiro', 'assign', '2019-01-04 21:19:57', 'rqjng1kfcp4wyiamt6o23zbu', 'task', 'y680trgedcavbhnz24u7i5m3', 0, NULL, 'user');
INSERT INTO `pear_project_log` VALUES (4275, 'pjo8kwxfz0t4s9riqc1a2y56', '6v7be19pwman2fird04gqu53', 'Fix component animations', '创建了任务 ', 'create', '2019-01-04 21:20:05', 'qsz65fvgi8hyx3e7bn14o9wm', 'task', '', 0, NULL, 'plus');
INSERT INTO `pear_project_log` VALUES (4276, 'wyx6dmp8aknejcf53ihu1ob9', '6v7be19pwman2fird04gqu53', '', '指派给了 Alians', 'assign', '2019-01-04 21:20:05', 'qsz65fvgi8hyx3e7bn14o9wm', 'task', 'kqdcn2w40p58r31zyo6efjib', 0, NULL, 'user');
INSERT INTO `pear_project_log` VALUES (4277, '4rdmf20pteglk9nsyqi3jb85', '6v7be19pwman2fird04gqu53', 'Fix responsivePropType typo', '创建了任务 ', 'create', '2019-01-04 21:20:12', 'byiuxhn0v6sod4zap1t2fclr', 'task', '', 0, NULL, 'plus');
INSERT INTO `pear_project_log` VALUES (4278, '48o1z0emd6chu29xk5iwansf', '6v7be19pwman2fird04gqu53', '', '指派给了 Alians', 'assign', '2019-01-04 21:20:12', 'byiuxhn0v6sod4zap1t2fclr', 'task', 'kqdcn2w40p58r31zyo6efjib', 0, NULL, 'user');
INSERT INTO `pear_project_log` VALUES (4279, 'srabgivxch13kuemzq9n58to', '6v7be19pwman2fird04gqu53', 'Change action element to have a fixed right margin', '创建了任务 ', 'create', '2019-01-04 21:20:27', 'jxd3rpmay6qonsk1i8wg5e9u', 'task', '', 0, NULL, 'plus');
INSERT INTO `pear_project_log` VALUES (4280, 'z82lho53je6sfc7r9i0dnwpa', '6v7be19pwman2fird04gqu53', '', '指派给了 Alians', 'assign', '2019-01-04 21:20:27', 'jxd3rpmay6qonsk1i8wg5e9u', 'task', 'kqdcn2w40p58r31zyo6efjib', 0, NULL, 'user');
INSERT INTO `pear_project_log` VALUES (4281, 'lti2ksapfd06rux3w5q9zgvc', '6v7be19pwman2fird04gqu53', 'Change height from 5 to 4 pixels', '创建了任务 ', 'create', '2019-01-04 21:20:33', 'vmzeciodgbfp7ysu38tq10kj', 'task', '', 0, NULL, 'plus');
INSERT INTO `pear_project_log` VALUES (4282, 'pkwhqt1ncf5o6xyjmu42irgb', '6v7be19pwman2fird04gqu53', '', '认领了任务 ', 'claim', '2019-01-04 21:20:33', 'vmzeciodgbfp7ysu38tq10kj', 'task', '', 0, NULL, 'user');
INSERT INTO `pear_project_log` VALUES (4283, 'fcp6rwx0gklq8a7hz9b35ijd', '6v7be19pwman2fird04gqu53', 'Change sub-components to have fixed gutters', '创建了任务 ', 'create', '2019-01-04 21:20:45', '6cagd725tifonvw0qphe9zsb', 'task', '', 0, NULL, 'plus');
INSERT INTO `pear_project_log` VALUES (4284, '4fwn60cymibsg58vaxoleq37', '6v7be19pwman2fird04gqu53', '', '认领了任务 ', 'claim', '2019-01-04 21:20:45', '6cagd725tifonvw0qphe9zsb', 'task', '', 0, NULL, 'user');
INSERT INTO `pear_project_log` VALUES (4285, '1ln8e40zfx6ok7jabdqcpr29', '6v7be19pwman2fird04gqu53', 'Change the classes structure to match the core components convention', '创建了任务 ', 'create', '2019-01-04 21:20:54', 'xu3jgyow2s9f1km0rctqin4v', 'task', '', 0, NULL, 'plus');
INSERT INTO `pear_project_log` VALUES (4286, 'jpwcd12ve5zgiq6ofu9r8atl', '6v7be19pwman2fird04gqu53', '', '指派给了 Chihiro', 'assign', '2019-01-04 21:20:54', 'xu3jgyow2s9f1km0rctqin4v', 'task', 'y680trgedcavbhnz24u7i5m3', 0, NULL, 'user');
INSERT INTO `pear_project_log` VALUES (4287, 'protl2wye4km9zns3bq87icx', '6v7be19pwman2fird04gqu53', 'Update the action spacing to better match the spec', '创建了任务 ', 'create', '2019-01-04 21:21:12', 'k3g07m1qyctvbp95siohju6f', 'task', '', 0, NULL, 'plus');
INSERT INTO `pear_project_log` VALUES (4288, 'dayz0l5kr98s1fpnj7ohm623', '6v7be19pwman2fird04gqu53', '', '指派给了 Chihiro', 'assign', '2019-01-04 21:21:12', 'k3g07m1qyctvbp95siohju6f', 'task', 'y680trgedcavbhnz24u7i5m3', 0, NULL, 'user');
INSERT INTO `pear_project_log` VALUES (4289, '038psj6uflqcn9y5ravhtbgd', '6v7be19pwman2fird04gqu53', 'Update the emotion documentation', '创建了任务 ', 'create', '2019-01-04 21:21:18', 'oh5wpj9kd8e6ltusxq271ma3', 'task', '', 0, NULL, 'plus');
INSERT INTO `pear_project_log` VALUES (4290, 'v7l5xz63qmy2sfc0igub18wp', '6v7be19pwman2fird04gqu53', '', '指派给了 Chihiro', 'assign', '2019-01-04 21:21:18', 'oh5wpj9kd8e6ltusxq271ma3', 'task', 'y680trgedcavbhnz24u7i5m3', 0, NULL, 'user');
INSERT INTO `pear_project_log` VALUES (4291, 'ikpveu0dxl2fgrna16ms3tyo', '6v7be19pwman2fird04gqu53', 'Update the CodeFund embed script', '创建了任务 ', 'create', '2019-01-04 21:21:25', 'akdwslbtp3z82xecui0y4ovq', 'task', '', 0, NULL, 'plus');
INSERT INTO `pear_project_log` VALUES (4292, 'q1p8igck4a9nxo3l502d7h6z', '6v7be19pwman2fird04gqu53', '', '指派给了 Chihiro', 'assign', '2019-01-04 21:21:25', 'akdwslbtp3z82xecui0y4ovq', 'task', 'y680trgedcavbhnz24u7i5m3', 0, NULL, 'user');
INSERT INTO `pear_project_log` VALUES (4293, 'y2unpg9qifrm14kd3x8tzvs6', '6v7be19pwman2fird04gqu53', 'Update react-select demo to have isClearable set to true', '创建了任务 ', 'create', '2019-01-04 21:21:31', 'hayfr6vl398nq5exgszobu2j', 'task', '', 0, NULL, 'plus');
INSERT INTO `pear_project_log` VALUES (4294, '75ecai2omdzqurl3jpy9w0th', '6v7be19pwman2fird04gqu53', '', '认领了任务 ', 'claim', '2019-01-04 21:21:31', 'hayfr6vl398nq5exgszobu2j', 'task', '', 0, NULL, 'user');
INSERT INTO `pear_project_log` VALUES (4295, 'u910zdfm24ji3hoqstwnyvl7', '6v7be19pwman2fird04gqu53', 'Update album page-layout preview image album.png', '创建了任务 ', 'create', '2019-01-04 21:21:41', 'mf80iu15kepavbg2r9ldcjsh', 'task', '', 0, NULL, 'plus');
INSERT INTO `pear_project_log` VALUES (4296, '91gkpfrqeclbu5h8xdzn40mj', '6v7be19pwman2fird04gqu53', '', '指派给了 Alians', 'assign', '2019-01-04 21:21:42', 'mf80iu15kepavbg2r9ldcjsh', 'task', 'kqdcn2w40p58r31zyo6efjib', 0, NULL, 'user');
INSERT INTO `pear_project_log` VALUES (4297, 'ksw9y1dmvntue7o85q2xplig', '6v7be19pwman2fird04gqu53', 'Update some components to better match the Material specification', '创建了任务 ', 'create', '2019-01-04 21:22:08', 'nzy71f5i6g0skwau4lrj3d8b', 'task', '', 0, NULL, 'plus');
INSERT INTO `pear_project_log` VALUES (4298, 'jxbdmz1csi2e3w7aouvfnlrg', '6v7be19pwman2fird04gqu53', '', '指派给了 Alians', 'assign', '2019-01-04 21:22:08', 'nzy71f5i6g0skwau4lrj3d8b', 'task', 'kqdcn2w40p58r31zyo6efjib', 0, NULL, 'user');
INSERT INTO `pear_project_log` VALUES (4299, 'wx6fm0c9iea3qlvb7ounksd2', '6v7be19pwman2fird04gqu53', 'Remove hoisting of static properties in HOCs', '创建了任务 ', 'create', '2019-01-04 21:22:20', '4cug3e5rodalq9x81ywht0zn', 'task', '', 0, NULL, 'plus');
INSERT INTO `pear_project_log` VALUES (4300, 'zi16cj4gmyn9wfb72ktroxa0', '6v7be19pwman2fird04gqu53', '', '指派给了 Alians', 'assign', '2019-01-04 21:22:20', '4cug3e5rodalq9x81ywht0zn', 'task', 'kqdcn2w40p58r31zyo6efjib', 0, NULL, 'user');
INSERT INTO `pear_project_log` VALUES (4301, 'me0stqcvz5r48p29nyu76x1a', '6v7be19pwman2fird04gqu53', 'Remove the withRoot HOC', '创建了任务 ', 'create', '2019-01-04 21:22:24', '92fow0le47htb6xkv5ynzuri', 'task', '', 0, NULL, 'plus');
INSERT INTO `pear_project_log` VALUES (4302, 'rmce81xwt5f9sb7uv6o0k3yn', '6v7be19pwman2fird04gqu53', '', '指派给了 Alians', 'assign', '2019-01-04 21:22:24', '92fow0le47htb6xkv5ynzuri', 'task', 'kqdcn2w40p58r31zyo6efjib', 0, NULL, 'user');
INSERT INTO `pear_project_log` VALUES (4303, 'lfeou15n7gzktw8xrdmqayh6', '6v7be19pwman2fird04gqu53', '100% remove the prop types', '创建了任务 ', 'create', '2019-01-04 21:22:34', '6ky18i9cg0eqvfzn2th3ux5l', 'task', '', 0, NULL, 'plus');
INSERT INTO `pear_project_log` VALUES (4304, '5o7unx3qt62s4impw8hyzl0k', '6v7be19pwman2fird04gqu53', '', '认领了任务 ', 'claim', '2019-01-04 21:22:34', '6ky18i9cg0eqvfzn2th3ux5l', 'task', '', 0, NULL, 'user');
INSERT INTO `pear_project_log` VALUES (4305, 'r6j9of80pmdlatq2b5wzsx7i', '6v7be19pwman2fird04gqu53', 'Remove unused lint directives', '创建了任务 ', 'create', '2019-01-04 21:22:40', 'zj6skt9orn748gh5mvb2ueif', 'task', '', 0, NULL, 'plus');
INSERT INTO `pear_project_log` VALUES (4306, 'i3zehaf9ux1bpjqsmgl2w4kt', '6v7be19pwman2fird04gqu53', '', '认领了任务 ', 'claim', '2019-01-04 21:22:40', 'zj6skt9orn748gh5mvb2ueif', 'task', '', 0, NULL, 'user');
INSERT INTO `pear_project_log` VALUES (4307, 'itoehcalwm75x86ndukgvbz9', '6v7be19pwman2fird04gqu53', '', '更新任务优先级为 非常紧急', 'pri', '2019-01-04 21:23:11', 'jxd3rpmay6qonsk1i8wg5e9u', 'task', '', 0, NULL, 'user');
INSERT INTO `pear_project_log` VALUES (4308, 'a60nuwtb2skd7mqpi5vroc89', '6v7be19pwman2fird04gqu53', 'If you install react-jss via npm, currently it installs with version 10.0.0-alpha.7 which has breaking changes included.\nSo I guess it should be updated with below? Correct me if I\'m wrong, thanks', NULL, 'comment', '2019-01-04 21:27:17', 'jxd3rpmay6qonsk1i8wg5e9u', 'task', '0', 1, NULL, NULL);
INSERT INTO `pear_project_log` VALUES (4309, 'zv57agjqeymuw4tpkilrs0h1', 'kqdcn2w40p58r31zyo6efjib', 'The new JSS v10 alpha seems to have deprecated the react-jss library, or at least the github repo, and there seem to be breaking API changes as well, the migration path of which is not clear.', NULL, 'comment', '2019-01-04 21:27:30', 'jxd3rpmay6qonsk1i8wg5e9u', 'task', '0', 1, NULL, NULL);
INSERT INTO `pear_project_log` VALUES (4310, '3lwyhv5tf4d2ec7a1qknp6zr', 'y680trgedcavbhnz24u7i5m3', 'yeah, npm tags is a mess right now, need to find a way to set them each time with our current setup over lerna publish or drop lerna and do it differently', NULL, 'comment', '2019-01-04 21:29:15', 'jxd3rpmay6qonsk1i8wg5e9u', 'task', '0', 1, NULL, NULL);
INSERT INTO `pear_project_log` VALUES (4312, 'jbex46ci20y781aswvgprdhm', 'y680trgedcavbhnz24u7i5m3', 'Improve demos loading', '创建了任务 ', 'create', '2019-01-04 21:30:13', 'a75dcqx2sjivokmg49yh380l', 'task', '', 0, NULL, 'plus');
INSERT INTO `pear_project_log` VALUES (4314, 'kt72j1eobvif5hdpzcmqxgy9', 'y680trgedcavbhnz24u7i5m3', '', '认领了任务 ', 'claim', '2019-01-04 21:30:13', 'a75dcqx2sjivokmg49yh380l', 'task', '', 0, NULL, 'user');
INSERT INTO `pear_project_log` VALUES (4315, '0ycs8l7j123w4dgpoetka9qu', 'y680trgedcavbhnz24u7i5m3', 'Improve the service-worker logic', '创建了任务 ', 'create', '2019-01-04 21:30:19', '7ns924ofulpjxkgq06y3bm5r', 'task', '', 0, NULL, 'plus');
INSERT INTO `pear_project_log` VALUES (4317, 'g3yznvlot84umieabq01p5ck', 'y680trgedcavbhnz24u7i5m3', '', '认领了任务 ', 'claim', '2019-01-04 21:30:19', '7ns924ofulpjxkgq06y3bm5r', 'task', '', 0, NULL, 'user');
INSERT INTO `pear_project_log` VALUES (4319, '2qwgit8mpduzsanbckrvx97e', 'y680trgedcavbhnz24u7i5m3', '', '完成了任务 ', 'done', '2019-01-04 21:31:17', 'fd1avskez2q43w80xhb7ypc9', 'task', '', 0, NULL, 'check');
INSERT INTO `pear_project_log` VALUES (4320, '0brwcgnltfmhxipd78aos542', 'kqdcn2w40p58r31zyo6efjib', '', '完成了任务 ', 'done', '2019-01-04 21:31:23', 'nzy71f5i6g0skwau4lrj3d8b', 'task', '', 0, NULL, 'check');
INSERT INTO `pear_project_log` VALUES (4321, 'hwv5j3mqod1gntape8s62yiu', 'kqdcn2w40p58r31zyo6efjib', '', '完成了任务 ', 'done', '2019-01-04 21:31:27', 'qsz65fvgi8hyx3e7bn14o9wm', 'task', '', 0, NULL, 'check');
INSERT INTO `pear_project_log` VALUES (4322, 'vicyxaq4ptu21r8gjs9benmz', 'kqdcn2w40p58r31zyo6efjib', '', '完成了任务 ', 'done', '2019-01-04 21:31:47', '1g3vc8tkyla20fp5rdhxe7mo', 'task', '', 0, NULL, 'check');
INSERT INTO `pear_project_log` VALUES (4323, 'se0zp1hf792rcmbx8l4dyg5i', '6v7be19pwman2fird04gqu53', '', '更新截止时间为 01月02日 18:00', 'setEndTime', '2019-01-04 21:32:38', '4cug3e5rodalq9x81ywht0zn', 'task', '', 0, NULL, 'calendar');
INSERT INTO `pear_project_log` VALUES (4325, 'r9qeij67bmxh31na2slkco0z', '6v7be19pwman2fird04gqu53', '', '更新任务优先级为 紧急', 'pri', '2019-01-04 21:33:45', 'zj6skt9orn748gh5mvb2ueif', 'task', '', 0, NULL, 'user');
INSERT INTO `pear_project_log` VALUES (4326, 'ch920iglvuz6pdreb7wyf4a8', '6v7be19pwman2fird04gqu53', '', '更新截止时间为 01月05日 18:00', 'setEndTime', '2019-01-04 21:33:55', 'krj4p7ix2cf605vyltmudq1e', 'task', '', 0, NULL, 'calendar');
INSERT INTO `pear_project_log` VALUES (4328, 'dbve2z5hqowgut1c69rai74p', '6v7be19pwman2fird04gqu53', '', '关联了文件 <a target=\"_blank\" class=\"muted\" href=\"http://easyproject.net/static/upload/file/default/6v7be19pwman2fird04gqu53/6v7be19pwman2fird04gqu53/20190111/20190111104540-ioncube_loaders_win_nonts_vc11_x86.zip \">ioncube_loaders_win_nonts_vc11_x86.zip</a>', 'linkFile', '2019-01-11 10:45:40', 'g15scwqm9zxroy7p8bvjt632', 'task', '', 0, NULL, 'link');
INSERT INTO `pear_project_log` VALUES (4329, '6lbv9wakfts5jd4eyhgco2ur', '6v7be19pwman2fird04gqu53', '', '关联了文件 <a target=\"_blank\" class=\"muted\" href=\"http://easyproject.net/static/upload/file/default/6v7be19pwman2fird04gqu53/6v7be19pwman2fird04gqu53/20190111/20190111104540-技术部项目周报.xlsx \">技术部项目周报.xlsx</a>', 'linkFile', '2019-01-11 10:45:40', 'g15scwqm9zxroy7p8bvjt632', 'task', '', 0, NULL, 'link');
INSERT INTO `pear_project_log` VALUES (4330, 'm6847e9oj20tagqb5uclfyir', '6v7be19pwman2fird04gqu53', '', '关联了文件 <a target=\"_blank\" class=\"muted\" href=\"http://easyproject.net/static/upload/file/default/6v7be19pwman2fird04gqu53/6v7be19pwman2fird04gqu53/20190111/20190111104607-cover.png \">cover.png</a>', 'linkFile', '2019-01-11 10:46:07', 'g15scwqm9zxroy7p8bvjt632', 'task', '', 0, NULL, 'link');
INSERT INTO `pear_project_log` VALUES (4331, 'cguhle3aypqw05fz6iv4rmjn', '6v7be19pwman2fird04gqu53', '', '取消关联文件 <a target=\"_blank\" class=\"muted\" href=\"http://easyproject.net/static/upload/file/default/6v7be19pwman2fird04gqu53/6v7be19pwman2fird04gqu53/20190111/20190111104607-cover.png \">cover.png</a>', 'unlinkFile', '2019-01-11 11:19:16', 'g15scwqm9zxroy7p8bvjt632', 'task', '', 0, NULL, 'disconnect');
INSERT INTO `pear_project_log` VALUES (4332, 'ibq97pevg4w6tfna3hukydjr', '6v7be19pwman2fird04gqu53', '', '把任务移到了回收站 ', 'recycle', '2019-01-12 22:27:56', 'owrs04m3e2klj8uqac6tiy17', 'task', '', 0, NULL, 'delete');
INSERT INTO `pear_project_log` VALUES (4333, 'te280dxhycfkjzvqwi9bam63', '6v7be19pwman2fird04gqu53', '', '恢复了任务 ', 'recovery', '2019-01-13 20:46:29', 'owrs04m3e2klj8uqac6tiy17', 'task', '', 0, NULL, 'undo');
INSERT INTO `pear_project_log` VALUES (4334, '640evh2r593opsj78lbaknqd', '6v7be19pwman2fird04gqu53', '', '重做了任务 ', 'redo', '2019-01-22 09:26:28', 'p1aujdigrlxky76h8cs3z4w0', 'task', '', 0, 'mo4uqwfb06dxv8ez2spkl3rg', 'border');
INSERT INTO `pear_project_log` VALUES (4335, 'pxj6rs9a3gzmv4tce5dlfiok', '6v7be19pwman2fird04gqu53', '', '重做了任务 ', 'redo', '2019-01-22 09:27:21', 'xkic58d20srnu9jm7ohqw14f', 'task', '', 0, 'mo4uqwfb06dxv8ez2spkl3rg', 'border');
INSERT INTO `pear_project_log` VALUES (4336, 'pt5kr32fbyjcladn4sweqmo0', '6v7be19pwman2fird04gqu53', '', '完成了任务 ', 'done', '2019-01-22 09:27:27', '2bn918l6ejyzousa73dkpgci', 'task', '', 0, 'mo4uqwfb06dxv8ez2spkl3rg', 'check');
INSERT INTO `pear_project_log` VALUES (4337, 'znqcf283ixw0g7b9sa5hvryj', '6v7be19pwman2fird04gqu53', '', '完成了任务 ', 'done', '2019-01-22 09:27:40', 'uwq87z2f0hnvrl6o9gtcb3iy', 'task', '', 0, 'mo4uqwfb06dxv8ez2spkl3rg', 'check');
INSERT INTO `pear_project_log` VALUES (4338, 'd1eirc78j596ut3qfyx0swbg', '6v7be19pwman2fird04gqu53', '', '重做了任务 ', 'redo', '2019-01-22 09:27:44', 'gjmotpbrwva079ukde4izn38', 'task', '', 0, 'mo4uqwfb06dxv8ez2spkl3rg', 'border');
INSERT INTO `pear_project_log` VALUES (4339, 'mujeyl30g4rpx51htofv27sd', '6v7be19pwman2fird04gqu53', '', '重做了任务 ', 'redo', '2019-01-22 09:28:37', 'uwq87z2f0hnvrl6o9gtcb3iy', 'task', '', 0, 'mo4uqwfb06dxv8ez2spkl3rg', 'border');
INSERT INTO `pear_project_log` VALUES (4340, '869lgdwb3piavo1ec4tf2kuq', '6v7be19pwman2fird04gqu53', '', '完成了任务 ', 'done', '2019-01-22 09:28:44', 'uwq87z2f0hnvrl6o9gtcb3iy', 'task', '', 0, 'mo4uqwfb06dxv8ez2spkl3rg', 'check');
INSERT INTO `pear_project_log` VALUES (4341, 'af4ozmystrqincju75dxpwv0', '6v7be19pwman2fird04gqu53', '', '重做了任务 ', 'redo', '2019-01-22 09:28:49', 'uwq87z2f0hnvrl6o9gtcb3iy', 'task', '', 0, 'mo4uqwfb06dxv8ez2spkl3rg', 'border');
INSERT INTO `pear_project_log` VALUES (4342, 'krsxhc15bd6wtnpuq94gilz2', '6v7be19pwman2fird04gqu53', '', '添加了参与者 Alians', 'inviteMember', '2019-01-22 09:29:26', '6hj43ueim2bk187sqzcoy59v', 'task', 'kqdcn2w40p58r31zyo6efjib', 0, 'mo4uqwfb06dxv8ez2spkl3rg', 'user-add');
INSERT INTO `pear_project_log` VALUES (4343, '0rq5hmjwgeonxb9ztslku8ac', '6v7be19pwman2fird04gqu53', '', '完成了任务 ', 'done', '2019-01-22 09:29:39', '6hj43ueim2bk187sqzcoy59v', 'task', '', 0, 'mo4uqwfb06dxv8ez2spkl3rg', 'check');
INSERT INTO `pear_project_log` VALUES (4344, 'd6t7n3oxyv4fehr9ka2p1sj8', '6v7be19pwman2fird04gqu53', '', '重做了任务 ', 'redo', '2019-01-22 09:29:49', '6hj43ueim2bk187sqzcoy59v', 'task', '', 0, 'mo4uqwfb06dxv8ez2spkl3rg', 'border');
INSERT INTO `pear_project_log` VALUES (4345, '189uhp2abf5grx3zeljnvtyi', '6v7be19pwman2fird04gqu53', '', '完成了任务 ', 'done', '2019-01-22 09:31:23', 'uwq87z2f0hnvrl6o9gtcb3iy', 'task', '', 0, 'mo4uqwfb06dxv8ez2spkl3rg', 'check');
INSERT INTO `pear_project_log` VALUES (4346, 'kgzi1bltahenq3d879xpjcmo', '6v7be19pwman2fird04gqu53', '', '重做了任务 ', 'redo', '2019-01-22 09:49:31', 'uwq87z2f0hnvrl6o9gtcb3iy', 'task', '', 0, 'mo4uqwfb06dxv8ez2spkl3rg', 'border');
INSERT INTO `pear_project_log` VALUES (4347, 'suqp9no7zbdmijk5vr13xael', '6v7be19pwman2fird04gqu53', '', '完成了任务 ', 'done', '2019-01-22 09:56:16', 'uwq87z2f0hnvrl6o9gtcb3iy', 'task', '', 0, 'mo4uqwfb06dxv8ez2spkl3rg', 'check');
INSERT INTO `pear_project_log` VALUES (4348, 'khpzxr8wbteaqf2vgj346soy', '6v7be19pwman2fird04gqu53', '', '重做了任务 ', 'redo', '2019-01-22 09:57:35', 'uwq87z2f0hnvrl6o9gtcb3iy', 'task', '', 0, 'mo4uqwfb06dxv8ez2spkl3rg', 'border');
INSERT INTO `pear_project_log` VALUES (4349, 'fnhkexwao5d2j0c9iqts1mgr', '6v7be19pwman2fird04gqu53', '', '完成了任务 ', 'done', '2019-01-22 09:57:54', 'uwq87z2f0hnvrl6o9gtcb3iy', 'task', '', 0, 'mo4uqwfb06dxv8ez2spkl3rg', 'check');
INSERT INTO `pear_project_log` VALUES (4350, '37wt1f5kiqburjmndclxeo8h', '6v7be19pwman2fird04gqu53', '', '重做了任务 ', 'redo', '2019-01-22 09:58:53', 'uwq87z2f0hnvrl6o9gtcb3iy', 'task', '', 0, 'mo4uqwfb06dxv8ez2spkl3rg', 'border');
INSERT INTO `pear_project_log` VALUES (4351, 'y5psxv1b0h7tro9uz38en2gf', '6v7be19pwman2fird04gqu53', '', '完成了任务 ', 'done', '2019-01-22 10:00:16', 'uwq87z2f0hnvrl6o9gtcb3iy', 'task', '', 0, 'mo4uqwfb06dxv8ez2spkl3rg', 'check');
INSERT INTO `pear_project_log` VALUES (4352, 'eumgnqfyvcrl6d37b28toazp', '6v7be19pwman2fird04gqu53', '', '重做了任务 ', 'redo', '2019-01-22 10:00:22', 'uwq87z2f0hnvrl6o9gtcb3iy', 'task', '', 0, 'mo4uqwfb06dxv8ez2spkl3rg', 'border');
INSERT INTO `pear_project_log` VALUES (4353, 'cfn437mlrv2beq0zw5ygkixp', '6v7be19pwman2fird04gqu53', '', '完成了任务 ', 'done', '2019-01-22 10:01:05', 'uwq87z2f0hnvrl6o9gtcb3iy', 'task', '', 0, 'mo4uqwfb06dxv8ez2spkl3rg', 'check');
INSERT INTO `pear_project_log` VALUES (4354, '1siu8fw2gry6p4d0xeh5lmnb', '6v7be19pwman2fird04gqu53', '', '重做了任务 ', 'redo', '2019-01-22 10:01:17', 'uwq87z2f0hnvrl6o9gtcb3iy', 'task', '', 0, 'mo4uqwfb06dxv8ez2spkl3rg', 'border');
INSERT INTO `pear_project_log` VALUES (4355, 'i280y4wth1cqb3sfvku59mrx', '6v7be19pwman2fird04gqu53', '', '完成了任务 ', 'done', '2019-01-22 10:01:44', 'uwq87z2f0hnvrl6o9gtcb3iy', 'task', '', 0, 'mo4uqwfb06dxv8ez2spkl3rg', 'check');
INSERT INTO `pear_project_log` VALUES (4356, '68zpnieukwgch5x17s4vdfto', 'y680trgedcavbhnz24u7i5m3', '', '重做了任务 ', 'redo', '2019-01-22 10:01:55', 'uwq87z2f0hnvrl6o9gtcb3iy', 'task', '', 0, 'mo4uqwfb06dxv8ez2spkl3rg', 'border');
INSERT INTO `pear_project_log` VALUES (4357, 't50dqmeiopruxlz47319fgbv', 'y680trgedcavbhnz24u7i5m3', '', '完成了任务 ', 'done', '2019-01-22 10:03:09', 'uwq87z2f0hnvrl6o9gtcb3iy', 'task', '', 0, 'mo4uqwfb06dxv8ez2spkl3rg', 'check');
INSERT INTO `pear_project_log` VALUES (4358, 'svid1fac8j6w4beyop0ktlx7', 'y680trgedcavbhnz24u7i5m3', '', '重做了任务 ', 'redo', '2019-01-22 10:03:36', 'uwq87z2f0hnvrl6o9gtcb3iy', 'task', '', 0, 'mo4uqwfb06dxv8ez2spkl3rg', 'border');
INSERT INTO `pear_project_log` VALUES (4359, '93eidcafx6jo1ltqnwbkh7r5', 'y680trgedcavbhnz24u7i5m3', '', '完成了任务 ', 'done', '2019-01-22 10:18:10', 'uwq87z2f0hnvrl6o9gtcb3iy', 'task', '', 0, 'mo4uqwfb06dxv8ez2spkl3rg', 'check');
INSERT INTO `pear_project_log` VALUES (4360, 'oul1eahk0p9i8dn5t26yjxqf', 'y680trgedcavbhnz24u7i5m3', '', '重做了任务 ', 'redo', '2019-01-22 10:27:52', 'uwq87z2f0hnvrl6o9gtcb3iy', 'task', '', 0, 'mo4uqwfb06dxv8ez2spkl3rg', 'border');
INSERT INTO `pear_project_log` VALUES (4361, '2joeqv0bwpkx7fli8ndzh5g9', 'y680trgedcavbhnz24u7i5m3', '', '完成了任务 ', 'done', '2019-01-22 10:29:57', 'uwq87z2f0hnvrl6o9gtcb3iy', 'task', '', 0, 'mo4uqwfb06dxv8ez2spkl3rg', 'check');
INSERT INTO `pear_project_log` VALUES (4362, 'x8rho36lz7sde1yfcmjwvtu0', 'y680trgedcavbhnz24u7i5m3', '', '重做了任务 ', 'redo', '2019-01-22 10:30:27', 'uwq87z2f0hnvrl6o9gtcb3iy', 'task', '', 0, 'mo4uqwfb06dxv8ez2spkl3rg', 'border');
INSERT INTO `pear_project_log` VALUES (4363, '0n4vt7bfyhu3msarwce9jxzq', 'y680trgedcavbhnz24u7i5m3', '', '完成了任务 ', 'done', '2019-01-22 10:33:54', 'uwq87z2f0hnvrl6o9gtcb3iy', 'task', '', 0, 'mo4uqwfb06dxv8ez2spkl3rg', 'check');
INSERT INTO `pear_project_log` VALUES (4364, 'nhpd4ul98weazi6bt1kc0fjm', 'y680trgedcavbhnz24u7i5m3', '', '重做了任务 ', 'redo', '2019-01-22 10:34:59', 'uwq87z2f0hnvrl6o9gtcb3iy', 'task', '', 0, 'mo4uqwfb06dxv8ez2spkl3rg', 'border');
INSERT INTO `pear_project_log` VALUES (4365, 't4uodm190n32li85rawp7hyq', 'y680trgedcavbhnz24u7i5m3', '', '完成了任务 ', 'done', '2019-01-22 10:49:21', 'uwq87z2f0hnvrl6o9gtcb3iy', 'task', '', 0, 'mo4uqwfb06dxv8ez2spkl3rg', 'check');
INSERT INTO `pear_project_log` VALUES (4366, 'k82ny1r7t05qchsjb6zudv9i', 'y680trgedcavbhnz24u7i5m3', '', '重做了任务 ', 'redo', '2019-01-22 10:50:23', 'uwq87z2f0hnvrl6o9gtcb3iy', 'task', '', 0, 'mo4uqwfb06dxv8ez2spkl3rg', 'border');
INSERT INTO `pear_project_log` VALUES (4367, 'c2zgd943qf1u6opnx5wbj8va', 'y680trgedcavbhnz24u7i5m3', '', '完成了任务 ', 'done', '2019-01-22 10:51:25', 'uwq87z2f0hnvrl6o9gtcb3iy', 'task', '', 0, 'mo4uqwfb06dxv8ez2spkl3rg', 'check');
INSERT INTO `pear_project_log` VALUES (4368, 'bxum8cd0vh1462i9jq3y5wzg', 'y680trgedcavbhnz24u7i5m3', '', '重做了任务 ', 'redo', '2019-01-22 10:51:43', 'uwq87z2f0hnvrl6o9gtcb3iy', 'task', '', 0, 'mo4uqwfb06dxv8ez2spkl3rg', 'border');
INSERT INTO `pear_project_log` VALUES (4369, 'upty8vi5ro0ndze9wj2l47gq', 'y680trgedcavbhnz24u7i5m3', '', '完成了任务 ', 'done', '2019-01-22 10:53:44', 'uwq87z2f0hnvrl6o9gtcb3iy', 'task', '', 0, 'mo4uqwfb06dxv8ez2spkl3rg', 'check');
INSERT INTO `pear_project_log` VALUES (4370, '3iqsjo249y0cv5rte87wm6k1', 'y680trgedcavbhnz24u7i5m3', '', '重做了任务 ', 'redo', '2019-01-22 10:54:05', 'uwq87z2f0hnvrl6o9gtcb3iy', 'task', '', 0, 'mo4uqwfb06dxv8ez2spkl3rg', 'border');
INSERT INTO `pear_project_log` VALUES (4371, 'v60w274dr1ozunket9sj8afl', 'y680trgedcavbhnz24u7i5m3', '', '完成了任务 ', 'done', '2019-01-22 10:54:32', 'uwq87z2f0hnvrl6o9gtcb3iy', 'task', '', 0, 'mo4uqwfb06dxv8ez2spkl3rg', 'check');
INSERT INTO `pear_project_log` VALUES (4372, 'neb0q8zcau7sr5mlpidkhygv', 'y680trgedcavbhnz24u7i5m3', '', '重做了任务 ', 'redo', '2019-01-22 10:56:38', 'uwq87z2f0hnvrl6o9gtcb3iy', 'task', '', 0, 'mo4uqwfb06dxv8ez2spkl3rg', 'border');
INSERT INTO `pear_project_log` VALUES (4373, 'fqo21hw4s3abzvgriy75t6j8', 'y680trgedcavbhnz24u7i5m3', '', '完成了任务 ', 'done', '2019-01-22 10:56:55', 'uwq87z2f0hnvrl6o9gtcb3iy', 'task', '', 0, 'mo4uqwfb06dxv8ez2spkl3rg', 'check');
INSERT INTO `pear_project_log` VALUES (4374, 'rf8muvqcoi0w7z9jt6l51n3a', 'y680trgedcavbhnz24u7i5m3', '', '重做了任务 ', 'redo', '2019-01-22 10:57:20', 'uwq87z2f0hnvrl6o9gtcb3iy', 'task', '', 0, 'mo4uqwfb06dxv8ez2spkl3rg', 'border');
INSERT INTO `pear_project_log` VALUES (4375, 'moez3livtwyq645p9rg2kd8n', '6v7be19pwman2fird04gqu53', '', '完成了任务 ', 'done', '2019-01-22 11:00:01', 'uwq87z2f0hnvrl6o9gtcb3iy', 'task', '', 0, 'mo4uqwfb06dxv8ez2spkl3rg', 'check');
INSERT INTO `pear_project_log` VALUES (4376, '1uq6fatcygw9phmjs072dibl', '6v7be19pwman2fird04gqu53', '', '重做了任务 ', 'redo', '2019-01-22 11:00:24', 'uwq87z2f0hnvrl6o9gtcb3iy', 'task', '', 0, 'mo4uqwfb06dxv8ez2spkl3rg', 'border');
INSERT INTO `pear_project_log` VALUES (4377, '7l0coj4vxedk1mgunp2bq6ws', 'y680trgedcavbhnz24u7i5m3', '', '完成了任务 ', 'done', '2019-01-22 11:00:34', 'gjmotpbrwva079ukde4izn38', 'task', '', 0, 'mo4uqwfb06dxv8ez2spkl3rg', 'check');
INSERT INTO `pear_project_log` VALUES (4378, 'an1bp8m6hxr34kl7qe9tvgfd', 'y680trgedcavbhnz24u7i5m3', '', '完成了任务 ', 'done', '2019-01-22 11:00:51', 'uwq87z2f0hnvrl6o9gtcb3iy', 'task', '', 0, 'mo4uqwfb06dxv8ez2spkl3rg', 'check');
INSERT INTO `pear_project_log` VALUES (4379, 'h71rxei48g6wbyqvnfpc05j2', '6v7be19pwman2fird04gqu53', '', '重做了任务 ', 'redo', '2019-01-22 11:17:09', 'uwq87z2f0hnvrl6o9gtcb3iy', 'task', '', 0, 'mo4uqwfb06dxv8ez2spkl3rg', 'border');
INSERT INTO `pear_project_log` VALUES (4380, 'gmwq053ujbkc4yrnexi9dtvf', '6v7be19pwman2fird04gqu53', '', '指派给了 Chihiro', 'assign', '2019-01-22 11:17:25', 'xkic58d20srnu9jm7ohqw14f', 'task', 'y680trgedcavbhnz24u7i5m3', 0, 'mo4uqwfb06dxv8ez2spkl3rg', 'user');
INSERT INTO `pear_project_log` VALUES (4381, 'xo3sc4hezl9qnw72ud01ym8b', '6v7be19pwman2fird04gqu53', '', '移除了参与者 Alians', 'removeMember', '2019-01-22 11:17:33', 'xkic58d20srnu9jm7ohqw14f', 'task', 'kqdcn2w40p58r31zyo6efjib', 0, 'mo4uqwfb06dxv8ez2spkl3rg', 'user-delete');
INSERT INTO `pear_project_log` VALUES (4382, '0mzwq9finea16p5rtx8ljco2', '6v7be19pwman2fird04gqu53', '', '重做了任务 ', 'redo', '2019-01-22 12:37:23', 'gjmotpbrwva079ukde4izn38', 'task', '', 0, 'mo4uqwfb06dxv8ez2spkl3rg', 'border');
INSERT INTO `pear_project_log` VALUES (4383, 'e4rpklq1bch96gdsiy0tnmjv', '6v7be19pwman2fird04gqu53', '', '指派给了 Chihiro', 'assign', '2019-01-22 15:33:47', 'g15scwqm9zxroy7p8bvjt632', 'task', 'y680trgedcavbhnz24u7i5m3', 0, 'mo4uqwfb06dxv8ez2spkl3rg', 'user');
INSERT INTO `pear_project_log` VALUES (4384, 'copzlu1wvej2fski30xmt4y6', '6v7be19pwman2fird04gqu53', '修复了 Form 高级搜索模式下的样式问题', '更新了内容 ', 'name', '2019-01-22 16:01:31', '0a84xkg12enqjml7rz6dbifw', 'task', '', 0, 'mo4uqwfb06dxv8ez2spkl3rg', 'edit');
INSERT INTO `pear_project_log` VALUES (4385, '57l1hptgz4bfo0js9w6xy2ia', '6v7be19pwman2fird04gqu53', '修复了 Form 高级搜索模式下的样式问题', '更新了内容 ', 'name', '2019-01-22 16:03:24', '0a84xkg12enqjml7rz6dbifw', 'task', '', 0, 'mo4uqwfb06dxv8ez2spkl3rg', 'edit');
INSERT INTO `pear_project_log` VALUES (4386, 'dsx3zake9nh5o8cmj20pt4rv', '6v7be19pwman2fird04gqu53', '1212', NULL, 'comment', '2019-01-23 17:55:40', '3qz5hfsin69xt8cgbd70lkew', 'task', '0', 1, NULL, NULL);
INSERT INTO `pear_project_log` VALUES (4387, 'hjqa9kzgbspry7oxu4vne8m3', '6v7be19pwman2fird04gqu53', '', '完成了任务 ', 'done', '2019-01-24 10:40:49', 'orycwlhf7n2qx1pta038dzjk', 'task', '', 0, 'mo4uqwfb06dxv8ez2spkl3rg', 'check');
INSERT INTO `pear_project_log` VALUES (4388, '7jq1kz6ndatfm3xg4l5swhoy', '6v7be19pwman2fird04gqu53', '', '完成了子任务 \"Upload 组件升级 rc-upload 到 2.5.0\"', 'doneChild', '2019-01-24 10:40:49', 'yctbsv81x6dmahkf7ei5o4r9', 'task', '', 0, 'mo4uqwfb06dxv8ez2spkl3rg', 'bars');
INSERT INTO `pear_project_log` VALUES (4389, '2msvgchpid8te73w9fjuy0qz', '6v7be19pwman2fird04gqu53', '', '完成了任务 ', 'done', '2019-01-24 11:14:06', 'uwq87z2f0hnvrl6o9gtcb3iy', 'task', '', 0, 'mo4uqwfb06dxv8ez2spkl3rg', 'check');
INSERT INTO `pear_project_log` VALUES (4390, 'roa5c4ik70h9xdsmvfqby3tw', 'y680trgedcavbhnz24u7i5m3', '', '重做了任务 ', 'redo', '2019-01-24 11:15:19', 'uwq87z2f0hnvrl6o9gtcb3iy', 'task', '', 0, 'mo4uqwfb06dxv8ez2spkl3rg', 'border');
INSERT INTO `pear_project_log` VALUES (4391, 'niw9zy8teu2xg5mb01opjsfl', 'y680trgedcavbhnz24u7i5m3', '', '完成了任务 ', 'done', '2019-01-24 11:16:41', 'uwq87z2f0hnvrl6o9gtcb3iy', 'task', '', 0, 'mo4uqwfb06dxv8ez2spkl3rg', 'check');
INSERT INTO `pear_project_log` VALUES (4392, '1ni5a7szpxyclkh6ofgebv38', 'y680trgedcavbhnz24u7i5m3', '', '完成了任务 ', 'done', '2019-01-24 11:16:53', 'gjmotpbrwva079ukde4izn38', 'task', '', 0, 'mo4uqwfb06dxv8ez2spkl3rg', 'check');
INSERT INTO `pear_project_log` VALUES (4393, 'dhct6ayiuebg5ls7k1p9rqnj', '6v7be19pwman2fird04gqu53', '', '完成了任务 ', 'done', '2019-01-24 14:56:21', '6hj43ueim2bk187sqzcoy59v', 'task', '', 0, 'mo4uqwfb06dxv8ez2spkl3rg', 'check');
INSERT INTO `pear_project_log` VALUES (4394, 'qye35i61dpmo9jrntkl48s0u', '6v7be19pwman2fird04gqu53', '', '重做了任务 ', 'redo', '2019-01-24 14:56:29', '2bn918l6ejyzousa73dkpgci', 'task', '', 0, 'mo4uqwfb06dxv8ez2spkl3rg', 'border');
INSERT INTO `pear_project_log` VALUES (4395, 'msvie2hp5yb7uacfgrt0x18n', '6v7be19pwman2fird04gqu53', '', '重做了任务 ', 'redo', '2019-01-24 14:56:33', '6hj43ueim2bk187sqzcoy59v', 'task', '', 0, 'mo4uqwfb06dxv8ez2spkl3rg', 'border');
INSERT INTO `pear_project_log` VALUES (4396, 'eopa1gkx8ljhzrb69q40ysuf', '6v7be19pwman2fird04gqu53', '', '完成了任务 ', 'done', '2019-01-24 14:58:08', 'o61b3s24exmcy8njkparwthd', 'task', '', 0, 'mo4uqwfb06dxv8ez2spkl3rg', 'check');
INSERT INTO `pear_project_log` VALUES (4397, 'dx1580f3oabj7zwygn4hrqu9', '6v7be19pwman2fird04gqu53', '', '完成了子任务 \"Upload 组件升级 rc-upload 到 2.5.0\"', 'doneChild', '2019-01-24 14:58:08', 'yctbsv81x6dmahkf7ei5o4r9', 'task', '', 0, 'mo4uqwfb06dxv8ez2spkl3rg', 'bars');
INSERT INTO `pear_project_log` VALUES (4398, 'yz7eu2rjod5mxpicqts6wnl0', '6v7be19pwman2fird04gqu53', '', '完成了任务 ', 'done', '2019-01-24 14:58:13', 'yctbsv81x6dmahkf7ei5o4r9', 'task', '', 0, 'mo4uqwfb06dxv8ez2spkl3rg', 'check');
INSERT INTO `pear_project_log` VALUES (4399, '3d2vyjuzwoxt58rshkml4in6', '6v7be19pwman2fird04gqu53', '', '重做了任务 ', 'redo', '2019-01-24 15:00:20', 'o61b3s24exmcy8njkparwthd', 'task', '', 0, 'mo4uqwfb06dxv8ez2spkl3rg', 'border');
INSERT INTO `pear_project_log` VALUES (4400, 'blgoav1khzdsu62px0ir7me3', '6v7be19pwman2fird04gqu53', '', '重做了子任务 \"Upload 组件升级 rc-upload 到 2.5.0\"', 'redoChild', '2019-01-24 15:00:20', 'yctbsv81x6dmahkf7ei5o4r9', 'task', '', 0, 'mo4uqwfb06dxv8ez2spkl3rg', 'undo');
INSERT INTO `pear_project_log` VALUES (4401, 'oamwt8x6319klv52ydzq4jbf', '6v7be19pwman2fird04gqu53', '', '完成了任务 ', 'done', '2019-01-24 15:00:22', 'o61b3s24exmcy8njkparwthd', 'task', '', 0, 'mo4uqwfb06dxv8ez2spkl3rg', 'check');
INSERT INTO `pear_project_log` VALUES (4402, 'qxijylhdua7wmcon80941sg3', '6v7be19pwman2fird04gqu53', '', '完成了子任务 \"Upload 组件升级 rc-upload 到 2.5.0\"', 'doneChild', '2019-01-24 15:00:22', 'yctbsv81x6dmahkf7ei5o4r9', 'task', '', 0, 'mo4uqwfb06dxv8ez2spkl3rg', 'bars');
INSERT INTO `pear_project_log` VALUES (4403, '2icur6x4q3sjetny9bdvlgam', '6v7be19pwman2fird04gqu53', '', '重做了任务 ', 'redo', '2019-01-24 15:00:52', 'yctbsv81x6dmahkf7ei5o4r9', 'task', '', 0, 'mo4uqwfb06dxv8ez2spkl3rg', 'border');
INSERT INTO `pear_project_log` VALUES (4404, 'jiqw7apfkv6bmtnh9x80z1oy', '6v7be19pwman2fird04gqu53', '', '完成了任务 ', 'done', '2019-01-24 15:07:22', 'yctbsv81x6dmahkf7ei5o4r9', 'task', '', 0, 'mo4uqwfb06dxv8ez2spkl3rg', 'check');
INSERT INTO `pear_project_log` VALUES (4405, 'n40rv8fxji9apu7okqzhdlge', '6v7be19pwman2fird04gqu53', '', '重做了任务 ', 'redo', '2019-01-24 15:07:36', 'yctbsv81x6dmahkf7ei5o4r9', 'task', '', 0, 'mo4uqwfb06dxv8ez2spkl3rg', 'border');
INSERT INTO `pear_project_log` VALUES (4406, 'gc2htdsb7yipw8qv4jkzx5nl', '6v7be19pwman2fird04gqu53', '', '重做了任务 ', 'redo', '2019-01-24 15:14:37', 'o61b3s24exmcy8njkparwthd', 'task', '', 0, 'mo4uqwfb06dxv8ez2spkl3rg', 'border');
INSERT INTO `pear_project_log` VALUES (4407, 'mpazjtgw5uxysdf23br4enq6', '6v7be19pwman2fird04gqu53', '', '重做了子任务 \"Upload 组件升级 rc-upload 到 2.5.0\"', 'redoChild', '2019-01-24 15:14:37', 'yctbsv81x6dmahkf7ei5o4r9', 'task', '', 0, 'mo4uqwfb06dxv8ez2spkl3rg', 'undo');
INSERT INTO `pear_project_log` VALUES (4408, 'yj27og36tdmzlfu0a4knr8cs', '6v7be19pwman2fird04gqu53', '', '完成了任务 ', 'done', '2019-01-24 15:14:43', 'o61b3s24exmcy8njkparwthd', 'task', '', 0, 'mo4uqwfb06dxv8ez2spkl3rg', 'check');
INSERT INTO `pear_project_log` VALUES (4409, 'c64513pswlk2t9gv87afn0qd', '6v7be19pwman2fird04gqu53', '', '完成了子任务 \"Upload 组件升级 rc-upload 到 2.5.0\"', 'doneChild', '2019-01-24 15:14:43', 'yctbsv81x6dmahkf7ei5o4r9', 'task', '', 0, 'mo4uqwfb06dxv8ez2spkl3rg', 'bars');
INSERT INTO `pear_project_log` VALUES (4410, '2bcgj04oxrspa36iuew7qd95', '6v7be19pwman2fird04gqu53', '', '重做了任务 ', 'redo', '2019-01-24 15:15:08', 'o61b3s24exmcy8njkparwthd', 'task', '', 0, 'mo4uqwfb06dxv8ez2spkl3rg', 'border');
INSERT INTO `pear_project_log` VALUES (4411, 's87m0fzq9gdcn1yvotwij6ur', '6v7be19pwman2fird04gqu53', '', '重做了子任务 \"Upload 组件升级 rc-upload 到 2.5.0\"', 'redoChild', '2019-01-24 15:15:08', 'yctbsv81x6dmahkf7ei5o4r9', 'task', '', 0, 'mo4uqwfb06dxv8ez2spkl3rg', 'undo');
INSERT INTO `pear_project_log` VALUES (4412, '19k6dq4cgziuh27lr8a3tbjy', '6v7be19pwman2fird04gqu53', '', '完成了任务 ', 'done', '2019-01-24 15:15:43', 'o61b3s24exmcy8njkparwthd', 'task', '', 0, 'mo4uqwfb06dxv8ez2spkl3rg', 'check');
INSERT INTO `pear_project_log` VALUES (4413, '8c9lwd4hjpfm6ynqvo510ert', '6v7be19pwman2fird04gqu53', '', '完成了子任务 \"Upload 组件升级 rc-upload 到 2.5.0\"', 'doneChild', '2019-01-24 15:15:43', 'yctbsv81x6dmahkf7ei5o4r9', 'task', '', 0, 'mo4uqwfb06dxv8ez2spkl3rg', 'bars');
INSERT INTO `pear_project_log` VALUES (4414, 'qpdm30z9jk8stbwai2enr1y6', '6v7be19pwman2fird04gqu53', '', '重做了任务 ', 'redo', '2019-01-24 15:16:53', 'o61b3s24exmcy8njkparwthd', 'task', '', 0, 'mo4uqwfb06dxv8ez2spkl3rg', 'border');
INSERT INTO `pear_project_log` VALUES (4415, 'jsuc5n0e2mwz68hv7o3g9ypk', '6v7be19pwman2fird04gqu53', '', '重做了子任务 \"Upload 组件升级 rc-upload 到 2.5.0\"', 'redoChild', '2019-01-24 15:16:53', 'yctbsv81x6dmahkf7ei5o4r9', 'task', '', 0, 'mo4uqwfb06dxv8ez2spkl3rg', 'undo');
INSERT INTO `pear_project_log` VALUES (4416, '7fl16543m0hwnoipgkej8xaz', '6v7be19pwman2fird04gqu53', '', '完成了任务 ', 'done', '2019-01-24 15:17:50', 'o61b3s24exmcy8njkparwthd', 'task', '', 0, 'mo4uqwfb06dxv8ez2spkl3rg', 'check');
INSERT INTO `pear_project_log` VALUES (4417, 'ug2f4cqabrkix5jeyp7tn6so', '6v7be19pwman2fird04gqu53', '', '完成了子任务 \"Upload 组件升级 rc-upload 到 2.5.0\"', 'doneChild', '2019-01-24 15:17:50', 'yctbsv81x6dmahkf7ei5o4r9', 'task', '', 0, 'mo4uqwfb06dxv8ez2spkl3rg', 'bars');
INSERT INTO `pear_project_log` VALUES (4418, 't698iocj472dnz1upbesakqf', '6v7be19pwman2fird04gqu53', '', '重做了任务 ', 'redo', '2019-01-24 15:19:23', 'o61b3s24exmcy8njkparwthd', 'task', '', 0, 'mo4uqwfb06dxv8ez2spkl3rg', 'border');
INSERT INTO `pear_project_log` VALUES (4419, 'ub2axy4qsnjvekl8h5z3g9ct', '6v7be19pwman2fird04gqu53', '', '重做了子任务 \"Upload 组件升级 rc-upload 到 2.5.0\"', 'redoChild', '2019-01-24 15:19:23', 'yctbsv81x6dmahkf7ei5o4r9', 'task', '', 0, 'mo4uqwfb06dxv8ez2spkl3rg', 'undo');
INSERT INTO `pear_project_log` VALUES (4420, '4zctuj2x0fy7q6m3hsvi5pgo', '6v7be19pwman2fird04gqu53', '', '重做了任务 ', 'redo', '2019-01-24 15:19:31', 'orycwlhf7n2qx1pta038dzjk', 'task', '', 0, 'mo4uqwfb06dxv8ez2spkl3rg', 'border');
INSERT INTO `pear_project_log` VALUES (4421, '5huqfyaj0cseonizbpm19k26', '6v7be19pwman2fird04gqu53', '', '重做了子任务 \"Upload 组件升级 rc-upload 到 2.5.0\"', 'redoChild', '2019-01-24 15:19:31', 'yctbsv81x6dmahkf7ei5o4r9', 'task', '', 0, 'mo4uqwfb06dxv8ez2spkl3rg', 'undo');
INSERT INTO `pear_project_log` VALUES (4422, 'c8guko0wm4ft7ya69q3d1hel', '6v7be19pwman2fird04gqu53', '', '完成了任务 ', 'done', '2019-01-24 15:21:56', 'o61b3s24exmcy8njkparwthd', 'task', '', 0, 'mo4uqwfb06dxv8ez2spkl3rg', 'check');
INSERT INTO `pear_project_log` VALUES (4423, 'z6p4q9ub2ythfswmali0ojen', '6v7be19pwman2fird04gqu53', '', '完成了子任务 \"Upload 组件升级 rc-upload 到 2.5.0\"', 'doneChild', '2019-01-24 15:21:57', 'yctbsv81x6dmahkf7ei5o4r9', 'task', '', 0, 'mo4uqwfb06dxv8ez2spkl3rg', 'bars');
INSERT INTO `pear_project_log` VALUES (4424, 'atk5lbfrpdcx3onh4qs68mi9', '6v7be19pwman2fird04gqu53', '', '完成了任务 ', 'done', '2019-01-24 15:21:58', 'orycwlhf7n2qx1pta038dzjk', 'task', '', 0, 'mo4uqwfb06dxv8ez2spkl3rg', 'check');
INSERT INTO `pear_project_log` VALUES (4425, 'l51ot6wgsx04j8er3vhibknz', '6v7be19pwman2fird04gqu53', '', '完成了子任务 \"Upload 组件升级 rc-upload 到 2.5.0\"', 'doneChild', '2019-01-24 15:21:58', 'yctbsv81x6dmahkf7ei5o4r9', 'task', '', 0, 'mo4uqwfb06dxv8ez2spkl3rg', 'bars');
INSERT INTO `pear_project_log` VALUES (4426, 'm1peidv7glqyrcs46oatwfu3', '6v7be19pwman2fird04gqu53', '', '重做了任务 ', 'redo', '2019-01-24 15:22:35', 'o61b3s24exmcy8njkparwthd', 'task', '', 0, 'mo4uqwfb06dxv8ez2spkl3rg', 'border');
INSERT INTO `pear_project_log` VALUES (4427, '36pfnulyizb47ckwxjtoa892', '6v7be19pwman2fird04gqu53', '', '重做了子任务 \"Upload 组件升级 rc-upload 到 2.5.0\"', 'redoChild', '2019-01-24 15:22:36', 'yctbsv81x6dmahkf7ei5o4r9', 'task', '', 0, 'mo4uqwfb06dxv8ez2spkl3rg', 'undo');
INSERT INTO `pear_project_log` VALUES (4428, '9hmflp4xano8ktw31j6q5yiu', '6v7be19pwman2fird04gqu53', '3级子任务', '创建了任务 ', 'create', '2019-01-24 15:22:47', 'cz7fxnibs2v8rq90h6wo3a4l', 'task', '', 0, 'mo4uqwfb06dxv8ez2spkl3rg', 'plus');
INSERT INTO `pear_project_log` VALUES (4429, 'ywafnjo7sv9hmdr15pe28g6t', '6v7be19pwman2fird04gqu53', '', '添加了子任务 \"3级子任务\"', 'createChild', '2019-01-24 15:22:47', 'o61b3s24exmcy8njkparwthd', 'task', '', 0, 'mo4uqwfb06dxv8ez2spkl3rg', 'bars');
INSERT INTO `pear_project_log` VALUES (4430, 'tgfm67cx2kyojzwae5db0rhu', '6v7be19pwman2fird04gqu53', '', '认领了任务 ', 'claim', '2019-01-24 15:22:47', 'cz7fxnibs2v8rq90h6wo3a4l', 'task', '', 0, 'mo4uqwfb06dxv8ez2spkl3rg', 'user');
INSERT INTO `pear_project_log` VALUES (4431, 'drwo36zbuytjik9pnf2mxh8c', '6v7be19pwman2fird04gqu53', '', '认领了任务 ', 'claim', '2019-01-24 15:30:17', '6hj43ueim2bk187sqzcoy59v', 'task', '6v7be19pwman2fird04gqu53', 0, 'mo4uqwfb06dxv8ez2spkl3rg', 'user');
INSERT INTO `pear_project_log` VALUES (4432, 'w9qgcverfidl5j1osa2m08zt', '6v7be19pwman2fird04gqu53', '1级任务', '创建了任务 ', 'create', '2019-01-24 15:35:46', 'vnjthy40w5gim1xflcp3z8rs', 'task', '', 0, 'mo4uqwfb06dxv8ez2spkl3rg', 'plus');
INSERT INTO `pear_project_log` VALUES (4433, '314afvmh0kdjspy97x6trzo2', '6v7be19pwman2fird04gqu53', '', '认领了任务 ', 'claim', '2019-01-24 15:35:46', 'vnjthy40w5gim1xflcp3z8rs', 'task', '', 0, 'mo4uqwfb06dxv8ez2spkl3rg', 'user');
INSERT INTO `pear_project_log` VALUES (4434, '93bi67pq1mvx0fk5yndrtl8c', '6v7be19pwman2fird04gqu53', '2级任务', '创建了任务 ', 'create', '2019-01-24 15:35:54', 'jq3xc7uklh1tv9g6swmep8yn', 'task', '', 0, 'mo4uqwfb06dxv8ez2spkl3rg', 'plus');
INSERT INTO `pear_project_log` VALUES (4435, 'zqf1m0jpivowybex36c8s2h7', '6v7be19pwman2fird04gqu53', '', '添加了子任务 \"2级任务\"', 'createChild', '2019-01-24 15:35:54', 'vnjthy40w5gim1xflcp3z8rs', 'task', '', 0, 'mo4uqwfb06dxv8ez2spkl3rg', 'bars');
INSERT INTO `pear_project_log` VALUES (4436, 'g9u6nkbhfxe51czpy3w4i2s7', '6v7be19pwman2fird04gqu53', '', '认领了任务 ', 'claim', '2019-01-24 15:35:54', 'jq3xc7uklh1tv9g6swmep8yn', 'task', '', 0, 'mo4uqwfb06dxv8ez2spkl3rg', 'user');
INSERT INTO `pear_project_log` VALUES (4437, 'meb5vw4tl0832sd19zgprkuh', '6v7be19pwman2fird04gqu53', '3级任务', '创建了任务 ', 'create', '2019-01-24 15:36:16', '64rmkd08wonsjx39fg71t5li', 'task', '', 0, 'mo4uqwfb06dxv8ez2spkl3rg', 'plus');
INSERT INTO `pear_project_log` VALUES (4438, 'avhulc3p5os9x8qkjfb7dw42', '6v7be19pwman2fird04gqu53', '', '添加了子任务 \"3级任务\"', 'createChild', '2019-01-24 15:36:16', 'jq3xc7uklh1tv9g6swmep8yn', 'task', '', 0, 'mo4uqwfb06dxv8ez2spkl3rg', 'bars');
INSERT INTO `pear_project_log` VALUES (4439, 'q7p9j4gsvyf1z6rt3x5bdue8', '6v7be19pwman2fird04gqu53', '', '认领了任务 ', 'claim', '2019-01-24 15:36:16', '64rmkd08wonsjx39fg71t5li', 'task', '', 0, 'mo4uqwfb06dxv8ez2spkl3rg', 'user');
INSERT INTO `pear_project_log` VALUES (4440, 'f8a2jsvpbk9g7l3yozu40dc5', '6v7be19pwman2fird04gqu53', '4级任务', '创建了任务 ', 'create', '2019-01-24 15:59:55', 'xc2p9lign6zmvwte7jhu8byd', 'task', '', 0, 'mo4uqwfb06dxv8ez2spkl3rg', 'plus');
INSERT INTO `pear_project_log` VALUES (4441, '4nvwcdlim5fr82jze6sb0ygq', '6v7be19pwman2fird04gqu53', '', '添加了子任务 \"4级任务\"', 'createChild', '2019-01-24 15:59:56', '64rmkd08wonsjx39fg71t5li', 'task', '', 0, 'mo4uqwfb06dxv8ez2spkl3rg', 'bars');
INSERT INTO `pear_project_log` VALUES (4442, 'dqp12a9oinh0fxbsk764veyw', '6v7be19pwman2fird04gqu53', '', '认领了任务 ', 'claim', '2019-01-24 15:59:56', 'xc2p9lign6zmvwte7jhu8byd', 'task', '', 0, 'mo4uqwfb06dxv8ez2spkl3rg', 'user');
INSERT INTO `pear_project_log` VALUES (4443, '2eif8ojx07k3u6qbaw5gvyh9', '6v7be19pwman2fird04gqu53', '', '认领了任务 ', 'claim', '2019-01-24 17:45:33', 'p1aujdigrlxky76h8cs3z4w0', 'task', '6v7be19pwman2fird04gqu53', 0, 'mo4uqwfb06dxv8ez2spkl3rg', 'user');
INSERT INTO `pear_project_log` VALUES (4444, 'idchmj6utpn57r3z0vqkwfyl', '6v7be19pwman2fird04gqu53', '', '认领了任务 ', 'claim', '2019-01-24 17:45:33', 'xkic58d20srnu9jm7ohqw14f', 'task', '6v7be19pwman2fird04gqu53', 0, 'mo4uqwfb06dxv8ez2spkl3rg', 'user');
INSERT INTO `pear_project_log` VALUES (4445, '27smfolqijh94x1d6g5azny3', '6v7be19pwman2fird04gqu53', '', '认领了任务 ', 'claim', '2019-01-24 17:45:33', '3qz5hfsin69xt8cgbd70lkew', 'task', '6v7be19pwman2fird04gqu53', 0, 'mo4uqwfb06dxv8ez2spkl3rg', 'user');
INSERT INTO `pear_project_log` VALUES (4446, 'xey1olv0pmf8459nibrszd2h', '6v7be19pwman2fird04gqu53', '', '认领了任务 ', 'claim', '2019-01-24 17:50:28', 'p1aujdigrlxky76h8cs3z4w0', 'task', '6v7be19pwman2fird04gqu53', 0, 'mo4uqwfb06dxv8ez2spkl3rg', 'user');
INSERT INTO `pear_project_log` VALUES (4447, 'ej8dswuv7fa0hxpk9inz1rl3', '6v7be19pwman2fird04gqu53', '', '认领了任务 ', 'claim', '2019-01-24 17:50:28', 'xkic58d20srnu9jm7ohqw14f', 'task', '6v7be19pwman2fird04gqu53', 0, 'mo4uqwfb06dxv8ez2spkl3rg', 'user');
INSERT INTO `pear_project_log` VALUES (4448, 'v896g7ed12imsfkqwrhxcubj', '6v7be19pwman2fird04gqu53', '', '认领了任务 ', 'claim', '2019-01-24 17:50:28', '3qz5hfsin69xt8cgbd70lkew', 'task', '6v7be19pwman2fird04gqu53', 0, 'mo4uqwfb06dxv8ez2spkl3rg', 'user');
INSERT INTO `pear_project_log` VALUES (4449, 'slp1u2c037oxqv9twbgzmrja', '6v7be19pwman2fird04gqu53', '', '认领了任务 ', 'claim', '2019-01-24 17:51:48', 'p1aujdigrlxky76h8cs3z4w0', 'task', '6v7be19pwman2fird04gqu53', 0, 'mo4uqwfb06dxv8ez2spkl3rg', 'user');
INSERT INTO `pear_project_log` VALUES (4450, 'c73aflvknjdsq9y1xur60p2g', '6v7be19pwman2fird04gqu53', '', '认领了任务 ', 'claim', '2019-01-24 17:51:48', 'xkic58d20srnu9jm7ohqw14f', 'task', '6v7be19pwman2fird04gqu53', 0, 'mo4uqwfb06dxv8ez2spkl3rg', 'user');
INSERT INTO `pear_project_log` VALUES (4451, 'f4t51ycwsr2ak639gqjboul8', '6v7be19pwman2fird04gqu53', '', '认领了任务 ', 'claim', '2019-01-24 17:51:48', '3qz5hfsin69xt8cgbd70lkew', 'task', '6v7be19pwman2fird04gqu53', 0, 'mo4uqwfb06dxv8ez2spkl3rg', 'user');
INSERT INTO `pear_project_log` VALUES (4452, 'naw2ijr54gld1vkbhs8qt3ou', '6v7be19pwman2fird04gqu53', 'Ant Design', '编辑了项目 ', 'edit', '2019-06-17 17:53:31', 'mo4uqwfb06dxv8ez2spkl3rg', 'project', '', 0, 'mo4uqwfb06dxv8ez2spkl3rg', 'edit');
INSERT INTO `pear_project_log` VALUES (4453, 'rvwh1aoji0y8stz6qdn3kebx', '6v7be19pwman2fird04gqu53', 'Ant Design', '编辑了项目 ', 'edit', '2019-06-17 17:53:34', 'mo4uqwfb06dxv8ez2spkl3rg', 'project', '', 0, 'mo4uqwfb06dxv8ez2spkl3rg', 'edit');
INSERT INTO `pear_project_log` VALUES (4454, 'mkwvfasuptgld0ex895c2ijo', '6v7be19pwman2fird04gqu53', 'Ant Design', '编辑了项目 ', 'edit', '2019-06-17 17:53:34', 'mo4uqwfb06dxv8ez2spkl3rg', 'project', '', 0, 'mo4uqwfb06dxv8ez2spkl3rg', 'edit');
INSERT INTO `pear_project_log` VALUES (4455, 'ce9dru1wom3kv0hfabg5ly47', '6v7be19pwman2fird04gqu53', 'Ant Design', '编辑了项目 ', 'edit', '2019-06-17 17:53:36', 'mo4uqwfb06dxv8ez2spkl3rg', 'project', '', 0, 'mo4uqwfb06dxv8ez2spkl3rg', 'edit');
INSERT INTO `pear_project_log` VALUES (4456, 'evsmnqbkz64a7cdp9yj2o0g8', '6v7be19pwman2fird04gqu53', 'Ant Design', '编辑了项目 ', 'edit', '2019-06-17 17:53:42', 'mo4uqwfb06dxv8ez2spkl3rg', 'project', '', 0, 'mo4uqwfb06dxv8ez2spkl3rg', 'edit');
INSERT INTO `pear_project_log` VALUES (4457, 'fkaq3o1wnc7se4thmypir980', '6v7be19pwman2fird04gqu53', 'Ant Design', '编辑了项目 ', 'edit', '2019-06-17 17:53:53', 'mo4uqwfb06dxv8ez2spkl3rg', 'project', '', 0, 'mo4uqwfb06dxv8ez2spkl3rg', 'edit');

-- ----------------------------
-- Table structure for pear_project_member
-- ----------------------------
DROP TABLE IF EXISTS `pear_project_member`;
CREATE TABLE `pear_project_member`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_code` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '项目id',
  `member_code` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '成员id',
  `join_time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '加入时间',
  `is_owner` int(11) NULL DEFAULT 0 COMMENT '拥有者',
  `authorize` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '角色',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 34 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '项目-成员表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of pear_project_member
-- ----------------------------
INSERT INTO `pear_project_member` VALUES (1, 'a8mpr6tvbndk10hj2lwcqzuo', '6v7be19pwman2fird04gqu53', NULL, 1, NULL);
INSERT INTO `pear_project_member` VALUES (2, 'a8mpr6tvbndk10hj2lwcqzuo', 'kqdcn2w40p58r31zyo6efjib', NULL, 0, NULL);
INSERT INTO `pear_project_member` VALUES (6, 'a8mpr6tvbndk10hj2lwcqzuo', 'y680trgedcavbhnz24u7i5m3', '2018-12-23 08:24:29', 0, NULL);
INSERT INTO `pear_project_member` VALUES (7, '8rlqyh56smzpoc1wef7390t2', '6v7be19pwman2fird04gqu53', '2018-12-23 08:25:24', 1, NULL);
INSERT INTO `pear_project_member` VALUES (8, '8rlqyh56smzpoc1wef7390t2', 'kqdcn2w40p58r31zyo6efjib', '2018-12-23 08:25:28', 1, NULL);
INSERT INTO `pear_project_member` VALUES (9, 'nkp4gulsb6oxqyi80fhead39', '6v7be19pwman2fird04gqu53', '2018-12-23 08:26:20', 1, NULL);
INSERT INTO `pear_project_member` VALUES (10, 'sbklfvyouc0qpmwhitn47j5z', '6v7be19pwman2fird04gqu53', '2018-12-23 08:26:24', 1, NULL);
INSERT INTO `pear_project_member` VALUES (11, 'n5opgqevrz1l03h48uwx67d2', '6v7be19pwman2fird04gqu53', '2018-12-23 08:26:31', 1, NULL);
INSERT INTO `pear_project_member` VALUES (12, 'tnxpbov8kez6m4wl2hfjucd9', '6v7be19pwman2fird04gqu53', '2018-12-23 08:31:53', 1, NULL);
INSERT INTO `pear_project_member` VALUES (16, 'mo4uqwfb06dxv8ez2spkl3rg', '6v7be19pwman2fird04gqu53', '2018-12-25 07:20:36', 1, NULL);
INSERT INTO `pear_project_member` VALUES (20, 'mo4uqwfb06dxv8ez2spkl3rg', 'y680trgedcavbhnz24u7i5m3', '2018-12-27 12:04:03', 0, NULL);
INSERT INTO `pear_project_member` VALUES (21, 'ibag9hw3o1tusd5qlpxrk782', 'y680trgedcavbhnz24u7i5m3', '2018-12-28 15:02:14', 1, NULL);
INSERT INTO `pear_project_member` VALUES (23, 'p94ckbwv5lyxt2rhzeam3s86', '582', '2019-01-02 11:17:27', 1, NULL);
INSERT INTO `pear_project_member` VALUES (24, '8ulzfth64cd0k1x5peivowm2', 'kqdcn2w40p58r31zyo6efjib', '2019-01-03 09:15:11', 1, NULL);
INSERT INTO `pear_project_member` VALUES (25, '8ulzfth64cd0k1x5peivowm2', '6v7be19pwman2fird04gqu53', '2019-01-03 10:51:36', 0, NULL);
INSERT INTO `pear_project_member` VALUES (26, '8ulzfth64cd0k1x5peivowm2', 'y680trgedcavbhnz24u7i5m3', '2019-01-03 10:54:17', 0, NULL);
INSERT INTO `pear_project_member` VALUES (28, 'mo4uqwfb06dxv8ez2spkl3rg', 'kqdcn2w40p58r31zyo6efjib', '2019-01-03 22:29:57', 0, NULL);
INSERT INTO `pear_project_member` VALUES (29, 'elqa703jyvfhpt1dsxkzi8on', 'kqdcn2w40p58r31zyo6efjib', '2019-01-04 21:17:34', 1, NULL);
INSERT INTO `pear_project_member` VALUES (30, 'elqa703jyvfhpt1dsxkzi8on', 'y680trgedcavbhnz24u7i5m3', '2019-01-04 21:17:38', 0, NULL);
INSERT INTO `pear_project_member` VALUES (31, 'ibag9hw3o1tusd5qlpxrk782', '6v7be19pwman2fird04gqu53', '2019-01-04 21:45:41', 0, NULL);
INSERT INTO `pear_project_member` VALUES (32, 'gbim9jpevkh7qr6ufa1t3wl4', 'vys8gd32cfui6brtwzj4pqho', '2019-01-05 21:57:31', 1, NULL);
INSERT INTO `pear_project_member` VALUES (33, 'gbim9jpevkh7qr6ufa1t3wl4', 'kqdcn2w40p58r31zyo6efjib', '2019-01-05 21:57:36', 0, NULL);

-- ----------------------------
-- Table structure for pear_project_menu
-- ----------------------------
DROP TABLE IF EXISTS `pear_project_menu`;
CREATE TABLE `pear_project_menu`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `pid` bigint(20) UNSIGNED NOT NULL DEFAULT 0 COMMENT '父id',
  `title` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '名称',
  `icon` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '菜单图标',
  `url` varchar(400) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '链接',
  `file_path` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '文件路径',
  `params` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '链接参数',
  `node` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '#' COMMENT '权限节点',
  `sort` int(11) UNSIGNED NULL DEFAULT 0 COMMENT '菜单排序',
  `status` tinyint(1) UNSIGNED NULL DEFAULT 1 COMMENT '状态(0:禁用,1:启用)',
  `create_by` bigint(20) UNSIGNED NOT NULL DEFAULT 0 COMMENT '创建人',
  `create_at` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建时间',
  `is_inner` tinyint(1) NULL DEFAULT 0 COMMENT '是否内页',
  `values` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '参数默认值',
  `show_slider` tinyint(1) NULL DEFAULT 1 COMMENT '是否显示侧栏',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 168 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '项目菜单表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of pear_project_menu
-- ----------------------------
INSERT INTO `pear_project_menu` VALUES (120, 0, '工作台', 'appstore-o', 'home', 'home', '', '#', 0, 1, 0, '2018-09-30 16:30:01', 0, '', 0);
INSERT INTO `pear_project_menu` VALUES (121, 0, '项目管理', 'project', '#', '#', '', '#', 0, 1, 0, '0000-00-00 00:00:00', 0, '', 1);
INSERT INTO `pear_project_menu` VALUES (122, 121, '项目列表', 'branches', '#', '#', '', '#', 0, 1, 0, '0000-00-00 00:00:00', 0, '', 1);
INSERT INTO `pear_project_menu` VALUES (124, 0, '系统设置', 'setting', '#', '#', '', '#', 100, 1, 0, '0000-00-00 00:00:00', 0, '', 1);
INSERT INTO `pear_project_menu` VALUES (125, 124, '成员管理', 'unlock', '#', '#', '', '#', 10, 1, 0, '0000-00-00 00:00:00', 0, '', 1);
INSERT INTO `pear_project_menu` VALUES (126, 125, '账号列表', '', 'system/account', 'system/account', '', 'project/account/index', 10, 1, 0, '0000-00-00 00:00:00', 0, '', 1);
INSERT INTO `pear_project_menu` VALUES (127, 122, '我的组织', '', 'organization', 'organization', '', 'project/organization/index', 30, 1, 0, '0000-00-00 00:00:00', 0, '', 1);
INSERT INTO `pear_project_menu` VALUES (130, 125, '访问授权', '', 'system/account/auth', 'system/account/auth', '', 'project/auth/index', 20, 1, 0, '0000-00-00 00:00:00', 0, '', 1);
INSERT INTO `pear_project_menu` VALUES (131, 125, '授权页面', '', 'system/account/apply', 'system/account/apply', ':id', 'project/auth/apply', 30, 1, 0, '0000-00-00 00:00:00', 1, '', 1);
INSERT INTO `pear_project_menu` VALUES (138, 121, '消息提醒', 'info-circle-o', '#', '#', '', '#', 30, 1, 0, '0000-00-00 00:00:00', 0, '', 1);
INSERT INTO `pear_project_menu` VALUES (139, 138, '站内消息', '', 'notify/notice', 'notify/notice', '', 'project/notify/index', 0, 1, 0, '0000-00-00 00:00:00', 0, '', 1);
INSERT INTO `pear_project_menu` VALUES (140, 138, '系统公告', '', 'notify/system', 'notify/system', '', 'project/notify/index', 10, 1, 0, '0000-00-00 00:00:00', 0, '', 1);
INSERT INTO `pear_project_menu` VALUES (143, 124, '系统管理', 'appstore', '#', '#', '', '#', 0, 1, 0, '0000-00-00 00:00:00', 0, '', 1);
INSERT INTO `pear_project_menu` VALUES (144, 143, '菜单路由', '', 'system/config/menu', 'system/config/menu', '', 'project/menu/menuadd', 0, 1, 0, '0000-00-00 00:00:00', 0, '', 1);
INSERT INTO `pear_project_menu` VALUES (145, 143, '访问节点', '', 'system/config/node', 'system/config/node', '', 'project/node/save', 0, 1, 0, '0000-00-00 00:00:00', 0, '', 1);
INSERT INTO `pear_project_menu` VALUES (148, 124, '个人管理', 'user', '#', '#', '', '#', 0, 1, 0, '0000-00-00 00:00:00', 0, '', 1);
INSERT INTO `pear_project_menu` VALUES (149, 148, '个人设置', '', 'account/setting/base', 'account/setting/base', '', 'project/index/editpersonal', 0, 1, 0, '0000-00-00 00:00:00', 0, '', 1);
INSERT INTO `pear_project_menu` VALUES (150, 148, '安全设置', '', 'account/setting/security', 'account/setting/security', '', 'project/index/editpersonal', 0, 1, 0, '0000-00-00 00:00:00', 1, '', 1);
INSERT INTO `pear_project_menu` VALUES (151, 122, '我的项目', '', 'project/list', 'project/list', ':type', 'project/project/index', 0, 1, 0, '0000-00-00 00:00:00', 0, 'my', 1);
INSERT INTO `pear_project_menu` VALUES (152, 122, '回收站', '', 'project/recycle', 'project/recycle', '', 'project/project/index', 20, 1, 0, '0000-00-00 00:00:00', 0, '', 1);
INSERT INTO `pear_project_menu` VALUES (153, 121, '项目空间', 'heat-map', 'project/space/task', 'project/space/task', ':code', '#', 20, 1, 0, '0000-00-00 00:00:00', 1, '', 1);
INSERT INTO `pear_project_menu` VALUES (154, 153, '任务详情', '', 'project/space/task/:code/detail', 'project/space/taskdetail', ':code', 'project/task/read', 0, 1, 0, '0000-00-00 00:00:00', 1, '', 0);
INSERT INTO `pear_project_menu` VALUES (155, 122, '我的收藏', '', 'project/list', 'project/list', ':type', 'project/project/index', 10, 1, 0, '0000-00-00 00:00:00', 0, 'collect', 1);
INSERT INTO `pear_project_menu` VALUES (156, 121, '基础设置', 'experiment', '#', '#', '', '#', 0, 1, 0, '0000-00-00 00:00:00', 0, '', 1);
INSERT INTO `pear_project_menu` VALUES (157, 156, '项目模板', '', 'project/template', 'project/template', '', 'project/project_template/index', 0, 1, 0, '0000-00-00 00:00:00', 0, '', 1);
INSERT INTO `pear_project_menu` VALUES (158, 156, '项目列表模板', '', 'project/template/taskStages', 'project/template/taskStages', ':code', 'project/task_stages_template/index', 0, 1, 0, '0000-00-00 00:00:00', 1, '', 0);
INSERT INTO `pear_project_menu` VALUES (159, 122, '已归档项目', '', 'project/archive', 'project/archive', '', 'project/project/index', 10, 1, 0, NULL, 0, '', 1);
INSERT INTO `pear_project_menu` VALUES (160, 0, '团队成员', 'team', '#', '#', '', '#', 0, 1, 0, NULL, 1, '', 0);
INSERT INTO `pear_project_menu` VALUES (161, 153, '项目概况', '', 'project/space/overview', 'project/space/overview', ':code', 'project/index/info', 20, 1, 0, NULL, 1, '', 0);
INSERT INTO `pear_project_menu` VALUES (162, 153, '项目文件', '', 'project/space/files', 'project/space/files', ':code', 'project/index/info', 10, 1, 0, NULL, 1, '', 0);
INSERT INTO `pear_project_menu` VALUES (163, 122, '项目分析', '', 'project/analysis', 'project/analysis', '', 'project/index/info', 5, 1, 0, NULL, 0, '', 1);
INSERT INTO `pear_project_menu` VALUES (164, 160, '团队成员', '', '#', '#', '', '#', 0, 1, 0, NULL, 1, '', 0);
INSERT INTO `pear_project_menu` VALUES (166, 164, '团队成员', '', 'members', 'members', '', 'project/department/index', 0, 1, 0, NULL, 1, '', 0);
INSERT INTO `pear_project_menu` VALUES (167, 164, '成员信息', '', 'members/profile', 'members/profile', ':code', 'project/department/read', 0, 1, 0, NULL, 1, '', 0);

-- ----------------------------
-- Table structure for pear_project_node
-- ----------------------------
DROP TABLE IF EXISTS `pear_project_node`;
CREATE TABLE `pear_project_node`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `node` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '节点代码',
  `title` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '节点标题',
  `is_menu` tinyint(1) UNSIGNED NULL DEFAULT 0 COMMENT '是否可设置为菜单',
  `is_auth` tinyint(1) UNSIGNED NULL DEFAULT 1 COMMENT '是否启动RBAC权限控制',
  `is_login` tinyint(1) UNSIGNED NULL DEFAULT 1 COMMENT '是否启动登录控制',
  `create_at` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `index_system_node_node`(`node`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 615 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '项目端节点表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of pear_project_node
-- ----------------------------
INSERT INTO `pear_project_node` VALUES (360, 'project', '项目管理模块', 0, 1, 1, '2018-09-19 17:48:16');
INSERT INTO `pear_project_node` VALUES (361, 'project/index/info', '详情', 0, 0, 1, '2018-09-19 17:48:34');
INSERT INTO `pear_project_node` VALUES (362, 'project/index', '基础版块', 0, 1, 1, '2018-09-19 17:48:34');
INSERT INTO `pear_project_node` VALUES (363, 'project/index/index', '框架布局', 0, 0, 1, '2018-09-30 16:48:35');
INSERT INTO `pear_project_node` VALUES (364, 'project/index/systemconfig', '系统信息', 0, 0, 0, '2018-09-30 16:55:11');
INSERT INTO `pear_project_node` VALUES (365, 'project/index/editpersonal', '修改个人资料', 0, 0, 1, '2018-09-30 17:42:42');
INSERT INTO `pear_project_node` VALUES (366, 'project/index/uploadavatar', '上传头像', 0, 0, 1, '2018-09-30 17:42:46');
INSERT INTO `pear_project_node` VALUES (370, 'project/account', '账号管理', 0, 1, 1, '0000-00-00 00:00:00');
INSERT INTO `pear_project_node` VALUES (371, 'project/account/index', '账号列表', 0, 0, 1, '0000-00-00 00:00:00');
INSERT INTO `pear_project_node` VALUES (372, 'project/organization/index', '组织列表', 0, 0, 1, '0000-00-00 00:00:00');
INSERT INTO `pear_project_node` VALUES (373, 'project/organization/save', '创建组织', 0, 0, 1, '0000-00-00 00:00:00');
INSERT INTO `pear_project_node` VALUES (374, 'project/organization/read', '组织信息', 0, 0, 1, '0000-00-00 00:00:00');
INSERT INTO `pear_project_node` VALUES (375, 'project/organization/edit', '编辑组织', 0, 1, 1, '0000-00-00 00:00:00');
INSERT INTO `pear_project_node` VALUES (376, 'project/organization/delete', '删除组织', 0, 1, 1, '0000-00-00 00:00:00');
INSERT INTO `pear_project_node` VALUES (377, 'project/organization', '组织管理', 0, 1, 1, '0000-00-00 00:00:00');
INSERT INTO `pear_project_node` VALUES (388, 'project/auth/index', '权限列表', 0, 0, 1, '0000-00-00 00:00:00');
INSERT INTO `pear_project_node` VALUES (389, 'project/auth/add', '添加权限角色', 0, 1, 1, '0000-00-00 00:00:00');
INSERT INTO `pear_project_node` VALUES (390, 'project/auth/edit', '编辑权限', 0, 1, 1, '0000-00-00 00:00:00');
INSERT INTO `pear_project_node` VALUES (391, 'project/auth/forbid', '禁用权限', 0, 1, 1, '0000-00-00 00:00:00');
INSERT INTO `pear_project_node` VALUES (392, 'project/auth/resume', '启用权限', 0, 1, 1, '0000-00-00 00:00:00');
INSERT INTO `pear_project_node` VALUES (393, 'project/auth/del', '删除权限', 0, 1, 1, '0000-00-00 00:00:00');
INSERT INTO `pear_project_node` VALUES (394, 'project/auth', '访问授权', 0, 1, 1, '0000-00-00 00:00:00');
INSERT INTO `pear_project_node` VALUES (395, 'project/auth/apply', '应用权限', 0, 1, 1, '0000-00-00 00:00:00');
INSERT INTO `pear_project_node` VALUES (396, 'project/notify/index', '通知列表', 0, 0, 1, '0000-00-00 00:00:00');
INSERT INTO `pear_project_node` VALUES (397, 'project/notify/noreads', '未读通知', 0, 0, 1, '0000-00-00 00:00:00');
INSERT INTO `pear_project_node` VALUES (399, 'project/notify/read', '通知信息', 0, 1, 1, '0000-00-00 00:00:00');
INSERT INTO `pear_project_node` VALUES (401, 'project/notify/delete', '删除通知', 0, 1, 1, '0000-00-00 00:00:00');
INSERT INTO `pear_project_node` VALUES (402, 'project/notify', '通知管理', 0, 1, 1, '0000-00-00 00:00:00');
INSERT INTO `pear_project_node` VALUES (434, 'project/account/auth', '授权管理', 0, 1, 1, '0000-00-00 00:00:00');
INSERT INTO `pear_project_node` VALUES (435, 'project/account/add', '添加账号', 0, 1, 1, '0000-00-00 00:00:00');
INSERT INTO `pear_project_node` VALUES (436, 'project/account/edit', '编辑账号', 0, 1, 1, '0000-00-00 00:00:00');
INSERT INTO `pear_project_node` VALUES (437, 'project/account/del', '删除账号', 0, 1, 1, '0000-00-00 00:00:00');
INSERT INTO `pear_project_node` VALUES (438, 'project/account/forbid', '禁用账号', 0, 1, 1, '0000-00-00 00:00:00');
INSERT INTO `pear_project_node` VALUES (439, 'project/account/resume', '启用账号', 0, 1, 1, '0000-00-00 00:00:00');
INSERT INTO `pear_project_node` VALUES (498, 'project/notify/setreadied', '设置已读', 0, 1, 1, '0000-00-00 00:00:00');
INSERT INTO `pear_project_node` VALUES (499, 'project/notify/batchdel', '批量删除', 0, 1, 1, '0000-00-00 00:00:00');
INSERT INTO `pear_project_node` VALUES (500, 'project/auth/setdefault', '设置默认权限', 0, 1, 1, NULL);
INSERT INTO `pear_project_node` VALUES (501, 'project/department', '部门管理', 0, 1, 1, NULL);
INSERT INTO `pear_project_node` VALUES (502, 'project/department/index', '部门列表', 0, 0, 1, NULL);
INSERT INTO `pear_project_node` VALUES (503, 'project/department/read', '部门信息', 0, 0, 1, NULL);
INSERT INTO `pear_project_node` VALUES (504, 'project/department/save', '创建部门', 0, 1, 1, NULL);
INSERT INTO `pear_project_node` VALUES (505, 'project/department/edit', '编辑部门', 0, 1, 1, NULL);
INSERT INTO `pear_project_node` VALUES (506, 'project/department/delete', '删除部门', 0, 1, 1, NULL);
INSERT INTO `pear_project_node` VALUES (507, 'project/department_member', '部门成员管理', 0, 1, 1, NULL);
INSERT INTO `pear_project_node` VALUES (508, 'project/department_member/index', '部门成员列表', 0, 0, 1, NULL);
INSERT INTO `pear_project_node` VALUES (509, 'project/department_member/searchinvitemember', '搜索部门成员', 0, 0, 1, NULL);
INSERT INTO `pear_project_node` VALUES (510, 'project/department_member/invitemember', '添加部门成员', 0, 1, 1, NULL);
INSERT INTO `pear_project_node` VALUES (511, 'project/department_member/removemember', '移除部门成员', 0, 1, 1, NULL);
INSERT INTO `pear_project_node` VALUES (512, 'project/index/changecurrentorganization', '切换当前组织', 0, 1, 1, NULL);
INSERT INTO `pear_project_node` VALUES (513, 'project/index/editpassword', '修改密码', 0, 1, 1, NULL);
INSERT INTO `pear_project_node` VALUES (514, 'project/index/uploadimg', '上传图片', 0, 0, 1, NULL);
INSERT INTO `pear_project_node` VALUES (515, 'project/menu', '菜单管理', 0, 1, 1, NULL);
INSERT INTO `pear_project_node` VALUES (516, 'project/menu/menu', '菜单列表', 0, 0, 0, NULL);
INSERT INTO `pear_project_node` VALUES (517, 'project/menu/menuadd', '添加菜单', 0, 1, 1, NULL);
INSERT INTO `pear_project_node` VALUES (518, 'project/menu/menuedit', '编辑菜单', 0, 1, 1, NULL);
INSERT INTO `pear_project_node` VALUES (519, 'project/menu/menuforbid', '禁用菜单', 0, 1, 1, NULL);
INSERT INTO `pear_project_node` VALUES (520, 'project/menu/menuresume', '启用菜单', 0, 1, 1, NULL);
INSERT INTO `pear_project_node` VALUES (521, 'project/menu/menudel', '删除菜单', 0, 1, 1, NULL);
INSERT INTO `pear_project_node` VALUES (522, 'project/node', '节点管理', 0, 1, 1, NULL);
INSERT INTO `pear_project_node` VALUES (523, 'project/node/index', '节点列表', 0, 1, 1, NULL);
INSERT INTO `pear_project_node` VALUES (524, 'project/node/alllist', '全部节点列表', 0, 1, 1, NULL);
INSERT INTO `pear_project_node` VALUES (525, 'project/node/clear', '清理节点', 0, 1, 1, NULL);
INSERT INTO `pear_project_node` VALUES (526, 'project/node/save', '编辑节点', 0, 1, 1, NULL);
INSERT INTO `pear_project_node` VALUES (527, 'project/project', '项目管理', 0, 1, 1, NULL);
INSERT INTO `pear_project_node` VALUES (528, 'project/project/index', '项目列表', 0, 0, 1, NULL);
INSERT INTO `pear_project_node` VALUES (529, 'project/project/selflist', '个人项目列表', 0, 0, 1, NULL);
INSERT INTO `pear_project_node` VALUES (530, 'project/project/save', '创建项目', 0, 1, 1, NULL);
INSERT INTO `pear_project_node` VALUES (531, 'project/project/read', '项目信息', 0, 0, 1, NULL);
INSERT INTO `pear_project_node` VALUES (532, 'project/project/edit', '编辑项目', 0, 1, 1, NULL);
INSERT INTO `pear_project_node` VALUES (533, 'project/project/uploadcover', '上传项目封面', 0, 0, 1, NULL);
INSERT INTO `pear_project_node` VALUES (534, 'project/project/recycle', '项目放入回收站', 0, 1, 1, NULL);
INSERT INTO `pear_project_node` VALUES (535, 'project/project/recovery', '恢复项目', 0, 1, 1, NULL);
INSERT INTO `pear_project_node` VALUES (536, 'project/project/archive', '归档项目', 0, 1, 1, NULL);
INSERT INTO `pear_project_node` VALUES (537, 'project/project/recoveryarchive', '取消归档项目', 0, 1, 1, NULL);
INSERT INTO `pear_project_node` VALUES (538, 'project/project/quit', '退出项目', 0, 1, 1, NULL);
INSERT INTO `pear_project_node` VALUES (539, 'project/project_collect', '项目收藏管理', 0, 0, 1, NULL);
INSERT INTO `pear_project_node` VALUES (540, 'project/project_collect/collect', '收藏项目', 0, 1, 1, NULL);
INSERT INTO `pear_project_node` VALUES (541, 'project/project_member', '项目成员管理', 0, 1, 1, NULL);
INSERT INTO `pear_project_node` VALUES (542, 'project/project_member/index', '项目成员列表', 0, 0, 1, NULL);
INSERT INTO `pear_project_node` VALUES (543, 'project/project_member/searchinvitemember', '搜索项目成员', 0, 0, 1, NULL);
INSERT INTO `pear_project_node` VALUES (544, 'project/project_member/invitemember', '邀请项目成员', 0, 1, 1, NULL);
INSERT INTO `pear_project_node` VALUES (545, 'project/project_template', '项目模板管理', 0, 1, 1, NULL);
INSERT INTO `pear_project_node` VALUES (546, 'project/project_template/index', '项目模板列表', 0, 0, 1, NULL);
INSERT INTO `pear_project_node` VALUES (547, 'project/project_template/save', '创建项目模板', 0, 1, 1, NULL);
INSERT INTO `pear_project_node` VALUES (548, 'project/project_template/uploadcover', '上传项目模板封面', 0, 1, 1, NULL);
INSERT INTO `pear_project_node` VALUES (549, 'project/project_template/edit', '编辑项目模板', 0, 1, 1, NULL);
INSERT INTO `pear_project_node` VALUES (550, 'project/project_template/delete', '删除项目模板', 0, 1, 1, NULL);
INSERT INTO `pear_project_node` VALUES (551, 'project/task/index', '任务列表', 0, 0, 1, NULL);
INSERT INTO `pear_project_node` VALUES (552, 'project/task/selflist', '个人任务列表', 0, 0, 1, NULL);
INSERT INTO `pear_project_node` VALUES (553, 'project/task/read', '任务信息', 0, 0, 1, NULL);
INSERT INTO `pear_project_node` VALUES (554, 'project/task/save', '创建任务', 0, 1, 1, NULL);
INSERT INTO `pear_project_node` VALUES (555, 'project/task/taskdone', '更改任务状态', 0, 0, 1, NULL);
INSERT INTO `pear_project_node` VALUES (556, 'project/task/assigntask', '指派任务执行者', 0, 1, 1, NULL);
INSERT INTO `pear_project_node` VALUES (557, 'project/task/sort', '任务排序', 0, 1, 1, NULL);
INSERT INTO `pear_project_node` VALUES (558, 'project/task/createcomment', '发表任务评论', 0, 1, 1, NULL);
INSERT INTO `pear_project_node` VALUES (559, 'project/task/edit', '编辑任务', 0, 1, 1, NULL);
INSERT INTO `pear_project_node` VALUES (560, 'project/task/like', '点赞任务', 0, 0, 1, NULL);
INSERT INTO `pear_project_node` VALUES (561, 'project/task/star', '收藏任务', 0, 0, 1, NULL);
INSERT INTO `pear_project_node` VALUES (562, 'project/task/recycle', '移动任务到回收站', 0, 1, 1, NULL);
INSERT INTO `pear_project_node` VALUES (563, 'project/task/recovery', '恢复任务', 0, 1, 1, NULL);
INSERT INTO `pear_project_node` VALUES (564, 'project/task/delete', '删除任务', 0, 1, 1, NULL);
INSERT INTO `pear_project_node` VALUES (565, 'project/task', '任务管理', 0, 1, 1, NULL);
INSERT INTO `pear_project_node` VALUES (569, 'project/task_member/index', '任务成员列表', 0, 0, 1, NULL);
INSERT INTO `pear_project_node` VALUES (570, 'project/task_member/searchinvitemember', '搜索任务成员', 0, 0, 1, NULL);
INSERT INTO `pear_project_node` VALUES (571, 'project/task_member/invitemember', '添加任务成员', 0, 1, 1, NULL);
INSERT INTO `pear_project_node` VALUES (572, 'project/task_member/invitememberbatch', '批量添加任务成员', 0, 1, 1, NULL);
INSERT INTO `pear_project_node` VALUES (573, 'project/task_member', '任务成员管理', 0, 1, 1, NULL);
INSERT INTO `pear_project_node` VALUES (574, 'project/task_stages', '任务分组管理', 0, 1, 1, NULL);
INSERT INTO `pear_project_node` VALUES (575, 'project/task_stages/index', '任务分组列表', 0, 0, 1, NULL);
INSERT INTO `pear_project_node` VALUES (576, 'project/task_stages/tasks', '任务分组任务列表', 0, 0, 1, NULL);
INSERT INTO `pear_project_node` VALUES (577, 'project/task_stages/sort', '任务分组排序', 0, 1, 1, NULL);
INSERT INTO `pear_project_node` VALUES (578, 'project/task_stages/save', '添加任务分组', 0, 1, 1, NULL);
INSERT INTO `pear_project_node` VALUES (579, 'project/task_stages/edit', '编辑任务分组', 0, 1, 1, NULL);
INSERT INTO `pear_project_node` VALUES (580, 'project/task_stages/delete', '删除任务分组', 0, 1, 1, NULL);
INSERT INTO `pear_project_node` VALUES (581, 'project/task_stages_template/index', '任务分组模板列表', 0, 0, 1, NULL);
INSERT INTO `pear_project_node` VALUES (582, 'project/task_stages_template/save', '创建任务分组模板', 0, 1, 1, NULL);
INSERT INTO `pear_project_node` VALUES (583, 'project/task_stages_template/edit', '编辑任务分组模板', 0, 1, 1, NULL);
INSERT INTO `pear_project_node` VALUES (584, 'project/task_stages_template/delete', '删除任务分组模板', 0, 1, 1, NULL);
INSERT INTO `pear_project_node` VALUES (585, 'project/task_stages_template', '任务分组模板管理', 0, 1, 1, NULL);
INSERT INTO `pear_project_node` VALUES (587, 'project/project_member/removemember', '移除项目成员', 0, 1, 1, NULL);
INSERT INTO `pear_project_node` VALUES (588, 'project/task/datetotalforproject', '任务统计', 0, 0, 1, NULL);
INSERT INTO `pear_project_node` VALUES (589, 'project/task/tasksources', '任务资源列表', 0, 0, 1, NULL);
INSERT INTO `pear_project_node` VALUES (590, 'project/file', '文件管理', 0, 1, 1, NULL);
INSERT INTO `pear_project_node` VALUES (591, 'project/file/index', '文件列表', 0, 0, 1, NULL);
INSERT INTO `pear_project_node` VALUES (592, 'project/file/read', '文件详情', 0, 0, 1, NULL);
INSERT INTO `pear_project_node` VALUES (593, 'project/file/uploadfiles', '上传文件', 0, 1, 1, NULL);
INSERT INTO `pear_project_node` VALUES (594, 'project/file/edit', '编辑文件', 0, 1, 1, NULL);
INSERT INTO `pear_project_node` VALUES (595, 'project/file/recycle', '文件移至回收站', 0, 1, 1, NULL);
INSERT INTO `pear_project_node` VALUES (596, 'project/file/recovery', '恢复文件', 0, 1, 1, NULL);
INSERT INTO `pear_project_node` VALUES (597, 'project/file/delete', '删除文件', 0, 1, 1, NULL);
INSERT INTO `pear_project_node` VALUES (598, 'project/project/getlogbyselfproject', '项目概况', 0, 1, 1, NULL);
INSERT INTO `pear_project_node` VALUES (599, 'project/source_link', '资源关联管理', 0, 1, 1, NULL);
INSERT INTO `pear_project_node` VALUES (600, 'project/source_link/delete', '取消关联', 0, 1, 1, NULL);
INSERT INTO `pear_project_node` VALUES (601, 'project/task/tasklog', '任务动态', 0, 1, 1, NULL);
INSERT INTO `pear_project_node` VALUES (602, 'project/task/recyclebatch', '批量移动任务到回收站', 0, 1, 1, NULL);
INSERT INTO `pear_project_node` VALUES (603, 'project/invite_link', '邀请链接管理', 0, 1, 1, NULL);
INSERT INTO `pear_project_node` VALUES (604, 'project/invite_link/save', '创建邀请链接', 0, 1, 1, NULL);
INSERT INTO `pear_project_node` VALUES (605, 'project/task/setprivate', '设置任务隐私模式', 0, 1, 1, NULL);
INSERT INTO `pear_project_node` VALUES (606, 'project/account/read', '账号信息', 0, 1, 1, NULL);
INSERT INTO `pear_project_node` VALUES (607, 'project/task/batchassigntask', '批量指派任务', 0, 1, 1, NULL);
INSERT INTO `pear_project_node` VALUES (608, 'project/task/tasktotags', '任务标签', 0, 1, 1, NULL);
INSERT INTO `pear_project_node` VALUES (609, 'project/task/settag', '设置任务标签', 0, 1, 1, NULL);
INSERT INTO `pear_project_node` VALUES (610, 'project/task_tag', '任务标签管理', 0, 1, 1, NULL);
INSERT INTO `pear_project_node` VALUES (611, 'project/task_tag/index', '任务标签列表', 0, 1, 1, NULL);
INSERT INTO `pear_project_node` VALUES (612, 'project/task_tag/save', '创建任务标签', 0, 1, 1, NULL);
INSERT INTO `pear_project_node` VALUES (613, 'project/task_tag/edit', '编辑任务标签', 0, 1, 1, NULL);
INSERT INTO `pear_project_node` VALUES (614, 'project/task_tag/delete', '删除任务标签', 0, 1, 1, NULL);

-- ----------------------------
-- Table structure for pear_project_template
-- ----------------------------
DROP TABLE IF EXISTS `pear_project_template`;
CREATE TABLE `pear_project_template`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '类型名称',
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '备注',
  `sort` tinyint(2) NULL DEFAULT 0,
  `create_time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `code` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '编号',
  `organization_code` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '组织id',
  `cover` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '封面',
  `member_code` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建人',
  `is_system` tinyint(1) NULL DEFAULT 0 COMMENT '系统默认',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 20 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '项目类型表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of pear_project_template
-- ----------------------------
INSERT INTO `pear_project_template` VALUES (11, '产品进展', '适用于互联网产品人员对产品计划、跟进及发布管理', 0, '2018-04-30 22:15:10', 'd85f1bvwpml2nhxe94zu7tyi', '6v7be19pwman2fird04gqu53', 'http://easyproject.net/static/image/default/cover.png', '', 1);
INSERT INTO `pear_project_template` VALUES (12, '需求管理', '适用于产品部门对需求的收集、评估及反馈管理', 0, '2018-04-30 22:16:29', 'd85f1bvwpml2nhxe92zu7tyi', '6v7be19pwman2fird04gqu53', 'http://easyproject.net/static/image/default/cover.png', '', 1);
INSERT INTO `pear_project_template` VALUES (13, '机械制造', '适用于制造商对图纸设计及制造安装的工作流程管理', 0, '2018-04-30 22:19:06', 'd85f1bvwpml2nhxe91zu7tyi', '6v7be19pwman2fird04gqu53', 'http://easyproject.net/static/image/default/cover.png', '', 1);
INSERT INTO `pear_project_template` VALUES (19, 'OKR 管理', '适用于团队的 OKR 管理', 0, '2018-12-24 16:57:49', 'un6125mxt4dcizhjqwvgyb3a', '6v7be19pwman2fird04gqu53', 'https://beta.vilson.xyz/static/upload//20190103/4c46f35da98ca0e1eeed192d8576b9c4.png', '6v7be19pwman2fird04gqu53', 0);

-- ----------------------------
-- Table structure for pear_source_link
-- ----------------------------
DROP TABLE IF EXISTS `pear_source_link`;
CREATE TABLE `pear_source_link`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '编号',
  `source_type` char(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '资源类型',
  `source_code` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '资源编号',
  `link_type` char(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '关联类型',
  `link_code` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '关联编号',
  `organization_code` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '组织编码',
  `create_by` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建时间',
  `sort` int(11) NULL DEFAULT 0 COMMENT '排序',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '资源关联表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of pear_source_link
-- ----------------------------
INSERT INTO `pear_source_link` VALUES (4, '47eu1kg32wrdb9inq8zj5xas', 'file', 'lhp9dfz831jquoam6g4nbery', 'task', 'g15scwqm9zxroy7p8bvjt632', '6v7be19pwman2fird04gqu53', '6v7be19pwman2fird04gqu53', '2019-01-11 10:45:40', 0);
INSERT INTO `pear_source_link` VALUES (5, 'bkh7y02dinz9g3wuet1asr6x', 'file', 'lr08qzj5bucy2p1osinhkdef', 'task', 'g15scwqm9zxroy7p8bvjt632', '6v7be19pwman2fird04gqu53', '6v7be19pwman2fird04gqu53', '2019-01-11 10:45:40', 0);

-- ----------------------------
-- Table structure for pear_system_config
-- ----------------------------
DROP TABLE IF EXISTS `pear_system_config`;
CREATE TABLE `pear_system_config`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '配置编码',
  `value` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '配置值',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `index_system_config_name`(`name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 43 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '系统参数配置' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of pear_system_config
-- ----------------------------
INSERT INTO `pear_system_config` VALUES (1, 'app_name', 'Pear Project');
INSERT INTO `pear_system_config` VALUES (2, 'site_name', 'Pear Project');
INSERT INTO `pear_system_config` VALUES (3, 'app_version', '2.0');
INSERT INTO `pear_system_config` VALUES (4, 'site_copy', 'Copyright © 2018 Pear Project出品');
INSERT INTO `pear_system_config` VALUES (5, 'browser_icon', '');
INSERT INTO `pear_system_config` VALUES (6, 'tongji_baidu_key', '');
INSERT INTO `pear_system_config` VALUES (7, 'miitbeian', '粤ICP备16eeeee2号-2');
INSERT INTO `pear_system_config` VALUES (8, 'storage_type', 'local');
INSERT INTO `pear_system_config` VALUES (9, 'storage_local_exts', 'png,jpg,rar,doc,icon,mp4,zip,gif,jpeg,bmp,webp,mp4,m3u8,rmvb,avi,swf,3gp,mkv,flv,txt,docx,pages,epub,pdf,numbers,csv,xls,xlsx,keynote,ppt,pptx,mp3,wav,wma,ogg,aac,flac');
INSERT INTO `pear_system_config` VALUES (10, 'storage_qiniu_bucket', '');
INSERT INTO `pear_system_config` VALUES (11, 'storage_qiniu_domain', '');
INSERT INTO `pear_system_config` VALUES (12, 'storage_qiniu_access_key', '');
INSERT INTO `pear_system_config` VALUES (13, 'storage_qiniu_secret_key', '');
INSERT INTO `pear_system_config` VALUES (14, 'storage_oss_bucket', 'cuci');
INSERT INTO `pear_system_config` VALUES (15, 'storage_oss_endpoint', '');
INSERT INTO `pear_system_config` VALUES (16, 'storage_oss_domain', '');
INSERT INTO `pear_system_config` VALUES (17, 'storage_oss_keyid', '');
INSERT INTO `pear_system_config` VALUES (18, 'storage_oss_secret', '');
INSERT INTO `pear_system_config` VALUES (34, 'wechat_appid', '');
INSERT INTO `pear_system_config` VALUES (35, 'wechat_appkey', '');
INSERT INTO `pear_system_config` VALUES (36, 'storage_oss_is_https', 'http');
INSERT INTO `pear_system_config` VALUES (37, 'wechat_type', 'thr');
INSERT INTO `pear_system_config` VALUES (38, 'wechat_token', 'test');
INSERT INTO `pear_system_config` VALUES (39, 'wechat_appsecret', '');
INSERT INTO `pear_system_config` VALUES (40, 'wechat_encodingaeskey', '');
INSERT INTO `pear_system_config` VALUES (41, 'wechat_thr_appid', '');
INSERT INTO `pear_system_config` VALUES (42, 'wechat_thr_appkey', '');

-- ----------------------------
-- Table structure for pear_system_log
-- ----------------------------
DROP TABLE IF EXISTS `pear_system_log`;
CREATE TABLE `pear_system_log`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `ip` char(15) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '操作者IP地址',
  `node` char(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '当前操作节点',
  `username` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '操作人用户名',
  `action` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '操作行为',
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '操作内容描述',
  `create_at` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '系统操作日志表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for pear_task
-- ----------------------------
DROP TABLE IF EXISTS `pear_task`;
CREATE TABLE `pear_task`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `code` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '编号',
  `project_code` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '项目编号',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `pri` tinyint(3) UNSIGNED NULL DEFAULT 0 COMMENT '紧急程度',
  `execute_status` enum('wait','doing','done','pause','cancel','closed') CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'wait' COMMENT '执行状态',
  `description` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '详情',
  `create_by` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建日期',
  `assign_to` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '指派给谁',
  `deleted` tinyint(1) NULL DEFAULT 0 COMMENT '回收站',
  `stage_code` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '任务列表',
  `task_tag` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '任务标签',
  `done` tinyint(2) NULL DEFAULT 0 COMMENT '是否完成',
  `begin_time` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '开始时间',
  `end_time` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '截止时间',
  `remind_time` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '提醒时间',
  `pcode` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '父任务id',
  `sort` int(11) NULL DEFAULT 0 COMMENT '排序',
  `like` int(7) NULL DEFAULT 0 COMMENT '点赞数',
  `star` int(7) NULL DEFAULT 0 COMMENT '收藏数',
  `deleted_time` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '删除时间',
  `private` tinyint(1) NULL DEFAULT 0 COMMENT '是否隐私模式',
  `id_num` int(7) NULL DEFAULT 1 COMMENT '任务id编号',
  `path` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '上级任务路径',
  `schedule` int(3) NULL DEFAULT 0 COMMENT '进度百分比',
  PRIMARY KEY (`id`, `project_code`) USING BTREE,
  INDEX `task`(`code`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 12361 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '任务表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of pear_task
-- ----------------------------
INSERT INTO `pear_task` VALUES (12182, 'mv4usefb06dx33ez2spkl223', 'mo4uqwfb06dxv8ez2spkl3rg', '排序样式', 0, 'wait', '', 'kqdcn2w40p58r31zyo6efjib', '2018-07-14 13:58:36', '', 0, '7z8tgb6xevy2aj9nui5fk0w1', NULL, 0, NULL, NULL, NULL, '', 12182, 0, 0, NULL, 0, 1, NULL, 0);
INSERT INTO `pear_task` VALUES (12183, 'mv4usefb06dxv8ez2spkl223', 'mo4uqwfb06dxv8ez2spkl3rg', 'Notification 组件升级 rc-notification 到 3.3.0', 0, 'wait', NULL, 'kqdcn2w40p58r31zyo6efjib', '2018-11-02 13:51:48', 'kqdcn2w40p58r31zyo6efjib', 0, 'g0yw3r54qahbk7lets6fv2on', NULL, 0, NULL, '2019-01-08 18:00', NULL, '', 1, 3, 1, NULL, 0, 2, NULL, 0);
INSERT INTO `pear_task` VALUES (12208, 'aut9wrz1pn0elf5s47ivx26o', 'mo4uqwfb06dxv8ez2spkl3rg', '修复了 Badge 代码错误引起的 TypeScript 类型报错', 2, 'wait', '<p><a href=\"https://www.baidu.com\" target=\"_blank\">这里是备注内容</a><br></p><p><img src=\"https://beta.vilson.xyz/static/upload/image/default/20181229/54cd2d50d19731f3231fc96d26a823bf.png\" style=\"max-width:100%;\"><br></p>', '6v7be19pwman2fird04gqu53', '2018-12-25 16:13:34', 'y680trgedcavbhnz24u7i5m3', 0, '7z8tgb6xevy2aj9nui5fk0w1', NULL, 1, NULL, '', NULL, '', 0, 3, 1, NULL, 0, 3, NULL, 0);
INSERT INTO `pear_task` VALUES (12218, '0tjma1un2gz8rf4ywo7c6de9', 'ibag9hw3o1tusd5qlpxrk782', '阅读「分享」中的使用案例，为新产品发布计划建立一个公示板吧！', 1, 'wait', NULL, '6v7be19pwman2fird04gqu53', '2018-12-26 11:28:17', '6v7be19pwman2fird04gqu53', 0, 'ipzyscgfo5l1qvah2xm4638t', NULL, 0, NULL, NULL, NULL, '', 12218, 0, 0, NULL, 0, 1, NULL, 0);
INSERT INTO `pear_task` VALUES (12219, 'xkqg60sld15fcphwt4ya3rb8', 'ibag9hw3o1tusd5qlpxrk782', '编写文档', 0, 'wait', NULL, '6v7be19pwman2fird04gqu53', '2018-12-26 11:28:22', '6v7be19pwman2fird04gqu53', 0, 'ipzyscgfo5l1qvah2xm4638t', NULL, 1, NULL, NULL, NULL, '', 12219, 0, 0, NULL, 0, 2, NULL, 0);
INSERT INTO `pear_task` VALUES (12223, '4mtnhwbe0gjdkaur2ic7xsv6', 'mo4uqwfb06dxv8ez2spkl3rg', '修复 Table 动态设置表头分组报错的问题', 0, 'wait', NULL, '6v7be19pwman2fird04gqu53', '2018-12-28 13:02:28', '6v7be19pwman2fird04gqu53', 0, 'psemnf3ugo89vc5r2hkxid1t', NULL, 0, NULL, NULL, NULL, 'aut9wrz1pn0elf5s47ivx26o', 12223, 0, 0, NULL, 0, 4, 'aut9wrz1pn0elf5s47ivx26o', 0);
INSERT INTO `pear_task` VALUES (12224, 'hj5s73zk6amd9wfvbxoygpic', 'mo4uqwfb06dxv8ez2spkl3rg', '新增阿拉伯语', 0, 'wait', NULL, '6v7be19pwman2fird04gqu53', '2018-12-28 13:12:06', '6v7be19pwman2fird04gqu53', 0, 'psemnf3ugo89vc5r2hkxid1t', NULL, 0, NULL, NULL, NULL, 'aut9wrz1pn0elf5s47ivx26o', 12224, 0, 0, NULL, 0, 5, 'aut9wrz1pn0elf5s47ivx26o', 0);
INSERT INTO `pear_task` VALUES (12225, 'l027b1dyrv93zu4ewmtoa6q5', 'mo4uqwfb06dxv8ez2spkl3rg', 'Table 支持 slot-scope 用法', 0, 'wait', NULL, '6v7be19pwman2fird04gqu53', '2018-12-28 13:14:09', '6v7be19pwman2fird04gqu53', 0, 'psemnf3ugo89vc5r2hkxid1t', NULL, 0, NULL, NULL, NULL, 'aut9wrz1pn0elf5s47ivx26o', 12225, 0, 0, NULL, 0, 6, 'aut9wrz1pn0elf5s47ivx26o', 0);
INSERT INTO `pear_task` VALUES (12226, 'rqb7vi254tna3uzhdgo0f6ey', 'mo4uqwfb06dxv8ez2spkl3rg', 'Table 新增取消全选事件 @on-select-all-cancel', 0, 'wait', NULL, '6v7be19pwman2fird04gqu53', '2018-12-28 13:15:16', '', 0, 'psemnf3ugo89vc5r2hkxid1t', NULL, 0, NULL, NULL, NULL, 'aut9wrz1pn0elf5s47ivx26o', 12226, 0, 0, NULL, 0, 7, 'aut9wrz1pn0elf5s47ivx26o', 0);
INSERT INTO `pear_task` VALUES (12287, 'qscug70y98zpk6edbnf3livr', 'ibag9hw3o1tusd5qlpxrk782', '1', 1, 'wait', NULL, '6v7be19pwman2fird04gqu53', '2018-12-31 15:04:43', '6v7be19pwman2fird04gqu53', 0, '3uz8afjkxnogwivd9s0lqp7y', NULL, 0, NULL, '2018-12-31 18:00', NULL, '', 0, 1, 0, NULL, 0, 3, NULL, 0);
INSERT INTO `pear_task` VALUES (12288, 'rzpu5cxl63fvb2y8gwdnsjqk', 'ibag9hw3o1tusd5qlpxrk782', '2', 0, 'wait', NULL, '6v7be19pwman2fird04gqu53', '2018-12-31 15:04:44', '6v7be19pwman2fird04gqu53', 0, '3uz8afjkxnogwivd9s0lqp7y', NULL, 0, NULL, NULL, NULL, '', 0, 0, 0, NULL, 0, 4, NULL, 0);
INSERT INTO `pear_task` VALUES (12289, 'ozi8awms1lpcbde4fuq5ktgj', 'ibag9hw3o1tusd5qlpxrk782', '3', 0, 'wait', NULL, '6v7be19pwman2fird04gqu53', '2018-12-31 15:04:45', '6v7be19pwman2fird04gqu53', 0, '3uz8afjkxnogwivd9s0lqp7y', NULL, 0, NULL, NULL, NULL, '', 0, 0, 0, NULL, 0, 5, NULL, 0);
INSERT INTO `pear_task` VALUES (12290, 'xejt6431q8ly97bkid5z2pun', 'ibag9hw3o1tusd5qlpxrk782', '4', 0, 'wait', NULL, '6v7be19pwman2fird04gqu53', '2018-12-31 15:04:46', 'y680trgedcavbhnz24u7i5m3', 0, '3uz8afjkxnogwivd9s0lqp7y', NULL, 1, NULL, NULL, NULL, '', 0, 0, 0, NULL, 0, 6, NULL, 0);
INSERT INTO `pear_task` VALUES (12291, 'zkqb6if5ogdts27lx13r4yju', 'ibag9hw3o1tusd5qlpxrk782', '5', 0, 'wait', NULL, '6v7be19pwman2fird04gqu53', '2018-12-31 15:04:47', '6v7be19pwman2fird04gqu53', 0, '3uz8afjkxnogwivd9s0lqp7y', NULL, 0, NULL, NULL, NULL, '', 0, 0, 0, NULL, 0, 7, NULL, 0);
INSERT INTO `pear_task` VALUES (12292, '9wsohy8jgapl6x2iutbm7k34', 'ibag9hw3o1tusd5qlpxrk782', '6', 0, 'wait', NULL, '6v7be19pwman2fird04gqu53', '2018-12-31 15:04:49', '', 0, '3uz8afjkxnogwivd9s0lqp7y', NULL, 0, NULL, NULL, NULL, '', 0, 0, 0, NULL, 0, 8, NULL, 0);
INSERT INTO `pear_task` VALUES (12295, 'q9y6ksvtifwpuhna0e32jgm1', '8ulzfth64cd0k1x5peivowm2', '1', 0, 'wait', NULL, 'kqdcn2w40p58r31zyo6efjib', '2019-01-03 10:46:04', 'kqdcn2w40p58r31zyo6efjib', 0, 'pfi2ltmjhxuda90ncsgb5vwo', NULL, 0, NULL, NULL, NULL, '', 0, 0, 0, NULL, 0, 1, NULL, 0);
INSERT INTO `pear_task` VALUES (12296, 'wyklgmhpt5qr47x3zsf9nibj', '8ulzfth64cd0k1x5peivowm2', '2', 0, 'wait', '<p>66</p>', 'kqdcn2w40p58r31zyo6efjib', '2019-01-03 10:46:13', '6v7be19pwman2fird04gqu53', 0, 'ht0gfnevaq7kp3ldx16i82yj', NULL, 1, NULL, NULL, NULL, '', 0, 0, 0, NULL, 0, 2, NULL, 0);
INSERT INTO `pear_task` VALUES (12297, 'm6cloqrbh7tf0wg1jsvp9nay', 'mo4uqwfb06dxv8ez2spkl3rg', '99', 0, 'wait', NULL, 'kqdcn2w40p58r31zyo6efjib', '2019-01-03 11:00:15', 'y680trgedcavbhnz24u7i5m3', 0, '7z8tgb6xevy2aj9nui5fk0w1', NULL, 1, NULL, NULL, NULL, 'aut9wrz1pn0elf5s47ivx26o', 0, 0, 0, NULL, 0, 8, 'aut9wrz1pn0elf5s47ivx26o', 0);
INSERT INTO `pear_task` VALUES (12298, 'p1aujdigrlxky76h8cs3z4w0', 'mo4uqwfb06dxv8ez2spkl3rg', '增加了一个新组件 Comment', 0, 'wait', NULL, '6v7be19pwman2fird04gqu53', '2019-01-03 22:25:29', '6v7be19pwman2fird04gqu53', 0, 'jvyswuxz34qk2cpt9o7ldb60', NULL, 0, NULL, '2019-01-01 18:00', NULL, '', 0, 0, 0, NULL, 0, 9, NULL, 0);
INSERT INTO `pear_task` VALUES (12299, '2bn918l6ejyzousa73dkpgci', 'mo4uqwfb06dxv8ez2spkl3rg', '增加了一个新组件 ConfigProvider 为组件提供统一的全局化配置', 0, 'wait', NULL, '6v7be19pwman2fird04gqu53', '2019-01-03 22:25:37', '6v7be19pwman2fird04gqu53', 0, 'psemnf3ugo89vc5r2hkxid1t', NULL, 0, NULL, NULL, NULL, '', 2, 0, 0, NULL, 0, 10, NULL, 0);
INSERT INTO `pear_task` VALUES (12300, '3qz5hfsin69xt8cgbd70lkew', 'mo4uqwfb06dxv8ez2spkl3rg', 'Avatar 组件增加 srcSet 属性，用于设置图片类头像响应式资源地址', 1, 'wait', NULL, '6v7be19pwman2fird04gqu53', '2019-01-03 22:25:45', '6v7be19pwman2fird04gqu53', 0, 'jvyswuxz34qk2cpt9o7ldb60', NULL, 0, NULL, NULL, NULL, '', 2, 0, 0, NULL, 0, 11, NULL, 0);
INSERT INTO `pear_task` VALUES (12301, 'xkic58d20srnu9jm7ohqw14f', 'mo4uqwfb06dxv8ez2spkl3rg', '增加 less 变量 @font-variant-base 定制 font-variant 样式', 0, 'wait', NULL, '6v7be19pwman2fird04gqu53', '2019-01-03 22:25:53', '6v7be19pwman2fird04gqu53', 0, 'jvyswuxz34qk2cpt9o7ldb60', NULL, 0, NULL, NULL, NULL, '', 0, 0, 0, NULL, 0, 12, NULL, 0);
INSERT INTO `pear_task` VALUES (12302, '6hj43ueim2bk187sqzcoy59v', 'mo4uqwfb06dxv8ez2spkl3rg', '优化鼠标悬停在可排序的表头上时 title 的显示', 2, 'wait', '<p><a href=\"https://www.baidu.com\" target=\"_blank\">这里是备注内容</a><br></p><p><img src=\"https://beta.vilson.xyz/static/upload/image/default/20181229/54cd2d50d19731f3231fc96d26a823bf.png\" style=\"max-width:100%;\"><br></p>', '6v7be19pwman2fird04gqu53', '2019-01-03 22:26:01', '6v7be19pwman2fird04gqu53', 0, 'psemnf3ugo89vc5r2hkxid1t', NULL, 0, NULL, '2019-01-06 18:00', NULL, '', 1, 1, 0, NULL, 0, 13, NULL, 0);
INSERT INTO `pear_task` VALUES (12303, 'twb8f52jasn9vry6iko0dqg4', 'mo4uqwfb06dxv8ez2spkl3rg', '修正 Comment author 属性的类型为 ReactNode', 0, 'wait', NULL, '6v7be19pwman2fird04gqu53', '2019-01-03 22:26:09', '', 0, 'g0yw3r54qahbk7lets6fv2on', NULL, 0, NULL, NULL, NULL, '', 0, 0, 1, NULL, 0, 14, NULL, 0);
INSERT INTO `pear_task` VALUES (12304, 'gjmotpbrwva079ukde4izn38', 'mo4uqwfb06dxv8ez2spkl3rg', '优化 Spin 样式并略微提升了切换状态的性能', 0, 'wait', NULL, '6v7be19pwman2fird04gqu53', '2019-01-03 22:26:16', '6v7be19pwman2fird04gqu53', 0, 'p56enm7zck4id2rb0tx9lguh', NULL, 1, NULL, NULL, NULL, '', 0, 0, 0, NULL, 0, 15, NULL, 0);
INSERT INTO `pear_task` VALUES (12305, 'uwq87z2f0hnvrl6o9gtcb3iy', 'mo4uqwfb06dxv8ez2spkl3rg', '微调 Card 头部和加载中的样式细节', 0, 'wait', NULL, '6v7be19pwman2fird04gqu53', '2019-01-03 22:26:21', 'y680trgedcavbhnz24u7i5m3', 0, 'p56enm7zck4id2rb0tx9lguh', NULL, 1, NULL, NULL, NULL, '', 0, 0, 2, NULL, 0, 16, NULL, 0);
INSERT INTO `pear_task` VALUES (12306, 'qug5e4alndm7930ipxwyvc2h', 'mo4uqwfb06dxv8ez2spkl3rg', 'Cascader 升级 rc-calendar', 0, 'wait', NULL, '6v7be19pwman2fird04gqu53', '2019-01-03 22:27:04', '6v7be19pwman2fird04gqu53', 0, 'psemnf3ugo89vc5r2hkxid1t', NULL, 0, NULL, NULL, NULL, '', 3, 0, 0, NULL, 0, 17, NULL, 0);
INSERT INTO `pear_task` VALUES (12307, 'yctbsv81x6dmahkf7ei5o4r9', 'mo4uqwfb06dxv8ez2spkl3rg', 'Upload 组件升级 rc-upload 到 2.5.0', 0, 'wait', NULL, '6v7be19pwman2fird04gqu53', '2019-01-03 22:27:17', 'kqdcn2w40p58r31zyo6efjib', 0, 'psemnf3ugo89vc5r2hkxid1t', NULL, 0, NULL, NULL, NULL, '', 4, 0, 0, NULL, 0, 18, NULL, 0);
INSERT INTO `pear_task` VALUES (12308, 'm7u8fdp41cwrtkjxyzq2ion3', 'mo4uqwfb06dxv8ez2spkl3rg', '重构 Tag 组件，简化代码并提升性能', 0, 'wait', NULL, '6v7be19pwman2fird04gqu53', '2019-01-03 22:27:30', 'kqdcn2w40p58r31zyo6efjib', 0, 'g0yw3r54qahbk7lets6fv2on', NULL, 0, NULL, NULL, NULL, '', 2, 0, 0, NULL, 0, 19, NULL, 0);
INSERT INTO `pear_task` VALUES (12309, 'jo0i8fq2579kbdgsmcw1nev4', 'mo4uqwfb06dxv8ez2spkl3rg', 'Badge 进行了重构，count 支持自定义组件', 0, 'wait', NULL, '6v7be19pwman2fird04gqu53', '2019-01-03 22:27:36', '6v7be19pwman2fird04gqu53', 0, 'g0yw3r54qahbk7lets6fv2on', NULL, 0, NULL, NULL, NULL, '', 3, 0, 0, NULL, 0, 20, NULL, 0);
INSERT INTO `pear_task` VALUES (12310, 'owrs04m3e2klj8uqac6tiy17', 'mo4uqwfb06dxv8ez2spkl3rg', '重构了 Tree 底层的代码，以解决一些存在了很久的问题', 0, 'wait', NULL, '6v7be19pwman2fird04gqu53', '2019-01-03 22:27:54', 'y680trgedcavbhnz24u7i5m3', 0, 'g0yw3r54qahbk7lets6fv2on', NULL, 0, NULL, NULL, NULL, '', 2, 0, 0, '2019-01-12 22:27:56', 0, 21, NULL, 0);
INSERT INTO `pear_task` VALUES (12311, 'g15scwqm9zxroy7p8bvjt632', 'mo4uqwfb06dxv8ez2spkl3rg', '修复了 Divider 与浮动元素一起使用时的样式问题', 0, 'wait', NULL, '6v7be19pwman2fird04gqu53', '2019-01-03 22:28:21', 'y680trgedcavbhnz24u7i5m3', 0, '7z8tgb6xevy2aj9nui5fk0w1', NULL, 0, NULL, NULL, NULL, '', 0, 0, 0, NULL, 1, 22, NULL, 0);
INSERT INTO `pear_task` VALUES (12312, '0a84xkg12enqjml7rz6dbifw', 'mo4uqwfb06dxv8ez2spkl3rg', '修复了 Form 高级搜索模式下的样式问题', 0, 'wait', NULL, '6v7be19pwman2fird04gqu53', '2019-01-03 22:28:25', 'kqdcn2w40p58r31zyo6efjib', 0, '7z8tgb6xevy2aj9nui5fk0w1', NULL, 0, NULL, '2019-01-04 18:00', NULL, '', 0, 0, 0, NULL, 0, 23, NULL, 0);
INSERT INTO `pear_task` VALUES (12313, 'fax4gez2jlk15tvsu3dc6p98', 'mo4uqwfb06dxv8ez2spkl3rg', '修复了 Upload 对无扩展名图片地址的预览展示问题', 0, 'wait', NULL, '6v7be19pwman2fird04gqu53', '2019-01-03 22:28:29', '6v7be19pwman2fird04gqu53', 0, '7z8tgb6xevy2aj9nui5fk0w1', NULL, 0, NULL, NULL, NULL, '', 0, 0, 0, NULL, 0, 24, NULL, 0);
INSERT INTO `pear_task` VALUES (12314, 'zv4hx1ugpn98be5skc3wym72', 'mo4uqwfb06dxv8ez2spkl3rg', '修复一处 less 语法错误', 0, 'wait', NULL, '6v7be19pwman2fird04gqu53', '2019-01-03 22:28:33', '6v7be19pwman2fird04gqu53', 0, '7z8tgb6xevy2aj9nui5fk0w1', NULL, 0, NULL, NULL, NULL, '', 0, 0, 0, NULL, 0, 25, NULL, 0);
INSERT INTO `pear_task` VALUES (12315, 'jiy25eobh1cnp7ruvg9d0m6s', 'mo4uqwfb06dxv8ez2spkl3rg', '修复 LocaleProvider 中 moment.locale 调用报错的问题', 0, 'wait', NULL, '6v7be19pwman2fird04gqu53', '2019-01-03 22:28:39', '', 0, '7z8tgb6xevy2aj9nui5fk0w1', NULL, 0, NULL, NULL, NULL, '', 0, 0, 0, NULL, 0, 26, NULL, 0);
INSERT INTO `pear_task` VALUES (12316, '4pv9brqnm0cigwu5f3zeyxdk', 'mo4uqwfb06dxv8ez2spkl3rg', '修复 WeekPicker 的 style 属性不生效的问题', 0, 'wait', NULL, '6v7be19pwman2fird04gqu53', '2019-01-03 22:28:43', '6v7be19pwman2fird04gqu53', 0, '7z8tgb6xevy2aj9nui5fk0w1', NULL, 0, NULL, NULL, NULL, '', 0, 0, 0, NULL, 0, 27, NULL, 0);
INSERT INTO `pear_task` VALUES (12317, 'td1qznl9ms65gbcfej0k4vup', 'mo4uqwfb06dxv8ez2spkl3rg', 'Carousel: 升级 react-slick 版本以修复宽度计算错误', 0, 'wait', NULL, '6v7be19pwman2fird04gqu53', '2019-01-03 22:28:50', 'y680trgedcavbhnz24u7i5m3', 0, '7z8tgb6xevy2aj9nui5fk0w1', NULL, 0, NULL, NULL, NULL, '', 0, 0, 0, NULL, 0, 28, NULL, 0);
INSERT INTO `pear_task` VALUES (12318, 'fkrsvpzmj8xyo045hiugqt92', 'mo4uqwfb06dxv8ez2spkl3rg', '修复 enterButton 的值为 button 元素时显示错误的问题', 0, 'wait', NULL, '6v7be19pwman2fird04gqu53', '2019-01-03 22:28:56', '6v7be19pwman2fird04gqu53', 0, '7z8tgb6xevy2aj9nui5fk0w1', NULL, 0, NULL, NULL, NULL, '', 0, 0, 0, NULL, 0, 29, NULL, 0);
INSERT INTO `pear_task` VALUES (12319, '0b6wlc3754fr8gdvupx9aoys', 'mo4uqwfb06dxv8ez2spkl3rg', '修复表单校验文字消失的时候输入框会抖一下的问题', 0, 'wait', NULL, '6v7be19pwman2fird04gqu53', '2019-01-03 22:29:02', '6v7be19pwman2fird04gqu53', 0, '7z8tgb6xevy2aj9nui5fk0w1', NULL, 0, NULL, NULL, NULL, '', 0, 0, 0, NULL, 0, 30, NULL, 0);
INSERT INTO `pear_task` VALUES (12320, 'bl1t7xjwpi9m2aocnsz83fk6', 'mo4uqwfb06dxv8ez2spkl3rg', '重构了 DatePicker 相关 type 定义', 0, 'wait', NULL, '6v7be19pwman2fird04gqu53', '2019-01-03 22:29:18', 'y680trgedcavbhnz24u7i5m3', 0, 'g0yw3r54qahbk7lets6fv2on', NULL, 1, NULL, NULL, NULL, '', 0, 0, 0, NULL, 0, 31, NULL, 0);
INSERT INTO `pear_task` VALUES (12321, 'hxntygarp3094c7w1856iujm', 'mo4uqwfb06dxv8ez2spkl3rg', 'Steps 进行了重构，首次渲染的时候不会再闪烁', 0, 'wait', NULL, '6v7be19pwman2fird04gqu53', '2019-01-03 22:29:24', '6v7be19pwman2fird04gqu53', 0, 'g0yw3r54qahbk7lets6fv2on', NULL, 1, NULL, NULL, NULL, '', 0, 0, 0, NULL, 0, 32, NULL, 0);
INSERT INTO `pear_task` VALUES (12322, 'gk8ipqm5406br7cwd9l1zefs', 'mo4uqwfb06dxv8ez2spkl3rg', 'Change hover over message of Column', 0, 'wait', NULL, 'y680trgedcavbhnz24u7i5m3', '2019-01-04 09:09:28', 'y680trgedcavbhnz24u7i5m3', 0, 'p56enm7zck4id2rb0tx9lguh', NULL, 0, NULL, NULL, NULL, '6hj43ueim2bk187sqzcoy59v', 0, 0, 0, NULL, 0, 33, '6hj43ueim2bk187sqzcoy59v', 0);
INSERT INTO `pear_task` VALUES (12323, 'o61b3s24exmcy8njkparwthd', 'mo4uqwfb06dxv8ez2spkl3rg', '新增 directory 属性，支持上传一个文件夹', 0, 'wait', NULL, 'kqdcn2w40p58r31zyo6efjib', '2019-01-04 09:18:18', '6v7be19pwman2fird04gqu53', 0, 'psemnf3ugo89vc5r2hkxid1t', NULL, 0, NULL, NULL, NULL, 'yctbsv81x6dmahkf7ei5o4r9', 0, 0, 0, NULL, 0, 34, 'yctbsv81x6dmahkf7ei5o4r9', 0);
INSERT INTO `pear_task` VALUES (12324, 'orycwlhf7n2qx1pta038dzjk', 'mo4uqwfb06dxv8ez2spkl3rg', 'action 属性支持作为一个返回 Promise 对象的函数，使用更加灵活', 0, 'wait', NULL, 'kqdcn2w40p58r31zyo6efjib', '2019-01-04 09:18:24', '6v7be19pwman2fird04gqu53', 0, 'psemnf3ugo89vc5r2hkxid1t', NULL, 1, NULL, NULL, NULL, 'yctbsv81x6dmahkf7ei5o4r9', 0, 0, 0, NULL, 0, 35, 'yctbsv81x6dmahkf7ei5o4r9', 0);
INSERT INTO `pear_task` VALUES (12325, 'up6hn9bd34c8mglwaj1ytefz', 'elqa703jyvfhpt1dsxkzi8on', 'Add variant prop and deprecate fullWidth and scrollable props', 0, 'wait', NULL, '6v7be19pwman2fird04gqu53', '2019-01-04 21:17:13', 'y680trgedcavbhnz24u7i5m3', 0, '2sf7h3p01l5qgdeumrzny4bi', NULL, 0, NULL, NULL, NULL, '', 0, 0, 0, NULL, 0, 1, NULL, 0);
INSERT INTO `pear_task` VALUES (12326, 'krj4p7ix2cf605vyltmudq1e', 'elqa703jyvfhpt1dsxkzi8on', 'Add styles to make size property work with extended property', 0, 'wait', NULL, '6v7be19pwman2fird04gqu53', '2019-01-04 21:17:19', '', 0, '2sf7h3p01l5qgdeumrzny4bi', NULL, 0, NULL, '2019-01-05 18:00', NULL, '', 0, 0, 0, NULL, 0, 2, NULL, 0);
INSERT INTO `pear_task` VALUES (12327, '1g3vc8tkyla20fp5rdhxe7mo', 'elqa703jyvfhpt1dsxkzi8on', 'Add cross references from Modal docs to other components', 0, 'wait', NULL, '6v7be19pwman2fird04gqu53', '2019-01-04 21:17:46', 'y680trgedcavbhnz24u7i5m3', 0, '2sf7h3p01l5qgdeumrzny4bi', NULL, 1, NULL, NULL, NULL, '', 0, 0, 0, NULL, 0, 3, NULL, 0);
INSERT INTO `pear_task` VALUES (12328, 'nqrleu2c90zsdaj1yph4m8bt', 'elqa703jyvfhpt1dsxkzi8on', 'Add createSvgIcon type definition', 0, 'wait', NULL, '6v7be19pwman2fird04gqu53', '2019-01-04 21:18:25', 'kqdcn2w40p58r31zyo6efjib', 0, '2sf7h3p01l5qgdeumrzny4bi', NULL, 0, NULL, NULL, NULL, '', 0, 0, 0, NULL, 0, 4, NULL, 0);
INSERT INTO `pear_task` VALUES (12329, 'mix3cg2eh1u60fknd7yz9v5t', 'elqa703jyvfhpt1dsxkzi8on', 'Add customized demo', 0, 'wait', NULL, '6v7be19pwman2fird04gqu53', '2019-01-04 21:18:37', 'y680trgedcavbhnz24u7i5m3', 0, '2sf7h3p01l5qgdeumrzny4bi', NULL, 0, NULL, NULL, NULL, '', 0, 0, 0, NULL, 0, 5, NULL, 0);
INSERT INTO `pear_task` VALUES (12330, 'dckxz1vpujtafshgr20mwo7e', 'elqa703jyvfhpt1dsxkzi8on', 'Add defaultTheme option for makeStyles', 0, 'wait', NULL, '6v7be19pwman2fird04gqu53', '2019-01-04 21:18:45', 'y680trgedcavbhnz24u7i5m3', 0, '2sf7h3p01l5qgdeumrzny4bi', NULL, 0, NULL, NULL, NULL, '', 0, 0, 0, NULL, 0, 6, NULL, 0);
INSERT INTO `pear_task` VALUES (12331, 'fd1avskez2q43w80xhb7ypc9', 'elqa703jyvfhpt1dsxkzi8on', 'Add nextjs-hooks-with-typescript', 0, 'wait', NULL, '6v7be19pwman2fird04gqu53', '2019-01-04 21:18:53', 'y680trgedcavbhnz24u7i5m3', 0, '2sf7h3p01l5qgdeumrzny4bi', NULL, 1, NULL, NULL, NULL, '', 0, 0, 0, NULL, 0, 7, NULL, 0);
INSERT INTO `pear_task` VALUES (12332, 'as2y4r6mwxuhgvncop3f8z90', 'elqa703jyvfhpt1dsxkzi8on', 'Add note on archived components', 0, 'wait', NULL, '6v7be19pwman2fird04gqu53', '2019-01-04 21:19:01', 'y680trgedcavbhnz24u7i5m3', 0, '2sf7h3p01l5qgdeumrzny4bi', NULL, 0, NULL, NULL, NULL, '', 0, 0, 0, NULL, 0, 8, NULL, 0);
INSERT INTO `pear_task` VALUES (12333, '8zj3vpx0b7qud24ylfgces1m', 'elqa703jyvfhpt1dsxkzi8on', 'Add Instagram theme', 0, 'wait', NULL, '6v7be19pwman2fird04gqu53', '2019-01-04 21:19:08', 'kqdcn2w40p58r31zyo6efjib', 0, '2sf7h3p01l5qgdeumrzny4bi', NULL, 0, NULL, NULL, NULL, '', 0, 0, 0, NULL, 0, 9, NULL, 0);
INSERT INTO `pear_task` VALUES (12334, 'hcrdvbuzwgojst2f0p134qxi', 'elqa703jyvfhpt1dsxkzi8on', 'Add component prop', 0, 'wait', NULL, '6v7be19pwman2fird04gqu53', '2019-01-04 21:19:18', 'kqdcn2w40p58r31zyo6efjib', 0, '2sf7h3p01l5qgdeumrzny4bi', NULL, 0, NULL, NULL, NULL, '', 0, 0, 0, NULL, 0, 10, NULL, 0);
INSERT INTO `pear_task` VALUES (12335, 'lmognshqz21dbewcu9a3rx87', 'elqa703jyvfhpt1dsxkzi8on', 'Fix utils.chainPropTypes issue', 0, 'wait', NULL, '6v7be19pwman2fird04gqu53', '2019-01-04 21:19:37', 'kqdcn2w40p58r31zyo6efjib', 0, 'njd4er1ohakl6bz258qcfgsv', NULL, 0, NULL, NULL, NULL, '', 0, 0, 0, NULL, 0, 11, NULL, 0);
INSERT INTO `pear_task` VALUES (12336, 'n6ulc7ebxpqahi50dy9k1sgf', 'elqa703jyvfhpt1dsxkzi8on', 'Fix vertical text alignment by reducing padding', 0, 'wait', NULL, '6v7be19pwman2fird04gqu53', '2019-01-04 21:19:51', '', 0, 'njd4er1ohakl6bz258qcfgsv', NULL, 0, NULL, NULL, NULL, '', 0, 0, 0, NULL, 0, 12, NULL, 0);
INSERT INTO `pear_task` VALUES (12337, 'rqjng1kfcp4wyiamt6o23zbu', 'elqa703jyvfhpt1dsxkzi8on', 'Fix infinite loop in the scroll button logic', 0, 'wait', NULL, '6v7be19pwman2fird04gqu53', '2019-01-04 21:19:57', 'y680trgedcavbhnz24u7i5m3', 0, 'njd4er1ohakl6bz258qcfgsv', NULL, 0, NULL, NULL, NULL, '', 0, 0, 0, NULL, 0, 13, NULL, 0);
INSERT INTO `pear_task` VALUES (12338, 'qsz65fvgi8hyx3e7bn14o9wm', 'elqa703jyvfhpt1dsxkzi8on', 'Fix component animations', 0, 'wait', NULL, '6v7be19pwman2fird04gqu53', '2019-01-04 21:20:05', 'kqdcn2w40p58r31zyo6efjib', 0, 'njd4er1ohakl6bz258qcfgsv', NULL, 1, NULL, NULL, NULL, '', 0, 0, 0, NULL, 0, 14, NULL, 0);
INSERT INTO `pear_task` VALUES (12339, 'byiuxhn0v6sod4zap1t2fclr', 'elqa703jyvfhpt1dsxkzi8on', 'Fix responsivePropType typo', 0, 'wait', NULL, '6v7be19pwman2fird04gqu53', '2019-01-04 21:20:12', 'kqdcn2w40p58r31zyo6efjib', 0, 'njd4er1ohakl6bz258qcfgsv', NULL, 0, NULL, NULL, NULL, '', 0, 0, 0, NULL, 0, 15, NULL, 0);
INSERT INTO `pear_task` VALUES (12340, 'jxd3rpmay6qonsk1i8wg5e9u', 'elqa703jyvfhpt1dsxkzi8on', 'Change action element to have a fixed right margin', 2, 'wait', '<p><a href=\"https://www.baidu.com\" target=\"_blank\">This is the content </a><br></p><p><img src=\"https://beta.vilson.xyz/static/upload/image/default/20181229/54cd2d50d19731f3231fc96d26a823bf.png\" style=\"max-width:100%;\"><br></p>', '6v7be19pwman2fird04gqu53', '2019-01-04 21:20:27', 'kqdcn2w40p58r31zyo6efjib', 0, 'sft603lxe5phk89ou1cgmiby', NULL, 0, NULL, '2019-01-09 18:00', NULL, '', 0, 0, 0, NULL, 0, 16, NULL, 0);
INSERT INTO `pear_task` VALUES (12341, 'vmzeciodgbfp7ysu38tq10kj', 'elqa703jyvfhpt1dsxkzi8on', 'Change height from 5 to 4 pixels', 0, 'wait', NULL, '6v7be19pwman2fird04gqu53', '2019-01-04 21:20:33', 'y680trgedcavbhnz24u7i5m3', 0, 'oxcj9krmqeu08wbga2ftz7ls', NULL, 0, NULL, NULL, NULL, '', 0, 0, 0, NULL, 0, 17, NULL, 0);
INSERT INTO `pear_task` VALUES (12342, '6cagd725tifonvw0qphe9zsb', 'elqa703jyvfhpt1dsxkzi8on', 'Change sub-components to have fixed gutters', 0, 'wait', NULL, '6v7be19pwman2fird04gqu53', '2019-01-04 21:20:45', 'kqdcn2w40p58r31zyo6efjib', 0, 'oxcj9krmqeu08wbga2ftz7ls', NULL, 0, NULL, NULL, NULL, '', 0, 0, 0, NULL, 0, 18, NULL, 0);
INSERT INTO `pear_task` VALUES (12343, 'xu3jgyow2s9f1km0rctqin4v', 'elqa703jyvfhpt1dsxkzi8on', 'Change the classes structure to match the core components convention', 0, 'wait', NULL, '6v7be19pwman2fird04gqu53', '2019-01-04 21:20:54', 'y680trgedcavbhnz24u7i5m3', 0, 'oxcj9krmqeu08wbga2ftz7ls', NULL, 0, NULL, NULL, NULL, '', 0, 0, 0, NULL, 0, 19, NULL, 0);
INSERT INTO `pear_task` VALUES (12344, 'k3g07m1qyctvbp95siohju6f', 'elqa703jyvfhpt1dsxkzi8on', 'Update the action spacing to better match the spec', 0, 'wait', NULL, '6v7be19pwman2fird04gqu53', '2019-01-04 21:21:12', 'y680trgedcavbhnz24u7i5m3', 0, 'sft603lxe5phk89ou1cgmiby', NULL, 0, NULL, NULL, NULL, '', 1, 3, 0, NULL, 0, 20, NULL, 0);
INSERT INTO `pear_task` VALUES (12345, 'oh5wpj9kd8e6ltusxq271ma3', 'elqa703jyvfhpt1dsxkzi8on', 'Update the emotion documentation', 0, 'wait', NULL, '6v7be19pwman2fird04gqu53', '2019-01-04 21:21:18', 'y680trgedcavbhnz24u7i5m3', 0, 'sft603lxe5phk89ou1cgmiby', NULL, 0, NULL, NULL, NULL, '', 2, 0, 0, NULL, 0, 21, NULL, 0);
INSERT INTO `pear_task` VALUES (12346, 'akdwslbtp3z82xecui0y4ovq', 'elqa703jyvfhpt1dsxkzi8on', 'Update the CodeFund embed script', 0, 'wait', NULL, '6v7be19pwman2fird04gqu53', '2019-01-04 21:21:25', 'y680trgedcavbhnz24u7i5m3', 0, 'sft603lxe5phk89ou1cgmiby', NULL, 0, NULL, NULL, NULL, '', 3, 0, 0, NULL, 0, 22, NULL, 0);
INSERT INTO `pear_task` VALUES (12347, 'hayfr6vl398nq5exgszobu2j', 'elqa703jyvfhpt1dsxkzi8on', 'Update react-select demo to have isClearable set to true', 0, 'wait', NULL, '6v7be19pwman2fird04gqu53', '2019-01-04 21:21:31', '', 0, 'sft603lxe5phk89ou1cgmiby', NULL, 0, NULL, NULL, NULL, '', 4, 0, 0, NULL, 0, 23, NULL, 0);
INSERT INTO `pear_task` VALUES (12348, 'mf80iu15kepavbg2r9ldcjsh', 'elqa703jyvfhpt1dsxkzi8on', 'Update album page-layout preview image album.png', 0, 'wait', NULL, '6v7be19pwman2fird04gqu53', '2019-01-04 21:21:41', 'kqdcn2w40p58r31zyo6efjib', 0, 'sft603lxe5phk89ou1cgmiby', NULL, 0, NULL, NULL, NULL, '', 5, 0, 0, NULL, 0, 24, NULL, 0);
INSERT INTO `pear_task` VALUES (12349, 'nzy71f5i6g0skwau4lrj3d8b', 'elqa703jyvfhpt1dsxkzi8on', 'Update some components to better match the Material specification', 0, 'wait', NULL, '6v7be19pwman2fird04gqu53', '2019-01-04 21:22:08', 'kqdcn2w40p58r31zyo6efjib', 0, 'sft603lxe5phk89ou1cgmiby', NULL, 1, NULL, NULL, NULL, '', 0, 0, 0, NULL, 0, 25, NULL, 0);
INSERT INTO `pear_task` VALUES (12350, '4cug3e5rodalq9x81ywht0zn', 'elqa703jyvfhpt1dsxkzi8on', 'Remove hoisting of static properties in HOCs', 0, 'wait', NULL, '6v7be19pwman2fird04gqu53', '2019-01-04 21:22:20', 'kqdcn2w40p58r31zyo6efjib', 0, '0jmqucy41h3rt9ag27wils6b', NULL, 0, NULL, '2018-12-31 18:00', NULL, '', 0, 0, 0, NULL, 0, 26, NULL, 0);
INSERT INTO `pear_task` VALUES (12351, '92fow0le47htb6xkv5ynzuri', 'elqa703jyvfhpt1dsxkzi8on', 'Remove the withRoot HOC', 0, 'wait', NULL, '6v7be19pwman2fird04gqu53', '2019-01-04 21:22:24', 'kqdcn2w40p58r31zyo6efjib', 0, '0jmqucy41h3rt9ag27wils6b', NULL, 0, NULL, NULL, NULL, '', 0, 0, 0, NULL, 0, 27, NULL, 0);
INSERT INTO `pear_task` VALUES (12352, '6ky18i9cg0eqvfzn2th3ux5l', 'elqa703jyvfhpt1dsxkzi8on', '100% remove the prop types', 0, 'wait', NULL, '6v7be19pwman2fird04gqu53', '2019-01-04 21:22:34', '', 0, '0jmqucy41h3rt9ag27wils6b', NULL, 0, NULL, NULL, NULL, '', 0, 0, 0, NULL, 0, 28, NULL, 0);
INSERT INTO `pear_task` VALUES (12353, 'zj6skt9orn748gh5mvb2ueif', 'elqa703jyvfhpt1dsxkzi8on', 'Remove unused lint directives', 1, 'wait', NULL, '6v7be19pwman2fird04gqu53', '2019-01-04 21:22:40', 'y680trgedcavbhnz24u7i5m3', 0, '0jmqucy41h3rt9ag27wils6b', NULL, 0, NULL, NULL, NULL, '', 0, 0, 0, NULL, 0, 29, NULL, 0);
INSERT INTO `pear_task` VALUES (12354, 'a75dcqx2sjivokmg49yh380l', 'elqa703jyvfhpt1dsxkzi8on', 'Improve demos loading', 0, 'wait', NULL, 'y680trgedcavbhnz24u7i5m3', '2019-01-04 21:30:13', 'y680trgedcavbhnz24u7i5m3', 0, 'oxcj9krmqeu08wbga2ftz7ls', NULL, 0, NULL, NULL, NULL, 'jxd3rpmay6qonsk1i8wg5e9u', 0, 0, 0, NULL, 0, 30, 'jxd3rpmay6qonsk1i8wg5e9u', 0);
INSERT INTO `pear_task` VALUES (12355, '7ns924ofulpjxkgq06y3bm5r', 'elqa703jyvfhpt1dsxkzi8on', 'Improve the service-worker logic', 0, 'wait', NULL, 'y680trgedcavbhnz24u7i5m3', '2019-01-04 21:30:19', 'y680trgedcavbhnz24u7i5m3', 0, 'oxcj9krmqeu08wbga2ftz7ls', NULL, 0, NULL, NULL, NULL, 'jxd3rpmay6qonsk1i8wg5e9u', 0, 0, 0, NULL, 0, 31, 'jxd3rpmay6qonsk1i8wg5e9u', 0);
INSERT INTO `pear_task` VALUES (12356, 'cz7fxnibs2v8rq90h6wo3a4l', 'mo4uqwfb06dxv8ez2spkl3rg', '3级子任务', 0, 'wait', NULL, '6v7be19pwman2fird04gqu53', '2019-01-24 15:22:47', '6v7be19pwman2fird04gqu53', 0, 'psemnf3ugo89vc5r2hkxid1t', NULL, 0, NULL, NULL, NULL, 'o61b3s24exmcy8njkparwthd', 0, 0, 0, NULL, 0, 36, 'o61b3s24exmcy8njkparwthd,yctbsv81x6dmahkf7ei5o4r9', 0);
INSERT INTO `pear_task` VALUES (12357, 'vnjthy40w5gim1xflcp3z8rs', 'mo4uqwfb06dxv8ez2spkl3rg', '1级任务', 0, 'wait', NULL, '6v7be19pwman2fird04gqu53', '2019-01-24 15:35:46', '6v7be19pwman2fird04gqu53', 0, 'p56enm7zck4id2rb0tx9lguh', NULL, 0, NULL, NULL, NULL, '', 0, 0, 0, NULL, 0, 37, '', 0);
INSERT INTO `pear_task` VALUES (12358, 'jq3xc7uklh1tv9g6swmep8yn', 'mo4uqwfb06dxv8ez2spkl3rg', '2级任务', 0, 'wait', NULL, '6v7be19pwman2fird04gqu53', '2019-01-24 15:35:54', '6v7be19pwman2fird04gqu53', 0, 'p56enm7zck4id2rb0tx9lguh', NULL, 0, NULL, NULL, NULL, 'vnjthy40w5gim1xflcp3z8rs', 0, 0, 0, NULL, 0, 38, 'vnjthy40w5gim1xflcp3z8rs', 0);
INSERT INTO `pear_task` VALUES (12359, '64rmkd08wonsjx39fg71t5li', 'mo4uqwfb06dxv8ez2spkl3rg', '3级任务', 0, 'wait', NULL, '6v7be19pwman2fird04gqu53', '2019-01-24 15:36:16', '6v7be19pwman2fird04gqu53', 0, 'p56enm7zck4id2rb0tx9lguh', NULL, 0, NULL, NULL, NULL, 'jq3xc7uklh1tv9g6swmep8yn', 0, 0, 0, NULL, 0, 39, 'jq3xc7uklh1tv9g6swmep8yn,vnjthy40w5gim1xflcp3z8rs', 0);
INSERT INTO `pear_task` VALUES (12360, 'xc2p9lign6zmvwte7jhu8byd', 'mo4uqwfb06dxv8ez2spkl3rg', '4级任务', 0, 'wait', NULL, '6v7be19pwman2fird04gqu53', '2019-01-24 15:59:55', '6v7be19pwman2fird04gqu53', 0, 'p56enm7zck4id2rb0tx9lguh', NULL, 0, NULL, NULL, NULL, '64rmkd08wonsjx39fg71t5li', 0, 0, 0, NULL, 0, 40, '64rmkd08wonsjx39fg71t5li,jq3xc7uklh1tv9g6swmep8yn,vnjthy40w5gim1xflcp3z8rs', 0);

-- ----------------------------
-- Table structure for pear_task_like
-- ----------------------------
DROP TABLE IF EXISTS `pear_task_like`;
CREATE TABLE `pear_task_like`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `task_code` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '任务ID',
  `member_code` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '成员id',
  `create_time` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `id`(`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 117 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '任务点赞表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of pear_task_like
-- ----------------------------
INSERT INTO `pear_task_like` VALUES (91, 'n156qrj4l8720xhvioefmzys', '6v7be19pwman2fird04gqu53', '2018-12-28 20:37:49');
INSERT INTO `pear_task_like` VALUES (100, 'caq96fw7hnsv1pude2mibxz8', '6v7be19pwman2fird04gqu53', '2018-12-28 23:19:32');
INSERT INTO `pear_task_like` VALUES (101, 'j6xkdynh4c2sm1pblvztaweg', '6v7be19pwman2fird04gqu53', '2018-12-28 23:19:35');
INSERT INTO `pear_task_like` VALUES (102, '4fua38vpqgk706csx2lb9etj', '6v7be19pwman2fird04gqu53', '2018-12-29 13:07:20');
INSERT INTO `pear_task_like` VALUES (105, 'aut9wrz1pn0elf5s47ivx26o', '6v7be19pwman2fird04gqu53', '2018-12-30 21:51:39');
INSERT INTO `pear_task_like` VALUES (108, 'mv4usefb06dxv8ez2spkl223', '6v7be19pwman2fird04gqu53', '2018-12-31 14:08:27');
INSERT INTO `pear_task_like` VALUES (109, 'qscug70y98zpk6edbnf3livr', '6v7be19pwman2fird04gqu53', '2018-12-31 15:04:57');
INSERT INTO `pear_task_like` VALUES (111, 'mv4usefb06dxv8ez2spkl223', 'kqdcn2w40p58r31zyo6efjib', '2019-01-04 09:20:34');
INSERT INTO `pear_task_like` VALUES (112, 'mv4usefb06dxv8ez2spkl223', 'y680trgedcavbhnz24u7i5m3', '2019-01-04 09:20:43');
INSERT INTO `pear_task_like` VALUES (113, 'k3g07m1qyctvbp95siohju6f', 'y680trgedcavbhnz24u7i5m3', '2019-01-04 21:32:09');
INSERT INTO `pear_task_like` VALUES (114, 'k3g07m1qyctvbp95siohju6f', 'kqdcn2w40p58r31zyo6efjib', '2019-01-04 21:32:12');
INSERT INTO `pear_task_like` VALUES (115, 'k3g07m1qyctvbp95siohju6f', '6v7be19pwman2fird04gqu53', '2019-01-04 21:32:23');
INSERT INTO `pear_task_like` VALUES (116, '6hj43ueim2bk187sqzcoy59v', '6v7be19pwman2fird04gqu53', '2019-01-06 19:58:07');

-- ----------------------------
-- Table structure for pear_task_member
-- ----------------------------
DROP TABLE IF EXISTS `pear_task_member`;
CREATE TABLE `pear_task_member`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `task_code` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '任务ID',
  `is_executor` tinyint(1) NULL DEFAULT 0 COMMENT '执行者',
  `member_code` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '成员id',
  `join_time` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `is_owner` tinyint(1) NULL DEFAULT 0 COMMENT '是否创建人',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `id`(`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 271 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '任务-成员表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of pear_task_member
-- ----------------------------
INSERT INTO `pear_task_member` VALUES (1, 'mv4usefb06dxv8ez2spkl223', 1, 'kqdcn2w40p58r31zyo6efjib', '2018-04-30 22:33:22', 0);
INSERT INTO `pear_task_member` VALUES (4, 'c3s1n5avuqgeoh2xb4yt809l', 1, '6v7be19pwman2fird04gqu53', '2018-12-25 14:39:34', 0);
INSERT INTO `pear_task_member` VALUES (5, 'tx6loaugrd0s3e1mhk52iznp', 1, '6v7be19pwman2fird04gqu53', '2018-12-25 14:47:08', 0);
INSERT INTO `pear_task_member` VALUES (6, 'n156qrj4l8720xhvioefmzys', 1, 'kqdcn2w40p58r31zyo6efjib', '2018-12-25 14:47:26', 0);
INSERT INTO `pear_task_member` VALUES (7, 'b7upmiofztckvy6s38lxge90', 1, 'kqdcn2w40p58r31zyo6efjib', '2018-12-25 14:48:17', 0);
INSERT INTO `pear_task_member` VALUES (8, '9av8miueqc7wbzo50ljg3p1r', 1, '6v7be19pwman2fird04gqu53', '2018-12-25 14:49:16', 0);
INSERT INTO `pear_task_member` VALUES (9, '9av8miueqc7wbzo50ljg3p1r', 1, 'kqdcn2w40p58r31zyo6efjib', '2018-12-25 14:49:16', 0);
INSERT INTO `pear_task_member` VALUES (10, '7agxbmcn4y1rzviw26s0du8p', 1, '6v7be19pwman2fird04gqu53', '2018-12-25 14:53:46', 0);
INSERT INTO `pear_task_member` VALUES (11, 'kd2vz0jeyhwcl1ir9m8f64ap', 1, 'kqdcn2w40p58r31zyo6efjib', '2018-12-25 14:54:56', 0);
INSERT INTO `pear_task_member` VALUES (12, 'kd2vz0jeyhwcl1ir9m8f64ap', 0, '6v7be19pwman2fird04gqu53', '2018-12-25 14:54:56', 0);
INSERT INTO `pear_task_member` VALUES (13, 'ycs3hzrpfmjq4o19a8k2x7ln', 1, 'kqdcn2w40p58r31zyo6efjib', '2018-12-25 15:01:39', 0);
INSERT INTO `pear_task_member` VALUES (14, 'ycs3hzrpfmjq4o19a8k2x7ln', 0, '6v7be19pwman2fird04gqu53', '2018-12-25 15:01:39', 0);
INSERT INTO `pear_task_member` VALUES (15, 'yqugz409cvs8p165fx2miodn', 1, '6v7be19pwman2fird04gqu53', '2018-12-25 15:02:18', 0);
INSERT INTO `pear_task_member` VALUES (16, 'yd5blem7xikvq01ujhwfzc4n', 1, '6v7be19pwman2fird04gqu53', '2018-12-25 15:02:47', 0);
INSERT INTO `pear_task_member` VALUES (17, '9u0j2xvr37og8n1bpk6dwfsz', 1, 'kqdcn2w40p58r31zyo6efjib', '2018-12-25 15:03:06', 0);
INSERT INTO `pear_task_member` VALUES (18, '9u0j2xvr37og8n1bpk6dwfsz', 0, '6v7be19pwman2fird04gqu53', '2018-12-25 15:03:06', 0);
INSERT INTO `pear_task_member` VALUES (19, 'caq96fw7hnsv1pude2mibxz8', 1, 'kqdcn2w40p58r31zyo6efjib', '2018-12-25 15:03:09', 0);
INSERT INTO `pear_task_member` VALUES (20, 'caq96fw7hnsv1pude2mibxz8', 0, '6v7be19pwman2fird04gqu53', '2018-12-25 15:03:09', 0);
INSERT INTO `pear_task_member` VALUES (21, 'ubxoy07emt4lfij2cn961spd', 1, 'kqdcn2w40p58r31zyo6efjib', '2018-12-25 15:03:11', 0);
INSERT INTO `pear_task_member` VALUES (22, 'ubxoy07emt4lfij2cn961spd', 0, '6v7be19pwman2fird04gqu53', '2018-12-25 15:03:11', 0);
INSERT INTO `pear_task_member` VALUES (23, '3kpstlv16ixmaho78fuqc05e', 1, '6v7be19pwman2fird04gqu53', '2018-12-25 15:07:41', 0);
INSERT INTO `pear_task_member` VALUES (24, 'uwdo4eytilf2bcx1qn5pz8vg', 1, '6v7be19pwman2fird04gqu53', '2018-12-25 15:08:06', 0);
INSERT INTO `pear_task_member` VALUES (25, '0ib1k5v2pn4mdjsxa3eo6f8y', 1, '6v7be19pwman2fird04gqu53', '2018-12-25 15:08:19', 0);
INSERT INTO `pear_task_member` VALUES (26, 'ndu3t1r7i09x6al2egsopzyf', 1, '6v7be19pwman2fird04gqu53', '2018-12-25 15:16:55', 0);
INSERT INTO `pear_task_member` VALUES (27, '2wkhps0gviqcmfr5y8t1nu6d', 1, '6v7be19pwman2fird04gqu53', '2018-12-25 15:19:26', 0);
INSERT INTO `pear_task_member` VALUES (28, 'sgkw8x2nte10o97i3dyumv4a', 0, '6v7be19pwman2fird04gqu53', '2018-12-25 15:20:02', 0);
INSERT INTO `pear_task_member` VALUES (29, 'lremxqhjw265i3ku4p0bo8n1', 1, '6v7be19pwman2fird04gqu53', '2018-12-25 15:20:40', 0);
INSERT INTO `pear_task_member` VALUES (30, 'dfcolxj2izhk08pq7stmu15v', 0, '6v7be19pwman2fird04gqu53', '2018-12-25 15:20:42', 0);
INSERT INTO `pear_task_member` VALUES (31, 'j6xkdynh4c2sm1pblvztaweg', 1, '6v7be19pwman2fird04gqu53', '2018-12-25 15:20:50', 0);
INSERT INTO `pear_task_member` VALUES (32, '7y9o8jrfxus3ca1i4bwvptgh', 1, '6v7be19pwman2fird04gqu53', '2018-12-25 15:20:51', 0);
INSERT INTO `pear_task_member` VALUES (33, '6zkho2cegrl8fxq9wia1jmsp', 1, '6v7be19pwman2fird04gqu53', '2018-12-25 15:20:52', 0);
INSERT INTO `pear_task_member` VALUES (35, '7qcosftd9bl83i62ugymkxaz', 1, '6v7be19pwman2fird04gqu53', '2018-12-25 17:33:14', 0);
INSERT INTO `pear_task_member` VALUES (36, '98lqy4vaiprk60uzbojdmsgx', 1, '6v7be19pwman2fird04gqu53', '2018-12-25 17:33:23', 0);
INSERT INTO `pear_task_member` VALUES (37, 'i7s50ny8j9p2km3hfau6le4r', 1, '6v7be19pwman2fird04gqu53', '2018-12-25 17:47:03', 0);
INSERT INTO `pear_task_member` VALUES (38, 'kr5vojwa2hd370mxpgs984zt', 1, '6v7be19pwman2fird04gqu53', '2018-12-25 17:47:09', 0);
INSERT INTO `pear_task_member` VALUES (39, 'edbn6rz89fmh7a3ilgvukw14', 0, '6v7be19pwman2fird04gqu53', '2018-12-25 17:47:11', 0);
INSERT INTO `pear_task_member` VALUES (40, 'fb3hsvx1e6tjad450y9cgr8o', 1, '6v7be19pwman2fird04gqu53', '2018-12-25 17:47:15', 0);
INSERT INTO `pear_task_member` VALUES (41, 'f09otzl5e1r8qspgcvdy4ukx', 1, '6v7be19pwman2fird04gqu53', '2018-12-25 20:09:17', 0);
INSERT INTO `pear_task_member` VALUES (42, 'r3efvs51qn9dy0c6mik2u7xw', 1, '6v7be19pwman2fird04gqu53', '2018-12-25 21:48:48', 0);
INSERT INTO `pear_task_member` VALUES (43, 'zabrco15knhvj4xwm69yd7et', 1, '6v7be19pwman2fird04gqu53', '2018-12-26 09:08:15', 0);
INSERT INTO `pear_task_member` VALUES (44, '0tjma1un2gz8rf4ywo7c6de9', 1, '6v7be19pwman2fird04gqu53', '2018-12-26 11:28:17', 0);
INSERT INTO `pear_task_member` VALUES (45, 'xkqg60sld15fcphwt4ya3rb8', 1, '6v7be19pwman2fird04gqu53', '2018-12-26 11:28:22', 0);
INSERT INTO `pear_task_member` VALUES (46, 'bodic0rp491g837vah5tsxqn', 0, '6v7be19pwman2fird04gqu53', '2018-12-26 11:30:32', 0);
INSERT INTO `pear_task_member` VALUES (47, '3urs09e57btygqhjdfx2pwmn', 1, '6v7be19pwman2fird04gqu53', '2018-12-26 16:08:36', 0);
INSERT INTO `pear_task_member` VALUES (53, 'aut9wrz1pn0elf5s47ivx26o', 1, 'y680trgedcavbhnz24u7i5m3', '2018-12-27 14:45:06', 1);
INSERT INTO `pear_task_member` VALUES (65, 'sgkw8x2nte10o97i3dyumv4a', 1, 'kqdcn2w40p58r31zyo6efjib', '2018-12-27 15:19:22', 0);
INSERT INTO `pear_task_member` VALUES (66, 'dfcolxj2izhk08pq7stmu15v', 1, 'y680trgedcavbhnz24u7i5m3', '2018-12-27 15:20:42', 0);
INSERT INTO `pear_task_member` VALUES (67, 'edbn6rz89fmh7a3ilgvukw14', 0, 'y680trgedcavbhnz24u7i5m3', '2018-12-27 15:21:15', 0);
INSERT INTO `pear_task_member` VALUES (68, 'l09jk1p7z4x3ebm2rvwsuthn', 0, '6v7be19pwman2fird04gqu53', '2018-12-28 13:00:53', 1);
INSERT INTO `pear_task_member` VALUES (69, '4mtnhwbe0gjdkaur2ic7xsv6', 0, '6v7be19pwman2fird04gqu53', '2018-12-28 13:02:28', 1);
INSERT INTO `pear_task_member` VALUES (70, 'hj5s73zk6amd9wfvbxoygpic', 0, '6v7be19pwman2fird04gqu53', '2018-12-28 13:12:06', 1);
INSERT INTO `pear_task_member` VALUES (71, 'l027b1dyrv93zu4ewmtoa6q5', 0, '6v7be19pwman2fird04gqu53', '2018-12-28 13:14:09', 1);
INSERT INTO `pear_task_member` VALUES (72, 'xu7cpf2h3t6o0rilam8k9sgj', 0, '6v7be19pwman2fird04gqu53', '2018-12-28 13:19:13', 1);
INSERT INTO `pear_task_member` VALUES (73, '0zvn3ug6fiqhdpkljos79xaw', 0, '6v7be19pwman2fird04gqu53', '2018-12-28 13:42:23', 1);
INSERT INTO `pear_task_member` VALUES (74, 'we7iyhrudos9lt50cn8fjzp2', 0, 'y680trgedcavbhnz24u7i5m3', '2018-12-28 13:45:08', 0);
INSERT INTO `pear_task_member` VALUES (75, 'we7iyhrudos9lt50cn8fjzp2', 0, '6v7be19pwman2fird04gqu53', '2018-12-28 13:45:09', 1);
INSERT INTO `pear_task_member` VALUES (76, '6kqh4b1mce05rzvuljsg3ow8', 0, '6v7be19pwman2fird04gqu53', '2018-12-28 13:45:19', 1);
INSERT INTO `pear_task_member` VALUES (77, 'g83vs5t47dfnprchqzel1a29', 0, 'y680trgedcavbhnz24u7i5m3', '2018-12-28 13:45:27', 0);
INSERT INTO `pear_task_member` VALUES (78, 'g83vs5t47dfnprchqzel1a29', 0, '6v7be19pwman2fird04gqu53', '2018-12-28 13:45:27', 1);
INSERT INTO `pear_task_member` VALUES (79, 'mevzwp1d086roxsb92n4yja7', 1, '6v7be19pwman2fird04gqu53', '2018-12-28 14:36:29', 1);
INSERT INTO `pear_task_member` VALUES (80, '5qd1lfth0gji4aeb3oczp9u8', 1, '6v7be19pwman2fird04gqu53', '2018-12-28 14:36:32', 1);
INSERT INTO `pear_task_member` VALUES (81, 'bodic0rp491g837vah5tsxqn', 1, 'y680trgedcavbhnz24u7i5m3', '2018-12-28 15:02:24', 0);
INSERT INTO `pear_task_member` VALUES (82, 'ua7rphit5fxj04l6qc8nydze', 0, '6v7be19pwman2fird04gqu53', '2018-12-28 15:08:19', 1);
INSERT INTO `pear_task_member` VALUES (83, 'ua7rphit5fxj04l6qc8nydze', 1, 'y680trgedcavbhnz24u7i5m3', '2018-12-28 15:09:53', 0);
INSERT INTO `pear_task_member` VALUES (84, 'yis4dg3txpoah6jnr290v57w', 0, 'y680trgedcavbhnz24u7i5m3', '2018-12-28 15:56:32', 0);
INSERT INTO `pear_task_member` VALUES (85, 'yis4dg3txpoah6jnr290v57w', 0, '6v7be19pwman2fird04gqu53', '2018-12-28 15:56:32', 1);
INSERT INTO `pear_task_member` VALUES (86, 'bzn09o6a3j1qe4sp7il8tvxy', 0, 'y680trgedcavbhnz24u7i5m3', '2018-12-28 15:56:35', 0);
INSERT INTO `pear_task_member` VALUES (87, 'bzn09o6a3j1qe4sp7il8tvxy', 0, '6v7be19pwman2fird04gqu53', '2018-12-28 15:56:35', 1);
INSERT INTO `pear_task_member` VALUES (88, '3gkj1lmzxpcf5e628thnwsb7', 0, 'y680trgedcavbhnz24u7i5m3', '2018-12-28 15:56:40', 0);
INSERT INTO `pear_task_member` VALUES (89, '3gkj1lmzxpcf5e628thnwsb7', 0, '6v7be19pwman2fird04gqu53', '2018-12-28 15:56:40', 1);
INSERT INTO `pear_task_member` VALUES (90, 'fr091dxea76hvzgp42ywctmj', 0, 'kqdcn2w40p58r31zyo6efjib', '2018-12-28 23:18:57', 0);
INSERT INTO `pear_task_member` VALUES (91, 'fr091dxea76hvzgp42ywctmj', 0, '6v7be19pwman2fird04gqu53', '2018-12-28 23:18:58', 1);
INSERT INTO `pear_task_member` VALUES (92, 'n6txie0u7mz8cghyw1kjaof5', 0, 'kqdcn2w40p58r31zyo6efjib', '2018-12-28 23:18:59', 0);
INSERT INTO `pear_task_member` VALUES (93, 'n6txie0u7mz8cghyw1kjaof5', 0, '6v7be19pwman2fird04gqu53', '2018-12-28 23:18:59', 1);
INSERT INTO `pear_task_member` VALUES (94, '8uhmp6ekvwl5zny7gr3bo9a1', 0, 'kqdcn2w40p58r31zyo6efjib', '2018-12-28 23:19:00', 0);
INSERT INTO `pear_task_member` VALUES (95, '8uhmp6ekvwl5zny7gr3bo9a1', 0, '6v7be19pwman2fird04gqu53', '2018-12-28 23:19:00', 1);
INSERT INTO `pear_task_member` VALUES (96, 'ibc0m5jly7k4wngfper2dstx', 0, 'kqdcn2w40p58r31zyo6efjib', '2018-12-28 23:19:01', 0);
INSERT INTO `pear_task_member` VALUES (97, 'ibc0m5jly7k4wngfper2dstx', 0, '6v7be19pwman2fird04gqu53', '2018-12-28 23:19:01', 1);
INSERT INTO `pear_task_member` VALUES (98, 'lcxa0u8srgkq46fy7pw2b3o5', 0, 'y680trgedcavbhnz24u7i5m3', '2018-12-28 23:19:06', 0);
INSERT INTO `pear_task_member` VALUES (99, 'lcxa0u8srgkq46fy7pw2b3o5', 0, '6v7be19pwman2fird04gqu53', '2018-12-28 23:19:06', 1);
INSERT INTO `pear_task_member` VALUES (100, 'sora9u5ti4zlxhy3men12vb8', 1, '6v7be19pwman2fird04gqu53', '2018-12-28 23:19:18', 1);
INSERT INTO `pear_task_member` VALUES (101, 'rat4seg68kpi0yqv793fux1l', 1, '6v7be19pwman2fird04gqu53', '2018-12-28 23:19:20', 1);
INSERT INTO `pear_task_member` VALUES (102, 'aryd8zjbh3f20oln4gekv57x', 0, '6v7be19pwman2fird04gqu53', '2018-12-28 23:19:30', 1);
INSERT INTO `pear_task_member` VALUES (106, 'oz2xwp8v0niahdc7lekjtsrg', 1, '6v7be19pwman2fird04gqu53', '2018-12-29 11:02:39', 1);
INSERT INTO `pear_task_member` VALUES (107, 'v2kr731dihezctslmx9agb5w', 0, 'kqdcn2w40p58r31zyo6efjib', '2018-12-29 11:02:49', 0);
INSERT INTO `pear_task_member` VALUES (108, 'v2kr731dihezctslmx9agb5w', 0, '6v7be19pwman2fird04gqu53', '2018-12-29 11:02:49', 1);
INSERT INTO `pear_task_member` VALUES (109, '1vqt5zg4shbkum2dc8jxow7f', 0, 'y680trgedcavbhnz24u7i5m3', '2018-12-29 12:10:16', 0);
INSERT INTO `pear_task_member` VALUES (110, '1vqt5zg4shbkum2dc8jxow7f', 0, '6v7be19pwman2fird04gqu53', '2018-12-29 12:10:16', 1);
INSERT INTO `pear_task_member` VALUES (111, '2hg0yfa9jpxz6q58ckrdol1u', 0, 'y680trgedcavbhnz24u7i5m3', '2018-12-29 12:11:40', 0);
INSERT INTO `pear_task_member` VALUES (112, '2hg0yfa9jpxz6q58ckrdol1u', 0, '6v7be19pwman2fird04gqu53', '2018-12-29 12:11:40', 1);
INSERT INTO `pear_task_member` VALUES (113, 'bi5ajpmxfsk9rwdg4l32yv1n', 0, 'y680trgedcavbhnz24u7i5m3', '2018-12-29 12:11:57', 0);
INSERT INTO `pear_task_member` VALUES (114, 'bi5ajpmxfsk9rwdg4l32yv1n', 0, '6v7be19pwman2fird04gqu53', '2018-12-29 12:11:57', 1);
INSERT INTO `pear_task_member` VALUES (115, 'dmbtgy3phi2sz7j89q10xcoa', 0, 'y680trgedcavbhnz24u7i5m3', '2018-12-29 12:12:32', 0);
INSERT INTO `pear_task_member` VALUES (116, 'dmbtgy3phi2sz7j89q10xcoa', 0, '6v7be19pwman2fird04gqu53', '2018-12-29 12:12:32', 1);
INSERT INTO `pear_task_member` VALUES (117, 'ywiahqcb50rkem376js9nflv', 1, '6v7be19pwman2fird04gqu53', '2018-12-29 12:12:41', 1);
INSERT INTO `pear_task_member` VALUES (118, 'xebf08p2uc9sj6mkr5714lat', 1, '6v7be19pwman2fird04gqu53', '2018-12-29 12:12:42', 1);
INSERT INTO `pear_task_member` VALUES (119, 'p5axvq94lr7enmhb83o2zfks', 1, '6v7be19pwman2fird04gqu53', '2018-12-29 12:12:44', 1);
INSERT INTO `pear_task_member` VALUES (120, 'lert5uyi790q2jfpbmzgak1o', 1, '6v7be19pwman2fird04gqu53', '2018-12-29 12:14:21', 1);
INSERT INTO `pear_task_member` VALUES (121, '25rzhoykix6pajsw9cgm1408', 1, '6v7be19pwman2fird04gqu53', '2018-12-29 12:14:30', 1);
INSERT INTO `pear_task_member` VALUES (122, 'cmrdn8soz4g26fy0qa3ib7te', 1, '6v7be19pwman2fird04gqu53', '2018-12-29 12:15:33', 1);
INSERT INTO `pear_task_member` VALUES (123, 'qfakryig3ztpv5uw6e2obx08', 1, '6v7be19pwman2fird04gqu53', '2018-12-29 12:16:19', 1);
INSERT INTO `pear_task_member` VALUES (124, 'e16tvkg4uoixnz9hjaf5l3wr', 1, '6v7be19pwman2fird04gqu53', '2018-12-29 12:22:17', 1);
INSERT INTO `pear_task_member` VALUES (125, 'f35oyrln286s7p4u9vmeghdw', 1, '6v7be19pwman2fird04gqu53', '2018-12-29 12:22:18', 1);
INSERT INTO `pear_task_member` VALUES (126, 'yqwe2aiupvg5zj1so4krm86l', 1, '6v7be19pwman2fird04gqu53', '2018-12-29 12:22:19', 1);
INSERT INTO `pear_task_member` VALUES (127, 'yhs4xb7g3vu9pnwfq5l1zioa', 1, '6v7be19pwman2fird04gqu53', '2018-12-29 12:22:22', 1);
INSERT INTO `pear_task_member` VALUES (128, 'jo3vbswk8ze57filmcptun2g', 1, '6v7be19pwman2fird04gqu53', '2018-12-29 12:22:52', 1);
INSERT INTO `pear_task_member` VALUES (129, '35i8ptd1fs9hrbk0glv47ycj', 1, '6v7be19pwman2fird04gqu53', '2018-12-29 12:22:53', 1);
INSERT INTO `pear_task_member` VALUES (130, 'pn3dmjavhrc1bewgi4yz25x9', 1, '6v7be19pwman2fird04gqu53', '2018-12-29 12:22:54', 1);
INSERT INTO `pear_task_member` VALUES (131, 'p5r8a4gwfxmn9sqit2jvkl71', 1, '6v7be19pwman2fird04gqu53', '2018-12-29 12:22:55', 1);
INSERT INTO `pear_task_member` VALUES (132, 'aenxk82rgwm5qcsuo0b7hi4f', 1, '6v7be19pwman2fird04gqu53', '2018-12-29 12:23:00', 1);
INSERT INTO `pear_task_member` VALUES (133, 'vf8xtpclba3od21kmih5us9q', 1, '6v7be19pwman2fird04gqu53', '2018-12-29 12:24:25', 1);
INSERT INTO `pear_task_member` VALUES (134, '2ohuv1jm3abrs8ldni5p9z06', 1, '6v7be19pwman2fird04gqu53', '2018-12-29 12:24:26', 1);
INSERT INTO `pear_task_member` VALUES (135, 'wamzl34n6jfrhiyoe09v2ktb', 1, '6v7be19pwman2fird04gqu53', '2018-12-29 12:29:39', 1);
INSERT INTO `pear_task_member` VALUES (136, 'rgshi61c4xol5ue9f2n8m3bd', 1, '6v7be19pwman2fird04gqu53', '2018-12-29 12:29:40', 1);
INSERT INTO `pear_task_member` VALUES (137, 'kny3xf7o41rli9s0pwjmhdqc', 1, '6v7be19pwman2fird04gqu53', '2018-12-29 12:29:41', 1);
INSERT INTO `pear_task_member` VALUES (138, 'y2zos3hg9058alwet46xmukp', 1, '6v7be19pwman2fird04gqu53', '2018-12-29 12:29:42', 1);
INSERT INTO `pear_task_member` VALUES (139, 'wqu7verc5i4p19h0y32x6tmo', 1, '6v7be19pwman2fird04gqu53', '2018-12-29 12:29:43', 1);
INSERT INTO `pear_task_member` VALUES (140, '0h8mt7sw1ki5fuxv2y6d3jag', 1, '6v7be19pwman2fird04gqu53', '2018-12-29 12:29:44', 1);
INSERT INTO `pear_task_member` VALUES (141, '1hcrmvgfjtu5qnadl869bkxo', 1, '6v7be19pwman2fird04gqu53', '2018-12-29 12:29:46', 1);
INSERT INTO `pear_task_member` VALUES (142, 'puj84l5av3f0e7k9oyw2zqcr', 1, '6v7be19pwman2fird04gqu53', '2018-12-29 12:29:54', 1);
INSERT INTO `pear_task_member` VALUES (143, 'jftz4y5is1hwrlmac07nd8q6', 1, '6v7be19pwman2fird04gqu53', '2018-12-29 12:29:56', 1);
INSERT INTO `pear_task_member` VALUES (144, '4fua38vpqgk706csx2lb9etj', 1, '6v7be19pwman2fird04gqu53', '2018-12-29 13:05:03', 1);
INSERT INTO `pear_task_member` VALUES (146, 's5bxrym2p8qtjch1i6gnkvaw', 1, '6v7be19pwman2fird04gqu53', '2018-12-29 16:08:33', 1);
INSERT INTO `pear_task_member` VALUES (147, 'aut9wrz1pn0elf5s47ivx26o', 0, '6v7be19pwman2fird04gqu53', '2018-12-29 21:47:17', 0);
INSERT INTO `pear_task_member` VALUES (148, 'w80m92aopfbcru6s5qe7z3ti', 1, '6v7be19pwman2fird04gqu53', '2018-12-30 10:24:40', 1);
INSERT INTO `pear_task_member` VALUES (149, 'wrjgk84t2beam0yvxs61qinu', 1, '6v7be19pwman2fird04gqu53', '2018-12-30 10:24:42', 1);
INSERT INTO `pear_task_member` VALUES (150, 'n9pe164krv8zghofilw750jq', 1, '6v7be19pwman2fird04gqu53', '2018-12-30 15:38:03', 1);
INSERT INTO `pear_task_member` VALUES (151, 'oq7d3wbklenf12pgvuxhimr8', 1, '6v7be19pwman2fird04gqu53', '2018-12-30 15:39:15', 1);
INSERT INTO `pear_task_member` VALUES (153, 'mv4usefb06dxv8ez2spkl223', 0, '6v7be19pwman2fird04gqu53', '2018-12-31 10:49:34', 0);
INSERT INTO `pear_task_member` VALUES (154, 'mv4usefb06dxv8ez2spkl223', 0, 'y680trgedcavbhnz24u7i5m3', '2018-12-31 10:49:34', 0);
INSERT INTO `pear_task_member` VALUES (155, 'qscug70y98zpk6edbnf3livr', 1, '6v7be19pwman2fird04gqu53', '2018-12-31 15:04:43', 1);
INSERT INTO `pear_task_member` VALUES (156, 'rzpu5cxl63fvb2y8gwdnsjqk', 1, '6v7be19pwman2fird04gqu53', '2018-12-31 15:04:44', 1);
INSERT INTO `pear_task_member` VALUES (157, 'ozi8awms1lpcbde4fuq5ktgj', 1, '6v7be19pwman2fird04gqu53', '2018-12-31 15:04:45', 1);
INSERT INTO `pear_task_member` VALUES (158, 'xejt6431q8ly97bkid5z2pun', 0, '6v7be19pwman2fird04gqu53', '2018-12-31 15:04:46', 1);
INSERT INTO `pear_task_member` VALUES (159, 'zkqb6if5ogdts27lx13r4yju', 1, '6v7be19pwman2fird04gqu53', '2018-12-31 15:04:47', 1);
INSERT INTO `pear_task_member` VALUES (160, '9wsohy8jgapl6x2iutbm7k34', 0, '6v7be19pwman2fird04gqu53', '2018-12-31 15:04:49', 1);
INSERT INTO `pear_task_member` VALUES (161, 'xejt6431q8ly97bkid5z2pun', 1, 'y680trgedcavbhnz24u7i5m3', '2018-12-31 15:23:08', 0);
INSERT INTO `pear_task_member` VALUES (162, 'q9y6ksvtifwpuhna0e32jgm1', 1, 'kqdcn2w40p58r31zyo6efjib', '2019-01-03 10:46:04', 1);
INSERT INTO `pear_task_member` VALUES (163, 'wyklgmhpt5qr47x3zsf9nibj', 0, 'kqdcn2w40p58r31zyo6efjib', '2019-01-03 10:46:14', 1);
INSERT INTO `pear_task_member` VALUES (164, 'wyklgmhpt5qr47x3zsf9nibj', 1, '6v7be19pwman2fird04gqu53', '2019-01-03 10:51:44', 0);
INSERT INTO `pear_task_member` VALUES (165, 'm6cloqrbh7tf0wg1jsvp9nay', 0, 'y680trgedcavbhnz24u7i5m3', '2019-01-03 11:00:15', 0);
INSERT INTO `pear_task_member` VALUES (166, 'm6cloqrbh7tf0wg1jsvp9nay', 0, 'kqdcn2w40p58r31zyo6efjib', '2019-01-03 11:00:15', 1);
INSERT INTO `pear_task_member` VALUES (167, 'p1aujdigrlxky76h8cs3z4w0', 1, '6v7be19pwman2fird04gqu53', '2019-01-03 22:25:30', 1);
INSERT INTO `pear_task_member` VALUES (168, '2bn918l6ejyzousa73dkpgci', 1, '6v7be19pwman2fird04gqu53', '2019-01-03 22:25:37', 1);
INSERT INTO `pear_task_member` VALUES (169, '3qz5hfsin69xt8cgbd70lkew', 1, '6v7be19pwman2fird04gqu53', '2019-01-03 22:25:45', 1);
INSERT INTO `pear_task_member` VALUES (170, 'xkic58d20srnu9jm7ohqw14f', 1, '6v7be19pwman2fird04gqu53', '2019-01-03 22:25:53', 1);
INSERT INTO `pear_task_member` VALUES (171, '6hj43ueim2bk187sqzcoy59v', 1, '6v7be19pwman2fird04gqu53', '2019-01-03 22:26:01', 1);
INSERT INTO `pear_task_member` VALUES (172, 'twb8f52jasn9vry6iko0dqg4', 0, '6v7be19pwman2fird04gqu53', '2019-01-03 22:26:09', 1);
INSERT INTO `pear_task_member` VALUES (173, 'gjmotpbrwva079ukde4izn38', 1, '6v7be19pwman2fird04gqu53', '2019-01-03 22:26:16', 1);
INSERT INTO `pear_task_member` VALUES (174, 'uwq87z2f0hnvrl6o9gtcb3iy', 0, '6v7be19pwman2fird04gqu53', '2019-01-03 22:26:21', 1);
INSERT INTO `pear_task_member` VALUES (175, 'qug5e4alndm7930ipxwyvc2h', 1, '6v7be19pwman2fird04gqu53', '2019-01-03 22:27:04', 1);
INSERT INTO `pear_task_member` VALUES (176, 'yctbsv81x6dmahkf7ei5o4r9', 0, '6v7be19pwman2fird04gqu53', '2019-01-03 22:27:17', 1);
INSERT INTO `pear_task_member` VALUES (177, 'm7u8fdp41cwrtkjxyzq2ion3', 0, '6v7be19pwman2fird04gqu53', '2019-01-03 22:27:30', 1);
INSERT INTO `pear_task_member` VALUES (178, 'jo0i8fq2579kbdgsmcw1nev4', 1, '6v7be19pwman2fird04gqu53', '2019-01-03 22:27:36', 1);
INSERT INTO `pear_task_member` VALUES (179, 'owrs04m3e2klj8uqac6tiy17', 0, '6v7be19pwman2fird04gqu53', '2019-01-03 22:27:54', 1);
INSERT INTO `pear_task_member` VALUES (180, 'g15scwqm9zxroy7p8bvjt632', 0, '6v7be19pwman2fird04gqu53s', '2019-01-03 22:28:21', 1);
INSERT INTO `pear_task_member` VALUES (181, '0a84xkg12enqjml7rz6dbifw', 0, '6v7be19pwman2fird04gqu53', '2019-01-03 22:28:25', 1);
INSERT INTO `pear_task_member` VALUES (182, 'fax4gez2jlk15tvsu3dc6p98', 1, '6v7be19pwman2fird04gqu53', '2019-01-03 22:28:29', 1);
INSERT INTO `pear_task_member` VALUES (183, 'zv4hx1ugpn98be5skc3wym72', 1, '6v7be19pwman2fird04gqu53', '2019-01-03 22:28:33', 1);
INSERT INTO `pear_task_member` VALUES (184, 'jiy25eobh1cnp7ruvg9d0m6s', 0, '6v7be19pwman2fird04gqu53', '2019-01-03 22:28:39', 1);
INSERT INTO `pear_task_member` VALUES (185, '4pv9brqnm0cigwu5f3zeyxdk', 1, '6v7be19pwman2fird04gqu53', '2019-01-03 22:28:43', 1);
INSERT INTO `pear_task_member` VALUES (186, 'td1qznl9ms65gbcfej0k4vup', 0, '6v7be19pwman2fird04gqu53', '2019-01-03 22:28:50', 1);
INSERT INTO `pear_task_member` VALUES (187, 'fkrsvpzmj8xyo045hiugqt92', 1, '6v7be19pwman2fird04gqu53', '2019-01-03 22:28:56', 1);
INSERT INTO `pear_task_member` VALUES (188, '0b6wlc3754fr8gdvupx9aoys', 1, '6v7be19pwman2fird04gqu53', '2019-01-03 22:29:02', 1);
INSERT INTO `pear_task_member` VALUES (189, 'bl1t7xjwpi9m2aocnsz83fk6', 0, '6v7be19pwman2fird04gqu53', '2019-01-03 22:29:18', 1);
INSERT INTO `pear_task_member` VALUES (190, 'hxntygarp3094c7w1856iujm', 1, '6v7be19pwman2fird04gqu53', '2019-01-03 22:29:24', 1);
INSERT INTO `pear_task_member` VALUES (191, 'bl1t7xjwpi9m2aocnsz83fk6', 1, 'y680trgedcavbhnz24u7i5m3', '2019-01-03 22:29:42', 0);
INSERT INTO `pear_task_member` VALUES (192, '0a84xkg12enqjml7rz6dbifw', 1, 'kqdcn2w40p58r31zyo6efjib', '2019-01-03 22:30:00', 0);
INSERT INTO `pear_task_member` VALUES (193, 'td1qznl9ms65gbcfej0k4vup', 1, 'y680trgedcavbhnz24u7i5m3', '2019-01-03 22:30:15', 0);
INSERT INTO `pear_task_member` VALUES (194, 'uwq87z2f0hnvrl6o9gtcb3iy', 1, 'y680trgedcavbhnz24u7i5m3', '2019-01-03 22:30:27', 0);
INSERT INTO `pear_task_member` VALUES (195, '3qz5hfsin69xt8cgbd70lkew', 0, 'kqdcn2w40p58r31zyo6efjib', '2019-01-03 22:30:31', 0);
INSERT INTO `pear_task_member` VALUES (197, 'owrs04m3e2klj8uqac6tiy17', 1, 'y680trgedcavbhnz24u7i5m3', '2019-01-03 22:30:46', 0);
INSERT INTO `pear_task_member` VALUES (198, '6hj43ueim2bk187sqzcoy59v', 0, 'y680trgedcavbhnz24u7i5m3', '2019-01-04 08:57:04', 0);
INSERT INTO `pear_task_member` VALUES (199, 'gk8ipqm5406br7cwd9l1zefs', 1, 'y680trgedcavbhnz24u7i5m3', '2019-01-04 09:09:29', 1);
INSERT INTO `pear_task_member` VALUES (200, 'm7u8fdp41cwrtkjxyzq2ion3', 1, 'kqdcn2w40p58r31zyo6efjib', '2019-01-04 09:17:51', 0);
INSERT INTO `pear_task_member` VALUES (201, 'o61b3s24exmcy8njkparwthd', 0, '6v7be19pwman2fird04gqu53', '2019-01-04 09:18:18', 0);
INSERT INTO `pear_task_member` VALUES (202, 'o61b3s24exmcy8njkparwthd', 0, 'kqdcn2w40p58r31zyo6efjib', '2019-01-04 09:18:18', 1);
INSERT INTO `pear_task_member` VALUES (203, 'orycwlhf7n2qx1pta038dzjk', 0, '6v7be19pwman2fird04gqu53', '2019-01-04 09:18:24', 0);
INSERT INTO `pear_task_member` VALUES (204, 'orycwlhf7n2qx1pta038dzjk', 0, 'kqdcn2w40p58r31zyo6efjib', '2019-01-04 09:18:24', 1);
INSERT INTO `pear_task_member` VALUES (205, 'yctbsv81x6dmahkf7ei5o4r9', 1, 'kqdcn2w40p58r31zyo6efjib', '2019-01-04 09:18:50', 0);
INSERT INTO `pear_task_member` VALUES (206, 'p1aujdigrlxky76h8cs3z4w0', 0, 'y680trgedcavbhnz24u7i5m3', '2019-01-04 09:19:58', 0);
INSERT INTO `pear_task_member` VALUES (207, 'up6hn9bd34c8mglwaj1ytefz', 0, '6v7be19pwman2fird04gqu53', '2019-01-04 21:17:13', 1);
INSERT INTO `pear_task_member` VALUES (208, 'krj4p7ix2cf605vyltmudq1e', 0, '6v7be19pwman2fird04gqu53', '2019-01-04 21:17:19', 1);
INSERT INTO `pear_task_member` VALUES (209, '1g3vc8tkyla20fp5rdhxe7mo', 0, 'y680trgedcavbhnz24u7i5m3', '2019-01-04 21:17:46', 0);
INSERT INTO `pear_task_member` VALUES (210, '1g3vc8tkyla20fp5rdhxe7mo', 0, '6v7be19pwman2fird04gqu53', '2019-01-04 21:17:46', 1);
INSERT INTO `pear_task_member` VALUES (211, 'nqrleu2c90zsdaj1yph4m8bt', 0, 'kqdcn2w40p58r31zyo6efjib', '2019-01-04 21:18:25', 0);
INSERT INTO `pear_task_member` VALUES (212, 'nqrleu2c90zsdaj1yph4m8bt', 0, '6v7be19pwman2fird04gqu53', '2019-01-04 21:18:25', 1);
INSERT INTO `pear_task_member` VALUES (213, 'mix3cg2eh1u60fknd7yz9v5t', 0, 'y680trgedcavbhnz24u7i5m3', '2019-01-04 21:18:37', 0);
INSERT INTO `pear_task_member` VALUES (214, 'mix3cg2eh1u60fknd7yz9v5t', 0, '6v7be19pwman2fird04gqu53', '2019-01-04 21:18:37', 1);
INSERT INTO `pear_task_member` VALUES (215, 'dckxz1vpujtafshgr20mwo7e', 0, 'y680trgedcavbhnz24u7i5m3', '2019-01-04 21:18:45', 0);
INSERT INTO `pear_task_member` VALUES (216, 'dckxz1vpujtafshgr20mwo7e', 0, '6v7be19pwman2fird04gqu53', '2019-01-04 21:18:45', 1);
INSERT INTO `pear_task_member` VALUES (217, 'fd1avskez2q43w80xhb7ypc9', 0, 'y680trgedcavbhnz24u7i5m3', '2019-01-04 21:18:53', 0);
INSERT INTO `pear_task_member` VALUES (218, 'fd1avskez2q43w80xhb7ypc9', 0, '6v7be19pwman2fird04gqu53', '2019-01-04 21:18:53', 1);
INSERT INTO `pear_task_member` VALUES (219, 'as2y4r6mwxuhgvncop3f8z90', 0, '6v7be19pwman2fird04gqu53', '2019-01-04 21:19:01', 1);
INSERT INTO `pear_task_member` VALUES (220, '8zj3vpx0b7qud24ylfgces1m', 0, 'kqdcn2w40p58r31zyo6efjib', '2019-01-04 21:19:08', 0);
INSERT INTO `pear_task_member` VALUES (221, '8zj3vpx0b7qud24ylfgces1m', 0, '6v7be19pwman2fird04gqu53', '2019-01-04 21:19:08', 1);
INSERT INTO `pear_task_member` VALUES (222, 'hcrdvbuzwgojst2f0p134qxi', 0, 'kqdcn2w40p58r31zyo6efjib', '2019-01-04 21:19:18', 0);
INSERT INTO `pear_task_member` VALUES (223, 'hcrdvbuzwgojst2f0p134qxi', 0, '6v7be19pwman2fird04gqu53', '2019-01-04 21:19:18', 1);
INSERT INTO `pear_task_member` VALUES (224, 'lmognshqz21dbewcu9a3rx87', 0, 'kqdcn2w40p58r31zyo6efjib', '2019-01-04 21:19:37', 0);
INSERT INTO `pear_task_member` VALUES (225, 'lmognshqz21dbewcu9a3rx87', 0, '6v7be19pwman2fird04gqu53', '2019-01-04 21:19:37', 1);
INSERT INTO `pear_task_member` VALUES (226, 'n6ulc7ebxpqahi50dy9k1sgf', 0, '6v7be19pwman2fird04gqu53', '2019-01-04 21:19:51', 1);
INSERT INTO `pear_task_member` VALUES (227, 'rqjng1kfcp4wyiamt6o23zbu', 0, 'y680trgedcavbhnz24u7i5m3', '2019-01-04 21:19:57', 0);
INSERT INTO `pear_task_member` VALUES (228, 'rqjng1kfcp4wyiamt6o23zbu', 0, '6v7be19pwman2fird04gqu53', '2019-01-04 21:19:57', 1);
INSERT INTO `pear_task_member` VALUES (229, 'qsz65fvgi8hyx3e7bn14o9wm', 0, 'kqdcn2w40p58r31zyo6efjib', '2019-01-04 21:20:05', 0);
INSERT INTO `pear_task_member` VALUES (230, 'qsz65fvgi8hyx3e7bn14o9wm', 0, '6v7be19pwman2fird04gqu53', '2019-01-04 21:20:05', 1);
INSERT INTO `pear_task_member` VALUES (231, 'byiuxhn0v6sod4zap1t2fclr', 0, 'kqdcn2w40p58r31zyo6efjib', '2019-01-04 21:20:12', 0);
INSERT INTO `pear_task_member` VALUES (232, 'byiuxhn0v6sod4zap1t2fclr', 0, '6v7be19pwman2fird04gqu53', '2019-01-04 21:20:12', 1);
INSERT INTO `pear_task_member` VALUES (233, 'jxd3rpmay6qonsk1i8wg5e9u', 0, 'kqdcn2w40p58r31zyo6efjib', '2019-01-04 21:20:27', 0);
INSERT INTO `pear_task_member` VALUES (234, 'jxd3rpmay6qonsk1i8wg5e9u', 0, '6v7be19pwman2fird04gqu53', '2019-01-04 21:20:27', 1);
INSERT INTO `pear_task_member` VALUES (235, 'vmzeciodgbfp7ysu38tq10kj', 0, '6v7be19pwman2fird04gqu53', '2019-01-04 21:20:33', 1);
INSERT INTO `pear_task_member` VALUES (236, '6cagd725tifonvw0qphe9zsb', 0, '6v7be19pwman2fird04gqu53', '2019-01-04 21:20:45', 1);
INSERT INTO `pear_task_member` VALUES (237, 'xu3jgyow2s9f1km0rctqin4v', 0, 'y680trgedcavbhnz24u7i5m3', '2019-01-04 21:20:54', 0);
INSERT INTO `pear_task_member` VALUES (238, 'xu3jgyow2s9f1km0rctqin4v', 0, '6v7be19pwman2fird04gqu53', '2019-01-04 21:20:54', 1);
INSERT INTO `pear_task_member` VALUES (239, 'k3g07m1qyctvbp95siohju6f', 0, 'y680trgedcavbhnz24u7i5m3', '2019-01-04 21:21:12', 0);
INSERT INTO `pear_task_member` VALUES (240, 'k3g07m1qyctvbp95siohju6f', 0, '6v7be19pwman2fird04gqu53', '2019-01-04 21:21:12', 1);
INSERT INTO `pear_task_member` VALUES (241, 'oh5wpj9kd8e6ltusxq271ma3', 0, 'y680trgedcavbhnz24u7i5m3', '2019-01-04 21:21:18', 0);
INSERT INTO `pear_task_member` VALUES (242, 'oh5wpj9kd8e6ltusxq271ma3', 0, '6v7be19pwman2fird04gqu53', '2019-01-04 21:21:18', 1);
INSERT INTO `pear_task_member` VALUES (243, 'akdwslbtp3z82xecui0y4ovq', 0, 'y680trgedcavbhnz24u7i5m3', '2019-01-04 21:21:25', 0);
INSERT INTO `pear_task_member` VALUES (244, 'akdwslbtp3z82xecui0y4ovq', 0, '6v7be19pwman2fird04gqu53', '2019-01-04 21:21:25', 1);
INSERT INTO `pear_task_member` VALUES (245, 'hayfr6vl398nq5exgszobu2j', 0, '6v7be19pwman2fird04gqu53', '2019-01-04 21:21:31', 1);
INSERT INTO `pear_task_member` VALUES (246, 'mf80iu15kepavbg2r9ldcjsh', 0, 'kqdcn2w40p58r31zyo6efjib', '2019-01-04 21:21:42', 0);
INSERT INTO `pear_task_member` VALUES (247, 'mf80iu15kepavbg2r9ldcjsh', 0, '6v7be19pwman2fird04gqu53', '2019-01-04 21:21:42', 1);
INSERT INTO `pear_task_member` VALUES (248, 'nzy71f5i6g0skwau4lrj3d8b', 0, 'kqdcn2w40p58r31zyo6efjib', '2019-01-04 21:22:08', 0);
INSERT INTO `pear_task_member` VALUES (249, 'nzy71f5i6g0skwau4lrj3d8b', 0, '6v7be19pwman2fird04gqu53', '2019-01-04 21:22:08', 1);
INSERT INTO `pear_task_member` VALUES (250, '4cug3e5rodalq9x81ywht0zn', 0, 'kqdcn2w40p58r31zyo6efjib', '2019-01-04 21:22:20', 0);
INSERT INTO `pear_task_member` VALUES (251, '4cug3e5rodalq9x81ywht0zn', 0, '6v7be19pwman2fird04gqu53', '2019-01-04 21:22:20', 1);
INSERT INTO `pear_task_member` VALUES (252, '92fow0le47htb6xkv5ynzuri', 0, 'kqdcn2w40p58r31zyo6efjib', '2019-01-04 21:22:24', 0);
INSERT INTO `pear_task_member` VALUES (253, '92fow0le47htb6xkv5ynzuri', 0, '6v7be19pwman2fird04gqu53', '2019-01-04 21:22:24', 1);
INSERT INTO `pear_task_member` VALUES (254, '6ky18i9cg0eqvfzn2th3ux5l', 0, '6v7be19pwman2fird04gqu53', '2019-01-04 21:22:34', 1);
INSERT INTO `pear_task_member` VALUES (255, 'zj6skt9orn748gh5mvb2ueif', 0, '6v7be19pwman2fird04gqu53', '2019-01-04 21:22:40', 1);
INSERT INTO `pear_task_member` VALUES (256, 'a75dcqx2sjivokmg49yh380l', 1, 'y680trgedcavbhnz24u7i5m3', '2019-01-04 21:30:13', 1);
INSERT INTO `pear_task_member` VALUES (257, '7ns924ofulpjxkgq06y3bm5r', 1, 'y680trgedcavbhnz24u7i5m3', '2019-01-04 21:30:19', 1);
INSERT INTO `pear_task_member` VALUES (258, 'up6hn9bd34c8mglwaj1ytefz', 1, 'y680trgedcavbhnz24u7i5m3', '2019-01-04 21:38:02', 0);
INSERT INTO `pear_task_member` VALUES (259, 'as2y4r6mwxuhgvncop3f8z90', 1, 'y680trgedcavbhnz24u7i5m3', '2019-01-04 21:38:13', 0);
INSERT INTO `pear_task_member` VALUES (260, 'vmzeciodgbfp7ysu38tq10kj', 1, 'y680trgedcavbhnz24u7i5m3', '2019-01-04 21:38:25', 0);
INSERT INTO `pear_task_member` VALUES (261, '6cagd725tifonvw0qphe9zsb', 1, 'kqdcn2w40p58r31zyo6efjib', '2019-01-04 21:38:30', 0);
INSERT INTO `pear_task_member` VALUES (262, 'zj6skt9orn748gh5mvb2ueif', 1, 'y680trgedcavbhnz24u7i5m3', '2019-01-04 21:38:45', 0);
INSERT INTO `pear_task_member` VALUES (263, '6hj43ueim2bk187sqzcoy59v', 0, 'kqdcn2w40p58r31zyo6efjib', '2019-01-22 09:29:26', 0);
INSERT INTO `pear_task_member` VALUES (264, 'xkic58d20srnu9jm7ohqw14f', 0, 'y680trgedcavbhnz24u7i5m3', '2019-01-22 11:17:25', 0);
INSERT INTO `pear_task_member` VALUES (265, 'g15scwqm9zxroy7p8bvjt632', 1, 'y680trgedcavbhnz24u7i5m3', '2019-01-22 15:33:47', 0);
INSERT INTO `pear_task_member` VALUES (266, 'cz7fxnibs2v8rq90h6wo3a4l', 1, '6v7be19pwman2fird04gqu53', '2019-01-24 15:22:47', 1);
INSERT INTO `pear_task_member` VALUES (267, 'vnjthy40w5gim1xflcp3z8rs', 1, '6v7be19pwman2fird04gqu53', '2019-01-24 15:35:46', 1);
INSERT INTO `pear_task_member` VALUES (268, 'jq3xc7uklh1tv9g6swmep8yn', 1, '6v7be19pwman2fird04gqu53', '2019-01-24 15:35:54', 1);
INSERT INTO `pear_task_member` VALUES (269, '64rmkd08wonsjx39fg71t5li', 1, '6v7be19pwman2fird04gqu53', '2019-01-24 15:36:16', 1);
INSERT INTO `pear_task_member` VALUES (270, 'xc2p9lign6zmvwte7jhu8byd', 1, '6v7be19pwman2fird04gqu53', '2019-01-24 15:59:56', 1);

-- ----------------------------
-- Table structure for pear_task_stages
-- ----------------------------
DROP TABLE IF EXISTS `pear_task_stages`;
CREATE TABLE `pear_task_stages`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '类型名称',
  `project_code` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '项目id',
  `sort` int(11) NULL DEFAULT 0 COMMENT '排序',
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '备注',
  `create_time` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建时间',
  `code` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '编号',
  `deleted` tinyint(1) NULL DEFAULT 0 COMMENT '删除标记',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 72 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '任务列表表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of pear_task_stages
-- ----------------------------
INSERT INTO `pear_task_stages` VALUES (33, '修复', 'mo4uqwfb06dxv8ez2spkl3rg', 33, NULL, '2018-12-25 07:20:36', '7z8tgb6xevy2aj9nui5fk0w1', 0);
INSERT INTO `pear_task_stages` VALUES (34, '重构', 'mo4uqwfb06dxv8ez2spkl3rg', 34, NULL, '2018-12-25 07:20:36', 'g0yw3r54qahbk7lets6fv2on', 0);
INSERT INTO `pear_task_stages` VALUES (35, '升级', 'mo4uqwfb06dxv8ez2spkl3rg', 35, NULL, '2018-12-25 07:20:36', 'psemnf3ugo89vc5r2hkxid1t', 0);
INSERT INTO `pear_task_stages` VALUES (36, '优化', 'mo4uqwfb06dxv8ez2spkl3rg', 37, NULL, '2018-12-25 07:20:36', 'p56enm7zck4id2rb0tx9lguh', 0);
INSERT INTO `pear_task_stages` VALUES (37, '新增', 'mo4uqwfb06dxv8ez2spkl3rg', 36, NULL, '2018-12-25 07:20:36', 'jvyswuxz34qk2cpt9o7ldb60', 0);
INSERT INTO `pear_task_stages` VALUES (38, '协议签订', 'ibag9hw3o1tusd5qlpxrk782', 0, NULL, '2018-12-26 08:35:47', 'oijw2ds86lf7zp1chvq03r5e', 0);
INSERT INTO `pear_task_stages` VALUES (39, '图纸设计', 'ibag9hw3o1tusd5qlpxrk782', 0, NULL, '2018-12-26 08:35:53', 'ipzyscgfo5l1qvah2xm4638t', 0);
INSERT INTO `pear_task_stages` VALUES (40, '评审及打样', 'ibag9hw3o1tusd5qlpxrk782', 0, NULL, '2018-12-26 08:36:21', '3uz8afjkxnogwivd9s0lqp7y', 0);
INSERT INTO `pear_task_stages` VALUES (41, '构件采购', 'ibag9hw3o1tusd5qlpxrk782', 0, NULL, '2018-12-26 08:36:34', 'f6dp4ur1zc2omswtyhnbixe3', 0);
INSERT INTO `pear_task_stages` VALUES (42, '制造安装', 'ibag9hw3o1tusd5qlpxrk782', 0, NULL, '2018-12-26 08:36:40', 'imltk4y2se1rbzafohw8x5p6', 0);
INSERT INTO `pear_task_stages` VALUES (43, '内部检验', 'ibag9hw3o1tusd5qlpxrk782', 0, NULL, '2018-12-26 08:36:45', 'miwt9bd6saxge2pvn31h0zky', 0);
INSERT INTO `pear_task_stages` VALUES (44, '测试', 'ibag9hw3o1tusd5qlpxrk782', 0, NULL, '2018-12-26 08:36:52', 'ao18rjcszwh2bm6inypxgkv0', 0);
INSERT INTO `pear_task_stages` VALUES (48, '产品计划', 'p94ckbwv5lyxt2rhzeam3s86', 0, NULL, '2019-01-02 11:17:27', 'xt4ne81fu9jgayw2szokr5q3', 0);
INSERT INTO `pear_task_stages` VALUES (49, '即将发布', 'p94ckbwv5lyxt2rhzeam3s86', 1, NULL, '2019-01-02 11:17:27', 'c9ro6jxpl25wbmuvfy840kqe', 0);
INSERT INTO `pear_task_stages` VALUES (50, '测试', 'p94ckbwv5lyxt2rhzeam3s86', 2, NULL, '2019-01-02 11:17:27', 'inxmfhz8kvqes1w39a2oc5j6', 0);
INSERT INTO `pear_task_stages` VALUES (51, '准备发布', 'p94ckbwv5lyxt2rhzeam3s86', 3, NULL, '2019-01-02 11:17:27', '2zm1n3g8ikaseow5cfp9h7dx', 0);
INSERT INTO `pear_task_stages` VALUES (52, '发布成功', 'p94ckbwv5lyxt2rhzeam3s86', 4, NULL, '2019-01-02 11:17:27', '3jdozmqf4tcakyixgn750ule', 0);
INSERT INTO `pear_task_stages` VALUES (53, '产品计划', '8ulzfth64cd0k1x5peivowm2', 0, NULL, '2019-01-03 09:15:11', 'pfi2ltmjhxuda90ncsgb5vwo', 0);
INSERT INTO `pear_task_stages` VALUES (54, '即将发布', '8ulzfth64cd0k1x5peivowm2', 2, NULL, '2019-01-03 09:15:11', 'ht0gfnevaq7kp3ldx16i82yj', 0);
INSERT INTO `pear_task_stages` VALUES (55, '测试', '8ulzfth64cd0k1x5peivowm2', 1, NULL, '2019-01-03 09:15:11', 'dot8li21nx437ypksjav59wf', 0);
INSERT INTO `pear_task_stages` VALUES (56, '准备发布', '8ulzfth64cd0k1x5peivowm2', 3, NULL, '2019-01-03 09:15:11', 'p0re71zhm48yxq63lfnjwkso', 0);
INSERT INTO `pear_task_stages` VALUES (57, '发布成功', '8ulzfth64cd0k1x5peivowm2', 4, NULL, '2019-01-03 09:15:11', 'k436eltf5zygbpnhrdqc8mo2', 0);
INSERT INTO `pear_task_stages` VALUES (61, 'ADD', 'elqa703jyvfhpt1dsxkzi8on', 61, NULL, '2019-01-04 21:15:46', '2sf7h3p01l5qgdeumrzny4bi', 0);
INSERT INTO `pear_task_stages` VALUES (62, 'Fix', 'elqa703jyvfhpt1dsxkzi8on', 62, NULL, '2019-01-04 21:15:51', 'njd4er1ohakl6bz258qcfgsv', 0);
INSERT INTO `pear_task_stages` VALUES (63, 'Change', 'elqa703jyvfhpt1dsxkzi8on', 63, NULL, '2019-01-04 21:16:07', 'oxcj9krmqeu08wbga2ftz7ls', 0);
INSERT INTO `pear_task_stages` VALUES (64, 'Update', 'elqa703jyvfhpt1dsxkzi8on', 64, NULL, '2019-01-04 21:16:29', 'sft603lxe5phk89ou1cgmiby', 0);
INSERT INTO `pear_task_stages` VALUES (65, 'Removed', 'elqa703jyvfhpt1dsxkzi8on', 65, NULL, '2019-01-04 21:16:49', '0jmqucy41h3rt9ag27wils6b', 0);
INSERT INTO `pear_task_stages` VALUES (66, '产品计划', 'gbim9jpevkh7qr6ufa1t3wl4', 0, NULL, '2019-01-05 21:57:31', 'j3f52swoct7earzhd6gxk41m', 0);
INSERT INTO `pear_task_stages` VALUES (67, '即将发布', 'gbim9jpevkh7qr6ufa1t3wl4', 1, NULL, '2019-01-05 21:57:31', '5fkwydvzopqrmxj0174nl93u', 0);
INSERT INTO `pear_task_stages` VALUES (68, '测试', 'gbim9jpevkh7qr6ufa1t3wl4', 2, NULL, '2019-01-05 21:57:31', '97gxmwyidlae4r2u1hqbcpnz', 0);
INSERT INTO `pear_task_stages` VALUES (69, '准备发布', 'gbim9jpevkh7qr6ufa1t3wl4', 3, NULL, '2019-01-05 21:57:31', '9f4vdsw7gzpo2hm1qbt0xyn6', 0);
INSERT INTO `pear_task_stages` VALUES (70, '发布成功', 'gbim9jpevkh7qr6ufa1t3wl4', 4, NULL, '2019-01-05 21:57:31', 'pm8129iltue7jnyvgb4d30xw', 0);

-- ----------------------------
-- Table structure for pear_task_stages_template
-- ----------------------------
DROP TABLE IF EXISTS `pear_task_stages_template`;
CREATE TABLE `pear_task_stages_template`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '类型名称',
  `project_template_code` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '项目id',
  `create_time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `sort` int(11) NULL DEFAULT 0,
  `code` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '编号',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 84 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '任务列表模板表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of pear_task_stages_template
-- ----------------------------
INSERT INTO `pear_task_stages_template` VALUES (61, '待处理', 'un6125mxt4dcizhjqwvgyb3a', '2018-12-24 16:57:49', 1, 'ts0cdj5wzxnlhfymrvuk1ei9');
INSERT INTO `pear_task_stages_template` VALUES (62, '进行中', 'un6125mxt4dcizhjqwvgyb3a', '2018-12-24 16:57:49', 0, '9vbjag5rl0ikxqyc146p7swf');
INSERT INTO `pear_task_stages_template` VALUES (63, '已完成', 'un6125mxt4dcizhjqwvgyb3a', '2018-12-24 16:57:49', 0, 'l3o95r4wyk18bh2aq7xcz0ve');
INSERT INTO `pear_task_stages_template` VALUES (65, '协议签订', 'd85f1bvwpml2nhxe91zu7tyi', '2018-12-24 22:00:33', 0, '4510enfyvjtzho3cw28xsagi');
INSERT INTO `pear_task_stages_template` VALUES (66, '图纸设计', 'd85f1bvwpml2nhxe91zu7tyi', '2018-12-24 22:00:38', 0, '3esu4p172alok89wjmrvqihz');
INSERT INTO `pear_task_stages_template` VALUES (67, '评审及打样', 'd85f1bvwpml2nhxe91zu7tyi', '2018-12-24 22:00:43', 0, 'e6jp81o7drfkzluxbhmiaqtv');
INSERT INTO `pear_task_stages_template` VALUES (68, '构件采购', 'd85f1bvwpml2nhxe91zu7tyi', '2018-12-24 22:00:52', 0, 'tpy76njoair0clhz9xmeg482');
INSERT INTO `pear_task_stages_template` VALUES (69, '制造安装', 'd85f1bvwpml2nhxe91zu7tyi', '2018-12-24 22:00:58', 0, 've97pldtbnjrqco1hyfx82sa');
INSERT INTO `pear_task_stages_template` VALUES (70, '内部检验', 'd85f1bvwpml2nhxe91zu7tyi', '2018-12-24 22:01:04', 0, '4phrcltwygziu2s13jxbaqv8');
INSERT INTO `pear_task_stages_template` VALUES (71, '验收', 'd85f1bvwpml2nhxe91zu7tyi', '2018-12-24 22:01:09', 0, 'qxi9n42p0w57jtrmyhz8gl3c');
INSERT INTO `pear_task_stages_template` VALUES (72, '需求收集', 'd85f1bvwpml2nhxe92zu7tyi', '2018-12-24 22:01:30', 0, '48h13usk7en6ljyxbqgiw02z');
INSERT INTO `pear_task_stages_template` VALUES (73, '评估确认', 'd85f1bvwpml2nhxe92zu7tyi', '2018-12-24 22:02:17', 0, '70z1fpxytvchbadkgsieowuj');
INSERT INTO `pear_task_stages_template` VALUES (74, '需求暂缓', 'd85f1bvwpml2nhxe92zu7tyi', '2018-12-24 22:02:22', 0, 'bkyunf9jr2c37m4oi81sxzqp');
INSERT INTO `pear_task_stages_template` VALUES (75, '研发中', 'd85f1bvwpml2nhxe92zu7tyi', '2018-12-24 22:02:27', 0, 'zu0vrhpoi835klgxqndmf6w9');
INSERT INTO `pear_task_stages_template` VALUES (76, '内测中', 'd85f1bvwpml2nhxe92zu7tyi', '2018-12-24 22:02:32', 0, 'j4d5l7s6rgvk9o32ayt1uefc');
INSERT INTO `pear_task_stages_template` VALUES (77, '通知用户', 'd85f1bvwpml2nhxe92zu7tyi', '2018-12-24 22:02:40', 0, 'cjk6al7f2ygp39des148iwzh');
INSERT INTO `pear_task_stages_template` VALUES (78, '已完成&归档', 'd85f1bvwpml2nhxe92zu7tyi', '2018-12-24 22:02:45', 0, 'vn6dxyzme1g8ucbl3ikq0awt');
INSERT INTO `pear_task_stages_template` VALUES (79, '产品计划', 'd85f1bvwpml2nhxe94zu7tyi', '2018-12-24 22:06:03', 0, '3atxfsv5rhz64pk8jl0enqd2');
INSERT INTO `pear_task_stages_template` VALUES (80, '即将发布', 'd85f1bvwpml2nhxe94zu7tyi', '2018-12-24 22:06:09', 0, '1nucptea9b2vl7yfj8xgz4d6');
INSERT INTO `pear_task_stages_template` VALUES (81, '测试', 'd85f1bvwpml2nhxe94zu7tyi', '2018-12-24 22:06:13', 0, 'pfidejaq2vn653h8zmsytrlb');
INSERT INTO `pear_task_stages_template` VALUES (82, '准备发布', 'd85f1bvwpml2nhxe94zu7tyi', '2018-12-24 22:06:17', 0, 'uc1etmw4k5gys8jfpdbo7zrh');
INSERT INTO `pear_task_stages_template` VALUES (83, '发布成功', 'd85f1bvwpml2nhxe94zu7tyi', '2018-12-24 22:06:23', 0, 'rmutqozd51shfp4w70n96iel');

-- ----------------------------
-- Table structure for pear_task_tag
-- ----------------------------
DROP TABLE IF EXISTS `pear_task_tag`;
CREATE TABLE `pear_task_tag`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `project_code` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '项目id',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '标签名',
  `color` enum('blue','red','orange','green','brown','purple') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'blue' COMMENT '颜色',
  `create_time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 20 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '任务标签表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of pear_task_tag
-- ----------------------------
INSERT INTO `pear_task_tag` VALUES (1, '9gevjxtloy5nrw2shbi8a1ku', 'mo4uqwfb06dxv8ez2spkl3rg', 'Android', 'blue', '2018-07-27 16:06:08');
INSERT INTO `pear_task_tag` VALUES (2, 'kjw19pzil4af5qcnry0gh6od', 'mo4uqwfb06dxv8ez2spkl3rg', 'IOS', 'green', '2018-07-27 16:06:14');
INSERT INTO `pear_task_tag` VALUES (3, 'suply7ri2t3x18kgqwbvh4cn', 'mo4uqwfb06dxv8ez2spkl3rg', 'Web', 'orange', '2018-09-07 23:22:11');

-- ----------------------------
-- Table structure for pear_task_to_tag
-- ----------------------------
DROP TABLE IF EXISTS `pear_task_to_tag`;
CREATE TABLE `pear_task_to_tag`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `task_code` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0',
  `tag_code` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0',
  `create_time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 138 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '任务标签映射表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of pear_task_to_tag
-- ----------------------------
INSERT INTO `pear_task_to_tag` VALUES (126, '89ihyz3a7epcgjvruq16tfdw', '2bn918l6ejyzousa73dkpgci', 'suply7ri2t3x18kgqwbvh4cn', '2019-02-16 11:20:03');
INSERT INTO `pear_task_to_tag` VALUES (133, 'd2iz35y80jlpswgrn791mktb', '2bn918l6ejyzousa73dkpgci', 'kjw19pzil4af5qcnry0gh6od', '2019-02-16 12:14:34');
INSERT INTO `pear_task_to_tag` VALUES (134, 'uepgxk3voabzh0jicfmnyq6w', '2bn918l6ejyzousa73dkpgci', '9gevjxtloy5nrw2shbi8a1ku', '2019-02-16 12:14:34');
INSERT INTO `pear_task_to_tag` VALUES (135, '32uog4ewka9cdv5xm6jfybs8', '6hj43ueim2bk187sqzcoy59v', '9gevjxtloy5nrw2shbi8a1ku', '2019-02-16 12:15:52');
INSERT INTO `pear_task_to_tag` VALUES (136, '9k4mq1fwpc8xzebodv0i2jnr', '6hj43ueim2bk187sqzcoy59v', 'kjw19pzil4af5qcnry0gh6od', '2019-02-16 12:15:53');
INSERT INTO `pear_task_to_tag` VALUES (137, 'yfiowudeh7vx25gnaj9l6sz1', '6hj43ueim2bk187sqzcoy59v', 'suply7ri2t3x18kgqwbvh4cn', '2019-02-16 12:15:53');

-- ----------------------------
-- Table structure for pear_user_token
-- ----------------------------
DROP TABLE IF EXISTS `pear_user_token`;
CREATE TABLE `pear_user_token`  (
  `token_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '令牌编号',
  `user_id` int(10) UNSIGNED NOT NULL COMMENT '用户编号',
  `user_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户名',
  `token` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '登录令牌',
  `login_time` int(10) UNSIGNED NOT NULL COMMENT '登录时间',
  `client_type` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '客户端类型 android wap',
  `login_ip` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '登录ip',
  PRIMARY KEY (`token_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'PC端登录令牌表' ROW_FORMAT = Compact;

SET FOREIGN_KEY_CHECKS = 1;
