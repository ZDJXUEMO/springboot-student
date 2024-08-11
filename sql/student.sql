/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 80022
Source Host           : localhost:3306
Source Database       : student

Target Server Type    : MYSQL
Target Server Version : 80022
File Encoding         : 65001

Date: 2024-07-06 00:51:52
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for login
-- ----------------------------
DROP TABLE IF EXISTS `login`;
CREATE TABLE `login` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键',
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '邮件',
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '密码',
  `salt` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '盐',
  `validation_time` datetime DEFAULT NULL COMMENT '有效时间',
  `is_valid` tinyint(1) DEFAULT '0' COMMENT '0：不可用 1：可用',
  `confirm_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '验证码',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of login
-- ----------------------------
INSERT INTO `login` VALUES ('27', '1@qq.com', '4e0a14431c1779abfc92b6ea50475573', '1vk4g3u5b', '2023-11-29 13:47:27', '1', '1730222007766880256');
INSERT INTO `login` VALUES ('28', '2@qq.com', 'fa255445714aec3a98bd1e5a1a35f2b2', 'aht8idi0v', '2023-11-29 14:57:38', '1', '1730239668743704576');
INSERT INTO `login` VALUES ('43', '2451429769@qq.com', '52c81c258862a2b79e5f2fe620cc543e', '5ne7mpx3u', '2024-07-06 14:50:17', '1', '1809238373659971584');

-- ----------------------------
-- Table structure for st_course
-- ----------------------------
DROP TABLE IF EXISTS `st_course`;
CREATE TABLE `st_course` (
  `couId` mediumint NOT NULL AUTO_INCREMENT COMMENT '课程id',
  `couName` varchar(20) NOT NULL COMMENT '课程名称',
  `couGrade` mediumint NOT NULL COMMENT '学分',
  `couTime` mediumint NOT NULL COMMENT '学时',
  `major` varchar(20) NOT NULL COMMENT '所属专业',
  PRIMARY KEY (`couId`)
) ENGINE=MyISAM AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of st_course
-- ----------------------------
INSERT INTO `st_course` VALUES ('1', '线性代数a', '3', '64', '通识教育');


-- ----------------------------
-- Table structure for st_dorm
-- ----------------------------
DROP TABLE IF EXISTS `st_dorm`;
CREATE TABLE `st_dorm` (
  `dormId` mediumint NOT NULL AUTO_INCREMENT COMMENT '宿舍id',
  `dormNum` varchar(6) NOT NULL COMMENT '宿舍号',
  `dormAddress` varchar(20) NOT NULL COMMENT '宿舍地址号',
  PRIMARY KEY (`dormId`)
) ENGINE=MyISAM AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of st_dorm
-- ----------------------------
INSERT INTO `st_dorm` VALUES ('1', '556', '十二');


-- ----------------------------
-- Table structure for st_grade
-- ----------------------------
DROP TABLE IF EXISTS `st_grade`;
CREATE TABLE `st_grade` (
  `stuNumber` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '学号',
  `couId` mediumint NOT NULL COMMENT '课程号',
  `grade` smallint NOT NULL COMMENT '成绩',
  `point` float(2,1) NOT NULL COMMENT '绩点',
  PRIMARY KEY (`stuNumber`,`couId`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of st_grade
-- ----------------------------
INSERT INTO `st_grade` VALUES ('202302150800', '1', '89', '3.9');


-- ----------------------------
-- Table structure for st_login
-- ----------------------------
DROP TABLE IF EXISTS `st_login`;
CREATE TABLE `st_login` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'id',
  `stuNumber` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '学号',
  `password` varchar(30) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '账户密码',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of st_login
-- ----------------------------
INSERT INTO `st_login` VALUES ('1', '202302150866', '123456');


-- ----------------------------
-- Table structure for st_name
-- ----------------------------
DROP TABLE IF EXISTS `st_name`;
CREATE TABLE `st_name` (
  `name` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '姓名',
  `stuNumber` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '学号',
  `age` int NOT NULL COMMENT '年龄',
  `stuId` mediumint NOT NULL AUTO_INCREMENT COMMENT '学生id',
  `dormNumber` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '宿舍地址好',
  `sex` varchar(4) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '性别',
  `majorClass` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '专业班级',
  `stuDay` datetime NOT NULL COMMENT '入学日期',
  `stuPic` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '头像图片',
  `major` varchar(30) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '专业全称',
  PRIMARY KEY (`stuId`)
) ENGINE=MyISAM AUTO_INCREMENT=74 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of st_name
-- ----------------------------
INSERT INTO `st_name` VALUES ('Brian', '202302150866', '24', '68', '十二309', '男', '软件2308', '2023-12-07 16:00:00', 'bf2607e4-aab6-419d-811b-de75fbb5a4ba-87d81d7653c510d51d8a82e74e0e2048.jpg', '软件技术');

-- ----------------------------
-- View structure for computer
-- ----------------------------
DROP VIEW IF EXISTS `computer`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `computer` AS select `st_course`.`couId` AS `couId`,`st_course`.`couName` AS `couName`,`st_course`.`couGrade` AS `couGrade`,`st_course`.`couTime` AS `couTime` from `st_course` where (`st_course`.`major` = '计算机科学与技术') WITH CASCADED CHECK OPTION ;

-- ----------------------------
-- View structure for ranks
-- ----------------------------
DROP VIEW IF EXISTS `ranks`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `ranks` AS select `score`.`stuNumber` AS `stuNumber`,`score`.`name` AS `name`,`score`.`couName` AS `couName`,`score`.`grade` AS `grade`,`score`.`point` AS `point`,rank() OVER (PARTITION BY `score`.`couName` ORDER BY `score`.`grade` desc )  AS `ranks` from `score` ;

-- ----------------------------
-- View structure for score
-- ----------------------------
DROP VIEW IF EXISTS `score`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `score` AS select `st_grade`.`stuNumber` AS `stuNumber`,`st_grade`.`couId` AS `couId`,`st_name`.`name` AS `name`,`st_course`.`couName` AS `couName`,`st_grade`.`grade` AS `grade`,`st_grade`.`point` AS `point`,`st_course`.`major` AS `major` from ((`st_course` join `st_name`) join `st_grade`) where ((`st_grade`.`stuNumber` = `st_name`.`stuNumber`) and (`st_grade`.`couId` = `st_course`.`couId`)) ;

-- ----------------------------
-- View structure for software
-- ----------------------------
DROP VIEW IF EXISTS `software`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `software` AS select `st_course`.`couId` AS `couId`,`st_course`.`couName` AS `couName`,`st_course`.`couGrade` AS `couGrade`,`st_course`.`couTime` AS `couTime` from `st_course` where (`st_course`.`major` = '软件工程') WITH CASCADED CHECK OPTION ;
