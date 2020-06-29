/*
Navicat MySQL Data Transfer

Source Server         : test
Source Server Version : 80011
Source Host           : localhost:3306
Source Database       : houserent

Target Server Type    : MYSQL
Target Server Version : 80011
File Encoding         : 65001

Date: 2020-06-29 16:43:07
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `user`
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `userid` varchar(20) COLLATE utf8mb4_general_ci NOT NULL,
  `username` varchar(30) COLLATE utf8mb4_general_ci NOT NULL,
  `passwd` varchar(20) COLLATE utf8mb4_general_ci NOT NULL,
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `phone` varchar(15) COLLATE utf8mb4_general_ci NOT NULL,
  `photo` blob,
  `user_state` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `user_credit` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`userid`),
  KEY `username` (`username`),
  KEY `email` (`email`),
  KEY `phone` (`phone`),
  KEY `user_state` (`user_state`),
  KEY `user_credit` (`user_credit`),
  CONSTRAINT `user_credit` FOREIGN KEY (`user_credit`) REFERENCES `credit` (`credit`),
  CONSTRAINT `user_state` FOREIGN KEY (`user_state`) REFERENCES `state` (`state`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('host001', '管理员1号', 'host', 'host001@gmail.com', '13347132681', null, null, null);
INSERT INTO `user` VALUES ('host002', '管理员2号', 'host', 'host002@gmail.com', '13347132681', null, null, null);
INSERT INTO `user` VALUES ('host003', '管理员3号', 'host', 'host003@gmail.com', '13347132683', null, null, null);
INSERT INTO `user` VALUES ('housekeeper001', '包租婆1号', 'housekeeper', 'housekeeper001@gmail.com', '18141132681', null, null, null);
INSERT INTO `user` VALUES ('housekeeper002', '包租婆2号', 'housekeeper', 'housekeeper002@gmail.com', '18141132682', null, null, null);
INSERT INTO `user` VALUES ('housekeeper003', '包租婆3号', 'housekeeper', 'housekeeper003@gmail.com', '18141132683', null, null, null);
INSERT INTO `user` VALUES ('housekeeper004', '包租婆4号', 'housekeeper', 'housekeeper004@gmail.com', '18141132684', null, null, null);
INSERT INTO `user` VALUES ('housekeeper005', '包租婆5号', 'housekeeper', 'housekeeper005@gmail.com', '18141132685', null, null, null);
INSERT INTO `user` VALUES ('student001', '学生1号', 'student', 'student001@gmail.com', '18104096881', null, null, null);
INSERT INTO `user` VALUES ('student002', '学生2号', 'student', 'student002@gmail.com', '18104096882', null, null, null);
INSERT INTO `user` VALUES ('student003', '学生3号', 'student', 'student003@gmail.com', '18104096883', null, null, null);
INSERT INTO `user` VALUES ('student004', '学生4号', 'student', 'student004@gmail.com', '18104096884', null, null, null);
INSERT INTO `user` VALUES ('student005', '学生5号', 'student', 'student005@gmail.com', '18104096885', null, null, null);
INSERT INTO `user` VALUES ('student006', '学生6号', 'student', 'student006@gmail.com', '18104096886', null, null, null);
INSERT INTO `user` VALUES ('student007', '学生7号', 'student', 'student006@gmail.com', '18104096887', null, null, null);
