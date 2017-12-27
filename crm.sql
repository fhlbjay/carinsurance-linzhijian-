/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50525
Source Host           : localhost:3306
Source Database       : crm

Target Server Type    : MYSQL
Target Server Version : 50525
File Encoding         : 65001

Date: 2017-12-27 18:53:25
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for approval
-- ----------------------------
DROP TABLE IF EXISTS `approval`;
CREATE TABLE `approval` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `checkNum` varchar(255) DEFAULT NULL,
  `cause` varchar(255) DEFAULT NULL,
  `checkBeginDate` datetime DEFAULT NULL,
  `checkEndDate` datetime DEFAULT NULL,
  `applicant_id` bigint(20) DEFAULT NULL,
  `checkAppDate` datetime DEFAULT NULL,
  `checkWord` varchar(255) DEFAULT NULL,
  `checkCompare` varchar(255) DEFAULT NULL,
  `bill_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of approval
-- ----------------------------
INSERT INTO `approval` VALUES ('1', '80010360109873320171226', '呵呵', '2017-12-02 08:00:00', '2017-12-09 08:00:00', '1', '2017-12-12 08:00:00', '死了', '3333', '1');
INSERT INTO `approval` VALUES ('2', '80010360108530320171226', '呵呵', '2017-12-08 08:00:00', '2017-12-15 08:00:00', '1', '2017-12-07 08:00:00', '12', '412', '2');
INSERT INTO `approval` VALUES ('3', '80010360107497020171226', '', null, null, null, null, '', '', null);
INSERT INTO `approval` VALUES ('4', '80010360107955920171226', '呵呵', '2017-12-07 08:00:00', '2017-12-16 08:00:00', '1', '2017-12-14 08:00:00', '3245', '235234', '1');
INSERT INTO `approval` VALUES ('5', '80010360104079420171227', '', null, null, '1', null, '', '', '1');
INSERT INTO `approval` VALUES ('6', '80010360101055720171227', '', null, null, '1', null, '', '', '5');
INSERT INTO `approval` VALUES ('7', '80010360107011420171227', '呵呵', '2017-12-15 08:00:00', '2017-12-08 08:00:00', '1', '2017-12-05 08:00:00', '号的', '1234', '13');
INSERT INTO `approval` VALUES ('8', '80010360105750020171227', '呵呵', '2017-12-15 08:00:00', '2017-12-08 08:00:00', '1', '2017-12-05 08:00:00', '号的', '1234', '11');
INSERT INTO `approval` VALUES ('9', '80010360106962220171227', '呵呵', '2017-12-15 08:00:00', '2017-12-15 08:00:00', '1', '2017-12-13 08:00:00', '死了', '2134', '1');
INSERT INTO `approval` VALUES ('10', '80010360107375820171227', '1234', '2017-12-20 08:00:00', '2017-12-15 08:00:00', '1', '2017-12-06 08:00:00', '214123', '124123', '2');
INSERT INTO `approval` VALUES ('11', '80010360108985120171227', ';拉德芳斯隔开', '2017-12-01 08:00:00', '2017-12-09 08:00:00', '1', '2017-12-20 08:00:00', '21413', '4234', '3');

-- ----------------------------
-- Table structure for audit
-- ----------------------------
DROP TABLE IF EXISTS `audit`;
CREATE TABLE `audit` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `auditor_id` bigint(20) DEFAULT NULL,
  `auditdate` datetime DEFAULT NULL,
  `auditcause` varchar(255) DEFAULT NULL,
  `odd` varchar(255) DEFAULT NULL,
  `checkodd` varchar(255) DEFAULT NULL,
  `bill_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of audit
-- ----------------------------
INSERT INTO `audit` VALUES ('1', '1', '2017-12-13 08:00:00', '号的123', '06101001037423820171226', '80010360109873320171226', '1');
INSERT INTO `audit` VALUES ('2', '1', '2017-12-05 08:00:00', '3412', '06101001037386220171226', '80010360108530320171226', '2');
INSERT INTO `audit` VALUES ('3', '1', '2017-12-14 08:00:00', '他太丑了,不过', '06101001037423820171226', '80010360107955920171226', '1');
INSERT INTO `audit` VALUES ('4', null, null, '', '', '', '2');
INSERT INTO `audit` VALUES ('5', '5', '2017-12-13 08:00:00', '呵呵', '06101001037386220171226', '80010360108530320171226', '2');
INSERT INTO `audit` VALUES ('6', '1', '2017-12-07 08:00:00', '太丑了', '06101001034010120171227', '80010360106962220171227', '1');
INSERT INTO `audit` VALUES ('7', '1', '2017-12-21 08:00:00', '拉的开始减肥', '06101001034010120171227', '80010360106962220171227', '1');
INSERT INTO `audit` VALUES ('8', '1', '2017-12-15 08:00:00', '通过', '06101001033858620171227', '80010360108985120171227', '3');

-- ----------------------------
-- Table structure for basicbill
-- ----------------------------
DROP TABLE IF EXISTS `basicbill`;
CREATE TABLE `basicbill` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `beginDate` date DEFAULT NULL,
  `endDate` date DEFAULT NULL,
  `inputDate` date DEFAULT NULL,
  `odd` varchar(255) DEFAULT NULL,
  `handle` varchar(255) DEFAULT NULL,
  `arbitrament` varchar(255) DEFAULT NULL,
  `payway` int(11) DEFAULT NULL,
  `businesssource` varchar(255) DEFAULT NULL,
  `channel` varchar(255) DEFAULT NULL,
  `inputUser_id` bigint(20) DEFAULT NULL,
  `appoint` int(11) DEFAULT NULL,
  `bill_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of basicbill
-- ----------------------------
INSERT INTO `basicbill` VALUES ('1', '2017-12-08', '2017-12-14', '2017-12-07', '06101001037423820171226', '213', '123', '1', '123', '124', '1', '33', '1');
INSERT INTO `basicbill` VALUES ('2', '2017-12-08', '2017-12-08', '2017-12-01', '06101001037386220171226', '123', '12', '2', '412', '124', '1', '33', '2');
INSERT INTO `basicbill` VALUES ('5', '2017-12-09', '2017-12-08', '2017-11-29', '06101001036906120171227', '1234', '123', '1', '123124', '213414', '1', '33', '5');
INSERT INTO `basicbill` VALUES ('6', null, null, null, '06101001032508520171227', '', '', '0', '', '', null, null, '11');
INSERT INTO `basicbill` VALUES ('7', '2017-12-09', '2017-12-08', '2017-12-01', '06101001038436320171227', '123', '12', '2', '412', '123', '1', '33', '12');
INSERT INTO `basicbill` VALUES ('8', '2017-12-08', '2017-12-13', '2017-12-08', '06101001036166720171227', '2345', '234', '0', '234', '235', '1', '33', '13');
INSERT INTO `basicbill` VALUES ('9', '2017-12-01', '2017-12-14', '2017-12-01', '06101001034010120171227', '124', '123', '2', '2134', '124', '1', '33', '1');
INSERT INTO `basicbill` VALUES ('10', '2017-12-09', '2017-12-08', '2017-12-01', '06101001037819520171227', '2134', '2134', '2', '123', '2134', '1', '34', '2');
INSERT INTO `basicbill` VALUES ('11', '2017-12-02', '2017-12-08', '2017-12-02', '06101001033858620171227', '324', '234', '2', '234', '234', '1', '34', '3');

-- ----------------------------
-- Table structure for bill
-- ----------------------------
DROP TABLE IF EXISTS `bill`;
CREATE TABLE `bill` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `status` tinyint(4) DEFAULT NULL,
  `applicant_id` bigint(20) DEFAULT NULL,
  `recognizee_id` bigint(20) DEFAULT NULL,
  `totalAmount` decimal(10,2) DEFAULT NULL,
  `product_id` bigint(20) DEFAULT NULL,
  `car_id` bigint(20) DEFAULT NULL,
  `basicBill_id` bigint(20) DEFAULT NULL,
  `approval_id` bigint(20) DEFAULT NULL,
  `taxandins_id` bigint(20) DEFAULT NULL,
  `pay` tinyint(4) DEFAULT NULL,
  `audit_id` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bill
-- ----------------------------
INSERT INTO `bill` VALUES ('1', '-1', '1', '1', '2100.70', '1', '9', '9', '9', '11', null, '7');
INSERT INTO `bill` VALUES ('2', '2', '1', '1', '2100.70', '1', '10', '10', '10', '12', '0', null);
INSERT INTO `bill` VALUES ('3', '3', '1', '1', '2100.70', '1', '11', '11', '11', '13', '1', '8');

-- ----------------------------
-- Table structure for car
-- ----------------------------
DROP TABLE IF EXISTS `car`;
CREATE TABLE `car` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `bill_id` bigint(20) DEFAULT NULL,
  `carBrand_id` bigint(20) DEFAULT NULL,
  `carNumber` varchar(255) DEFAULT NULL,
  `valuation` decimal(10,2) DEFAULT NULL,
  `type` tinyint(4) DEFAULT NULL,
  `size` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of car
-- ----------------------------
INSERT INTO `car` VALUES ('1', '1', '9', '12333', '123.00', '2', '1');
INSERT INTO `car` VALUES ('2', '2', '11', '1233', '123.00', '3', '3');
INSERT INTO `car` VALUES ('5', '5', '7', '12412', '3124.00', '1', '1');
INSERT INTO `car` VALUES ('6', '11', '8', '', null, '0', '0');
INSERT INTO `car` VALUES ('7', '12', '12', '124', '123.00', '1', '1');
INSERT INTO `car` VALUES ('8', '13', '7', '234', '5234.00', '1', '2');
INSERT INTO `car` VALUES ('9', '1', '12', '124', '124.00', '2', '3');
INSERT INTO `car` VALUES ('10', '2', '7', '21423', '234.00', '2', '1');
INSERT INTO `car` VALUES ('11', '3', '9', '2134', '2134.00', '1', '2');

-- ----------------------------
-- Table structure for carlossins
-- ----------------------------
DROP TABLE IF EXISTS `carlossins`;
CREATE TABLE `carlossins` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `ins` decimal(10,2) DEFAULT NULL,
  `bill_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of carlossins
-- ----------------------------

-- ----------------------------
-- Table structure for changerecord
-- ----------------------------
DROP TABLE IF EXISTS `changerecord`;
CREATE TABLE `changerecord` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `changedate` date DEFAULT NULL,
  `handler_id` bigint(20) DEFAULT NULL,
  `client_id` bigint(20) DEFAULT NULL,
  `oldman` bigint(20) DEFAULT NULL,
  `newman` bigint(20) DEFAULT NULL,
  `cause` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of changerecord
-- ----------------------------
INSERT INTO `changerecord` VALUES ('1', '2017-12-22', '1', '1', '1', '2', 'sdvfdsfdsafa');
INSERT INTO `changerecord` VALUES ('16', '2017-12-23', '1', '23', '1', '2', '林222');
INSERT INTO `changerecord` VALUES ('17', '2017-12-23', '1', '23', '1', '2', '林222');
INSERT INTO `changerecord` VALUES ('18', '2017-12-23', '1', '24', '2', '1', '林222222');
INSERT INTO `changerecord` VALUES ('19', '2017-12-24', '1', '2', '1', '2', '34');
INSERT INTO `changerecord` VALUES ('20', '2017-12-24', '1', '2', '1', '2', '34');
INSERT INTO `changerecord` VALUES ('21', '2017-12-25', '1', '3', '4', '1', '345345');
INSERT INTO `changerecord` VALUES ('22', '2017-12-25', '1', '6', '1', '2', 'gfdbhn');
INSERT INTO `changerecord` VALUES ('23', '2017-12-27', '1', '7', '1', '1', '123');

-- ----------------------------
-- Table structure for checkingin
-- ----------------------------
DROP TABLE IF EXISTS `checkingin`;
CREATE TABLE `checkingin` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `employee_id` bigint(20) DEFAULT NULL,
  `status` tinyint(4) DEFAULT NULL,
  `signtime` datetime DEFAULT NULL,
  `backtime` datetime DEFAULT NULL,
  `retime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of checkingin
-- ----------------------------
INSERT INTO `checkingin` VALUES ('1', '1', null, '2017-12-26 15:45:43', null, null);
INSERT INTO `checkingin` VALUES ('2', '1', null, '2017-12-26 15:49:23', null, null);
INSERT INTO `checkingin` VALUES ('3', null, null, null, '2017-12-26 15:49:25', null);
INSERT INTO `checkingin` VALUES ('4', '1', null, '2017-12-26 15:50:57', null, null);
INSERT INTO `checkingin` VALUES ('5', null, null, null, '2017-12-26 15:51:00', null);
INSERT INTO `checkingin` VALUES ('6', null, null, null, '2017-12-26 15:51:01', null);
INSERT INTO `checkingin` VALUES ('7', null, null, null, null, '2017-12-26 15:51:03');
INSERT INTO `checkingin` VALUES ('8', '1', null, null, '2017-12-26 15:54:14', null);
INSERT INTO `checkingin` VALUES ('9', '1', null, null, null, '2017-12-26 15:54:15');
INSERT INTO `checkingin` VALUES ('10', '1', null, null, null, '2017-12-26 15:54:18');
INSERT INTO `checkingin` VALUES ('11', '1', null, null, '2017-12-26 15:54:21', null);
INSERT INTO `checkingin` VALUES ('12', '1', null, '2017-12-26 15:54:23', null, null);
INSERT INTO `checkingin` VALUES ('13', '1', null, '2017-12-26 15:58:47', null, null);
INSERT INTO `checkingin` VALUES ('14', '1', null, null, '2017-12-26 15:58:49', null);
INSERT INTO `checkingin` VALUES ('15', '1', null, null, null, '2017-12-26 15:58:50');
INSERT INTO `checkingin` VALUES ('16', '1', null, '2017-12-27 09:56:29', null, null);
INSERT INTO `checkingin` VALUES ('17', '1', null, '2017-12-27 09:56:37', null, null);
INSERT INTO `checkingin` VALUES ('18', '1', null, '2017-12-27 09:58:28', null, null);

-- ----------------------------
-- Table structure for claimsheet
-- ----------------------------
DROP TABLE IF EXISTS `claimsheet`;
CREATE TABLE `claimsheet` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `status` int(11) DEFAULT NULL,
  `informant` varchar(255) DEFAULT NULL,
  `tel` varchar(255) DEFAULT NULL,
  `place` varchar(255) DEFAULT NULL,
  `accidentTime` datetime DEFAULT NULL,
  `sn` varchar(255) DEFAULT NULL,
  `carNumber` varchar(20) DEFAULT NULL,
  `damages` decimal(10,0) DEFAULT NULL,
  `employee_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of claimsheet
-- ----------------------------
INSERT INTO `claimsheet` VALUES ('3', '-1', '2', '2', '22', null, null, '沪888888', '500', '1');
INSERT INTO `claimsheet` VALUES ('4', '2', '老林', '1234568', '哈哈哈哈或', null, null, '沪888888', '666', '1');
INSERT INTO `claimsheet` VALUES ('6', '2', '22', '22', '22', null, null, '沪888888', '300', '1');
INSERT INTO `claimsheet` VALUES ('7', '2', '1', '1', '1', null, 'c885c503-8c58-42d9-adab-ca2c346baf7b', '沪888888', null, '1');
INSERT INTO `claimsheet` VALUES ('8', '-1', '', '666', '', '2017-12-13 09:34:13', '56258c69-4567-4e32-8acb-448f6067d87e', '沪888888', null, null);
INSERT INTO `claimsheet` VALUES ('9', '2', '666', '666', '', '2017-12-19 09:36:36', '717ff09c-dd1e-472e-8eaf-891791065dec', '沪888888', null, null);
INSERT INTO `claimsheet` VALUES ('11', '0', '', '', '', null, '71a47825-25a9-4fc2-88da-42d808642edd', null, null, null);
INSERT INTO `claimsheet` VALUES ('14', '2', '', '', '', null, '5e256217-6974-47ae-a909-20aa654c6a09', null, null, null);
INSERT INTO `claimsheet` VALUES ('15', '0', '', '', '234', null, '04e33bfe-c17f-43dd-8cbf-0dc069cb5ef5', null, null, null);
INSERT INTO `claimsheet` VALUES ('16', '-1', '林', '123', '123', '2017-12-26 09:21:11', '5ad2aef0-a41a-430f-ba3b-040add44641d', null, null, '1');
INSERT INTO `claimsheet` VALUES ('17', '2', 'dsf', 'dfsa', 'adfs', '2017-12-26 10:41:44', '19ee5426-b8fe-4398-a1e2-a43719962b98', null, null, '1');
INSERT INTO `claimsheet` VALUES ('18', '2', '林芝健', '123', '124123', '2017-12-15 13:19:36', '49cc3737-2c77-4be4-9cf3-79d166e5746a', null, null, '1');
INSERT INTO `claimsheet` VALUES ('19', '-1', '林芝健', '123', '24', '2017-12-15 14:17:09', 'c501cd8f-cfab-4cc5-bf81-014d06f39799', null, null, '1');
INSERT INTO `claimsheet` VALUES ('20', '2', '123', '1234', '1234', '2017-12-20 15:06:21', '432e6202-ce22-4fcb-875a-31a9d47161e8', null, null, '1');

-- ----------------------------
-- Table structure for client
-- ----------------------------
DROP TABLE IF EXISTS `client`;
CREATE TABLE `client` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  `gender` int(11) DEFAULT NULL,
  `tel` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `qq` varchar(255) DEFAULT NULL,
  `wechat` varchar(255) DEFAULT NULL,
  `inChargeUser_id` bigint(20) DEFAULT NULL,
  `inputUser` bigint(20) DEFAULT NULL,
  `inputTime` datetime DEFAULT NULL,
  `status` tinyint(4) DEFAULT NULL,
  `idCard` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `job` bigint(20) DEFAULT NULL,
  `salaryLevel` bigint(20) DEFAULT NULL,
  `customerSource` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of client
-- ----------------------------
INSERT INTO `client` VALUES ('1', '林芝健', '18', '1', '158878', '22@qq.com', '222', '333', '1', '1', '2017-12-13 08:00:00', '-2', '533523', null, '1', '5', '32');
INSERT INTO `client` VALUES ('2', '', null, null, '', '', '', '', '1', '1', null, '-2', '', null, '1', '2', '31');
INSERT INTO `client` VALUES ('3', '123', null, null, '', '', '', '', null, '1', null, '-1', '', null, '1', '2', '31');
INSERT INTO `client` VALUES ('4', '', null, null, '', '', '', '', '1', '1', null, '1', '', null, null, null, null);
INSERT INTO `client` VALUES ('5', '123', null, null, '', '', '', '', '1', '1', null, '0', '', null, null, null, null);
INSERT INTO `client` VALUES ('6', '林', '123', '1', '124', '123', '123', '412', '1', '1', '2017-12-27 08:00:00', '-2', '123', null, '1', '2', '31');
INSERT INTO `client` VALUES ('7', '林', '123', '1', '123', '124', '123', '124', '1', '1', '2017-12-20 08:00:00', '1', '213', null, '1', '2', '31');
INSERT INTO `client` VALUES ('8', '刘泽', '24', '0', '123', '4124', '235', '234523', '1', '1', '2017-12-04 08:00:00', '1', '23', null, '1', '2', '32');
INSERT INTO `client` VALUES ('9', '刘泽', '24', '0', '34', '', '', '', '1', '1', null, '1', '', null, '1', '2', '32');

