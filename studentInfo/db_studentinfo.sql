/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50716
Source Host           : localhost:3306
Source Database       : db_studentinfo

Target Server Type    : MYSQL
Target Server Version : 50716
File Encoding         : 65001

Date: 2017-06-15 17:56:32
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `t_class`
-- ----------------------------
DROP TABLE IF EXISTS `t_class`;
CREATE TABLE `t_class` (
  `classId` int(11) NOT NULL AUTO_INCREMENT,
  `className` varchar(20) DEFAULT NULL,
  `gradeId` int(11) DEFAULT NULL,
  `classDesc` text,
  PRIMARY KEY (`classId`),
  KEY `gradeId` (`gradeId`),
  CONSTRAINT `t_class_ibfk_1` FOREIGN KEY (`gradeId`) REFERENCES `t_grade` (`gradeId`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_class
-- ----------------------------
INSERT INTO `t_class` VALUES ('3', '09计本', '2', '22');
INSERT INTO `t_class` VALUES ('4', '08计本', '1', '111');
INSERT INTO `t_class` VALUES ('5', '08网本', '1', '222');
INSERT INTO `t_class` VALUES ('6', '10网本', '3', '22');
INSERT INTO `t_class` VALUES ('7', '10计本', '3', '10年级计算机本科');

-- ----------------------------
-- Table structure for `t_datadic`
-- ----------------------------
DROP TABLE IF EXISTS `t_datadic`;
CREATE TABLE `t_datadic` (
  `ddId` int(11) NOT NULL AUTO_INCREMENT,
  `ddTypeId` int(11) DEFAULT NULL,
  `ddValue` varchar(20) DEFAULT NULL,
  `ddDesc` text,
  PRIMARY KEY (`ddId`),
  KEY `ddTypeId` (`ddTypeId`),
  CONSTRAINT `t_datadic_ibfk_1` FOREIGN KEY (`ddTypeId`) REFERENCES `t_datadictype` (`ddTypeId`)
) ENGINE=InnoDB AUTO_INCREMENT=344 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_datadic
-- ----------------------------
INSERT INTO `t_datadic` VALUES ('1', '1', '男', '1');
INSERT INTO `t_datadic` VALUES ('2', '1', '女', null);
INSERT INTO `t_datadic` VALUES ('3', '2', '中共党员', null);
INSERT INTO `t_datadic` VALUES ('4', '2', '中共预备党员', null);
INSERT INTO `t_datadic` VALUES ('5', '2', '共青团员', null);
INSERT INTO `t_datadic` VALUES ('6', '2', '民革党员', null);
INSERT INTO `t_datadic` VALUES ('7', '2', '民盟盟员', null);
INSERT INTO `t_datadic` VALUES ('8', '2', '民建会员', null);
INSERT INTO `t_datadic` VALUES ('9', '2', '民进会员', null);
INSERT INTO `t_datadic` VALUES ('10', '2', '农工党党员', null);
INSERT INTO `t_datadic` VALUES ('11', '2', '致公党党员', null);
INSERT INTO `t_datadic` VALUES ('12', '2', '九三学社社员', null);
INSERT INTO `t_datadic` VALUES ('13', '2', '台盟盟员', null);
INSERT INTO `t_datadic` VALUES ('14', '2', '无党派人士', null);
INSERT INTO `t_datadic` VALUES ('15', '2', '普通公民', null);
INSERT INTO `t_datadic` VALUES ('16', '2', '港澳同胞', null);
INSERT INTO `t_datadic` VALUES ('17', '2', '叛徒', null);
INSERT INTO `t_datadic` VALUES ('18', '2', '反革命分子', null);
INSERT INTO `t_datadic` VALUES ('334', '3', '汉族', null);
INSERT INTO `t_datadic` VALUES ('335', '3', '蒙古族', null);
INSERT INTO `t_datadic` VALUES ('336', '3', '回族', null);
INSERT INTO `t_datadic` VALUES ('337', '3', '藏族', null);
INSERT INTO `t_datadic` VALUES ('338', '3', '维吾尔族', null);
INSERT INTO `t_datadic` VALUES ('339', '3', '门巴族', null);
INSERT INTO `t_datadic` VALUES ('340', '3', '外国血统', null);
INSERT INTO `t_datadic` VALUES ('342', '3', '哈哈族', '11');
INSERT INTO `t_datadic` VALUES ('343', '1', '女变男', '1234');

-- ----------------------------
-- Table structure for `t_datadictype`
-- ----------------------------
DROP TABLE IF EXISTS `t_datadictype`;
CREATE TABLE `t_datadictype` (
  `ddTypeId` int(11) NOT NULL AUTO_INCREMENT,
  `ddTypeName` varchar(20) DEFAULT NULL,
  `ddTypeDesc` text,
  PRIMARY KEY (`ddTypeId`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_datadictype
-- ----------------------------
INSERT INTO `t_datadictype` VALUES ('1', '性别', '是男的就是男的，是女的就是女的');
INSERT INTO `t_datadictype` VALUES ('2', '政治面貌', '干哈的');
INSERT INTO `t_datadictype` VALUES ('3', '民族', '哪个民族？');

-- ----------------------------
-- Table structure for `t_grade`
-- ----------------------------
DROP TABLE IF EXISTS `t_grade`;
CREATE TABLE `t_grade` (
  `gradeId` int(11) NOT NULL AUTO_INCREMENT,
  `gradeName` varchar(20) DEFAULT NULL,
  `gradeDesc` text,
  PRIMARY KEY (`gradeId`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_grade
-- ----------------------------
INSERT INTO `t_grade` VALUES ('1', '08级', '111');
INSERT INTO `t_grade` VALUES ('2', '09级', '222');
INSERT INTO `t_grade` VALUES ('3', '10级', '33');

-- ----------------------------
-- Table structure for `t_student`
-- ----------------------------
DROP TABLE IF EXISTS `t_student`;
CREATE TABLE `t_student` (
  `studentId` varchar(40) NOT NULL,
  `stuNo` varchar(30) DEFAULT NULL,
  `stuName` varchar(20) DEFAULT NULL,
  `stuSex` varchar(10) DEFAULT NULL,
  `stuBirthday` date DEFAULT NULL,
  `stuRxsj` date DEFAULT NULL,
  `stuNation` varchar(20) DEFAULT NULL,
  `stuZzmm` varchar(20) DEFAULT NULL,
  `classId` int(11) DEFAULT NULL,
  `stuDesc` text,
  `stuPic` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`studentId`),
  KEY `classId` (`classId`),
  CONSTRAINT `t_student_ibfk_1` FOREIGN KEY (`classId`) REFERENCES `t_class` (`classId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_student
-- ----------------------------
INSERT INTO `t_student` VALUES ('12', '21', '阿三发', '男', '2016-12-01', '2016-12-01', '维吾尔族', '中共党员', '4', '阿斯顿', 'songminguo.jpg');
INSERT INTO `t_student` VALUES ('15', '2', null, null, null, null, null, null, '4', null, 'songminguo.jpg');
INSERT INTO `t_student` VALUES ('16cb9251-9c4e-47a2-8084-95a1a236495b', '001', '美女1', '女', '2016-12-01', '2016-12-01', '汉族', '中共党员', '3', '美女12', 'songminguo.jpg');
INSERT INTO `t_student` VALUES ('17', '2', null, null, null, null, null, null, '4', null, 'songminguo.jpg');
INSERT INTO `t_student` VALUES ('18', '2', null, null, null, null, null, null, '4', null, 'songminguo.jpg');
INSERT INTO `t_student` VALUES ('19', '小三', '21', '女', '2016-12-01', '2016-12-01', '汉族', '中共党员', '4', '是', 'songminguo.jpg');
INSERT INTO `t_student` VALUES ('4', '11', '212', '男', '2016-12-01', '2016-12-01', '蒙古族', '中共预备党员', '4', '21', 'songminguo.jpg');
INSERT INTO `t_student` VALUES ('5', '11', '21', '男', '2016-12-01', '2016-12-01', '蒙古族', '中共预备党员', '4', '21', 'songminguo.jpg');
INSERT INTO `t_student` VALUES ('6', '21', '2', '男', '2016-12-01', '2016-12-01', '蒙古族', null, '4', null, 'songminguo.jpg');
INSERT INTO `t_student` VALUES ('9f6b6bdd-82cc-4837-9ee1-2c06ec3a3284', '12312312', '3123', '男', '2016-12-01', '2016-12-01', '蒙古族', '民盟盟员', '5', '', '20170529072512.jpg');
INSERT INTO `t_student` VALUES ('a1cf592d-d9d4-4de1-b8ff-0db7e9852411', 'sss22', 'ss2', '女', '2016-12-01', '2016-12-01', '蒙古族', '共青团员', '3', '大2', 'songminguo.jpg');
INSERT INTO `t_student` VALUES ('a8a1816b-f24c-4fb9-b160-c8c107c80acf', '21', '321', '男', '2016-12-01', '2016-12-01', '蒙古族', '民革党员', '3', '123', 'songminguo.jpg');

-- ----------------------------
-- Table structure for `t_user`
-- ----------------------------
DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user` (
  `userId` int(11) NOT NULL AUTO_INCREMENT,
  `userName` varchar(20) DEFAULT NULL,
  `password` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`userId`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_user
-- ----------------------------
INSERT INTO `t_user` VALUES ('1', 'admin', '123456');
