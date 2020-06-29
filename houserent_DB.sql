/*
Navicat MySQL Data Transfer

Source Server         : test
Source Server Version : 80011
Source Host           : localhost:3306
Source Database       : houserent

Target Server Type    : MYSQL
Target Server Version : 80011
File Encoding         : 65001

Date: 2020-06-29 16:43:50
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `cheaphouse`
-- ----------------------------
DROP TABLE IF EXISTS `cheaphouse`;
CREATE TABLE `cheaphouse` (
`house_id`  varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL ,
`discount`  varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL ,
`housekeeper`  varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL ,
`house_infor`  varchar(90) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL ,
`room_type`  varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL ,
`location`  varchar(90) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL ,
PRIMARY KEY (`house_id`),
FOREIGN KEY (`house_id`) REFERENCES `house` (`houseid`) ON DELETE RESTRICT ON UPDATE RESTRICT,
FOREIGN KEY (`house_infor`) REFERENCES `house` (`houseinfor`) ON DELETE RESTRICT ON UPDATE RESTRICT,
FOREIGN KEY (`housekeeper`) REFERENCES `user` (`username`) ON DELETE RESTRICT ON UPDATE RESTRICT,
FOREIGN KEY (`location`) REFERENCES `house` (`location`) ON DELETE RESTRICT ON UPDATE RESTRICT,
FOREIGN KEY (`room_type`) REFERENCES `house` (`room`) ON DELETE RESTRICT ON UPDATE RESTRICT,
INDEX `housekeeper` (`housekeeper`) USING BTREE ,
INDEX `house_infor` (`house_infor`) USING BTREE ,
INDEX `room_type` (`room_type`) USING BTREE ,
INDEX `location` (`location`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8mb4 COLLATE=utf8mb4_general_ci

;

-- ----------------------------
-- Records of cheaphouse
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for `commit`
-- ----------------------------
DROP TABLE IF EXISTS `commit`;
CREATE TABLE `commit` (
`commitid`  varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL ,
`content`  varchar(90) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL ,
`date`  varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL ,
`houseid`  varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL ,
`user_name`  varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL ,
PRIMARY KEY (`houseid`),
FOREIGN KEY (`houseid`) REFERENCES `house` (`houseid`) ON DELETE RESTRICT ON UPDATE RESTRICT,
FOREIGN KEY (`user_name`) REFERENCES `user` (`username`) ON DELETE RESTRICT ON UPDATE RESTRICT,
INDEX `content` (`content`) USING BTREE ,
INDEX `date` (`date`) USING BTREE ,
INDEX `user_name` (`user_name`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8mb4 COLLATE=utf8mb4_general_ci

;

-- ----------------------------
-- Records of commit
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for `credit`
-- ----------------------------
DROP TABLE IF EXISTS `credit`;
CREATE TABLE `credit` (
`userid`  varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL ,
`creditid`  varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL ,
`credit`  varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL ,
`addinfor`  varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL ,
PRIMARY KEY (`userid`, `creditid`),
FOREIGN KEY (`userid`) REFERENCES `user` (`userid`) ON DELETE RESTRICT ON UPDATE RESTRICT,
INDEX `credit` (`credit`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8mb4 COLLATE=utf8mb4_general_ci

;

-- ----------------------------
-- Records of credit
-- ----------------------------
BEGIN;
INSERT INTO `credit` VALUES ('host001', 'credit001', 'A', '正常'), ('host002', 'credit001', 'A', '正常'), ('host003', 'credit003', 'C', '账号异常'), ('student001', 'credit001', 'A', '该学生信誉良好，按时交纳房租');
COMMIT;

-- ----------------------------
-- Table structure for `facility`
-- ----------------------------
DROP TABLE IF EXISTS `facility`;
CREATE TABLE `facility` (
`facilityid`  varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL ,
`include`  varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL ,
`houseid`  varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL ,
PRIMARY KEY (`houseid`),
INDEX `include` (`include`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8mb4 COLLATE=utf8mb4_general_ci

;

-- ----------------------------
-- Records of facility
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for `fee`
-- ----------------------------
DROP TABLE IF EXISTS `fee`;
CREATE TABLE `fee` (
`feeid`  varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL ,
`include`  varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL ,
`houseid`  varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL ,
PRIMARY KEY (`houseid`),
INDEX `include` (`include`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8mb4 COLLATE=utf8mb4_general_ci

;

-- ----------------------------
-- Records of fee
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for `house`
-- ----------------------------
DROP TABLE IF EXISTS `house`;
CREATE TABLE `house` (
`houseid`  varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL ,
`houseinfor`  varchar(90) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL ,
`room`  varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL ,
`location`  varchar(90) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL ,
`price`  double(10,0) NOT NULL ,
`discount`  int(3) NOT NULL ,
`frozen`  int(3) NOT NULL ,
`failedpass`  int(3) NOT NULL ,
`deleted`  int(3) NOT NULL ,
`email_holder`  varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL ,
`call_holder`  varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL ,
`facility_include`  varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL ,
`fee_include`  varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL ,
`holder_name`  varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL ,
`commit`  varchar(90) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL ,
`commit_date`  varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL ,
PRIMARY KEY (`houseid`),
FOREIGN KEY (`call_holder`) REFERENCES `user` (`phone`) ON DELETE RESTRICT ON UPDATE RESTRICT,
FOREIGN KEY (`commit`) REFERENCES `commit` (`content`) ON DELETE RESTRICT ON UPDATE RESTRICT,
FOREIGN KEY (`commit_date`) REFERENCES `commit` (`date`) ON DELETE RESTRICT ON UPDATE RESTRICT,
FOREIGN KEY (`email_holder`) REFERENCES `user` (`email`) ON DELETE RESTRICT ON UPDATE RESTRICT,
FOREIGN KEY (`facility_include`) REFERENCES `facility` (`include`) ON DELETE RESTRICT ON UPDATE RESTRICT,
FOREIGN KEY (`fee_include`) REFERENCES `fee` (`include`) ON DELETE RESTRICT ON UPDATE RESTRICT,
FOREIGN KEY (`holder_name`) REFERENCES `user` (`username`) ON DELETE RESTRICT ON UPDATE RESTRICT,
INDEX `email_holder` (`email_holder`) USING BTREE ,
INDEX `call_holder` (`call_holder`) USING BTREE ,
INDEX `facility_include` (`facility_include`) USING BTREE ,
INDEX `fee_include` (`fee_include`) USING BTREE ,
INDEX `holder_name` (`holder_name`) USING BTREE ,
INDEX `commit` (`commit`) USING BTREE ,
INDEX `commit_date` (`commit_date`) USING BTREE ,
INDEX `houseinfor` (`houseinfor`) USING BTREE ,
INDEX `room` (`room`) USING BTREE ,
INDEX `location` (`location`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8mb4 COLLATE=utf8mb4_general_ci

;

-- ----------------------------
-- Records of house
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for `notconfirmed_user`
-- ----------------------------
DROP TABLE IF EXISTS `notconfirmed_user`;
CREATE TABLE `notconfirmed_user` (
`user_stateid`  varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL ,
`detail`  varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL ,
PRIMARY KEY (`user_stateid`),
FOREIGN KEY (`user_stateid`) REFERENCES `user` (`user_state`) ON DELETE RESTRICT ON UPDATE RESTRICT
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8mb4 COLLATE=utf8mb4_general_ci

;

-- ----------------------------
-- Records of notconfirmed_user
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for `order`
-- ----------------------------
DROP TABLE IF EXISTS `order`;
CREATE TABLE `order` (
`orderid`  varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL ,
`date`  varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL ,
`username`  varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL ,
`houseid`  varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL ,
PRIMARY KEY (`houseid`),
FOREIGN KEY (`username`) REFERENCES `user` (`username`) ON DELETE RESTRICT ON UPDATE RESTRICT,
INDEX `username` (`username`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8mb4 COLLATE=utf8mb4_general_ci

;

-- ----------------------------
-- Records of order
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for `state`
-- ----------------------------
DROP TABLE IF EXISTS `state`;
CREATE TABLE `state` (
`user_id`  varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL ,
`stateid`  varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL ,
`state`  varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL ,
`addinfor`  varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL ,
PRIMARY KEY (`user_id`, `stateid`),
FOREIGN KEY (`user_id`) REFERENCES `user` (`userid`) ON DELETE RESTRICT ON UPDATE RESTRICT,
INDEX `state` (`state`) USING BTREE ,
INDEX `stateid` (`stateid`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8mb4 COLLATE=utf8mb4_general_ci

;

-- ----------------------------
-- Records of state
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for `user`
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
`userid`  varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL ,
`username`  varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL ,
`passwd`  varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL ,
`email`  varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL ,
`phone`  varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL ,
`photo`  blob NULL ,
`user_state`  varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL ,
`user_credit`  varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL ,
PRIMARY KEY (`userid`),
FOREIGN KEY (`user_credit`) REFERENCES `credit` (`credit`) ON DELETE RESTRICT ON UPDATE RESTRICT,
FOREIGN KEY (`user_state`) REFERENCES `state` (`state`) ON DELETE RESTRICT ON UPDATE RESTRICT,
INDEX `username` (`username`) USING BTREE ,
INDEX `email` (`email`) USING BTREE ,
INDEX `phone` (`phone`) USING BTREE ,
INDEX `user_state` (`user_state`) USING BTREE ,
INDEX `user_credit` (`user_credit`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8mb4 COLLATE=utf8mb4_general_ci

;

-- ----------------------------
-- Records of user
-- ----------------------------
BEGIN;
INSERT INTO `user` VALUES ('host001', '管理员1号', 'host', 'host001@gmail.com', '13347132681', null, null, null), ('host002', '管理员2号', 'host', 'host002@gmail.com', '13347132681', null, null, null), ('host003', '管理员3号', 'host', 'host003@gmail.com', '13347132683', null, null, null), ('housekeeper001', '包租婆1号', 'housekeeper', 'housekeeper001@gmail.com', '18141132681', null, null, null), ('housekeeper002', '包租婆2号', 'housekeeper', 'housekeeper002@gmail.com', '18141132682', null, null, null), ('housekeeper003', '包租婆3号', 'housekeeper', 'housekeeper003@gmail.com', '18141132683', null, null, null), ('housekeeper004', '包租婆4号', 'housekeeper', 'housekeeper004@gmail.com', '18141132684', null, null, null), ('housekeeper005', '包租婆5号', 'housekeeper', 'housekeeper005@gmail.com', '18141132685', null, null, null), ('student001', '学生1号', 'student', 'student001@gmail.com', '18104096881', null, null, null), ('student002', '学生2号', 'student', 'student002@gmail.com', '18104096882', null, null, null), ('student003', '学生3号', 'student', 'student003@gmail.com', '18104096883', null, null, null), ('student004', '学生4号', 'student', 'student004@gmail.com', '18104096884', null, null, null), ('student005', '学生5号', 'student', 'student005@gmail.com', '18104096885', null, null, null), ('student006', '学生6号', 'student', 'student006@gmail.com', '18104096886', null, null, null), ('student007', '学生7号', 'student', 'student006@gmail.com', '18104096887', null, null, null);
COMMIT;