-- ----------------------------
-- Table structure for clientrecord
-- ----------------------------
DROP TABLE IF EXISTS `clientrecord`;
CREATE TABLE `clientrecord` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `result` varchar(255) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `inputuser_id` bigint(20) DEFAULT NULL,
  `client_id` bigint(20) DEFAULT NULL,
  `theme` varchar(255) DEFAULT NULL,
  `way` bigint(20) DEFAULT NULL,
  `details` varchar(255) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `status` bit(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of clientrecord
-- ----------------------------
INSERT INTO `clientrecord` VALUES ('1', '大师傅', '2017-12-22', null, '1', '大丰收', '28', '到事发地时', '1', '');
INSERT INTO `clientrecord` VALUES ('2', '大师傅2', '2017-12-22', '2', '1', '大丰收', '29', '到事发地时', '阿萨德', '\0');
INSERT INTO `clientrecord` VALUES ('4', 'afsd', '2017-12-26', '1', '1', 'asdf', '28', 'afds', 'asdf', '');
INSERT INTO `clientrecord` VALUES ('5', '', '2017-12-26', '1', '1', 'adf', '28', 'afd', '', '');
INSERT INTO `clientrecord` VALUES ('6', '', '2017-12-26', '1', '1', '', '28', '', '', '\0');
INSERT INTO `clientrecord` VALUES ('7', '213', '2017-12-14', '1', '2', '123', '29', '12', '123', '');
INSERT INTO `clientrecord` VALUES ('8', '123', '2017-12-19', '1', '3', '12', '29', '123', '213', '\0');

-- ----------------------------
-- Table structure for company
-- ----------------------------
DROP TABLE IF EXISTS `company`;
CREATE TABLE `company` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `sn` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `status` bit(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of company
-- ----------------------------
INSERT INTO `company` VALUES ('1', 'fdas', '大保健公司', '');
INSERT INTO `company` VALUES ('2', 'dsfa', 'dsaf', '');
INSERT INTO `company` VALUES ('3', 'dsaf', 'dsfa', '\0');
INSERT INTO `company` VALUES ('4', '123', '123', '\0');
INSERT INTO `company` VALUES ('5', 'fsad', 'esdf', '\0');

-- ----------------------------
-- Table structure for department
-- ----------------------------
DROP TABLE IF EXISTS `department`;
CREATE TABLE `department` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `sn` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `state` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of department
-- ----------------------------
INSERT INTO `department` VALUES ('1', 'MGR', '总经办', '1');
INSERT INTO `department` VALUES ('4', '2', '2', '1');

-- ----------------------------
-- Table structure for developandloserecord
-- ----------------------------
DROP TABLE IF EXISTS `developandloserecord`;
CREATE TABLE `developandloserecord` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `date` date DEFAULT NULL,
  `client_id` bigint(20) DEFAULT NULL,
  `inChargeUser_id` bigint(20) DEFAULT NULL,
  `cause` varchar(255) DEFAULT NULL,
  `status` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of developandloserecord
-- ----------------------------
INSERT INTO `developandloserecord` VALUES ('3', '2017-12-22', '1', '1', '他死了', '-1');
INSERT INTO `developandloserecord` VALUES ('10', '2017-12-13', '1', '1', '也死了', '-2');
INSERT INTO `developandloserecord` VALUES ('12', '2017-12-14', '2', '2', '12', '-1');
INSERT INTO `developandloserecord` VALUES ('15', '2017-11-30', '21', null, '林', '-1');
INSERT INTO `developandloserecord` VALUES ('16', '2017-11-16', '22', null, '太', '-1');
INSERT INTO `developandloserecord` VALUES ('17', '2017-12-23', '25', null, 'asdasd', '-1');
INSERT INTO `developandloserecord` VALUES ('18', '2017-12-06', '26', null, 'sile ', '-1');
INSERT INTO `developandloserecord` VALUES ('19', null, '6', null, '', '-2');
INSERT INTO `developandloserecord` VALUES ('20', '2017-11-30', '2', null, '123', '-2');
INSERT INTO `developandloserecord` VALUES ('21', '2017-12-06', '3', null, '2134', '-2');
INSERT INTO `developandloserecord` VALUES ('22', '2017-12-25', '5', null, 'asd', '-2');
INSERT INTO `developandloserecord` VALUES ('23', '2017-12-04', '3', null, '真撞了', '-2');
INSERT INTO `developandloserecord` VALUES ('24', '2017-12-13', '8', null, '他死了', '-1');
INSERT INTO `developandloserecord` VALUES ('25', '2017-11-30', '1', null, '死了', '-2');
INSERT INTO `developandloserecord` VALUES ('26', '2017-11-30', '2', null, '死了', '-2');
INSERT INTO `developandloserecord` VALUES ('27', '2017-12-01', '3', null, '2143', '-1');
INSERT INTO `developandloserecord` VALUES ('28', '2017-11-30', '1', null, '123', '-1');
INSERT INTO `developandloserecord` VALUES ('29', '2017-12-01', '4', null, '死了', '-2');
INSERT INTO `developandloserecord` VALUES ('30', '2017-11-29', '5', null, '阿斯蒂芬', '-2');
INSERT INTO `developandloserecord` VALUES ('31', '2017-12-20', '1', null, '死了', '-2');

-- ----------------------------
-- Table structure for dictionary_detail
-- ----------------------------
DROP TABLE IF EXISTS `dictionary_detail`;
CREATE TABLE `dictionary_detail` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `parent_id` bigint(20) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `intro` varchar(255) DEFAULT NULL,
  `state` bit(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dictionary_detail
-- ----------------------------
INSERT INTO `dictionary_detail` VALUES ('1', '1', '程序员', '实力与发量成反比', '');
INSERT INTO `dictionary_detail` VALUES ('2', '2', '3000以下', '', '');
INSERT INTO `dictionary_detail` VALUES ('3', '2', '3000-5000', '', '');
INSERT INTO `dictionary_detail` VALUES ('4', '2', '5000-10000', '', '');
INSERT INTO `dictionary_detail` VALUES ('5', '2', '10000-30000', '', '');
INSERT INTO `dictionary_detail` VALUES ('6', '2', '30000以上', '', '');
INSERT INTO `dictionary_detail` VALUES ('7', '5', '丰田', '', '');
INSERT INTO `dictionary_detail` VALUES ('8', '5', '本田', '', '');
INSERT INTO `dictionary_detail` VALUES ('9', '5', '三菱', '', '');
INSERT INTO `dictionary_detail` VALUES ('11', '5', '大众', '', '');
INSERT INTO `dictionary_detail` VALUES ('12', '5', '起亚', '', '');
INSERT INTO `dictionary_detail` VALUES ('13', '5', '奥迪', '', '');
INSERT INTO `dictionary_detail` VALUES ('14', '5', '宝马', '', '');
INSERT INTO `dictionary_detail` VALUES ('15', '5', '福特', '', '');
INSERT INTO `dictionary_detail` VALUES ('16', '5', '现代', '', '');
INSERT INTO `dictionary_detail` VALUES ('17', '5', '标致', '', '');
INSERT INTO `dictionary_detail` VALUES ('18', '5', '奔驰', '', '');
INSERT INTO `dictionary_detail` VALUES ('19', '5', '别克', '', '');
INSERT INTO `dictionary_detail` VALUES ('20', '5', '比亚迪', '', '');
INSERT INTO `dictionary_detail` VALUES ('21', '5', '马自达', '', '');
INSERT INTO `dictionary_detail` VALUES ('22', '5', '路虎', '', '');
INSERT INTO `dictionary_detail` VALUES ('23', '5', '保时捷', '', '');
INSERT INTO `dictionary_detail` VALUES ('24', '5', '兰博基尼', '', '');
INSERT INTO `dictionary_detail` VALUES ('25', '5', '沃尔沃', '', '');
INSERT INTO `dictionary_detail` VALUES ('26', '5', '玛莎拉蒂', '', '');
INSERT INTO `dictionary_detail` VALUES ('27', '5', '宾利', '', '');
INSERT INTO `dictionary_detail` VALUES ('28', '4', '面谈', null, '');
INSERT INTO `dictionary_detail` VALUES ('29', '4', '电话联系', null, '');
INSERT INTO `dictionary_detail` VALUES ('30', '4', '上门服务', null, '');
INSERT INTO `dictionary_detail` VALUES ('31', '3', '电话', null, '');
INSERT INTO `dictionary_detail` VALUES ('32', '3', '你好', null, '');
INSERT INTO `dictionary_detail` VALUES ('33', '6', '你爱咋写咋写', null, '');
INSERT INTO `dictionary_detail` VALUES ('34', '6', '你就这么写', null, '');
INSERT INTO `dictionary_detail` VALUES ('35', '6', '我是你吧', null, '');
INSERT INTO `dictionary_detail` VALUES ('36', '7', 'DATE_FORMAT(c.inputTime,\'%Y\')', '年', '');
INSERT INTO `dictionary_detail` VALUES ('37', '7', 'DATE_FORMAT(c.inputTime,\'%Y-%M\')', '月', '');

-- ----------------------------
-- Table structure for dictionary_directory
-- ----------------------------
DROP TABLE IF EXISTS `dictionary_directory`;
CREATE TABLE `dictionary_directory` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `sn` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `intro` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dictionary_directory
-- ----------------------------
INSERT INTO `dictionary_directory` VALUES ('1', 'job', '职业', '就是职业喽...');
INSERT INTO `dictionary_directory` VALUES ('2', 'salaryLevel', '收入水平', '这是广大客户的收入选项');
INSERT INTO `dictionary_directory` VALUES ('3', 'customerSource', '客户来源', '客户哪来的，捡来的？');
INSERT INTO `dictionary_directory` VALUES ('4', 'type', '实施方式', '开发客户，跟进客户的方式');
INSERT INTO `dictionary_directory` VALUES ('5', 'carBrand', '车辆品牌', '有钱，任性，没钱，呵呵');
INSERT INTO `dictionary_directory` VALUES ('6', 'appoint', '固定特别约定', '爱咋写咋写');
INSERT INTO `dictionary_directory` VALUES ('7', 'time', '时间格式', '报表查询用到');

-- ----------------------------
-- Table structure for employee
-- ----------------------------
DROP TABLE IF EXISTS `employee`;
CREATE TABLE `employee` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `username` varchar(20) DEFAULT NULL,
  `realname` varchar(20) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `tel` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `dept_id` bigint(20) DEFAULT NULL,
  `inputtime` date DEFAULT NULL,
  `state` tinyint(1) DEFAULT NULL,
  `admin` bit(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of employee
-- ----------------------------
INSERT INTO `employee` VALUES ('1', 'admin', 'admin', '6d45fd76d5e9c6a404e39c25106a7f032659acb8', '110', 'admin@admin.com', '1', '2017-12-17', '1', '');
INSERT INTO `employee` VALUES ('2', 'adf1', 'adsf', '6d45fd76d5e9c6a404e39c25106a7f032659acb8', '123', '123@qq.com', '1', '2017-12-21', '1', '\0');
INSERT INTO `employee` VALUES ('3', '', '', 'be1bdec0aa74b4dcb079943e70528096cca985f8', '', '', null, null, '1', '\0');
INSERT INTO `employee` VALUES ('4', '123', '', '23ae809ddacaf96af0fd78ed04b6a265e05aa257', '', '', null, null, '1', '\0');
INSERT INTO `employee` VALUES ('5', 'qaz', '123', '6d45fd76d5e9c6a404e39c25106a7f032659acb8', null, null, null, null, null, '');
INSERT INTO `employee` VALUES ('6', 'zxc', 'zxc', '9cafcd488efdb07f86fe1cc9b0b922a8e81030a4', 'zxc', 'zxc', '1', '2017-12-26', '1', '\0');

-- ----------------------------
-- Table structure for employee_role
-- ----------------------------
DROP TABLE IF EXISTS `employee_role`;
CREATE TABLE `employee_role` (
  `employee_id` bigint(20) DEFAULT NULL,
  `role_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of employee_role
-- ----------------------------
INSERT INTO `employee_role` VALUES ('2', '1');

-- ----------------------------
-- Table structure for guarantee
-- ----------------------------
DROP TABLE IF EXISTS `guarantee`;
CREATE TABLE `guarantee` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `sn` varchar(255) DEFAULT NULL,
  `productName` varchar(255) DEFAULT NULL,
  `client` varchar(255) DEFAULT NULL,
  `dueTime` date DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `status` bit(1) DEFAULT NULL,
  `guaranteeItem` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of guarantee
-- ----------------------------
INSERT INTO `guarantee` VALUES ('5', '22', '22', '22', '2017-12-28', '222', '\0', null);
INSERT INTO `guarantee` VALUES ('7', '11', '11', '11', '2017-11-28', '11', '\0', null);
INSERT INTO `guarantee` VALUES ('8', '22', '22', '22', '2017-12-23', '22', '', null);
INSERT INTO `guarantee` VALUES ('9', '22', '22', '22', '2017-11-28', '22', '', null);
INSERT INTO `guarantee` VALUES ('10', '22', '22', '22', '2017-12-06', '22', '', null);
INSERT INTO `guarantee` VALUES ('11', '46967fc0-3921-4f5c-8586-b252a82b144d', '333', '333', '2017-12-23', '33', '\0', null);

-- ----------------------------
-- Table structure for menu
-- ----------------------------
DROP TABLE IF EXISTS `menu`;
CREATE TABLE `menu` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `text` varchar(255) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `parent_id` bigint(20) DEFAULT NULL,
  `permission_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of menu
-- ----------------------------
INSERT INTO `menu` VALUES ('1', '系统管理', null, null, null);
INSERT INTO `menu` VALUES ('2', '员工管理', '/employee/view.do', '1', '6');
INSERT INTO `menu` VALUES ('3', '部门管理', '/department/view.do', '1', '2');
INSERT INTO `menu` VALUES ('4', '角色管理', '/role/view.do', '1', '10');
INSERT INTO `menu` VALUES ('5', '菜单管理', '/menu/view.do', '1', '3');
INSERT INTO `menu` VALUES ('8', '权限管理', '/permission/view.do', '1', '3');
INSERT INTO `menu` VALUES ('9', '系统日志管理', '/systemLog/view.do', '1', '13');
INSERT INTO `menu` VALUES ('10', '客户管理', null, null, null);
INSERT INTO `menu` VALUES ('11', '潜在客户管理', '/client/view.do', '10', null);
INSERT INTO `menu` VALUES ('12', '正式客户管理', '/officialClient/view.do', '10', null);
INSERT INTO `menu` VALUES ('13', '数据字典', '/dictionaryDirectory/view.do', '1', null);
INSERT INTO `menu` VALUES ('14', '资源池', '/pool/view.do', '10', null);
INSERT INTO `menu` VALUES ('16', '失败记录', '/developAndLoseRecord/view.do', '10', null);
INSERT INTO `menu` VALUES ('17', '流失记录', '/developAndLoseRecord/viewOff.do', '10', null);
INSERT INTO `menu` VALUES ('18', '客户移交记录', '/changeRecord/view.do', '10', null);
INSERT INTO `menu` VALUES ('19', '工资模块', '/wages/view.do', '1', null);
INSERT INTO `menu` VALUES ('20', '正式客户跟进计划', '/clientRecord/view.do', '10', null);
INSERT INTO `menu` VALUES ('21', '潜在用户开发计划', '/clientRecord/viewOff.do', '10', null);
INSERT INTO `menu` VALUES ('22', '售后管理', '/guarantee/view.do', '1', null);
INSERT INTO `menu` VALUES ('23', '保单管理', null, null, null);
INSERT INTO `menu` VALUES ('24', '被拒保单', '/bill/view.do', '23', null);
INSERT INTO `menu` VALUES ('25', '新增投保', '/bill/add.do', '23', null);
INSERT INTO `menu` VALUES ('26', '信息管理', null, null, null);
INSERT INTO `menu` VALUES ('27', '产品管理', '/product/view.do', '26', null);
INSERT INTO `menu` VALUES ('28', '合作公司管理', '/company/view.do', '26', null);
INSERT INTO `menu` VALUES ('29', '车辆管理', '/car/view.do', '26', null);
INSERT INTO `menu` VALUES ('30', '理赔管理', '', null, null);
INSERT INTO `menu` VALUES ('31', '待审核单', '/claimsheet/view.do', '30', null);
INSERT INTO `menu` VALUES ('32', '待批改单', '/bill/checkView.do', '23', null);
INSERT INTO `menu` VALUES ('33', '待审核单', '/bill/auditView.do', '23', null);
INSERT INTO `menu` VALUES ('34', '暂存单', '/bill/momentView.do', '23', null);
INSERT INTO `menu` VALUES ('35', '审核单', '/claimsheet/examine.do', '30', null);
INSERT INTO `menu` VALUES ('36', '拒保单', '/claimsheet/exclusions.do', '30', null);
INSERT INTO `menu` VALUES ('37', '理赔单', '/claimsheet/complete.do', '30', null);
INSERT INTO `menu` VALUES ('38', '已通过', '/bill/orderView.do', '23', null);
INSERT INTO `menu` VALUES ('39', '报表模块', '', null, null);
INSERT INTO `menu` VALUES ('40', '正式客户新增报表', '/clientReport/view.do', '39', null);
INSERT INTO `menu` VALUES ('43', '潜在客户新增报表', '/chart/view.do', '39', null);

-- ----------------------------
-- Table structure for orderofcontract
-- ----------------------------
DROP TABLE IF EXISTS `orderofcontract`;
CREATE TABLE `orderofcontract` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `signtime` datetime DEFAULT NULL,
  `totalsum` decimal(10,0) DEFAULT NULL,
  `sum` decimal(10,0) DEFAULT NULL,
  `intro` varchar(255) DEFAULT NULL,
  `creatatime` datetime DEFAULT NULL,
  `modifytime` datetime DEFAULT NULL,
  `status` tinyint(4) DEFAULT NULL,
  `sn` varchar(255) DEFAULT NULL,
  `money` decimal(10,0) DEFAULT NULL,
  `paytime` datetime DEFAULT NULL,
  `file` varchar(255) DEFAULT NULL,
  `clientorder` varchar(255) DEFAULT NULL,
  `employee_seller` bigint(20) DEFAULT NULL,
  `employee_modifuser` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of orderofcontract
-- ----------------------------
INSERT INTO `orderofcontract` VALUES ('1', '2017-12-14 16:03:30', '23', '23', '23', '2017-12-12 16:03:39', '2017-12-13 16:03:44', '2', null, '23', '2017-12-11 16:03:51', null, 'wer1', '1', '1');
INSERT INTO `orderofcontract` VALUES ('2', '2017-12-23 11:45:00', '23', '234', 'wer', null, null, '2', '1', null, null, null, 'wer2', '1', null);
INSERT INTO `orderofcontract` VALUES ('3', null, '23', '24', 'ter', null, null, '0', null, null, null, null, 'wer4', '1', null);
INSERT INTO `orderofcontract` VALUES ('4', '2017-12-23 12:01:51', '23', '24', 'ter', null, null, '2', '1', null, null, null, 'w232', '1', null);
INSERT INTO `orderofcontract` VALUES ('5', '2017-12-23 12:02:06', '23', '24', 'ter', null, null, '1', null, null, null, null, 'w23', '1', null);
INSERT INTO `orderofcontract` VALUES ('7', '2017-12-23 12:52:23', '12', '123', 'qq', null, null, '2', null, null, null, null, 'aa11', '1', null);
INSERT INTO `orderofcontract` VALUES ('14', null, '234123', '234123', 'w', null, null, '1', null, null, null, null, 'sa', '1', null);
INSERT INTO `orderofcontract` VALUES ('15', '2017-12-23 17:08:16', '23', '23', 'sdf', null, null, '0', null, null, null, null, 'sdfs', '1', null);
INSERT INTO `orderofcontract` VALUES ('16', '2017-12-23 20:55:31', '234', '234', 'wer', null, null, '0', null, null, null, null, 'wer', '1', null);
INSERT INTO `orderofcontract` VALUES ('17', null, '234', '456', 'wanc', null, null, '0', null, null, null, null, 'er', '1', null);
INSERT INTO `orderofcontract` VALUES ('18', '2017-12-26 16:48:52', '234', '234', 'wrer', null, null, '0', null, null, null, null, 'wer', '1', null);
INSERT INTO `orderofcontract` VALUES ('19', '2017-12-26 16:49:07', '234', '234', 'werwer', null, null, '1', null, null, null, null, '23423', '1', null);
INSERT INTO `orderofcontract` VALUES ('20', '2017-12-26 16:50:12', '234', '234', 'werwerw', null, null, '0', null, null, null, null, 'werwer', '1', null);
INSERT INTO `orderofcontract` VALUES ('21', '2017-12-26 16:52:04', '234', '23', 'wrer', null, null, '0', null, null, null, null, '234', '1', null);
INSERT INTO `orderofcontract` VALUES ('22', '2017-12-26 16:52:29', '234', '234', 'werw', null, null, '0', null, null, null, null, 'werw', '1', null);
INSERT INTO `orderofcontract` VALUES ('23', '2017-12-26 16:53:59', '234', '234', 'sdfs', null, null, '0', null, null, null, null, 'werwerwrwe', '1', null);
INSERT INTO `orderofcontract` VALUES ('24', '2017-12-26 16:57:28', '234', '234', 'sdfs', null, null, '0', null, null, null, null, 'rwer', '1', null);
INSERT INTO `orderofcontract` VALUES ('25', '2017-12-26 16:59:38', '342', '234', 'rwer', null, null, '0', null, null, null, null, 'werwerwerw', '1', null);
INSERT INTO `orderofcontract` VALUES ('26', '2017-12-26 17:09:18', '23', '234', 'wrewe', null, null, '0', null, null, null, null, 'werw', '1', null);

-- ----------------------------
-- Table structure for permission
-- ----------------------------
DROP TABLE IF EXISTS `permission`;
CREATE TABLE `permission` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `resource` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of permission
-- ----------------------------
INSERT INTO `permission` VALUES ('1', '部门列表', 'department:query');
INSERT INTO `permission` VALUES ('2', '部门查询', 'department:view');
INSERT INTO `permission` VALUES ('3', '部门生/失效', 'department:changeState');
INSERT INTO `permission` VALUES ('4', '部门新增/修改', 'department:saveOrUpdate');
INSERT INTO `permission` VALUES ('5', '员工列表', 'employee:query');
INSERT INTO `permission` VALUES ('6', '员工查询', 'employee:view');
INSERT INTO `permission` VALUES ('7', '员工复/离职', 'employee:changeState');
INSERT INTO `permission` VALUES ('8', '员工新增/修改', 'employee:saveOrUpdate');
INSERT INTO `permission` VALUES ('9', '角色列表', 'role:query');
INSERT INTO `permission` VALUES ('10', '角色查询', 'role:view');
INSERT INTO `permission` VALUES ('11', '角色新增/修改', 'role:saveOrUpdate');
INSERT INTO `permission` VALUES ('12', '系统日志列表', 'systemLog:query');
INSERT INTO `permission` VALUES ('13', '系统日志查询', 'systemLog:view');

-- ----------------------------
-- Table structure for plan
-- ----------------------------
DROP TABLE IF EXISTS `plan`;
CREATE TABLE `plan` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `planTime` datetime DEFAULT NULL,
  `planSubject` varchar(255) DEFAULT NULL,
  `planDetails` varchar(255) DEFAULT NULL,
  `traceResult` tinyint(4) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `customer_id` bigint(20) DEFAULT NULL,
  `inputUser_id` bigint(20) DEFAULT NULL,
  `inputTime` datetime DEFAULT NULL,
  `type` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of plan
-- ----------------------------
INSERT INTO `plan` VALUES ('1', '2017-12-05 08:00:00', '你好', '呵呵', null, '嘻嘻', null, '1', null, null);
INSERT INTO `plan` VALUES ('2', '2017-12-14 08:00:00', '23', '23', null, '23', '3', '1', null, null);
INSERT INTO `plan` VALUES ('3', '2017-12-12 08:00:00', '打飞机', '123', null, '11', '2', '1', null, null);
INSERT INTO `plan` VALUES ('4', '2017-12-14 08:00:00', '23', '44', null, '2323', '4', '1', null, null);
INSERT INTO `plan` VALUES ('5', '2017-12-05 08:00:00', '23', '2332', null, '23', '5', '1', '2017-12-21 23:43:30', null);
INSERT INTO `plan` VALUES ('6', '2017-12-14 08:00:00', '电费', '电费', null, '额', '1', '1', '2017-12-22 14:39:38', null);
INSERT INTO `plan` VALUES ('7', '2017-12-14 08:00:00', '34', '34', null, '34', '2', '1', '2017-12-22 14:41:02', null);
INSERT INTO `plan` VALUES ('8', '2017-12-06 08:00:00', '吃饭', '池肯德基', null, '不吃打死他哥傻逼', null, '1', '2017-12-22 17:59:06', null);

-- ----------------------------
-- Table structure for product
-- ----------------------------
DROP TABLE IF EXISTS `product`;
CREATE TABLE `product` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `company_id` bigint(20) DEFAULT NULL,
  `years` int(11) DEFAULT NULL,
  `amount` decimal(10,2) DEFAULT NULL,
  `years_amount` decimal(10,2) DEFAULT NULL,
  `status` bit(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of product
-- ----------------------------
INSERT INTO `product` VALUES ('1', '阿斯蒂芬', '1', '10', '21007.00', '2100.70', '');
INSERT INTO `product` VALUES ('2', 'SDF', '1', '1', '39013.00', '3901.30', '');
INSERT INTO `product` VALUES ('3', 'dsaf', '2', '1', '11111111.00', '0.00', '');
INSERT INTO `product` VALUES ('4', '23', '1', '1', '23.00', '0.00', '');
INSERT INTO `product` VALUES ('5', '我是你爷爷', '1', '522', '2312.00', '1234.00', '');
INSERT INTO `product` VALUES ('6', '你好保险', '1', '1234', '134.00', '14.00', '');
INSERT INTO `product` VALUES ('7', '234', '1', '23', '234.00', '234.00', '');
INSERT INTO `product` VALUES ('8', '', null, null, null, null, '');

-- ----------------------------
-- Table structure for report
-- ----------------------------
DROP TABLE IF EXISTS `report`;
CREATE TABLE `report` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  `iccard` varchar(255) DEFAULT NULL,
  `tel` varchar(255) DEFAULT NULL,
  `client_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of report
-- ----------------------------
INSERT INTO `report` VALUES ('1', 'xiaomgin', '23', 'werwr', '234234', '1');
INSERT INTO `report` VALUES ('2', 'xiaohong', '23', 'ertert', '110', '2');
INSERT INTO `report` VALUES ('3', '张三', '34', 'et', '120', '3');
INSERT INTO `report` VALUES ('4', '李四', '345', 'sfds', '119', '4');
INSERT INTO `report` VALUES ('5', null, null, null, null, '5');
INSERT INTO `report` VALUES ('6', null, null, null, null, '6');
INSERT INTO `report` VALUES ('7', null, null, null, null, '7');

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `sn` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES ('1', '额', '额 ');

-- ----------------------------
-- Table structure for role_permission
-- ----------------------------
DROP TABLE IF EXISTS `role_permission`;
CREATE TABLE `role_permission` (
  `role_id` bigint(20) DEFAULT NULL,
  `permission_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of role_permission
-- ----------------------------
INSERT INTO `role_permission` VALUES ('1', '3');

-- ----------------------------
-- Table structure for systemlog
-- ----------------------------
DROP TABLE IF EXISTS `systemlog`;
CREATE TABLE `systemlog` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `opuser_id` bigint(20) DEFAULT NULL,
  `optime` datetime DEFAULT NULL,
  `opip` varchar(255) DEFAULT NULL,
  `function` varchar(255) DEFAULT NULL,
  `params` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=545 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of systemlog
-- ----------------------------
INSERT INTO `systemlog` VALUES ('1', null, '2017-12-27 14:08:40', '0:0:0:0:0:0:0:1', 'cn.wolfcode.crm.service.impl.EmployeeServiceImpl:selectByUsername', 'cn.wolfcode.crm.service.impl.EmployeeServiceImpl:selectByUsername');
INSERT INTO `systemlog` VALUES ('2', '1', '2017-12-27 14:08:43', '0:0:0:0:0:0:0:1', 'cn.wolfcode.crm.service.impl.MenuServiceImpl:selectByParentIdAndEmployeeId', 'cn.wolfcode.crm.service.impl.MenuServiceImpl:selectByParentIdAndEmployeeId');
INSERT INTO `systemlog` VALUES ('3', '1', '2017-12-27 14:08:43', '0:0:0:0:0:0:0:1', 'cn.wolfcode.crm.service.impl.MenuServiceImpl:selectByParentIdAndEmployeeId', 'cn.wolfcode.crm.service.impl.MenuServiceImpl:selectByParentIdAndEmployeeId');
INSERT INTO `systemlog` VALUES ('4', '1', '2017-12-27 14:08:43', '0:0:0:0:0:0:0:1', 'cn.wolfcode.crm.service.impl.MenuServiceImpl:selectByParentIdAndEmployeeId', 'cn.wolfcode.crm.service.impl.MenuServiceImpl:selectByParentIdAndEmployeeId');
INSERT INTO `systemlog` VALUES ('5', '1', '2017-12-27 14:08:44', '0:0:0:0:0:0:0:1', 'cn.wolfcode.crm.service.impl.MenuServiceImpl:selectByParentIdAndEmployeeId', 'cn.wolfcode.crm.service.impl.MenuServiceImpl:selectByParentIdAndEmployeeId');
INSERT INTO `systemlog` VALUES ('6', '1', '2017-12-27 14:08:44', '0:0:0:0:0:0:0:1', 'cn.wolfcode.crm.service.impl.MenuServiceImpl:selectByParentIdAndEmployeeId', 'cn.wolfcode.crm.service.impl.MenuServiceImpl:selectByParentIdAndEmployeeId');
INSERT INTO `systemlog` VALUES ('7', '1', '2017-12-27 14:11:36', '0:0:0:0:0:0:0:1', 'cn.wolfcode.crm.service.impl.MenuServiceImpl:selectByParentIdAndEmployeeId', 'cn.wolfcode.crm.service.impl.MenuServiceImpl:selectByParentIdAndEmployeeId');
INSERT INTO `systemlog` VALUES ('8', '1', '2017-12-27 14:11:36', '0:0:0:0:0:0:0:1', 'cn.wolfcode.crm.service.impl.MenuServiceImpl:selectByParentIdAndEmployeeId', 'cn.wolfcode.crm.service.impl.MenuServiceImpl:selectByParentIdAndEmployeeId');
INSERT INTO `systemlog` VALUES ('9', '1', '2017-12-27 14:11:37', '0:0:0:0:0:0:0:1', 'cn.wolfcode.crm.service.impl.MenuServiceImpl:selectByParentIdAndEmployeeId', 'cn.wolfcode.crm.service.impl.MenuServiceImpl:selectByParentIdAndEmployeeId');
INSERT INTO `systemlog` VALUES ('10', '1', '2017-12-27 14:11:37', '0:0:0:0:0:0:0:1', 'cn.wolfcode.crm.service.impl.MenuServiceImpl:selectByParentIdAndEmployeeId', 'cn.wolfcode.crm.service.impl.MenuServiceImpl:selectByParentIdAndEmployeeId');
INSERT INTO `systemlog` VALUES ('11', '1', '2017-12-27 14:11:37', '0:0:0:0:0:0:0:1', 'cn.wolfcode.crm.service.impl.MenuServiceImpl:selectByParentIdAndEmployeeId', 'cn.wolfcode.crm.service.impl.MenuServiceImpl:selectByParentIdAndEmployeeId');
INSERT INTO `systemlog` VALUES ('12', '1', '2017-12-27 14:11:37', '0:0:0:0:0:0:0:1', 'cn.wolfcode.crm.service.impl.MenuServiceImpl:selectByParentIdAndEmployeeId', 'cn.wolfcode.crm.service.impl.MenuServiceImpl:selectByParentIdAndEmployeeId');
INSERT INTO `systemlog` VALUES ('13', '1', '2017-12-27 14:11:44', '0:0:0:0:0:0:0:1', 'cn.wolfcode.crm.service.impl.ClientReportServiceImpl:formalClient', 'cn.wolfcode.crm.service.impl.ClientReportServiceImpl:formalClient');
INSERT INTO `systemlog` VALUES ('14', '1', '2017-12-27 14:11:45', '0:0:0:0:0:0:0:1', 'cn.wolfcode.crm.service.impl.DictionaryDetailServiceImpl:selectByParentSn', 'cn.wolfcode.crm.service.impl.DictionaryDetailServiceImpl:selectByParentSn');
INSERT INTO `systemlog` VALUES ('15', '1', '2017-12-27 14:11:46', '0:0:0:0:0:0:0:1', 'cn.wolfcode.crm.service.impl.ClientReportServiceImpl:formalClient', 'cn.wolfcode.crm.service.impl.ClientReportServiceImpl:formalClient');
INSERT INTO `systemlog` VALUES ('16', '1', '2017-12-27 14:11:46', '0:0:0:0:0:0:0:1', 'cn.wolfcode.crm.service.impl.DictionaryDetailServiceImpl:selectByParentSn', 'cn.wolfcode.crm.service.impl.DictionaryDetailServiceImpl:selectByParentSn');
INSERT INTO `systemlog` VALUES ('17', '1', '2017-12-27 14:11:49', '0:0:0:0:0:0:0:1', 'cn.wolfcode.crm.service.impl.FormsServiceImpl:saleChart', 'cn.wolfcode.crm.service.impl.FormsServiceImpl:saleChart');
INSERT INTO `systemlog` VALUES ('18', '1', '2017-12-27 14:11:51', '0:0:0:0:0:0:0:1', 'cn.wolfcode.crm.service.impl.FormsServiceImpl:saleChart', 'cn.wolfcode.crm.service.impl.FormsServiceImpl:saleChart');
INSERT INTO `systemlog` VALUES ('19', '1', '2017-12-27 14:11:53', '0:0:0:0:0:0:0:1', 'cn.wolfcode.crm.service.impl.FormsServiceImpl:saleChart', 'cn.wolfcode.crm.service.impl.FormsServiceImpl:saleChart');
INSERT INTO `systemlog` VALUES ('20', null, '2017-12-27 14:33:32', '0:0:0:0:0:0:0:1', 'cn.wolfcode.crm.service.impl.EmployeeServiceImpl:selectByUsername', 'cn.wolfcode.crm.service.impl.EmployeeServiceImpl:selectByUsername');
INSERT INTO `systemlog` VALUES ('21', '1', '2017-12-27 14:33:36', '0:0:0:0:0:0:0:1', 'cn.wolfcode.crm.service.impl.MenuServiceImpl:selectByParentIdAndEmployeeId', 'cn.wolfcode.crm.service.impl.MenuServiceImpl:selectByParentIdAndEmployeeId');
INSERT INTO `systemlog` VALUES ('22', '1', '2017-12-27 14:33:37', '0:0:0:0:0:0:0:1', 'cn.wolfcode.crm.service.impl.MenuServiceImpl:selectByParentIdAndEmployeeId', 'cn.wolfcode.crm.service.impl.MenuServiceImpl:selectByParentIdAndEmployeeId');
INSERT INTO `systemlog` VALUES ('23', '1', '2017-12-27 14:33:37', '0:0:0:0:0:0:0:1', 'cn.wolfcode.crm.service.impl.MenuServiceImpl:selectByParentIdAndEmployeeId', 'cn.wolfcode.crm.service.impl.MenuServiceImpl:selectByParentIdAndEmployeeId');
INSERT INTO `systemlog` VALUES ('24', '1', '2017-12-27 14:33:37', '0:0:0:0:0:0:0:1', 'cn.wolfcode.crm.service.impl.MenuServiceImpl:selectByParentIdAndEmployeeId', 'cn.wolfcode.crm.service.impl.MenuServiceImpl:selectByParentIdAndEmployeeId');
INSERT INTO `systemlog` VALUES ('25', '1', '2017-12-27 14:33:37', '0:0:0:0:0:0:0:1', 'cn.wolfcode.crm.service.impl.MenuServiceImpl:selectByParentIdAndEmployeeId', 'cn.wolfcode.crm.service.impl.MenuServiceImpl:selectByParentIdAndEmployeeId');
INSERT INTO `systemlog` VALUES ('26', '1', '2017-12-27 14:33:37', '0:0:0:0:0:0:0:1', 'cn.wolfcode.crm.service.impl.MenuServiceImpl:selectByParentIdAndEmployeeId', 'cn.wolfcode.crm.service.impl.MenuServiceImpl:selectByParentIdAndEmployeeId');
INSERT INTO `systemlog` VALUES ('27', null, '2017-12-27 14:30:46', '0:0:0:0:0:0:0:1', 'cn.wolfcode.crm.service.impl.EmployeeServiceImpl:selectByUsername', 'cn.wolfcode.crm.service.impl.EmployeeServiceImpl:selectByUsername');
INSERT INTO `systemlog` VALUES ('28', '1', '2017-12-27 14:30:48', '0:0:0:0:0:0:0:1', 'cn.wolfcode.crm.service.impl.MenuServiceImpl:selectByParentIdAndEmployeeId', 'cn.wolfcode.crm.service.impl.MenuServiceImpl:selectByParentIdAndEmployeeId');
INSERT INTO `systemlog` VALUES ('29', '1', '2017-12-27 14:30:49', '0:0:0:0:0:0:0:1', 'cn.wolfcode.crm.service.impl.MenuServiceImpl:selectByParentIdAndEmployeeId', 'cn.wolfcode.crm.service.impl.MenuServiceImpl:selectByParentIdAndEmployeeId');
INSERT INTO `systemlog` VALUES ('30', '1', '2017-12-27 14:30:49', '0:0:0:0:0:0:0:1', 'cn.wolfcode.crm.service.impl.MenuServiceImpl:selectByParentIdAndEmployeeId', 'cn.wolfcode.crm.service.impl.MenuServiceImpl:selectByParentIdAndEmployeeId');
INSERT INTO `systemlog` VALUES ('31', '1', '2017-12-27 14:30:49', '0:0:0:0:0:0:0:1', 'cn.wolfcode.crm.service.impl.MenuServiceImpl:selectByParentIdAndEmployeeId', 'cn.wolfcode.crm.service.impl.MenuServiceImpl:selectByParentIdAndEmployeeId');
INSERT INTO `systemlog` VALUES ('32', '1', '2017-12-27 14:30:49', '0:0:0:0:0:0:0:1', 'cn.wolfcode.crm.service.impl.MenuServiceImpl:selectByParentIdAndEmployeeId', 'cn.wolfcode.crm.service.impl.MenuServiceImpl:selectByParentIdAndEmployeeId');
INSERT INTO `systemlog` VALUES ('33', '1', '2017-12-27 14:30:49', '0:0:0:0:0:0:0:1', 'cn.wolfcode.crm.service.impl.MenuServiceImpl:selectByParentIdAndEmployeeId', 'cn.wolfcode.crm.service.impl.MenuServiceImpl:selectByParentIdAndEmployeeId');
INSERT INTO `systemlog` VALUES ('34', '1', '2017-12-27 14:30:54', '0:0:0:0:0:0:0:1', 'cn.wolfcode.crm.service.impl.EmployeeServiceImpl:selectAll', 'cn.wolfcode.crm.service.impl.EmployeeServiceImpl:selectAll');
INSERT INTO `systemlog` VALUES ('35', '1', '2017-12-27 14:30:54', '0:0:0:0:0:0:0:1', 'cn.wolfcode.crm.service.impl.EmployeeServiceImpl:selectAll', 'cn.wolfcode.crm.service.impl.EmployeeServiceImpl:selectAll');
INSERT INTO `systemlog` VALUES ('36', '1', '2017-12-27 14:30:54', '0:0:0:0:0:0:0:1', 'cn.wolfcode.crm.service.impl.DictionaryDetailServiceImpl:selectByParentSn', 'cn.wolfcode.crm.service.impl.DictionaryDetailServiceImpl:selectByParentSn');
INSERT INTO `systemlog` VALUES ('37', '1', '2017-12-27 14:30:54', '0:0:0:0:0:0:0:1', 'cn.wolfcode.crm.service.impl.DictionaryDetailServiceImpl:selectByParentSn', 'cn.wolfcode.crm.service.impl.DictionaryDetailServiceImpl:selectByParentSn');
INSERT INTO `systemlog` VALUES ('38', '1', '2017-12-27 14:30:54', '0:0:0:0:0:0:0:1', 'cn.wolfcode.crm.service.impl.DictionaryDetailServiceImpl:selectByParentSn', 'cn.wolfcode.crm.service.impl.DictionaryDetailServiceImpl:selectByParentSn');
INSERT INTO `systemlog` VALUES ('39', null, '2017-12-27 14:32:09', '0:0:0:0:0:0:0:1', 'cn.wolfcode.crm.service.impl.EmployeeServiceImpl:selectByUsername', 'cn.wolfcode.crm.service.impl.EmployeeServiceImpl:selectByUsername');
INSERT INTO `systemlog` VALUES ('40', '1', '2017-12-27 14:32:12', '0:0:0:0:0:0:0:1', 'cn.wolfcode.crm.service.impl.MenuServiceImpl:selectByParentIdAndEmployeeId', 'cn.wolfcode.crm.service.impl.MenuServiceImpl:selectByParentIdAndEmployeeId');
INSERT INTO `systemlog` VALUES ('41', '1', '2017-12-27 14:32:13', '0:0:0:0:0:0:0:1', 'cn.wolfcode.crm.service.impl.MenuServiceImpl:selectByParentIdAndEmployeeId', 'cn.wolfcode.crm.service.impl.MenuServiceImpl:selectByParentIdAndEmployeeId');
INSERT INTO `systemlog` VALUES ('42', '1', '2017-12-27 14:32:13', '0:0:0:0:0:0:0:1', 'cn.wolfcode.crm.service.impl.MenuServiceImpl:selectByParentIdAndEmployeeId', 'cn.wolfcode.crm.service.impl.MenuServiceImpl:selectByParentIdAndEmployeeId');
INSERT INTO `systemlog` VALUES ('43', '1', '2017-12-27 14:32:13', '0:0:0:0:0:0:0:1', 'cn.wolfcode.crm.service.impl.MenuServiceImpl:selectByParentIdAndEmployeeId', 'cn.wolfcode.crm.service.impl.MenuServiceImpl:selectByParentIdAndEmployeeId');
INSERT INTO `systemlog` VALUES ('44', '1', '2017-12-27 14:32:13', '0:0:0:0:0:0:0:1', 'cn.wolfcode.crm.service.impl.MenuServiceImpl:selectByParentIdAndEmployeeId', 'cn.wolfcode.crm.service.impl.MenuServiceImpl:selectByParentIdAndEmployeeId');
INSERT INTO `systemlog` VALUES ('45', '1', '2017-12-27 14:32:13', '0:0:0:0:0:0:0:1', 'cn.wolfcode.crm.service.impl.MenuServiceImpl:selectByParentIdAndEmployeeId', 'cn.wolfcode.crm.service.impl.MenuServiceImpl:selectByParentIdAndEmployeeId');
INSERT INTO `systemlog` VALUES ('46', '1', '2017-12-27 14:32:15', '0:0:0:0:0:0:0:1', 'cn.wolfcode.crm.service.impl.EmployeeServiceImpl:selectAll', 'cn.wolfcode.crm.service.impl.EmployeeServiceImpl:selectAll');
INSERT INTO `systemlog` VALUES ('47', '1', '2017-12-27 14:32:16', '0:0:0:0:0:0:0:1', 'cn.wolfcode.crm.service.impl.DictionaryDetailServiceImpl:selectByParentSn', 'cn.wolfcode.crm.service.impl.DictionaryDetailServiceImpl:selectByParentSn');
INSERT INTO `systemlog` VALUES ('48', '1', '2017-12-27 14:32:16', '0:0:0:0:0:0:0:1', 'cn.wolfcode.crm.service.impl.EmployeeServiceImpl:selectAll', 'cn.wolfcode.crm.service.impl.EmployeeServiceImpl:selectAll');
INSERT INTO `systemlog` VALUES ('49', '1', '2017-12-27 14:32:16', '0:0:0:0:0:0:0:1', 'cn.wolfcode.crm.service.impl.DictionaryDetailServiceImpl:selectByParentSn', 'cn.wolfcode.crm.service.impl.DictionaryDetailServiceImpl:selectByParentSn');
INSERT INTO `systemlog` VALUES ('50', '1', '2017-12-27 14:32:16', '0:0:0:0:0:0:0:1', 'cn.wolfcode.crm.service.impl.DictionaryDetailServiceImpl:selectByParentSn', 'cn.wolfcode.crm.service.impl.DictionaryDetailServiceImpl:selectByParentSn');
INSERT INTO `systemlog` VALUES ('51', null, '2017-12-27 14:34:47', '0:0:0:0:0:0:0:1', 'cn.wolfcode.crm.service.impl.EmployeeServiceImpl:selectByUsername', 'cn.wolfcode.crm.service.impl.EmployeeServiceImpl:selectByUsername');
INSERT INTO `systemlog` VALUES ('52', '1', '2017-12-27 14:34:47', '0:0:0:0:0:0:0:1', 'cn.wolfcode.crm.service.impl.MenuServiceImpl:selectByParentIdAndEmployeeId', 'cn.wolfcode.crm.service.impl.MenuServiceImpl:selectByParentIdAndEmployeeId');
INSERT INTO `systemlog` VALUES ('53', '1', '2017-12-27 14:34:48', '0:0:0:0:0:0:0:1', 'cn.wolfcode.crm.service.impl.MenuServiceImpl:selectByParentIdAndEmployeeId', 'cn.wolfcode.crm.service.impl.MenuServiceImpl:selectByParentIdAndEmployeeId');
INSERT INTO `systemlog` VALUES ('54', '1', '2017-12-27 14:34:48', '0:0:0:0:0:0:0:1', 'cn.wolfcode.crm.service.impl.MenuServiceImpl:selectByParentIdAndEmployeeId', 'cn.wolfcode.crm.service.impl.MenuServiceImpl:selectByParentIdAndEmployeeId');
INSERT INTO `systemlog` VALUES ('55', '1', '2017-12-27 14:34:48', '0:0:0:0:0:0:0:1', 'cn.wolfcode.crm.service.impl.MenuServiceImpl:selectByParentIdAndEmployeeId', 'cn.wolfcode.crm.service.impl.MenuServiceImpl:selectByParentIdAndEmployeeId');
INSERT INTO `systemlog` VALUES ('56', '1', '2017-12-27 14:34:48', '0:0:0:0:0:0:0:1', 'cn.wolfcode.crm.service.impl.MenuServiceImpl:selectByParentIdAndEmployeeId', 'cn.wolfcode.crm.service.impl.MenuServiceImpl:selectByParentIdAndEmployeeId');
INSERT INTO `systemlog` VALUES ('57', '1', '2017-12-27 14:34:48', '0:0:0:0:0:0:0:1', 'cn.wolfcode.crm.service.impl.MenuServiceImpl:selectByParentIdAndEmployeeId', 'cn.wolfcode.crm.service.impl.MenuServiceImpl:selectByParentIdAndEmployeeId');
INSERT INTO `systemlog` VALUES ('58', '1', '2017-12-27 14:34:53', '0:0:0:0:0:0:0:1', 'cn.wolfcode.crm.service.impl.DictionaryDetailServiceImpl:selectByParentSn', 'cn.wolfcode.crm.service.impl.DictionaryDetailServiceImpl:selectByParentSn');
INSERT INTO `systemlog` VALUES ('59', '1', '2017-12-27 14:34:53', '0:0:0:0:0:0:0:1', 'cn.wolfcode.crm.service.impl.DictionaryDetailServiceImpl:selectByParentSn', 'cn.wolfcode.crm.service.impl.DictionaryDetailServiceImpl:selectByParentSn');
INSERT INTO `systemlog` VALUES ('60', '1', '2017-12-27 14:34:53', '0:0:0:0:0:0:0:1', 'cn.wolfcode.crm.service.impl.DictionaryDetailServiceImpl:selectByParentSn', 'cn.wolfcode.crm.service.impl.DictionaryDetailServiceImpl:selectByParentSn');
INSERT INTO `systemlog` VALUES ('61', '1', '2017-12-27 14:34:59', '0:0:0:0:0:0:0:1', 'cn.wolfcode.crm.service.impl.EmployeeServiceImpl:selectAll', 'cn.wolfcode.crm.service.impl.EmployeeServiceImpl:selectAll');
INSERT INTO `systemlog` VALUES ('62', '1', '2017-12-27 14:34:59', '0:0:0:0:0:0:0:1', 'cn.wolfcode.crm.service.impl.EmployeeServiceImpl:selectAll', 'cn.wolfcode.crm.service.impl.EmployeeServiceImpl:selectAll');
INSERT INTO `systemlog` VALUES ('63', '1', '2017-12-27 14:34:59', '0:0:0:0:0:0:0:1', 'cn.wolfcode.crm.service.impl.DictionaryDetailServiceImpl:selectByParentSn', 'cn.wolfcode.crm.service.impl.DictionaryDetailServiceImpl:selectByParentSn');
INSERT INTO `systemlog` VALUES ('64', '1', '2017-12-27 14:35:00', '0:0:0:0:0:0:0:1', 'cn.wolfcode.crm.service.impl.DictionaryDetailServiceImpl:selectByParentSn', 'cn.wolfcode.crm.service.impl.DictionaryDetailServiceImpl:selectByParentSn');
INSERT INTO `systemlog` VALUES ('65', '1', '2017-12-27 14:35:00', '0:0:0:0:0:0:0:1', 'cn.wolfcode.crm.service.impl.DictionaryDetailServiceImpl:selectByParentSn', 'cn.wolfcode.crm.service.impl.DictionaryDetailServiceImpl:selectByParentSn');
INSERT INTO `systemlog` VALUES ('66', '1', '2017-12-27 14:35:15', '0:0:0:0:0:0:0:1', 'cn.wolfcode.crm.service.impl.DictionaryDetailServiceImpl:selectByParentSn', 'cn.wolfcode.crm.service.impl.DictionaryDetailServiceImpl:selectByParentSn');
INSERT INTO `systemlog` VALUES ('67', '1', '2017-12-27 14:35:15', '0:0:0:0:0:0:0:1', 'cn.wolfcode.crm.service.impl.DictionaryDetailServiceImpl:selectByParentSn', 'cn.wolfcode.crm.service.impl.DictionaryDetailServiceImpl:selectByParentSn');
INSERT INTO `systemlog` VALUES ('68', '1', '2017-12-27 14:35:15', '0:0:0:0:0:0:0:1', 'cn.wolfcode.crm.service.impl.DictionaryDetailServiceImpl:selectByParentSn', 'cn.wolfcode.crm.service.impl.DictionaryDetailServiceImpl:selectByParentSn');
INSERT INTO `systemlog` VALUES ('69', '1', '2017-12-27 14:39:59', '0:0:0:0:0:0:0:1', 'cn.wolfcode.crm.service.impl.MenuServiceImpl:selectByParentIdAndEmployeeId', 'cn.wolfcode.crm.service.impl.MenuServiceImpl:selectByParentIdAndEmployeeId');
INSERT INTO `systemlog` VALUES ('70', '1', '2017-12-27 14:39:59', '0:0:0:0:0:0:0:1', 'cn.wolfcode.crm.service.impl.MenuServiceImpl:selectByParentIdAndEmployeeId', 'cn.wolfcode.crm.service.impl.MenuServiceImpl:selectByParentIdAndEmployeeId');
INSERT INTO `systemlog` VALUES ('71', '1', '2017-12-27 14:39:59', '0:0:0:0:0:0:0:1', 'cn.wolfcode.crm.service.impl.MenuServiceImpl:selectByParentIdAndEmployeeId', 'cn.wolfcode.crm.service.impl.MenuServiceImpl:selectByParentIdAndEmployeeId');
INSERT INTO `systemlog` VALUES ('72', '1', '2017-12-27 14:39:59', '0:0:0:0:0:0:0:1', 'cn.wolfcode.crm.service.impl.MenuServiceImpl:selectByParentIdAndEmployeeId', 'cn.wolfcode.crm.service.impl.MenuServiceImpl:selectByParentIdAndEmployeeId');
INSERT INTO `systemlog` VALUES ('73', '1', '2017-12-27 14:39:59', '0:0:0:0:0:0:0:1', 'cn.wolfcode.crm.service.impl.MenuServiceImpl:selectByParentIdAndEmployeeId', 'cn.wolfcode.crm.service.impl.MenuServiceImpl:selectByParentIdAndEmployeeId');
INSERT INTO `systemlog` VALUES ('74', '1', '2017-12-27 14:39:59', '0:0:0:0:0:0:0:1', 'cn.wolfcode.crm.service.impl.MenuServiceImpl:selectByParentIdAndEmployeeId', 'cn.wolfcode.crm.service.impl.MenuServiceImpl:selectByParentIdAndEmployeeId');
INSERT INTO `systemlog` VALUES ('75', '1', '2017-12-27 14:35:53', '0:0:0:0:0:0:0:1', 'cn.wolfcode.crm.service.impl.DictionaryDetailServiceImpl:selectByParentSn', 'cn.wolfcode.crm.service.impl.DictionaryDetailServiceImpl:selectByParentSn');
INSERT INTO `systemlog` VALUES ('76', '1', '2017-12-27 14:35:53', '0:0:0:0:0:0:0:1', 'cn.wolfcode.crm.service.impl.DictionaryDetailServiceImpl:selectByParentSn', 'cn.wolfcode.crm.service.impl.DictionaryDetailServiceImpl:selectByParentSn');
INSERT INTO `systemlog` VALUES ('77', '1', '2017-12-27 14:35:53', '0:0:0:0:0:0:0:1', 'cn.wolfcode.crm.service.impl.DictionaryDetailServiceImpl:selectByParentSn', 'cn.wolfcode.crm.service.impl.DictionaryDetailServiceImpl:selectByParentSn');
INSERT INTO `systemlog` VALUES ('78', '1', '2017-12-27 14:35:59', '0:0:0:0:0:0:0:1', 'cn.wolfcode.crm.service.impl.DictionaryDetailServiceImpl:selectByParentSn', 'cn.wolfcode.crm.service.impl.DictionaryDetailServiceImpl:selectByParentSn');
INSERT INTO `systemlog` VALUES ('79', '1', '2017-12-27 14:35:59', '0:0:0:0:0:0:0:1', 'cn.wolfcode.crm.service.impl.DictionaryDetailServiceImpl:selectByParentSn', 'cn.wolfcode.crm.service.impl.DictionaryDetailServiceImpl:selectByParentSn');
INSERT INTO `systemlog` VALUES ('80', '1', '2017-12-27 14:35:59', '0:0:0:0:0:0:0:1', 'cn.wolfcode.crm.service.impl.DictionaryDetailServiceImpl:selectByParentSn', 'cn.wolfcode.crm.service.impl.DictionaryDetailServiceImpl:selectByParentSn');
INSERT INTO `systemlog` VALUES ('81', null, '2017-12-27 14:40:16', '0:0:0:0:0:0:0:1', 'cn.wolfcode.crm.service.impl.EmployeeServiceImpl:selectByUsername', 'cn.wolfcode.crm.service.impl.EmployeeServiceImpl:selectByUsername');
INSERT INTO `systemlog` VALUES ('82', '1', '2017-12-27 14:40:18', '0:0:0:0:0:0:0:1', 'cn.wolfcode.crm.service.impl.MenuServiceImpl:selectByParentIdAndEmployeeId', 'cn.wolfcode.crm.service.impl.MenuServiceImpl:selectByParentIdAndEmployeeId');
INSERT INTO `systemlog` VALUES ('83', '1', '2017-12-27 14:40:18', '0:0:0:0:0:0:0:1', 'cn.wolfcode.crm.service.impl.MenuServiceImpl:selectByParentIdAndEmployeeId', 'cn.wolfcode.crm.service.impl.MenuServiceImpl:selectByParentIdAndEmployeeId');
INSERT INTO `systemlog` VALUES ('84', '1', '2017-12-27 14:40:18', '0:0:0:0:0:0:0:1', 'cn.wolfcode.crm.service.impl.MenuServiceImpl:selectByParentIdAndEmployeeId', 'cn.wolfcode.crm.service.impl.MenuServiceImpl:selectByParentIdAndEmployeeId');
INSERT INTO `systemlog` VALUES ('85', '1', '2017-12-27 14:40:18', '0:0:0:0:0:0:0:1', 'cn.wolfcode.crm.service.impl.MenuServiceImpl:selectByParentIdAndEmployeeId', 'cn.wolfcode.crm.service.impl.MenuServiceImpl:selectByParentIdAndEmployeeId');
INSERT INTO `systemlog` VALUES ('86', '1', '2017-12-27 14:40:18', '0:0:0:0:0:0:0:1', 'cn.wolfcode.crm.service.impl.MenuServiceImpl:selectByParentIdAndEmployeeId', 'cn.wolfcode.crm.service.impl.MenuServiceImpl:selectByParentIdAndEmployeeId');
INSERT INTO `systemlog` VALUES ('87', '1', '2017-12-27 14:40:18', '0:0:0:0:0:0:0:1', 'cn.wolfcode.crm.service.impl.MenuServiceImpl:selectByParentIdAndEmployeeId', 'cn.wolfcode.crm.service.impl.MenuServiceImpl:selectByParentIdAndEmployeeId');
INSERT INTO `systemlog` VALUES ('88', '1', '2017-12-27 14:36:35', '0:0:0:0:0:0:0:1', 'cn.wolfcode.crm.service.impl.DevelopAndLoseRecordServiceImpl:queryOff', 'cn.wolfcode.crm.service.impl.DevelopAndLoseRecordServiceImpl:queryOff');
INSERT INTO `systemlog` VALUES ('89', '1', '2017-12-27 14:36:38', '0:0:0:0:0:0:0:1', 'cn.wolfcode.crm.service.impl.DictionaryDetailServiceImpl:selectByParentSn', 'cn.wolfcode.crm.service.impl.DictionaryDetailServiceImpl:selectByParentSn');
INSERT INTO `systemlog` VALUES ('90', '1', '2017-12-27 14:36:38', '0:0:0:0:0:0:0:1', 'cn.wolfcode.crm.service.impl.DictionaryDetailServiceImpl:selectByParentSn', 'cn.wolfcode.crm.service.impl.DictionaryDetailServiceImpl:selectByParentSn');
INSERT INTO `systemlog` VALUES ('91', '1', '2017-12-27 14:36:38', '0:0:0:0:0:0:0:1', 'cn.wolfcode.crm.service.impl.DictionaryDetailServiceImpl:selectByParentSn', 'cn.wolfcode.crm.service.impl.DictionaryDetailServiceImpl:selectByParentSn');
INSERT INTO `systemlog` VALUES ('92', '1', '2017-12-27 14:36:45', '0:0:0:0:0:0:0:1', 'cn.wolfcode.crm.service.impl.EmployeeServiceImpl:selectAll', 'cn.wolfcode.crm.service.impl.EmployeeServiceImpl:selectAll');
INSERT INTO `systemlog` VALUES ('93', '1', '2017-12-27 14:36:45', '0:0:0:0:0:0:0:1', 'cn.wolfcode.crm.service.impl.EmployeeServiceImpl:selectAll', 'cn.wolfcode.crm.service.impl.EmployeeServiceImpl:selectAll');
INSERT INTO `systemlog` VALUES ('94', '1', '2017-12-27 14:36:45', '0:0:0:0:0:0:0:1', 'cn.wolfcode.crm.service.impl.DictionaryDetailServiceImpl:selectByParentSn', 'cn.wolfcode.crm.service.impl.DictionaryDetailServiceImpl:selectByParentSn');
INSERT INTO `systemlog` VALUES ('95', '1', '2017-12-27 14:36:45', '0:0:0:0:0:0:0:1', 'cn.wolfcode.crm.service.impl.DictionaryDetailServiceImpl:selectByParentSn', 'cn.wolfcode.crm.service.impl.DictionaryDetailServiceImpl:selectByParentSn');
INSERT INTO `systemlog` VALUES ('96', '1', '2017-12-27 14:36:45', '0:0:0:0:0:0:0:1', 'cn.wolfcode.crm.service.impl.DictionaryDetailServiceImpl:selectByParentSn', 'cn.wolfcode.crm.service.impl.DictionaryDetailServiceImpl:selectByParentSn');
INSERT INTO `systemlog` VALUES ('97', '1', '2017-12-27 14:36:52', '0:0:0:0:0:0:0:1', 'cn.wolfcode.crm.service.impl.DictionaryDetailServiceImpl:selectByParentSn', 'cn.wolfcode.crm.service.impl.DictionaryDetailServiceImpl:selectByParentSn');
INSERT INTO `systemlog` VALUES ('98', '1', '2017-12-27 14:36:52', '0:0:0:0:0:0:0:1', 'cn.wolfcode.crm.service.impl.DictionaryDetailServiceImpl:selectByParentSn', 'cn.wolfcode.crm.service.impl.DictionaryDetailServiceImpl:selectByParentSn');
INSERT INTO `systemlog` VALUES ('99', '1', '2017-12-27 14:36:52', '0:0:0:0:0:0:0:1', 'cn.wolfcode.crm.service.impl.DictionaryDetailServiceImpl:selectByParentSn', 'cn.wolfcode.crm.service.impl.DictionaryDetailServiceImpl:selectByParentSn');
INSERT INTO `systemlog` VALUES ('100', '1', '2017-12-27 14:36:56', '0:0:0:0:0:0:0:1', 'cn.wolfcode.crm.service.impl.DictionaryDetailServiceImpl:selectByParentSn', 'cn.wolfcode.crm.service.impl.DictionaryDetailServiceImpl:selectByParentSn');
INSERT INTO `systemlog` VALUES ('101', '1', '2017-12-27 14:36:56', '0:0:0:0:0:0:0:1', 'cn.wolfcode.crm.service.impl.DictionaryDetailServiceImpl:selectByParentSn', 'cn.wolfcode.crm.service.impl.DictionaryDetailServiceImpl:selectByParentSn');
INSERT INTO `systemlog` VALUES ('102', '1', '2017-12-27 14:36:56', '0:0:0:0:0:0:0:1', 'cn.wolfcode.crm.service.impl.DictionaryDetailServiceImpl:selectByParentSn', 'cn.wolfcode.crm.service.impl.DictionaryDetailServiceImpl:selectByParentSn');
INSERT INTO `systemlog` VALUES ('103', '1', '2017-12-27 14:37:47', '0:0:0:0:0:0:0:1', 'cn.wolfcode.crm.service.impl.DevelopAndLoseRecordServiceImpl:insert', 'cn.wolfcode.crm.service.impl.DevelopAndLoseRecordServiceImpl:insert');
INSERT INTO `systemlog` VALUES ('104', '1', '2017-12-27 14:37:54', '0:0:0:0:0:0:0:1', 'cn.wolfcode.crm.service.impl.DictionaryDetailServiceImpl:selectByParentSn', 'cn.wolfcode.crm.service.impl.DictionaryDetailServiceImpl:selectByParentSn');
INSERT INTO `systemlog` VALUES ('105', '1', '2017-12-27 14:37:54', '0:0:0:0:0:0:0:1', 'cn.wolfcode.crm.service.impl.DictionaryDetailServiceImpl:selectByParentSn', 'cn.wolfcode.crm.service.impl.DictionaryDetailServiceImpl:selectByParentSn');
INSERT INTO `systemlog` VALUES ('106', '1', '2017-12-27 14:37:54', '0:0:0:0:0:0:0:1', 'cn.wolfcode.crm.service.impl.DictionaryDetailServiceImpl:selectByParentSn', 'cn.wolfcode.crm.service.impl.DictionaryDetailServiceImpl:selectByParentSn');
INSERT INTO `systemlog` VALUES ('107', '1', '2017-12-27 14:37:57', '0:0:0:0:0:0:0:1', 'cn.wolfcode.crm.service.impl.EmployeeServiceImpl:selectAll', 'cn.wolfcode.crm.service.impl.EmployeeServiceImpl:selectAll');
INSERT INTO `systemlog` VALUES ('108', '1', '2017-12-27 14:37:57', '0:0:0:0:0:0:0:1', 'cn.wolfcode.crm.service.impl.EmployeeServiceImpl:selectAll', 'cn.wolfcode.crm.service.impl.EmployeeServiceImpl:selectAll');
INSERT INTO `systemlog` VALUES ('109', '1', '2017-12-27 14:37:57', '0:0:0:0:0:0:0:1', 'cn.wolfcode.crm.service.impl.DictionaryDetailServiceImpl:selectByParentSn', 'cn.wolfcode.crm.service.impl.DictionaryDetailServiceImpl:selectByParentSn');
INSERT INTO `systemlog` VALUES ('110', '1', '2017-12-27 14:37:57', '0:0:0:0:0:0:0:1', 'cn.wolfcode.crm.service.impl.DictionaryDetailServiceImpl:selectByParentSn', 'cn.wolfcode.crm.service.impl.DictionaryDetailServiceImpl:selectByParentSn');
INSERT INTO `systemlog` VALUES ('111', '1', '2017-12-27 14:37:57', '0:0:0:0:0:0:0:1', 'cn.wolfcode.crm.service.impl.DictionaryDetailServiceImpl:selectByParentSn', 'cn.wolfcode.crm.service.impl.DictionaryDetailServiceImpl:selectByParentSn');
INSERT INTO `systemlog` VALUES ('112', '1', '2017-12-27 14:38:25', '0:0:0:0:0:0:0:1', 'cn.wolfcode.crm.service.impl.DictionaryDetailServiceImpl:selectByParentSn', 'cn.wolfcode.crm.service.impl.DictionaryDetailServiceImpl:selectByParentSn');
INSERT INTO `systemlog` VALUES ('113', '1', '2017-12-27 14:38:25', '0:0:0:0:0:0:0:1', 'cn.wolfcode.crm.service.impl.DictionaryDetailServiceImpl:selectByParentSn', 'cn.wolfcode.crm.service.impl.DictionaryDetailServiceImpl:selectByParentSn');
INSERT INTO `systemlog` VALUES ('114', '1', '2017-12-27 14:38:25', '0:0:0:0:0:0:0:1', 'cn.wolfcode.crm.service.impl.DictionaryDetailServiceImpl:selectByParentSn', 'cn.wolfcode.crm.service.impl.DictionaryDetailServiceImpl:selectByParentSn');
INSERT INTO `systemlog` VALUES ('115', '1', '2017-12-27 14:38:32', '0:0:0:0:0:0:0:1', 'cn.wolfcode.crm.service.impl.EmployeeServiceImpl:selectAll', 'cn.wolfcode.crm.service.impl.EmployeeServiceImpl:selectAll');
INSERT INTO `systemlog` VALUES ('116', '1', '2017-12-27 14:38:32', '0:0:0:0:0:0:0:1', 'cn.wolfcode.crm.service.impl.EmployeeServiceImpl:selectAll', 'cn.wolfcode.crm.service.impl.EmployeeServiceImpl:selectAll');
INSERT INTO `systemlog` VALUES ('117', '1', '2017-12-27 14:38:32', '0:0:0:0:0:0:0:1', 'cn.wolfcode.crm.service.impl.DictionaryDetailServiceImpl:selectByParentSn', 'cn.wolfcode.crm.service.impl.DictionaryDetailServiceImpl:selectByParentSn');
INSERT INTO `systemlog` VALUES ('118', '1', '2017-12-27 14:38:32', '0:0:0:0:0:0:0:1', 'cn.wolfcode.crm.service.impl.DictionaryDetailServiceImpl:selectByParentSn', 'cn.wolfcode.crm.service.impl.DictionaryDetailServiceImpl:selectByParentSn');
INSERT INTO `systemlog` VALUES ('119', '1', '2017-12-27 14:38:32', '0:0:0:0:0:0:0:1', 'cn.wolfcode.crm.service.impl.DictionaryDetailServiceImpl:selectByParentSn', 'cn.wolfcode.crm.service.impl.DictionaryDetailServiceImpl:selectByParentSn');
INSERT INTO `systemlog` VALUES ('120', '1', '2017-12-27 14:38:45', '0:0:0:0:0:0:0:1', 'cn.wolfcode.crm.service.impl.EmployeeServiceImpl:selectByPrimaryKey', 'cn.wolfcode.crm.service.impl.EmployeeServiceImpl:selectByPrimaryKey');
INSERT INTO `systemlog` VALUES ('121', '1', '2017-12-27 14:38:45', '0:0:0:0:0:0:0:1', 'cn.wolfcode.crm.service.impl.EmployeeServiceImpl:selectByPrimaryKey', 'cn.wolfcode.crm.service.impl.EmployeeServiceImpl:selectByPrimaryKey');
INSERT INTO `systemlog` VALUES ('122', '1', '2017-12-27 14:38:45', '0:0:0:0:0:0:0:1', 'cn.wolfcode.crm.service.impl.ChangeRecordServiceImpl:insert', 'cn.wolfcode.crm.service.impl.ChangeRecordServiceImpl:insert');
INSERT INTO `systemlog` VALUES ('123', '1', '2017-12-27 14:38:48', '0:0:0:0:0:0:0:1', 'cn.wolfcode.crm.service.impl.DevelopAndLoseRecordServiceImpl:queryOff', 'cn.wolfcode.crm.service.impl.DevelopAndLoseRecordServiceImpl:queryOff');
INSERT INTO `systemlog` VALUES ('124', '1', '2017-12-27 14:38:49', '0:0:0:0:0:0:0:1', 'cn.wolfcode.crm.service.impl.ChangeRecordServiceImpl:query', 'cn.wolfcode.crm.service.impl.ChangeRecordServiceImpl:query');
INSERT INTO `systemlog` VALUES ('125', '1', '2017-12-27 14:38:50', '0:0:0:0:0:0:0:1', 'cn.wolfcode.crm.service.impl.ChangeRecordServiceImpl:query', 'cn.wolfcode.crm.service.impl.ChangeRecordServiceImpl:query');
INSERT INTO `systemlog` VALUES ('126', '1', '2017-12-27 14:39:01', '0:0:0:0:0:0:0:1', 'cn.wolfcode.crm.service.impl.ChangeRecordServiceImpl:query', 'cn.wolfcode.crm.service.impl.ChangeRecordServiceImpl:query');
INSERT INTO `systemlog` VALUES ('127', '1', '2017-12-27 14:39:01', '0:0:0:0:0:0:0:1', 'cn.wolfcode.crm.service.impl.ChangeRecordServiceImpl:query', 'cn.wolfcode.crm.service.impl.ChangeRecordServiceImpl:query');
INSERT INTO `systemlog` VALUES ('128', '1', '2017-12-27 14:39:04', '0:0:0:0:0:0:0:1', 'cn.wolfcode.crm.service.impl.DictionaryDetailServiceImpl:selectByParentSn', 'cn.wolfcode.crm.service.impl.DictionaryDetailServiceImpl:selectByParentSn');
INSERT INTO `systemlog` VALUES ('129', '1', '2017-12-27 14:39:04', '0:0:0:0:0:0:0:1', 'cn.wolfcode.crm.service.impl.DictionaryDetailServiceImpl:selectByParentSn', 'cn.wolfcode.crm.service.impl.DictionaryDetailServiceImpl:selectByParentSn');
INSERT INTO `systemlog` VALUES ('130', '1', '2017-12-27 14:39:04', '0:0:0:0:0:0:0:1', 'cn.wolfcode.crm.service.impl.DictionaryDetailServiceImpl:selectByParentSn', 'cn.wolfcode.crm.service.impl.DictionaryDetailServiceImpl:selectByParentSn');
INSERT INTO `systemlog` VALUES ('131', '1', '2017-12-27 14:39:10', '0:0:0:0:0:0:0:1', 'cn.wolfcode.crm.service.impl.ChangeRecordServiceImpl:query', 'cn.wolfcode.crm.service.impl.ChangeRecordServiceImpl:query');
INSERT INTO `systemlog` VALUES ('132', '1', '2017-12-27 14:39:12', '0:0:0:0:0:0:0:1', 'cn.wolfcode.crm.service.impl.ChangeRecordServiceImpl:query', 'cn.wolfcode.crm.service.impl.ChangeRecordServiceImpl:query');
INSERT INTO `systemlog` VALUES ('133', '1', '2017-12-27 14:39:13', '0:0:0:0:0:0:0:1', 'cn.wolfcode.crm.service.impl.ChangeRecordServiceImpl:query', 'cn.wolfcode.crm.service.impl.ChangeRecordServiceImpl:query');
INSERT INTO `systemlog` VALUES ('134', '1', '2017-12-27 14:39:15', '0:0:0:0:0:0:0:1', 'cn.wolfcode.crm.service.impl.DevelopAndLoseRecordServiceImpl:queryOff', 'cn.wolfcode.crm.service.impl.DevelopAndLoseRecordServiceImpl:queryOff');
INSERT INTO `systemlog` VALUES ('135', '1', '2017-12-27 14:39:18', '0:0:0:0:0:0:0:1', 'cn.wolfcode.crm.service.impl.DevelopAndLoseRecordServiceImpl:query', 'cn.wolfcode.crm.service.impl.DevelopAndLoseRecordServiceImpl:query');
INSERT INTO `systemlog` VALUES ('136', '1', '2017-12-27 14:39:20', '0:0:0:0:0:0:0:1', 'cn.wolfcode.crm.service.impl.EmployeeServiceImpl:selectAll', 'cn.wolfcode.crm.service.impl.EmployeeServiceImpl:selectAll');
INSERT INTO `systemlog` VALUES ('137', '1', '2017-12-27 14:39:20', '0:0:0:0:0:0:0:1', 'cn.wolfcode.crm.service.impl.EmployeeServiceImpl:selectAll', 'cn.wolfcode.crm.service.impl.EmployeeServiceImpl:selectAll');
INSERT INTO `systemlog` VALUES ('138', '1', '2017-12-27 14:39:20', '0:0:0:0:0:0:0:1', 'cn.wolfcode.crm.service.impl.DictionaryDetailServiceImpl:selectByParentSn', 'cn.wolfcode.crm.service.impl.DictionaryDetailServiceImpl:selectByParentSn');
INSERT INTO `systemlog` VALUES ('139', '1', '2017-12-27 14:39:20', '0:0:0:0:0:0:0:1', 'cn.wolfcode.crm.service.impl.DictionaryDetailServiceImpl:selectByParentSn', 'cn.wolfcode.crm.service.impl.DictionaryDetailServiceImpl:selectByParentSn');
INSERT INTO `systemlog` VALUES ('140', '1', '2017-12-27 14:39:20', '0:0:0:0:0:0:0:1', 'cn.wolfcode.crm.service.impl.DictionaryDetailServiceImpl:selectByParentSn', 'cn.wolfcode.crm.service.impl.DictionaryDetailServiceImpl:selectByParentSn');
INSERT INTO `systemlog` VALUES ('141', '1', '2017-12-27 14:39:22', '0:0:0:0:0:0:0:1', 'cn.wolfcode.crm.service.impl.DictionaryDetailServiceImpl:selectByParentSn', 'cn.wolfcode.crm.service.impl.DictionaryDetailServiceImpl:selectByParentSn');
INSERT INTO `systemlog` VALUES ('142', '1', '2017-12-27 14:39:22', '0:0:0:0:0:0:0:1', 'cn.wolfcode.crm.service.impl.DictionaryDetailServiceImpl:selectByParentSn', 'cn.wolfcode.crm.service.impl.DictionaryDetailServiceImpl:selectByParentSn');
INSERT INTO `systemlog` VALUES ('143', '1', '2017-12-27 14:39:22', '0:0:0:0:0:0:0:1', 'cn.wolfcode.crm.service.impl.DictionaryDetailServiceImpl:selectByParentSn', 'cn.wolfcode.crm.service.impl.DictionaryDetailServiceImpl:selectByParentSn');
INSERT INTO `systemlog` VALUES ('144', '1', '2017-12-27 14:39:23', '0:0:0:0:0:0:0:1', 'cn.wolfcode.crm.service.impl.ClientRecordServiceImpl:query', 'cn.wolfcode.crm.service.impl.ClientRecordServiceImpl:query');
INSERT INTO `systemlog` VALUES ('145', '1', '2017-12-27 14:39:23', '0:0:0:0:0:0:0:1', 'cn.wolfcode.crm.service.impl.DictionaryDetailServiceImpl:selectByParentSn', 'cn.wolfcode.crm.service.impl.DictionaryDetailServiceImpl:selectByParentSn');
INSERT INTO `systemlog` VALUES ('146', '1', '2017-12-27 14:39:23', '0:0:0:0:0:0:0:1', 'cn.wolfcode.crm.service.impl.DictionaryDetailServiceImpl:selectByParentSn', 'cn.wolfcode.crm.service.impl.DictionaryDetailServiceImpl:selectByParentSn');
INSERT INTO `systemlog` VALUES ('147', '1', '2017-12-27 14:39:29', '0:0:0:0:0:0:0:1', 'cn.wolfcode.crm.service.impl.CarServiceImpl:query', 'cn.wolfcode.crm.service.impl.CarServiceImpl:query');
INSERT INTO `systemlog` VALUES ('148', '1', '2017-12-27 14:39:29', '0:0:0:0:0:0:0:1', 'cn.wolfcode.crm.service.impl.DictionaryDetailServiceImpl:selectByParentSn', 'cn.wolfcode.crm.service.impl.DictionaryDetailServiceImpl:selectByParentSn');
INSERT INTO `systemlog` VALUES ('149', '1', '2017-12-27 14:39:31', '0:0:0:0:0:0:0:1', 'cn.wolfcode.crm.service.impl.CarServiceImpl:query', 'cn.wolfcode.crm.service.impl.CarServiceImpl:query');
INSERT INTO `systemlog` VALUES ('150', '1', '2017-12-27 14:39:35', '0:0:0:0:0:0:0:1', 'cn.wolfcode.crm.service.impl.ClientReportServiceImpl:formalClient', 'cn.wolfcode.crm.service.impl.ClientReportServiceImpl:formalClient');
INSERT INTO `systemlog` VALUES ('151', '1', '2017-12-27 14:39:35', '0:0:0:0:0:0:0:1', 'cn.wolfcode.crm.service.impl.DictionaryDetailServiceImpl:selectByParentSn', 'cn.wolfcode.crm.service.impl.DictionaryDetailServiceImpl:selectByParentSn');
INSERT INTO `systemlog` VALUES ('152', '1', '2017-12-27 14:39:38', '0:0:0:0:0:0:0:1', 'cn.wolfcode.crm.service.impl.FormsServiceImpl:saleChart', 'cn.wolfcode.crm.service.impl.FormsServiceImpl:saleChart');
INSERT INTO `systemlog` VALUES ('153', '1', '2017-12-27 14:39:41', '0:0:0:0:0:0:0:1', 'cn.wolfcode.crm.service.impl.EmployeeServiceImpl:query', 'cn.wolfcode.crm.service.impl.EmployeeServiceImpl:query');
INSERT INTO `systemlog` VALUES ('154', '1', '2017-12-27 14:39:41', '0:0:0:0:0:0:0:1', 'cn.wolfcode.crm.service.impl.DepartmentServiceImpl:selectAll', 'cn.wolfcode.crm.service.impl.DepartmentServiceImpl:selectAll');
INSERT INTO `systemlog` VALUES ('155', '1', '2017-12-27 14:39:41', '0:0:0:0:0:0:0:1', 'cn.wolfcode.crm.service.impl.DepartmentServiceImpl:selectAll', 'cn.wolfcode.crm.service.impl.DepartmentServiceImpl:selectAll');
INSERT INTO `systemlog` VALUES ('156', '1', '2017-12-27 14:39:41', '0:0:0:0:0:0:0:1', 'cn.wolfcode.crm.service.impl.RoleServiceImpl:selectAll', 'cn.wolfcode.crm.service.impl.RoleServiceImpl:selectAll');
INSERT INTO `systemlog` VALUES ('157', '1', '2017-12-27 14:39:43', '0:0:0:0:0:0:0:1', 'cn.wolfcode.crm.service.impl.RoleServiceImpl:query', 'cn.wolfcode.crm.service.impl.RoleServiceImpl:query');
INSERT INTO `systemlog` VALUES ('158', '1', '2017-12-27 14:39:43', '0:0:0:0:0:0:0:1', 'cn.wolfcode.crm.service.impl.PermissionServiceImpl:selectAll', 'cn.wolfcode.crm.service.impl.PermissionServiceImpl:selectAll');
INSERT INTO `systemlog` VALUES ('159', '1', '2017-12-27 14:39:44', '0:0:0:0:0:0:0:1', 'cn.wolfcode.crm.service.impl.PermissionServiceImpl:query', 'cn.wolfcode.crm.service.impl.PermissionServiceImpl:query');
INSERT INTO `systemlog` VALUES ('160', '1', '2017-12-27 14:40:53', '0:0:0:0:0:0:0:1', 'cn.wolfcode.crm.service.impl.MenuServiceImpl:selectByParentIdAndEmployeeId', 'cn.wolfcode.crm.service.impl.MenuServiceImpl:selectByParentIdAndEmployeeId');
INSERT INTO `systemlog` VALUES ('161', '1', '2017-12-27 14:40:53', '0:0:0:0:0:0:0:1', 'cn.wolfcode.crm.service.impl.MenuServiceImpl:selectByParentIdAndEmployeeId', 'cn.wolfcode.crm.service.impl.MenuServiceImpl:selectByParentIdAndEmployeeId');
INSERT INTO `systemlog` VALUES ('162', '1', '2017-12-27 14:40:53', '0:0:0:0:0:0:0:1', 'cn.wolfcode.crm.service.impl.MenuServiceImpl:selectByParentIdAndEmployeeId', 'cn.wolfcode.crm.service.impl.MenuServiceImpl:selectByParentIdAndEmployeeId');
INSERT INTO `systemlog` VALUES ('163', '1', '2017-12-27 14:40:53', '0:0:0:0:0:0:0:1', 'cn.wolfcode.crm.service.impl.MenuServiceImpl:selectByParentIdAndEmployeeId', 'cn.wolfcode.crm.service.impl.MenuServiceImpl:selectByParentIdAndEmployeeId');
INSERT INTO `systemlog` VALUES ('164', '1', '2017-12-27 14:40:53', '0:0:0:0:0:0:0:1', 'cn.wolfcode.crm.service.impl.MenuServiceImpl:selectByParentIdAndEmployeeId', 'cn.wolfcode.crm.service.impl.MenuServiceImpl:selectByParentIdAndEmployeeId');
INSERT INTO `systemlog` VALUES ('165', '1', '2017-12-27 14:40:54', '0:0:0:0:0:0:0:1', 'cn.wolfcode.crm.service.impl.MenuServiceImpl:selectByParentIdAndEmployeeId', 'cn.wolfcode.crm.service.impl.MenuServiceImpl:selectByParentIdAndEmployeeId');
INSERT INTO `systemlog` VALUES ('166', null, '2017-12-27 14:41:09', '0:0:0:0:0:0:0:1', 'cn.wolfcode.crm.service.impl.EmployeeServiceImpl:selectByUsername', 'cn.wolfcode.crm.service.impl.EmployeeServiceImpl:selectByUsername');
INSERT INTO `systemlog` VALUES ('167', '1', '2017-12-27 14:41:09', '0:0:0:0:0:0:0:1', 'cn.wolfcode.crm.service.impl.MenuServiceImpl:selectByParentIdAndEmployeeId', 'cn.wolfcode.crm.service.impl.MenuServiceImpl:selectByParentIdAndEmployeeId');
INSERT INTO `systemlog` VALUES ('168', '1', '2017-12-27 14:41:09', '0:0:0:0:0:0:0:1', 'cn.wolfcode.crm.service.impl.MenuServiceImpl:selectByParentIdAndEmployeeId', 'cn.wolfcode.crm.service.impl.MenuServiceImpl:selectByParentIdAndEmployeeId');
INSERT INTO `systemlog` VALUES ('169', '1', '2017-12-27 14:41:10', '0:0:0:0:0:0:0:1', 'cn.wolfcode.crm.service.impl.MenuServiceImpl:selectByParentIdAndEmployeeId', 'cn.wolfcode.crm.service.impl.MenuServiceImpl:selectByParentIdAndEmployeeId');
INSERT INTO `systemlog` VALUES ('170', '1', '2017-12-27 14:41:10', '0:0:0:0:0:0:0:1', 'cn.wolfcode.crm.service.impl.MenuServiceImpl:selectByParentIdAndEmployeeId', 'cn.wolfcode.crm.service.impl.MenuServiceImpl:selectByParentIdAndEmployeeId');
INSERT INTO `systemlog` VALUES ('171', '1', '2017-12-27 14:41:10', '0:0:0:0:0:0:0:1', 'cn.wolfcode.crm.service.impl.MenuServiceImpl:selectByParentIdAndEmployeeId', 'cn.wolfcode.crm.service.impl.MenuServiceImpl:selectByParentIdAndEmployeeId');
INSERT INTO `systemlog` VALUES ('172', '1', '2017-12-27 14:41:10', '0:0:0:0:0:0:0:1', 'cn.wolfcode.crm.service.impl.MenuServiceImpl:selectByParentIdAndEmployeeId', 'cn.wolfcode.crm.service.impl.MenuServiceImpl:selectByParentIdAndEmployeeId');
INSERT INTO `systemlog` VALUES ('173', null, '2017-12-27 14:45:26', '0:0:0:0:0:0:0:1', 'cn.wolfcode.crm.service.impl.EmployeeServiceImpl:selectByUsername', 'cn.wolfcode.crm.service.impl.EmployeeServiceImpl:selectByUsername');
INSERT INTO `systemlog` VALUES ('174', '1', '2017-12-27 14:45:29', '0:0:0:0:0:0:0:1', 'cn.wolfcode.crm.service.impl.MenuServiceImpl:selectByParentIdAndEmployeeId', 'cn.wolfcode.crm.service.impl.MenuServiceImpl:selectByParentIdAndEmployeeId');
INSERT INTO `systemlog` VALUES ('175', '1', '2017-12-27 14:45:30', '0:0:0:0:0:0:0:1', 'cn.wolfcode.crm.service.impl.MenuServiceImpl:selectByParentIdAndEmployeeId', 'cn.wolfcode.crm.service.impl.MenuServiceImpl:selectByParentIdAndEmployeeId');
INSERT INTO `systemlog` VALUES ('176', '1', '2017-12-27 14:45:30', '0:0:0:0:0:0:0:1', 'cn.wolfcode.crm.service.impl.MenuServiceImpl:selectByParentIdAndEmployeeId', 'cn.wolfcode.crm.service.impl.MenuServiceImpl:selectByParentIdAndEmployeeId');
INSERT INTO `systemlog` VALUES ('177', '1', '2017-12-27 14:45:30', '0:0:0:0:0:0:0:1', 'cn.wolfcode.crm.service.impl.MenuServiceImpl:selectByParentIdAndEmployeeId', 'cn.wolfcode.crm.service.impl.MenuServiceImpl:selectByParentIdAndEmployeeId');
INSERT INTO `systemlog` VALUES ('178', '1', '2017-12-27 14:45:30', '0:0:0:0:0:0:0:1', 'cn.wolfcode.crm.service.impl.MenuServiceImpl:selectByParentIdAndEmployeeId', 'cn.wolfcode.crm.service.impl.MenuServiceImpl:selectByParentIdAndEmployeeId');
INSERT INTO `systemlog` VALUES ('179', '1', '2017-12-27 14:45:31', '0:0:0:0:0:0:0:1', 'cn.wolfcode.crm.service.impl.MenuServiceImpl:selectByParentIdAndEmployeeId', 'cn.wolfcode.crm.service.impl.MenuServiceImpl:selectByParentIdAndEmployeeId');
INSERT INTO `systemlog` VALUES ('180', null, '2017-12-27 14:41:51', '127.0.0.1', 'cn.wolfcode.crm.service.impl.EmployeeServiceImpl:selectByUsername', 'cn.wolfcode.crm.service.impl.EmployeeServiceImpl:selectByUsername');
INSERT INTO `systemlog` VALUES ('181', '1', '2017-12-27 14:41:36', '0:0:0:0:0:0:0:1', 'cn.wolfcode.crm.service.impl.CompanyServiceImpl:selectAll', 'cn.wolfcode.crm.service.impl.CompanyServiceImpl:selectAll');
INSERT INTO `systemlog` VALUES ('182', '1', '2017-12-27 14:41:36', '0:0:0:0:0:0:0:1', 'cn.wolfcode.crm.service.impl.EmployeeServiceImpl:selectAll', 'cn.wolfcode.crm.service.impl.EmployeeServiceImpl:selectAll');
INSERT INTO `systemlog` VALUES ('183', '1', '2017-12-27 14:41:52', '127.0.0.1', 'cn.wolfcode.crm.service.impl.MenuServiceImpl:selectByParentIdAndEmployeeId', 'cn.wolfcode.crm.service.impl.MenuServiceImpl:selectByParentIdAndEmployeeId');
INSERT INTO `systemlog` VALUES ('184', '1', '2017-12-27 14:41:52', '127.0.0.1', 'cn.wolfcode.crm.service.impl.MenuServiceImpl:selectByParentIdAndEmployeeId', 'cn.wolfcode.crm.service.impl.MenuServiceImpl:selectByParentIdAndEmployeeId');
INSERT INTO `systemlog` VALUES ('185', '1', '2017-12-27 14:41:52', '127.0.0.1', 'cn.wolfcode.crm.service.impl.MenuServiceImpl:selectByParentIdAndEmployeeId', 'cn.wolfcode.crm.service.impl.MenuServiceImpl:selectByParentIdAndEmployeeId');
INSERT INTO `systemlog` VALUES ('186', '1', '2017-12-27 14:41:52', '127.0.0.1', 'cn.wolfcode.crm.service.impl.MenuServiceImpl:selectByParentIdAndEmployeeId', 'cn.wolfcode.crm.service.impl.MenuServiceImpl:selectByParentIdAndEmployeeId');
INSERT INTO `systemlog` VALUES ('187', '1', '2017-12-27 14:41:52', '127.0.0.1', 'cn.wolfcode.crm.service.impl.MenuServiceImpl:selectByParentIdAndEmployeeId', 'cn.wolfcode.crm.service.impl.MenuServiceImpl:selectByParentIdAndEmployeeId');
INSERT INTO `systemlog` VALUES ('188', '1', '2017-12-27 14:41:53', '127.0.0.1', 'cn.wolfcode.crm.service.impl.MenuServiceImpl:selectByParentIdAndEmployeeId', 'cn.wolfcode.crm.service.impl.MenuServiceImpl:selectByParentIdAndEmployeeId');
INSERT INTO `systemlog` VALUES ('189', '1', '2017-12-27 14:42:09', '127.0.0.1', 'cn.wolfcode.crm.service.impl.MenuServiceImpl:selectByParentIdAndEmployeeId', 'cn.wolfcode.crm.service.impl.MenuServiceImpl:selectByParentIdAndEmployeeId');
INSERT INTO `systemlog` VALUES ('190', '1', '2017-12-27 14:42:09', '127.0.0.1', 'cn.wolfcode.crm.service.impl.MenuServiceImpl:selectByParentIdAndEmployeeId', 'cn.wolfcode.crm.service.impl.MenuServiceImpl:selectByParentIdAndEmployeeId');
INSERT INTO `systemlog` VALUES ('191', '1', '2017-12-27 14:42:09', '127.0.0.1', 'cn.wolfcode.crm.service.impl.MenuServiceImpl:selectByParentIdAndEmployeeId', 'cn.wolfcode.crm.service.impl.MenuServiceImpl:selectByParentIdAndEmployeeId');
INSERT INTO `systemlog` VALUES ('192', '1', '2017-12-27 14:42:09', '127.0.0.1', 'cn.wolfcode.crm.service.impl.MenuServiceImpl:selectByParentIdAndEmployeeId', 'cn.wolfcode.crm.service.impl.MenuServiceImpl:selectByParentIdAndEmployeeId');
INSERT INTO `systemlog` VALUES ('193', '1', '2017-12-27 14:42:09', '127.0.0.1', 'cn.wolfcode.crm.service.impl.MenuServiceImpl:selectByParentIdAndEmployeeId', 'cn.wolfcode.crm.service.impl.MenuServiceImpl:selectByParentIdAndEmployeeId');
INSERT INTO `systemlog` VALUES ('194', '1', '2017-12-27 14:42:10', '127.0.0.1', 'cn.wolfcode.crm.service.impl.MenuServiceImpl:selectByParentIdAndEmployeeId', 'cn.wolfcode.crm.service.impl.MenuServiceImpl:selectByParentIdAndEmployeeId');
INSERT INTO `systemlog` VALUES ('195', '1', '2017-12-27 14:43:05', '0:0:0:0:0:0:0:1', 'cn.wolfcode.crm.service.impl.MenuServiceImpl:selectByParentIdAndEmployeeId', 'cn.wolfcode.crm.service.impl.MenuServiceImpl:selectByParentIdAndEmployeeId');
INSERT INTO `systemlog` VALUES ('196', '1', '2017-12-27 14:43:05', '0:0:0:0:0:0:0:1', 'cn.wolfcode.crm.service.impl.MenuServiceImpl:selectByParentIdAndEmployeeId', 'cn.wolfcode.crm.service.impl.MenuServiceImpl:selectByParentIdAndEmployeeId');
INSERT INTO `systemlog` VALUES ('197', '1', '2017-12-27 14:43:05', '0:0:0:0:0:0:0:1', 'cn.wolfcode.crm.service.impl.MenuServiceImpl:selectByParentIdAndEmployeeId', 'cn.wolfcode.crm.service.impl.MenuServiceImpl:selectByParentIdAndEmployeeId');
INSERT INTO `systemlog` VALUES ('198', '1', '2017-12-27 14:43:05', '0:0:0:0:0:0:0:1', 'cn.wolfcode.crm.service.impl.MenuServiceImpl:selectByParentIdAndEmployeeId', 'cn.wolfcode.crm.service.impl.MenuServiceImpl:selectByParentIdAndEmployeeId');
INSERT INTO `systemlog` VALUES ('199', '1', '2017-12-27 14:43:05', '0:0:0:0:0:0:0:1', 'cn.wolfcode.crm.service.impl.MenuServiceImpl:selectByParentIdAndEmployeeId', 'cn.wolfcode.crm.service.impl.MenuServiceImpl:selectByParentIdAndEmployeeId');
INSERT INTO `systemlog` VALUES ('200', '1', '2017-12-27 14:43:06', '0:0:0:0:0:0:0:1', 'cn.wolfcode.crm.service.impl.MenuServiceImpl:selectByParentIdAndEmployeeId', 'cn.wolfcode.crm.service.impl.MenuServiceImpl:selectByParentIdAndEmployeeId');
INSERT INTO `systemlog` VALUES ('201', null, '2017-12-27 14:43:28', '127.0.0.1', 'cn.wolfcode.crm.service.impl.EmployeeServiceImpl:selectByUsername', 'cn.wolfcode.crm.service.impl.EmployeeServiceImpl:selectByUsername');
INSERT INTO `systemlog` VALUES ('202', '1', '2017-12-27 14:43:30', '127.0.0.1', 'cn.wolfcode.crm.service.impl.MenuServiceImpl:selectByParentIdAndEmployeeId', 'cn.wolfcode.crm.service.impl.MenuServiceImpl:selectByParentIdAndEmployeeId');
INSERT INTO `systemlog` VALUES ('203', '1', '2017-12-27 14:43:30', '127.0.0.1', 'cn.wolfcode.crm.service.impl.MenuServiceImpl:selectByParentIdAndEmployeeId', 'cn.wolfcode.crm.service.impl.MenuServiceImpl:selectByParentIdAndEmployeeId');
INSERT INTO `systemlog` VALUES ('204', '1', '2017-12-27 14:43:30', '127.0.0.1', 'cn.wolfcode.crm.service.impl.MenuServiceImpl:selectByParentIdAndEmployeeId', 'cn.wolfcode.crm.service.impl.MenuServiceImpl:selectByParentIdAndEmployeeId');
INSERT INTO `systemlog` VALUES ('205', '1', '2017-12-27 14:43:30', '127.0.0.1', 'cn.wolfcode.crm.service.impl.MenuServiceImpl:selectByParentIdAndEmployeeId', 'cn.wolfcode.crm.service.impl.MenuServiceImpl:selectByParentIdAndEmployeeId');
INSERT INTO `systemlog` VALUES ('206', '1', '2017-12-27 14:43:31', '127.0.0.1', 'cn.wolfcode.crm.service.impl.MenuServiceImpl:selectByParentIdAndEmployeeId', 'cn.wolfcode.crm.service.impl.MenuServiceImpl:selectByParentIdAndEmployeeId');
INSERT INTO `systemlog` VALUES ('207', '1', '2017-12-27 14:43:31', '127.0.0.1', 'cn.wolfcode.crm.service.impl.MenuServiceImpl:selectByParentIdAndEmployeeId', 'cn.wolfcode.crm.service.impl.MenuServiceImpl:selectByParentIdAndEmployeeId');
INSERT INTO `systemlog` VALUES ('208', '1', '2017-12-27 14:47:58', '0:0:0:0:0:0:0:1', 'cn.wolfcode.crm.service.impl.MenuServiceImpl:selectByParentIdAndEmployeeId', 'cn.wolfcode.crm.service.impl.MenuServiceImpl:selectByParentIdAndEmployeeId');
INSERT INTO `systemlog` VALUES ('209', '1', '2017-12-27 14:47:58', '0:0:0:0:0:0:0:1', 'cn.wolfcode.crm.service.impl.MenuServiceImpl:selectByParentIdAndEmployeeId', 'cn.wolfcode.crm.service.impl.MenuServiceImpl:selectByParentIdAndEmployeeId');
INSERT INTO `systemlog` VALUES ('210', '1', '2017-12-27 14:47:58', '0:0:0:0:0:0:0:1', 'cn.wolfcode.crm.service.impl.MenuServiceImpl:selectByParentIdAndEmployeeId', 'cn.wolfcode.crm.service.impl.MenuServiceImpl:selectByParentIdAndEmployeeId');
INSERT INTO `systemlog` VALUES ('211', '1', '2017-12-27 14:47:58', '0:0:0:0:0:0:0:1', 'cn.wolfcode.crm.service.impl.MenuServiceImpl:selectByParentIdAndEmployeeId', 'cn.wolfcode.crm.service.impl.MenuServiceImpl:selectByParentIdAndEmployeeId');
INSERT INTO `systemlog` VALUES ('212', '1', '2017-12-27 14:47:58', '0:0:0:0:0:0:0:1', 'cn.wolfcode.crm.service.impl.MenuServiceImpl:selectByParentIdAndEmployeeId', 'cn.wolfcode.crm.service.impl.MenuServiceImpl:selectByParentIdAndEmployeeId');
INSERT INTO `systemlog` VALUES ('213', '1', '2017-12-27 14:47:58', '0:0:0:0:0:0:0:1', 'cn.wolfcode.crm.service.impl.MenuServiceImpl:selectByParentIdAndEmployeeId', 'cn.wolfcode.crm.service.impl.MenuServiceImpl:selectByParentIdAndEmployeeId');
INSERT INTO `systemlog` VALUES ('214', null, '2017-12-27 14:48:16', '0:0:0:0:0:0:0:1', 'cn.wolfcode.crm.service.impl.EmployeeServiceImpl:selectByUsername', 'cn.wolfcode.crm.service.impl.EmployeeServiceImpl:selectByUsername');
INSERT INTO `systemlog` VALUES ('215', '1', '2017-12-27 14:48:17', '0:0:0:0:0:0:0:1', 'cn.wolfcode.crm.service.impl.MenuServiceImpl:selectByParentIdAndEmployeeId', 'cn.wolfcode.crm.service.impl.MenuServiceImpl:selectByParentIdAndEmployeeId');
INSERT INTO `systemlog` VALUES ('216', '1', '2017-12-27 14:48:17', '0:0:0:0:0:0:0:1', 'cn.wolfcode.crm.service.impl.MenuServiceImpl:selectByParentIdAndEmployeeId', 'cn.wolfcode.crm.service.impl.MenuServiceImpl:selectByParentIdAndEmployeeId');
INSERT INTO `systemlog` VALUES ('217', '1', '2017-12-27 14:48:17', '0:0:0:0:0:0:0:1', 'cn.wolfcode.crm.service.impl.MenuServiceImpl:selectByParentIdAndEmployeeId', 'cn.wolfcode.crm.service.impl.MenuServiceImpl:selectByParentIdAndEmployeeId');
INSERT INTO `systemlog` VALUES ('218', '1', '2017-12-27 14:48:17', '0:0:0:0:0:0:0:1', 'cn.wolfcode.crm.service.impl.MenuServiceImpl:selectByParentIdAndEmployeeId', 'cn.wolfcode.crm.service.impl.MenuServiceImpl:selectByParentIdAndEmployeeId');
INSERT INTO `systemlog` VALUES ('219', '1', '2017-12-27 14:48:17', '0:0:0:0:0:0:0:1', 'cn.wolfcode.crm.service.impl.MenuServiceImpl:selectByParentIdAndEmployeeId', 'cn.wolfcode.crm.service.impl.MenuServiceImpl:selectByParentIdAndEmployeeId');
INSERT INTO `systemlog` VALUES ('220', '1', '2017-12-27 14:48:18', '0:0:0:0:0:0:0:1', 'cn.wolfcode.crm.service.impl.MenuServiceImpl:selectByParentIdAndEmployeeId', 'cn.wolfcode.crm.service.impl.MenuServiceImpl:selectByParentIdAndEmployeeId');
INSERT INTO `systemlog` VALUES ('221', null, '2017-12-27 14:45:38', '192.168.40.130', 'cn.wolfcode.crm.service.impl.EmployeeServiceImpl:selectByUsername', 'cn.wolfcode.crm.service.impl.EmployeeServiceImpl:selectByUsername');
INSERT INTO `systemlog` VALUES ('222', '1', '2017-12-27 14:45:39', '192.168.40.130', 'cn.wolfcode.crm.service.impl.MenuServiceImpl:selectByParentIdAndEmployeeId', 'cn.wolfcode.crm.service.impl.MenuServiceImpl:selectByParentIdAndEmployeeId');
INSERT INTO `systemlog` VALUES ('223', '1', '2017-12-27 14:45:39', '192.168.40.130', 'cn.wolfcode.crm.service.impl.MenuServiceImpl:selectByParentIdAndEmployeeId', 'cn.wolfcode.crm.service.impl.MenuServiceImpl:selectByParentIdAndEmployeeId');
INSERT INTO `systemlog` VALUES ('224', '1', '2017-12-27 14:45:39', '192.168.40.130', 'cn.wolfcode.crm.service.impl.MenuServiceImpl:selectByParentIdAndEmployeeId', 'cn.wolfcode.crm.service.impl.MenuServiceImpl:selectByParentIdAndEmployeeId');
INSERT INTO `systemlog` VALUES ('225', '1', '2017-12-27 14:45:39', '192.168.40.130', 'cn.wolfcode.crm.service.impl.MenuServiceImpl:selectByParentIdAndEmployeeId', 'cn.wolfcode.crm.service.impl.MenuServiceImpl:selectByParentIdAndEmployeeId');
INSERT INTO `systemlog` VALUES ('226', '1', '2017-12-27 14:45:39', '192.168.40.130', 'cn.wolfcode.crm.service.impl.MenuServiceImpl:selectByParentIdAndEmployeeId', 'cn.wolfcode.crm.service.impl.MenuServiceImpl:selectByParentIdAndEmployeeId');
INSERT INTO `systemlog` VALUES ('227', '1', '2017-12-27 14:45:39', '192.168.40.130', 'cn.wolfcode.crm.service.impl.MenuServiceImpl:selectByParentIdAndEmployeeId', 'cn.wolfcode.crm.service.impl.MenuServiceImpl:selectByParentIdAndEmployeeId');
INSERT INTO `systemlog` VALUES ('228', '1', '2017-12-27 14:45:47', '192.168.40.130', 'cn.wolfcode.crm.service.impl.EmployeeServiceImpl:selectAll', 'cn.wolfcode.crm.service.impl.EmployeeServiceImpl:selectAll');
INSERT INTO `systemlog` VALUES ('229', '1', '2017-12-27 14:45:47', '192.168.40.130', 'cn.wolfcode.crm.service.impl.DictionaryDetailServiceImpl:selectByParentSn', 'cn.wolfcode.crm.service.impl.DictionaryDetailServiceImpl:selectByParentSn');
INSERT INTO `systemlog` VALUES ('230', '1', '2017-12-27 14:45:47', '192.168.40.130', 'cn.wolfcode.crm.service.impl.DictionaryDetailServiceImpl:selectByParentSn', 'cn.wolfcode.crm.service.impl.DictionaryDetailServiceImpl:selectByParentSn');
INSERT INTO `systemlog` VALUES ('231', '1', '2017-12-27 14:45:47', '192.168.40.130', 'cn.wolfcode.crm.service.impl.DictionaryDetailServiceImpl:selectByParentSn', 'cn.wolfcode.crm.service.impl.DictionaryDetailServiceImpl:selectByParentSn');
INSERT INTO `systemlog` VALUES ('232', '1', '2017-12-27 14:45:47', '192.168.40.130', 'cn.wolfcode.crm.service.impl.EmployeeServiceImpl:selectAll', 'cn.wolfcode.crm.service.impl.EmployeeServiceImpl:selectAll');
INSERT INTO `systemlog` VALUES ('233', '1', '2017-12-27 14:45:59', '192.168.40.130', 'cn.wolfcode.crm.service.impl.ProductServiceImpl:query', 'cn.wolfcode.crm.service.impl.ProductServiceImpl:query');
INSERT INTO `systemlog` VALUES ('234', '1', '2017-12-27 14:45:59', '192.168.40.130', 'cn.wolfcode.crm.service.impl.EmployeeServiceImpl:selectAll', 'cn.wolfcode.crm.service.impl.EmployeeServiceImpl:selectAll');
INSERT INTO `systemlog` VALUES ('235', '1', '2017-12-27 14:45:59', '192.168.40.130', 'cn.wolfcode.crm.service.impl.CompanyServiceImpl:selectAll', 'cn.wolfcode.crm.service.impl.CompanyServiceImpl:selectAll');
INSERT INTO `systemlog` VALUES ('236', '1', '2017-12-27 14:45:59', '192.168.40.130', 'cn.wolfcode.crm.service.impl.DictionaryDetailServiceImpl:selectByParentSn', 'cn.wolfcode.crm.service.impl.DictionaryDetailServiceImpl:selectByParentSn');
INSERT INTO `systemlog` VALUES ('237', '1', '2017-12-27 14:45:59', '192.168.40.130', 'cn.wolfcode.crm.service.impl.DictionaryDetailServiceImpl:selectByParentSn', 'cn.wolfcode.crm.service.impl.DictionaryDetailServiceImpl:selectByParentSn');
INSERT INTO `systemlog` VALUES ('238', '1', '2017-12-27 14:46:48', '192.168.40.130', 'cn.wolfcode.crm.service.impl.ProductServiceImpl:query', 'cn.wolfcode.crm.service.impl.ProductServiceImpl:query');
INSERT INTO `systemlog` VALUES ('239', '1', '2017-12-27 14:47:06', '192.168.40.130', 'cn.wolfcode.crm.service.impl.EmployeeServiceImpl:selectAll', 'cn.wolfcode.crm.service.impl.EmployeeServiceImpl:selectAll');
INSERT INTO `systemlog` VALUES ('240', '1', '2017-12-27 14:47:06', '192.168.40.130', 'cn.wolfcode.crm.service.impl.DictionaryDetailServiceImpl:selectByParentSn', 'cn.wolfcode.crm.service.impl.DictionaryDetailServiceImpl:selectByParentSn');
INSERT INTO `systemlog` VALUES ('241', '1', '2017-12-27 14:47:06', '192.168.40.130', 'cn.wolfcode.crm.service.impl.DictionaryDetailServiceImpl:selectByParentSn', 'cn.wolfcode.crm.service.impl.DictionaryDetailServiceImpl:selectByParentSn');
INSERT INTO `systemlog` VALUES ('242', '1', '2017-12-27 14:47:06', '192.168.40.130', 'cn.wolfcode.crm.service.impl.CompanyServiceImpl:selectAll', 'cn.wolfcode.crm.service.impl.CompanyServiceImpl:selectAll');
INSERT INTO `systemlog` VALUES ('243', '1', '2017-12-27 14:47:06', '192.168.40.130', 'cn.wolfcode.crm.service.impl.CompanyServiceImpl:selectAll', 'cn.wolfcode.crm.service.impl.CompanyServiceImpl:selectAll');
INSERT INTO `systemlog` VALUES ('244', '1', '2017-12-27 14:47:27', '192.168.40.130', 'cn.wolfcode.crm.service.impl.CompanyServiceImpl:selectAll', 'cn.wolfcode.crm.service.impl.CompanyServiceImpl:selectAll');
INSERT INTO `systemlog` VALUES ('245', '1', '2017-12-27 14:48:01', '192.168.40.130', 'cn.wolfcode.crm.service.impl.EmployeeServiceImpl:selectAll', 'cn.wolfcode.crm.service.impl.EmployeeServiceImpl:selectAll');
INSERT INTO `systemlog` VALUES ('246', '1', '2017-12-27 14:48:01', '192.168.40.130', 'cn.wolfcode.crm.service.impl.DictionaryDetailServiceImpl:selectByParentSn', 'cn.wolfcode.crm.service.impl.DictionaryDetailServiceImpl:selectByParentSn');
INSERT INTO `systemlog` VALUES ('247', '1', '2017-12-27 14:48:01', '192.168.40.130', 'cn.wolfcode.crm.service.impl.CompanyServiceImpl:selectAll', 'cn.wolfcode.crm.service.impl.CompanyServiceImpl:selectAll');
INSERT INTO `systemlog` VALUES ('248', '1', '2017-12-27 14:48:01', '192.168.40.130', 'cn.wolfcode.crm.service.impl.DictionaryDetailServiceImpl:selectByParentSn', 'cn.wolfcode.crm.service.impl.DictionaryDetailServiceImpl:selectByParentSn');
INSERT INTO `systemlog` VALUES ('249', '1', '2017-12-27 14:48:01', '192.168.40.130', 'cn.wolfcode.crm.service.impl.CompanyServiceImpl:selectAll', 'cn.wolfcode.crm.service.impl.CompanyServiceImpl:selectAll');
INSERT INTO `systemlog` VALUES ('250', '1', '2017-12-27 14:48:12', '192.168.40.130', 'cn.wolfcode.crm.service.impl.CompanyServiceImpl:selectAll', 'cn.wolfcode.crm.service.impl.CompanyServiceImpl:selectAll');
INSERT INTO `systemlog` VALUES ('251', '1', '2017-12-27 14:48:33', '192.168.40.130', 'cn.wolfcode.crm.service.impl.CompanyServiceImpl:selectAll', 'cn.wolfcode.crm.service.impl.CompanyServiceImpl:selectAll');
INSERT INTO `systemlog` VALUES ('252', '1', '2017-12-27 14:48:33', '192.168.40.130', 'cn.wolfcode.crm.service.impl.EmployeeServiceImpl:selectAll', 'cn.wolfcode.crm.service.impl.EmployeeServiceImpl:selectAll');
INSERT INTO `systemlog` VALUES ('253', '1', '2017-12-27 14:49:20', '192.168.40.130', 'cn.wolfcode.crm.service.impl.DictionaryDetailServiceImpl:selectByParentSn', 'cn.wolfcode.crm.service.impl.DictionaryDetailServiceImpl:selectByParentSn');
INSERT INTO `systemlog` VALUES ('254', '1', '2017-12-27 14:49:20', '192.168.40.130', 'cn.wolfcode.crm.service.impl.DictionaryDetailServiceImpl:selectByParentSn', 'cn.wolfcode.crm.service.impl.DictionaryDetailServiceImpl:selectByParentSn');
INSERT INTO `systemlog` VALUES ('255', '1', '2017-12-27 14:49:20', '192.168.40.130', 'cn.wolfcode.crm.service.impl.DictionaryDetailServiceImpl:selectByParentSn', 'cn.wolfcode.crm.service.impl.DictionaryDetailServiceImpl:selectByParentSn');
INSERT INTO `systemlog` VALUES ('256', '1', '2017-12-27 14:50:10', '192.168.40.130', 'cn.wolfcode.crm.service.impl.EmployeeServiceImpl:selectAll', 'cn.wolfcode.crm.service.impl.EmployeeServiceImpl:selectAll');
INSERT INTO `systemlog` VALUES ('257', '1', '2017-12-27 14:50:10', '192.168.40.130', 'cn.wolfcode.crm.service.impl.EmployeeServiceImpl:selectAll', 'cn.wolfcode.crm.service.impl.EmployeeServiceImpl:selectAll');
INSERT INTO `systemlog` VALUES ('258', '1', '2017-12-27 14:50:10', '192.168.40.130', 'cn.wolfcode.crm.service.impl.DictionaryDetailServiceImpl:selectByParentSn', 'cn.wolfcode.crm.service.impl.DictionaryDetailServiceImpl:selectByParentSn');
INSERT INTO `systemlog` VALUES ('259', '1', '2017-12-27 14:50:10', '192.168.40.130', 'cn.wolfcode.crm.service.impl.DictionaryDetailServiceImpl:selectByParentSn', 'cn.wolfcode.crm.service.impl.DictionaryDetailServiceImpl:selectByParentSn');
INSERT INTO `systemlog` VALUES ('260', '1', '2017-12-27 14:50:10', '192.168.40.130', 'cn.wolfcode.crm.service.impl.DictionaryDetailServiceImpl:selectByParentSn', 'cn.wolfcode.crm.service.impl.DictionaryDetailServiceImpl:selectByParentSn');
INSERT INTO `systemlog` VALUES ('261', '1', '2017-12-27 14:50:12', '192.168.40.130', 'cn.wolfcode.crm.service.impl.DictionaryDetailServiceImpl:selectByParentSn', 'cn.wolfcode.crm.service.impl.DictionaryDetailServiceImpl:selectByParentSn');
INSERT INTO `systemlog` VALUES ('262', '1', '2017-12-27 14:50:12', '192.168.40.130', 'cn.wolfcode.crm.service.impl.DictionaryDetailServiceImpl:selectByParentSn', 'cn.wolfcode.crm.service.impl.DictionaryDetailServiceImpl:selectByParentSn');
INSERT INTO `systemlog` VALUES ('263', '1', '2017-12-27 14:50:12', '192.168.40.130', 'cn.wolfcode.crm.service.impl.DictionaryDetailServiceImpl:selectByParentSn', 'cn.wolfcode.crm.service.impl.DictionaryDetailServiceImpl:selectByParentSn');
INSERT INTO `systemlog` VALUES ('264', null, '2017-12-27 14:51:29', '192.168.40.130', 'cn.wolfcode.crm.service.impl.EmployeeServiceImpl:selectByUsername', 'cn.wolfcode.crm.service.impl.EmployeeServiceImpl:selectByUsername');
INSERT INTO `systemlog` VALUES ('265', '1', '2017-12-27 14:51:29', '192.168.40.130', 'cn.wolfcode.crm.service.impl.MenuServiceImpl:selectByParentIdAndEmployeeId', 'cn.wolfcode.crm.service.impl.MenuServiceImpl:selectByParentIdAndEmployeeId');
INSERT INTO `systemlog` VALUES ('266', '1', '2017-12-27 14:51:29', '192.168.40.130', 'cn.wolfcode.crm.service.impl.MenuServiceImpl:selectByParentIdAndEmployeeId', 'cn.wolfcode.crm.service.impl.MenuServiceImpl:selectByParentIdAndEmployeeId');
INSERT INTO `systemlog` VALUES ('267', '1', '2017-12-27 14:51:30', '192.168.40.130', 'cn.wolfcode.crm.service.impl.MenuServiceImpl:selectByParentIdAndEmployeeId', 'cn.wolfcode.crm.service.impl.MenuServiceImpl:selectByParentIdAndEmployeeId');
INSERT INTO `systemlog` VALUES ('268', '1', '2017-12-27 14:51:30', '192.168.40.130', 'cn.wolfcode.crm.service.impl.MenuServiceImpl:selectByParentIdAndEmployeeId', 'cn.wolfcode.crm.service.impl.MenuServiceImpl:selectByParentIdAndEmployeeId');
INSERT INTO `systemlog` VALUES ('269', '1', '2017-12-27 14:51:30', '192.168.40.130', 'cn.wolfcode.crm.service.impl.MenuServiceImpl:selectByParentIdAndEmployeeId', 'cn.wolfcode.crm.service.impl.MenuServiceImpl:selectByParentIdAndEmployeeId');
INSERT INTO `systemlog` VALUES ('270', '1', '2017-12-27 14:51:30', '192.168.40.130', 'cn.wolfcode.crm.service.impl.MenuServiceImpl:selectByParentIdAndEmployeeId', 'cn.wolfcode.crm.service.impl.MenuServiceImpl:selectByParentIdAndEmployeeId');
INSERT INTO `systemlog` VALUES ('271', '1', '2017-12-27 14:51:32', '192.168.40.130', 'cn.wolfcode.crm.service.impl.DictionaryDetailServiceImpl:selectByParentSn', 'cn.wolfcode.crm.service.impl.DictionaryDetailServiceImpl:selectByParentSn');
INSERT INTO `systemlog` VALUES ('272', '1', '2017-12-27 14:51:32', '192.168.40.130', 'cn.wolfcode.crm.service.impl.DictionaryDetailServiceImpl:selectByParentSn', 'cn.wolfcode.crm.service.impl.DictionaryDetailServiceImpl:selectByParentSn');
INSERT INTO `systemlog` VALUES ('273', '1', '2017-12-27 14:51:32', '192.168.40.130', 'cn.wolfcode.crm.service.impl.DictionaryDetailServiceImpl:selectByParentSn', 'cn.wolfcode.crm.service.impl.DictionaryDetailServiceImpl:selectByParentSn');
INSERT INTO `systemlog` VALUES ('274', '1', '2017-12-27 14:51:34', '192.168.40.130', 'cn.wolfcode.crm.service.impl.DictionaryDetailServiceImpl:selectByParentSn', 'cn.wolfcode.crm.service.impl.DictionaryDetailServiceImpl:selectByParentSn');
INSERT INTO `systemlog` VALUES ('275', '1', '2017-12-27 14:51:34', '192.168.40.130', 'cn.wolfcode.crm.service.impl.DictionaryDetailServiceImpl:selectByParentSn', 'cn.wolfcode.crm.service.impl.DictionaryDetailServiceImpl:selectByParentSn');
INSERT INTO `systemlog` VALUES ('276', '1', '2017-12-27 14:51:34', '192.168.40.130', 'cn.wolfcode.crm.service.impl.EmployeeServiceImpl:selectAll', 'cn.wolfcode.crm.service.impl.EmployeeServiceImpl:selectAll');
INSERT INTO `systemlog` VALUES ('277', '1', '2017-12-27 14:51:34', '192.168.40.130', 'cn.wolfcode.crm.service.impl.DictionaryDetailServiceImpl:selectByParentSn', 'cn.wolfcode.crm.service.impl.DictionaryDetailServiceImpl:selectByParentSn');
INSERT INTO `systemlog` VALUES ('278', '1', '2017-12-27 14:51:34', '192.168.40.130', 'cn.wolfcode.crm.service.impl.EmployeeServiceImpl:selectAll', 'cn.wolfcode.crm.service.impl.EmployeeServiceImpl:selectAll');
INSERT INTO `systemlog` VALUES ('279', '1', '2017-12-27 14:51:35', '192.168.40.130', 'cn.wolfcode.crm.service.impl.DictionaryDetailServiceImpl:selectByParentSn', 'cn.wolfcode.crm.service.impl.DictionaryDetailServiceImpl:selectByParentSn');
INSERT INTO `systemlog` VALUES ('280', '1', '2017-12-27 14:51:35', '192.168.40.130', 'cn.wolfcode.crm.service.impl.DictionaryDetailServiceImpl:selectByParentSn', 'cn.wolfcode.crm.service.impl.DictionaryDetailServiceImpl:selectByParentSn');
INSERT INTO `systemlog` VALUES ('281', '1', '2017-12-27 14:51:35', '192.168.40.130', 'cn.wolfcode.crm.service.impl.DictionaryDetailServiceImpl:selectByParentSn', 'cn.wolfcode.crm.service.impl.DictionaryDetailServiceImpl:selectByParentSn');
INSERT INTO `systemlog` VALUES ('282', '1', '2017-12-27 14:51:58', '192.168.40.130', 'cn.wolfcode.crm.service.impl.ProductServiceImpl:query', 'cn.wolfcode.crm.service.impl.ProductServiceImpl:query');
INSERT INTO `systemlog` VALUES ('283', '1', '2017-12-27 14:51:58', '192.168.40.130', 'cn.wolfcode.crm.service.impl.EmployeeServiceImpl:selectAll', 'cn.wolfcode.crm.service.impl.EmployeeServiceImpl:selectAll');
INSERT INTO `systemlog` VALUES ('284', '1', '2017-12-27 14:51:58', '192.168.40.130', 'cn.wolfcode.crm.service.impl.CompanyServiceImpl:selectAll', 'cn.wolfcode.crm.service.impl.CompanyServiceImpl:selectAll');
INSERT INTO `systemlog` VALUES ('285', '1', '2017-12-27 14:51:58', '192.168.40.130', 'cn.wolfcode.crm.service.impl.DictionaryDetailServiceImpl:selectByParentSn', 'cn.wolfcode.crm.service.impl.DictionaryDetailServiceImpl:selectByParentSn');
INSERT INTO `systemlog` VALUES ('286', '1', '2017-12-27 14:51:58', '192.168.40.130', 'cn.wolfcode.crm.service.impl.DictionaryDetailServiceImpl:selectByParentSn', 'cn.wolfcode.crm.service.impl.DictionaryDetailServiceImpl:selectByParentSn');
INSERT INTO `systemlog` VALUES ('287', '1', '2017-12-27 14:52:27', '192.168.40.130', 'cn.wolfcode.crm.service.impl.ClaimsheetServiceImpl:query', 'cn.wolfcode.crm.service.impl.ClaimsheetServiceImpl:query');
INSERT INTO `systemlog` VALUES ('288', '1', '2017-12-27 14:52:27', '192.168.40.130', 'cn.wolfcode.crm.service.impl.EmployeeServiceImpl:selectAll', 'cn.wolfcode.crm.service.impl.EmployeeServiceImpl:selectAll');
INSERT INTO `systemlog` VALUES ('289', '1', '2017-12-27 14:52:30', '192.168.40.130', 'cn.wolfcode.crm.service.impl.ClaimsheetServiceImpl:query', 'cn.wolfcode.crm.service.impl.ClaimsheetServiceImpl:query');
INSERT INTO `systemlog` VALUES ('290', '1', '2017-12-27 14:52:30', '192.168.40.130', 'cn.wolfcode.crm.service.impl.EmployeeServiceImpl:selectAll', 'cn.wolfcode.crm.service.impl.EmployeeServiceImpl:selectAll');
INSERT INTO `systemlog` VALUES ('291', '1', '2017-12-27 14:52:31', '192.168.40.130', 'cn.wolfcode.crm.service.impl.ClaimsheetServiceImpl:query', 'cn.wolfcode.crm.service.impl.ClaimsheetServiceImpl:query');
INSERT INTO `systemlog` VALUES ('292', '1', '2017-12-27 14:52:31', '192.168.40.130', 'cn.wolfcode.crm.service.impl.EmployeeServiceImpl:selectAll', 'cn.wolfcode.crm.service.impl.EmployeeServiceImpl:selectAll');
INSERT INTO `systemlog` VALUES ('293', '1', '2017-12-27 14:52:32', '192.168.40.130', 'cn.wolfcode.crm.service.impl.ClaimsheetServiceImpl:query', 'cn.wolfcode.crm.service.impl.ClaimsheetServiceImpl:query');
INSERT INTO `systemlog` VALUES ('294', '1', '2017-12-27 14:52:32', '192.168.40.130', 'cn.wolfcode.crm.service.impl.EmployeeServiceImpl:selectAll', 'cn.wolfcode.crm.service.impl.EmployeeServiceImpl:selectAll');
INSERT INTO `systemlog` VALUES ('295', '1', '2017-12-27 14:52:32', '192.168.40.130', 'cn.wolfcode.crm.service.impl.ClaimsheetServiceImpl:query', 'cn.wolfcode.crm.service.impl.ClaimsheetServiceImpl:query');
INSERT INTO `systemlog` VALUES ('296', '1', '2017-12-27 14:52:33', '192.168.40.130', 'cn.wolfcode.crm.service.impl.EmployeeServiceImpl:selectAll', 'cn.wolfcode.crm.service.impl.EmployeeServiceImpl:selectAll');
INSERT INTO `systemlog` VALUES ('297', null, '2017-12-27 14:55:59', '192.168.40.130', 'cn.wolfcode.crm.service.impl.EmployeeServiceImpl:selectByUsername', 'cn.wolfcode.crm.service.impl.EmployeeServiceImpl:selectByUsername');
INSERT INTO `systemlog` VALUES ('298', '1', '2017-12-27 14:55:59', '192.168.40.130', 'cn.wolfcode.crm.service.impl.MenuServiceImpl:selectByParentIdAndEmployeeId', 'cn.wolfcode.crm.service.impl.MenuServiceImpl:selectByParentIdAndEmployeeId');
INSERT INTO `systemlog` VALUES ('299', '1', '2017-12-27 14:56:00', '192.168.40.130', 'cn.wolfcode.crm.service.impl.MenuServiceImpl:selectByParentIdAndEmployeeId', 'cn.wolfcode.crm.service.impl.MenuServiceImpl:selectByParentIdAndEmployeeId');
INSERT INTO `systemlog` VALUES ('300', '1', '2017-12-27 14:56:00', '192.168.40.130', 'cn.wolfcode.crm.service.impl.MenuServiceImpl:selectByParentIdAndEmployeeId', 'cn.wolfcode.crm.service.impl.MenuServiceImpl:selectByParentIdAndEmployeeId');
INSERT INTO `systemlog` VALUES ('301', '1', '2017-12-27 14:56:00', '192.168.40.130', 'cn.wolfcode.crm.service.impl.MenuServiceImpl:selectByParentIdAndEmployeeId', 'cn.wolfcode.crm.service.impl.MenuServiceImpl:selectByParentIdAndEmployeeId');
INSERT INTO `systemlog` VALUES ('302', '1', '2017-12-27 14:56:00', '192.168.40.130', 'cn.wolfcode.crm.service.impl.MenuServiceImpl:selectByParentIdAndEmployeeId', 'cn.wolfcode.crm.service.impl.MenuServiceImpl:selectByParentIdAndEmployeeId');
INSERT INTO `systemlog` VALUES ('303', '1', '2017-12-27 14:56:00', '192.168.40.130', 'cn.wolfcode.crm.service.impl.MenuServiceImpl:selectByParentIdAndEmployeeId', 'cn.wolfcode.crm.service.impl.MenuServiceImpl:selectByParentIdAndEmployeeId');
INSERT INTO `systemlog` VALUES ('304', '1', '2017-12-27 14:56:58', '192.168.40.130', 'cn.wolfcode.crm.service.impl.EmployeeServiceImpl:query', 'cn.wolfcode.crm.service.impl.EmployeeServiceImpl:query');
INSERT INTO `systemlog` VALUES ('305', '1', '2017-12-27 14:56:58', '192.168.40.130', 'cn.wolfcode.crm.service.impl.DepartmentServiceImpl:selectAll', 'cn.wolfcode.crm.service.impl.DepartmentServiceImpl:selectAll');
INSERT INTO `systemlog` VALUES ('306', '1', '2017-12-27 14:56:58', '192.168.40.130', 'cn.wolfcode.crm.service.impl.DepartmentServiceImpl:selectAll', 'cn.wolfcode.crm.service.impl.DepartmentServiceImpl:selectAll');
INSERT INTO `systemlog` VALUES ('307', '1', '2017-12-27 14:56:58', '192.168.40.130', 'cn.wolfcode.crm.service.impl.RoleServiceImpl:selectAll', 'cn.wolfcode.crm.service.impl.RoleServiceImpl:selectAll');
INSERT INTO `systemlog` VALUES ('308', '1', '2017-12-27 14:57:15', '192.168.40.130', 'cn.wolfcode.crm.service.impl.EmployeeServiceImpl:query', 'cn.wolfcode.crm.service.impl.EmployeeServiceImpl:query');
INSERT INTO `systemlog` VALUES ('309', '1', '2017-12-27 14:57:15', '192.168.40.130', 'cn.wolfcode.crm.service.impl.DepartmentServiceImpl:selectAll', 'cn.wolfcode.crm.service.impl.DepartmentServiceImpl:selectAll');
INSERT INTO `systemlog` VALUES ('310', '1', '2017-12-27 14:57:15', '192.168.40.130', 'cn.wolfcode.crm.service.impl.DepartmentServiceImpl:selectAll', 'cn.wolfcode.crm.service.impl.DepartmentServiceImpl:selectAll');
INSERT INTO `systemlog` VALUES ('311', '1', '2017-12-27 14:57:15', '192.168.40.130', 'cn.wolfcode.crm.service.impl.RoleServiceImpl:selectAll', 'cn.wolfcode.crm.service.impl.RoleServiceImpl:selectAll');
INSERT INTO `systemlog` VALUES ('312', '1', '2017-12-27 14:57:31', '192.168.40.130', 'cn.wolfcode.crm.service.impl.DictionaryDirectoryServiceImpl:query', 'cn.wolfcode.crm.service.impl.DictionaryDirectoryServiceImpl:query');
INSERT INTO `systemlog` VALUES ('313', '1', '2017-12-27 14:57:39', '192.168.40.130', 'cn.wolfcode.crm.service.impl.DictionaryDirectoryServiceImpl:query', 'cn.wolfcode.crm.service.impl.DictionaryDirectoryServiceImpl:query');
INSERT INTO `systemlog` VALUES ('314', '1', '2017-12-27 14:57:55', '192.168.40.130', 'cn.wolfcode.crm.service.impl.WagesServiceImpl:query', 'cn.wolfcode.crm.service.impl.WagesServiceImpl:query');
INSERT INTO `systemlog` VALUES ('315', '1', '2017-12-27 14:58:02', '192.168.40.130', 'cn.wolfcode.crm.service.impl.WagesServiceImpl:selectAll', 'cn.wolfcode.crm.service.impl.WagesServiceImpl:selectAll');
INSERT INTO `systemlog` VALUES ('316', '1', '2017-12-27 14:58:17', '192.168.40.130', 'cn.wolfcode.crm.service.impl.WagesServiceImpl:selectAll', 'cn.wolfcode.crm.service.impl.WagesServiceImpl:selectAll');
INSERT INTO `systemlog` VALUES ('317', '1', '2017-12-27 14:58:26', '192.168.40.130', 'cn.wolfcode.crm.service.impl.WagesServiceImpl:query', 'cn.wolfcode.crm.service.impl.WagesServiceImpl:query');
INSERT INTO `systemlog` VALUES ('318', '1', '2017-12-27 14:58:30', '192.168.40.130', 'cn.wolfcode.crm.service.impl.EmployeeServiceImpl:query', 'cn.wolfcode.crm.service.impl.EmployeeServiceImpl:query');
INSERT INTO `systemlog` VALUES ('319', '1', '2017-12-27 14:58:30', '192.168.40.130', 'cn.wolfcode.crm.service.impl.DepartmentServiceImpl:selectAll', 'cn.wolfcode.crm.service.impl.DepartmentServiceImpl:selectAll');
INSERT INTO `systemlog` VALUES ('320', '1', '2017-12-27 14:58:30', '192.168.40.130', 'cn.wolfcode.crm.service.impl.DepartmentServiceImpl:selectAll', 'cn.wolfcode.crm.service.impl.DepartmentServiceImpl:selectAll');
INSERT INTO `systemlog` VALUES ('321', '1', '2017-12-27 14:58:30', '192.168.40.130', 'cn.wolfcode.crm.service.impl.RoleServiceImpl:selectAll', 'cn.wolfcode.crm.service.impl.RoleServiceImpl:selectAll');
INSERT INTO `systemlog` VALUES ('322', '1', '2017-12-27 14:58:31', '192.168.40.130', 'cn.wolfcode.crm.service.impl.GuaranteeServiceImpl:query', 'cn.wolfcode.crm.service.impl.GuaranteeServiceImpl:query');
INSERT INTO `systemlog` VALUES ('323', '1', '2017-12-27 14:58:54', '192.168.40.130', 'cn.wolfcode.crm.service.impl.EmployeeServiceImpl:selectAll', 'cn.wolfcode.crm.service.impl.EmployeeServiceImpl:selectAll');
INSERT INTO `systemlog` VALUES ('324', '1', '2017-12-27 14:58:54', '192.168.40.130', 'cn.wolfcode.crm.service.impl.DictionaryDetailServiceImpl:selectByParentSn', 'cn.wolfcode.crm.service.impl.DictionaryDetailServiceImpl:selectByParentSn');
INSERT INTO `systemlog` VALUES ('325', '1', '2017-12-27 14:58:54', '192.168.40.130', 'cn.wolfcode.crm.service.impl.EmployeeServiceImpl:selectAll', 'cn.wolfcode.crm.service.impl.EmployeeServiceImpl:selectAll');
INSERT INTO `systemlog` VALUES ('326', '1', '2017-12-27 14:58:54', '192.168.40.130', 'cn.wolfcode.crm.service.impl.DictionaryDetailServiceImpl:selectByParentSn', 'cn.wolfcode.crm.service.impl.DictionaryDetailServiceImpl:selectByParentSn');
INSERT INTO `systemlog` VALUES ('327', '1', '2017-12-27 14:58:54', '192.168.40.130', 'cn.wolfcode.crm.service.impl.DictionaryDetailServiceImpl:selectByParentSn', 'cn.wolfcode.crm.service.impl.DictionaryDetailServiceImpl:selectByParentSn');
INSERT INTO `systemlog` VALUES ('328', '1', '2017-12-27 14:59:18', '192.168.40.130', 'cn.wolfcode.crm.service.impl.EmployeeServiceImpl:selectAll', 'cn.wolfcode.crm.service.impl.EmployeeServiceImpl:selectAll');
INSERT INTO `systemlog` VALUES ('329', '1', '2017-12-27 14:59:18', '192.168.40.130', 'cn.wolfcode.crm.service.impl.DictionaryDetailServiceImpl:selectByParentSn', 'cn.wolfcode.crm.service.impl.DictionaryDetailServiceImpl:selectByParentSn');
INSERT INTO `systemlog` VALUES ('330', '1', '2017-12-27 14:59:18', '192.168.40.130', 'cn.wolfcode.crm.service.impl.EmployeeServiceImpl:selectAll', 'cn.wolfcode.crm.service.impl.EmployeeServiceImpl:selectAll');
INSERT INTO `systemlog` VALUES ('331', '1', '2017-12-27 14:59:18', '192.168.40.130', 'cn.wolfcode.crm.service.impl.DictionaryDetailServiceImpl:selectByParentSn', 'cn.wolfcode.crm.service.impl.DictionaryDetailServiceImpl:selectByParentSn');
INSERT INTO `systemlog` VALUES ('332', '1', '2017-12-27 14:59:18', '192.168.40.130', 'cn.wolfcode.crm.service.impl.DictionaryDetailServiceImpl:selectByParentSn', 'cn.wolfcode.crm.service.impl.DictionaryDetailServiceImpl:selectByParentSn');
INSERT INTO `systemlog` VALUES ('333', '1', '2017-12-27 14:59:19', '192.168.40.130', 'cn.wolfcode.crm.service.impl.DictionaryDetailServiceImpl:selectByParentSn', 'cn.wolfcode.crm.service.impl.DictionaryDetailServiceImpl:selectByParentSn');
INSERT INTO `systemlog` VALUES ('334', '1', '2017-12-27 14:59:19', '192.168.40.130', 'cn.wolfcode.crm.service.impl.DictionaryDetailServiceImpl:selectByParentSn', 'cn.wolfcode.crm.service.impl.DictionaryDetailServiceImpl:selectByParentSn');
INSERT INTO `systemlog` VALUES ('335', '1', '2017-12-27 14:59:19', '192.168.40.130', 'cn.wolfcode.crm.service.impl.DictionaryDetailServiceImpl:selectByParentSn', 'cn.wolfcode.crm.service.impl.DictionaryDetailServiceImpl:selectByParentSn');
INSERT INTO `systemlog` VALUES ('336', '1', '2017-12-27 14:59:49', '192.168.40.130', 'cn.wolfcode.crm.service.impl.DictionaryDetailServiceImpl:selectByParentSn', 'cn.wolfcode.crm.service.impl.DictionaryDetailServiceImpl:selectByParentSn');
INSERT INTO `systemlog` VALUES ('337', '1', '2017-12-27 14:59:49', '192.168.40.130', 'cn.wolfcode.crm.service.impl.DictionaryDetailServiceImpl:selectByParentSn', 'cn.wolfcode.crm.service.impl.DictionaryDetailServiceImpl:selectByParentSn');
INSERT INTO `systemlog` VALUES ('338', '1', '2017-12-27 14:59:49', '192.168.40.130', 'cn.wolfcode.crm.service.impl.ClientRecordServiceImpl:query', 'cn.wolfcode.crm.service.impl.ClientRecordServiceImpl:query');
INSERT INTO `systemlog` VALUES ('339', '1', '2017-12-27 14:59:50', '192.168.40.130', 'cn.wolfcode.crm.service.impl.DictionaryDetailServiceImpl:selectByParentSn', 'cn.wolfcode.crm.service.impl.DictionaryDetailServiceImpl:selectByParentSn');
INSERT INTO `systemlog` VALUES ('340', '1', '2017-12-27 14:59:50', '192.168.40.130', 'cn.wolfcode.crm.service.impl.ClientRecordServiceImpl:query', 'cn.wolfcode.crm.service.impl.ClientRecordServiceImpl:query');
INSERT INTO `systemlog` VALUES ('341', '1', '2017-12-27 14:59:50', '192.168.40.130', 'cn.wolfcode.crm.service.impl.DictionaryDetailServiceImpl:selectByParentSn', 'cn.wolfcode.crm.service.impl.DictionaryDetailServiceImpl:selectByParentSn');
INSERT INTO `systemlog` VALUES ('342', '1', '2017-12-27 15:00:02', '192.168.40.130', 'cn.wolfcode.crm.service.impl.CompanyServiceImpl:selectAll', 'cn.wolfcode.crm.service.impl.CompanyServiceImpl:selectAll');
INSERT INTO `systemlog` VALUES ('343', '1', '2017-12-27 15:00:04', '192.168.40.130', 'cn.wolfcode.crm.service.impl.ClientRecordServiceImpl:query', 'cn.wolfcode.crm.service.impl.ClientRecordServiceImpl:query');
INSERT INTO `systemlog` VALUES ('344', '1', '2017-12-27 15:00:04', '192.168.40.130', 'cn.wolfcode.crm.service.impl.DictionaryDetailServiceImpl:selectByParentSn', 'cn.wolfcode.crm.service.impl.DictionaryDetailServiceImpl:selectByParentSn');
INSERT INTO `systemlog` VALUES ('345', '1', '2017-12-27 15:00:04', '192.168.40.130', 'cn.wolfcode.crm.service.impl.DictionaryDetailServiceImpl:selectByParentSn', 'cn.wolfcode.crm.service.impl.DictionaryDetailServiceImpl:selectByParentSn');
INSERT INTO `systemlog` VALUES ('346', '1', '2017-12-27 15:00:08', '192.168.40.130', 'cn.wolfcode.crm.service.impl.ChangeRecordServiceImpl:query', 'cn.wolfcode.crm.service.impl.ChangeRecordServiceImpl:query');
INSERT INTO `systemlog` VALUES ('347', '1', '2017-12-27 15:00:18', '192.168.40.130', 'cn.wolfcode.crm.service.impl.CompanyServiceImpl:selectAll', 'cn.wolfcode.crm.service.impl.CompanyServiceImpl:selectAll');
INSERT INTO `systemlog` VALUES ('348', '1', '2017-12-27 15:00:35', '192.168.40.130', 'cn.wolfcode.crm.service.impl.CompanyServiceImpl:selectAll', 'cn.wolfcode.crm.service.impl.CompanyServiceImpl:selectAll');
INSERT INTO `systemlog` VALUES ('349', '1', '2017-12-27 15:00:36', '192.168.40.130', 'cn.wolfcode.crm.service.impl.ProductServiceImpl:query', 'cn.wolfcode.crm.service.impl.ProductServiceImpl:query');
INSERT INTO `systemlog` VALUES ('350', '1', '2017-12-27 15:00:36', '192.168.40.130', 'cn.wolfcode.crm.service.impl.CompanyServiceImpl:selectAll', 'cn.wolfcode.crm.service.impl.CompanyServiceImpl:selectAll');
INSERT INTO `systemlog` VALUES ('351', '1', '2017-12-27 15:00:36', '192.168.40.130', 'cn.wolfcode.crm.service.impl.EmployeeServiceImpl:selectAll', 'cn.wolfcode.crm.service.impl.EmployeeServiceImpl:selectAll');
INSERT INTO `systemlog` VALUES ('352', '1', '2017-12-27 15:00:36', '192.168.40.130', 'cn.wolfcode.crm.service.impl.DictionaryDetailServiceImpl:selectByParentSn', 'cn.wolfcode.crm.service.impl.DictionaryDetailServiceImpl:selectByParentSn');
INSERT INTO `systemlog` VALUES ('353', '1', '2017-12-27 15:00:36', '192.168.40.130', 'cn.wolfcode.crm.service.impl.DictionaryDetailServiceImpl:selectByParentSn', 'cn.wolfcode.crm.service.impl.DictionaryDetailServiceImpl:selectByParentSn');
INSERT INTO `systemlog` VALUES ('354', '1', '2017-12-27 15:02:05', '192.168.40.130', 'cn.wolfcode.crm.service.impl.ProductServiceImpl:query', 'cn.wolfcode.crm.service.impl.ProductServiceImpl:query');
INSERT INTO `systemlog` VALUES ('355', '1', '2017-12-27 15:02:09', '192.168.40.130', 'cn.wolfcode.crm.service.impl.ProductServiceImpl:query', 'cn.wolfcode.crm.service.impl.ProductServiceImpl:query');
INSERT INTO `systemlog` VALUES ('356', '1', '2017-12-27 15:02:12', '192.168.40.130', 'cn.wolfcode.crm.service.impl.ProductServiceImpl:query', 'cn.wolfcode.crm.service.impl.ProductServiceImpl:query');
INSERT INTO `systemlog` VALUES ('357', '1', '2017-12-27 15:03:11', '192.168.40.130', 'cn.wolfcode.crm.service.impl.EmployeeServiceImpl:selectAll', 'cn.wolfcode.crm.service.impl.EmployeeServiceImpl:selectAll');
INSERT INTO `systemlog` VALUES ('358', '1', '2017-12-27 15:03:11', '192.168.40.130', 'cn.wolfcode.crm.service.impl.DictionaryDetailServiceImpl:selectByParentSn', 'cn.wolfcode.crm.service.impl.DictionaryDetailServiceImpl:selectByParentSn');
INSERT INTO `systemlog` VALUES ('359', '1', '2017-12-27 15:03:11', '192.168.40.130', 'cn.wolfcode.crm.service.impl.CompanyServiceImpl:selectAll', 'cn.wolfcode.crm.service.impl.CompanyServiceImpl:selectAll');
INSERT INTO `systemlog` VALUES ('360', '1', '2017-12-27 15:03:11', '192.168.40.130', 'cn.wolfcode.crm.service.impl.CompanyServiceImpl:selectAll', 'cn.wolfcode.crm.service.impl.CompanyServiceImpl:selectAll');
INSERT INTO `systemlog` VALUES ('361', '1', '2017-12-27 15:03:11', '192.168.40.130', 'cn.wolfcode.crm.service.impl.DictionaryDetailServiceImpl:selectByParentSn', 'cn.wolfcode.crm.service.impl.DictionaryDetailServiceImpl:selectByParentSn');
INSERT INTO `systemlog` VALUES ('362', '1', '2017-12-27 15:03:33', '192.168.40.130', 'cn.wolfcode.crm.service.impl.CompanyServiceImpl:selectAll', 'cn.wolfcode.crm.service.impl.CompanyServiceImpl:selectAll');
INSERT INTO `systemlog` VALUES ('363', '1', '2017-12-27 15:04:25', '192.168.40.130', 'cn.wolfcode.crm.service.impl.CompanyServiceImpl:selectAll', 'cn.wolfcode.crm.service.impl.CompanyServiceImpl:selectAll');
INSERT INTO `systemlog` VALUES ('364', '1', '2017-12-27 15:04:25', '192.168.40.130', 'cn.wolfcode.crm.service.impl.EmployeeServiceImpl:selectAll', 'cn.wolfcode.crm.service.impl.EmployeeServiceImpl:selectAll');
INSERT INTO `systemlog` VALUES ('365', null, '2017-12-27 15:05:06', '0:0:0:0:0:0:0:1', 'cn.wolfcode.crm.service.impl.EmployeeServiceImpl:selectByUsername', 'cn.wolfcode.crm.service.impl.EmployeeServiceImpl:selectByUsername');
INSERT INTO `systemlog` VALUES ('366', '1', '2017-12-27 15:05:07', '0:0:0:0:0:0:0:1', 'cn.wolfcode.crm.service.impl.MenuServiceImpl:selectByParentIdAndEmployeeId', 'cn.wolfcode.crm.service.impl.MenuServiceImpl:selectByParentIdAndEmployeeId');
INSERT INTO `systemlog` VALUES ('367', '1', '2017-12-27 15:05:07', '0:0:0:0:0:0:0:1', 'cn.wolfcode.crm.service.impl.MenuServiceImpl:selectByParentIdAndEmployeeId', 'cn.wolfcode.crm.service.impl.MenuServiceImpl:selectByParentIdAndEmployeeId');
INSERT INTO `systemlog` VALUES ('368', '1', '2017-12-27 15:05:07', '0:0:0:0:0:0:0:1', 'cn.wolfcode.crm.service.impl.MenuServiceImpl:selectByParentIdAndEmployeeId', 'cn.wolfcode.crm.service.impl.MenuServiceImpl:selectByParentIdAndEmployeeId');
INSERT INTO `systemlog` VALUES ('369', '1', '2017-12-27 15:05:07', '0:0:0:0:0:0:0:1', 'cn.wolfcode.crm.service.impl.MenuServiceImpl:selectByParentIdAndEmployeeId', 'cn.wolfcode.crm.service.impl.MenuServiceImpl:selectByParentIdAndEmployeeId');
INSERT INTO `systemlog` VALUES ('370', '1', '2017-12-27 15:05:07', '0:0:0:0:0:0:0:1', 'cn.wolfcode.crm.service.impl.MenuServiceImpl:selectByParentIdAndEmployeeId', 'cn.wolfcode.crm.service.impl.MenuServiceImpl:selectByParentIdAndEmployeeId');
INSERT INTO `systemlog` VALUES ('371', '1', '2017-12-27 15:05:08', '0:0:0:0:0:0:0:1', 'cn.wolfcode.crm.service.impl.MenuServiceImpl:selectByParentIdAndEmployeeId', 'cn.wolfcode.crm.service.impl.MenuServiceImpl:selectByParentIdAndEmployeeId');
INSERT INTO `systemlog` VALUES ('372', '1', '2017-12-27 15:05:12', '0:0:0:0:0:0:0:1', 'cn.wolfcode.crm.service.impl.EmployeeServiceImpl:selectAll', 'cn.wolfcode.crm.service.impl.EmployeeServiceImpl:selectAll');
INSERT INTO `systemlog` VALUES ('373', '1', '2017-12-27 15:05:12', '0:0:0:0:0:0:0:1', 'cn.wolfcode.crm.service.impl.EmployeeServiceImpl:selectAll', 'cn.wolfcode.crm.service.impl.EmployeeServiceImpl:selectAll');
INSERT INTO `systemlog` VALUES ('374', '1', '2017-12-27 15:05:12', '0:0:0:0:0:0:0:1', 'cn.wolfcode.crm.service.impl.DictionaryDetailServiceImpl:selectByParentSn', 'cn.wolfcode.crm.service.impl.DictionaryDetailServiceImpl:selectByParentSn');
INSERT INTO `systemlog` VALUES ('375', '1', '2017-12-27 15:05:12', '0:0:0:0:0:0:0:1', 'cn.wolfcode.crm.service.impl.DictionaryDetailServiceImpl:selectByParentSn', 'cn.wolfcode.crm.service.impl.DictionaryDetailServiceImpl:selectByParentSn');
INSERT INTO `systemlog` VALUES ('376', '1', '2017-12-27 15:05:12', '0:0:0:0:0:0:0:1', 'cn.wolfcode.crm.service.impl.DictionaryDetailServiceImpl:selectByParentSn', 'cn.wolfcode.crm.service.impl.DictionaryDetailServiceImpl:selectByParentSn');
INSERT INTO `systemlog` VALUES ('377', '1', '2017-12-27 15:05:15', '0:0:0:0:0:0:0:1', 'cn.wolfcode.crm.service.impl.DictionaryDetailServiceImpl:selectByParentSn', 'cn.wolfcode.crm.service.impl.DictionaryDetailServiceImpl:selectByParentSn');
INSERT INTO `systemlog` VALUES ('378', '1', '2017-12-27 15:05:15', '0:0:0:0:0:0:0:1', 'cn.wolfcode.crm.service.impl.DictionaryDetailServiceImpl:selectByParentSn', 'cn.wolfcode.crm.service.impl.DictionaryDetailServiceImpl:selectByParentSn');
INSERT INTO `systemlog` VALUES ('379', '1', '2017-12-27 15:05:15', '0:0:0:0:0:0:0:1', 'cn.wolfcode.crm.service.impl.DictionaryDetailServiceImpl:selectByParentSn', 'cn.wolfcode.crm.service.impl.DictionaryDetailServiceImpl:selectByParentSn');
INSERT INTO `systemlog` VALUES ('380', '1', '2017-12-27 15:05:34', '192.168.40.130', 'cn.wolfcode.crm.service.impl.CompanyServiceImpl:selectAll', 'cn.wolfcode.crm.service.impl.CompanyServiceImpl:selectAll');
INSERT INTO `systemlog` VALUES ('381', '1', '2017-12-27 15:05:21', '0:0:0:0:0:0:0:1', 'cn.wolfcode.crm.service.impl.EmployeeServiceImpl:selectAll', 'cn.wolfcode.crm.service.impl.EmployeeServiceImpl:selectAll');
INSERT INTO `systemlog` VALUES ('382', '1', '2017-12-27 15:05:21', '0:0:0:0:0:0:0:1', 'cn.wolfcode.crm.service.impl.EmployeeServiceImpl:selectAll', 'cn.wolfcode.crm.service.impl.EmployeeServiceImpl:selectAll');
INSERT INTO `systemlog` VALUES ('383', '1', '2017-12-27 15:05:21', '0:0:0:0:0:0:0:1', 'cn.wolfcode.crm.service.impl.DictionaryDetailServiceImpl:selectByParentSn', 'cn.wolfcode.crm.service.impl.DictionaryDetailServiceImpl:selectByParentSn');
INSERT INTO `systemlog` VALUES ('384', '1', '2017-12-27 15:05:21', '0:0:0:0:0:0:0:1', 'cn.wolfcode.crm.service.impl.DictionaryDetailServiceImpl:selectByParentSn', 'cn.wolfcode.crm.service.impl.DictionaryDetailServiceImpl:selectByParentSn');
INSERT INTO `systemlog` VALUES ('385', '1', '2017-12-27 15:05:21', '0:0:0:0:0:0:0:1', 'cn.wolfcode.crm.service.impl.DictionaryDetailServiceImpl:selectByParentSn', 'cn.wolfcode.crm.service.impl.DictionaryDetailServiceImpl:selectByParentSn');
INSERT INTO `systemlog` VALUES ('386', '1', '2017-12-27 15:05:30', '0:0:0:0:0:0:0:1', 'cn.wolfcode.crm.service.impl.DictionaryDetailServiceImpl:selectByParentSn', 'cn.wolfcode.crm.service.impl.DictionaryDetailServiceImpl:selectByParentSn');
INSERT INTO `systemlog` VALUES ('387', '1', '2017-12-27 15:05:30', '0:0:0:0:0:0:0:1', 'cn.wolfcode.crm.service.impl.DictionaryDetailServiceImpl:selectByParentSn', 'cn.wolfcode.crm.service.impl.DictionaryDetailServiceImpl:selectByParentSn');
INSERT INTO `systemlog` VALUES ('388', '1', '2017-12-27 15:05:30', '0:0:0:0:0:0:0:1', 'cn.wolfcode.crm.service.impl.DictionaryDetailServiceImpl:selectByParentSn', 'cn.wolfcode.crm.service.impl.DictionaryDetailServiceImpl:selectByParentSn');
INSERT INTO `systemlog` VALUES ('389', '1', '2017-12-27 15:05:31', '0:0:0:0:0:0:0:1', 'cn.wolfcode.crm.service.impl.EmployeeServiceImpl:selectAll', 'cn.wolfcode.crm.service.impl.EmployeeServiceImpl:selectAll');
INSERT INTO `systemlog` VALUES ('390', '1', '2017-12-27 15:05:31', '0:0:0:0:0:0:0:1', 'cn.wolfcode.crm.service.impl.EmployeeServiceImpl:selectAll', 'cn.wolfcode.crm.service.impl.EmployeeServiceImpl:selectAll');
INSERT INTO `systemlog` VALUES ('391', '1', '2017-12-27 15:05:31', '0:0:0:0:0:0:0:1', 'cn.wolfcode.crm.service.impl.DictionaryDetailServiceImpl:selectByParentSn', 'cn.wolfcode.crm.service.impl.DictionaryDetailServiceImpl:selectByParentSn');
INSERT INTO `systemlog` VALUES ('392', '1', '2017-12-27 15:05:32', '0:0:0:0:0:0:0:1', 'cn.wolfcode.crm.service.impl.DictionaryDetailServiceImpl:selectByParentSn', 'cn.wolfcode.crm.service.impl.DictionaryDetailServiceImpl:selectByParentSn');
INSERT INTO `systemlog` VALUES ('393', '1', '2017-12-27 15:05:32', '0:0:0:0:0:0:0:1', 'cn.wolfcode.crm.service.impl.DictionaryDetailServiceImpl:selectByParentSn', 'cn.wolfcode.crm.service.impl.DictionaryDetailServiceImpl:selectByParentSn');
INSERT INTO `systemlog` VALUES ('394', '1', '2017-12-27 15:05:52', '192.168.40.130', 'cn.wolfcode.crm.service.impl.ClientRecordServiceImpl:query', 'cn.wolfcode.crm.service.impl.ClientRecordServiceImpl:query');
INSERT INTO `systemlog` VALUES ('395', '1', '2017-12-27 15:05:52', '192.168.40.130', 'cn.wolfcode.crm.service.impl.DictionaryDetailServiceImpl:selectByParentSn', 'cn.wolfcode.crm.service.impl.DictionaryDetailServiceImpl:selectByParentSn');
INSERT INTO `systemlog` VALUES ('396', '1', '2017-12-27 15:05:52', '192.168.40.130', 'cn.wolfcode.crm.service.impl.DictionaryDetailServiceImpl:selectByParentSn', 'cn.wolfcode.crm.service.impl.DictionaryDetailServiceImpl:selectByParentSn');
INSERT INTO `systemlog` VALUES ('397', '1', '2017-12-27 15:05:54', '192.168.40.130', 'cn.wolfcode.crm.service.impl.DevelopAndLoseRecordServiceImpl:queryOff', 'cn.wolfcode.crm.service.impl.DevelopAndLoseRecordServiceImpl:queryOff');
INSERT INTO `systemlog` VALUES ('398', '1', '2017-12-27 15:05:54', '192.168.40.130', 'cn.wolfcode.crm.service.impl.DictionaryDetailServiceImpl:selectByParentSn', 'cn.wolfcode.crm.service.impl.DictionaryDetailServiceImpl:selectByParentSn');
INSERT INTO `systemlog` VALUES ('399', '1', '2017-12-27 15:05:54', '192.168.40.130', 'cn.wolfcode.crm.service.impl.ClientRecordServiceImpl:query', 'cn.wolfcode.crm.service.impl.ClientRecordServiceImpl:query');
INSERT INTO `systemlog` VALUES ('400', '1', '2017-12-27 15:05:54', '192.168.40.130', 'cn.wolfcode.crm.service.impl.DictionaryDetailServiceImpl:selectByParentSn', 'cn.wolfcode.crm.service.impl.DictionaryDetailServiceImpl:selectByParentSn');
INSERT INTO `systemlog` VALUES ('401', '1', '2017-12-27 15:05:40', '0:0:0:0:0:0:0:1', 'cn.wolfcode.crm.service.impl.CompanyServiceImpl:selectAll', 'cn.wolfcode.crm.service.impl.CompanyServiceImpl:selectAll');
INSERT INTO `systemlog` VALUES ('402', '1', '2017-12-27 15:05:47', '0:0:0:0:0:0:0:1', 'cn.wolfcode.crm.service.impl.ChangeRecordServiceImpl:query', 'cn.wolfcode.crm.service.impl.ChangeRecordServiceImpl:query');
INSERT INTO `systemlog` VALUES ('403', '1', '2017-12-27 15:05:48', '0:0:0:0:0:0:0:1', 'cn.wolfcode.crm.service.impl.DevelopAndLoseRecordServiceImpl:queryOff', 'cn.wolfcode.crm.service.impl.DevelopAndLoseRecordServiceImpl:queryOff');
INSERT INTO `systemlog` VALUES ('404', '1', '2017-12-27 15:05:48', '0:0:0:0:0:0:0:1', 'cn.wolfcode.crm.service.impl.DevelopAndLoseRecordServiceImpl:query', 'cn.wolfcode.crm.service.impl.DevelopAndLoseRecordServiceImpl:query');
INSERT INTO `systemlog` VALUES ('405', '1', '2017-12-27 15:05:49', '0:0:0:0:0:0:0:1', 'cn.wolfcode.crm.service.impl.DictionaryDetailServiceImpl:selectByParentSn', 'cn.wolfcode.crm.service.impl.DictionaryDetailServiceImpl:selectByParentSn');
INSERT INTO `systemlog` VALUES ('406', '1', '2017-12-27 15:05:49', '0:0:0:0:0:0:0:1', 'cn.wolfcode.crm.service.impl.DictionaryDetailServiceImpl:selectByParentSn', 'cn.wolfcode.crm.service.impl.DictionaryDetailServiceImpl:selectByParentSn');
INSERT INTO `systemlog` VALUES ('407', '1', '2017-12-27 15:05:49', '0:0:0:0:0:0:0:1', 'cn.wolfcode.crm.service.impl.DictionaryDetailServiceImpl:selectByParentSn', 'cn.wolfcode.crm.service.impl.DictionaryDetailServiceImpl:selectByParentSn');
INSERT INTO `systemlog` VALUES ('408', '1', '2017-12-27 15:05:51', '0:0:0:0:0:0:0:1', 'cn.wolfcode.crm.service.impl.EmployeeServiceImpl:selectAll', 'cn.wolfcode.crm.service.impl.EmployeeServiceImpl:selectAll');
INSERT INTO `systemlog` VALUES ('409', '1', '2017-12-27 15:05:51', '0:0:0:0:0:0:0:1', 'cn.wolfcode.crm.service.impl.EmployeeServiceImpl:selectAll', 'cn.wolfcode.crm.service.impl.EmployeeServiceImpl:selectAll');
INSERT INTO `systemlog` VALUES ('410', '1', '2017-12-27 15:05:51', '0:0:0:0:0:0:0:1', 'cn.wolfcode.crm.service.impl.DictionaryDetailServiceImpl:selectByParentSn', 'cn.wolfcode.crm.service.impl.DictionaryDetailServiceImpl:selectByParentSn');
INSERT INTO `systemlog` VALUES ('411', '1', '2017-12-27 15:05:51', '0:0:0:0:0:0:0:1', 'cn.wolfcode.crm.service.impl.DictionaryDetailServiceImpl:selectByParentSn', 'cn.wolfcode.crm.service.impl.DictionaryDetailServiceImpl:selectByParentSn');
INSERT INTO `systemlog` VALUES ('412', '1', '2017-12-27 15:05:51', '0:0:0:0:0:0:0:1', 'cn.wolfcode.crm.service.impl.DictionaryDetailServiceImpl:selectByParentSn', 'cn.wolfcode.crm.service.impl.DictionaryDetailServiceImpl:selectByParentSn');
INSERT INTO `systemlog` VALUES ('413', '1', '2017-12-27 15:06:06', '192.168.40.130', 'cn.wolfcode.crm.service.impl.ClaimsheetServiceImpl:query', 'cn.wolfcode.crm.service.impl.ClaimsheetServiceImpl:query');
INSERT INTO `systemlog` VALUES ('414', '1', '2017-12-27 15:06:06', '192.168.40.130', 'cn.wolfcode.crm.service.impl.EmployeeServiceImpl:selectAll', 'cn.wolfcode.crm.service.impl.EmployeeServiceImpl:selectAll');
INSERT INTO `systemlog` VALUES ('415', '1', '2017-12-27 15:06:08', '192.168.40.130', 'cn.wolfcode.crm.service.impl.ClaimsheetServiceImpl:query', 'cn.wolfcode.crm.service.impl.ClaimsheetServiceImpl:query');
INSERT INTO `systemlog` VALUES ('416', '1', '2017-12-27 15:06:08', '192.168.40.130', 'cn.wolfcode.crm.service.impl.EmployeeServiceImpl:selectAll', 'cn.wolfcode.crm.service.impl.EmployeeServiceImpl:selectAll');
INSERT INTO `systemlog` VALUES ('417', '1', '2017-12-27 15:05:54', '0:0:0:0:0:0:0:1', 'cn.wolfcode.crm.service.impl.ProductServiceImpl:query', 'cn.wolfcode.crm.service.impl.ProductServiceImpl:query');
INSERT INTO `systemlog` VALUES ('418', '1', '2017-12-27 15:05:54', '0:0:0:0:0:0:0:1', 'cn.wolfcode.crm.service.impl.CompanyServiceImpl:selectAll', 'cn.wolfcode.crm.service.impl.CompanyServiceImpl:selectAll');
INSERT INTO `systemlog` VALUES ('419', '1', '2017-12-27 15:05:54', '0:0:0:0:0:0:0:1', 'cn.wolfcode.crm.service.impl.EmployeeServiceImpl:selectAll', 'cn.wolfcode.crm.service.impl.EmployeeServiceImpl:selectAll');
INSERT INTO `systemlog` VALUES ('420', '1', '2017-12-27 15:05:54', '0:0:0:0:0:0:0:1', 'cn.wolfcode.crm.service.impl.DictionaryDetailServiceImpl:selectByParentSn', 'cn.wolfcode.crm.service.impl.DictionaryDetailServiceImpl:selectByParentSn');
INSERT INTO `systemlog` VALUES ('421', '1', '2017-12-27 15:05:54', '0:0:0:0:0:0:0:1', 'cn.wolfcode.crm.service.impl.DictionaryDetailServiceImpl:selectByParentSn', 'cn.wolfcode.crm.service.impl.DictionaryDetailServiceImpl:selectByParentSn');
INSERT INTO `systemlog` VALUES ('422', '1', '2017-12-27 15:06:10', '192.168.40.130', 'cn.wolfcode.crm.service.impl.ClaimsheetServiceImpl:query', 'cn.wolfcode.crm.service.impl.ClaimsheetServiceImpl:query');
INSERT INTO `systemlog` VALUES ('423', '1', '2017-12-27 15:06:10', '192.168.40.130', 'cn.wolfcode.crm.service.impl.EmployeeServiceImpl:selectAll', 'cn.wolfcode.crm.service.impl.EmployeeServiceImpl:selectAll');
INSERT INTO `systemlog` VALUES ('424', '1', '2017-12-27 15:06:10', '192.168.40.130', 'cn.wolfcode.crm.service.impl.ClaimsheetServiceImpl:query', 'cn.wolfcode.crm.service.impl.ClaimsheetServiceImpl:query');
INSERT INTO `systemlog` VALUES ('425', '1', '2017-12-27 15:06:10', '192.168.40.130', 'cn.wolfcode.crm.service.impl.EmployeeServiceImpl:selectAll', 'cn.wolfcode.crm.service.impl.EmployeeServiceImpl:selectAll');
INSERT INTO `systemlog` VALUES ('426', '1', '2017-12-27 15:06:11', '192.168.40.130', 'cn.wolfcode.crm.service.impl.ClaimsheetServiceImpl:query', 'cn.wolfcode.crm.service.impl.ClaimsheetServiceImpl:query');
INSERT INTO `systemlog` VALUES ('427', '1', '2017-12-27 15:06:11', '192.168.40.130', 'cn.wolfcode.crm.service.impl.EmployeeServiceImpl:selectAll', 'cn.wolfcode.crm.service.impl.EmployeeServiceImpl:selectAll');
INSERT INTO `systemlog` VALUES ('428', '1', '2017-12-27 15:06:13', '192.168.40.130', 'cn.wolfcode.crm.service.impl.ClaimsheetServiceImpl:query', 'cn.wolfcode.crm.service.impl.ClaimsheetServiceImpl:query');
INSERT INTO `systemlog` VALUES ('429', '1', '2017-12-27 15:06:13', '192.168.40.130', 'cn.wolfcode.crm.service.impl.EmployeeServiceImpl:selectAll', 'cn.wolfcode.crm.service.impl.EmployeeServiceImpl:selectAll');
INSERT INTO `systemlog` VALUES ('430', '1', '2017-12-27 15:06:21', '192.168.40.130', 'cn.wolfcode.crm.service.impl.ClaimsheetServiceImpl:query', 'cn.wolfcode.crm.service.impl.ClaimsheetServiceImpl:query');
INSERT INTO `systemlog` VALUES ('431', '1', '2017-12-27 15:06:21', '192.168.40.130', 'cn.wolfcode.crm.service.impl.EmployeeServiceImpl:selectAll', 'cn.wolfcode.crm.service.impl.EmployeeServiceImpl:selectAll');
INSERT INTO `systemlog` VALUES ('432', '1', '2017-12-27 15:06:23', '192.168.40.130', 'cn.wolfcode.crm.service.impl.ClaimsheetServiceImpl:query', 'cn.wolfcode.crm.service.impl.ClaimsheetServiceImpl:query');
INSERT INTO `systemlog` VALUES ('433', '1', '2017-12-27 15:06:23', '192.168.40.130', 'cn.wolfcode.crm.service.impl.EmployeeServiceImpl:selectAll', 'cn.wolfcode.crm.service.impl.EmployeeServiceImpl:selectAll');
INSERT INTO `systemlog` VALUES ('434', '1', '2017-12-27 15:06:23', '192.168.40.130', 'cn.wolfcode.crm.service.impl.ClaimsheetServiceImpl:query', 'cn.wolfcode.crm.service.impl.ClaimsheetServiceImpl:query');
INSERT INTO `systemlog` VALUES ('435', '1', '2017-12-27 15:06:23', '192.168.40.130', 'cn.wolfcode.crm.service.impl.EmployeeServiceImpl:selectAll', 'cn.wolfcode.crm.service.impl.EmployeeServiceImpl:selectAll');
INSERT INTO `systemlog` VALUES ('436', '1', '2017-12-27 15:06:20', '0:0:0:0:0:0:0:1', 'cn.wolfcode.crm.service.impl.EmployeeServiceImpl:selectAll', 'cn.wolfcode.crm.service.impl.EmployeeServiceImpl:selectAll');
INSERT INTO `systemlog` VALUES ('437', '1', '2017-12-27 15:06:20', '0:0:0:0:0:0:0:1', 'cn.wolfcode.crm.service.impl.DictionaryDetailServiceImpl:selectByParentSn', 'cn.wolfcode.crm.service.impl.DictionaryDetailServiceImpl:selectByParentSn');
INSERT INTO `systemlog` VALUES ('438', '1', '2017-12-27 15:06:20', '0:0:0:0:0:0:0:1', 'cn.wolfcode.crm.service.impl.EmployeeServiceImpl:selectAll', 'cn.wolfcode.crm.service.impl.EmployeeServiceImpl:selectAll');
INSERT INTO `systemlog` VALUES ('439', '1', '2017-12-27 15:06:20', '0:0:0:0:0:0:0:1', 'cn.wolfcode.crm.service.impl.DictionaryDetailServiceImpl:selectByParentSn', 'cn.wolfcode.crm.service.impl.DictionaryDetailServiceImpl:selectByParentSn');
INSERT INTO `systemlog` VALUES ('440', '1', '2017-12-27 15:06:20', '0:0:0:0:0:0:0:1', 'cn.wolfcode.crm.service.impl.DictionaryDetailServiceImpl:selectByParentSn', 'cn.wolfcode.crm.service.impl.DictionaryDetailServiceImpl:selectByParentSn');
INSERT INTO `systemlog` VALUES ('441', '1', '2017-12-27 15:06:21', '0:0:0:0:0:0:0:1', 'cn.wolfcode.crm.service.impl.DictionaryDetailServiceImpl:selectByParentSn', 'cn.wolfcode.crm.service.impl.DictionaryDetailServiceImpl:selectByParentSn');
INSERT INTO `systemlog` VALUES ('442', '1', '2017-12-27 15:06:21', '0:0:0:0:0:0:0:1', 'cn.wolfcode.crm.service.impl.DictionaryDetailServiceImpl:selectByParentSn', 'cn.wolfcode.crm.service.impl.DictionaryDetailServiceImpl:selectByParentSn');
INSERT INTO `systemlog` VALUES ('443', '1', '2017-12-27 15:06:21', '0:0:0:0:0:0:0:1', 'cn.wolfcode.crm.service.impl.DictionaryDetailServiceImpl:selectByParentSn', 'cn.wolfcode.crm.service.impl.DictionaryDetailServiceImpl:selectByParentSn');
INSERT INTO `systemlog` VALUES ('444', '1', '2017-12-27 15:06:40', '192.168.40.130', 'cn.wolfcode.crm.service.impl.ClaimsheetServiceImpl:insert', 'cn.wolfcode.crm.service.impl.ClaimsheetServiceImpl:insert');
INSERT INTO `systemlog` VALUES ('445', '1', '2017-12-27 15:06:41', '192.168.40.130', 'cn.wolfcode.crm.service.impl.ClaimsheetServiceImpl:query', 'cn.wolfcode.crm.service.impl.ClaimsheetServiceImpl:query');
INSERT INTO `systemlog` VALUES ('446', '1', '2017-12-27 15:06:46', '192.168.40.130', 'cn.wolfcode.crm.service.impl.ClaimsheetServiceImpl:changeStatus', 'cn.wolfcode.crm.service.impl.ClaimsheetServiceImpl:changeStatus');
INSERT INTO `systemlog` VALUES ('447', '1', '2017-12-27 15:06:46', '192.168.40.130', 'cn.wolfcode.crm.service.impl.ClaimsheetServiceImpl:query', 'cn.wolfcode.crm.service.impl.ClaimsheetServiceImpl:query');
INSERT INTO `systemlog` VALUES ('448', '1', '2017-12-27 15:06:50', '192.168.40.130', 'cn.wolfcode.crm.service.impl.ClaimsheetServiceImpl:query', 'cn.wolfcode.crm.service.impl.ClaimsheetServiceImpl:query');
INSERT INTO `systemlog` VALUES ('449', '1', '2017-12-27 15:06:50', '192.168.40.130', 'cn.wolfcode.crm.service.impl.EmployeeServiceImpl:selectAll', 'cn.wolfcode.crm.service.impl.EmployeeServiceImpl:selectAll');
INSERT INTO `systemlog` VALUES ('450', '1', '2017-12-27 15:06:58', '192.168.40.130', 'cn.wolfcode.crm.service.impl.ClaimsheetServiceImpl:query', 'cn.wolfcode.crm.service.impl.ClaimsheetServiceImpl:query');
INSERT INTO `systemlog` VALUES ('451', '1', '2017-12-27 15:06:58', '192.168.40.130', 'cn.wolfcode.crm.service.impl.EmployeeServiceImpl:selectAll', 'cn.wolfcode.crm.service.impl.EmployeeServiceImpl:selectAll');
INSERT INTO `systemlog` VALUES ('452', '1', '2017-12-27 15:06:59', '192.168.40.130', 'cn.wolfcode.crm.service.impl.ClaimsheetServiceImpl:query', 'cn.wolfcode.crm.service.impl.ClaimsheetServiceImpl:query');
INSERT INTO `systemlog` VALUES ('453', '1', '2017-12-27 15:06:59', '192.168.40.130', 'cn.wolfcode.crm.service.impl.EmployeeServiceImpl:selectAll', 'cn.wolfcode.crm.service.impl.EmployeeServiceImpl:selectAll');
INSERT INTO `systemlog` VALUES ('454', '1', '2017-12-27 15:06:59', '192.168.40.130', 'cn.wolfcode.crm.service.impl.ClaimsheetServiceImpl:query', 'cn.wolfcode.crm.service.impl.ClaimsheetServiceImpl:query');
INSERT INTO `systemlog` VALUES ('455', '1', '2017-12-27 15:06:59', '192.168.40.130', 'cn.wolfcode.crm.service.impl.EmployeeServiceImpl:selectAll', 'cn.wolfcode.crm.service.impl.EmployeeServiceImpl:selectAll');
INSERT INTO `systemlog` VALUES ('456', '1', '2017-12-27 15:07:00', '192.168.40.130', 'cn.wolfcode.crm.service.impl.ClaimsheetServiceImpl:query', 'cn.wolfcode.crm.service.impl.ClaimsheetServiceImpl:query');
INSERT INTO `systemlog` VALUES ('457', '1', '2017-12-27 15:07:00', '192.168.40.130', 'cn.wolfcode.crm.service.impl.EmployeeServiceImpl:selectAll', 'cn.wolfcode.crm.service.impl.EmployeeServiceImpl:selectAll');
INSERT INTO `systemlog` VALUES ('458', '1', '2017-12-27 15:07:01', '192.168.40.130', 'cn.wolfcode.crm.service.impl.ClaimsheetServiceImpl:query', 'cn.wolfcode.crm.service.impl.ClaimsheetServiceImpl:query');
INSERT INTO `systemlog` VALUES ('459', '1', '2017-12-27 15:07:01', '192.168.40.130', 'cn.wolfcode.crm.service.impl.EmployeeServiceImpl:selectAll', 'cn.wolfcode.crm.service.impl.EmployeeServiceImpl:selectAll');
INSERT INTO `systemlog` VALUES ('460', '1', '2017-12-27 15:07:01', '192.168.40.130', 'cn.wolfcode.crm.service.impl.ClaimsheetServiceImpl:query', 'cn.wolfcode.crm.service.impl.ClaimsheetServiceImpl:query');
INSERT INTO `systemlog` VALUES ('461', '1', '2017-12-27 15:07:01', '192.168.40.130', 'cn.wolfcode.crm.service.impl.EmployeeServiceImpl:selectAll', 'cn.wolfcode.crm.service.impl.EmployeeServiceImpl:selectAll');
INSERT INTO `systemlog` VALUES ('462', '1', '2017-12-27 15:07:05', '192.168.40.130', 'cn.wolfcode.crm.service.impl.ClaimsheetServiceImpl:changeStatus1', 'cn.wolfcode.crm.service.impl.ClaimsheetServiceImpl:changeStatus1');
INSERT INTO `systemlog` VALUES ('463', '1', '2017-12-27 15:07:05', '192.168.40.130', 'cn.wolfcode.crm.service.impl.ClaimsheetServiceImpl:query', 'cn.wolfcode.crm.service.impl.ClaimsheetServiceImpl:query');
INSERT INTO `systemlog` VALUES ('464', '1', '2017-12-27 15:07:07', '192.168.40.130', 'cn.wolfcode.crm.service.impl.ClaimsheetServiceImpl:query', 'cn.wolfcode.crm.service.impl.ClaimsheetServiceImpl:query');
INSERT INTO `systemlog` VALUES ('465', '1', '2017-12-27 15:07:07', '192.168.40.130', 'cn.wolfcode.crm.service.impl.EmployeeServiceImpl:selectAll', 'cn.wolfcode.crm.service.impl.EmployeeServiceImpl:selectAll');
INSERT INTO `systemlog` VALUES ('466', '1', '2017-12-27 15:07:08', '192.168.40.130', 'cn.wolfcode.crm.service.impl.ClaimsheetServiceImpl:query', 'cn.wolfcode.crm.service.impl.ClaimsheetServiceImpl:query');
INSERT INTO `systemlog` VALUES ('467', '1', '2017-12-27 15:07:10', '192.168.40.130', 'cn.wolfcode.crm.service.impl.ClaimsheetServiceImpl:query', 'cn.wolfcode.crm.service.impl.ClaimsheetServiceImpl:query');
INSERT INTO `systemlog` VALUES ('468', '1', '2017-12-27 15:07:10', '192.168.40.130', 'cn.wolfcode.crm.service.impl.EmployeeServiceImpl:selectAll', 'cn.wolfcode.crm.service.impl.EmployeeServiceImpl:selectAll');
INSERT INTO `systemlog` VALUES ('469', '1', '2017-12-27 15:07:11', '192.168.40.130', 'cn.wolfcode.crm.service.impl.ClaimsheetServiceImpl:query', 'cn.wolfcode.crm.service.impl.ClaimsheetServiceImpl:query');
INSERT INTO `systemlog` VALUES ('470', '1', '2017-12-27 15:07:11', '192.168.40.130', 'cn.wolfcode.crm.service.impl.EmployeeServiceImpl:selectAll', 'cn.wolfcode.crm.service.impl.EmployeeServiceImpl:selectAll');
INSERT INTO `systemlog` VALUES ('471', '1', '2017-12-27 15:07:14', '192.168.40.130', 'cn.wolfcode.crm.service.impl.ClaimsheetServiceImpl:query', 'cn.wolfcode.crm.service.impl.ClaimsheetServiceImpl:query');
INSERT INTO `systemlog` VALUES ('472', '1', '2017-12-27 15:07:14', '192.168.40.130', 'cn.wolfcode.crm.service.impl.EmployeeServiceImpl:selectAll', 'cn.wolfcode.crm.service.impl.EmployeeServiceImpl:selectAll');
INSERT INTO `systemlog` VALUES ('473', '1', '2017-12-27 15:07:19', '192.168.40.130', 'cn.wolfcode.crm.service.impl.ProductServiceImpl:query', 'cn.wolfcode.crm.service.impl.ProductServiceImpl:query');
INSERT INTO `systemlog` VALUES ('474', '1', '2017-12-27 15:07:19', '192.168.40.130', 'cn.wolfcode.crm.service.impl.CompanyServiceImpl:selectAll', 'cn.wolfcode.crm.service.impl.CompanyServiceImpl:selectAll');
INSERT INTO `systemlog` VALUES ('475', '1', '2017-12-27 15:07:20', '192.168.40.130', 'cn.wolfcode.crm.service.impl.CompanyServiceImpl:query', 'cn.wolfcode.crm.service.impl.CompanyServiceImpl:query');
INSERT INTO `systemlog` VALUES ('476', '1', '2017-12-27 15:07:24', '192.168.40.130', 'cn.wolfcode.crm.service.impl.CarServiceImpl:query', 'cn.wolfcode.crm.service.impl.CarServiceImpl:query');
INSERT INTO `systemlog` VALUES ('477', '1', '2017-12-27 15:07:24', '192.168.40.130', 'cn.wolfcode.crm.service.impl.DictionaryDetailServiceImpl:selectByParentSn', 'cn.wolfcode.crm.service.impl.DictionaryDetailServiceImpl:selectByParentSn');
INSERT INTO `systemlog` VALUES ('478', '1', '2017-12-27 15:07:32', '192.168.40.130', 'cn.wolfcode.crm.service.impl.ClientReportServiceImpl:formalClient', 'cn.wolfcode.crm.service.impl.ClientReportServiceImpl:formalClient');
INSERT INTO `systemlog` VALUES ('479', '1', '2017-12-27 15:07:32', '192.168.40.130', 'cn.wolfcode.crm.service.impl.DictionaryDetailServiceImpl:selectByParentSn', 'cn.wolfcode.crm.service.impl.DictionaryDetailServiceImpl:selectByParentSn');
INSERT INTO `systemlog` VALUES ('480', '1', '2017-12-27 15:07:36', '192.168.40.130', 'cn.wolfcode.crm.service.impl.FormsServiceImpl:saleChart', 'cn.wolfcode.crm.service.impl.FormsServiceImpl:saleChart');
INSERT INTO `systemlog` VALUES ('481', '1', '2017-12-27 15:07:38', '192.168.40.130', 'cn.wolfcode.crm.service.impl.FormsServiceImpl:saleChart', 'cn.wolfcode.crm.service.impl.FormsServiceImpl:saleChart');
INSERT INTO `systemlog` VALUES ('482', '1', '2017-12-27 15:07:41', '192.168.40.130', 'cn.wolfcode.crm.service.impl.FormsServiceImpl:saleChart', 'cn.wolfcode.crm.service.impl.FormsServiceImpl:saleChart');
INSERT INTO `systemlog` VALUES ('483', '1', '2017-12-27 15:07:29', '0:0:0:0:0:0:0:1', 'cn.wolfcode.crm.service.impl.EmployeeServiceImpl:selectAll', 'cn.wolfcode.crm.service.impl.EmployeeServiceImpl:selectAll');
INSERT INTO `systemlog` VALUES ('484', '1', '2017-12-27 15:07:29', '0:0:0:0:0:0:0:1', 'cn.wolfcode.crm.service.impl.EmployeeServiceImpl:selectAll', 'cn.wolfcode.crm.service.impl.EmployeeServiceImpl:selectAll');
INSERT INTO `systemlog` VALUES ('485', '1', '2017-12-27 15:07:29', '0:0:0:0:0:0:0:1', 'cn.wolfcode.crm.service.impl.DictionaryDetailServiceImpl:selectByParentSn', 'cn.wolfcode.crm.service.impl.DictionaryDetailServiceImpl:selectByParentSn');
INSERT INTO `systemlog` VALUES ('486', '1', '2017-12-27 15:07:29', '0:0:0:0:0:0:0:1', 'cn.wolfcode.crm.service.impl.DictionaryDetailServiceImpl:selectByParentSn', 'cn.wolfcode.crm.service.impl.DictionaryDetailServiceImpl:selectByParentSn');
INSERT INTO `systemlog` VALUES ('487', '1', '2017-12-27 15:07:29', '0:0:0:0:0:0:0:1', 'cn.wolfcode.crm.service.impl.DictionaryDetailServiceImpl:selectByParentSn', 'cn.wolfcode.crm.service.impl.DictionaryDetailServiceImpl:selectByParentSn');
INSERT INTO `systemlog` VALUES ('488', '1', '2017-12-27 15:08:01', '192.168.40.130', 'cn.wolfcode.crm.service.impl.ClaimsheetServiceImpl:query', 'cn.wolfcode.crm.service.impl.ClaimsheetServiceImpl:query');
INSERT INTO `systemlog` VALUES ('489', '1', '2017-12-27 15:08:01', '192.168.40.130', 'cn.wolfcode.crm.service.impl.EmployeeServiceImpl:selectAll', 'cn.wolfcode.crm.service.impl.EmployeeServiceImpl:selectAll');
INSERT INTO `systemlog` VALUES ('490', '1', '2017-12-27 15:08:06', '192.168.40.130', 'cn.wolfcode.crm.service.impl.CompanyServiceImpl:selectAll', 'cn.wolfcode.crm.service.impl.CompanyServiceImpl:selectAll');
INSERT INTO `systemlog` VALUES ('491', '1', '2017-12-27 15:08:06', '192.168.40.130', 'cn.wolfcode.crm.service.impl.ProductServiceImpl:query', 'cn.wolfcode.crm.service.impl.ProductServiceImpl:query');
INSERT INTO `systemlog` VALUES ('492', '1', '2017-12-27 15:08:06', '192.168.40.130', 'cn.wolfcode.crm.service.impl.EmployeeServiceImpl:selectAll', 'cn.wolfcode.crm.service.impl.EmployeeServiceImpl:selectAll');
INSERT INTO `systemlog` VALUES ('493', '1', '2017-12-27 15:08:06', '192.168.40.130', 'cn.wolfcode.crm.service.impl.CompanyServiceImpl:selectAll', 'cn.wolfcode.crm.service.impl.CompanyServiceImpl:selectAll');
INSERT INTO `systemlog` VALUES ('494', '1', '2017-12-27 15:08:06', '192.168.40.130', 'cn.wolfcode.crm.service.impl.DictionaryDetailServiceImpl:selectByParentSn', 'cn.wolfcode.crm.service.impl.DictionaryDetailServiceImpl:selectByParentSn');
INSERT INTO `systemlog` VALUES ('495', '1', '2017-12-27 15:08:06', '192.168.40.130', 'cn.wolfcode.crm.service.impl.DictionaryDetailServiceImpl:selectByParentSn', 'cn.wolfcode.crm.service.impl.DictionaryDetailServiceImpl:selectByParentSn');
INSERT INTO `systemlog` VALUES ('496', '1', '2017-12-27 15:08:08', '192.168.40.130', 'cn.wolfcode.crm.service.impl.CompanyServiceImpl:selectAll', 'cn.wolfcode.crm.service.impl.CompanyServiceImpl:selectAll');
INSERT INTO `systemlog` VALUES ('497', '1', '2017-12-27 15:08:18', '192.168.40.130', 'cn.wolfcode.crm.service.impl.GuaranteeServiceImpl:query', 'cn.wolfcode.crm.service.impl.GuaranteeServiceImpl:query');
INSERT INTO `systemlog` VALUES ('498', '1', '2017-12-27 15:08:05', '0:0:0:0:0:0:0:1', 'cn.wolfcode.crm.service.impl.EmployeeServiceImpl:selectAll', 'cn.wolfcode.crm.service.impl.EmployeeServiceImpl:selectAll');
INSERT INTO `systemlog` VALUES ('499', '1', '2017-12-27 15:08:05', '0:0:0:0:0:0:0:1', 'cn.wolfcode.crm.service.impl.EmployeeServiceImpl:selectAll', 'cn.wolfcode.crm.service.impl.EmployeeServiceImpl:selectAll');
INSERT INTO `systemlog` VALUES ('500', '1', '2017-12-27 15:08:05', '0:0:0:0:0:0:0:1', 'cn.wolfcode.crm.service.impl.DictionaryDetailServiceImpl:selectByParentSn', 'cn.wolfcode.crm.service.impl.DictionaryDetailServiceImpl:selectByParentSn');
INSERT INTO `systemlog` VALUES ('501', '1', '2017-12-27 15:08:05', '0:0:0:0:0:0:0:1', 'cn.wolfcode.crm.service.impl.DictionaryDetailServiceImpl:selectByParentSn', 'cn.wolfcode.crm.service.impl.DictionaryDetailServiceImpl:selectByParentSn');
INSERT INTO `systemlog` VALUES ('502', '1', '2017-12-27 15:08:05', '0:0:0:0:0:0:0:1', 'cn.wolfcode.crm.service.impl.DictionaryDetailServiceImpl:selectByParentSn', 'cn.wolfcode.crm.service.impl.DictionaryDetailServiceImpl:selectByParentSn');
INSERT INTO `systemlog` VALUES ('503', '1', '2017-12-27 15:08:23', '192.168.40.130', 'cn.wolfcode.crm.service.impl.GuaranteeServiceImpl:query', 'cn.wolfcode.crm.service.impl.GuaranteeServiceImpl:query');
INSERT INTO `systemlog` VALUES ('504', '1', '2017-12-27 15:08:34', '192.168.40.130', 'cn.wolfcode.crm.service.impl.GuaranteeServiceImpl:query', 'cn.wolfcode.crm.service.impl.GuaranteeServiceImpl:query');
INSERT INTO `systemlog` VALUES ('505', '1', '2017-12-27 15:08:54', '0:0:0:0:0:0:0:1', 'cn.wolfcode.crm.service.impl.MenuServiceImpl:selectByParentIdAndEmployeeId', 'cn.wolfcode.crm.service.impl.MenuServiceImpl:selectByParentIdAndEmployeeId');
INSERT INTO `systemlog` VALUES ('506', '1', '2017-12-27 15:08:55', '0:0:0:0:0:0:0:1', 'cn.wolfcode.crm.service.impl.MenuServiceImpl:selectByParentIdAndEmployeeId', 'cn.wolfcode.crm.service.impl.MenuServiceImpl:selectByParentIdAndEmployeeId');
INSERT INTO `systemlog` VALUES ('507', '1', '2017-12-27 15:08:55', '0:0:0:0:0:0:0:1', 'cn.wolfcode.crm.service.impl.MenuServiceImpl:selectByParentIdAndEmployeeId', 'cn.wolfcode.crm.service.impl.MenuServiceImpl:selectByParentIdAndEmployeeId');
INSERT INTO `systemlog` VALUES ('508', '1', '2017-12-27 15:08:55', '0:0:0:0:0:0:0:1', 'cn.wolfcode.crm.service.impl.MenuServiceImpl:selectByParentIdAndEmployeeId', 'cn.wolfcode.crm.service.impl.MenuServiceImpl:selectByParentIdAndEmployeeId');
INSERT INTO `systemlog` VALUES ('509', '1', '2017-12-27 15:08:55', '0:0:0:0:0:0:0:1', 'cn.wolfcode.crm.service.impl.MenuServiceImpl:selectByParentIdAndEmployeeId', 'cn.wolfcode.crm.service.impl.MenuServiceImpl:selectByParentIdAndEmployeeId');
INSERT INTO `systemlog` VALUES ('510', '1', '2017-12-27 15:08:55', '0:0:0:0:0:0:0:1', 'cn.wolfcode.crm.service.impl.MenuServiceImpl:selectByParentIdAndEmployeeId', 'cn.wolfcode.crm.service.impl.MenuServiceImpl:selectByParentIdAndEmployeeId');
INSERT INTO `systemlog` VALUES ('511', '1', '2017-12-27 15:08:59', '0:0:0:0:0:0:0:1', 'cn.wolfcode.crm.service.impl.EmployeeServiceImpl:selectAll', 'cn.wolfcode.crm.service.impl.EmployeeServiceImpl:selectAll');
INSERT INTO `systemlog` VALUES ('512', '1', '2017-12-27 15:08:59', '0:0:0:0:0:0:0:1', 'cn.wolfcode.crm.service.impl.EmployeeServiceImpl:selectAll', 'cn.wolfcode.crm.service.impl.EmployeeServiceImpl:selectAll');
INSERT INTO `systemlog` VALUES ('513', '1', '2017-12-27 15:08:59', '0:0:0:0:0:0:0:1', 'cn.wolfcode.crm.service.impl.DictionaryDetailServiceImpl:selectByParentSn', 'cn.wolfcode.crm.service.impl.DictionaryDetailServiceImpl:selectByParentSn');
INSERT INTO `systemlog` VALUES ('514', '1', '2017-12-27 15:08:59', '0:0:0:0:0:0:0:1', 'cn.wolfcode.crm.service.impl.DictionaryDetailServiceImpl:selectByParentSn', 'cn.wolfcode.crm.service.impl.DictionaryDetailServiceImpl:selectByParentSn');
INSERT INTO `systemlog` VALUES ('515', '1', '2017-12-27 15:08:59', '0:0:0:0:0:0:0:1', 'cn.wolfcode.crm.service.impl.DictionaryDetailServiceImpl:selectByParentSn', 'cn.wolfcode.crm.service.impl.DictionaryDetailServiceImpl:selectByParentSn');
INSERT INTO `systemlog` VALUES ('516', '1', '2017-12-27 15:09:05', '0:0:0:0:0:0:0:1', 'cn.wolfcode.crm.service.impl.EmployeeServiceImpl:selectAll', 'cn.wolfcode.crm.service.impl.EmployeeServiceImpl:selectAll');
INSERT INTO `systemlog` VALUES ('517', '1', '2017-12-27 15:09:05', '0:0:0:0:0:0:0:1', 'cn.wolfcode.crm.service.impl.EmployeeServiceImpl:selectAll', 'cn.wolfcode.crm.service.impl.EmployeeServiceImpl:selectAll');
INSERT INTO `systemlog` VALUES ('518', '1', '2017-12-27 15:09:05', '0:0:0:0:0:0:0:1', 'cn.wolfcode.crm.service.impl.DictionaryDetailServiceImpl:selectByParentSn', 'cn.wolfcode.crm.service.impl.DictionaryDetailServiceImpl:selectByParentSn');
INSERT INTO `systemlog` VALUES ('519', '1', '2017-12-27 15:09:05', '0:0:0:0:0:0:0:1', 'cn.wolfcode.crm.service.impl.DictionaryDetailServiceImpl:selectByParentSn', 'cn.wolfcode.crm.service.impl.DictionaryDetailServiceImpl:selectByParentSn');
INSERT INTO `systemlog` VALUES ('520', '1', '2017-12-27 15:09:05', '0:0:0:0:0:0:0:1', 'cn.wolfcode.crm.service.impl.DictionaryDetailServiceImpl:selectByParentSn', 'cn.wolfcode.crm.service.impl.DictionaryDetailServiceImpl:selectByParentSn');
INSERT INTO `systemlog` VALUES ('521', '1', '2017-12-27 15:09:22', '0:0:0:0:0:0:0:1', 'cn.wolfcode.crm.service.impl.DictionaryDetailServiceImpl:selectByParentSn', 'cn.wolfcode.crm.service.impl.DictionaryDetailServiceImpl:selectByParentSn');
INSERT INTO `systemlog` VALUES ('522', '1', '2017-12-27 15:09:22', '0:0:0:0:0:0:0:1', 'cn.wolfcode.crm.service.impl.DictionaryDetailServiceImpl:selectByParentSn', 'cn.wolfcode.crm.service.impl.DictionaryDetailServiceImpl:selectByParentSn');
INSERT INTO `systemlog` VALUES ('523', '1', '2017-12-27 15:09:22', '0:0:0:0:0:0:0:1', 'cn.wolfcode.crm.service.impl.DictionaryDetailServiceImpl:selectByParentSn', 'cn.wolfcode.crm.service.impl.DictionaryDetailServiceImpl:selectByParentSn');
INSERT INTO `systemlog` VALUES ('524', '1', '2017-12-27 15:09:27', '0:0:0:0:0:0:0:1', 'cn.wolfcode.crm.service.impl.DevelopAndLoseRecordServiceImpl:query', 'cn.wolfcode.crm.service.impl.DevelopAndLoseRecordServiceImpl:query');
INSERT INTO `systemlog` VALUES ('525', '1', '2017-12-27 15:09:35', '0:0:0:0:0:0:0:1', 'cn.wolfcode.crm.service.impl.EmployeeServiceImpl:selectAll', 'cn.wolfcode.crm.service.impl.EmployeeServiceImpl:selectAll');
INSERT INTO `systemlog` VALUES ('526', '1', '2017-12-27 15:09:35', '0:0:0:0:0:0:0:1', 'cn.wolfcode.crm.service.impl.EmployeeServiceImpl:selectAll', 'cn.wolfcode.crm.service.impl.EmployeeServiceImpl:selectAll');
INSERT INTO `systemlog` VALUES ('527', '1', '2017-12-27 15:09:35', '0:0:0:0:0:0:0:1', 'cn.wolfcode.crm.service.impl.DictionaryDetailServiceImpl:selectByParentSn', 'cn.wolfcode.crm.service.impl.DictionaryDetailServiceImpl:selectByParentSn');
INSERT INTO `systemlog` VALUES ('528', '1', '2017-12-27 15:09:35', '0:0:0:0:0:0:0:1', 'cn.wolfcode.crm.service.impl.DictionaryDetailServiceImpl:selectByParentSn', 'cn.wolfcode.crm.service.impl.DictionaryDetailServiceImpl:selectByParentSn');
INSERT INTO `systemlog` VALUES ('529', '1', '2017-12-27 15:09:35', '0:0:0:0:0:0:0:1', 'cn.wolfcode.crm.service.impl.DictionaryDetailServiceImpl:selectByParentSn', 'cn.wolfcode.crm.service.impl.DictionaryDetailServiceImpl:selectByParentSn');
INSERT INTO `systemlog` VALUES ('530', null, '2017-12-27 15:10:00', '0:0:0:0:0:0:0:1', 'cn.wolfcode.crm.service.impl.EmployeeServiceImpl:selectByUsername', 'cn.wolfcode.crm.service.impl.EmployeeServiceImpl:selectByUsername');
INSERT INTO `systemlog` VALUES ('531', '1', '2017-12-27 15:10:00', '0:0:0:0:0:0:0:1', 'cn.wolfcode.crm.service.impl.MenuServiceImpl:selectByParentIdAndEmployeeId', 'cn.wolfcode.crm.service.impl.MenuServiceImpl:selectByParentIdAndEmployeeId');
INSERT INTO `systemlog` VALUES ('532', '1', '2017-12-27 15:10:00', '0:0:0:0:0:0:0:1', 'cn.wolfcode.crm.service.impl.MenuServiceImpl:selectByParentIdAndEmployeeId', 'cn.wolfcode.crm.service.impl.MenuServiceImpl:selectByParentIdAndEmployeeId');
INSERT INTO `systemlog` VALUES ('533', '1', '2017-12-27 15:10:00', '0:0:0:0:0:0:0:1', 'cn.wolfcode.crm.service.impl.MenuServiceImpl:selectByParentIdAndEmployeeId', 'cn.wolfcode.crm.service.impl.MenuServiceImpl:selectByParentIdAndEmployeeId');
INSERT INTO `systemlog` VALUES ('534', '1', '2017-12-27 15:10:00', '0:0:0:0:0:0:0:1', 'cn.wolfcode.crm.service.impl.MenuServiceImpl:selectByParentIdAndEmployeeId', 'cn.wolfcode.crm.service.impl.MenuServiceImpl:selectByParentIdAndEmployeeId');
INSERT INTO `systemlog` VALUES ('535', '1', '2017-12-27 15:10:00', '0:0:0:0:0:0:0:1', 'cn.wolfcode.crm.service.impl.MenuServiceImpl:selectByParentIdAndEmployeeId', 'cn.wolfcode.crm.service.impl.MenuServiceImpl:selectByParentIdAndEmployeeId');
INSERT INTO `systemlog` VALUES ('536', '1', '2017-12-27 15:10:00', '0:0:0:0:0:0:0:1', 'cn.wolfcode.crm.service.impl.MenuServiceImpl:selectByParentIdAndEmployeeId', 'cn.wolfcode.crm.service.impl.MenuServiceImpl:selectByParentIdAndEmployeeId');
INSERT INTO `systemlog` VALUES ('537', '1', '2017-12-27 15:10:02', '0:0:0:0:0:0:0:1', 'cn.wolfcode.crm.service.impl.EmployeeServiceImpl:selectAll', 'cn.wolfcode.crm.service.impl.EmployeeServiceImpl:selectAll');
INSERT INTO `systemlog` VALUES ('538', '1', '2017-12-27 15:10:02', '0:0:0:0:0:0:0:1', 'cn.wolfcode.crm.service.impl.EmployeeServiceImpl:selectAll', 'cn.wolfcode.crm.service.impl.EmployeeServiceImpl:selectAll');
INSERT INTO `systemlog` VALUES ('539', '1', '2017-12-27 15:10:02', '0:0:0:0:0:0:0:1', 'cn.wolfcode.crm.service.impl.DictionaryDetailServiceImpl:selectByParentSn', 'cn.wolfcode.crm.service.impl.DictionaryDetailServiceImpl:selectByParentSn');
INSERT INTO `systemlog` VALUES ('540', '1', '2017-12-27 15:10:02', '0:0:0:0:0:0:0:1', 'cn.wolfcode.crm.service.impl.DictionaryDetailServiceImpl:selectByParentSn', 'cn.wolfcode.crm.service.impl.DictionaryDetailServiceImpl:selectByParentSn');
INSERT INTO `systemlog` VALUES ('541', '1', '2017-12-27 15:10:02', '0:0:0:0:0:0:0:1', 'cn.wolfcode.crm.service.impl.DictionaryDetailServiceImpl:selectByParentSn', 'cn.wolfcode.crm.service.impl.DictionaryDetailServiceImpl:selectByParentSn');
INSERT INTO `systemlog` VALUES ('542', '1', '2017-12-27 15:10:08', '0:0:0:0:0:0:0:1', 'cn.wolfcode.crm.service.impl.DictionaryDetailServiceImpl:selectByParentSn', 'cn.wolfcode.crm.service.impl.DictionaryDetailServiceImpl:selectByParentSn');
INSERT INTO `systemlog` VALUES ('543', '1', '2017-12-27 15:10:08', '0:0:0:0:0:0:0:1', 'cn.wolfcode.crm.service.impl.DictionaryDetailServiceImpl:selectByParentSn', 'cn.wolfcode.crm.service.impl.DictionaryDetailServiceImpl:selectByParentSn');
INSERT INTO `systemlog` VALUES ('544', '1', '2017-12-27 15:10:08', '0:0:0:0:0:0:0:1', 'cn.wolfcode.crm.service.impl.DictionaryDetailServiceImpl:selectByParentSn', 'cn.wolfcode.crm.service.impl.DictionaryDetailServiceImpl:selectByParentSn');

-- ----------------------------
-- Table structure for taxandins
-- ----------------------------
DROP TABLE IF EXISTS `taxandins`;
CREATE TABLE `taxandins` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `traffic_number` int(11) DEFAULT NULL,
  `drunk_number` int(11) DEFAULT NULL,
  `ins_modulus` decimal(10,0) DEFAULT NULL,
  `tax` decimal(10,2) DEFAULT NULL,
  `ins` decimal(10,2) DEFAULT NULL,
  `safe_years` int(11) DEFAULT NULL,
  `bill_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of taxandins
-- ----------------------------
INSERT INTO `taxandins` VALUES ('1', '1', '1', '1', '4500.00', '2700.00', '1', '1');
INSERT INTO `taxandins` VALUES ('2', '1', '2', '1', '4500.00', '2400.00', '2', '2');
INSERT INTO `taxandins` VALUES ('5', '1', '2', '1', '4500.00', '2100.00', '3', null);
INSERT INTO `taxandins` VALUES ('6', '1', '1', '1', '4500.00', '2700.00', '1', '5');
INSERT INTO `taxandins` VALUES ('7', '1', '2', '1', '4500.00', '2100.00', '3', '5');
INSERT INTO `taxandins` VALUES ('8', '2', '3', '1', '4500.00', '2100.00', '4', '11');
INSERT INTO `taxandins` VALUES ('9', '1', '2', '1', '4500.00', '2100.00', '3', '12');
INSERT INTO `taxandins` VALUES ('10', '1', '2', '1', '4500.00', '2100.00', '3', '13');
INSERT INTO `taxandins` VALUES ('11', '1', '2', '1', '4500.00', '2100.00', '3', '1');
INSERT INTO `taxandins` VALUES ('12', '2', '2', '1', '4500.00', '2100.00', '3', '2');
INSERT INTO `taxandins` VALUES ('13', '1', '2', '1', '4500.00', '2100.00', '3', '3');

-- ----------------------------
-- Table structure for wages
-- ----------------------------
DROP TABLE IF EXISTS `wages`;
CREATE TABLE `wages` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `inputTime` date DEFAULT NULL,
  `outputTime` date DEFAULT NULL,
  `salary` decimal(10,2) DEFAULT NULL,
  `employee_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wages
-- ----------------------------
INSERT INTO `wages` VALUES ('1', '2017-12-12', '2017-12-30', '999.00', '1');
INSERT INTO `wages` VALUES ('5', '0017-12-12', '0017-12-12', '666.00', '1');
INSERT INTO `wages` VALUES ('6', '0017-12-12', '0017-12-12', '777.00', '1');
INSERT INTO `wages` VALUES ('7', '2017-12-12', '2017-12-12', '666.00', '1');
INSERT INTO `wages` VALUES ('8', '2017-12-12', '2017-12-12', '777.00', '1');
INSERT INTO `wages` VALUES ('9', '2017-11-11', '2017-11-11', '554.00', '1');
INSERT INTO `wages` VALUES ('10', '2017-11-13', '2017-11-13', '666.00', '1');
