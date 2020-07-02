/*
Navicat MySQL Data Transfer

Source Server         : test
Source Server Version : 80011
Source Host           : localhost:3306
Source Database       : houserent

Target Server Type    : MYSQL
Target Server Version : 80011
File Encoding         : 65001

Date: 2020-07-02 21:16:55
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `admin`
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
`admin_id`  varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL ,
PRIMARY KEY (`admin_id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8mb4 COLLATE=utf8mb4_general_ci

;

-- ----------------------------
-- Table structure for `blocklist_user`
-- ----------------------------
DROP TABLE IF EXISTS `blocklist_user`;
CREATE TABLE `blocklist_user` (
`block_user`  varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL ,
`blockid`  varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL ,
`block_state`  varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL ,
`block_reason`  varchar(90) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL ,
PRIMARY KEY (`block_user`, `blockid`),
FOREIGN KEY (`block_state`) REFERENCES `state_user` (`stateid`) ON DELETE RESTRICT ON UPDATE RESTRICT,
FOREIGN KEY (`block_user`) REFERENCES `user` (`userid`) ON DELETE RESTRICT ON UPDATE RESTRICT,
INDEX `blockstate` (`block_state`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8mb4 COLLATE=utf8mb4_general_ci

;

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
-- Table structure for `complain_infor`
-- ----------------------------
DROP TABLE IF EXISTS `complain_infor`;
CREATE TABLE `complain_infor` (
`complaining_user`  varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL ,
`complain_id`  varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL ,
`complain_house`  varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL ,
`complain_user`  varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL ,
`content`  varchar(90) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL ,
PRIMARY KEY (`complaining_user`, `complain_id`),
FOREIGN KEY (`complain_house`) REFERENCES `house` (`houseid`) ON DELETE RESTRICT ON UPDATE RESTRICT,
FOREIGN KEY (`complain_id`) REFERENCES `handle_complain` (`complain_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
FOREIGN KEY (`complain_user`) REFERENCES `user` (`userid`) ON DELETE RESTRICT ON UPDATE RESTRICT,
FOREIGN KEY (`complaining_user`) REFERENCES `user` (`userid`) ON DELETE RESTRICT ON UPDATE RESTRICT,
INDEX `complainhouse` (`complain_house`) USING BTREE ,
INDEX `complainuser` (`complain_user`) USING BTREE ,
INDEX `complainid` (`complain_id`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8mb4 COLLATE=utf8mb4_general_ci

;

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
-- Table structure for `handle_complain`
-- ----------------------------
DROP TABLE IF EXISTS `handle_complain`;
CREATE TABLE `handle_complain` (
`complain_id`  varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL ,
`handler`  varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL ,
`state`  varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL ,
PRIMARY KEY (`complain_id`, `handler`),
FOREIGN KEY (`handler`) REFERENCES `admin` (`admin_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
INDEX `admin` (`handler`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8mb4 COLLATE=utf8mb4_general_ci

;

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
`email_holder`  varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL ,
`call_holder`  varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL ,
`facility_include`  varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL ,
`fee_include`  varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL ,
`holder_name`  varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL ,
`commit`  varchar(90) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL ,
`commit_date`  varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL ,
`house_state`  varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL ,
PRIMARY KEY (`houseid`),
FOREIGN KEY (`call_holder`) REFERENCES `user` (`phone`) ON DELETE RESTRICT ON UPDATE RESTRICT,
FOREIGN KEY (`commit`) REFERENCES `commit` (`content`) ON DELETE RESTRICT ON UPDATE RESTRICT,
FOREIGN KEY (`commit_date`) REFERENCES `commit` (`date`) ON DELETE RESTRICT ON UPDATE RESTRICT,
FOREIGN KEY (`email_holder`) REFERENCES `user` (`email`) ON DELETE RESTRICT ON UPDATE RESTRICT,
FOREIGN KEY (`facility_include`) REFERENCES `facility` (`include`) ON DELETE RESTRICT ON UPDATE RESTRICT,
FOREIGN KEY (`fee_include`) REFERENCES `fee` (`include`) ON DELETE RESTRICT ON UPDATE RESTRICT,
FOREIGN KEY (`holder_name`) REFERENCES `user` (`username`) ON DELETE RESTRICT ON UPDATE RESTRICT,
FOREIGN KEY (`house_state`) REFERENCES `state_user` (`stateid`) ON DELETE RESTRICT ON UPDATE RESTRICT,
INDEX `email_holder` (`email_holder`) USING BTREE ,
INDEX `call_holder` (`call_holder`) USING BTREE ,
INDEX `facility_include` (`facility_include`) USING BTREE ,
INDEX `fee_include` (`fee_include`) USING BTREE ,
INDEX `holder_name` (`holder_name`) USING BTREE ,
INDEX `commit` (`commit`) USING BTREE ,
INDEX `commit_date` (`commit_date`) USING BTREE ,
INDEX `houseinfor` (`houseinfor`) USING BTREE ,
INDEX `room` (`room`) USING BTREE ,
INDEX `location` (`location`) USING BTREE ,
INDEX `housestate` (`house_state`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8mb4 COLLATE=utf8mb4_general_ci

;

-- ----------------------------
-- Table structure for `notconfirmed_house`
-- ----------------------------
DROP TABLE IF EXISTS `notconfirmed_house`;
CREATE TABLE `notconfirmed_house` (
`house_state`  varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL ,
`notconfirmed_house`  varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL ,
`reson`  varchar(90) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL ,
PRIMARY KEY (`house_state`, `notconfirmed_house`),
FOREIGN KEY (`house_state`) REFERENCES `state_user` (`state`) ON DELETE RESTRICT ON UPDATE RESTRICT,
FOREIGN KEY (`notconfirmed_house`) REFERENCES `house` (`houseid`) ON DELETE RESTRICT ON UPDATE RESTRICT,
INDEX `notconfirmed_house` (`notconfirmed_house`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8mb4 COLLATE=utf8mb4_general_ci

;

-- ----------------------------
-- Table structure for `notconfirmed_user`
-- ----------------------------
DROP TABLE IF EXISTS `notconfirmed_user`;
CREATE TABLE `notconfirmed_user` (
`notcomfirmed_user`  varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL ,
`user_state`  varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL ,
`reason`  varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL ,
PRIMARY KEY (`notcomfirmed_user`, `user_state`),
FOREIGN KEY (`notcomfirmed_user`) REFERENCES `user` (`userid`) ON DELETE RESTRICT ON UPDATE RESTRICT,
FOREIGN KEY (`user_state`) REFERENCES `state_user` (`state`) ON DELETE RESTRICT ON UPDATE RESTRICT,
INDEX `state` (`user_state`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8mb4 COLLATE=utf8mb4_general_ci

;

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
-- Table structure for `removed_house`
-- ----------------------------
DROP TABLE IF EXISTS `removed_house`;
CREATE TABLE `removed_house` (
`removed_house`  varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL ,
`removedid`  varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL ,
`removed_reson`  varchar(90) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL ,
PRIMARY KEY (`removed_house`, `removedid`),
FOREIGN KEY (`removed_house`) REFERENCES `house` (`houseid`) ON DELETE RESTRICT ON UPDATE RESTRICT
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8mb4 COLLATE=utf8mb4_general_ci

;

-- ----------------------------
-- Table structure for `role`
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role` (
`roleid`  int(3) NOT NULL ,
`rolename`  varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL ,
PRIMARY KEY (`roleid`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8mb4 COLLATE=utf8mb4_general_ci

;

-- ----------------------------
-- Table structure for `state_house`
-- ----------------------------
DROP TABLE IF EXISTS `state_house`;
CREATE TABLE `state_house` (
`house_id`  varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL ,
`stateid`  varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL ,
`state`  varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL ,
`addinfor`  varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL ,
PRIMARY KEY (`house_id`, `stateid`),
FOREIGN KEY (`house_id`) REFERENCES `house` (`houseid`) ON DELETE RESTRICT ON UPDATE RESTRICT
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8mb4 COLLATE=utf8mb4_general_ci

;

-- ----------------------------
-- Table structure for `state_user`
-- ----------------------------
DROP TABLE IF EXISTS `state_user`;
CREATE TABLE `state_user` (
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
FOREIGN KEY (`user_state`) REFERENCES `state_user` (`stateid`) ON DELETE RESTRICT ON UPDATE RESTRICT,
INDEX `username` (`username`) USING BTREE ,
INDEX `email` (`email`) USING BTREE ,
INDEX `phone` (`phone`) USING BTREE ,
INDEX `user_credit` (`user_credit`) USING BTREE ,
INDEX `user_state` (`user_state`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8mb4 COLLATE=utf8mb4_general_ci

;

-- ----------------------------
-- Table structure for `user_role`
-- ----------------------------
DROP TABLE IF EXISTS `user_role`;
CREATE TABLE `user_role` (
`id`  int(11) NOT NULL ,
`roleid`  int(11) NOT NULL ,
`role_user_id`  varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL ,
PRIMARY KEY (`id`),
FOREIGN KEY (`roleid`) REFERENCES `role` (`roleid`) ON DELETE RESTRICT ON UPDATE RESTRICT,
INDEX `role` (`roleid`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8mb4 COLLATE=utf8mb4_general_ci

;
