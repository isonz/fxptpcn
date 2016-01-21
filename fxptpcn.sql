/*
Navicat MySQL Data Transfer

Source Server         : 192.168.75.140
Source Server Version : 50169
Source Host           : 192.168.75.140:3306
Source Database       : fxptpcn

Target Server Type    : MYSQL
Target Server Version : 50169
File Encoding         : 65001

Date: 2016-01-21 11:06:02
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for fx_admin
-- ----------------------------
DROP TABLE IF EXISTS `fx_admin`;
CREATE TABLE `fx_admin` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `account` varchar(20) NOT NULL,
  `nickname` varchar(30) NOT NULL,
  `password` char(32) NOT NULL,
  `last_login_time` int(11) unsigned DEFAULT '0',
  `last_login_ip` varchar(15) DEFAULT NULL,
  `login_count` int(10) unsigned DEFAULT '0',
  `verify` varchar(32) DEFAULT NULL,
  `email` varchar(50) NOT NULL,
  `create_time` int(11) unsigned NOT NULL,
  `update_time` int(11) unsigned NOT NULL,
  `status` tinyint(1) DEFAULT '0',
  `type_id` tinyint(2) unsigned DEFAULT '0',
  `info` text NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `account` (`account`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of fx_admin
-- ----------------------------
INSERT INTO `fx_admin` VALUES ('1', 'root', '超级管理员', 'be1f773b1222debd2c5e14f7a4328508', '1453343904', '127.0.0.1', '1210', '', 'q@welltao.com', '1287814190', '1382493803', '1', '0', '');
INSERT INTO `fx_admin` VALUES ('2', 'programmer', '颜平平', 'e10adc3949ba59abbe56e057f20f883e', '1447839684', '127.0.0.1', '131', null, 'yan@qq.com', '1366021436', '1447835516', '1', '0', '');

-- ----------------------------
-- Table structure for fx_admin_log
-- ----------------------------
DROP TABLE IF EXISTS `fx_admin_log`;
CREATE TABLE `fx_admin_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `admin_account` varchar(20) NOT NULL COMMENT '用户编号',
  `module_id` int(10) unsigned NOT NULL,
  `log` text,
  `create_time` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `user_op_log_admin_account` (`admin_account`),
  KEY `user_op_log_module_id` (`module_id`),
  KEY `create_time` (`create_time`),
  CONSTRAINT `user_op_log_admin_account` FOREIGN KEY (`admin_account`) REFERENCES `fx_admin` (`account`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `user_op_log_module_id` FOREIGN KEY (`module_id`) REFERENCES `fx_modules` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=70 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of fx_admin_log
-- ----------------------------
INSERT INTO `fx_admin_log` VALUES ('29', 'root', '2', '{\"action\":\"\\u6210\\u529f\\u767b\\u5f55\\u540e\\u53f0\\uff01\"}', '1451875354');
INSERT INTO `fx_admin_log` VALUES ('30', 'root', '2', '{\"action\":\"\\u6210\\u529f\\u767b\\u5f55\\u540e\\u53f0\\uff01\"}', '1451875699');
INSERT INTO `fx_admin_log` VALUES ('31', 'root', '3', '{\"action\":\"\\u8ba2\\u5355\\u53f7:AD20151211111219771484\\u5df2\\u53d1\\u8d27\"}', '1451879575');
INSERT INTO `fx_admin_log` VALUES ('32', 'root', '3', '{\"action\":\"\\u8ba2\\u5355\\u53f7:AD20151211111219771484\\u5df2\\u5b8c\\u7ed3\"}', '1451891879');
INSERT INTO `fx_admin_log` VALUES ('33', 'root', '3', '{\"action\":\"\\u8ba2\\u5355\\u53f7:AD20151210171243214334\\u5df2\\u53d1\\u8d27\"}', '1451892512');
INSERT INTO `fx_admin_log` VALUES ('34', 'root', '3', '{\"action\":\"\\u8ba2\\u5355\\u53f7:AD20151210171243214334\\u7531\\u5df2\\u53d1\\u8d27\\u72b6\\u6001\\u66f4\\u6539\\u4e3a\\u5df2\\u5b8c\\u7ed3\\u72b6\\u6001\"}', '1451892725');
INSERT INTO `fx_admin_log` VALUES ('35', 'root', '3', '{\"action\":\"\\u8ba2\\u5355\\u53f7:MO20151210141209597252_YK\\u7531\\u5df2\\u652f\\u4ed8\\uff0c\\u5f85\\u53d1\\u8d27\\u72b6\\u6001\\u66f4\\u6539\\u4e3a\\u5df2\\u53d1\\u8d27\\u72b6\\u6001\"}', '1451895489');
INSERT INTO `fx_admin_log` VALUES ('36', 'root', '3', '{\"action\":\"\\u8ba2\\u5355\\u53f7:PC20151228122600449804\\u7531\\u5df2\\u652f\\u4ed8\\uff0c\\u5f85\\u53d1\\u8d27\\u72b6\\u6001\\u66f4\\u6539\\u4e3a\\u5df2\\u53d1\\u8d27\\u72b6\\u6001\"}', '1451896363');
INSERT INTO `fx_admin_log` VALUES ('38', 'root', '2', '{\"action\":\"\\u6210\\u529f\\u767b\\u5f55\\u540e\\u53f0\\uff01\"}', '1451960471');
INSERT INTO `fx_admin_log` VALUES ('39', 'root', '2', '{\"action\":\"\\u6210\\u529f\\u767b\\u5f55\\u540e\\u53f0\\uff01\"}', '1451967358');
INSERT INTO `fx_admin_log` VALUES ('40', 'root', '2', '{\"action\":\"\\u6210\\u529f\\u767b\\u5f55\\u540e\\u53f0\\uff01\"}', '1452046162');
INSERT INTO `fx_admin_log` VALUES ('41', 'root', '3', '{\"action\":\"\\u540e\\u53f0\\u4e3a\\u5546\\u6237:A1001\\u65b0\\u589e\\u8ba2\\u5355:Array\"}', '1452048590');
INSERT INTO `fx_admin_log` VALUES ('42', 'root', '3', '{\"action\":\"\\u540e\\u53f0\\u4e3a\\u5546\\u6237:A1004\\u65b0\\u589e\\u8ba2\\u5355:Array\"}', '1452048864');
INSERT INTO `fx_admin_log` VALUES ('43', 'root', '2', '{\"action\":\"\\u6210\\u529f\\u767b\\u5f55\\u540e\\u53f0\\uff01\"}', '1452133362');
INSERT INTO `fx_admin_log` VALUES ('44', 'root', '2', '{\"action\":\"\\u6210\\u529f\\u767b\\u5f55\\u540e\\u53f0\\uff01\"}', '1452221941');
INSERT INTO `fx_admin_log` VALUES ('45', 'root', '2', '{\"action\":\"\\u6210\\u529f\\u767b\\u5f55\\u540e\\u53f0\\uff01\"}', '1452477101');
INSERT INTO `fx_admin_log` VALUES ('46', 'root', '5', '{\"action\":\"\\u65b0\\u589e\\u4ea7\\u54c1sku:000011\"}', '1452484654');
INSERT INTO `fx_admin_log` VALUES ('47', 'root', '5', '{\"action\":\"\\u65b0\\u589e\\u4ea7\\u54c1sku:000012\"}', '1452484923');
INSERT INTO `fx_admin_log` VALUES ('48', 'root', '2', '{\"action\":\"\\u6210\\u529f\\u767b\\u5f55\\u540e\\u53f0\\uff01\"}', '1452565079');
INSERT INTO `fx_admin_log` VALUES ('49', 'root', '5', '{\"action\":\"\\u540e\\u53f0\\u4fee\\u6539\\u4e86\\u4ea7\\u54c1sku:S00001,\\u6279\\u6b21:2016-03-19\\u7684\\u5e93\\u5b58\\u91cf\\uff0c\\u539f\\u5e93\\u5b58\\u4e3a0,\\u4fee\\u6539\\u540e\\u7684\\u5e93\\u5b58\\u4e3a200\"}', '1452581836');
INSERT INTO `fx_admin_log` VALUES ('50', 'root', '5', '{\"action\":\"\\u540e\\u53f0\\u4fee\\u6539\\u4e86\\u4ea7\\u54c1sku:S00001,\\u6279\\u6b21:2016-03-19\\u7684\\u5e93\\u5b58\\u91cf\\uff0c\\u539f\\u5e93\\u5b58\\u4e3a398,\\u4fee\\u6539\\u540e\\u7684\\u5e93\\u5b58\\u4e3a598\"}', '1452581844');
INSERT INTO `fx_admin_log` VALUES ('51', 'root', '5', '{\"action\":\"\\u540e\\u53f0\\u4fee\\u6539\\u4e86\\u4ea7\\u54c1sku:S00001,\\u6279\\u6b21:2016-03-19\\u7684\\u5e93\\u5b58\\u91cf\\uff0c\\u539f\\u5e93\\u5b58\\u4e3a598,\\u4fee\\u6539\\u540e\\u7684\\u5e93\\u5b58\\u4e3a398\"}', '1452582123');
INSERT INTO `fx_admin_log` VALUES ('52', 'root', '5', '{\"action\":\"\\u540e\\u53f0\\u4fee\\u6539\\u4e86\\u4ea7\\u54c1sku:S00001,\\u6279\\u6b21:2016-03-19\\u7684\\u5e93\\u5b58\\u91cf\\uff0c\\u539f\\u5e93\\u5b58\\u4e3a398,\\u4fee\\u6539\\u540e\\u7684\\u5e93\\u5b58\\u4e3a598\"}', '1452582128');
INSERT INTO `fx_admin_log` VALUES ('53', 'root', '5', '{\"action\":\"\\u540e\\u53f0\\u4fee\\u6539\\u4e86\\u4ea7\\u54c1sku:S00001,\\u6279\\u6b21:2016-03-19\\u7684\\u5e93\\u5b58\\u91cf\\uff0c\\u539f\\u5e93\\u5b58\\u4e3a598,\\u4fee\\u6539\\u540e\\u7684\\u5e93\\u5b58\\u4e3a398\"}', '1452582134');
INSERT INTO `fx_admin_log` VALUES ('54', 'root', '5', '{\"action\":\"\\u540e\\u53f0\\u4fee\\u6539\\u4e86\\u4ea7\\u54c1sku:S00001,\\u6279\\u6b21:2016-03-19\\u7684\\u5e93\\u5b58\\u91cf\\uff0c\\u539f\\u5e93\\u5b58\\u4e3a398,\\u4fee\\u6539\\u540e\\u7684\\u5e93\\u5b58\\u4e3a298\"}', '1452582142');
INSERT INTO `fx_admin_log` VALUES ('55', 'root', '5', '{\"action\":\"\\u540e\\u53f0\\u4fee\\u6539\\u4e86\\u4ea7\\u54c1sku:S00001,\\u6279\\u6b21:2016-03-19\\u7684\\u5e93\\u5b58\\u91cf\\uff0c\\u539f\\u5e93\\u5b58\\u4e3a298,\\u4fee\\u6539\\u540e\\u7684\\u5e93\\u5b58\\u4e3a498\"}', '1452582149');
INSERT INTO `fx_admin_log` VALUES ('56', 'root', '5', '{\"action\":\"\\u65b0\\u589e\\u4ea7\\u54c1\\u5927\\u8d27\\u53f7:P1005\"}', '1452583918');
INSERT INTO `fx_admin_log` VALUES ('57', 'root', '5', '{\"action\":\"\\u65b0\\u589e\\u4ea7\\u54c1\\u5927\\u8d27\\u53f7:P1006\"}', '1452583976');
INSERT INTO `fx_admin_log` VALUES ('58', 'root', '2', '{\"action\":\"\\u6210\\u529f\\u767b\\u5f55\\u540e\\u53f0\\uff01\"}', '1452650700');
INSERT INTO `fx_admin_log` VALUES ('59', 'root', '2', '{\"action\":\"\\u6210\\u529f\\u767b\\u5f55\\u540e\\u53f0\\uff01\"}', '1452737630');
INSERT INTO `fx_admin_log` VALUES ('60', 'root', '2', '{\"action\":\"\\u6210\\u529f\\u767b\\u5f55\\u540e\\u53f0\\uff01\"}', '1452823252');
INSERT INTO `fx_admin_log` VALUES ('61', 'root', '2', '{\"action\":\"\\u6210\\u529f\\u767b\\u5f55\\u540e\\u53f0\\uff01\"}', '1453081487');
INSERT INTO `fx_admin_log` VALUES ('62', 'root', '2', '{\"action\":\"\\u6210\\u529f\\u767b\\u5f55\\u540e\\u53f0\\uff01\"}', '1453169468');
INSERT INTO `fx_admin_log` VALUES ('63', 'root', '3', '{\"action\":\"\\u8ba2\\u5355\\u53f7:FXPC16011309462073BH\\u7531\\u5df2\\u652f\\u4ed8\\uff0c\\u5f85\\u53d1\\u8d27\\u72b6\\u6001\\u66f4\\u6539\\u4e3a\\u5df2\\u5b8c\\u7ed3\\u72b6\\u6001\"}', '1453175273');
INSERT INTO `fx_admin_log` VALUES ('64', 'root', '3', '{\"action\":\"\\u8ba2\\u5355\\u53f7:FXPC16011215133216SK\\u7531\\u5f85\\u652f\\u4ed8\\u72b6\\u6001\\u66f4\\u6539\\u4e3a\\u8ba2\\u5355\\u53d6\\u6d88\\u72b6\\u6001\"}', '1453175737');
INSERT INTO `fx_admin_log` VALUES ('65', 'root', '3', '{\"action\":\"\\u8ba2\\u5355\\u53f7:FXPC16011215133216SK\\u7531\\u5f85\\u652f\\u4ed8\\u72b6\\u6001\\u66f4\\u6539\\u4e3a\\u8ba2\\u5355\\u53d6\\u6d88\\u72b6\\u6001\"}', '1453176381');
INSERT INTO `fx_admin_log` VALUES ('66', 'root', '3', '{\"action\":\"\\u8ba2\\u5355\\u53f7:FXPC16011215133216SK\\u7531\\u5f85\\u652f\\u4ed8\\u72b6\\u6001\\u66f4\\u6539\\u4e3a\\u8ba2\\u5355\\u53d6\\u6d88\\u72b6\\u6001\"}', '1453176760');
INSERT INTO `fx_admin_log` VALUES ('67', 'root', '3', '{\"action\":\"\\u8ba2\\u5355\\u53f7:FXPC16011215133216SK\\u7531\\u5f85\\u652f\\u4ed8\\u72b6\\u6001\\u66f4\\u6539\\u4e3a\\u8ba2\\u5355\\u53d6\\u6d88\\u72b6\\u6001\"}', '1453177014');
INSERT INTO `fx_admin_log` VALUES ('68', 'root', '2', '{\"action\":\"\\u6210\\u529f\\u767b\\u5f55\\u540e\\u53f0\\uff01\"}', '1453257397');
INSERT INTO `fx_admin_log` VALUES ('69', 'root', '2', '{\"action\":\"\\u6210\\u529f\\u767b\\u5f55\\u540e\\u53f0\\uff01\"}', '1453343904');

-- ----------------------------
-- Table structure for fx_cart
-- ----------------------------
DROP TABLE IF EXISTS `fx_cart`;
CREATE TABLE `fx_cart` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `sku_id` int(10) unsigned NOT NULL,
  `qt` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '数量',
  `update_time` int(10) unsigned NOT NULL COMMENT '更新时间',
  `create_time` int(10) unsigned NOT NULL COMMENT '创建时间',
  `status` tinyint(3) unsigned DEFAULT '0' COMMENT '购物车内商品是否已下单，1是，0否',
  PRIMARY KEY (`id`),
  KEY `cart_user_id` (`user_id`),
  KEY `update_time` (`update_time`),
  KEY `status` (`status`),
  KEY `sku_id_user_id` (`sku_id`,`user_id`) USING BTREE,
  CONSTRAINT `cart_sku_id` FOREIGN KEY (`sku_id`) REFERENCES `fx_products_sku` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `cart_user_id` FOREIGN KEY (`user_id`) REFERENCES `fx_users` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of fx_cart
-- ----------------------------
INSERT INTO `fx_cart` VALUES ('1', '1', '6', '15', '1452580736', '1450926766', '1');
INSERT INTO `fx_cart` VALUES ('3', '25', '6', '6', '1451963020', '1450938708', '1');
INSERT INTO `fx_cart` VALUES ('4', '25', '7', '2', '1451027274', '1451027273', '0');
INSERT INTO `fx_cart` VALUES ('6', '25', '4', '5', '1452565663', '1452565422', '0');
INSERT INTO `fx_cart` VALUES ('7', '1', '4', '4', '1452581569', '1452571765', '1');
INSERT INTO `fx_cart` VALUES ('16', '1', '6', '1', '1452581522', '1452581522', '1');
INSERT INTO `fx_cart` VALUES ('18', '1', '6', '4', '1452581667', '1452581651', '1');
INSERT INTO `fx_cart` VALUES ('20', '1', '6', '1', '1452582774', '1452582774', '1');
INSERT INTO `fx_cart` VALUES ('21', '1', '4', '1', '1452582777', '1452582777', '1');
INSERT INTO `fx_cart` VALUES ('22', '1', '1', '2', '1452582793', '1452582792', '1');
INSERT INTO `fx_cart` VALUES ('23', '1', '7', '2', '1452582799', '1452582797', '1');
INSERT INTO `fx_cart` VALUES ('24', '1', '6', '1', '1452583255', '1452583255', '1');
INSERT INTO `fx_cart` VALUES ('25', '25', '6', '19', '1453170106', '1453106919', '0');
INSERT INTO `fx_cart` VALUES ('26', '1', '6', '3', '1453174093', '1453112918', '0');
INSERT INTO `fx_cart` VALUES ('27', '1', '1', '1', '1453112972', '1453112972', '0');

-- ----------------------------
-- Table structure for fx_countys
-- ----------------------------
DROP TABLE IF EXISTS `fx_countys`;
CREATE TABLE `fx_countys` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT COMMENT '自然序号',
  `pid` smallint(5) NOT NULL DEFAULT '0' COMMENT '父类ID',
  `type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '所属级别，1省份,2城市,3县/区',
  `name` varchar(255) CHARACTER SET gbk NOT NULL DEFAULT ' ' COMMENT '国家英文名称',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态：启用1，禁用0',
  `sort` smallint(5) unsigned DEFAULT '0' COMMENT '排序',
  PRIMARY KEY (`id`),
  KEY `pid` (`pid`),
  KEY `sort` (`sort`),
  KEY `name` (`name`),
  KEY `status` (`status`)
) ENGINE=InnoDB AUTO_INCREMENT=3409 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of fx_countys
-- ----------------------------
INSERT INTO `fx_countys` VALUES ('2', '0', '1', '北京', '1', '100');
INSERT INTO `fx_countys` VALUES ('3', '0', '1', '安徽', '1', '0');
INSERT INTO `fx_countys` VALUES ('4', '0', '1', '福建', '1', '0');
INSERT INTO `fx_countys` VALUES ('5', '0', '1', '甘肃', '1', '0');
INSERT INTO `fx_countys` VALUES ('6', '0', '1', '广东', '1', '0');
INSERT INTO `fx_countys` VALUES ('7', '0', '1', '广西', '1', '0');
INSERT INTO `fx_countys` VALUES ('8', '0', '1', '贵州', '1', '0');
INSERT INTO `fx_countys` VALUES ('9', '0', '1', '海南', '1', '0');
INSERT INTO `fx_countys` VALUES ('10', '0', '1', '河北', '1', '0');
INSERT INTO `fx_countys` VALUES ('11', '0', '1', '河南', '1', '0');
INSERT INTO `fx_countys` VALUES ('12', '0', '1', '黑龙江', '1', '0');
INSERT INTO `fx_countys` VALUES ('13', '0', '1', '湖北', '1', '0');
INSERT INTO `fx_countys` VALUES ('14', '0', '1', '湖南', '1', '0');
INSERT INTO `fx_countys` VALUES ('15', '0', '1', '吉林', '1', '0');
INSERT INTO `fx_countys` VALUES ('16', '0', '1', '江苏', '1', '0');
INSERT INTO `fx_countys` VALUES ('17', '0', '1', '江西', '1', '0');
INSERT INTO `fx_countys` VALUES ('18', '0', '1', '辽宁', '1', '0');
INSERT INTO `fx_countys` VALUES ('19', '0', '1', '内蒙古', '1', '0');
INSERT INTO `fx_countys` VALUES ('20', '0', '1', '宁夏', '1', '0');
INSERT INTO `fx_countys` VALUES ('21', '0', '1', '青海', '1', '0');
INSERT INTO `fx_countys` VALUES ('22', '0', '1', '山东', '1', '0');
INSERT INTO `fx_countys` VALUES ('23', '0', '1', '山西', '1', '0');
INSERT INTO `fx_countys` VALUES ('24', '0', '1', '陕西', '1', '0');
INSERT INTO `fx_countys` VALUES ('25', '0', '1', '上海', '1', '99');
INSERT INTO `fx_countys` VALUES ('26', '0', '1', '四川', '1', '0');
INSERT INTO `fx_countys` VALUES ('27', '0', '1', '天津', '1', '98');
INSERT INTO `fx_countys` VALUES ('28', '0', '1', '西藏', '1', '0');
INSERT INTO `fx_countys` VALUES ('29', '0', '1', '新疆', '1', '0');
INSERT INTO `fx_countys` VALUES ('30', '0', '1', '云南', '1', '0');
INSERT INTO `fx_countys` VALUES ('31', '0', '1', '浙江', '1', '0');
INSERT INTO `fx_countys` VALUES ('32', '0', '1', '重庆', '1', '97');
INSERT INTO `fx_countys` VALUES ('33', '0', '1', '香港', '1', '0');
INSERT INTO `fx_countys` VALUES ('34', '0', '1', '澳门', '1', '0');
INSERT INTO `fx_countys` VALUES ('35', '0', '1', '台湾', '1', '0');
INSERT INTO `fx_countys` VALUES ('36', '3', '2', '安庆', '1', '0');
INSERT INTO `fx_countys` VALUES ('37', '3', '2', '蚌埠', '1', '0');
INSERT INTO `fx_countys` VALUES ('38', '3', '2', '巢湖', '1', '0');
INSERT INTO `fx_countys` VALUES ('39', '3', '2', '池州', '1', '0');
INSERT INTO `fx_countys` VALUES ('40', '3', '2', '滁州', '1', '0');
INSERT INTO `fx_countys` VALUES ('41', '3', '2', '阜阳', '1', '0');
INSERT INTO `fx_countys` VALUES ('42', '3', '2', '淮北', '1', '0');
INSERT INTO `fx_countys` VALUES ('43', '3', '2', '淮南', '1', '0');
INSERT INTO `fx_countys` VALUES ('44', '3', '2', '黄山', '1', '0');
INSERT INTO `fx_countys` VALUES ('45', '3', '2', '六安', '1', '0');
INSERT INTO `fx_countys` VALUES ('46', '3', '2', '马鞍山', '1', '0');
INSERT INTO `fx_countys` VALUES ('47', '3', '2', '宿州', '1', '0');
INSERT INTO `fx_countys` VALUES ('48', '3', '2', '铜陵', '1', '0');
INSERT INTO `fx_countys` VALUES ('49', '3', '2', '芜湖', '1', '0');
INSERT INTO `fx_countys` VALUES ('50', '3', '2', '宣城', '1', '0');
INSERT INTO `fx_countys` VALUES ('51', '3', '2', '亳州', '1', '0');
INSERT INTO `fx_countys` VALUES ('52', '2', '2', '北京', '1', '0');
INSERT INTO `fx_countys` VALUES ('53', '4', '2', '福州', '1', '0');
INSERT INTO `fx_countys` VALUES ('54', '4', '2', '龙岩', '1', '0');
INSERT INTO `fx_countys` VALUES ('55', '4', '2', '南平', '1', '0');
INSERT INTO `fx_countys` VALUES ('56', '4', '2', '宁德', '1', '0');
INSERT INTO `fx_countys` VALUES ('57', '4', '2', '莆田', '1', '0');
INSERT INTO `fx_countys` VALUES ('58', '4', '2', '泉州', '1', '0');
INSERT INTO `fx_countys` VALUES ('59', '4', '2', '三明', '1', '0');
INSERT INTO `fx_countys` VALUES ('60', '4', '2', '厦门', '1', '0');
INSERT INTO `fx_countys` VALUES ('61', '4', '2', '漳州', '1', '0');
INSERT INTO `fx_countys` VALUES ('62', '5', '2', '兰州', '1', '0');
INSERT INTO `fx_countys` VALUES ('63', '5', '2', '白银', '1', '0');
INSERT INTO `fx_countys` VALUES ('64', '5', '2', '定西', '1', '0');
INSERT INTO `fx_countys` VALUES ('65', '5', '2', '甘南', '1', '0');
INSERT INTO `fx_countys` VALUES ('66', '5', '2', '嘉峪关', '1', '0');
INSERT INTO `fx_countys` VALUES ('67', '5', '2', '金昌', '1', '0');
INSERT INTO `fx_countys` VALUES ('68', '5', '2', '酒泉', '1', '0');
INSERT INTO `fx_countys` VALUES ('69', '5', '2', '临夏', '1', '0');
INSERT INTO `fx_countys` VALUES ('70', '5', '2', '陇南', '1', '0');
INSERT INTO `fx_countys` VALUES ('71', '5', '2', '平凉', '1', '0');
INSERT INTO `fx_countys` VALUES ('72', '5', '2', '庆阳', '1', '0');
INSERT INTO `fx_countys` VALUES ('73', '5', '2', '天水', '1', '0');
INSERT INTO `fx_countys` VALUES ('74', '5', '2', '武威', '1', '0');
INSERT INTO `fx_countys` VALUES ('75', '5', '2', '张掖', '1', '0');
INSERT INTO `fx_countys` VALUES ('76', '6', '2', '广州', '1', '50');
INSERT INTO `fx_countys` VALUES ('77', '6', '2', '深圳', '1', '0');
INSERT INTO `fx_countys` VALUES ('78', '6', '2', '潮州', '1', '0');
INSERT INTO `fx_countys` VALUES ('79', '6', '2', '东莞', '1', '0');
INSERT INTO `fx_countys` VALUES ('80', '6', '2', '佛山', '1', '0');
INSERT INTO `fx_countys` VALUES ('81', '6', '2', '河源', '1', '0');
INSERT INTO `fx_countys` VALUES ('82', '6', '2', '惠州', '1', '0');
INSERT INTO `fx_countys` VALUES ('83', '6', '2', '江门', '1', '0');
INSERT INTO `fx_countys` VALUES ('84', '6', '2', '揭阳', '1', '0');
INSERT INTO `fx_countys` VALUES ('85', '6', '2', '茂名', '1', '0');
INSERT INTO `fx_countys` VALUES ('86', '6', '2', '梅州', '1', '0');
INSERT INTO `fx_countys` VALUES ('87', '6', '2', '清远', '1', '0');
INSERT INTO `fx_countys` VALUES ('88', '6', '2', '汕头', '1', '0');
INSERT INTO `fx_countys` VALUES ('89', '6', '2', '汕尾', '1', '0');
INSERT INTO `fx_countys` VALUES ('90', '6', '2', '韶关', '1', '0');
INSERT INTO `fx_countys` VALUES ('91', '6', '2', '阳江', '1', '0');
INSERT INTO `fx_countys` VALUES ('92', '6', '2', '云浮', '1', '0');
INSERT INTO `fx_countys` VALUES ('93', '6', '2', '湛江', '1', '0');
INSERT INTO `fx_countys` VALUES ('94', '6', '2', '肇庆', '1', '0');
INSERT INTO `fx_countys` VALUES ('95', '6', '2', '中山', '1', '0');
INSERT INTO `fx_countys` VALUES ('96', '6', '2', '珠海', '1', '0');
INSERT INTO `fx_countys` VALUES ('97', '7', '2', '南宁', '1', '0');
INSERT INTO `fx_countys` VALUES ('98', '7', '2', '桂林', '1', '0');
INSERT INTO `fx_countys` VALUES ('99', '7', '2', '百色', '1', '0');
INSERT INTO `fx_countys` VALUES ('100', '7', '2', '北海', '1', '0');
INSERT INTO `fx_countys` VALUES ('101', '7', '2', '崇左', '1', '0');
INSERT INTO `fx_countys` VALUES ('102', '7', '2', '防城港', '1', '0');
INSERT INTO `fx_countys` VALUES ('103', '7', '2', '贵港', '1', '0');
INSERT INTO `fx_countys` VALUES ('104', '7', '2', '河池', '1', '0');
INSERT INTO `fx_countys` VALUES ('105', '7', '2', '贺州', '1', '0');
INSERT INTO `fx_countys` VALUES ('106', '7', '2', '来宾', '1', '0');
INSERT INTO `fx_countys` VALUES ('107', '7', '2', '柳州', '1', '0');
INSERT INTO `fx_countys` VALUES ('108', '7', '2', '钦州', '1', '0');
INSERT INTO `fx_countys` VALUES ('109', '7', '2', '梧州', '1', '0');
INSERT INTO `fx_countys` VALUES ('110', '7', '2', '玉林', '1', '0');
INSERT INTO `fx_countys` VALUES ('111', '8', '2', '贵阳', '1', '0');
INSERT INTO `fx_countys` VALUES ('112', '8', '2', '安顺', '1', '0');
INSERT INTO `fx_countys` VALUES ('113', '8', '2', '毕节', '1', '0');
INSERT INTO `fx_countys` VALUES ('114', '8', '2', '六盘水', '1', '0');
INSERT INTO `fx_countys` VALUES ('115', '8', '2', '黔东南', '1', '0');
INSERT INTO `fx_countys` VALUES ('116', '8', '2', '黔南', '1', '0');
INSERT INTO `fx_countys` VALUES ('117', '8', '2', '黔西南', '1', '0');
INSERT INTO `fx_countys` VALUES ('118', '8', '2', '铜仁', '1', '0');
INSERT INTO `fx_countys` VALUES ('119', '8', '2', '遵义', '1', '0');
INSERT INTO `fx_countys` VALUES ('120', '9', '2', '海口', '1', '0');
INSERT INTO `fx_countys` VALUES ('121', '9', '2', '三亚', '1', '0');
INSERT INTO `fx_countys` VALUES ('122', '9', '2', '白沙', '1', '0');
INSERT INTO `fx_countys` VALUES ('123', '9', '2', '保亭', '1', '0');
INSERT INTO `fx_countys` VALUES ('124', '9', '2', '昌江', '1', '0');
INSERT INTO `fx_countys` VALUES ('125', '9', '2', '澄迈县', '1', '0');
INSERT INTO `fx_countys` VALUES ('126', '9', '2', '定安县', '1', '0');
INSERT INTO `fx_countys` VALUES ('127', '9', '2', '东方', '1', '0');
INSERT INTO `fx_countys` VALUES ('128', '9', '2', '乐东', '1', '0');
INSERT INTO `fx_countys` VALUES ('129', '9', '2', '临高县', '1', '0');
INSERT INTO `fx_countys` VALUES ('130', '9', '2', '陵水', '1', '0');
INSERT INTO `fx_countys` VALUES ('131', '9', '2', '琼海', '1', '0');
INSERT INTO `fx_countys` VALUES ('132', '9', '2', '琼中', '1', '0');
INSERT INTO `fx_countys` VALUES ('133', '9', '2', '屯昌县', '1', '0');
INSERT INTO `fx_countys` VALUES ('134', '9', '2', '万宁', '1', '0');
INSERT INTO `fx_countys` VALUES ('135', '9', '2', '文昌', '1', '0');
INSERT INTO `fx_countys` VALUES ('136', '9', '2', '五指山', '1', '0');
INSERT INTO `fx_countys` VALUES ('137', '9', '2', '儋州', '1', '0');
INSERT INTO `fx_countys` VALUES ('138', '10', '2', '石家庄', '1', '0');
INSERT INTO `fx_countys` VALUES ('139', '10', '2', '保定', '1', '0');
INSERT INTO `fx_countys` VALUES ('140', '10', '2', '沧州', '1', '0');
INSERT INTO `fx_countys` VALUES ('141', '10', '2', '承德', '1', '0');
INSERT INTO `fx_countys` VALUES ('142', '10', '2', '邯郸', '1', '0');
INSERT INTO `fx_countys` VALUES ('143', '10', '2', '衡水', '1', '0');
INSERT INTO `fx_countys` VALUES ('144', '10', '2', '廊坊', '1', '0');
INSERT INTO `fx_countys` VALUES ('145', '10', '2', '秦皇岛', '1', '0');
INSERT INTO `fx_countys` VALUES ('146', '10', '2', '唐山', '1', '0');
INSERT INTO `fx_countys` VALUES ('147', '10', '2', '邢台', '1', '0');
INSERT INTO `fx_countys` VALUES ('148', '10', '2', '张家口', '1', '0');
INSERT INTO `fx_countys` VALUES ('149', '11', '2', '郑州', '1', '0');
INSERT INTO `fx_countys` VALUES ('150', '11', '2', '洛阳', '1', '0');
INSERT INTO `fx_countys` VALUES ('151', '11', '2', '开封', '1', '0');
INSERT INTO `fx_countys` VALUES ('152', '11', '2', '安阳', '1', '0');
INSERT INTO `fx_countys` VALUES ('153', '11', '2', '鹤壁', '1', '0');
INSERT INTO `fx_countys` VALUES ('154', '11', '2', '济源', '1', '0');
INSERT INTO `fx_countys` VALUES ('155', '11', '2', '焦作', '1', '0');
INSERT INTO `fx_countys` VALUES ('156', '11', '2', '南阳', '1', '0');
INSERT INTO `fx_countys` VALUES ('157', '11', '2', '平顶山', '1', '0');
INSERT INTO `fx_countys` VALUES ('158', '11', '2', '三门峡', '1', '0');
INSERT INTO `fx_countys` VALUES ('159', '11', '2', '商丘', '1', '0');
INSERT INTO `fx_countys` VALUES ('160', '11', '2', '新乡', '1', '0');
INSERT INTO `fx_countys` VALUES ('161', '11', '2', '信阳', '1', '0');
INSERT INTO `fx_countys` VALUES ('162', '11', '2', '许昌', '1', '0');
INSERT INTO `fx_countys` VALUES ('163', '11', '2', '周口', '1', '0');
INSERT INTO `fx_countys` VALUES ('164', '11', '2', '驻马店', '1', '0');
INSERT INTO `fx_countys` VALUES ('165', '11', '2', '漯河', '1', '0');
INSERT INTO `fx_countys` VALUES ('166', '11', '2', '濮阳', '1', '0');
INSERT INTO `fx_countys` VALUES ('167', '12', '2', '哈尔滨', '1', '0');
INSERT INTO `fx_countys` VALUES ('168', '12', '2', '大庆', '1', '0');
INSERT INTO `fx_countys` VALUES ('169', '12', '2', '大兴安岭', '1', '0');
INSERT INTO `fx_countys` VALUES ('170', '12', '2', '鹤岗', '1', '0');
INSERT INTO `fx_countys` VALUES ('171', '12', '2', '黑河', '1', '0');
INSERT INTO `fx_countys` VALUES ('172', '12', '2', '鸡西', '1', '0');
INSERT INTO `fx_countys` VALUES ('173', '12', '2', '佳木斯', '1', '0');
INSERT INTO `fx_countys` VALUES ('174', '12', '2', '牡丹江', '1', '0');
INSERT INTO `fx_countys` VALUES ('175', '12', '2', '七台河', '1', '0');
INSERT INTO `fx_countys` VALUES ('176', '12', '2', '齐齐哈尔', '1', '0');
INSERT INTO `fx_countys` VALUES ('177', '12', '2', '双鸭山', '1', '0');
INSERT INTO `fx_countys` VALUES ('178', '12', '2', '绥化', '1', '0');
INSERT INTO `fx_countys` VALUES ('179', '12', '2', '伊春', '1', '0');
INSERT INTO `fx_countys` VALUES ('180', '13', '2', '武汉', '1', '0');
INSERT INTO `fx_countys` VALUES ('181', '13', '2', '仙桃', '1', '0');
INSERT INTO `fx_countys` VALUES ('182', '13', '2', '鄂州', '1', '0');
INSERT INTO `fx_countys` VALUES ('183', '13', '2', '黄冈', '1', '0');
INSERT INTO `fx_countys` VALUES ('184', '13', '2', '黄石', '1', '0');
INSERT INTO `fx_countys` VALUES ('185', '13', '2', '荆门', '1', '0');
INSERT INTO `fx_countys` VALUES ('186', '13', '2', '荆州', '1', '0');
INSERT INTO `fx_countys` VALUES ('187', '13', '2', '潜江', '1', '0');
INSERT INTO `fx_countys` VALUES ('188', '13', '2', '神农架林区', '1', '0');
INSERT INTO `fx_countys` VALUES ('189', '13', '2', '十堰', '1', '0');
INSERT INTO `fx_countys` VALUES ('190', '13', '2', '随州', '1', '0');
INSERT INTO `fx_countys` VALUES ('191', '13', '2', '天门', '1', '0');
INSERT INTO `fx_countys` VALUES ('192', '13', '2', '咸宁', '1', '0');
INSERT INTO `fx_countys` VALUES ('193', '13', '2', '襄樊', '1', '0');
INSERT INTO `fx_countys` VALUES ('194', '13', '2', '孝感', '1', '0');
INSERT INTO `fx_countys` VALUES ('195', '13', '2', '宜昌', '1', '0');
INSERT INTO `fx_countys` VALUES ('196', '13', '2', '恩施', '1', '0');
INSERT INTO `fx_countys` VALUES ('197', '14', '2', '长沙', '1', '0');
INSERT INTO `fx_countys` VALUES ('198', '14', '2', '张家界', '1', '0');
INSERT INTO `fx_countys` VALUES ('199', '14', '2', '常德', '1', '0');
INSERT INTO `fx_countys` VALUES ('200', '14', '2', '郴州', '1', '0');
INSERT INTO `fx_countys` VALUES ('201', '14', '2', '衡阳', '1', '0');
INSERT INTO `fx_countys` VALUES ('202', '14', '2', '怀化', '1', '0');
INSERT INTO `fx_countys` VALUES ('203', '14', '2', '娄底', '1', '0');
INSERT INTO `fx_countys` VALUES ('204', '14', '2', '邵阳', '1', '0');
INSERT INTO `fx_countys` VALUES ('205', '14', '2', '湘潭', '1', '0');
INSERT INTO `fx_countys` VALUES ('206', '14', '2', '湘西', '1', '0');
INSERT INTO `fx_countys` VALUES ('207', '14', '2', '益阳', '1', '0');
INSERT INTO `fx_countys` VALUES ('208', '14', '2', '永州', '1', '0');
INSERT INTO `fx_countys` VALUES ('209', '14', '2', '岳阳', '1', '0');
INSERT INTO `fx_countys` VALUES ('210', '14', '2', '株洲', '1', '0');
INSERT INTO `fx_countys` VALUES ('211', '15', '2', '长春', '1', '0');
INSERT INTO `fx_countys` VALUES ('212', '15', '2', '吉林', '1', '0');
INSERT INTO `fx_countys` VALUES ('213', '15', '2', '白城', '1', '0');
INSERT INTO `fx_countys` VALUES ('214', '15', '2', '白山', '1', '0');
INSERT INTO `fx_countys` VALUES ('215', '15', '2', '辽源', '1', '0');
INSERT INTO `fx_countys` VALUES ('216', '15', '2', '四平', '1', '0');
INSERT INTO `fx_countys` VALUES ('217', '15', '2', '松原', '1', '0');
INSERT INTO `fx_countys` VALUES ('218', '15', '2', '通化', '1', '0');
INSERT INTO `fx_countys` VALUES ('219', '15', '2', '延边', '1', '0');
INSERT INTO `fx_countys` VALUES ('220', '16', '2', '南京', '1', '0');
INSERT INTO `fx_countys` VALUES ('221', '16', '2', '苏州', '1', '0');
INSERT INTO `fx_countys` VALUES ('222', '16', '2', '无锡', '1', '0');
INSERT INTO `fx_countys` VALUES ('223', '16', '2', '常州', '1', '0');
INSERT INTO `fx_countys` VALUES ('224', '16', '2', '淮安', '1', '0');
INSERT INTO `fx_countys` VALUES ('225', '16', '2', '连云港', '1', '0');
INSERT INTO `fx_countys` VALUES ('226', '16', '2', '南通', '1', '0');
INSERT INTO `fx_countys` VALUES ('227', '16', '2', '宿迁', '1', '0');
INSERT INTO `fx_countys` VALUES ('228', '16', '2', '泰州', '1', '0');
INSERT INTO `fx_countys` VALUES ('229', '16', '2', '徐州', '1', '0');
INSERT INTO `fx_countys` VALUES ('230', '16', '2', '盐城', '1', '0');
INSERT INTO `fx_countys` VALUES ('231', '16', '2', '扬州', '1', '0');
INSERT INTO `fx_countys` VALUES ('232', '16', '2', '镇江', '1', '0');
INSERT INTO `fx_countys` VALUES ('233', '17', '2', '南昌', '1', '0');
INSERT INTO `fx_countys` VALUES ('234', '17', '2', '抚州', '1', '0');
INSERT INTO `fx_countys` VALUES ('235', '17', '2', '赣州', '1', '0');
INSERT INTO `fx_countys` VALUES ('236', '17', '2', '吉安', '1', '0');
INSERT INTO `fx_countys` VALUES ('237', '17', '2', '景德镇', '1', '0');
INSERT INTO `fx_countys` VALUES ('238', '17', '2', '九江', '1', '0');
INSERT INTO `fx_countys` VALUES ('239', '17', '2', '萍乡', '1', '0');
INSERT INTO `fx_countys` VALUES ('240', '17', '2', '上饶', '1', '0');
INSERT INTO `fx_countys` VALUES ('241', '17', '2', '新余', '1', '0');
INSERT INTO `fx_countys` VALUES ('242', '17', '2', '宜春', '1', '0');
INSERT INTO `fx_countys` VALUES ('243', '17', '2', '鹰潭', '1', '0');
INSERT INTO `fx_countys` VALUES ('244', '18', '2', '沈阳', '1', '0');
INSERT INTO `fx_countys` VALUES ('245', '18', '2', '大连', '1', '0');
INSERT INTO `fx_countys` VALUES ('246', '18', '2', '鞍山', '1', '0');
INSERT INTO `fx_countys` VALUES ('247', '18', '2', '本溪', '1', '0');
INSERT INTO `fx_countys` VALUES ('248', '18', '2', '朝阳', '1', '0');
INSERT INTO `fx_countys` VALUES ('249', '18', '2', '丹东', '1', '0');
INSERT INTO `fx_countys` VALUES ('250', '18', '2', '抚顺', '1', '0');
INSERT INTO `fx_countys` VALUES ('251', '18', '2', '阜新', '1', '0');
INSERT INTO `fx_countys` VALUES ('252', '18', '2', '葫芦岛', '1', '0');
INSERT INTO `fx_countys` VALUES ('253', '18', '2', '锦州', '1', '0');
INSERT INTO `fx_countys` VALUES ('254', '18', '2', '辽阳', '1', '0');
INSERT INTO `fx_countys` VALUES ('255', '18', '2', '盘锦', '1', '0');
INSERT INTO `fx_countys` VALUES ('256', '18', '2', '铁岭', '1', '0');
INSERT INTO `fx_countys` VALUES ('257', '18', '2', '营口', '1', '0');
INSERT INTO `fx_countys` VALUES ('258', '19', '2', '呼和浩特', '1', '0');
INSERT INTO `fx_countys` VALUES ('259', '19', '2', '阿拉善盟', '1', '0');
INSERT INTO `fx_countys` VALUES ('260', '19', '2', '巴彦淖尔盟', '1', '0');
INSERT INTO `fx_countys` VALUES ('261', '19', '2', '包头', '1', '0');
INSERT INTO `fx_countys` VALUES ('262', '19', '2', '赤峰', '1', '0');
INSERT INTO `fx_countys` VALUES ('263', '19', '2', '鄂尔多斯', '1', '0');
INSERT INTO `fx_countys` VALUES ('264', '19', '2', '呼伦贝尔', '1', '0');
INSERT INTO `fx_countys` VALUES ('265', '19', '2', '通辽', '1', '0');
INSERT INTO `fx_countys` VALUES ('266', '19', '2', '乌海', '1', '0');
INSERT INTO `fx_countys` VALUES ('267', '19', '2', '乌兰察布市', '1', '0');
INSERT INTO `fx_countys` VALUES ('268', '19', '2', '锡林郭勒盟', '1', '0');
INSERT INTO `fx_countys` VALUES ('269', '19', '2', '兴安盟', '1', '0');
INSERT INTO `fx_countys` VALUES ('270', '20', '2', '银川', '1', '0');
INSERT INTO `fx_countys` VALUES ('271', '20', '2', '固原', '1', '0');
INSERT INTO `fx_countys` VALUES ('272', '20', '2', '石嘴山', '1', '0');
INSERT INTO `fx_countys` VALUES ('273', '20', '2', '吴忠', '1', '0');
INSERT INTO `fx_countys` VALUES ('274', '20', '2', '中卫', '1', '0');
INSERT INTO `fx_countys` VALUES ('275', '21', '2', '西宁', '1', '0');
INSERT INTO `fx_countys` VALUES ('276', '21', '2', '果洛', '1', '0');
INSERT INTO `fx_countys` VALUES ('277', '21', '2', '海北', '1', '0');
INSERT INTO `fx_countys` VALUES ('278', '21', '2', '海东', '1', '0');
INSERT INTO `fx_countys` VALUES ('279', '21', '2', '海南', '1', '0');
INSERT INTO `fx_countys` VALUES ('280', '21', '2', '海西', '1', '0');
INSERT INTO `fx_countys` VALUES ('281', '21', '2', '黄南', '1', '0');
INSERT INTO `fx_countys` VALUES ('282', '21', '2', '玉树', '1', '0');
INSERT INTO `fx_countys` VALUES ('283', '22', '2', '济南', '1', '0');
INSERT INTO `fx_countys` VALUES ('284', '22', '2', '青岛', '1', '0');
INSERT INTO `fx_countys` VALUES ('285', '22', '2', '滨州', '1', '0');
INSERT INTO `fx_countys` VALUES ('286', '22', '2', '德州', '1', '0');
INSERT INTO `fx_countys` VALUES ('287', '22', '2', '东营', '1', '0');
INSERT INTO `fx_countys` VALUES ('288', '22', '2', '菏泽', '1', '0');
INSERT INTO `fx_countys` VALUES ('289', '22', '2', '济宁', '1', '0');
INSERT INTO `fx_countys` VALUES ('290', '22', '2', '莱芜', '1', '0');
INSERT INTO `fx_countys` VALUES ('291', '22', '2', '聊城', '1', '0');
INSERT INTO `fx_countys` VALUES ('292', '22', '2', '临沂', '1', '0');
INSERT INTO `fx_countys` VALUES ('293', '22', '2', '日照', '1', '0');
INSERT INTO `fx_countys` VALUES ('294', '22', '2', '泰安', '1', '0');
INSERT INTO `fx_countys` VALUES ('295', '22', '2', '威海', '1', '0');
INSERT INTO `fx_countys` VALUES ('296', '22', '2', '潍坊', '1', '0');
INSERT INTO `fx_countys` VALUES ('297', '22', '2', '烟台', '1', '0');
INSERT INTO `fx_countys` VALUES ('298', '22', '2', '枣庄', '1', '0');
INSERT INTO `fx_countys` VALUES ('299', '22', '2', '淄博', '1', '0');
INSERT INTO `fx_countys` VALUES ('300', '23', '2', '太原', '1', '0');
INSERT INTO `fx_countys` VALUES ('301', '23', '2', '长治', '1', '0');
INSERT INTO `fx_countys` VALUES ('302', '23', '2', '大同', '1', '0');
INSERT INTO `fx_countys` VALUES ('303', '23', '2', '晋城', '1', '0');
INSERT INTO `fx_countys` VALUES ('304', '23', '2', '晋中', '1', '0');
INSERT INTO `fx_countys` VALUES ('305', '23', '2', '临汾', '1', '0');
INSERT INTO `fx_countys` VALUES ('306', '23', '2', '吕梁', '1', '0');
INSERT INTO `fx_countys` VALUES ('307', '23', '2', '朔州', '1', '0');
INSERT INTO `fx_countys` VALUES ('308', '23', '2', '忻州', '1', '0');
INSERT INTO `fx_countys` VALUES ('309', '23', '2', '阳泉', '1', '0');
INSERT INTO `fx_countys` VALUES ('310', '23', '2', '运城', '1', '0');
INSERT INTO `fx_countys` VALUES ('311', '24', '2', '西安', '1', '0');
INSERT INTO `fx_countys` VALUES ('312', '24', '2', '安康', '1', '0');
INSERT INTO `fx_countys` VALUES ('313', '24', '2', '宝鸡', '1', '0');
INSERT INTO `fx_countys` VALUES ('314', '24', '2', '汉中', '1', '0');
INSERT INTO `fx_countys` VALUES ('315', '24', '2', '商洛', '1', '0');
INSERT INTO `fx_countys` VALUES ('316', '24', '2', '铜川', '1', '0');
INSERT INTO `fx_countys` VALUES ('317', '24', '2', '渭南', '1', '0');
INSERT INTO `fx_countys` VALUES ('318', '24', '2', '咸阳', '1', '0');
INSERT INTO `fx_countys` VALUES ('319', '24', '2', '延安', '1', '0');
INSERT INTO `fx_countys` VALUES ('320', '24', '2', '榆林', '1', '0');
INSERT INTO `fx_countys` VALUES ('321', '25', '2', '上海', '1', '0');
INSERT INTO `fx_countys` VALUES ('322', '26', '2', '成都', '1', '0');
INSERT INTO `fx_countys` VALUES ('323', '26', '2', '绵阳', '1', '0');
INSERT INTO `fx_countys` VALUES ('324', '26', '2', '阿坝', '1', '0');
INSERT INTO `fx_countys` VALUES ('325', '26', '2', '巴中', '1', '0');
INSERT INTO `fx_countys` VALUES ('326', '26', '2', '达州', '1', '0');
INSERT INTO `fx_countys` VALUES ('327', '26', '2', '德阳', '1', '0');
INSERT INTO `fx_countys` VALUES ('328', '26', '2', '甘孜', '1', '0');
INSERT INTO `fx_countys` VALUES ('329', '26', '2', '广安', '1', '0');
INSERT INTO `fx_countys` VALUES ('330', '26', '2', '广元', '1', '0');
INSERT INTO `fx_countys` VALUES ('331', '26', '2', '乐山', '1', '0');
INSERT INTO `fx_countys` VALUES ('332', '26', '2', '凉山', '1', '0');
INSERT INTO `fx_countys` VALUES ('333', '26', '2', '眉山', '1', '0');
INSERT INTO `fx_countys` VALUES ('334', '26', '2', '南充', '1', '0');
INSERT INTO `fx_countys` VALUES ('335', '26', '2', '内江', '1', '0');
INSERT INTO `fx_countys` VALUES ('336', '26', '2', '攀枝花', '1', '0');
INSERT INTO `fx_countys` VALUES ('337', '26', '2', '遂宁', '1', '0');
INSERT INTO `fx_countys` VALUES ('338', '26', '2', '雅安', '1', '0');
INSERT INTO `fx_countys` VALUES ('339', '26', '2', '宜宾', '1', '0');
INSERT INTO `fx_countys` VALUES ('340', '26', '2', '资阳', '1', '0');
INSERT INTO `fx_countys` VALUES ('341', '26', '2', '自贡', '1', '0');
INSERT INTO `fx_countys` VALUES ('342', '26', '2', '泸州', '1', '0');
INSERT INTO `fx_countys` VALUES ('343', '27', '2', '天津', '1', '0');
INSERT INTO `fx_countys` VALUES ('344', '28', '2', '拉萨', '1', '0');
INSERT INTO `fx_countys` VALUES ('345', '28', '2', '阿里', '1', '0');
INSERT INTO `fx_countys` VALUES ('346', '28', '2', '昌都', '1', '0');
INSERT INTO `fx_countys` VALUES ('347', '28', '2', '林芝', '1', '0');
INSERT INTO `fx_countys` VALUES ('348', '28', '2', '那曲', '1', '0');
INSERT INTO `fx_countys` VALUES ('349', '28', '2', '日喀则', '1', '0');
INSERT INTO `fx_countys` VALUES ('350', '28', '2', '山南', '1', '0');
INSERT INTO `fx_countys` VALUES ('351', '29', '2', '乌鲁木齐', '1', '0');
INSERT INTO `fx_countys` VALUES ('352', '29', '2', '阿克苏', '1', '0');
INSERT INTO `fx_countys` VALUES ('353', '29', '2', '阿拉尔', '1', '0');
INSERT INTO `fx_countys` VALUES ('354', '29', '2', '巴音郭楞', '1', '0');
INSERT INTO `fx_countys` VALUES ('355', '29', '2', '博尔塔拉', '1', '0');
INSERT INTO `fx_countys` VALUES ('356', '29', '2', '昌吉', '1', '0');
INSERT INTO `fx_countys` VALUES ('357', '29', '2', '哈密', '1', '0');
INSERT INTO `fx_countys` VALUES ('358', '29', '2', '和田', '1', '0');
INSERT INTO `fx_countys` VALUES ('359', '29', '2', '喀什', '1', '0');
INSERT INTO `fx_countys` VALUES ('360', '29', '2', '克拉玛依', '1', '0');
INSERT INTO `fx_countys` VALUES ('361', '29', '2', '克孜勒苏', '1', '0');
INSERT INTO `fx_countys` VALUES ('362', '29', '2', '石河子', '1', '0');
INSERT INTO `fx_countys` VALUES ('363', '29', '2', '图木舒克', '1', '0');
INSERT INTO `fx_countys` VALUES ('364', '29', '2', '吐鲁番', '1', '0');
INSERT INTO `fx_countys` VALUES ('365', '29', '2', '五家渠', '1', '0');
INSERT INTO `fx_countys` VALUES ('366', '29', '2', '伊犁', '1', '0');
INSERT INTO `fx_countys` VALUES ('367', '30', '2', '昆明', '1', '0');
INSERT INTO `fx_countys` VALUES ('368', '30', '2', '怒江', '1', '0');
INSERT INTO `fx_countys` VALUES ('369', '30', '2', '普洱', '1', '0');
INSERT INTO `fx_countys` VALUES ('370', '30', '2', '丽江', '1', '0');
INSERT INTO `fx_countys` VALUES ('371', '30', '2', '保山', '1', '0');
INSERT INTO `fx_countys` VALUES ('372', '30', '2', '楚雄', '1', '0');
INSERT INTO `fx_countys` VALUES ('373', '30', '2', '大理', '1', '0');
INSERT INTO `fx_countys` VALUES ('374', '30', '2', '德宏', '1', '0');
INSERT INTO `fx_countys` VALUES ('375', '30', '2', '迪庆', '1', '0');
INSERT INTO `fx_countys` VALUES ('376', '30', '2', '红河', '1', '0');
INSERT INTO `fx_countys` VALUES ('377', '30', '2', '临沧', '1', '0');
INSERT INTO `fx_countys` VALUES ('378', '30', '2', '曲靖', '1', '0');
INSERT INTO `fx_countys` VALUES ('379', '30', '2', '文山', '1', '0');
INSERT INTO `fx_countys` VALUES ('380', '30', '2', '西双版纳', '1', '0');
INSERT INTO `fx_countys` VALUES ('381', '30', '2', '玉溪', '1', '0');
INSERT INTO `fx_countys` VALUES ('382', '30', '2', '昭通', '1', '0');
INSERT INTO `fx_countys` VALUES ('383', '31', '2', '杭州', '1', '0');
INSERT INTO `fx_countys` VALUES ('384', '31', '2', '湖州', '1', '0');
INSERT INTO `fx_countys` VALUES ('385', '31', '2', '嘉兴', '1', '0');
INSERT INTO `fx_countys` VALUES ('386', '31', '2', '金华', '1', '0');
INSERT INTO `fx_countys` VALUES ('387', '31', '2', '丽水', '1', '0');
INSERT INTO `fx_countys` VALUES ('388', '31', '2', '宁波', '1', '0');
INSERT INTO `fx_countys` VALUES ('389', '31', '2', '绍兴', '1', '0');
INSERT INTO `fx_countys` VALUES ('390', '31', '2', '台州', '1', '0');
INSERT INTO `fx_countys` VALUES ('391', '31', '2', '温州', '1', '0');
INSERT INTO `fx_countys` VALUES ('392', '31', '2', '舟山', '1', '0');
INSERT INTO `fx_countys` VALUES ('393', '31', '2', '衢州', '1', '0');
INSERT INTO `fx_countys` VALUES ('394', '32', '2', '重庆', '1', '0');
INSERT INTO `fx_countys` VALUES ('395', '33', '2', '香港', '1', '0');
INSERT INTO `fx_countys` VALUES ('396', '34', '2', '澳门', '1', '0');
INSERT INTO `fx_countys` VALUES ('397', '35', '2', '台湾', '1', '0');
INSERT INTO `fx_countys` VALUES ('398', '36', '3', '迎江区', '1', '0');
INSERT INTO `fx_countys` VALUES ('399', '36', '3', '大观区', '1', '0');
INSERT INTO `fx_countys` VALUES ('400', '36', '3', '宜秀区', '1', '0');
INSERT INTO `fx_countys` VALUES ('401', '36', '3', '桐城市', '1', '0');
INSERT INTO `fx_countys` VALUES ('402', '36', '3', '怀宁县', '1', '0');
INSERT INTO `fx_countys` VALUES ('403', '36', '3', '枞阳县', '1', '0');
INSERT INTO `fx_countys` VALUES ('404', '36', '3', '潜山县', '1', '0');
INSERT INTO `fx_countys` VALUES ('405', '36', '3', '太湖县', '1', '0');
INSERT INTO `fx_countys` VALUES ('406', '36', '3', '宿松县', '1', '0');
INSERT INTO `fx_countys` VALUES ('407', '36', '3', '望江县', '1', '0');
INSERT INTO `fx_countys` VALUES ('408', '36', '3', '岳西县', '1', '0');
INSERT INTO `fx_countys` VALUES ('409', '37', '3', '中市区', '1', '0');
INSERT INTO `fx_countys` VALUES ('410', '37', '3', '东市区', '1', '0');
INSERT INTO `fx_countys` VALUES ('411', '37', '3', '西市区', '1', '0');
INSERT INTO `fx_countys` VALUES ('412', '37', '3', '郊区', '1', '0');
INSERT INTO `fx_countys` VALUES ('413', '37', '3', '怀远县', '1', '0');
INSERT INTO `fx_countys` VALUES ('414', '37', '3', '五河县', '1', '0');
INSERT INTO `fx_countys` VALUES ('415', '37', '3', '固镇县', '1', '0');
INSERT INTO `fx_countys` VALUES ('416', '38', '3', '居巢区', '1', '0');
INSERT INTO `fx_countys` VALUES ('417', '38', '3', '庐江县', '1', '0');
INSERT INTO `fx_countys` VALUES ('418', '38', '3', '无为县', '1', '0');
INSERT INTO `fx_countys` VALUES ('419', '38', '3', '含山县', '1', '0');
INSERT INTO `fx_countys` VALUES ('420', '38', '3', '和县', '1', '0');
INSERT INTO `fx_countys` VALUES ('421', '39', '3', '贵池区', '1', '0');
INSERT INTO `fx_countys` VALUES ('422', '39', '3', '东至县', '1', '0');
INSERT INTO `fx_countys` VALUES ('423', '39', '3', '石台县', '1', '0');
INSERT INTO `fx_countys` VALUES ('424', '39', '3', '青阳县', '1', '0');
INSERT INTO `fx_countys` VALUES ('425', '40', '3', '琅琊区', '1', '0');
INSERT INTO `fx_countys` VALUES ('426', '40', '3', '南谯区', '1', '0');
INSERT INTO `fx_countys` VALUES ('427', '40', '3', '天长市', '1', '0');
INSERT INTO `fx_countys` VALUES ('428', '40', '3', '明光市', '1', '0');
INSERT INTO `fx_countys` VALUES ('429', '40', '3', '来安县', '1', '0');
INSERT INTO `fx_countys` VALUES ('430', '40', '3', '全椒县', '1', '0');
INSERT INTO `fx_countys` VALUES ('431', '40', '3', '定远县', '1', '0');
INSERT INTO `fx_countys` VALUES ('432', '40', '3', '凤阳县', '1', '0');
INSERT INTO `fx_countys` VALUES ('433', '41', '3', '蚌山区', '1', '0');
INSERT INTO `fx_countys` VALUES ('434', '41', '3', '龙子湖区', '1', '0');
INSERT INTO `fx_countys` VALUES ('435', '41', '3', '禹会区', '1', '0');
INSERT INTO `fx_countys` VALUES ('436', '41', '3', '淮上区', '1', '0');
INSERT INTO `fx_countys` VALUES ('437', '41', '3', '颍州区', '1', '0');
INSERT INTO `fx_countys` VALUES ('438', '41', '3', '颍东区', '1', '0');
INSERT INTO `fx_countys` VALUES ('439', '41', '3', '颍泉区', '1', '0');
INSERT INTO `fx_countys` VALUES ('440', '41', '3', '界首市', '1', '0');
INSERT INTO `fx_countys` VALUES ('441', '41', '3', '临泉县', '1', '0');
INSERT INTO `fx_countys` VALUES ('442', '41', '3', '太和县', '1', '0');
INSERT INTO `fx_countys` VALUES ('443', '41', '3', '阜南县', '1', '0');
INSERT INTO `fx_countys` VALUES ('444', '41', '3', '颖上县', '1', '0');
INSERT INTO `fx_countys` VALUES ('445', '42', '3', '相山区', '1', '0');
INSERT INTO `fx_countys` VALUES ('446', '42', '3', '杜集区', '1', '0');
INSERT INTO `fx_countys` VALUES ('447', '42', '3', '烈山区', '1', '0');
INSERT INTO `fx_countys` VALUES ('448', '42', '3', '濉溪县', '1', '0');
INSERT INTO `fx_countys` VALUES ('449', '43', '3', '田家庵区', '1', '0');
INSERT INTO `fx_countys` VALUES ('450', '43', '3', '大通区', '1', '0');
INSERT INTO `fx_countys` VALUES ('451', '43', '3', '谢家集区', '1', '0');
INSERT INTO `fx_countys` VALUES ('452', '43', '3', '八公山区', '1', '0');
INSERT INTO `fx_countys` VALUES ('453', '43', '3', '潘集区', '1', '0');
INSERT INTO `fx_countys` VALUES ('454', '43', '3', '凤台县', '1', '0');
INSERT INTO `fx_countys` VALUES ('455', '44', '3', '屯溪区', '1', '0');
INSERT INTO `fx_countys` VALUES ('456', '44', '3', '黄山区', '1', '0');
INSERT INTO `fx_countys` VALUES ('457', '44', '3', '徽州区', '1', '0');
INSERT INTO `fx_countys` VALUES ('458', '44', '3', '歙县', '1', '0');
INSERT INTO `fx_countys` VALUES ('459', '44', '3', '休宁县', '1', '0');
INSERT INTO `fx_countys` VALUES ('460', '44', '3', '黟县', '1', '0');
INSERT INTO `fx_countys` VALUES ('461', '44', '3', '祁门县', '1', '0');
INSERT INTO `fx_countys` VALUES ('462', '45', '3', '金安区', '1', '0');
INSERT INTO `fx_countys` VALUES ('463', '45', '3', '裕安区', '1', '0');
INSERT INTO `fx_countys` VALUES ('464', '45', '3', '寿县', '1', '0');
INSERT INTO `fx_countys` VALUES ('465', '45', '3', '霍邱县', '1', '0');
INSERT INTO `fx_countys` VALUES ('466', '45', '3', '舒城县', '1', '0');
INSERT INTO `fx_countys` VALUES ('467', '45', '3', '金寨县', '1', '0');
INSERT INTO `fx_countys` VALUES ('468', '45', '3', '霍山县', '1', '0');
INSERT INTO `fx_countys` VALUES ('469', '46', '3', '雨山区', '1', '0');
INSERT INTO `fx_countys` VALUES ('470', '46', '3', '花山区', '1', '0');
INSERT INTO `fx_countys` VALUES ('471', '46', '3', '金家庄区', '1', '0');
INSERT INTO `fx_countys` VALUES ('472', '46', '3', '当涂县', '1', '0');
INSERT INTO `fx_countys` VALUES ('473', '47', '3', '埇桥区', '1', '0');
INSERT INTO `fx_countys` VALUES ('474', '47', '3', '砀山县', '1', '0');
INSERT INTO `fx_countys` VALUES ('475', '47', '3', '萧县', '1', '0');
INSERT INTO `fx_countys` VALUES ('476', '47', '3', '灵璧县', '1', '0');
INSERT INTO `fx_countys` VALUES ('477', '47', '3', '泗县', '1', '0');
INSERT INTO `fx_countys` VALUES ('478', '48', '3', '铜官山区', '1', '0');
INSERT INTO `fx_countys` VALUES ('479', '48', '3', '狮子山区', '1', '0');
INSERT INTO `fx_countys` VALUES ('480', '48', '3', '郊区', '1', '0');
INSERT INTO `fx_countys` VALUES ('481', '48', '3', '铜陵县', '1', '0');
INSERT INTO `fx_countys` VALUES ('482', '49', '3', '镜湖区', '1', '0');
INSERT INTO `fx_countys` VALUES ('483', '49', '3', '弋江区', '1', '0');
INSERT INTO `fx_countys` VALUES ('484', '49', '3', '鸠江区', '1', '0');
INSERT INTO `fx_countys` VALUES ('485', '49', '3', '三山区', '1', '0');
INSERT INTO `fx_countys` VALUES ('486', '49', '3', '芜湖县', '1', '0');
INSERT INTO `fx_countys` VALUES ('487', '49', '3', '繁昌县', '1', '0');
INSERT INTO `fx_countys` VALUES ('488', '49', '3', '南陵县', '1', '0');
INSERT INTO `fx_countys` VALUES ('489', '50', '3', '宣州区', '1', '0');
INSERT INTO `fx_countys` VALUES ('490', '50', '3', '宁国市', '1', '0');
INSERT INTO `fx_countys` VALUES ('491', '50', '3', '郎溪县', '1', '0');
INSERT INTO `fx_countys` VALUES ('492', '50', '3', '广德县', '1', '0');
INSERT INTO `fx_countys` VALUES ('493', '50', '3', '泾县', '1', '0');
INSERT INTO `fx_countys` VALUES ('494', '50', '3', '绩溪县', '1', '0');
INSERT INTO `fx_countys` VALUES ('495', '50', '3', '旌德县', '1', '0');
INSERT INTO `fx_countys` VALUES ('496', '51', '3', '涡阳县', '1', '0');
INSERT INTO `fx_countys` VALUES ('497', '51', '3', '蒙城县', '1', '0');
INSERT INTO `fx_countys` VALUES ('498', '51', '3', '利辛县', '1', '0');
INSERT INTO `fx_countys` VALUES ('499', '51', '3', '谯城区', '1', '0');
INSERT INTO `fx_countys` VALUES ('500', '52', '3', '东城区', '1', '0');
INSERT INTO `fx_countys` VALUES ('501', '52', '3', '西城区', '1', '0');
INSERT INTO `fx_countys` VALUES ('502', '52', '3', '海淀区', '1', '0');
INSERT INTO `fx_countys` VALUES ('503', '52', '3', '朝阳区', '1', '0');
INSERT INTO `fx_countys` VALUES ('504', '52', '3', '崇文区', '1', '0');
INSERT INTO `fx_countys` VALUES ('505', '52', '3', '宣武区', '1', '0');
INSERT INTO `fx_countys` VALUES ('506', '52', '3', '丰台区', '1', '0');
INSERT INTO `fx_countys` VALUES ('507', '52', '3', '石景山区', '1', '0');
INSERT INTO `fx_countys` VALUES ('508', '52', '3', '房山区', '1', '0');
INSERT INTO `fx_countys` VALUES ('509', '52', '3', '门头沟区', '1', '0');
INSERT INTO `fx_countys` VALUES ('510', '52', '3', '通州区', '1', '0');
INSERT INTO `fx_countys` VALUES ('511', '52', '3', '顺义区', '1', '0');
INSERT INTO `fx_countys` VALUES ('512', '52', '3', '昌平区', '1', '0');
INSERT INTO `fx_countys` VALUES ('513', '52', '3', '怀柔区', '1', '0');
INSERT INTO `fx_countys` VALUES ('514', '52', '3', '平谷区', '1', '0');
INSERT INTO `fx_countys` VALUES ('515', '52', '3', '大兴区', '1', '0');
INSERT INTO `fx_countys` VALUES ('516', '52', '3', '密云县', '1', '0');
INSERT INTO `fx_countys` VALUES ('517', '52', '3', '延庆县', '1', '0');
INSERT INTO `fx_countys` VALUES ('518', '53', '3', '鼓楼区', '1', '0');
INSERT INTO `fx_countys` VALUES ('519', '53', '3', '台江区', '1', '0');
INSERT INTO `fx_countys` VALUES ('520', '53', '3', '仓山区', '1', '0');
INSERT INTO `fx_countys` VALUES ('521', '53', '3', '马尾区', '1', '0');
INSERT INTO `fx_countys` VALUES ('522', '53', '3', '晋安区', '1', '0');
INSERT INTO `fx_countys` VALUES ('523', '53', '3', '福清市', '1', '0');
INSERT INTO `fx_countys` VALUES ('524', '53', '3', '长乐市', '1', '0');
INSERT INTO `fx_countys` VALUES ('525', '53', '3', '闽侯县', '1', '0');
INSERT INTO `fx_countys` VALUES ('526', '53', '3', '连江县', '1', '0');
INSERT INTO `fx_countys` VALUES ('527', '53', '3', '罗源县', '1', '0');
INSERT INTO `fx_countys` VALUES ('528', '53', '3', '闽清县', '1', '0');
INSERT INTO `fx_countys` VALUES ('529', '53', '3', '永泰县', '1', '0');
INSERT INTO `fx_countys` VALUES ('530', '53', '3', '平潭县', '1', '0');
INSERT INTO `fx_countys` VALUES ('531', '54', '3', '新罗区', '1', '0');
INSERT INTO `fx_countys` VALUES ('532', '54', '3', '漳平市', '1', '0');
INSERT INTO `fx_countys` VALUES ('533', '54', '3', '长汀县', '1', '0');
INSERT INTO `fx_countys` VALUES ('534', '54', '3', '永定县', '1', '0');
INSERT INTO `fx_countys` VALUES ('535', '54', '3', '上杭县', '1', '0');
INSERT INTO `fx_countys` VALUES ('536', '54', '3', '武平县', '1', '0');
INSERT INTO `fx_countys` VALUES ('537', '54', '3', '连城县', '1', '0');
INSERT INTO `fx_countys` VALUES ('538', '55', '3', '延平区', '1', '0');
INSERT INTO `fx_countys` VALUES ('539', '55', '3', '邵武市', '1', '0');
INSERT INTO `fx_countys` VALUES ('540', '55', '3', '武夷山市', '1', '0');
INSERT INTO `fx_countys` VALUES ('541', '55', '3', '建瓯市', '1', '0');
INSERT INTO `fx_countys` VALUES ('542', '55', '3', '建阳市', '1', '0');
INSERT INTO `fx_countys` VALUES ('543', '55', '3', '顺昌县', '1', '0');
INSERT INTO `fx_countys` VALUES ('544', '55', '3', '浦城县', '1', '0');
INSERT INTO `fx_countys` VALUES ('545', '55', '3', '光泽县', '1', '0');
INSERT INTO `fx_countys` VALUES ('546', '55', '3', '松溪县', '1', '0');
INSERT INTO `fx_countys` VALUES ('547', '55', '3', '政和县', '1', '0');
INSERT INTO `fx_countys` VALUES ('548', '56', '3', '蕉城区', '1', '0');
INSERT INTO `fx_countys` VALUES ('549', '56', '3', '福安市', '1', '0');
INSERT INTO `fx_countys` VALUES ('550', '56', '3', '福鼎市', '1', '0');
INSERT INTO `fx_countys` VALUES ('551', '56', '3', '霞浦县', '1', '0');
INSERT INTO `fx_countys` VALUES ('552', '56', '3', '古田县', '1', '0');
INSERT INTO `fx_countys` VALUES ('553', '56', '3', '屏南县', '1', '0');
INSERT INTO `fx_countys` VALUES ('554', '56', '3', '寿宁县', '1', '0');
INSERT INTO `fx_countys` VALUES ('555', '56', '3', '周宁县', '1', '0');
INSERT INTO `fx_countys` VALUES ('556', '56', '3', '柘荣县', '1', '0');
INSERT INTO `fx_countys` VALUES ('557', '57', '3', '城厢区', '1', '0');
INSERT INTO `fx_countys` VALUES ('558', '57', '3', '涵江区', '1', '0');
INSERT INTO `fx_countys` VALUES ('559', '57', '3', '荔城区', '1', '0');
INSERT INTO `fx_countys` VALUES ('560', '57', '3', '秀屿区', '1', '0');
INSERT INTO `fx_countys` VALUES ('561', '57', '3', '仙游县', '1', '0');
INSERT INTO `fx_countys` VALUES ('562', '58', '3', '鲤城区', '1', '0');
INSERT INTO `fx_countys` VALUES ('563', '58', '3', '丰泽区', '1', '0');
INSERT INTO `fx_countys` VALUES ('564', '58', '3', '洛江区', '1', '0');
INSERT INTO `fx_countys` VALUES ('565', '58', '3', '清濛开发区', '1', '0');
INSERT INTO `fx_countys` VALUES ('566', '58', '3', '泉港区', '1', '0');
INSERT INTO `fx_countys` VALUES ('567', '58', '3', '石狮市', '1', '0');
INSERT INTO `fx_countys` VALUES ('568', '58', '3', '晋江市', '1', '0');
INSERT INTO `fx_countys` VALUES ('569', '58', '3', '南安市', '1', '0');
INSERT INTO `fx_countys` VALUES ('570', '58', '3', '惠安县', '1', '0');
INSERT INTO `fx_countys` VALUES ('571', '58', '3', '安溪县', '1', '0');
INSERT INTO `fx_countys` VALUES ('572', '58', '3', '永春县', '1', '0');
INSERT INTO `fx_countys` VALUES ('573', '58', '3', '德化县', '1', '0');
INSERT INTO `fx_countys` VALUES ('574', '58', '3', '金门县', '1', '0');
INSERT INTO `fx_countys` VALUES ('575', '59', '3', '梅列区', '1', '0');
INSERT INTO `fx_countys` VALUES ('576', '59', '3', '三元区', '1', '0');
INSERT INTO `fx_countys` VALUES ('577', '59', '3', '永安市', '1', '0');
INSERT INTO `fx_countys` VALUES ('578', '59', '3', '明溪县', '1', '0');
INSERT INTO `fx_countys` VALUES ('579', '59', '3', '清流县', '1', '0');
INSERT INTO `fx_countys` VALUES ('580', '59', '3', '宁化县', '1', '0');
INSERT INTO `fx_countys` VALUES ('581', '59', '3', '大田县', '1', '0');
INSERT INTO `fx_countys` VALUES ('582', '59', '3', '尤溪县', '1', '0');
INSERT INTO `fx_countys` VALUES ('583', '59', '3', '沙县', '1', '0');
INSERT INTO `fx_countys` VALUES ('584', '59', '3', '将乐县', '1', '0');
INSERT INTO `fx_countys` VALUES ('585', '59', '3', '泰宁县', '1', '0');
INSERT INTO `fx_countys` VALUES ('586', '59', '3', '建宁县', '1', '0');
INSERT INTO `fx_countys` VALUES ('587', '60', '3', '思明区', '1', '0');
INSERT INTO `fx_countys` VALUES ('588', '60', '3', '海沧区', '1', '0');
INSERT INTO `fx_countys` VALUES ('589', '60', '3', '湖里区', '1', '0');
INSERT INTO `fx_countys` VALUES ('590', '60', '3', '集美区', '1', '0');
INSERT INTO `fx_countys` VALUES ('591', '60', '3', '同安区', '1', '0');
INSERT INTO `fx_countys` VALUES ('592', '60', '3', '翔安区', '1', '0');
INSERT INTO `fx_countys` VALUES ('593', '61', '3', '芗城区', '1', '0');
INSERT INTO `fx_countys` VALUES ('594', '61', '3', '龙文区', '1', '0');
INSERT INTO `fx_countys` VALUES ('595', '61', '3', '龙海市', '1', '0');
INSERT INTO `fx_countys` VALUES ('596', '61', '3', '云霄县', '1', '0');
INSERT INTO `fx_countys` VALUES ('597', '61', '3', '漳浦县', '1', '0');
INSERT INTO `fx_countys` VALUES ('598', '61', '3', '诏安县', '1', '0');
INSERT INTO `fx_countys` VALUES ('599', '61', '3', '长泰县', '1', '0');
INSERT INTO `fx_countys` VALUES ('600', '61', '3', '东山县', '1', '0');
INSERT INTO `fx_countys` VALUES ('601', '61', '3', '南靖县', '1', '0');
INSERT INTO `fx_countys` VALUES ('602', '61', '3', '平和县', '1', '0');
INSERT INTO `fx_countys` VALUES ('603', '61', '3', '华安县', '1', '0');
INSERT INTO `fx_countys` VALUES ('604', '62', '3', '皋兰县', '1', '0');
INSERT INTO `fx_countys` VALUES ('605', '62', '3', '城关区', '1', '0');
INSERT INTO `fx_countys` VALUES ('606', '62', '3', '七里河区', '1', '0');
INSERT INTO `fx_countys` VALUES ('607', '62', '3', '西固区', '1', '0');
INSERT INTO `fx_countys` VALUES ('608', '62', '3', '安宁区', '1', '0');
INSERT INTO `fx_countys` VALUES ('609', '62', '3', '红古区', '1', '0');
INSERT INTO `fx_countys` VALUES ('610', '62', '3', '永登县', '1', '0');
INSERT INTO `fx_countys` VALUES ('611', '62', '3', '榆中县', '1', '0');
INSERT INTO `fx_countys` VALUES ('612', '63', '3', '白银区', '1', '0');
INSERT INTO `fx_countys` VALUES ('613', '63', '3', '平川区', '1', '0');
INSERT INTO `fx_countys` VALUES ('614', '63', '3', '会宁县', '1', '0');
INSERT INTO `fx_countys` VALUES ('615', '63', '3', '景泰县', '1', '0');
INSERT INTO `fx_countys` VALUES ('616', '63', '3', '靖远县', '1', '0');
INSERT INTO `fx_countys` VALUES ('617', '64', '3', '临洮县', '1', '0');
INSERT INTO `fx_countys` VALUES ('618', '64', '3', '陇西县', '1', '0');
INSERT INTO `fx_countys` VALUES ('619', '64', '3', '通渭县', '1', '0');
INSERT INTO `fx_countys` VALUES ('620', '64', '3', '渭源县', '1', '0');
INSERT INTO `fx_countys` VALUES ('621', '64', '3', '漳县', '1', '0');
INSERT INTO `fx_countys` VALUES ('622', '64', '3', '岷县', '1', '0');
INSERT INTO `fx_countys` VALUES ('623', '64', '3', '安定区', '1', '0');
INSERT INTO `fx_countys` VALUES ('624', '64', '3', '安定区', '1', '0');
INSERT INTO `fx_countys` VALUES ('625', '65', '3', '合作市', '1', '0');
INSERT INTO `fx_countys` VALUES ('626', '65', '3', '临潭县', '1', '0');
INSERT INTO `fx_countys` VALUES ('627', '65', '3', '卓尼县', '1', '0');
INSERT INTO `fx_countys` VALUES ('628', '65', '3', '舟曲县', '1', '0');
INSERT INTO `fx_countys` VALUES ('629', '65', '3', '迭部县', '1', '0');
INSERT INTO `fx_countys` VALUES ('630', '65', '3', '玛曲县', '1', '0');
INSERT INTO `fx_countys` VALUES ('631', '65', '3', '碌曲县', '1', '0');
INSERT INTO `fx_countys` VALUES ('632', '65', '3', '夏河县', '1', '0');
INSERT INTO `fx_countys` VALUES ('633', '66', '3', '嘉峪关市', '1', '0');
INSERT INTO `fx_countys` VALUES ('634', '67', '3', '金川区', '1', '0');
INSERT INTO `fx_countys` VALUES ('635', '67', '3', '永昌县', '1', '0');
INSERT INTO `fx_countys` VALUES ('636', '68', '3', '肃州区', '1', '0');
INSERT INTO `fx_countys` VALUES ('637', '68', '3', '玉门市', '1', '0');
INSERT INTO `fx_countys` VALUES ('638', '68', '3', '敦煌市', '1', '0');
INSERT INTO `fx_countys` VALUES ('639', '68', '3', '金塔县', '1', '0');
INSERT INTO `fx_countys` VALUES ('640', '68', '3', '瓜州县', '1', '0');
INSERT INTO `fx_countys` VALUES ('641', '68', '3', '肃北', '1', '0');
INSERT INTO `fx_countys` VALUES ('642', '68', '3', '阿克塞', '1', '0');
INSERT INTO `fx_countys` VALUES ('643', '69', '3', '临夏市', '1', '0');
INSERT INTO `fx_countys` VALUES ('644', '69', '3', '临夏县', '1', '0');
INSERT INTO `fx_countys` VALUES ('645', '69', '3', '康乐县', '1', '0');
INSERT INTO `fx_countys` VALUES ('646', '69', '3', '永靖县', '1', '0');
INSERT INTO `fx_countys` VALUES ('647', '69', '3', '广河县', '1', '0');
INSERT INTO `fx_countys` VALUES ('648', '69', '3', '和政县', '1', '0');
INSERT INTO `fx_countys` VALUES ('649', '69', '3', '东乡族自治县', '1', '0');
INSERT INTO `fx_countys` VALUES ('650', '69', '3', '积石山', '1', '0');
INSERT INTO `fx_countys` VALUES ('651', '70', '3', '成县', '1', '0');
INSERT INTO `fx_countys` VALUES ('652', '70', '3', '徽县', '1', '0');
INSERT INTO `fx_countys` VALUES ('653', '70', '3', '康县', '1', '0');
INSERT INTO `fx_countys` VALUES ('654', '70', '3', '礼县', '1', '0');
INSERT INTO `fx_countys` VALUES ('655', '70', '3', '两当县', '1', '0');
INSERT INTO `fx_countys` VALUES ('656', '70', '3', '文县', '1', '0');
INSERT INTO `fx_countys` VALUES ('657', '70', '3', '西和县', '1', '0');
INSERT INTO `fx_countys` VALUES ('658', '70', '3', '宕昌县', '1', '0');
INSERT INTO `fx_countys` VALUES ('659', '70', '3', '武都区', '1', '0');
INSERT INTO `fx_countys` VALUES ('660', '71', '3', '崇信县', '1', '0');
INSERT INTO `fx_countys` VALUES ('661', '71', '3', '华亭县', '1', '0');
INSERT INTO `fx_countys` VALUES ('662', '71', '3', '静宁县', '1', '0');
INSERT INTO `fx_countys` VALUES ('663', '71', '3', '灵台县', '1', '0');
INSERT INTO `fx_countys` VALUES ('664', '71', '3', '崆峒区', '1', '0');
INSERT INTO `fx_countys` VALUES ('665', '71', '3', '庄浪县', '1', '0');
INSERT INTO `fx_countys` VALUES ('666', '71', '3', '泾川县', '1', '0');
INSERT INTO `fx_countys` VALUES ('667', '72', '3', '合水县', '1', '0');
INSERT INTO `fx_countys` VALUES ('668', '72', '3', '华池县', '1', '0');
INSERT INTO `fx_countys` VALUES ('669', '72', '3', '环县', '1', '0');
INSERT INTO `fx_countys` VALUES ('670', '72', '3', '宁县', '1', '0');
INSERT INTO `fx_countys` VALUES ('671', '72', '3', '庆城县', '1', '0');
INSERT INTO `fx_countys` VALUES ('672', '72', '3', '西峰区', '1', '0');
INSERT INTO `fx_countys` VALUES ('673', '72', '3', '镇原县', '1', '0');
INSERT INTO `fx_countys` VALUES ('674', '72', '3', '正宁县', '1', '0');
INSERT INTO `fx_countys` VALUES ('675', '73', '3', '甘谷县', '1', '0');
INSERT INTO `fx_countys` VALUES ('676', '73', '3', '秦安县', '1', '0');
INSERT INTO `fx_countys` VALUES ('677', '73', '3', '清水县', '1', '0');
INSERT INTO `fx_countys` VALUES ('678', '73', '3', '秦州区', '1', '0');
INSERT INTO `fx_countys` VALUES ('679', '73', '3', '麦积区', '1', '0');
INSERT INTO `fx_countys` VALUES ('680', '73', '3', '武山县', '1', '0');
INSERT INTO `fx_countys` VALUES ('681', '73', '3', '张家川', '1', '0');
INSERT INTO `fx_countys` VALUES ('682', '74', '3', '古浪县', '1', '0');
INSERT INTO `fx_countys` VALUES ('683', '74', '3', '民勤县', '1', '0');
INSERT INTO `fx_countys` VALUES ('684', '74', '3', '天祝', '1', '0');
INSERT INTO `fx_countys` VALUES ('685', '74', '3', '凉州区', '1', '0');
INSERT INTO `fx_countys` VALUES ('686', '75', '3', '高台县', '1', '0');
INSERT INTO `fx_countys` VALUES ('687', '75', '3', '临泽县', '1', '0');
INSERT INTO `fx_countys` VALUES ('688', '75', '3', '民乐县', '1', '0');
INSERT INTO `fx_countys` VALUES ('689', '75', '3', '山丹县', '1', '0');
INSERT INTO `fx_countys` VALUES ('690', '75', '3', '肃南', '1', '0');
INSERT INTO `fx_countys` VALUES ('691', '75', '3', '甘州区', '1', '0');
INSERT INTO `fx_countys` VALUES ('692', '76', '3', '从化市', '1', '0');
INSERT INTO `fx_countys` VALUES ('693', '76', '3', '天河区', '1', '0');
INSERT INTO `fx_countys` VALUES ('694', '76', '3', '东山区', '1', '0');
INSERT INTO `fx_countys` VALUES ('695', '76', '3', '白云区', '1', '0');
INSERT INTO `fx_countys` VALUES ('696', '76', '3', '海珠区', '1', '0');
INSERT INTO `fx_countys` VALUES ('697', '76', '3', '荔湾区', '1', '0');
INSERT INTO `fx_countys` VALUES ('698', '76', '3', '越秀区', '1', '0');
INSERT INTO `fx_countys` VALUES ('699', '76', '3', '黄埔区', '1', '0');
INSERT INTO `fx_countys` VALUES ('700', '76', '3', '番禺区', '1', '0');
INSERT INTO `fx_countys` VALUES ('701', '76', '3', '花都区', '1', '0');
INSERT INTO `fx_countys` VALUES ('702', '76', '3', '增城区', '1', '0');
INSERT INTO `fx_countys` VALUES ('703', '76', '3', '从化区', '1', '0');
INSERT INTO `fx_countys` VALUES ('704', '76', '3', '市郊', '1', '0');
INSERT INTO `fx_countys` VALUES ('705', '77', '3', '福田区', '1', '0');
INSERT INTO `fx_countys` VALUES ('706', '77', '3', '罗湖区', '1', '0');
INSERT INTO `fx_countys` VALUES ('707', '77', '3', '南山区', '1', '0');
INSERT INTO `fx_countys` VALUES ('708', '77', '3', '宝安区', '1', '0');
INSERT INTO `fx_countys` VALUES ('709', '77', '3', '龙岗区', '1', '0');
INSERT INTO `fx_countys` VALUES ('710', '77', '3', '盐田区', '1', '0');
INSERT INTO `fx_countys` VALUES ('711', '78', '3', '湘桥区', '1', '0');
INSERT INTO `fx_countys` VALUES ('712', '78', '3', '潮安县', '1', '0');
INSERT INTO `fx_countys` VALUES ('713', '78', '3', '饶平县', '1', '0');
INSERT INTO `fx_countys` VALUES ('714', '79', '3', '南城区', '1', '0');
INSERT INTO `fx_countys` VALUES ('715', '79', '3', '东城区', '1', '0');
INSERT INTO `fx_countys` VALUES ('716', '79', '3', '万江区', '1', '0');
INSERT INTO `fx_countys` VALUES ('717', '79', '3', '莞城区', '1', '0');
INSERT INTO `fx_countys` VALUES ('718', '79', '3', '石龙镇', '1', '0');
INSERT INTO `fx_countys` VALUES ('719', '79', '3', '虎门镇', '1', '0');
INSERT INTO `fx_countys` VALUES ('720', '79', '3', '麻涌镇', '1', '0');
INSERT INTO `fx_countys` VALUES ('721', '79', '3', '道滘镇', '1', '0');
INSERT INTO `fx_countys` VALUES ('722', '79', '3', '石碣镇', '1', '0');
INSERT INTO `fx_countys` VALUES ('723', '79', '3', '沙田镇', '1', '0');
INSERT INTO `fx_countys` VALUES ('724', '79', '3', '望牛墩镇', '1', '0');
INSERT INTO `fx_countys` VALUES ('725', '79', '3', '洪梅镇', '1', '0');
INSERT INTO `fx_countys` VALUES ('726', '79', '3', '茶山镇', '1', '0');
INSERT INTO `fx_countys` VALUES ('727', '79', '3', '寮步镇', '1', '0');
INSERT INTO `fx_countys` VALUES ('728', '79', '3', '大岭山镇', '1', '0');
INSERT INTO `fx_countys` VALUES ('729', '79', '3', '大朗镇', '1', '0');
INSERT INTO `fx_countys` VALUES ('730', '79', '3', '黄江镇', '1', '0');
INSERT INTO `fx_countys` VALUES ('731', '79', '3', '樟木头', '1', '0');
INSERT INTO `fx_countys` VALUES ('732', '79', '3', '凤岗镇', '1', '0');
INSERT INTO `fx_countys` VALUES ('733', '79', '3', '塘厦镇', '1', '0');
INSERT INTO `fx_countys` VALUES ('734', '79', '3', '谢岗镇', '1', '0');
INSERT INTO `fx_countys` VALUES ('735', '79', '3', '厚街镇', '1', '0');
INSERT INTO `fx_countys` VALUES ('736', '79', '3', '清溪镇', '1', '0');
INSERT INTO `fx_countys` VALUES ('737', '79', '3', '常平镇', '1', '0');
INSERT INTO `fx_countys` VALUES ('738', '79', '3', '桥头镇', '1', '0');
INSERT INTO `fx_countys` VALUES ('739', '79', '3', '横沥镇', '1', '0');
INSERT INTO `fx_countys` VALUES ('740', '79', '3', '东坑镇', '1', '0');
INSERT INTO `fx_countys` VALUES ('741', '79', '3', '企石镇', '1', '0');
INSERT INTO `fx_countys` VALUES ('742', '79', '3', '石排镇', '1', '0');
INSERT INTO `fx_countys` VALUES ('743', '79', '3', '长安镇', '1', '0');
INSERT INTO `fx_countys` VALUES ('744', '79', '3', '中堂镇', '1', '0');
INSERT INTO `fx_countys` VALUES ('745', '79', '3', '高埗镇', '1', '0');
INSERT INTO `fx_countys` VALUES ('746', '80', '3', '禅城区', '1', '0');
INSERT INTO `fx_countys` VALUES ('747', '80', '3', '南海区', '1', '0');
INSERT INTO `fx_countys` VALUES ('748', '80', '3', '顺德区', '1', '0');
INSERT INTO `fx_countys` VALUES ('749', '80', '3', '三水区', '1', '0');
INSERT INTO `fx_countys` VALUES ('750', '80', '3', '高明区', '1', '0');
INSERT INTO `fx_countys` VALUES ('751', '81', '3', '东源县', '1', '0');
INSERT INTO `fx_countys` VALUES ('752', '81', '3', '和平县', '1', '0');
INSERT INTO `fx_countys` VALUES ('753', '81', '3', '源城区', '1', '0');
INSERT INTO `fx_countys` VALUES ('754', '81', '3', '连平县', '1', '0');
INSERT INTO `fx_countys` VALUES ('755', '81', '3', '龙川县', '1', '0');
INSERT INTO `fx_countys` VALUES ('756', '81', '3', '紫金县', '1', '0');
INSERT INTO `fx_countys` VALUES ('757', '82', '3', '惠阳区', '1', '0');
INSERT INTO `fx_countys` VALUES ('758', '82', '3', '惠城区', '1', '0');
INSERT INTO `fx_countys` VALUES ('759', '82', '3', '大亚湾', '1', '0');
INSERT INTO `fx_countys` VALUES ('760', '82', '3', '博罗县', '1', '0');
INSERT INTO `fx_countys` VALUES ('761', '82', '3', '惠东县', '1', '0');
INSERT INTO `fx_countys` VALUES ('762', '82', '3', '龙门县', '1', '0');
INSERT INTO `fx_countys` VALUES ('763', '83', '3', '江海区', '1', '0');
INSERT INTO `fx_countys` VALUES ('764', '83', '3', '蓬江区', '1', '0');
INSERT INTO `fx_countys` VALUES ('765', '83', '3', '新会区', '1', '0');
INSERT INTO `fx_countys` VALUES ('766', '83', '3', '台山市', '1', '0');
INSERT INTO `fx_countys` VALUES ('767', '83', '3', '开平市', '1', '0');
INSERT INTO `fx_countys` VALUES ('768', '83', '3', '鹤山市', '1', '0');
INSERT INTO `fx_countys` VALUES ('769', '83', '3', '恩平市', '1', '0');
INSERT INTO `fx_countys` VALUES ('770', '84', '3', '榕城区', '1', '0');
INSERT INTO `fx_countys` VALUES ('771', '84', '3', '普宁市', '1', '0');
INSERT INTO `fx_countys` VALUES ('772', '84', '3', '揭东县', '1', '0');
INSERT INTO `fx_countys` VALUES ('773', '84', '3', '揭西县', '1', '0');
INSERT INTO `fx_countys` VALUES ('774', '84', '3', '惠来县', '1', '0');
INSERT INTO `fx_countys` VALUES ('775', '85', '3', '茂南区', '1', '0');
INSERT INTO `fx_countys` VALUES ('776', '85', '3', '茂港区', '1', '0');
INSERT INTO `fx_countys` VALUES ('777', '85', '3', '高州市', '1', '0');
INSERT INTO `fx_countys` VALUES ('778', '85', '3', '化州市', '1', '0');
INSERT INTO `fx_countys` VALUES ('779', '85', '3', '信宜市', '1', '0');
INSERT INTO `fx_countys` VALUES ('780', '85', '3', '电白县', '1', '0');
INSERT INTO `fx_countys` VALUES ('781', '86', '3', '梅县', '1', '0');
INSERT INTO `fx_countys` VALUES ('782', '86', '3', '梅江区', '1', '0');
INSERT INTO `fx_countys` VALUES ('783', '86', '3', '兴宁市', '1', '0');
INSERT INTO `fx_countys` VALUES ('784', '86', '3', '大埔县', '1', '0');
INSERT INTO `fx_countys` VALUES ('785', '86', '3', '丰顺县', '1', '0');
INSERT INTO `fx_countys` VALUES ('786', '86', '3', '五华县', '1', '0');
INSERT INTO `fx_countys` VALUES ('787', '86', '3', '平远县', '1', '0');
INSERT INTO `fx_countys` VALUES ('788', '86', '3', '蕉岭县', '1', '0');
INSERT INTO `fx_countys` VALUES ('789', '87', '3', '清城区', '1', '0');
INSERT INTO `fx_countys` VALUES ('790', '87', '3', '英德市', '1', '0');
INSERT INTO `fx_countys` VALUES ('791', '87', '3', '连州市', '1', '0');
INSERT INTO `fx_countys` VALUES ('792', '87', '3', '佛冈县', '1', '0');
INSERT INTO `fx_countys` VALUES ('793', '87', '3', '阳山县', '1', '0');
INSERT INTO `fx_countys` VALUES ('794', '87', '3', '清新县', '1', '0');
INSERT INTO `fx_countys` VALUES ('795', '87', '3', '连山', '1', '0');
INSERT INTO `fx_countys` VALUES ('796', '87', '3', '连南', '1', '0');
INSERT INTO `fx_countys` VALUES ('797', '88', '3', '南澳县', '1', '0');
INSERT INTO `fx_countys` VALUES ('798', '88', '3', '潮阳区', '1', '0');
INSERT INTO `fx_countys` VALUES ('799', '88', '3', '澄海区', '1', '0');
INSERT INTO `fx_countys` VALUES ('800', '88', '3', '龙湖区', '1', '0');
INSERT INTO `fx_countys` VALUES ('801', '88', '3', '金平区', '1', '0');
INSERT INTO `fx_countys` VALUES ('802', '88', '3', '濠江区', '1', '0');
INSERT INTO `fx_countys` VALUES ('803', '88', '3', '潮南区', '1', '0');
INSERT INTO `fx_countys` VALUES ('804', '89', '3', '城区', '1', '0');
INSERT INTO `fx_countys` VALUES ('805', '89', '3', '陆丰市', '1', '0');
INSERT INTO `fx_countys` VALUES ('806', '89', '3', '海丰县', '1', '0');
INSERT INTO `fx_countys` VALUES ('807', '89', '3', '陆河县', '1', '0');
INSERT INTO `fx_countys` VALUES ('808', '90', '3', '曲江县', '1', '0');
INSERT INTO `fx_countys` VALUES ('809', '90', '3', '浈江区', '1', '0');
INSERT INTO `fx_countys` VALUES ('810', '90', '3', '武江区', '1', '0');
INSERT INTO `fx_countys` VALUES ('811', '90', '3', '曲江区', '1', '0');
INSERT INTO `fx_countys` VALUES ('812', '90', '3', '乐昌市', '1', '0');
INSERT INTO `fx_countys` VALUES ('813', '90', '3', '南雄市', '1', '0');
INSERT INTO `fx_countys` VALUES ('814', '90', '3', '始兴县', '1', '0');
INSERT INTO `fx_countys` VALUES ('815', '90', '3', '仁化县', '1', '0');
INSERT INTO `fx_countys` VALUES ('816', '90', '3', '翁源县', '1', '0');
INSERT INTO `fx_countys` VALUES ('817', '90', '3', '新丰县', '1', '0');
INSERT INTO `fx_countys` VALUES ('818', '90', '3', '乳源', '1', '0');
INSERT INTO `fx_countys` VALUES ('819', '91', '3', '江城区', '1', '0');
INSERT INTO `fx_countys` VALUES ('820', '91', '3', '阳春市', '1', '0');
INSERT INTO `fx_countys` VALUES ('821', '91', '3', '阳西县', '1', '0');
INSERT INTO `fx_countys` VALUES ('822', '91', '3', '阳东县', '1', '0');
INSERT INTO `fx_countys` VALUES ('823', '92', '3', '云城区', '1', '0');
INSERT INTO `fx_countys` VALUES ('824', '92', '3', '罗定市', '1', '0');
INSERT INTO `fx_countys` VALUES ('825', '92', '3', '新兴县', '1', '0');
INSERT INTO `fx_countys` VALUES ('826', '92', '3', '郁南县', '1', '0');
INSERT INTO `fx_countys` VALUES ('827', '92', '3', '云安县', '1', '0');
INSERT INTO `fx_countys` VALUES ('828', '93', '3', '赤坎区', '1', '0');
INSERT INTO `fx_countys` VALUES ('829', '93', '3', '霞山区', '1', '0');
INSERT INTO `fx_countys` VALUES ('830', '93', '3', '坡头区', '1', '0');
INSERT INTO `fx_countys` VALUES ('831', '93', '3', '麻章区', '1', '0');
INSERT INTO `fx_countys` VALUES ('832', '93', '3', '廉江市', '1', '0');
INSERT INTO `fx_countys` VALUES ('833', '93', '3', '雷州市', '1', '0');
INSERT INTO `fx_countys` VALUES ('834', '93', '3', '吴川市', '1', '0');
INSERT INTO `fx_countys` VALUES ('835', '93', '3', '遂溪县', '1', '0');
INSERT INTO `fx_countys` VALUES ('836', '93', '3', '徐闻县', '1', '0');
INSERT INTO `fx_countys` VALUES ('837', '94', '3', '肇庆市', '1', '0');
INSERT INTO `fx_countys` VALUES ('838', '94', '3', '高要市', '1', '0');
INSERT INTO `fx_countys` VALUES ('839', '94', '3', '四会市', '1', '0');
INSERT INTO `fx_countys` VALUES ('840', '94', '3', '广宁县', '1', '0');
INSERT INTO `fx_countys` VALUES ('841', '94', '3', '怀集县', '1', '0');
INSERT INTO `fx_countys` VALUES ('842', '94', '3', '封开县', '1', '0');
INSERT INTO `fx_countys` VALUES ('843', '94', '3', '德庆县', '1', '0');
INSERT INTO `fx_countys` VALUES ('844', '95', '3', '石岐街道', '1', '0');
INSERT INTO `fx_countys` VALUES ('845', '95', '3', '东区街道', '1', '0');
INSERT INTO `fx_countys` VALUES ('846', '95', '3', '西区街道', '1', '0');
INSERT INTO `fx_countys` VALUES ('847', '95', '3', '环城街道', '1', '0');
INSERT INTO `fx_countys` VALUES ('848', '95', '3', '中山港街道', '1', '0');
INSERT INTO `fx_countys` VALUES ('849', '95', '3', '五桂山街道', '1', '0');
INSERT INTO `fx_countys` VALUES ('850', '96', '3', '香洲区', '1', '0');
INSERT INTO `fx_countys` VALUES ('851', '96', '3', '斗门区', '1', '0');
INSERT INTO `fx_countys` VALUES ('852', '96', '3', '金湾区', '1', '0');
INSERT INTO `fx_countys` VALUES ('853', '97', '3', '邕宁区', '1', '0');
INSERT INTO `fx_countys` VALUES ('854', '97', '3', '青秀区', '1', '0');
INSERT INTO `fx_countys` VALUES ('855', '97', '3', '兴宁区', '1', '0');
INSERT INTO `fx_countys` VALUES ('856', '97', '3', '良庆区', '1', '0');
INSERT INTO `fx_countys` VALUES ('857', '97', '3', '西乡塘区', '1', '0');
INSERT INTO `fx_countys` VALUES ('858', '97', '3', '江南区', '1', '0');
INSERT INTO `fx_countys` VALUES ('859', '97', '3', '武鸣县', '1', '0');
INSERT INTO `fx_countys` VALUES ('860', '97', '3', '隆安县', '1', '0');
INSERT INTO `fx_countys` VALUES ('861', '97', '3', '马山县', '1', '0');
INSERT INTO `fx_countys` VALUES ('862', '97', '3', '上林县', '1', '0');
INSERT INTO `fx_countys` VALUES ('863', '97', '3', '宾阳县', '1', '0');
INSERT INTO `fx_countys` VALUES ('864', '97', '3', '横县', '1', '0');
INSERT INTO `fx_countys` VALUES ('865', '98', '3', '秀峰区', '1', '0');
INSERT INTO `fx_countys` VALUES ('866', '98', '3', '叠彩区', '1', '0');
INSERT INTO `fx_countys` VALUES ('867', '98', '3', '象山区', '1', '0');
INSERT INTO `fx_countys` VALUES ('868', '98', '3', '七星区', '1', '0');
INSERT INTO `fx_countys` VALUES ('869', '98', '3', '雁山区', '1', '0');
INSERT INTO `fx_countys` VALUES ('870', '98', '3', '阳朔县', '1', '0');
INSERT INTO `fx_countys` VALUES ('871', '98', '3', '临桂县', '1', '0');
INSERT INTO `fx_countys` VALUES ('872', '98', '3', '灵川县', '1', '0');
INSERT INTO `fx_countys` VALUES ('873', '98', '3', '全州县', '1', '0');
INSERT INTO `fx_countys` VALUES ('874', '98', '3', '平乐县', '1', '0');
INSERT INTO `fx_countys` VALUES ('875', '98', '3', '兴安县', '1', '0');
INSERT INTO `fx_countys` VALUES ('876', '98', '3', '灌阳县', '1', '0');
INSERT INTO `fx_countys` VALUES ('877', '98', '3', '荔浦县', '1', '0');
INSERT INTO `fx_countys` VALUES ('878', '98', '3', '资源县', '1', '0');
INSERT INTO `fx_countys` VALUES ('879', '98', '3', '永福县', '1', '0');
INSERT INTO `fx_countys` VALUES ('880', '98', '3', '龙胜', '1', '0');
INSERT INTO `fx_countys` VALUES ('881', '98', '3', '恭城', '1', '0');
INSERT INTO `fx_countys` VALUES ('882', '99', '3', '右江区', '1', '0');
INSERT INTO `fx_countys` VALUES ('883', '99', '3', '凌云县', '1', '0');
INSERT INTO `fx_countys` VALUES ('884', '99', '3', '平果县', '1', '0');
INSERT INTO `fx_countys` VALUES ('885', '99', '3', '西林县', '1', '0');
INSERT INTO `fx_countys` VALUES ('886', '99', '3', '乐业县', '1', '0');
INSERT INTO `fx_countys` VALUES ('887', '99', '3', '德保县', '1', '0');
INSERT INTO `fx_countys` VALUES ('888', '99', '3', '田林县', '1', '0');
INSERT INTO `fx_countys` VALUES ('889', '99', '3', '田阳县', '1', '0');
INSERT INTO `fx_countys` VALUES ('890', '99', '3', '靖西县', '1', '0');
INSERT INTO `fx_countys` VALUES ('891', '99', '3', '田东县', '1', '0');
INSERT INTO `fx_countys` VALUES ('892', '99', '3', '那坡县', '1', '0');
INSERT INTO `fx_countys` VALUES ('893', '99', '3', '隆林', '1', '0');
INSERT INTO `fx_countys` VALUES ('894', '100', '3', '海城区', '1', '0');
INSERT INTO `fx_countys` VALUES ('895', '100', '3', '银海区', '1', '0');
INSERT INTO `fx_countys` VALUES ('896', '100', '3', '铁山港区', '1', '0');
INSERT INTO `fx_countys` VALUES ('897', '100', '3', '合浦县', '1', '0');
INSERT INTO `fx_countys` VALUES ('898', '101', '3', '江州区', '1', '0');
INSERT INTO `fx_countys` VALUES ('899', '101', '3', '凭祥市', '1', '0');
INSERT INTO `fx_countys` VALUES ('900', '101', '3', '宁明县', '1', '0');
INSERT INTO `fx_countys` VALUES ('901', '101', '3', '扶绥县', '1', '0');
INSERT INTO `fx_countys` VALUES ('902', '101', '3', '龙州县', '1', '0');
INSERT INTO `fx_countys` VALUES ('903', '101', '3', '大新县', '1', '0');
INSERT INTO `fx_countys` VALUES ('904', '101', '3', '天等县', '1', '0');
INSERT INTO `fx_countys` VALUES ('905', '102', '3', '港口区', '1', '0');
INSERT INTO `fx_countys` VALUES ('906', '102', '3', '防城区', '1', '0');
INSERT INTO `fx_countys` VALUES ('907', '102', '3', '东兴市', '1', '0');
INSERT INTO `fx_countys` VALUES ('908', '102', '3', '上思县', '1', '0');
INSERT INTO `fx_countys` VALUES ('909', '103', '3', '港北区', '1', '0');
INSERT INTO `fx_countys` VALUES ('910', '103', '3', '港南区', '1', '0');
INSERT INTO `fx_countys` VALUES ('911', '103', '3', '覃塘区', '1', '0');
INSERT INTO `fx_countys` VALUES ('912', '103', '3', '桂平市', '1', '0');
INSERT INTO `fx_countys` VALUES ('913', '103', '3', '平南县', '1', '0');
INSERT INTO `fx_countys` VALUES ('914', '104', '3', '金城江区', '1', '0');
INSERT INTO `fx_countys` VALUES ('915', '104', '3', '宜州市', '1', '0');
INSERT INTO `fx_countys` VALUES ('916', '104', '3', '天峨县', '1', '0');
INSERT INTO `fx_countys` VALUES ('917', '104', '3', '凤山县', '1', '0');
INSERT INTO `fx_countys` VALUES ('918', '104', '3', '南丹县', '1', '0');
INSERT INTO `fx_countys` VALUES ('919', '104', '3', '东兰县', '1', '0');
INSERT INTO `fx_countys` VALUES ('920', '104', '3', '都安', '1', '0');
INSERT INTO `fx_countys` VALUES ('921', '104', '3', '罗城', '1', '0');
INSERT INTO `fx_countys` VALUES ('922', '104', '3', '巴马', '1', '0');
INSERT INTO `fx_countys` VALUES ('923', '104', '3', '环江', '1', '0');
INSERT INTO `fx_countys` VALUES ('924', '104', '3', '大化', '1', '0');
INSERT INTO `fx_countys` VALUES ('925', '105', '3', '八步区', '1', '0');
INSERT INTO `fx_countys` VALUES ('926', '105', '3', '钟山县', '1', '0');
INSERT INTO `fx_countys` VALUES ('927', '105', '3', '昭平县', '1', '0');
INSERT INTO `fx_countys` VALUES ('928', '105', '3', '富川', '1', '0');
INSERT INTO `fx_countys` VALUES ('929', '106', '3', '兴宾区', '1', '0');
INSERT INTO `fx_countys` VALUES ('930', '106', '3', '合山市', '1', '0');
INSERT INTO `fx_countys` VALUES ('931', '106', '3', '象州县', '1', '0');
INSERT INTO `fx_countys` VALUES ('932', '106', '3', '武宣县', '1', '0');
INSERT INTO `fx_countys` VALUES ('933', '106', '3', '忻城县', '1', '0');
INSERT INTO `fx_countys` VALUES ('934', '106', '3', '金秀', '1', '0');
INSERT INTO `fx_countys` VALUES ('935', '107', '3', '城中区', '1', '0');
INSERT INTO `fx_countys` VALUES ('936', '107', '3', '鱼峰区', '1', '0');
INSERT INTO `fx_countys` VALUES ('937', '107', '3', '柳北区', '1', '0');
INSERT INTO `fx_countys` VALUES ('938', '107', '3', '柳南区', '1', '0');
INSERT INTO `fx_countys` VALUES ('939', '107', '3', '柳江县', '1', '0');
INSERT INTO `fx_countys` VALUES ('940', '107', '3', '柳城县', '1', '0');
INSERT INTO `fx_countys` VALUES ('941', '107', '3', '鹿寨县', '1', '0');
INSERT INTO `fx_countys` VALUES ('942', '107', '3', '融安县', '1', '0');
INSERT INTO `fx_countys` VALUES ('943', '107', '3', '融水', '1', '0');
INSERT INTO `fx_countys` VALUES ('944', '107', '3', '三江', '1', '0');
INSERT INTO `fx_countys` VALUES ('945', '108', '3', '钦南区', '1', '0');
INSERT INTO `fx_countys` VALUES ('946', '108', '3', '钦北区', '1', '0');
INSERT INTO `fx_countys` VALUES ('947', '108', '3', '灵山县', '1', '0');
INSERT INTO `fx_countys` VALUES ('948', '108', '3', '浦北县', '1', '0');
INSERT INTO `fx_countys` VALUES ('949', '109', '3', '万秀区', '1', '0');
INSERT INTO `fx_countys` VALUES ('950', '109', '3', '蝶山区', '1', '0');
INSERT INTO `fx_countys` VALUES ('951', '109', '3', '长洲区', '1', '0');
INSERT INTO `fx_countys` VALUES ('952', '109', '3', '岑溪市', '1', '0');
INSERT INTO `fx_countys` VALUES ('953', '109', '3', '苍梧县', '1', '0');
INSERT INTO `fx_countys` VALUES ('954', '109', '3', '藤县', '1', '0');
INSERT INTO `fx_countys` VALUES ('955', '109', '3', '蒙山县', '1', '0');
INSERT INTO `fx_countys` VALUES ('956', '110', '3', '玉州区', '1', '0');
INSERT INTO `fx_countys` VALUES ('957', '110', '3', '北流市', '1', '0');
INSERT INTO `fx_countys` VALUES ('958', '110', '3', '容县', '1', '0');
INSERT INTO `fx_countys` VALUES ('959', '110', '3', '陆川县', '1', '0');
INSERT INTO `fx_countys` VALUES ('960', '110', '3', '博白县', '1', '0');
INSERT INTO `fx_countys` VALUES ('961', '110', '3', '兴业县', '1', '0');
INSERT INTO `fx_countys` VALUES ('962', '111', '3', '南明区', '1', '0');
INSERT INTO `fx_countys` VALUES ('963', '111', '3', '云岩区', '1', '0');
INSERT INTO `fx_countys` VALUES ('964', '111', '3', '花溪区', '1', '0');
INSERT INTO `fx_countys` VALUES ('965', '111', '3', '乌当区', '1', '0');
INSERT INTO `fx_countys` VALUES ('966', '111', '3', '白云区', '1', '0');
INSERT INTO `fx_countys` VALUES ('967', '111', '3', '小河区', '1', '0');
INSERT INTO `fx_countys` VALUES ('968', '111', '3', '金阳新区', '1', '0');
INSERT INTO `fx_countys` VALUES ('969', '111', '3', '新天园区', '1', '0');
INSERT INTO `fx_countys` VALUES ('970', '111', '3', '清镇市', '1', '0');
INSERT INTO `fx_countys` VALUES ('971', '111', '3', '开阳县', '1', '0');
INSERT INTO `fx_countys` VALUES ('972', '111', '3', '修文县', '1', '0');
INSERT INTO `fx_countys` VALUES ('973', '111', '3', '息烽县', '1', '0');
INSERT INTO `fx_countys` VALUES ('974', '112', '3', '西秀区', '1', '0');
INSERT INTO `fx_countys` VALUES ('975', '112', '3', '关岭', '1', '0');
INSERT INTO `fx_countys` VALUES ('976', '112', '3', '镇宁', '1', '0');
INSERT INTO `fx_countys` VALUES ('977', '112', '3', '紫云', '1', '0');
INSERT INTO `fx_countys` VALUES ('978', '112', '3', '平坝县', '1', '0');
INSERT INTO `fx_countys` VALUES ('979', '112', '3', '普定县', '1', '0');
INSERT INTO `fx_countys` VALUES ('980', '113', '3', '毕节市', '1', '0');
INSERT INTO `fx_countys` VALUES ('981', '113', '3', '大方县', '1', '0');
INSERT INTO `fx_countys` VALUES ('982', '113', '3', '黔西县', '1', '0');
INSERT INTO `fx_countys` VALUES ('983', '113', '3', '金沙县', '1', '0');
INSERT INTO `fx_countys` VALUES ('984', '113', '3', '织金县', '1', '0');
INSERT INTO `fx_countys` VALUES ('985', '113', '3', '纳雍县', '1', '0');
INSERT INTO `fx_countys` VALUES ('986', '113', '3', '赫章县', '1', '0');
INSERT INTO `fx_countys` VALUES ('987', '113', '3', '威宁', '1', '0');
INSERT INTO `fx_countys` VALUES ('988', '114', '3', '钟山区', '1', '0');
INSERT INTO `fx_countys` VALUES ('989', '114', '3', '六枝特区', '1', '0');
INSERT INTO `fx_countys` VALUES ('990', '114', '3', '水城县', '1', '0');
INSERT INTO `fx_countys` VALUES ('991', '114', '3', '盘县', '1', '0');
INSERT INTO `fx_countys` VALUES ('992', '115', '3', '凯里市', '1', '0');
INSERT INTO `fx_countys` VALUES ('993', '115', '3', '黄平县', '1', '0');
INSERT INTO `fx_countys` VALUES ('994', '115', '3', '施秉县', '1', '0');
INSERT INTO `fx_countys` VALUES ('995', '115', '3', '三穗县', '1', '0');
INSERT INTO `fx_countys` VALUES ('996', '115', '3', '镇远县', '1', '0');
INSERT INTO `fx_countys` VALUES ('997', '115', '3', '岑巩县', '1', '0');
INSERT INTO `fx_countys` VALUES ('998', '115', '3', '天柱县', '1', '0');
INSERT INTO `fx_countys` VALUES ('999', '115', '3', '锦屏县', '1', '0');
INSERT INTO `fx_countys` VALUES ('1000', '115', '3', '剑河县', '1', '0');
INSERT INTO `fx_countys` VALUES ('1001', '115', '3', '台江县', '1', '0');
INSERT INTO `fx_countys` VALUES ('1002', '115', '3', '黎平县', '1', '0');
INSERT INTO `fx_countys` VALUES ('1003', '115', '3', '榕江县', '1', '0');
INSERT INTO `fx_countys` VALUES ('1004', '115', '3', '从江县', '1', '0');
INSERT INTO `fx_countys` VALUES ('1005', '115', '3', '雷山县', '1', '0');
INSERT INTO `fx_countys` VALUES ('1006', '115', '3', '麻江县', '1', '0');
INSERT INTO `fx_countys` VALUES ('1007', '115', '3', '丹寨县', '1', '0');
INSERT INTO `fx_countys` VALUES ('1008', '116', '3', '都匀市', '1', '0');
INSERT INTO `fx_countys` VALUES ('1009', '116', '3', '福泉市', '1', '0');
INSERT INTO `fx_countys` VALUES ('1010', '116', '3', '荔波县', '1', '0');
INSERT INTO `fx_countys` VALUES ('1011', '116', '3', '贵定县', '1', '0');
INSERT INTO `fx_countys` VALUES ('1012', '116', '3', '瓮安县', '1', '0');
INSERT INTO `fx_countys` VALUES ('1013', '116', '3', '独山县', '1', '0');
INSERT INTO `fx_countys` VALUES ('1014', '116', '3', '平塘县', '1', '0');
INSERT INTO `fx_countys` VALUES ('1015', '116', '3', '罗甸县', '1', '0');
INSERT INTO `fx_countys` VALUES ('1016', '116', '3', '长顺县', '1', '0');
INSERT INTO `fx_countys` VALUES ('1017', '116', '3', '龙里县', '1', '0');
INSERT INTO `fx_countys` VALUES ('1018', '116', '3', '惠水县', '1', '0');
INSERT INTO `fx_countys` VALUES ('1019', '116', '3', '三都', '1', '0');
INSERT INTO `fx_countys` VALUES ('1020', '117', '3', '兴义市', '1', '0');
INSERT INTO `fx_countys` VALUES ('1021', '117', '3', '兴仁县', '1', '0');
INSERT INTO `fx_countys` VALUES ('1022', '117', '3', '普安县', '1', '0');
INSERT INTO `fx_countys` VALUES ('1023', '117', '3', '晴隆县', '1', '0');
INSERT INTO `fx_countys` VALUES ('1024', '117', '3', '贞丰县', '1', '0');
INSERT INTO `fx_countys` VALUES ('1025', '117', '3', '望谟县', '1', '0');
INSERT INTO `fx_countys` VALUES ('1026', '117', '3', '册亨县', '1', '0');
INSERT INTO `fx_countys` VALUES ('1027', '117', '3', '安龙县', '1', '0');
INSERT INTO `fx_countys` VALUES ('1028', '118', '3', '铜仁市', '1', '0');
INSERT INTO `fx_countys` VALUES ('1029', '118', '3', '江口县', '1', '0');
INSERT INTO `fx_countys` VALUES ('1030', '118', '3', '石阡县', '1', '0');
INSERT INTO `fx_countys` VALUES ('1031', '118', '3', '思南县', '1', '0');
INSERT INTO `fx_countys` VALUES ('1032', '118', '3', '德江县', '1', '0');
INSERT INTO `fx_countys` VALUES ('1033', '118', '3', '玉屏', '1', '0');
INSERT INTO `fx_countys` VALUES ('1034', '118', '3', '印江', '1', '0');
INSERT INTO `fx_countys` VALUES ('1035', '118', '3', '沿河', '1', '0');
INSERT INTO `fx_countys` VALUES ('1036', '118', '3', '松桃', '1', '0');
INSERT INTO `fx_countys` VALUES ('1037', '118', '3', '万山特区', '1', '0');
INSERT INTO `fx_countys` VALUES ('1038', '119', '3', '红花岗区', '1', '0');
INSERT INTO `fx_countys` VALUES ('1039', '119', '3', '务川县', '1', '0');
INSERT INTO `fx_countys` VALUES ('1040', '119', '3', '道真县', '1', '0');
INSERT INTO `fx_countys` VALUES ('1041', '119', '3', '汇川区', '1', '0');
INSERT INTO `fx_countys` VALUES ('1042', '119', '3', '赤水市', '1', '0');
INSERT INTO `fx_countys` VALUES ('1043', '119', '3', '仁怀市', '1', '0');
INSERT INTO `fx_countys` VALUES ('1044', '119', '3', '遵义县', '1', '0');
INSERT INTO `fx_countys` VALUES ('1045', '119', '3', '桐梓县', '1', '0');
INSERT INTO `fx_countys` VALUES ('1046', '119', '3', '绥阳县', '1', '0');
INSERT INTO `fx_countys` VALUES ('1047', '119', '3', '正安县', '1', '0');
INSERT INTO `fx_countys` VALUES ('1048', '119', '3', '凤冈县', '1', '0');
INSERT INTO `fx_countys` VALUES ('1049', '119', '3', '湄潭县', '1', '0');
INSERT INTO `fx_countys` VALUES ('1050', '119', '3', '余庆县', '1', '0');
INSERT INTO `fx_countys` VALUES ('1051', '119', '3', '习水县', '1', '0');
INSERT INTO `fx_countys` VALUES ('1052', '119', '3', '道真', '1', '0');
INSERT INTO `fx_countys` VALUES ('1053', '119', '3', '务川', '1', '0');
INSERT INTO `fx_countys` VALUES ('1054', '120', '3', '秀英区', '1', '0');
INSERT INTO `fx_countys` VALUES ('1055', '120', '3', '龙华区', '1', '0');
INSERT INTO `fx_countys` VALUES ('1056', '120', '3', '琼山区', '1', '0');
INSERT INTO `fx_countys` VALUES ('1057', '120', '3', '美兰区', '1', '0');
INSERT INTO `fx_countys` VALUES ('1058', '137', '3', '市区', '1', '0');
INSERT INTO `fx_countys` VALUES ('1059', '137', '3', '洋浦开发区', '1', '0');
INSERT INTO `fx_countys` VALUES ('1060', '137', '3', '那大镇', '1', '0');
INSERT INTO `fx_countys` VALUES ('1061', '137', '3', '王五镇', '1', '0');
INSERT INTO `fx_countys` VALUES ('1062', '137', '3', '雅星镇', '1', '0');
INSERT INTO `fx_countys` VALUES ('1063', '137', '3', '大成镇', '1', '0');
INSERT INTO `fx_countys` VALUES ('1064', '137', '3', '中和镇', '1', '0');
INSERT INTO `fx_countys` VALUES ('1065', '137', '3', '峨蔓镇', '1', '0');
INSERT INTO `fx_countys` VALUES ('1066', '137', '3', '南丰镇', '1', '0');
INSERT INTO `fx_countys` VALUES ('1067', '137', '3', '白马井镇', '1', '0');
INSERT INTO `fx_countys` VALUES ('1068', '137', '3', '兰洋镇', '1', '0');
INSERT INTO `fx_countys` VALUES ('1069', '137', '3', '和庆镇', '1', '0');
INSERT INTO `fx_countys` VALUES ('1070', '137', '3', '海头镇', '1', '0');
INSERT INTO `fx_countys` VALUES ('1071', '137', '3', '排浦镇', '1', '0');
INSERT INTO `fx_countys` VALUES ('1072', '137', '3', '东成镇', '1', '0');
INSERT INTO `fx_countys` VALUES ('1073', '137', '3', '光村镇', '1', '0');
INSERT INTO `fx_countys` VALUES ('1074', '137', '3', '木棠镇', '1', '0');
INSERT INTO `fx_countys` VALUES ('1075', '137', '3', '新州镇', '1', '0');
INSERT INTO `fx_countys` VALUES ('1076', '137', '3', '三都镇', '1', '0');
INSERT INTO `fx_countys` VALUES ('1077', '137', '3', '其他', '1', '0');
INSERT INTO `fx_countys` VALUES ('1078', '138', '3', '长安区', '1', '0');
INSERT INTO `fx_countys` VALUES ('1079', '138', '3', '桥东区', '1', '0');
INSERT INTO `fx_countys` VALUES ('1080', '138', '3', '桥西区', '1', '0');
INSERT INTO `fx_countys` VALUES ('1081', '138', '3', '新华区', '1', '0');
INSERT INTO `fx_countys` VALUES ('1082', '138', '3', '裕华区', '1', '0');
INSERT INTO `fx_countys` VALUES ('1083', '138', '3', '井陉矿区', '1', '0');
INSERT INTO `fx_countys` VALUES ('1084', '138', '3', '高新区', '1', '0');
INSERT INTO `fx_countys` VALUES ('1085', '138', '3', '辛集市', '1', '0');
INSERT INTO `fx_countys` VALUES ('1086', '138', '3', '藁城市', '1', '0');
INSERT INTO `fx_countys` VALUES ('1087', '138', '3', '晋州市', '1', '0');
INSERT INTO `fx_countys` VALUES ('1088', '138', '3', '新乐市', '1', '0');
INSERT INTO `fx_countys` VALUES ('1089', '138', '3', '鹿泉市', '1', '0');
INSERT INTO `fx_countys` VALUES ('1090', '138', '3', '井陉县', '1', '0');
INSERT INTO `fx_countys` VALUES ('1091', '138', '3', '正定县', '1', '0');
INSERT INTO `fx_countys` VALUES ('1092', '138', '3', '栾城县', '1', '0');
INSERT INTO `fx_countys` VALUES ('1093', '138', '3', '行唐县', '1', '0');
INSERT INTO `fx_countys` VALUES ('1094', '138', '3', '灵寿县', '1', '0');
INSERT INTO `fx_countys` VALUES ('1095', '138', '3', '高邑县', '1', '0');
INSERT INTO `fx_countys` VALUES ('1096', '138', '3', '深泽县', '1', '0');
INSERT INTO `fx_countys` VALUES ('1097', '138', '3', '赞皇县', '1', '0');
INSERT INTO `fx_countys` VALUES ('1098', '138', '3', '无极县', '1', '0');
INSERT INTO `fx_countys` VALUES ('1099', '138', '3', '平山县', '1', '0');
INSERT INTO `fx_countys` VALUES ('1100', '138', '3', '元氏县', '1', '0');
INSERT INTO `fx_countys` VALUES ('1101', '138', '3', '赵县', '1', '0');
INSERT INTO `fx_countys` VALUES ('1102', '139', '3', '新市区', '1', '0');
INSERT INTO `fx_countys` VALUES ('1103', '139', '3', '南市区', '1', '0');
INSERT INTO `fx_countys` VALUES ('1104', '139', '3', '北市区', '1', '0');
INSERT INTO `fx_countys` VALUES ('1105', '139', '3', '涿州市', '1', '0');
INSERT INTO `fx_countys` VALUES ('1106', '139', '3', '定州市', '1', '0');
INSERT INTO `fx_countys` VALUES ('1107', '139', '3', '安国市', '1', '0');
INSERT INTO `fx_countys` VALUES ('1108', '139', '3', '高碑店市', '1', '0');
INSERT INTO `fx_countys` VALUES ('1109', '139', '3', '满城县', '1', '0');
INSERT INTO `fx_countys` VALUES ('1110', '139', '3', '清苑县', '1', '0');
INSERT INTO `fx_countys` VALUES ('1111', '139', '3', '涞水县', '1', '0');
INSERT INTO `fx_countys` VALUES ('1112', '139', '3', '阜平县', '1', '0');
INSERT INTO `fx_countys` VALUES ('1113', '139', '3', '徐水县', '1', '0');
INSERT INTO `fx_countys` VALUES ('1114', '139', '3', '定兴县', '1', '0');
INSERT INTO `fx_countys` VALUES ('1115', '139', '3', '唐县', '1', '0');
INSERT INTO `fx_countys` VALUES ('1116', '139', '3', '高阳县', '1', '0');
INSERT INTO `fx_countys` VALUES ('1117', '139', '3', '容城县', '1', '0');
INSERT INTO `fx_countys` VALUES ('1118', '139', '3', '涞源县', '1', '0');
INSERT INTO `fx_countys` VALUES ('1119', '139', '3', '望都县', '1', '0');
INSERT INTO `fx_countys` VALUES ('1120', '139', '3', '安新县', '1', '0');
INSERT INTO `fx_countys` VALUES ('1121', '139', '3', '易县', '1', '0');
INSERT INTO `fx_countys` VALUES ('1122', '139', '3', '曲阳县', '1', '0');
INSERT INTO `fx_countys` VALUES ('1123', '139', '3', '蠡县', '1', '0');
INSERT INTO `fx_countys` VALUES ('1124', '139', '3', '顺平县', '1', '0');
INSERT INTO `fx_countys` VALUES ('1125', '139', '3', '博野县', '1', '0');
INSERT INTO `fx_countys` VALUES ('1126', '139', '3', '雄县', '1', '0');
INSERT INTO `fx_countys` VALUES ('1127', '140', '3', '运河区', '1', '0');
INSERT INTO `fx_countys` VALUES ('1128', '140', '3', '新华区', '1', '0');
INSERT INTO `fx_countys` VALUES ('1129', '140', '3', '泊头市', '1', '0');
INSERT INTO `fx_countys` VALUES ('1130', '140', '3', '任丘市', '1', '0');
INSERT INTO `fx_countys` VALUES ('1131', '140', '3', '黄骅市', '1', '0');
INSERT INTO `fx_countys` VALUES ('1132', '140', '3', '河间市', '1', '0');
INSERT INTO `fx_countys` VALUES ('1133', '140', '3', '沧县', '1', '0');
INSERT INTO `fx_countys` VALUES ('1134', '140', '3', '青县', '1', '0');
INSERT INTO `fx_countys` VALUES ('1135', '140', '3', '东光县', '1', '0');
INSERT INTO `fx_countys` VALUES ('1136', '140', '3', '海兴县', '1', '0');
INSERT INTO `fx_countys` VALUES ('1137', '140', '3', '盐山县', '1', '0');
INSERT INTO `fx_countys` VALUES ('1138', '140', '3', '肃宁县', '1', '0');
INSERT INTO `fx_countys` VALUES ('1139', '140', '3', '南皮县', '1', '0');
INSERT INTO `fx_countys` VALUES ('1140', '140', '3', '吴桥县', '1', '0');
INSERT INTO `fx_countys` VALUES ('1141', '140', '3', '献县', '1', '0');
INSERT INTO `fx_countys` VALUES ('1142', '140', '3', '孟村', '1', '0');
INSERT INTO `fx_countys` VALUES ('1143', '141', '3', '双桥区', '1', '0');
INSERT INTO `fx_countys` VALUES ('1144', '141', '3', '双滦区', '1', '0');
INSERT INTO `fx_countys` VALUES ('1145', '141', '3', '鹰手营子矿区', '1', '0');
INSERT INTO `fx_countys` VALUES ('1146', '141', '3', '承德县', '1', '0');
INSERT INTO `fx_countys` VALUES ('1147', '141', '3', '兴隆县', '1', '0');
INSERT INTO `fx_countys` VALUES ('1148', '141', '3', '平泉县', '1', '0');
INSERT INTO `fx_countys` VALUES ('1149', '141', '3', '滦平县', '1', '0');
INSERT INTO `fx_countys` VALUES ('1150', '141', '3', '隆化县', '1', '0');
INSERT INTO `fx_countys` VALUES ('1151', '141', '3', '丰宁', '1', '0');
INSERT INTO `fx_countys` VALUES ('1152', '141', '3', '宽城', '1', '0');
INSERT INTO `fx_countys` VALUES ('1153', '141', '3', '围场', '1', '0');
INSERT INTO `fx_countys` VALUES ('1154', '142', '3', '从台区', '1', '0');
INSERT INTO `fx_countys` VALUES ('1155', '142', '3', '复兴区', '1', '0');
INSERT INTO `fx_countys` VALUES ('1156', '142', '3', '邯山区', '1', '0');
INSERT INTO `fx_countys` VALUES ('1157', '142', '3', '峰峰矿区', '1', '0');
INSERT INTO `fx_countys` VALUES ('1158', '142', '3', '武安市', '1', '0');
INSERT INTO `fx_countys` VALUES ('1159', '142', '3', '邯郸县', '1', '0');
INSERT INTO `fx_countys` VALUES ('1160', '142', '3', '临漳县', '1', '0');
INSERT INTO `fx_countys` VALUES ('1161', '142', '3', '成安县', '1', '0');
INSERT INTO `fx_countys` VALUES ('1162', '142', '3', '大名县', '1', '0');
INSERT INTO `fx_countys` VALUES ('1163', '142', '3', '涉县', '1', '0');
INSERT INTO `fx_countys` VALUES ('1164', '142', '3', '磁县', '1', '0');
INSERT INTO `fx_countys` VALUES ('1165', '142', '3', '肥乡县', '1', '0');
INSERT INTO `fx_countys` VALUES ('1166', '142', '3', '永年县', '1', '0');
INSERT INTO `fx_countys` VALUES ('1167', '142', '3', '邱县', '1', '0');
INSERT INTO `fx_countys` VALUES ('1168', '142', '3', '鸡泽县', '1', '0');
INSERT INTO `fx_countys` VALUES ('1169', '142', '3', '广平县', '1', '0');
INSERT INTO `fx_countys` VALUES ('1170', '142', '3', '馆陶县', '1', '0');
INSERT INTO `fx_countys` VALUES ('1171', '142', '3', '魏县', '1', '0');
INSERT INTO `fx_countys` VALUES ('1172', '142', '3', '曲周县', '1', '0');
INSERT INTO `fx_countys` VALUES ('1173', '143', '3', '桃城区', '1', '0');
INSERT INTO `fx_countys` VALUES ('1174', '143', '3', '冀州市', '1', '0');
INSERT INTO `fx_countys` VALUES ('1175', '143', '3', '深州市', '1', '0');
INSERT INTO `fx_countys` VALUES ('1176', '143', '3', '枣强县', '1', '0');
INSERT INTO `fx_countys` VALUES ('1177', '143', '3', '武邑县', '1', '0');
INSERT INTO `fx_countys` VALUES ('1178', '143', '3', '武强县', '1', '0');
INSERT INTO `fx_countys` VALUES ('1179', '143', '3', '饶阳县', '1', '0');
INSERT INTO `fx_countys` VALUES ('1180', '143', '3', '安平县', '1', '0');
INSERT INTO `fx_countys` VALUES ('1181', '143', '3', '故城县', '1', '0');
INSERT INTO `fx_countys` VALUES ('1182', '143', '3', '景县', '1', '0');
INSERT INTO `fx_countys` VALUES ('1183', '143', '3', '阜城县', '1', '0');
INSERT INTO `fx_countys` VALUES ('1184', '144', '3', '安次区', '1', '0');
INSERT INTO `fx_countys` VALUES ('1185', '144', '3', '广阳区', '1', '0');
INSERT INTO `fx_countys` VALUES ('1186', '144', '3', '霸州市', '1', '0');
INSERT INTO `fx_countys` VALUES ('1187', '144', '3', '三河市', '1', '0');
INSERT INTO `fx_countys` VALUES ('1188', '144', '3', '固安县', '1', '0');
INSERT INTO `fx_countys` VALUES ('1189', '144', '3', '永清县', '1', '0');
INSERT INTO `fx_countys` VALUES ('1190', '144', '3', '香河县', '1', '0');
INSERT INTO `fx_countys` VALUES ('1191', '144', '3', '大城县', '1', '0');
INSERT INTO `fx_countys` VALUES ('1192', '144', '3', '文安县', '1', '0');
INSERT INTO `fx_countys` VALUES ('1193', '144', '3', '大厂', '1', '0');
INSERT INTO `fx_countys` VALUES ('1194', '145', '3', '海港区', '1', '0');
INSERT INTO `fx_countys` VALUES ('1195', '145', '3', '山海关区', '1', '0');
INSERT INTO `fx_countys` VALUES ('1196', '145', '3', '北戴河区', '1', '0');
INSERT INTO `fx_countys` VALUES ('1197', '145', '3', '昌黎县', '1', '0');
INSERT INTO `fx_countys` VALUES ('1198', '145', '3', '抚宁县', '1', '0');
INSERT INTO `fx_countys` VALUES ('1199', '145', '3', '卢龙县', '1', '0');
INSERT INTO `fx_countys` VALUES ('1200', '145', '3', '青龙', '1', '0');
INSERT INTO `fx_countys` VALUES ('1201', '146', '3', '路北区', '1', '0');
INSERT INTO `fx_countys` VALUES ('1202', '146', '3', '路南区', '1', '0');
INSERT INTO `fx_countys` VALUES ('1203', '146', '3', '古冶区', '1', '0');
INSERT INTO `fx_countys` VALUES ('1204', '146', '3', '开平区', '1', '0');
INSERT INTO `fx_countys` VALUES ('1205', '146', '3', '丰南区', '1', '0');
INSERT INTO `fx_countys` VALUES ('1206', '146', '3', '丰润区', '1', '0');
INSERT INTO `fx_countys` VALUES ('1207', '146', '3', '遵化市', '1', '0');
INSERT INTO `fx_countys` VALUES ('1208', '146', '3', '迁安市', '1', '0');
INSERT INTO `fx_countys` VALUES ('1209', '146', '3', '滦县', '1', '0');
INSERT INTO `fx_countys` VALUES ('1210', '146', '3', '滦南县', '1', '0');
INSERT INTO `fx_countys` VALUES ('1211', '146', '3', '乐亭县', '1', '0');
INSERT INTO `fx_countys` VALUES ('1212', '146', '3', '迁西县', '1', '0');
INSERT INTO `fx_countys` VALUES ('1213', '146', '3', '玉田县', '1', '0');
INSERT INTO `fx_countys` VALUES ('1214', '146', '3', '唐海县', '1', '0');
INSERT INTO `fx_countys` VALUES ('1215', '147', '3', '桥东区', '1', '0');
INSERT INTO `fx_countys` VALUES ('1216', '147', '3', '桥西区', '1', '0');
INSERT INTO `fx_countys` VALUES ('1217', '147', '3', '南宫市', '1', '0');
INSERT INTO `fx_countys` VALUES ('1218', '147', '3', '沙河市', '1', '0');
INSERT INTO `fx_countys` VALUES ('1219', '147', '3', '邢台县', '1', '0');
INSERT INTO `fx_countys` VALUES ('1220', '147', '3', '临城县', '1', '0');
INSERT INTO `fx_countys` VALUES ('1221', '147', '3', '内丘县', '1', '0');
INSERT INTO `fx_countys` VALUES ('1222', '147', '3', '柏乡县', '1', '0');
INSERT INTO `fx_countys` VALUES ('1223', '147', '3', '隆尧县', '1', '0');
INSERT INTO `fx_countys` VALUES ('1224', '147', '3', '任县', '1', '0');
INSERT INTO `fx_countys` VALUES ('1225', '147', '3', '南和县', '1', '0');
INSERT INTO `fx_countys` VALUES ('1226', '147', '3', '宁晋县', '1', '0');
INSERT INTO `fx_countys` VALUES ('1227', '147', '3', '巨鹿县', '1', '0');
INSERT INTO `fx_countys` VALUES ('1228', '147', '3', '新河县', '1', '0');
INSERT INTO `fx_countys` VALUES ('1229', '147', '3', '广宗县', '1', '0');
INSERT INTO `fx_countys` VALUES ('1230', '147', '3', '平乡县', '1', '0');
INSERT INTO `fx_countys` VALUES ('1231', '147', '3', '威县', '1', '0');
INSERT INTO `fx_countys` VALUES ('1232', '147', '3', '清河县', '1', '0');
INSERT INTO `fx_countys` VALUES ('1233', '147', '3', '临西县', '1', '0');
INSERT INTO `fx_countys` VALUES ('1234', '148', '3', '桥西区', '1', '0');
INSERT INTO `fx_countys` VALUES ('1235', '148', '3', '桥东区', '1', '0');
INSERT INTO `fx_countys` VALUES ('1236', '148', '3', '宣化区', '1', '0');
INSERT INTO `fx_countys` VALUES ('1237', '148', '3', '下花园区', '1', '0');
INSERT INTO `fx_countys` VALUES ('1238', '148', '3', '宣化县', '1', '0');
INSERT INTO `fx_countys` VALUES ('1239', '148', '3', '张北县', '1', '0');
INSERT INTO `fx_countys` VALUES ('1240', '148', '3', '康保县', '1', '0');
INSERT INTO `fx_countys` VALUES ('1241', '148', '3', '沽源县', '1', '0');
INSERT INTO `fx_countys` VALUES ('1242', '148', '3', '尚义县', '1', '0');
INSERT INTO `fx_countys` VALUES ('1243', '148', '3', '蔚县', '1', '0');
INSERT INTO `fx_countys` VALUES ('1244', '148', '3', '阳原县', '1', '0');
INSERT INTO `fx_countys` VALUES ('1245', '148', '3', '怀安县', '1', '0');
INSERT INTO `fx_countys` VALUES ('1246', '148', '3', '万全县', '1', '0');
INSERT INTO `fx_countys` VALUES ('1247', '148', '3', '怀来县', '1', '0');
INSERT INTO `fx_countys` VALUES ('1248', '148', '3', '涿鹿县', '1', '0');
INSERT INTO `fx_countys` VALUES ('1249', '148', '3', '赤城县', '1', '0');
INSERT INTO `fx_countys` VALUES ('1250', '148', '3', '崇礼县', '1', '0');
INSERT INTO `fx_countys` VALUES ('1251', '149', '3', '金水区', '1', '0');
INSERT INTO `fx_countys` VALUES ('1252', '149', '3', '邙山区', '1', '0');
INSERT INTO `fx_countys` VALUES ('1253', '149', '3', '二七区', '1', '0');
INSERT INTO `fx_countys` VALUES ('1254', '149', '3', '管城区', '1', '0');
INSERT INTO `fx_countys` VALUES ('1255', '149', '3', '中原区', '1', '0');
INSERT INTO `fx_countys` VALUES ('1256', '149', '3', '上街区', '1', '0');
INSERT INTO `fx_countys` VALUES ('1257', '149', '3', '惠济区', '1', '0');
INSERT INTO `fx_countys` VALUES ('1258', '149', '3', '郑东新区', '1', '0');
INSERT INTO `fx_countys` VALUES ('1259', '149', '3', '经济技术开发区', '1', '0');
INSERT INTO `fx_countys` VALUES ('1260', '149', '3', '高新开发区', '1', '0');
INSERT INTO `fx_countys` VALUES ('1261', '149', '3', '出口加工区', '1', '0');
INSERT INTO `fx_countys` VALUES ('1262', '149', '3', '巩义市', '1', '0');
INSERT INTO `fx_countys` VALUES ('1263', '149', '3', '荥阳市', '1', '0');
INSERT INTO `fx_countys` VALUES ('1264', '149', '3', '新密市', '1', '0');
INSERT INTO `fx_countys` VALUES ('1265', '149', '3', '新郑市', '1', '0');
INSERT INTO `fx_countys` VALUES ('1266', '149', '3', '登封市', '1', '0');
INSERT INTO `fx_countys` VALUES ('1267', '149', '3', '中牟县', '1', '0');
INSERT INTO `fx_countys` VALUES ('1268', '150', '3', '西工区', '1', '0');
INSERT INTO `fx_countys` VALUES ('1269', '150', '3', '老城区', '1', '0');
INSERT INTO `fx_countys` VALUES ('1270', '150', '3', '涧西区', '1', '0');
INSERT INTO `fx_countys` VALUES ('1271', '150', '3', '瀍河回族区', '1', '0');
INSERT INTO `fx_countys` VALUES ('1272', '150', '3', '洛龙区', '1', '0');
INSERT INTO `fx_countys` VALUES ('1273', '150', '3', '吉利区', '1', '0');
INSERT INTO `fx_countys` VALUES ('1274', '150', '3', '偃师市', '1', '0');
INSERT INTO `fx_countys` VALUES ('1275', '150', '3', '孟津县', '1', '0');
INSERT INTO `fx_countys` VALUES ('1276', '150', '3', '新安县', '1', '0');
INSERT INTO `fx_countys` VALUES ('1277', '150', '3', '栾川县', '1', '0');
INSERT INTO `fx_countys` VALUES ('1278', '150', '3', '嵩县', '1', '0');
INSERT INTO `fx_countys` VALUES ('1279', '150', '3', '汝阳县', '1', '0');
INSERT INTO `fx_countys` VALUES ('1280', '150', '3', '宜阳县', '1', '0');
INSERT INTO `fx_countys` VALUES ('1281', '150', '3', '洛宁县', '1', '0');
INSERT INTO `fx_countys` VALUES ('1282', '150', '3', '伊川县', '1', '0');
INSERT INTO `fx_countys` VALUES ('1283', '151', '3', '鼓楼区', '1', '0');
INSERT INTO `fx_countys` VALUES ('1284', '151', '3', '龙亭区', '1', '0');
INSERT INTO `fx_countys` VALUES ('1285', '151', '3', '顺河回族区', '1', '0');
INSERT INTO `fx_countys` VALUES ('1286', '151', '3', '金明区', '1', '0');
INSERT INTO `fx_countys` VALUES ('1287', '151', '3', '禹王台区', '1', '0');
INSERT INTO `fx_countys` VALUES ('1288', '151', '3', '杞县', '1', '0');
INSERT INTO `fx_countys` VALUES ('1289', '151', '3', '通许县', '1', '0');
INSERT INTO `fx_countys` VALUES ('1290', '151', '3', '尉氏县', '1', '0');
INSERT INTO `fx_countys` VALUES ('1291', '151', '3', '开封县', '1', '0');
INSERT INTO `fx_countys` VALUES ('1292', '151', '3', '兰考县', '1', '0');
INSERT INTO `fx_countys` VALUES ('1293', '152', '3', '北关区', '1', '0');
INSERT INTO `fx_countys` VALUES ('1294', '152', '3', '文峰区', '1', '0');
INSERT INTO `fx_countys` VALUES ('1295', '152', '3', '殷都区', '1', '0');
INSERT INTO `fx_countys` VALUES ('1296', '152', '3', '龙安区', '1', '0');
INSERT INTO `fx_countys` VALUES ('1297', '152', '3', '林州市', '1', '0');
INSERT INTO `fx_countys` VALUES ('1298', '152', '3', '安阳县', '1', '0');
INSERT INTO `fx_countys` VALUES ('1299', '152', '3', '汤阴县', '1', '0');
INSERT INTO `fx_countys` VALUES ('1300', '152', '3', '滑县', '1', '0');
INSERT INTO `fx_countys` VALUES ('1301', '152', '3', '内黄县', '1', '0');
INSERT INTO `fx_countys` VALUES ('1302', '153', '3', '淇滨区', '1', '0');
INSERT INTO `fx_countys` VALUES ('1303', '153', '3', '山城区', '1', '0');
INSERT INTO `fx_countys` VALUES ('1304', '153', '3', '鹤山区', '1', '0');
INSERT INTO `fx_countys` VALUES ('1305', '153', '3', '浚县', '1', '0');
INSERT INTO `fx_countys` VALUES ('1306', '153', '3', '淇县', '1', '0');
INSERT INTO `fx_countys` VALUES ('1307', '154', '3', '济源市', '1', '0');
INSERT INTO `fx_countys` VALUES ('1308', '155', '3', '解放区', '1', '0');
INSERT INTO `fx_countys` VALUES ('1309', '155', '3', '中站区', '1', '0');
INSERT INTO `fx_countys` VALUES ('1310', '155', '3', '马村区', '1', '0');
INSERT INTO `fx_countys` VALUES ('1311', '155', '3', '山阳区', '1', '0');
INSERT INTO `fx_countys` VALUES ('1312', '155', '3', '沁阳市', '1', '0');
INSERT INTO `fx_countys` VALUES ('1313', '155', '3', '孟州市', '1', '0');
INSERT INTO `fx_countys` VALUES ('1314', '155', '3', '修武县', '1', '0');
INSERT INTO `fx_countys` VALUES ('1315', '155', '3', '博爱县', '1', '0');
INSERT INTO `fx_countys` VALUES ('1316', '155', '3', '武陟县', '1', '0');
INSERT INTO `fx_countys` VALUES ('1317', '155', '3', '温县', '1', '0');
INSERT INTO `fx_countys` VALUES ('1318', '156', '3', '卧龙区', '1', '0');
INSERT INTO `fx_countys` VALUES ('1319', '156', '3', '宛城区', '1', '0');
INSERT INTO `fx_countys` VALUES ('1320', '156', '3', '邓州市', '1', '0');
INSERT INTO `fx_countys` VALUES ('1321', '156', '3', '南召县', '1', '0');
INSERT INTO `fx_countys` VALUES ('1322', '156', '3', '方城县', '1', '0');
INSERT INTO `fx_countys` VALUES ('1323', '156', '3', '西峡县', '1', '0');
INSERT INTO `fx_countys` VALUES ('1324', '156', '3', '镇平县', '1', '0');
INSERT INTO `fx_countys` VALUES ('1325', '156', '3', '内乡县', '1', '0');
INSERT INTO `fx_countys` VALUES ('1326', '156', '3', '淅川县', '1', '0');
INSERT INTO `fx_countys` VALUES ('1327', '156', '3', '社旗县', '1', '0');
INSERT INTO `fx_countys` VALUES ('1328', '156', '3', '唐河县', '1', '0');
INSERT INTO `fx_countys` VALUES ('1329', '156', '3', '新野县', '1', '0');
INSERT INTO `fx_countys` VALUES ('1330', '156', '3', '桐柏县', '1', '0');
INSERT INTO `fx_countys` VALUES ('1331', '157', '3', '新华区', '1', '0');
INSERT INTO `fx_countys` VALUES ('1332', '157', '3', '卫东区', '1', '0');
INSERT INTO `fx_countys` VALUES ('1333', '157', '3', '湛河区', '1', '0');
INSERT INTO `fx_countys` VALUES ('1334', '157', '3', '石龙区', '1', '0');
INSERT INTO `fx_countys` VALUES ('1335', '157', '3', '舞钢市', '1', '0');
INSERT INTO `fx_countys` VALUES ('1336', '157', '3', '汝州市', '1', '0');
INSERT INTO `fx_countys` VALUES ('1337', '157', '3', '宝丰县', '1', '0');
INSERT INTO `fx_countys` VALUES ('1338', '157', '3', '叶县', '1', '0');
INSERT INTO `fx_countys` VALUES ('1339', '157', '3', '鲁山县', '1', '0');
INSERT INTO `fx_countys` VALUES ('1340', '157', '3', '郏县', '1', '0');
INSERT INTO `fx_countys` VALUES ('1341', '158', '3', '湖滨区', '1', '0');
INSERT INTO `fx_countys` VALUES ('1342', '158', '3', '义马市', '1', '0');
INSERT INTO `fx_countys` VALUES ('1343', '158', '3', '灵宝市', '1', '0');
INSERT INTO `fx_countys` VALUES ('1344', '158', '3', '渑池县', '1', '0');
INSERT INTO `fx_countys` VALUES ('1345', '158', '3', '陕县', '1', '0');
INSERT INTO `fx_countys` VALUES ('1346', '158', '3', '卢氏县', '1', '0');
INSERT INTO `fx_countys` VALUES ('1347', '159', '3', '梁园区', '1', '0');
INSERT INTO `fx_countys` VALUES ('1348', '159', '3', '睢阳区', '1', '0');
INSERT INTO `fx_countys` VALUES ('1349', '159', '3', '永城市', '1', '0');
INSERT INTO `fx_countys` VALUES ('1350', '159', '3', '民权县', '1', '0');
INSERT INTO `fx_countys` VALUES ('1351', '159', '3', '睢县', '1', '0');
INSERT INTO `fx_countys` VALUES ('1352', '159', '3', '宁陵县', '1', '0');
INSERT INTO `fx_countys` VALUES ('1353', '159', '3', '虞城县', '1', '0');
INSERT INTO `fx_countys` VALUES ('1354', '159', '3', '柘城县', '1', '0');
INSERT INTO `fx_countys` VALUES ('1355', '159', '3', '夏邑县', '1', '0');
INSERT INTO `fx_countys` VALUES ('1356', '160', '3', '卫滨区', '1', '0');
INSERT INTO `fx_countys` VALUES ('1357', '160', '3', '红旗区', '1', '0');
INSERT INTO `fx_countys` VALUES ('1358', '160', '3', '凤泉区', '1', '0');
INSERT INTO `fx_countys` VALUES ('1359', '160', '3', '牧野区', '1', '0');
INSERT INTO `fx_countys` VALUES ('1360', '160', '3', '卫辉市', '1', '0');
INSERT INTO `fx_countys` VALUES ('1361', '160', '3', '辉县市', '1', '0');
INSERT INTO `fx_countys` VALUES ('1362', '160', '3', '新乡县', '1', '0');
INSERT INTO `fx_countys` VALUES ('1363', '160', '3', '获嘉县', '1', '0');
INSERT INTO `fx_countys` VALUES ('1364', '160', '3', '原阳县', '1', '0');
INSERT INTO `fx_countys` VALUES ('1365', '160', '3', '延津县', '1', '0');
INSERT INTO `fx_countys` VALUES ('1366', '160', '3', '封丘县', '1', '0');
INSERT INTO `fx_countys` VALUES ('1367', '160', '3', '长垣县', '1', '0');
INSERT INTO `fx_countys` VALUES ('1368', '161', '3', '浉河区', '1', '0');
INSERT INTO `fx_countys` VALUES ('1369', '161', '3', '平桥区', '1', '0');
INSERT INTO `fx_countys` VALUES ('1370', '161', '3', '罗山县', '1', '0');
INSERT INTO `fx_countys` VALUES ('1371', '161', '3', '光山县', '1', '0');
INSERT INTO `fx_countys` VALUES ('1372', '161', '3', '新县', '1', '0');
INSERT INTO `fx_countys` VALUES ('1373', '161', '3', '商城县', '1', '0');
INSERT INTO `fx_countys` VALUES ('1374', '161', '3', '固始县', '1', '0');
INSERT INTO `fx_countys` VALUES ('1375', '161', '3', '潢川县', '1', '0');
INSERT INTO `fx_countys` VALUES ('1376', '161', '3', '淮滨县', '1', '0');
INSERT INTO `fx_countys` VALUES ('1377', '161', '3', '息县', '1', '0');
INSERT INTO `fx_countys` VALUES ('1378', '162', '3', '魏都区', '1', '0');
INSERT INTO `fx_countys` VALUES ('1379', '162', '3', '禹州市', '1', '0');
INSERT INTO `fx_countys` VALUES ('1380', '162', '3', '长葛市', '1', '0');
INSERT INTO `fx_countys` VALUES ('1381', '162', '3', '许昌县', '1', '0');
INSERT INTO `fx_countys` VALUES ('1382', '162', '3', '鄢陵县', '1', '0');
INSERT INTO `fx_countys` VALUES ('1383', '162', '3', '襄城县', '1', '0');
INSERT INTO `fx_countys` VALUES ('1384', '163', '3', '川汇区', '1', '0');
INSERT INTO `fx_countys` VALUES ('1385', '163', '3', '项城市', '1', '0');
INSERT INTO `fx_countys` VALUES ('1386', '163', '3', '扶沟县', '1', '0');
INSERT INTO `fx_countys` VALUES ('1387', '163', '3', '西华县', '1', '0');
INSERT INTO `fx_countys` VALUES ('1388', '163', '3', '商水县', '1', '0');
INSERT INTO `fx_countys` VALUES ('1389', '163', '3', '沈丘县', '1', '0');
INSERT INTO `fx_countys` VALUES ('1390', '163', '3', '郸城县', '1', '0');
INSERT INTO `fx_countys` VALUES ('1391', '163', '3', '淮阳县', '1', '0');
INSERT INTO `fx_countys` VALUES ('1392', '163', '3', '太康县', '1', '0');
INSERT INTO `fx_countys` VALUES ('1393', '163', '3', '鹿邑县', '1', '0');
INSERT INTO `fx_countys` VALUES ('1394', '164', '3', '驿城区', '1', '0');
INSERT INTO `fx_countys` VALUES ('1395', '164', '3', '西平县', '1', '0');
INSERT INTO `fx_countys` VALUES ('1396', '164', '3', '上蔡县', '1', '0');
INSERT INTO `fx_countys` VALUES ('1397', '164', '3', '平舆县', '1', '0');
INSERT INTO `fx_countys` VALUES ('1398', '164', '3', '正阳县', '1', '0');
INSERT INTO `fx_countys` VALUES ('1399', '164', '3', '确山县', '1', '0');
INSERT INTO `fx_countys` VALUES ('1400', '164', '3', '泌阳县', '1', '0');
INSERT INTO `fx_countys` VALUES ('1401', '164', '3', '汝南县', '1', '0');
INSERT INTO `fx_countys` VALUES ('1402', '164', '3', '遂平县', '1', '0');
INSERT INTO `fx_countys` VALUES ('1403', '164', '3', '新蔡县', '1', '0');
INSERT INTO `fx_countys` VALUES ('1404', '165', '3', '郾城区', '1', '0');
INSERT INTO `fx_countys` VALUES ('1405', '165', '3', '源汇区', '1', '0');
INSERT INTO `fx_countys` VALUES ('1406', '165', '3', '召陵区', '1', '0');
INSERT INTO `fx_countys` VALUES ('1407', '165', '3', '舞阳县', '1', '0');
INSERT INTO `fx_countys` VALUES ('1408', '165', '3', '临颍县', '1', '0');
INSERT INTO `fx_countys` VALUES ('1409', '166', '3', '华龙区', '1', '0');
INSERT INTO `fx_countys` VALUES ('1410', '166', '3', '清丰县', '1', '0');
INSERT INTO `fx_countys` VALUES ('1411', '166', '3', '南乐县', '1', '0');
INSERT INTO `fx_countys` VALUES ('1412', '166', '3', '范县', '1', '0');
INSERT INTO `fx_countys` VALUES ('1413', '166', '3', '台前县', '1', '0');
INSERT INTO `fx_countys` VALUES ('1414', '166', '3', '濮阳县', '1', '0');
INSERT INTO `fx_countys` VALUES ('1415', '167', '3', '道里区', '1', '0');
INSERT INTO `fx_countys` VALUES ('1416', '167', '3', '南岗区', '1', '0');
INSERT INTO `fx_countys` VALUES ('1417', '167', '3', '动力区', '1', '0');
INSERT INTO `fx_countys` VALUES ('1418', '167', '3', '平房区', '1', '0');
INSERT INTO `fx_countys` VALUES ('1419', '167', '3', '香坊区', '1', '0');
INSERT INTO `fx_countys` VALUES ('1420', '167', '3', '太平区', '1', '0');
INSERT INTO `fx_countys` VALUES ('1421', '167', '3', '道外区', '1', '0');
INSERT INTO `fx_countys` VALUES ('1422', '167', '3', '阿城区', '1', '0');
INSERT INTO `fx_countys` VALUES ('1423', '167', '3', '呼兰区', '1', '0');
INSERT INTO `fx_countys` VALUES ('1424', '167', '3', '松北区', '1', '0');
INSERT INTO `fx_countys` VALUES ('1425', '167', '3', '尚志市', '1', '0');
INSERT INTO `fx_countys` VALUES ('1426', '167', '3', '双城市', '1', '0');
INSERT INTO `fx_countys` VALUES ('1427', '167', '3', '五常市', '1', '0');
INSERT INTO `fx_countys` VALUES ('1428', '167', '3', '方正县', '1', '0');
INSERT INTO `fx_countys` VALUES ('1429', '167', '3', '宾县', '1', '0');
INSERT INTO `fx_countys` VALUES ('1430', '167', '3', '依兰县', '1', '0');
INSERT INTO `fx_countys` VALUES ('1431', '167', '3', '巴彦县', '1', '0');
INSERT INTO `fx_countys` VALUES ('1432', '167', '3', '通河县', '1', '0');
INSERT INTO `fx_countys` VALUES ('1433', '167', '3', '木兰县', '1', '0');
INSERT INTO `fx_countys` VALUES ('1434', '167', '3', '延寿县', '1', '0');
INSERT INTO `fx_countys` VALUES ('1435', '168', '3', '萨尔图区', '1', '0');
INSERT INTO `fx_countys` VALUES ('1436', '168', '3', '红岗区', '1', '0');
INSERT INTO `fx_countys` VALUES ('1437', '168', '3', '龙凤区', '1', '0');
INSERT INTO `fx_countys` VALUES ('1438', '168', '3', '让胡路区', '1', '0');
INSERT INTO `fx_countys` VALUES ('1439', '168', '3', '大同区', '1', '0');
INSERT INTO `fx_countys` VALUES ('1440', '168', '3', '肇州县', '1', '0');
INSERT INTO `fx_countys` VALUES ('1441', '168', '3', '肇源县', '1', '0');
INSERT INTO `fx_countys` VALUES ('1442', '168', '3', '林甸县', '1', '0');
INSERT INTO `fx_countys` VALUES ('1443', '168', '3', '杜尔伯特', '1', '0');
INSERT INTO `fx_countys` VALUES ('1444', '169', '3', '呼玛县', '1', '0');
INSERT INTO `fx_countys` VALUES ('1445', '169', '3', '漠河县', '1', '0');
INSERT INTO `fx_countys` VALUES ('1446', '169', '3', '塔河县', '1', '0');
INSERT INTO `fx_countys` VALUES ('1447', '170', '3', '兴山区', '1', '0');
INSERT INTO `fx_countys` VALUES ('1448', '170', '3', '工农区', '1', '0');
INSERT INTO `fx_countys` VALUES ('1449', '170', '3', '南山区', '1', '0');
INSERT INTO `fx_countys` VALUES ('1450', '170', '3', '兴安区', '1', '0');
INSERT INTO `fx_countys` VALUES ('1451', '170', '3', '向阳区', '1', '0');
INSERT INTO `fx_countys` VALUES ('1452', '170', '3', '东山区', '1', '0');
INSERT INTO `fx_countys` VALUES ('1453', '170', '3', '萝北县', '1', '0');
INSERT INTO `fx_countys` VALUES ('1454', '170', '3', '绥滨县', '1', '0');
INSERT INTO `fx_countys` VALUES ('1455', '171', '3', '爱辉区', '1', '0');
INSERT INTO `fx_countys` VALUES ('1456', '171', '3', '五大连池市', '1', '0');
INSERT INTO `fx_countys` VALUES ('1457', '171', '3', '北安市', '1', '0');
INSERT INTO `fx_countys` VALUES ('1458', '171', '3', '嫩江县', '1', '0');
INSERT INTO `fx_countys` VALUES ('1459', '171', '3', '逊克县', '1', '0');
INSERT INTO `fx_countys` VALUES ('1460', '171', '3', '孙吴县', '1', '0');
INSERT INTO `fx_countys` VALUES ('1461', '172', '3', '鸡冠区', '1', '0');
INSERT INTO `fx_countys` VALUES ('1462', '172', '3', '恒山区', '1', '0');
INSERT INTO `fx_countys` VALUES ('1463', '172', '3', '城子河区', '1', '0');
INSERT INTO `fx_countys` VALUES ('1464', '172', '3', '滴道区', '1', '0');
INSERT INTO `fx_countys` VALUES ('1465', '172', '3', '梨树区', '1', '0');
INSERT INTO `fx_countys` VALUES ('1466', '172', '3', '虎林市', '1', '0');
INSERT INTO `fx_countys` VALUES ('1467', '172', '3', '密山市', '1', '0');
INSERT INTO `fx_countys` VALUES ('1468', '172', '3', '鸡东县', '1', '0');
INSERT INTO `fx_countys` VALUES ('1469', '173', '3', '前进区', '1', '0');
INSERT INTO `fx_countys` VALUES ('1470', '173', '3', '郊区', '1', '0');
INSERT INTO `fx_countys` VALUES ('1471', '173', '3', '向阳区', '1', '0');
INSERT INTO `fx_countys` VALUES ('1472', '173', '3', '东风区', '1', '0');
INSERT INTO `fx_countys` VALUES ('1473', '173', '3', '同江市', '1', '0');
INSERT INTO `fx_countys` VALUES ('1474', '173', '3', '富锦市', '1', '0');
INSERT INTO `fx_countys` VALUES ('1475', '173', '3', '桦南县', '1', '0');
INSERT INTO `fx_countys` VALUES ('1476', '173', '3', '桦川县', '1', '0');
INSERT INTO `fx_countys` VALUES ('1477', '173', '3', '汤原县', '1', '0');
INSERT INTO `fx_countys` VALUES ('1478', '173', '3', '抚远县', '1', '0');
INSERT INTO `fx_countys` VALUES ('1479', '174', '3', '爱民区', '1', '0');
INSERT INTO `fx_countys` VALUES ('1480', '174', '3', '东安区', '1', '0');
INSERT INTO `fx_countys` VALUES ('1481', '174', '3', '阳明区', '1', '0');
INSERT INTO `fx_countys` VALUES ('1482', '174', '3', '西安区', '1', '0');
INSERT INTO `fx_countys` VALUES ('1483', '174', '3', '绥芬河市', '1', '0');
INSERT INTO `fx_countys` VALUES ('1484', '174', '3', '海林市', '1', '0');
INSERT INTO `fx_countys` VALUES ('1485', '174', '3', '宁安市', '1', '0');
INSERT INTO `fx_countys` VALUES ('1486', '174', '3', '穆棱市', '1', '0');
INSERT INTO `fx_countys` VALUES ('1487', '174', '3', '东宁县', '1', '0');
INSERT INTO `fx_countys` VALUES ('1488', '174', '3', '林口县', '1', '0');
INSERT INTO `fx_countys` VALUES ('1489', '175', '3', '桃山区', '1', '0');
INSERT INTO `fx_countys` VALUES ('1490', '175', '3', '新兴区', '1', '0');
INSERT INTO `fx_countys` VALUES ('1491', '175', '3', '茄子河区', '1', '0');
INSERT INTO `fx_countys` VALUES ('1492', '175', '3', '勃利县', '1', '0');
INSERT INTO `fx_countys` VALUES ('1493', '176', '3', '龙沙区', '1', '0');
INSERT INTO `fx_countys` VALUES ('1494', '176', '3', '昂昂溪区', '1', '0');
INSERT INTO `fx_countys` VALUES ('1495', '176', '3', '铁峰区', '1', '0');
INSERT INTO `fx_countys` VALUES ('1496', '176', '3', '建华区', '1', '0');
INSERT INTO `fx_countys` VALUES ('1497', '176', '3', '富拉尔基区', '1', '0');
INSERT INTO `fx_countys` VALUES ('1498', '176', '3', '碾子山区', '1', '0');
INSERT INTO `fx_countys` VALUES ('1499', '176', '3', '梅里斯达斡尔区', '1', '0');
INSERT INTO `fx_countys` VALUES ('1500', '176', '3', '讷河市', '1', '0');
INSERT INTO `fx_countys` VALUES ('1501', '176', '3', '龙江县', '1', '0');
INSERT INTO `fx_countys` VALUES ('1502', '176', '3', '依安县', '1', '0');
INSERT INTO `fx_countys` VALUES ('1503', '176', '3', '泰来县', '1', '0');
INSERT INTO `fx_countys` VALUES ('1504', '176', '3', '甘南县', '1', '0');
INSERT INTO `fx_countys` VALUES ('1505', '176', '3', '富裕县', '1', '0');
INSERT INTO `fx_countys` VALUES ('1506', '176', '3', '克山县', '1', '0');
INSERT INTO `fx_countys` VALUES ('1507', '176', '3', '克东县', '1', '0');
INSERT INTO `fx_countys` VALUES ('1508', '176', '3', '拜泉县', '1', '0');
INSERT INTO `fx_countys` VALUES ('1509', '177', '3', '尖山区', '1', '0');
INSERT INTO `fx_countys` VALUES ('1510', '177', '3', '岭东区', '1', '0');
INSERT INTO `fx_countys` VALUES ('1511', '177', '3', '四方台区', '1', '0');
INSERT INTO `fx_countys` VALUES ('1512', '177', '3', '宝山区', '1', '0');
INSERT INTO `fx_countys` VALUES ('1513', '177', '3', '集贤县', '1', '0');
INSERT INTO `fx_countys` VALUES ('1514', '177', '3', '友谊县', '1', '0');
INSERT INTO `fx_countys` VALUES ('1515', '177', '3', '宝清县', '1', '0');
INSERT INTO `fx_countys` VALUES ('1516', '177', '3', '饶河县', '1', '0');
INSERT INTO `fx_countys` VALUES ('1517', '178', '3', '北林区', '1', '0');
INSERT INTO `fx_countys` VALUES ('1518', '178', '3', '安达市', '1', '0');
INSERT INTO `fx_countys` VALUES ('1519', '178', '3', '肇东市', '1', '0');
INSERT INTO `fx_countys` VALUES ('1520', '178', '3', '海伦市', '1', '0');
INSERT INTO `fx_countys` VALUES ('1521', '178', '3', '望奎县', '1', '0');
INSERT INTO `fx_countys` VALUES ('1522', '178', '3', '兰西县', '1', '0');
INSERT INTO `fx_countys` VALUES ('1523', '178', '3', '青冈县', '1', '0');
INSERT INTO `fx_countys` VALUES ('1524', '178', '3', '庆安县', '1', '0');
INSERT INTO `fx_countys` VALUES ('1525', '178', '3', '明水县', '1', '0');
INSERT INTO `fx_countys` VALUES ('1526', '178', '3', '绥棱县', '1', '0');
INSERT INTO `fx_countys` VALUES ('1527', '179', '3', '伊春区', '1', '0');
INSERT INTO `fx_countys` VALUES ('1528', '179', '3', '带岭区', '1', '0');
INSERT INTO `fx_countys` VALUES ('1529', '179', '3', '南岔区', '1', '0');
INSERT INTO `fx_countys` VALUES ('1530', '179', '3', '金山屯区', '1', '0');
INSERT INTO `fx_countys` VALUES ('1531', '179', '3', '西林区', '1', '0');
INSERT INTO `fx_countys` VALUES ('1532', '179', '3', '美溪区', '1', '0');
INSERT INTO `fx_countys` VALUES ('1533', '179', '3', '乌马河区', '1', '0');
INSERT INTO `fx_countys` VALUES ('1534', '179', '3', '翠峦区', '1', '0');
INSERT INTO `fx_countys` VALUES ('1535', '179', '3', '友好区', '1', '0');
INSERT INTO `fx_countys` VALUES ('1536', '179', '3', '上甘岭区', '1', '0');
INSERT INTO `fx_countys` VALUES ('1537', '179', '3', '五营区', '1', '0');
INSERT INTO `fx_countys` VALUES ('1538', '179', '3', '红星区', '1', '0');
INSERT INTO `fx_countys` VALUES ('1539', '179', '3', '新青区', '1', '0');
INSERT INTO `fx_countys` VALUES ('1540', '179', '3', '汤旺河区', '1', '0');
INSERT INTO `fx_countys` VALUES ('1541', '179', '3', '乌伊岭区', '1', '0');
INSERT INTO `fx_countys` VALUES ('1542', '179', '3', '铁力市', '1', '0');
INSERT INTO `fx_countys` VALUES ('1543', '179', '3', '嘉荫县', '1', '0');
INSERT INTO `fx_countys` VALUES ('1544', '180', '3', '江岸区', '1', '0');
INSERT INTO `fx_countys` VALUES ('1545', '180', '3', '武昌区', '1', '0');
INSERT INTO `fx_countys` VALUES ('1546', '180', '3', '江汉区', '1', '0');
INSERT INTO `fx_countys` VALUES ('1547', '180', '3', '硚口区', '1', '0');
INSERT INTO `fx_countys` VALUES ('1548', '180', '3', '汉阳区', '1', '0');
INSERT INTO `fx_countys` VALUES ('1549', '180', '3', '青山区', '1', '0');
INSERT INTO `fx_countys` VALUES ('1550', '180', '3', '洪山区', '1', '0');
INSERT INTO `fx_countys` VALUES ('1551', '180', '3', '东西湖区', '1', '0');
INSERT INTO `fx_countys` VALUES ('1552', '180', '3', '汉南区', '1', '0');
INSERT INTO `fx_countys` VALUES ('1553', '180', '3', '蔡甸区', '1', '0');
INSERT INTO `fx_countys` VALUES ('1554', '180', '3', '江夏区', '1', '0');
INSERT INTO `fx_countys` VALUES ('1555', '180', '3', '黄陂区', '1', '0');
INSERT INTO `fx_countys` VALUES ('1556', '180', '3', '新洲区', '1', '0');
INSERT INTO `fx_countys` VALUES ('1557', '180', '3', '经济开发区', '1', '0');
INSERT INTO `fx_countys` VALUES ('1558', '181', '3', '仙桃市', '1', '0');
INSERT INTO `fx_countys` VALUES ('1559', '182', '3', '鄂城区', '1', '0');
INSERT INTO `fx_countys` VALUES ('1560', '182', '3', '华容区', '1', '0');
INSERT INTO `fx_countys` VALUES ('1561', '182', '3', '梁子湖区', '1', '0');
INSERT INTO `fx_countys` VALUES ('1562', '183', '3', '黄州区', '1', '0');
INSERT INTO `fx_countys` VALUES ('1563', '183', '3', '麻城市', '1', '0');
INSERT INTO `fx_countys` VALUES ('1564', '183', '3', '武穴市', '1', '0');
INSERT INTO `fx_countys` VALUES ('1565', '183', '3', '团风县', '1', '0');
INSERT INTO `fx_countys` VALUES ('1566', '183', '3', '红安县', '1', '0');
INSERT INTO `fx_countys` VALUES ('1567', '183', '3', '罗田县', '1', '0');
INSERT INTO `fx_countys` VALUES ('1568', '183', '3', '英山县', '1', '0');
INSERT INTO `fx_countys` VALUES ('1569', '183', '3', '浠水县', '1', '0');
INSERT INTO `fx_countys` VALUES ('1570', '183', '3', '蕲春县', '1', '0');
INSERT INTO `fx_countys` VALUES ('1571', '183', '3', '黄梅县', '1', '0');
INSERT INTO `fx_countys` VALUES ('1572', '184', '3', '黄石港区', '1', '0');
INSERT INTO `fx_countys` VALUES ('1573', '184', '3', '西塞山区', '1', '0');
INSERT INTO `fx_countys` VALUES ('1574', '184', '3', '下陆区', '1', '0');
INSERT INTO `fx_countys` VALUES ('1575', '184', '3', '铁山区', '1', '0');
INSERT INTO `fx_countys` VALUES ('1576', '184', '3', '大冶市', '1', '0');
INSERT INTO `fx_countys` VALUES ('1577', '184', '3', '阳新县', '1', '0');
INSERT INTO `fx_countys` VALUES ('1578', '185', '3', '东宝区', '1', '0');
INSERT INTO `fx_countys` VALUES ('1579', '185', '3', '掇刀区', '1', '0');
INSERT INTO `fx_countys` VALUES ('1580', '185', '3', '钟祥市', '1', '0');
INSERT INTO `fx_countys` VALUES ('1581', '185', '3', '京山县', '1', '0');
INSERT INTO `fx_countys` VALUES ('1582', '185', '3', '沙洋县', '1', '0');
INSERT INTO `fx_countys` VALUES ('1583', '186', '3', '沙市区', '1', '0');
INSERT INTO `fx_countys` VALUES ('1584', '186', '3', '荆州区', '1', '0');
INSERT INTO `fx_countys` VALUES ('1585', '186', '3', '石首市', '1', '0');
INSERT INTO `fx_countys` VALUES ('1586', '186', '3', '洪湖市', '1', '0');
INSERT INTO `fx_countys` VALUES ('1587', '186', '3', '松滋市', '1', '0');
INSERT INTO `fx_countys` VALUES ('1588', '186', '3', '公安县', '1', '0');
INSERT INTO `fx_countys` VALUES ('1589', '186', '3', '监利县', '1', '0');
INSERT INTO `fx_countys` VALUES ('1590', '186', '3', '江陵县', '1', '0');
INSERT INTO `fx_countys` VALUES ('1591', '187', '3', '潜江市', '1', '0');
INSERT INTO `fx_countys` VALUES ('1592', '188', '3', '神农架林区', '1', '0');
INSERT INTO `fx_countys` VALUES ('1593', '189', '3', '张湾区', '1', '0');
INSERT INTO `fx_countys` VALUES ('1594', '189', '3', '茅箭区', '1', '0');
INSERT INTO `fx_countys` VALUES ('1595', '189', '3', '丹江口市', '1', '0');
INSERT INTO `fx_countys` VALUES ('1596', '189', '3', '郧县', '1', '0');
INSERT INTO `fx_countys` VALUES ('1597', '189', '3', '郧西县', '1', '0');
INSERT INTO `fx_countys` VALUES ('1598', '189', '3', '竹山县', '1', '0');
INSERT INTO `fx_countys` VALUES ('1599', '189', '3', '竹溪县', '1', '0');
INSERT INTO `fx_countys` VALUES ('1600', '189', '3', '房县', '1', '0');
INSERT INTO `fx_countys` VALUES ('1601', '190', '3', '曾都区', '1', '0');
INSERT INTO `fx_countys` VALUES ('1602', '190', '3', '广水市', '1', '0');
INSERT INTO `fx_countys` VALUES ('1603', '191', '3', '天门市', '1', '0');
INSERT INTO `fx_countys` VALUES ('1604', '192', '3', '咸安区', '1', '0');
INSERT INTO `fx_countys` VALUES ('1605', '192', '3', '赤壁市', '1', '0');
INSERT INTO `fx_countys` VALUES ('1606', '192', '3', '嘉鱼县', '1', '0');
INSERT INTO `fx_countys` VALUES ('1607', '192', '3', '通城县', '1', '0');
INSERT INTO `fx_countys` VALUES ('1608', '192', '3', '崇阳县', '1', '0');
INSERT INTO `fx_countys` VALUES ('1609', '192', '3', '通山县', '1', '0');
INSERT INTO `fx_countys` VALUES ('1610', '193', '3', '襄城区', '1', '0');
INSERT INTO `fx_countys` VALUES ('1611', '193', '3', '樊城区', '1', '0');
INSERT INTO `fx_countys` VALUES ('1612', '193', '3', '襄阳区', '1', '0');
INSERT INTO `fx_countys` VALUES ('1613', '193', '3', '老河口市', '1', '0');
INSERT INTO `fx_countys` VALUES ('1614', '193', '3', '枣阳市', '1', '0');
INSERT INTO `fx_countys` VALUES ('1615', '193', '3', '宜城市', '1', '0');
INSERT INTO `fx_countys` VALUES ('1616', '193', '3', '南漳县', '1', '0');
INSERT INTO `fx_countys` VALUES ('1617', '193', '3', '谷城县', '1', '0');
INSERT INTO `fx_countys` VALUES ('1618', '193', '3', '保康县', '1', '0');
INSERT INTO `fx_countys` VALUES ('1619', '194', '3', '孝南区', '1', '0');
INSERT INTO `fx_countys` VALUES ('1620', '194', '3', '应城市', '1', '0');
INSERT INTO `fx_countys` VALUES ('1621', '194', '3', '安陆市', '1', '0');
INSERT INTO `fx_countys` VALUES ('1622', '194', '3', '汉川市', '1', '0');
INSERT INTO `fx_countys` VALUES ('1623', '194', '3', '孝昌县', '1', '0');
INSERT INTO `fx_countys` VALUES ('1624', '194', '3', '大悟县', '1', '0');
INSERT INTO `fx_countys` VALUES ('1625', '194', '3', '云梦县', '1', '0');
INSERT INTO `fx_countys` VALUES ('1626', '195', '3', '长阳', '1', '0');
INSERT INTO `fx_countys` VALUES ('1627', '195', '3', '五峰', '1', '0');
INSERT INTO `fx_countys` VALUES ('1628', '195', '3', '西陵区', '1', '0');
INSERT INTO `fx_countys` VALUES ('1629', '195', '3', '伍家岗区', '1', '0');
INSERT INTO `fx_countys` VALUES ('1630', '195', '3', '点军区', '1', '0');
INSERT INTO `fx_countys` VALUES ('1631', '195', '3', '猇亭区', '1', '0');
INSERT INTO `fx_countys` VALUES ('1632', '195', '3', '夷陵区', '1', '0');
INSERT INTO `fx_countys` VALUES ('1633', '195', '3', '宜都市', '1', '0');
INSERT INTO `fx_countys` VALUES ('1634', '195', '3', '当阳市', '1', '0');
INSERT INTO `fx_countys` VALUES ('1635', '195', '3', '枝江市', '1', '0');
INSERT INTO `fx_countys` VALUES ('1636', '195', '3', '远安县', '1', '0');
INSERT INTO `fx_countys` VALUES ('1637', '195', '3', '兴山县', '1', '0');
INSERT INTO `fx_countys` VALUES ('1638', '195', '3', '秭归县', '1', '0');
INSERT INTO `fx_countys` VALUES ('1639', '196', '3', '恩施市', '1', '0');
INSERT INTO `fx_countys` VALUES ('1640', '196', '3', '利川市', '1', '0');
INSERT INTO `fx_countys` VALUES ('1641', '196', '3', '建始县', '1', '0');
INSERT INTO `fx_countys` VALUES ('1642', '196', '3', '巴东县', '1', '0');
INSERT INTO `fx_countys` VALUES ('1643', '196', '3', '宣恩县', '1', '0');
INSERT INTO `fx_countys` VALUES ('1644', '196', '3', '咸丰县', '1', '0');
INSERT INTO `fx_countys` VALUES ('1645', '196', '3', '来凤县', '1', '0');
INSERT INTO `fx_countys` VALUES ('1646', '196', '3', '鹤峰县', '1', '0');
INSERT INTO `fx_countys` VALUES ('1647', '197', '3', '岳麓区', '1', '0');
INSERT INTO `fx_countys` VALUES ('1648', '197', '3', '芙蓉区', '1', '0');
INSERT INTO `fx_countys` VALUES ('1649', '197', '3', '天心区', '1', '0');
INSERT INTO `fx_countys` VALUES ('1650', '197', '3', '开福区', '1', '0');
INSERT INTO `fx_countys` VALUES ('1651', '197', '3', '雨花区', '1', '0');
INSERT INTO `fx_countys` VALUES ('1652', '197', '3', '开发区', '1', '0');
INSERT INTO `fx_countys` VALUES ('1653', '197', '3', '浏阳市', '1', '0');
INSERT INTO `fx_countys` VALUES ('1654', '197', '3', '长沙县', '1', '0');
INSERT INTO `fx_countys` VALUES ('1655', '197', '3', '望城县', '1', '0');
INSERT INTO `fx_countys` VALUES ('1656', '197', '3', '宁乡县', '1', '0');
INSERT INTO `fx_countys` VALUES ('1657', '198', '3', '永定区', '1', '0');
INSERT INTO `fx_countys` VALUES ('1658', '198', '3', '武陵源区', '1', '0');
INSERT INTO `fx_countys` VALUES ('1659', '198', '3', '慈利县', '1', '0');
INSERT INTO `fx_countys` VALUES ('1660', '198', '3', '桑植县', '1', '0');
INSERT INTO `fx_countys` VALUES ('1661', '199', '3', '武陵区', '1', '0');
INSERT INTO `fx_countys` VALUES ('1662', '199', '3', '鼎城区', '1', '0');
INSERT INTO `fx_countys` VALUES ('1663', '199', '3', '津市市', '1', '0');
INSERT INTO `fx_countys` VALUES ('1664', '199', '3', '安乡县', '1', '0');
INSERT INTO `fx_countys` VALUES ('1665', '199', '3', '汉寿县', '1', '0');
INSERT INTO `fx_countys` VALUES ('1666', '199', '3', '澧县', '1', '0');
INSERT INTO `fx_countys` VALUES ('1667', '199', '3', '临澧县', '1', '0');
INSERT INTO `fx_countys` VALUES ('1668', '199', '3', '桃源县', '1', '0');
INSERT INTO `fx_countys` VALUES ('1669', '199', '3', '石门县', '1', '0');
INSERT INTO `fx_countys` VALUES ('1670', '200', '3', '北湖区', '1', '0');
INSERT INTO `fx_countys` VALUES ('1671', '200', '3', '苏仙区', '1', '0');
INSERT INTO `fx_countys` VALUES ('1672', '200', '3', '资兴市', '1', '0');
INSERT INTO `fx_countys` VALUES ('1673', '200', '3', '桂阳县', '1', '0');
INSERT INTO `fx_countys` VALUES ('1674', '200', '3', '宜章县', '1', '0');
INSERT INTO `fx_countys` VALUES ('1675', '200', '3', '永兴县', '1', '0');
INSERT INTO `fx_countys` VALUES ('1676', '200', '3', '嘉禾县', '1', '0');
INSERT INTO `fx_countys` VALUES ('1677', '200', '3', '临武县', '1', '0');
INSERT INTO `fx_countys` VALUES ('1678', '200', '3', '汝城县', '1', '0');
INSERT INTO `fx_countys` VALUES ('1679', '200', '3', '桂东县', '1', '0');
INSERT INTO `fx_countys` VALUES ('1680', '200', '3', '安仁县', '1', '0');
INSERT INTO `fx_countys` VALUES ('1681', '201', '3', '雁峰区', '1', '0');
INSERT INTO `fx_countys` VALUES ('1682', '201', '3', '珠晖区', '1', '0');
INSERT INTO `fx_countys` VALUES ('1683', '201', '3', '石鼓区', '1', '0');
INSERT INTO `fx_countys` VALUES ('1684', '201', '3', '蒸湘区', '1', '0');
INSERT INTO `fx_countys` VALUES ('1685', '201', '3', '南岳区', '1', '0');
INSERT INTO `fx_countys` VALUES ('1686', '201', '3', '耒阳市', '1', '0');
INSERT INTO `fx_countys` VALUES ('1687', '201', '3', '常宁市', '1', '0');
INSERT INTO `fx_countys` VALUES ('1688', '201', '3', '衡阳县', '1', '0');
INSERT INTO `fx_countys` VALUES ('1689', '201', '3', '衡南县', '1', '0');
INSERT INTO `fx_countys` VALUES ('1690', '201', '3', '衡山县', '1', '0');
INSERT INTO `fx_countys` VALUES ('1691', '201', '3', '衡东县', '1', '0');
INSERT INTO `fx_countys` VALUES ('1692', '201', '3', '祁东县', '1', '0');
INSERT INTO `fx_countys` VALUES ('1693', '202', '3', '鹤城区', '1', '0');
INSERT INTO `fx_countys` VALUES ('1694', '202', '3', '靖州', '1', '0');
INSERT INTO `fx_countys` VALUES ('1695', '202', '3', '麻阳', '1', '0');
INSERT INTO `fx_countys` VALUES ('1696', '202', '3', '通道', '1', '0');
INSERT INTO `fx_countys` VALUES ('1697', '202', '3', '新晃', '1', '0');
INSERT INTO `fx_countys` VALUES ('1698', '202', '3', '芷江', '1', '0');
INSERT INTO `fx_countys` VALUES ('1699', '202', '3', '沅陵县', '1', '0');
INSERT INTO `fx_countys` VALUES ('1700', '202', '3', '辰溪县', '1', '0');
INSERT INTO `fx_countys` VALUES ('1701', '202', '3', '溆浦县', '1', '0');
INSERT INTO `fx_countys` VALUES ('1702', '202', '3', '中方县', '1', '0');
INSERT INTO `fx_countys` VALUES ('1703', '202', '3', '会同县', '1', '0');
INSERT INTO `fx_countys` VALUES ('1704', '202', '3', '洪江市', '1', '0');
INSERT INTO `fx_countys` VALUES ('1705', '203', '3', '娄星区', '1', '0');
INSERT INTO `fx_countys` VALUES ('1706', '203', '3', '冷水江市', '1', '0');
INSERT INTO `fx_countys` VALUES ('1707', '203', '3', '涟源市', '1', '0');
INSERT INTO `fx_countys` VALUES ('1708', '203', '3', '双峰县', '1', '0');
INSERT INTO `fx_countys` VALUES ('1709', '203', '3', '新化县', '1', '0');
INSERT INTO `fx_countys` VALUES ('1710', '204', '3', '城步', '1', '0');
INSERT INTO `fx_countys` VALUES ('1711', '204', '3', '双清区', '1', '0');
INSERT INTO `fx_countys` VALUES ('1712', '204', '3', '大祥区', '1', '0');
INSERT INTO `fx_countys` VALUES ('1713', '204', '3', '北塔区', '1', '0');
INSERT INTO `fx_countys` VALUES ('1714', '204', '3', '武冈市', '1', '0');
INSERT INTO `fx_countys` VALUES ('1715', '204', '3', '邵东县', '1', '0');
INSERT INTO `fx_countys` VALUES ('1716', '204', '3', '新邵县', '1', '0');
INSERT INTO `fx_countys` VALUES ('1717', '204', '3', '邵阳县', '1', '0');
INSERT INTO `fx_countys` VALUES ('1718', '204', '3', '隆回县', '1', '0');
INSERT INTO `fx_countys` VALUES ('1719', '204', '3', '洞口县', '1', '0');
INSERT INTO `fx_countys` VALUES ('1720', '204', '3', '绥宁县', '1', '0');
INSERT INTO `fx_countys` VALUES ('1721', '204', '3', '新宁县', '1', '0');
INSERT INTO `fx_countys` VALUES ('1722', '205', '3', '岳塘区', '1', '0');
INSERT INTO `fx_countys` VALUES ('1723', '205', '3', '雨湖区', '1', '0');
INSERT INTO `fx_countys` VALUES ('1724', '205', '3', '湘乡市', '1', '0');
INSERT INTO `fx_countys` VALUES ('1725', '205', '3', '韶山市', '1', '0');
INSERT INTO `fx_countys` VALUES ('1726', '205', '3', '湘潭县', '1', '0');
INSERT INTO `fx_countys` VALUES ('1727', '206', '3', '吉首市', '1', '0');
INSERT INTO `fx_countys` VALUES ('1728', '206', '3', '泸溪县', '1', '0');
INSERT INTO `fx_countys` VALUES ('1729', '206', '3', '凤凰县', '1', '0');
INSERT INTO `fx_countys` VALUES ('1730', '206', '3', '花垣县', '1', '0');
INSERT INTO `fx_countys` VALUES ('1731', '206', '3', '保靖县', '1', '0');
INSERT INTO `fx_countys` VALUES ('1732', '206', '3', '古丈县', '1', '0');
INSERT INTO `fx_countys` VALUES ('1733', '206', '3', '永顺县', '1', '0');
INSERT INTO `fx_countys` VALUES ('1734', '206', '3', '龙山县', '1', '0');
INSERT INTO `fx_countys` VALUES ('1735', '207', '3', '赫山区', '1', '0');
INSERT INTO `fx_countys` VALUES ('1736', '207', '3', '资阳区', '1', '0');
INSERT INTO `fx_countys` VALUES ('1737', '207', '3', '沅江市', '1', '0');
INSERT INTO `fx_countys` VALUES ('1738', '207', '3', '南县', '1', '0');
INSERT INTO `fx_countys` VALUES ('1739', '207', '3', '桃江县', '1', '0');
INSERT INTO `fx_countys` VALUES ('1740', '207', '3', '安化县', '1', '0');
INSERT INTO `fx_countys` VALUES ('1741', '208', '3', '江华', '1', '0');
INSERT INTO `fx_countys` VALUES ('1742', '208', '3', '冷水滩区', '1', '0');
INSERT INTO `fx_countys` VALUES ('1743', '208', '3', '零陵区', '1', '0');
INSERT INTO `fx_countys` VALUES ('1744', '208', '3', '祁阳县', '1', '0');
INSERT INTO `fx_countys` VALUES ('1745', '208', '3', '东安县', '1', '0');
INSERT INTO `fx_countys` VALUES ('1746', '208', '3', '双牌县', '1', '0');
INSERT INTO `fx_countys` VALUES ('1747', '208', '3', '道县', '1', '0');
INSERT INTO `fx_countys` VALUES ('1748', '208', '3', '江永县', '1', '0');
INSERT INTO `fx_countys` VALUES ('1749', '208', '3', '宁远县', '1', '0');
INSERT INTO `fx_countys` VALUES ('1750', '208', '3', '蓝山县', '1', '0');
INSERT INTO `fx_countys` VALUES ('1751', '208', '3', '新田县', '1', '0');
INSERT INTO `fx_countys` VALUES ('1752', '209', '3', '岳阳楼区', '1', '0');
INSERT INTO `fx_countys` VALUES ('1753', '209', '3', '君山区', '1', '0');
INSERT INTO `fx_countys` VALUES ('1754', '209', '3', '云溪区', '1', '0');
INSERT INTO `fx_countys` VALUES ('1755', '209', '3', '汨罗市', '1', '0');
INSERT INTO `fx_countys` VALUES ('1756', '209', '3', '临湘市', '1', '0');
INSERT INTO `fx_countys` VALUES ('1757', '209', '3', '岳阳县', '1', '0');
INSERT INTO `fx_countys` VALUES ('1758', '209', '3', '华容县', '1', '0');
INSERT INTO `fx_countys` VALUES ('1759', '209', '3', '湘阴县', '1', '0');
INSERT INTO `fx_countys` VALUES ('1760', '209', '3', '平江县', '1', '0');
INSERT INTO `fx_countys` VALUES ('1761', '210', '3', '天元区', '1', '0');
INSERT INTO `fx_countys` VALUES ('1762', '210', '3', '荷塘区', '1', '0');
INSERT INTO `fx_countys` VALUES ('1763', '210', '3', '芦淞区', '1', '0');
INSERT INTO `fx_countys` VALUES ('1764', '210', '3', '石峰区', '1', '0');
INSERT INTO `fx_countys` VALUES ('1765', '210', '3', '醴陵市', '1', '0');
INSERT INTO `fx_countys` VALUES ('1766', '210', '3', '株洲县', '1', '0');
INSERT INTO `fx_countys` VALUES ('1767', '210', '3', '攸县', '1', '0');
INSERT INTO `fx_countys` VALUES ('1768', '210', '3', '茶陵县', '1', '0');
INSERT INTO `fx_countys` VALUES ('1769', '210', '3', '炎陵县', '1', '0');
INSERT INTO `fx_countys` VALUES ('1770', '211', '3', '朝阳区', '1', '0');
INSERT INTO `fx_countys` VALUES ('1771', '211', '3', '宽城区', '1', '0');
INSERT INTO `fx_countys` VALUES ('1772', '211', '3', '二道区', '1', '0');
INSERT INTO `fx_countys` VALUES ('1773', '211', '3', '南关区', '1', '0');
INSERT INTO `fx_countys` VALUES ('1774', '211', '3', '绿园区', '1', '0');
INSERT INTO `fx_countys` VALUES ('1775', '211', '3', '双阳区', '1', '0');
INSERT INTO `fx_countys` VALUES ('1776', '211', '3', '净月潭开发区', '1', '0');
INSERT INTO `fx_countys` VALUES ('1777', '211', '3', '高新技术开发区', '1', '0');
INSERT INTO `fx_countys` VALUES ('1778', '211', '3', '经济技术开发区', '1', '0');
INSERT INTO `fx_countys` VALUES ('1779', '211', '3', '汽车产业开发区', '1', '0');
INSERT INTO `fx_countys` VALUES ('1780', '211', '3', '德惠市', '1', '0');
INSERT INTO `fx_countys` VALUES ('1781', '211', '3', '九台市', '1', '0');
INSERT INTO `fx_countys` VALUES ('1782', '211', '3', '榆树市', '1', '0');
INSERT INTO `fx_countys` VALUES ('1783', '211', '3', '农安县', '1', '0');
INSERT INTO `fx_countys` VALUES ('1784', '212', '3', '船营区', '1', '0');
INSERT INTO `fx_countys` VALUES ('1785', '212', '3', '昌邑区', '1', '0');
INSERT INTO `fx_countys` VALUES ('1786', '212', '3', '龙潭区', '1', '0');
INSERT INTO `fx_countys` VALUES ('1787', '212', '3', '丰满区', '1', '0');
INSERT INTO `fx_countys` VALUES ('1788', '212', '3', '蛟河市', '1', '0');
INSERT INTO `fx_countys` VALUES ('1789', '212', '3', '桦甸市', '1', '0');
INSERT INTO `fx_countys` VALUES ('1790', '212', '3', '舒兰市', '1', '0');
INSERT INTO `fx_countys` VALUES ('1791', '212', '3', '磐石市', '1', '0');
INSERT INTO `fx_countys` VALUES ('1792', '212', '3', '永吉县', '1', '0');
INSERT INTO `fx_countys` VALUES ('1793', '213', '3', '洮北区', '1', '0');
INSERT INTO `fx_countys` VALUES ('1794', '213', '3', '洮南市', '1', '0');
INSERT INTO `fx_countys` VALUES ('1795', '213', '3', '大安市', '1', '0');
INSERT INTO `fx_countys` VALUES ('1796', '213', '3', '镇赉县', '1', '0');
INSERT INTO `fx_countys` VALUES ('1797', '213', '3', '通榆县', '1', '0');
INSERT INTO `fx_countys` VALUES ('1798', '214', '3', '江源区', '1', '0');
INSERT INTO `fx_countys` VALUES ('1799', '214', '3', '八道江区', '1', '0');
INSERT INTO `fx_countys` VALUES ('1800', '214', '3', '长白', '1', '0');
INSERT INTO `fx_countys` VALUES ('1801', '214', '3', '临江市', '1', '0');
INSERT INTO `fx_countys` VALUES ('1802', '214', '3', '抚松县', '1', '0');
INSERT INTO `fx_countys` VALUES ('1803', '214', '3', '靖宇县', '1', '0');
INSERT INTO `fx_countys` VALUES ('1804', '215', '3', '龙山区', '1', '0');
INSERT INTO `fx_countys` VALUES ('1805', '215', '3', '西安区', '1', '0');
INSERT INTO `fx_countys` VALUES ('1806', '215', '3', '东丰县', '1', '0');
INSERT INTO `fx_countys` VALUES ('1807', '215', '3', '东辽县', '1', '0');
INSERT INTO `fx_countys` VALUES ('1808', '216', '3', '铁西区', '1', '0');
INSERT INTO `fx_countys` VALUES ('1809', '216', '3', '铁东区', '1', '0');
INSERT INTO `fx_countys` VALUES ('1810', '216', '3', '伊通', '1', '0');
INSERT INTO `fx_countys` VALUES ('1811', '216', '3', '公主岭市', '1', '0');
INSERT INTO `fx_countys` VALUES ('1812', '216', '3', '双辽市', '1', '0');
INSERT INTO `fx_countys` VALUES ('1813', '216', '3', '梨树县', '1', '0');
INSERT INTO `fx_countys` VALUES ('1814', '217', '3', '前郭尔罗斯', '1', '0');
INSERT INTO `fx_countys` VALUES ('1815', '217', '3', '宁江区', '1', '0');
INSERT INTO `fx_countys` VALUES ('1816', '217', '3', '长岭县', '1', '0');
INSERT INTO `fx_countys` VALUES ('1817', '217', '3', '乾安县', '1', '0');
INSERT INTO `fx_countys` VALUES ('1818', '217', '3', '扶余县', '1', '0');
INSERT INTO `fx_countys` VALUES ('1819', '218', '3', '东昌区', '1', '0');
INSERT INTO `fx_countys` VALUES ('1820', '218', '3', '二道江区', '1', '0');
INSERT INTO `fx_countys` VALUES ('1821', '218', '3', '梅河口市', '1', '0');
INSERT INTO `fx_countys` VALUES ('1822', '218', '3', '集安市', '1', '0');
INSERT INTO `fx_countys` VALUES ('1823', '218', '3', '通化县', '1', '0');
INSERT INTO `fx_countys` VALUES ('1824', '218', '3', '辉南县', '1', '0');
INSERT INTO `fx_countys` VALUES ('1825', '218', '3', '柳河县', '1', '0');
INSERT INTO `fx_countys` VALUES ('1826', '219', '3', '延吉市', '1', '0');
INSERT INTO `fx_countys` VALUES ('1827', '219', '3', '图们市', '1', '0');
INSERT INTO `fx_countys` VALUES ('1828', '219', '3', '敦化市', '1', '0');
INSERT INTO `fx_countys` VALUES ('1829', '219', '3', '珲春市', '1', '0');
INSERT INTO `fx_countys` VALUES ('1830', '219', '3', '龙井市', '1', '0');
INSERT INTO `fx_countys` VALUES ('1831', '219', '3', '和龙市', '1', '0');
INSERT INTO `fx_countys` VALUES ('1832', '219', '3', '安图县', '1', '0');
INSERT INTO `fx_countys` VALUES ('1833', '219', '3', '汪清县', '1', '0');
INSERT INTO `fx_countys` VALUES ('1834', '220', '3', '玄武区', '1', '0');
INSERT INTO `fx_countys` VALUES ('1835', '220', '3', '鼓楼区', '1', '0');
INSERT INTO `fx_countys` VALUES ('1836', '220', '3', '白下区', '1', '0');
INSERT INTO `fx_countys` VALUES ('1837', '220', '3', '建邺区', '1', '0');
INSERT INTO `fx_countys` VALUES ('1838', '220', '3', '秦淮区', '1', '0');
INSERT INTO `fx_countys` VALUES ('1839', '220', '3', '雨花台区', '1', '0');
INSERT INTO `fx_countys` VALUES ('1840', '220', '3', '下关区', '1', '0');
INSERT INTO `fx_countys` VALUES ('1841', '220', '3', '栖霞区', '1', '0');
INSERT INTO `fx_countys` VALUES ('1842', '220', '3', '浦口区', '1', '0');
INSERT INTO `fx_countys` VALUES ('1843', '220', '3', '江宁区', '1', '0');
INSERT INTO `fx_countys` VALUES ('1844', '220', '3', '六合区', '1', '0');
INSERT INTO `fx_countys` VALUES ('1845', '220', '3', '溧水县', '1', '0');
INSERT INTO `fx_countys` VALUES ('1846', '220', '3', '高淳县', '1', '0');
INSERT INTO `fx_countys` VALUES ('1847', '221', '3', '沧浪区', '1', '0');
INSERT INTO `fx_countys` VALUES ('1848', '221', '3', '金阊区', '1', '0');
INSERT INTO `fx_countys` VALUES ('1849', '221', '3', '平江区', '1', '0');
INSERT INTO `fx_countys` VALUES ('1850', '221', '3', '虎丘区', '1', '0');
INSERT INTO `fx_countys` VALUES ('1851', '221', '3', '吴中区', '1', '0');
INSERT INTO `fx_countys` VALUES ('1852', '221', '3', '相城区', '1', '0');
INSERT INTO `fx_countys` VALUES ('1853', '221', '3', '园区', '1', '0');
INSERT INTO `fx_countys` VALUES ('1854', '221', '3', '新区', '1', '0');
INSERT INTO `fx_countys` VALUES ('1855', '221', '3', '常熟市', '1', '0');
INSERT INTO `fx_countys` VALUES ('1856', '221', '3', '张家港市', '1', '0');
INSERT INTO `fx_countys` VALUES ('1857', '221', '3', '玉山镇', '1', '0');
INSERT INTO `fx_countys` VALUES ('1858', '221', '3', '巴城镇', '1', '0');
INSERT INTO `fx_countys` VALUES ('1859', '221', '3', '周市镇', '1', '0');
INSERT INTO `fx_countys` VALUES ('1860', '221', '3', '陆家镇', '1', '0');
INSERT INTO `fx_countys` VALUES ('1861', '221', '3', '花桥镇', '1', '0');
INSERT INTO `fx_countys` VALUES ('1862', '221', '3', '淀山湖镇', '1', '0');
INSERT INTO `fx_countys` VALUES ('1863', '221', '3', '张浦镇', '1', '0');
INSERT INTO `fx_countys` VALUES ('1864', '221', '3', '周庄镇', '1', '0');
INSERT INTO `fx_countys` VALUES ('1865', '221', '3', '千灯镇', '1', '0');
INSERT INTO `fx_countys` VALUES ('1866', '221', '3', '锦溪镇', '1', '0');
INSERT INTO `fx_countys` VALUES ('1867', '221', '3', '开发区', '1', '0');
INSERT INTO `fx_countys` VALUES ('1868', '221', '3', '吴江市', '1', '0');
INSERT INTO `fx_countys` VALUES ('1869', '221', '3', '太仓市', '1', '0');
INSERT INTO `fx_countys` VALUES ('1870', '222', '3', '崇安区', '1', '0');
INSERT INTO `fx_countys` VALUES ('1871', '222', '3', '北塘区', '1', '0');
INSERT INTO `fx_countys` VALUES ('1872', '222', '3', '南长区', '1', '0');
INSERT INTO `fx_countys` VALUES ('1873', '222', '3', '锡山区', '1', '0');
INSERT INTO `fx_countys` VALUES ('1874', '222', '3', '惠山区', '1', '0');
INSERT INTO `fx_countys` VALUES ('1875', '222', '3', '滨湖区', '1', '0');
INSERT INTO `fx_countys` VALUES ('1876', '222', '3', '新区', '1', '0');
INSERT INTO `fx_countys` VALUES ('1877', '222', '3', '江阴市', '1', '0');
INSERT INTO `fx_countys` VALUES ('1878', '222', '3', '宜兴市', '1', '0');
INSERT INTO `fx_countys` VALUES ('1879', '223', '3', '天宁区', '1', '0');
INSERT INTO `fx_countys` VALUES ('1880', '223', '3', '钟楼区', '1', '0');
INSERT INTO `fx_countys` VALUES ('1881', '223', '3', '戚墅堰区', '1', '0');
INSERT INTO `fx_countys` VALUES ('1882', '223', '3', '郊区', '1', '0');
INSERT INTO `fx_countys` VALUES ('1883', '223', '3', '新北区', '1', '0');
INSERT INTO `fx_countys` VALUES ('1884', '223', '3', '武进区', '1', '0');
INSERT INTO `fx_countys` VALUES ('1885', '223', '3', '溧阳市', '1', '0');
INSERT INTO `fx_countys` VALUES ('1886', '223', '3', '金坛市', '1', '0');
INSERT INTO `fx_countys` VALUES ('1887', '224', '3', '清河区', '1', '0');
INSERT INTO `fx_countys` VALUES ('1888', '224', '3', '清浦区', '1', '0');
INSERT INTO `fx_countys` VALUES ('1889', '224', '3', '楚州区', '1', '0');
INSERT INTO `fx_countys` VALUES ('1890', '224', '3', '淮阴区', '1', '0');
INSERT INTO `fx_countys` VALUES ('1891', '224', '3', '涟水县', '1', '0');
INSERT INTO `fx_countys` VALUES ('1892', '224', '3', '洪泽县', '1', '0');
INSERT INTO `fx_countys` VALUES ('1893', '224', '3', '盱眙县', '1', '0');
INSERT INTO `fx_countys` VALUES ('1894', '224', '3', '金湖县', '1', '0');
INSERT INTO `fx_countys` VALUES ('1895', '225', '3', '新浦区', '1', '0');
INSERT INTO `fx_countys` VALUES ('1896', '225', '3', '连云区', '1', '0');
INSERT INTO `fx_countys` VALUES ('1897', '225', '3', '海州区', '1', '0');
INSERT INTO `fx_countys` VALUES ('1898', '225', '3', '赣榆县', '1', '0');
INSERT INTO `fx_countys` VALUES ('1899', '225', '3', '东海县', '1', '0');
INSERT INTO `fx_countys` VALUES ('1900', '225', '3', '灌云县', '1', '0');
INSERT INTO `fx_countys` VALUES ('1901', '225', '3', '灌南县', '1', '0');
INSERT INTO `fx_countys` VALUES ('1902', '226', '3', '崇川区', '1', '0');
INSERT INTO `fx_countys` VALUES ('1903', '226', '3', '港闸区', '1', '0');
INSERT INTO `fx_countys` VALUES ('1904', '226', '3', '经济开发区', '1', '0');
INSERT INTO `fx_countys` VALUES ('1905', '226', '3', '启东市', '1', '0');
INSERT INTO `fx_countys` VALUES ('1906', '226', '3', '如皋市', '1', '0');
INSERT INTO `fx_countys` VALUES ('1907', '226', '3', '通州市', '1', '0');
INSERT INTO `fx_countys` VALUES ('1908', '226', '3', '海门市', '1', '0');
INSERT INTO `fx_countys` VALUES ('1909', '226', '3', '海安县', '1', '0');
INSERT INTO `fx_countys` VALUES ('1910', '226', '3', '如东县', '1', '0');
INSERT INTO `fx_countys` VALUES ('1911', '227', '3', '宿城区', '1', '0');
INSERT INTO `fx_countys` VALUES ('1912', '227', '3', '宿豫区', '1', '0');
INSERT INTO `fx_countys` VALUES ('1913', '227', '3', '宿豫县', '1', '0');
INSERT INTO `fx_countys` VALUES ('1914', '227', '3', '沭阳县', '1', '0');
INSERT INTO `fx_countys` VALUES ('1915', '227', '3', '泗阳县', '1', '0');
INSERT INTO `fx_countys` VALUES ('1916', '227', '3', '泗洪县', '1', '0');
INSERT INTO `fx_countys` VALUES ('1917', '228', '3', '海陵区', '1', '0');
INSERT INTO `fx_countys` VALUES ('1918', '228', '3', '高港区', '1', '0');
INSERT INTO `fx_countys` VALUES ('1919', '228', '3', '兴化市', '1', '0');
INSERT INTO `fx_countys` VALUES ('1920', '228', '3', '靖江市', '1', '0');
INSERT INTO `fx_countys` VALUES ('1921', '228', '3', '泰兴市', '1', '0');
INSERT INTO `fx_countys` VALUES ('1922', '228', '3', '姜堰市', '1', '0');
INSERT INTO `fx_countys` VALUES ('1923', '229', '3', '云龙区', '1', '0');
INSERT INTO `fx_countys` VALUES ('1924', '229', '3', '鼓楼区', '1', '0');
INSERT INTO `fx_countys` VALUES ('1925', '229', '3', '九里区', '1', '0');
INSERT INTO `fx_countys` VALUES ('1926', '229', '3', '贾汪区', '1', '0');
INSERT INTO `fx_countys` VALUES ('1927', '229', '3', '泉山区', '1', '0');
INSERT INTO `fx_countys` VALUES ('1928', '229', '3', '新沂市', '1', '0');
INSERT INTO `fx_countys` VALUES ('1929', '229', '3', '邳州市', '1', '0');
INSERT INTO `fx_countys` VALUES ('1930', '229', '3', '丰县', '1', '0');
INSERT INTO `fx_countys` VALUES ('1931', '229', '3', '沛县', '1', '0');
INSERT INTO `fx_countys` VALUES ('1932', '229', '3', '铜山县', '1', '0');
INSERT INTO `fx_countys` VALUES ('1933', '229', '3', '睢宁县', '1', '0');
INSERT INTO `fx_countys` VALUES ('1934', '230', '3', '城区', '1', '0');
INSERT INTO `fx_countys` VALUES ('1935', '230', '3', '亭湖区', '1', '0');
INSERT INTO `fx_countys` VALUES ('1936', '230', '3', '盐都区', '1', '0');
INSERT INTO `fx_countys` VALUES ('1937', '230', '3', '盐都县', '1', '0');
INSERT INTO `fx_countys` VALUES ('1938', '230', '3', '东台市', '1', '0');
INSERT INTO `fx_countys` VALUES ('1939', '230', '3', '大丰市', '1', '0');
INSERT INTO `fx_countys` VALUES ('1940', '230', '3', '响水县', '1', '0');
INSERT INTO `fx_countys` VALUES ('1941', '230', '3', '滨海县', '1', '0');
INSERT INTO `fx_countys` VALUES ('1942', '230', '3', '阜宁县', '1', '0');
INSERT INTO `fx_countys` VALUES ('1943', '230', '3', '射阳县', '1', '0');
INSERT INTO `fx_countys` VALUES ('1944', '230', '3', '建湖县', '1', '0');
INSERT INTO `fx_countys` VALUES ('1945', '231', '3', '广陵区', '1', '0');
INSERT INTO `fx_countys` VALUES ('1946', '231', '3', '维扬区', '1', '0');
INSERT INTO `fx_countys` VALUES ('1947', '231', '3', '邗江区', '1', '0');
INSERT INTO `fx_countys` VALUES ('1948', '231', '3', '仪征市', '1', '0');
INSERT INTO `fx_countys` VALUES ('1949', '231', '3', '高邮市', '1', '0');
INSERT INTO `fx_countys` VALUES ('1950', '231', '3', '江都市', '1', '0');
INSERT INTO `fx_countys` VALUES ('1951', '231', '3', '宝应县', '1', '0');
INSERT INTO `fx_countys` VALUES ('1952', '232', '3', '京口区', '1', '0');
INSERT INTO `fx_countys` VALUES ('1953', '232', '3', '润州区', '1', '0');
INSERT INTO `fx_countys` VALUES ('1954', '232', '3', '丹徒区', '1', '0');
INSERT INTO `fx_countys` VALUES ('1955', '232', '3', '丹阳市', '1', '0');
INSERT INTO `fx_countys` VALUES ('1956', '232', '3', '扬中市', '1', '0');
INSERT INTO `fx_countys` VALUES ('1957', '232', '3', '句容市', '1', '0');
INSERT INTO `fx_countys` VALUES ('1958', '233', '3', '东湖区', '1', '0');
INSERT INTO `fx_countys` VALUES ('1959', '233', '3', '西湖区', '1', '0');
INSERT INTO `fx_countys` VALUES ('1960', '233', '3', '青云谱区', '1', '0');
INSERT INTO `fx_countys` VALUES ('1961', '233', '3', '湾里区', '1', '0');
INSERT INTO `fx_countys` VALUES ('1962', '233', '3', '青山湖区', '1', '0');
INSERT INTO `fx_countys` VALUES ('1963', '233', '3', '红谷滩新区', '1', '0');
INSERT INTO `fx_countys` VALUES ('1964', '233', '3', '昌北区', '1', '0');
INSERT INTO `fx_countys` VALUES ('1965', '233', '3', '高新区', '1', '0');
INSERT INTO `fx_countys` VALUES ('1966', '233', '3', '南昌县', '1', '0');
INSERT INTO `fx_countys` VALUES ('1967', '233', '3', '新建县', '1', '0');
INSERT INTO `fx_countys` VALUES ('1968', '233', '3', '安义县', '1', '0');
INSERT INTO `fx_countys` VALUES ('1969', '233', '3', '进贤县', '1', '0');
INSERT INTO `fx_countys` VALUES ('1970', '234', '3', '临川区', '1', '0');
INSERT INTO `fx_countys` VALUES ('1971', '234', '3', '南城县', '1', '0');
INSERT INTO `fx_countys` VALUES ('1972', '234', '3', '黎川县', '1', '0');
INSERT INTO `fx_countys` VALUES ('1973', '234', '3', '南丰县', '1', '0');
INSERT INTO `fx_countys` VALUES ('1974', '234', '3', '崇仁县', '1', '0');
INSERT INTO `fx_countys` VALUES ('1975', '234', '3', '乐安县', '1', '0');
INSERT INTO `fx_countys` VALUES ('1976', '234', '3', '宜黄县', '1', '0');
INSERT INTO `fx_countys` VALUES ('1977', '234', '3', '金溪县', '1', '0');
INSERT INTO `fx_countys` VALUES ('1978', '234', '3', '资溪县', '1', '0');
INSERT INTO `fx_countys` VALUES ('1979', '234', '3', '东乡县', '1', '0');
INSERT INTO `fx_countys` VALUES ('1980', '234', '3', '广昌县', '1', '0');
INSERT INTO `fx_countys` VALUES ('1981', '235', '3', '章贡区', '1', '0');
INSERT INTO `fx_countys` VALUES ('1982', '235', '3', '于都县', '1', '0');
INSERT INTO `fx_countys` VALUES ('1983', '235', '3', '瑞金市', '1', '0');
INSERT INTO `fx_countys` VALUES ('1984', '235', '3', '南康市', '1', '0');
INSERT INTO `fx_countys` VALUES ('1985', '235', '3', '赣县', '1', '0');
INSERT INTO `fx_countys` VALUES ('1986', '235', '3', '信丰县', '1', '0');
INSERT INTO `fx_countys` VALUES ('1987', '235', '3', '大余县', '1', '0');
INSERT INTO `fx_countys` VALUES ('1988', '235', '3', '上犹县', '1', '0');
INSERT INTO `fx_countys` VALUES ('1989', '235', '3', '崇义县', '1', '0');
INSERT INTO `fx_countys` VALUES ('1990', '235', '3', '安远县', '1', '0');
INSERT INTO `fx_countys` VALUES ('1991', '235', '3', '龙南县', '1', '0');
INSERT INTO `fx_countys` VALUES ('1992', '235', '3', '定南县', '1', '0');
INSERT INTO `fx_countys` VALUES ('1993', '235', '3', '全南县', '1', '0');
INSERT INTO `fx_countys` VALUES ('1994', '235', '3', '宁都县', '1', '0');
INSERT INTO `fx_countys` VALUES ('1995', '235', '3', '兴国县', '1', '0');
INSERT INTO `fx_countys` VALUES ('1996', '235', '3', '会昌县', '1', '0');
INSERT INTO `fx_countys` VALUES ('1997', '235', '3', '寻乌县', '1', '0');
INSERT INTO `fx_countys` VALUES ('1998', '235', '3', '石城县', '1', '0');
INSERT INTO `fx_countys` VALUES ('1999', '236', '3', '安福县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2000', '236', '3', '吉州区', '1', '0');
INSERT INTO `fx_countys` VALUES ('2001', '236', '3', '青原区', '1', '0');
INSERT INTO `fx_countys` VALUES ('2002', '236', '3', '井冈山市', '1', '0');
INSERT INTO `fx_countys` VALUES ('2003', '236', '3', '吉安县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2004', '236', '3', '吉水县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2005', '236', '3', '峡江县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2006', '236', '3', '新干县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2007', '236', '3', '永丰县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2008', '236', '3', '泰和县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2009', '236', '3', '遂川县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2010', '236', '3', '万安县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2011', '236', '3', '永新县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2012', '237', '3', '珠山区', '1', '0');
INSERT INTO `fx_countys` VALUES ('2013', '237', '3', '昌江区', '1', '0');
INSERT INTO `fx_countys` VALUES ('2014', '237', '3', '乐平市', '1', '0');
INSERT INTO `fx_countys` VALUES ('2015', '237', '3', '浮梁县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2016', '238', '3', '浔阳区', '1', '0');
INSERT INTO `fx_countys` VALUES ('2017', '238', '3', '庐山区', '1', '0');
INSERT INTO `fx_countys` VALUES ('2018', '238', '3', '瑞昌市', '1', '0');
INSERT INTO `fx_countys` VALUES ('2019', '238', '3', '九江县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2020', '238', '3', '武宁县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2021', '238', '3', '修水县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2022', '238', '3', '永修县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2023', '238', '3', '德安县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2024', '238', '3', '星子县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2025', '238', '3', '都昌县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2026', '238', '3', '湖口县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2027', '238', '3', '彭泽县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2028', '239', '3', '安源区', '1', '0');
INSERT INTO `fx_countys` VALUES ('2029', '239', '3', '湘东区', '1', '0');
INSERT INTO `fx_countys` VALUES ('2030', '239', '3', '莲花县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2031', '239', '3', '芦溪县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2032', '239', '3', '上栗县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2033', '240', '3', '信州区', '1', '0');
INSERT INTO `fx_countys` VALUES ('2034', '240', '3', '德兴市', '1', '0');
INSERT INTO `fx_countys` VALUES ('2035', '240', '3', '上饶县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2036', '240', '3', '广丰县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2037', '240', '3', '玉山县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2038', '240', '3', '铅山县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2039', '240', '3', '横峰县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2040', '240', '3', '弋阳县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2041', '240', '3', '余干县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2042', '240', '3', '波阳县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2043', '240', '3', '万年县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2044', '240', '3', '婺源县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2045', '241', '3', '渝水区', '1', '0');
INSERT INTO `fx_countys` VALUES ('2046', '241', '3', '分宜县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2047', '242', '3', '袁州区', '1', '0');
INSERT INTO `fx_countys` VALUES ('2048', '242', '3', '丰城市', '1', '0');
INSERT INTO `fx_countys` VALUES ('2049', '242', '3', '樟树市', '1', '0');
INSERT INTO `fx_countys` VALUES ('2050', '242', '3', '高安市', '1', '0');
INSERT INTO `fx_countys` VALUES ('2051', '242', '3', '奉新县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2052', '242', '3', '万载县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2053', '242', '3', '上高县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2054', '242', '3', '宜丰县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2055', '242', '3', '靖安县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2056', '242', '3', '铜鼓县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2057', '243', '3', '月湖区', '1', '0');
INSERT INTO `fx_countys` VALUES ('2058', '243', '3', '贵溪市', '1', '0');
INSERT INTO `fx_countys` VALUES ('2059', '243', '3', '余江县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2060', '244', '3', '沈河区', '1', '0');
INSERT INTO `fx_countys` VALUES ('2061', '244', '3', '皇姑区', '1', '0');
INSERT INTO `fx_countys` VALUES ('2062', '244', '3', '和平区', '1', '0');
INSERT INTO `fx_countys` VALUES ('2063', '244', '3', '大东区', '1', '0');
INSERT INTO `fx_countys` VALUES ('2064', '244', '3', '铁西区', '1', '0');
INSERT INTO `fx_countys` VALUES ('2065', '244', '3', '苏家屯区', '1', '0');
INSERT INTO `fx_countys` VALUES ('2066', '244', '3', '东陵区', '1', '0');
INSERT INTO `fx_countys` VALUES ('2067', '244', '3', '沈北新区', '1', '0');
INSERT INTO `fx_countys` VALUES ('2068', '244', '3', '于洪区', '1', '0');
INSERT INTO `fx_countys` VALUES ('2069', '244', '3', '浑南新区', '1', '0');
INSERT INTO `fx_countys` VALUES ('2070', '244', '3', '新民市', '1', '0');
INSERT INTO `fx_countys` VALUES ('2071', '244', '3', '辽中县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2072', '244', '3', '康平县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2073', '244', '3', '法库县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2074', '245', '3', '西岗区', '1', '0');
INSERT INTO `fx_countys` VALUES ('2075', '245', '3', '中山区', '1', '0');
INSERT INTO `fx_countys` VALUES ('2076', '245', '3', '沙河口区', '1', '0');
INSERT INTO `fx_countys` VALUES ('2077', '245', '3', '甘井子区', '1', '0');
INSERT INTO `fx_countys` VALUES ('2078', '245', '3', '旅顺口区', '1', '0');
INSERT INTO `fx_countys` VALUES ('2079', '245', '3', '金州区', '1', '0');
INSERT INTO `fx_countys` VALUES ('2080', '245', '3', '开发区', '1', '0');
INSERT INTO `fx_countys` VALUES ('2081', '245', '3', '瓦房店市', '1', '0');
INSERT INTO `fx_countys` VALUES ('2082', '245', '3', '普兰店市', '1', '0');
INSERT INTO `fx_countys` VALUES ('2083', '245', '3', '庄河市', '1', '0');
INSERT INTO `fx_countys` VALUES ('2084', '245', '3', '长海县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2085', '246', '3', '铁东区', '1', '0');
INSERT INTO `fx_countys` VALUES ('2086', '246', '3', '铁西区', '1', '0');
INSERT INTO `fx_countys` VALUES ('2087', '246', '3', '立山区', '1', '0');
INSERT INTO `fx_countys` VALUES ('2088', '246', '3', '千山区', '1', '0');
INSERT INTO `fx_countys` VALUES ('2089', '246', '3', '岫岩', '1', '0');
INSERT INTO `fx_countys` VALUES ('2090', '246', '3', '海城市', '1', '0');
INSERT INTO `fx_countys` VALUES ('2091', '246', '3', '台安县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2092', '247', '3', '本溪', '1', '0');
INSERT INTO `fx_countys` VALUES ('2093', '247', '3', '平山区', '1', '0');
INSERT INTO `fx_countys` VALUES ('2094', '247', '3', '明山区', '1', '0');
INSERT INTO `fx_countys` VALUES ('2095', '247', '3', '溪湖区', '1', '0');
INSERT INTO `fx_countys` VALUES ('2096', '247', '3', '南芬区', '1', '0');
INSERT INTO `fx_countys` VALUES ('2097', '247', '3', '桓仁', '1', '0');
INSERT INTO `fx_countys` VALUES ('2098', '248', '3', '双塔区', '1', '0');
INSERT INTO `fx_countys` VALUES ('2099', '248', '3', '龙城区', '1', '0');
INSERT INTO `fx_countys` VALUES ('2100', '248', '3', '喀喇沁左翼蒙古族自治县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2101', '248', '3', '北票市', '1', '0');
INSERT INTO `fx_countys` VALUES ('2102', '248', '3', '凌源市', '1', '0');
INSERT INTO `fx_countys` VALUES ('2103', '248', '3', '朝阳县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2104', '248', '3', '建平县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2105', '249', '3', '振兴区', '1', '0');
INSERT INTO `fx_countys` VALUES ('2106', '249', '3', '元宝区', '1', '0');
INSERT INTO `fx_countys` VALUES ('2107', '249', '3', '振安区', '1', '0');
INSERT INTO `fx_countys` VALUES ('2108', '249', '3', '宽甸', '1', '0');
INSERT INTO `fx_countys` VALUES ('2109', '249', '3', '东港市', '1', '0');
INSERT INTO `fx_countys` VALUES ('2110', '249', '3', '凤城市', '1', '0');
INSERT INTO `fx_countys` VALUES ('2111', '250', '3', '顺城区', '1', '0');
INSERT INTO `fx_countys` VALUES ('2112', '250', '3', '新抚区', '1', '0');
INSERT INTO `fx_countys` VALUES ('2113', '250', '3', '东洲区', '1', '0');
INSERT INTO `fx_countys` VALUES ('2114', '250', '3', '望花区', '1', '0');
INSERT INTO `fx_countys` VALUES ('2115', '250', '3', '清原', '1', '0');
INSERT INTO `fx_countys` VALUES ('2116', '250', '3', '新宾', '1', '0');
INSERT INTO `fx_countys` VALUES ('2117', '250', '3', '抚顺县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2118', '251', '3', '阜新', '1', '0');
INSERT INTO `fx_countys` VALUES ('2119', '251', '3', '海州区', '1', '0');
INSERT INTO `fx_countys` VALUES ('2120', '251', '3', '新邱区', '1', '0');
INSERT INTO `fx_countys` VALUES ('2121', '251', '3', '太平区', '1', '0');
INSERT INTO `fx_countys` VALUES ('2122', '251', '3', '清河门区', '1', '0');
INSERT INTO `fx_countys` VALUES ('2123', '251', '3', '细河区', '1', '0');
INSERT INTO `fx_countys` VALUES ('2124', '251', '3', '彰武县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2125', '252', '3', '龙港区', '1', '0');
INSERT INTO `fx_countys` VALUES ('2126', '252', '3', '南票区', '1', '0');
INSERT INTO `fx_countys` VALUES ('2127', '252', '3', '连山区', '1', '0');
INSERT INTO `fx_countys` VALUES ('2128', '252', '3', '兴城市', '1', '0');
INSERT INTO `fx_countys` VALUES ('2129', '252', '3', '绥中县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2130', '252', '3', '建昌县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2131', '253', '3', '太和区', '1', '0');
INSERT INTO `fx_countys` VALUES ('2132', '253', '3', '古塔区', '1', '0');
INSERT INTO `fx_countys` VALUES ('2133', '253', '3', '凌河区', '1', '0');
INSERT INTO `fx_countys` VALUES ('2134', '253', '3', '凌海市', '1', '0');
INSERT INTO `fx_countys` VALUES ('2135', '253', '3', '北镇市', '1', '0');
INSERT INTO `fx_countys` VALUES ('2136', '253', '3', '黑山县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2137', '253', '3', '义县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2138', '254', '3', '白塔区', '1', '0');
INSERT INTO `fx_countys` VALUES ('2139', '254', '3', '文圣区', '1', '0');
INSERT INTO `fx_countys` VALUES ('2140', '254', '3', '宏伟区', '1', '0');
INSERT INTO `fx_countys` VALUES ('2141', '254', '3', '太子河区', '1', '0');
INSERT INTO `fx_countys` VALUES ('2142', '254', '3', '弓长岭区', '1', '0');
INSERT INTO `fx_countys` VALUES ('2143', '254', '3', '灯塔市', '1', '0');
INSERT INTO `fx_countys` VALUES ('2144', '254', '3', '辽阳县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2145', '255', '3', '双台子区', '1', '0');
INSERT INTO `fx_countys` VALUES ('2146', '255', '3', '兴隆台区', '1', '0');
INSERT INTO `fx_countys` VALUES ('2147', '255', '3', '大洼县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2148', '255', '3', '盘山县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2149', '256', '3', '银州区', '1', '0');
INSERT INTO `fx_countys` VALUES ('2150', '256', '3', '清河区', '1', '0');
INSERT INTO `fx_countys` VALUES ('2151', '256', '3', '调兵山市', '1', '0');
INSERT INTO `fx_countys` VALUES ('2152', '256', '3', '开原市', '1', '0');
INSERT INTO `fx_countys` VALUES ('2153', '256', '3', '铁岭县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2154', '256', '3', '西丰县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2155', '256', '3', '昌图县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2156', '257', '3', '站前区', '1', '0');
INSERT INTO `fx_countys` VALUES ('2157', '257', '3', '西市区', '1', '0');
INSERT INTO `fx_countys` VALUES ('2158', '257', '3', '鲅鱼圈区', '1', '0');
INSERT INTO `fx_countys` VALUES ('2159', '257', '3', '老边区', '1', '0');
INSERT INTO `fx_countys` VALUES ('2160', '257', '3', '盖州市', '1', '0');
INSERT INTO `fx_countys` VALUES ('2161', '257', '3', '大石桥市', '1', '0');
INSERT INTO `fx_countys` VALUES ('2162', '258', '3', '回民区', '1', '0');
INSERT INTO `fx_countys` VALUES ('2163', '258', '3', '玉泉区', '1', '0');
INSERT INTO `fx_countys` VALUES ('2164', '258', '3', '新城区', '1', '0');
INSERT INTO `fx_countys` VALUES ('2165', '258', '3', '赛罕区', '1', '0');
INSERT INTO `fx_countys` VALUES ('2166', '258', '3', '清水河县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2167', '258', '3', '土默特左旗', '1', '0');
INSERT INTO `fx_countys` VALUES ('2168', '258', '3', '托克托县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2169', '258', '3', '和林格尔县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2170', '258', '3', '武川县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2171', '259', '3', '阿拉善左旗', '1', '0');
INSERT INTO `fx_countys` VALUES ('2172', '259', '3', '阿拉善右旗', '1', '0');
INSERT INTO `fx_countys` VALUES ('2173', '259', '3', '额济纳旗', '1', '0');
INSERT INTO `fx_countys` VALUES ('2174', '260', '3', '临河区', '1', '0');
INSERT INTO `fx_countys` VALUES ('2175', '260', '3', '五原县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2176', '260', '3', '磴口县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2177', '260', '3', '乌拉特前旗', '1', '0');
INSERT INTO `fx_countys` VALUES ('2178', '260', '3', '乌拉特中旗', '1', '0');
INSERT INTO `fx_countys` VALUES ('2179', '260', '3', '乌拉特后旗', '1', '0');
INSERT INTO `fx_countys` VALUES ('2180', '260', '3', '杭锦后旗', '1', '0');
INSERT INTO `fx_countys` VALUES ('2181', '261', '3', '昆都仑区', '1', '0');
INSERT INTO `fx_countys` VALUES ('2182', '261', '3', '青山区', '1', '0');
INSERT INTO `fx_countys` VALUES ('2183', '261', '3', '东河区', '1', '0');
INSERT INTO `fx_countys` VALUES ('2184', '261', '3', '九原区', '1', '0');
INSERT INTO `fx_countys` VALUES ('2185', '261', '3', '石拐区', '1', '0');
INSERT INTO `fx_countys` VALUES ('2186', '261', '3', '白云矿区', '1', '0');
INSERT INTO `fx_countys` VALUES ('2187', '261', '3', '土默特右旗', '1', '0');
INSERT INTO `fx_countys` VALUES ('2188', '261', '3', '固阳县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2189', '261', '3', '达尔罕茂明安联合旗', '1', '0');
INSERT INTO `fx_countys` VALUES ('2190', '262', '3', '红山区', '1', '0');
INSERT INTO `fx_countys` VALUES ('2191', '262', '3', '元宝山区', '1', '0');
INSERT INTO `fx_countys` VALUES ('2192', '262', '3', '松山区', '1', '0');
INSERT INTO `fx_countys` VALUES ('2193', '262', '3', '阿鲁科尔沁旗', '1', '0');
INSERT INTO `fx_countys` VALUES ('2194', '262', '3', '巴林左旗', '1', '0');
INSERT INTO `fx_countys` VALUES ('2195', '262', '3', '巴林右旗', '1', '0');
INSERT INTO `fx_countys` VALUES ('2196', '262', '3', '林西县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2197', '262', '3', '克什克腾旗', '1', '0');
INSERT INTO `fx_countys` VALUES ('2198', '262', '3', '翁牛特旗', '1', '0');
INSERT INTO `fx_countys` VALUES ('2199', '262', '3', '喀喇沁旗', '1', '0');
INSERT INTO `fx_countys` VALUES ('2200', '262', '3', '宁城县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2201', '262', '3', '敖汉旗', '1', '0');
INSERT INTO `fx_countys` VALUES ('2202', '263', '3', '东胜区', '1', '0');
INSERT INTO `fx_countys` VALUES ('2203', '263', '3', '达拉特旗', '1', '0');
INSERT INTO `fx_countys` VALUES ('2204', '263', '3', '准格尔旗', '1', '0');
INSERT INTO `fx_countys` VALUES ('2205', '263', '3', '鄂托克前旗', '1', '0');
INSERT INTO `fx_countys` VALUES ('2206', '263', '3', '鄂托克旗', '1', '0');
INSERT INTO `fx_countys` VALUES ('2207', '263', '3', '杭锦旗', '1', '0');
INSERT INTO `fx_countys` VALUES ('2208', '263', '3', '乌审旗', '1', '0');
INSERT INTO `fx_countys` VALUES ('2209', '263', '3', '伊金霍洛旗', '1', '0');
INSERT INTO `fx_countys` VALUES ('2210', '264', '3', '海拉尔区', '1', '0');
INSERT INTO `fx_countys` VALUES ('2211', '264', '3', '莫力达瓦', '1', '0');
INSERT INTO `fx_countys` VALUES ('2212', '264', '3', '满洲里市', '1', '0');
INSERT INTO `fx_countys` VALUES ('2213', '264', '3', '牙克石市', '1', '0');
INSERT INTO `fx_countys` VALUES ('2214', '264', '3', '扎兰屯市', '1', '0');
INSERT INTO `fx_countys` VALUES ('2215', '264', '3', '额尔古纳市', '1', '0');
INSERT INTO `fx_countys` VALUES ('2216', '264', '3', '根河市', '1', '0');
INSERT INTO `fx_countys` VALUES ('2217', '264', '3', '阿荣旗', '1', '0');
INSERT INTO `fx_countys` VALUES ('2218', '264', '3', '鄂伦春自治旗', '1', '0');
INSERT INTO `fx_countys` VALUES ('2219', '264', '3', '鄂温克族自治旗', '1', '0');
INSERT INTO `fx_countys` VALUES ('2220', '264', '3', '陈巴尔虎旗', '1', '0');
INSERT INTO `fx_countys` VALUES ('2221', '264', '3', '新巴尔虎左旗', '1', '0');
INSERT INTO `fx_countys` VALUES ('2222', '264', '3', '新巴尔虎右旗', '1', '0');
INSERT INTO `fx_countys` VALUES ('2223', '265', '3', '科尔沁区', '1', '0');
INSERT INTO `fx_countys` VALUES ('2224', '265', '3', '霍林郭勒市', '1', '0');
INSERT INTO `fx_countys` VALUES ('2225', '265', '3', '科尔沁左翼中旗', '1', '0');
INSERT INTO `fx_countys` VALUES ('2226', '265', '3', '科尔沁左翼后旗', '1', '0');
INSERT INTO `fx_countys` VALUES ('2227', '265', '3', '开鲁县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2228', '265', '3', '库伦旗', '1', '0');
INSERT INTO `fx_countys` VALUES ('2229', '265', '3', '奈曼旗', '1', '0');
INSERT INTO `fx_countys` VALUES ('2230', '265', '3', '扎鲁特旗', '1', '0');
INSERT INTO `fx_countys` VALUES ('2231', '266', '3', '海勃湾区', '1', '0');
INSERT INTO `fx_countys` VALUES ('2232', '266', '3', '乌达区', '1', '0');
INSERT INTO `fx_countys` VALUES ('2233', '266', '3', '海南区', '1', '0');
INSERT INTO `fx_countys` VALUES ('2234', '267', '3', '化德县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2235', '267', '3', '集宁区', '1', '0');
INSERT INTO `fx_countys` VALUES ('2236', '267', '3', '丰镇市', '1', '0');
INSERT INTO `fx_countys` VALUES ('2237', '267', '3', '卓资县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2238', '267', '3', '商都县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2239', '267', '3', '兴和县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2240', '267', '3', '凉城县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2241', '267', '3', '察哈尔右翼前旗', '1', '0');
INSERT INTO `fx_countys` VALUES ('2242', '267', '3', '察哈尔右翼中旗', '1', '0');
INSERT INTO `fx_countys` VALUES ('2243', '267', '3', '察哈尔右翼后旗', '1', '0');
INSERT INTO `fx_countys` VALUES ('2244', '267', '3', '四子王旗', '1', '0');
INSERT INTO `fx_countys` VALUES ('2245', '268', '3', '二连浩特市', '1', '0');
INSERT INTO `fx_countys` VALUES ('2246', '268', '3', '锡林浩特市', '1', '0');
INSERT INTO `fx_countys` VALUES ('2247', '268', '3', '阿巴嘎旗', '1', '0');
INSERT INTO `fx_countys` VALUES ('2248', '268', '3', '苏尼特左旗', '1', '0');
INSERT INTO `fx_countys` VALUES ('2249', '268', '3', '苏尼特右旗', '1', '0');
INSERT INTO `fx_countys` VALUES ('2250', '268', '3', '东乌珠穆沁旗', '1', '0');
INSERT INTO `fx_countys` VALUES ('2251', '268', '3', '西乌珠穆沁旗', '1', '0');
INSERT INTO `fx_countys` VALUES ('2252', '268', '3', '太仆寺旗', '1', '0');
INSERT INTO `fx_countys` VALUES ('2253', '268', '3', '镶黄旗', '1', '0');
INSERT INTO `fx_countys` VALUES ('2254', '268', '3', '正镶白旗', '1', '0');
INSERT INTO `fx_countys` VALUES ('2255', '268', '3', '正蓝旗', '1', '0');
INSERT INTO `fx_countys` VALUES ('2256', '268', '3', '多伦县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2257', '269', '3', '乌兰浩特市', '1', '0');
INSERT INTO `fx_countys` VALUES ('2258', '269', '3', '阿尔山市', '1', '0');
INSERT INTO `fx_countys` VALUES ('2259', '269', '3', '科尔沁右翼前旗', '1', '0');
INSERT INTO `fx_countys` VALUES ('2260', '269', '3', '科尔沁右翼中旗', '1', '0');
INSERT INTO `fx_countys` VALUES ('2261', '269', '3', '扎赉特旗', '1', '0');
INSERT INTO `fx_countys` VALUES ('2262', '269', '3', '突泉县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2263', '270', '3', '西夏区', '1', '0');
INSERT INTO `fx_countys` VALUES ('2264', '270', '3', '金凤区', '1', '0');
INSERT INTO `fx_countys` VALUES ('2265', '270', '3', '兴庆区', '1', '0');
INSERT INTO `fx_countys` VALUES ('2266', '270', '3', '灵武市', '1', '0');
INSERT INTO `fx_countys` VALUES ('2267', '270', '3', '永宁县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2268', '270', '3', '贺兰县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2269', '271', '3', '原州区', '1', '0');
INSERT INTO `fx_countys` VALUES ('2270', '271', '3', '海原县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2271', '271', '3', '西吉县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2272', '271', '3', '隆德县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2273', '271', '3', '泾源县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2274', '271', '3', '彭阳县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2275', '272', '3', '惠农县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2276', '272', '3', '大武口区', '1', '0');
INSERT INTO `fx_countys` VALUES ('2277', '272', '3', '惠农区', '1', '0');
INSERT INTO `fx_countys` VALUES ('2278', '272', '3', '陶乐县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2279', '272', '3', '平罗县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2280', '273', '3', '利通区', '1', '0');
INSERT INTO `fx_countys` VALUES ('2281', '273', '3', '中卫县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2282', '273', '3', '青铜峡市', '1', '0');
INSERT INTO `fx_countys` VALUES ('2283', '273', '3', '中宁县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2284', '273', '3', '盐池县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2285', '273', '3', '同心县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2286', '274', '3', '沙坡头区', '1', '0');
INSERT INTO `fx_countys` VALUES ('2287', '274', '3', '海原县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2288', '274', '3', '中宁县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2289', '275', '3', '城中区', '1', '0');
INSERT INTO `fx_countys` VALUES ('2290', '275', '3', '城东区', '1', '0');
INSERT INTO `fx_countys` VALUES ('2291', '275', '3', '城西区', '1', '0');
INSERT INTO `fx_countys` VALUES ('2292', '275', '3', '城北区', '1', '0');
INSERT INTO `fx_countys` VALUES ('2293', '275', '3', '湟中县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2294', '275', '3', '湟源县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2295', '275', '3', '大通', '1', '0');
INSERT INTO `fx_countys` VALUES ('2296', '276', '3', '玛沁县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2297', '276', '3', '班玛县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2298', '276', '3', '甘德县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2299', '276', '3', '达日县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2300', '276', '3', '久治县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2301', '276', '3', '玛多县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2302', '277', '3', '海晏县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2303', '277', '3', '祁连县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2304', '277', '3', '刚察县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2305', '277', '3', '门源', '1', '0');
INSERT INTO `fx_countys` VALUES ('2306', '278', '3', '平安县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2307', '278', '3', '乐都县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2308', '278', '3', '民和', '1', '0');
INSERT INTO `fx_countys` VALUES ('2309', '278', '3', '互助', '1', '0');
INSERT INTO `fx_countys` VALUES ('2310', '278', '3', '化隆', '1', '0');
INSERT INTO `fx_countys` VALUES ('2311', '278', '3', '循化', '1', '0');
INSERT INTO `fx_countys` VALUES ('2312', '279', '3', '共和县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2313', '279', '3', '同德县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2314', '279', '3', '贵德县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2315', '279', '3', '兴海县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2316', '279', '3', '贵南县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2317', '280', '3', '德令哈市', '1', '0');
INSERT INTO `fx_countys` VALUES ('2318', '280', '3', '格尔木市', '1', '0');
INSERT INTO `fx_countys` VALUES ('2319', '280', '3', '乌兰县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2320', '280', '3', '都兰县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2321', '280', '3', '天峻县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2322', '281', '3', '同仁县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2323', '281', '3', '尖扎县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2324', '281', '3', '泽库县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2325', '281', '3', '河南蒙古族自治县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2326', '282', '3', '玉树县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2327', '282', '3', '杂多县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2328', '282', '3', '称多县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2329', '282', '3', '治多县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2330', '282', '3', '囊谦县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2331', '282', '3', '曲麻莱县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2332', '283', '3', '市中区', '1', '0');
INSERT INTO `fx_countys` VALUES ('2333', '283', '3', '历下区', '1', '0');
INSERT INTO `fx_countys` VALUES ('2334', '283', '3', '天桥区', '1', '0');
INSERT INTO `fx_countys` VALUES ('2335', '283', '3', '槐荫区', '1', '0');
INSERT INTO `fx_countys` VALUES ('2336', '283', '3', '历城区', '1', '0');
INSERT INTO `fx_countys` VALUES ('2337', '283', '3', '长清区', '1', '0');
INSERT INTO `fx_countys` VALUES ('2338', '283', '3', '章丘市', '1', '0');
INSERT INTO `fx_countys` VALUES ('2339', '283', '3', '平阴县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2340', '283', '3', '济阳县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2341', '283', '3', '商河县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2342', '284', '3', '市南区', '1', '0');
INSERT INTO `fx_countys` VALUES ('2343', '284', '3', '市北区', '1', '0');
INSERT INTO `fx_countys` VALUES ('2344', '284', '3', '城阳区', '1', '0');
INSERT INTO `fx_countys` VALUES ('2345', '284', '3', '四方区', '1', '0');
INSERT INTO `fx_countys` VALUES ('2346', '284', '3', '李沧区', '1', '0');
INSERT INTO `fx_countys` VALUES ('2347', '284', '3', '黄岛区', '1', '0');
INSERT INTO `fx_countys` VALUES ('2348', '284', '3', '崂山区', '1', '0');
INSERT INTO `fx_countys` VALUES ('2349', '284', '3', '胶州市', '1', '0');
INSERT INTO `fx_countys` VALUES ('2350', '284', '3', '即墨市', '1', '0');
INSERT INTO `fx_countys` VALUES ('2351', '284', '3', '平度市', '1', '0');
INSERT INTO `fx_countys` VALUES ('2352', '284', '3', '胶南市', '1', '0');
INSERT INTO `fx_countys` VALUES ('2353', '284', '3', '莱西市', '1', '0');
INSERT INTO `fx_countys` VALUES ('2354', '285', '3', '滨城区', '1', '0');
INSERT INTO `fx_countys` VALUES ('2355', '285', '3', '惠民县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2356', '285', '3', '阳信县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2357', '285', '3', '无棣县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2358', '285', '3', '沾化县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2359', '285', '3', '博兴县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2360', '285', '3', '邹平县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2361', '286', '3', '德城区', '1', '0');
INSERT INTO `fx_countys` VALUES ('2362', '286', '3', '陵县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2363', '286', '3', '乐陵市', '1', '0');
INSERT INTO `fx_countys` VALUES ('2364', '286', '3', '禹城市', '1', '0');
INSERT INTO `fx_countys` VALUES ('2365', '286', '3', '宁津县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2366', '286', '3', '庆云县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2367', '286', '3', '临邑县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2368', '286', '3', '齐河县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2369', '286', '3', '平原县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2370', '286', '3', '夏津县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2371', '286', '3', '武城县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2372', '287', '3', '东营区', '1', '0');
INSERT INTO `fx_countys` VALUES ('2373', '287', '3', '河口区', '1', '0');
INSERT INTO `fx_countys` VALUES ('2374', '287', '3', '垦利县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2375', '287', '3', '利津县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2376', '287', '3', '广饶县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2377', '288', '3', '牡丹区', '1', '0');
INSERT INTO `fx_countys` VALUES ('2378', '288', '3', '曹县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2379', '288', '3', '单县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2380', '288', '3', '成武县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2381', '288', '3', '巨野县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2382', '288', '3', '郓城县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2383', '288', '3', '鄄城县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2384', '288', '3', '定陶县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2385', '288', '3', '东明县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2386', '289', '3', '市中区', '1', '0');
INSERT INTO `fx_countys` VALUES ('2387', '289', '3', '任城区', '1', '0');
INSERT INTO `fx_countys` VALUES ('2388', '289', '3', '曲阜市', '1', '0');
INSERT INTO `fx_countys` VALUES ('2389', '289', '3', '兖州市', '1', '0');
INSERT INTO `fx_countys` VALUES ('2390', '289', '3', '邹城市', '1', '0');
INSERT INTO `fx_countys` VALUES ('2391', '289', '3', '微山县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2392', '289', '3', '鱼台县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2393', '289', '3', '金乡县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2394', '289', '3', '嘉祥县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2395', '289', '3', '汶上县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2396', '289', '3', '泗水县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2397', '289', '3', '梁山县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2398', '290', '3', '莱城区', '1', '0');
INSERT INTO `fx_countys` VALUES ('2399', '290', '3', '钢城区', '1', '0');
INSERT INTO `fx_countys` VALUES ('2400', '291', '3', '东昌府区', '1', '0');
INSERT INTO `fx_countys` VALUES ('2401', '291', '3', '临清市', '1', '0');
INSERT INTO `fx_countys` VALUES ('2402', '291', '3', '阳谷县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2403', '291', '3', '莘县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2404', '291', '3', '茌平县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2405', '291', '3', '东阿县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2406', '291', '3', '冠县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2407', '291', '3', '高唐县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2408', '292', '3', '兰山区', '1', '0');
INSERT INTO `fx_countys` VALUES ('2409', '292', '3', '罗庄区', '1', '0');
INSERT INTO `fx_countys` VALUES ('2410', '292', '3', '河东区', '1', '0');
INSERT INTO `fx_countys` VALUES ('2411', '292', '3', '沂南县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2412', '292', '3', '郯城县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2413', '292', '3', '沂水县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2414', '292', '3', '苍山县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2415', '292', '3', '费县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2416', '292', '3', '平邑县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2417', '292', '3', '莒南县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2418', '292', '3', '蒙阴县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2419', '292', '3', '临沭县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2420', '293', '3', '东港区', '1', '0');
INSERT INTO `fx_countys` VALUES ('2421', '293', '3', '岚山区', '1', '0');
INSERT INTO `fx_countys` VALUES ('2422', '293', '3', '五莲县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2423', '293', '3', '莒县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2424', '294', '3', '泰山区', '1', '0');
INSERT INTO `fx_countys` VALUES ('2425', '294', '3', '岱岳区', '1', '0');
INSERT INTO `fx_countys` VALUES ('2426', '294', '3', '新泰市', '1', '0');
INSERT INTO `fx_countys` VALUES ('2427', '294', '3', '肥城市', '1', '0');
INSERT INTO `fx_countys` VALUES ('2428', '294', '3', '宁阳县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2429', '294', '3', '东平县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2430', '295', '3', '荣成市', '1', '0');
INSERT INTO `fx_countys` VALUES ('2431', '295', '3', '乳山市', '1', '0');
INSERT INTO `fx_countys` VALUES ('2432', '295', '3', '环翠区', '1', '0');
INSERT INTO `fx_countys` VALUES ('2433', '295', '3', '文登市', '1', '0');
INSERT INTO `fx_countys` VALUES ('2434', '296', '3', '潍城区', '1', '0');
INSERT INTO `fx_countys` VALUES ('2435', '296', '3', '寒亭区', '1', '0');
INSERT INTO `fx_countys` VALUES ('2436', '296', '3', '坊子区', '1', '0');
INSERT INTO `fx_countys` VALUES ('2437', '296', '3', '奎文区', '1', '0');
INSERT INTO `fx_countys` VALUES ('2438', '296', '3', '青州市', '1', '0');
INSERT INTO `fx_countys` VALUES ('2439', '296', '3', '诸城市', '1', '0');
INSERT INTO `fx_countys` VALUES ('2440', '296', '3', '寿光市', '1', '0');
INSERT INTO `fx_countys` VALUES ('2441', '296', '3', '安丘市', '1', '0');
INSERT INTO `fx_countys` VALUES ('2442', '296', '3', '高密市', '1', '0');
INSERT INTO `fx_countys` VALUES ('2443', '296', '3', '昌邑市', '1', '0');
INSERT INTO `fx_countys` VALUES ('2444', '296', '3', '临朐县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2445', '296', '3', '昌乐县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2446', '297', '3', '芝罘区', '1', '0');
INSERT INTO `fx_countys` VALUES ('2447', '297', '3', '福山区', '1', '0');
INSERT INTO `fx_countys` VALUES ('2448', '297', '3', '牟平区', '1', '0');
INSERT INTO `fx_countys` VALUES ('2449', '297', '3', '莱山区', '1', '0');
INSERT INTO `fx_countys` VALUES ('2450', '297', '3', '开发区', '1', '0');
INSERT INTO `fx_countys` VALUES ('2451', '297', '3', '龙口市', '1', '0');
INSERT INTO `fx_countys` VALUES ('2452', '297', '3', '莱阳市', '1', '0');
INSERT INTO `fx_countys` VALUES ('2453', '297', '3', '莱州市', '1', '0');
INSERT INTO `fx_countys` VALUES ('2454', '297', '3', '蓬莱市', '1', '0');
INSERT INTO `fx_countys` VALUES ('2455', '297', '3', '招远市', '1', '0');
INSERT INTO `fx_countys` VALUES ('2456', '297', '3', '栖霞市', '1', '0');
INSERT INTO `fx_countys` VALUES ('2457', '297', '3', '海阳市', '1', '0');
INSERT INTO `fx_countys` VALUES ('2458', '297', '3', '长岛县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2459', '298', '3', '市中区', '1', '0');
INSERT INTO `fx_countys` VALUES ('2460', '298', '3', '山亭区', '1', '0');
INSERT INTO `fx_countys` VALUES ('2461', '298', '3', '峄城区', '1', '0');
INSERT INTO `fx_countys` VALUES ('2462', '298', '3', '台儿庄区', '1', '0');
INSERT INTO `fx_countys` VALUES ('2463', '298', '3', '薛城区', '1', '0');
INSERT INTO `fx_countys` VALUES ('2464', '298', '3', '滕州市', '1', '0');
INSERT INTO `fx_countys` VALUES ('2465', '299', '3', '张店区', '1', '0');
INSERT INTO `fx_countys` VALUES ('2466', '299', '3', '临淄区', '1', '0');
INSERT INTO `fx_countys` VALUES ('2467', '299', '3', '淄川区', '1', '0');
INSERT INTO `fx_countys` VALUES ('2468', '299', '3', '博山区', '1', '0');
INSERT INTO `fx_countys` VALUES ('2469', '299', '3', '周村区', '1', '0');
INSERT INTO `fx_countys` VALUES ('2470', '299', '3', '桓台县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2471', '299', '3', '高青县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2472', '299', '3', '沂源县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2473', '300', '3', '杏花岭区', '1', '0');
INSERT INTO `fx_countys` VALUES ('2474', '300', '3', '小店区', '1', '0');
INSERT INTO `fx_countys` VALUES ('2475', '300', '3', '迎泽区', '1', '0');
INSERT INTO `fx_countys` VALUES ('2476', '300', '3', '尖草坪区', '1', '0');
INSERT INTO `fx_countys` VALUES ('2477', '300', '3', '万柏林区', '1', '0');
INSERT INTO `fx_countys` VALUES ('2478', '300', '3', '晋源区', '1', '0');
INSERT INTO `fx_countys` VALUES ('2479', '300', '3', '高新开发区', '1', '0');
INSERT INTO `fx_countys` VALUES ('2480', '300', '3', '民营经济开发区', '1', '0');
INSERT INTO `fx_countys` VALUES ('2481', '300', '3', '经济技术开发区', '1', '0');
INSERT INTO `fx_countys` VALUES ('2482', '300', '3', '清徐县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2483', '300', '3', '阳曲县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2484', '300', '3', '娄烦县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2485', '300', '3', '古交市', '1', '0');
INSERT INTO `fx_countys` VALUES ('2486', '301', '3', '城区', '1', '0');
INSERT INTO `fx_countys` VALUES ('2487', '301', '3', '郊区', '1', '0');
INSERT INTO `fx_countys` VALUES ('2488', '301', '3', '沁县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2489', '301', '3', '潞城市', '1', '0');
INSERT INTO `fx_countys` VALUES ('2490', '301', '3', '长治县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2491', '301', '3', '襄垣县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2492', '301', '3', '屯留县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2493', '301', '3', '平顺县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2494', '301', '3', '黎城县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2495', '301', '3', '壶关县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2496', '301', '3', '长子县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2497', '301', '3', '武乡县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2498', '301', '3', '沁源县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2499', '302', '3', '城区', '1', '0');
INSERT INTO `fx_countys` VALUES ('2500', '302', '3', '矿区', '1', '0');
INSERT INTO `fx_countys` VALUES ('2501', '302', '3', '南郊区', '1', '0');
INSERT INTO `fx_countys` VALUES ('2502', '302', '3', '新荣区', '1', '0');
INSERT INTO `fx_countys` VALUES ('2503', '302', '3', '阳高县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2504', '302', '3', '天镇县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2505', '302', '3', '广灵县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2506', '302', '3', '灵丘县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2507', '302', '3', '浑源县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2508', '302', '3', '左云县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2509', '302', '3', '大同县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2510', '303', '3', '城区', '1', '0');
INSERT INTO `fx_countys` VALUES ('2511', '303', '3', '高平市', '1', '0');
INSERT INTO `fx_countys` VALUES ('2512', '303', '3', '沁水县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2513', '303', '3', '阳城县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2514', '303', '3', '陵川县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2515', '303', '3', '泽州县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2516', '304', '3', '榆次区', '1', '0');
INSERT INTO `fx_countys` VALUES ('2517', '304', '3', '介休市', '1', '0');
INSERT INTO `fx_countys` VALUES ('2518', '304', '3', '榆社县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2519', '304', '3', '左权县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2520', '304', '3', '和顺县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2521', '304', '3', '昔阳县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2522', '304', '3', '寿阳县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2523', '304', '3', '太谷县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2524', '304', '3', '祁县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2525', '304', '3', '平遥县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2526', '304', '3', '灵石县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2527', '305', '3', '尧都区', '1', '0');
INSERT INTO `fx_countys` VALUES ('2528', '305', '3', '侯马市', '1', '0');
INSERT INTO `fx_countys` VALUES ('2529', '305', '3', '霍州市', '1', '0');
INSERT INTO `fx_countys` VALUES ('2530', '305', '3', '曲沃县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2531', '305', '3', '翼城县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2532', '305', '3', '襄汾县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2533', '305', '3', '洪洞县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2534', '305', '3', '吉县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2535', '305', '3', '安泽县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2536', '305', '3', '浮山县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2537', '305', '3', '古县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2538', '305', '3', '乡宁县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2539', '305', '3', '大宁县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2540', '305', '3', '隰县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2541', '305', '3', '永和县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2542', '305', '3', '蒲县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2543', '305', '3', '汾西县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2544', '306', '3', '离石市', '1', '0');
INSERT INTO `fx_countys` VALUES ('2545', '306', '3', '离石区', '1', '0');
INSERT INTO `fx_countys` VALUES ('2546', '306', '3', '孝义市', '1', '0');
INSERT INTO `fx_countys` VALUES ('2547', '306', '3', '汾阳市', '1', '0');
INSERT INTO `fx_countys` VALUES ('2548', '306', '3', '文水县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2549', '306', '3', '交城县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2550', '306', '3', '兴县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2551', '306', '3', '临县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2552', '306', '3', '柳林县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2553', '306', '3', '石楼县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2554', '306', '3', '岚县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2555', '306', '3', '方山县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2556', '306', '3', '中阳县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2557', '306', '3', '交口县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2558', '307', '3', '朔城区', '1', '0');
INSERT INTO `fx_countys` VALUES ('2559', '307', '3', '平鲁区', '1', '0');
INSERT INTO `fx_countys` VALUES ('2560', '307', '3', '山阴县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2561', '307', '3', '应县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2562', '307', '3', '右玉县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2563', '307', '3', '怀仁县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2564', '308', '3', '忻府区', '1', '0');
INSERT INTO `fx_countys` VALUES ('2565', '308', '3', '原平市', '1', '0');
INSERT INTO `fx_countys` VALUES ('2566', '308', '3', '定襄县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2567', '308', '3', '五台县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2568', '308', '3', '代县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2569', '308', '3', '繁峙县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2570', '308', '3', '宁武县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2571', '308', '3', '静乐县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2572', '308', '3', '神池县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2573', '308', '3', '五寨县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2574', '308', '3', '岢岚县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2575', '308', '3', '河曲县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2576', '308', '3', '保德县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2577', '308', '3', '偏关县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2578', '309', '3', '城区', '1', '0');
INSERT INTO `fx_countys` VALUES ('2579', '309', '3', '矿区', '1', '0');
INSERT INTO `fx_countys` VALUES ('2580', '309', '3', '郊区', '1', '0');
INSERT INTO `fx_countys` VALUES ('2581', '309', '3', '平定县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2582', '309', '3', '盂县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2583', '310', '3', '盐湖区', '1', '0');
INSERT INTO `fx_countys` VALUES ('2584', '310', '3', '永济市', '1', '0');
INSERT INTO `fx_countys` VALUES ('2585', '310', '3', '河津市', '1', '0');
INSERT INTO `fx_countys` VALUES ('2586', '310', '3', '临猗县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2587', '310', '3', '万荣县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2588', '310', '3', '闻喜县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2589', '310', '3', '稷山县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2590', '310', '3', '新绛县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2591', '310', '3', '绛县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2592', '310', '3', '垣曲县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2593', '310', '3', '夏县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2594', '310', '3', '平陆县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2595', '310', '3', '芮城县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2596', '311', '3', '莲湖区', '1', '0');
INSERT INTO `fx_countys` VALUES ('2597', '311', '3', '新城区', '1', '0');
INSERT INTO `fx_countys` VALUES ('2598', '311', '3', '碑林区', '1', '0');
INSERT INTO `fx_countys` VALUES ('2599', '311', '3', '雁塔区', '1', '0');
INSERT INTO `fx_countys` VALUES ('2600', '311', '3', '灞桥区', '1', '0');
INSERT INTO `fx_countys` VALUES ('2601', '311', '3', '未央区', '1', '0');
INSERT INTO `fx_countys` VALUES ('2602', '311', '3', '阎良区', '1', '0');
INSERT INTO `fx_countys` VALUES ('2603', '311', '3', '临潼区', '1', '0');
INSERT INTO `fx_countys` VALUES ('2604', '311', '3', '长安区', '1', '0');
INSERT INTO `fx_countys` VALUES ('2605', '311', '3', '蓝田县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2606', '311', '3', '周至县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2607', '311', '3', '户县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2608', '311', '3', '高陵县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2609', '312', '3', '汉滨区', '1', '0');
INSERT INTO `fx_countys` VALUES ('2610', '312', '3', '汉阴县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2611', '312', '3', '石泉县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2612', '312', '3', '宁陕县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2613', '312', '3', '紫阳县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2614', '312', '3', '岚皋县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2615', '312', '3', '平利县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2616', '312', '3', '镇坪县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2617', '312', '3', '旬阳县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2618', '312', '3', '白河县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2619', '313', '3', '陈仓区', '1', '0');
INSERT INTO `fx_countys` VALUES ('2620', '313', '3', '渭滨区', '1', '0');
INSERT INTO `fx_countys` VALUES ('2621', '313', '3', '金台区', '1', '0');
INSERT INTO `fx_countys` VALUES ('2622', '313', '3', '凤翔县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2623', '313', '3', '岐山县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2624', '313', '3', '扶风县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2625', '313', '3', '眉县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2626', '313', '3', '陇县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2627', '313', '3', '千阳县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2628', '313', '3', '麟游县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2629', '313', '3', '凤县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2630', '313', '3', '太白县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2631', '314', '3', '汉台区', '1', '0');
INSERT INTO `fx_countys` VALUES ('2632', '314', '3', '南郑县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2633', '314', '3', '城固县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2634', '314', '3', '洋县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2635', '314', '3', '西乡县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2636', '314', '3', '勉县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2637', '314', '3', '宁强县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2638', '314', '3', '略阳县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2639', '314', '3', '镇巴县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2640', '314', '3', '留坝县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2641', '314', '3', '佛坪县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2642', '315', '3', '商州区', '1', '0');
INSERT INTO `fx_countys` VALUES ('2643', '315', '3', '洛南县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2644', '315', '3', '丹凤县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2645', '315', '3', '商南县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2646', '315', '3', '山阳县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2647', '315', '3', '镇安县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2648', '315', '3', '柞水县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2649', '316', '3', '耀州区', '1', '0');
INSERT INTO `fx_countys` VALUES ('2650', '316', '3', '王益区', '1', '0');
INSERT INTO `fx_countys` VALUES ('2651', '316', '3', '印台区', '1', '0');
INSERT INTO `fx_countys` VALUES ('2652', '316', '3', '宜君县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2653', '317', '3', '临渭区', '1', '0');
INSERT INTO `fx_countys` VALUES ('2654', '317', '3', '韩城市', '1', '0');
INSERT INTO `fx_countys` VALUES ('2655', '317', '3', '华阴市', '1', '0');
INSERT INTO `fx_countys` VALUES ('2656', '317', '3', '华县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2657', '317', '3', '潼关县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2658', '317', '3', '大荔县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2659', '317', '3', '合阳县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2660', '317', '3', '澄城县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2661', '317', '3', '蒲城县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2662', '317', '3', '白水县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2663', '317', '3', '富平县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2664', '318', '3', '秦都区', '1', '0');
INSERT INTO `fx_countys` VALUES ('2665', '318', '3', '渭城区', '1', '0');
INSERT INTO `fx_countys` VALUES ('2666', '318', '3', '杨陵区', '1', '0');
INSERT INTO `fx_countys` VALUES ('2667', '318', '3', '兴平市', '1', '0');
INSERT INTO `fx_countys` VALUES ('2668', '318', '3', '三原县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2669', '318', '3', '泾阳县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2670', '318', '3', '乾县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2671', '318', '3', '礼泉县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2672', '318', '3', '永寿县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2673', '318', '3', '彬县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2674', '318', '3', '长武县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2675', '318', '3', '旬邑县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2676', '318', '3', '淳化县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2677', '318', '3', '武功县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2678', '319', '3', '吴起县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2679', '319', '3', '宝塔区', '1', '0');
INSERT INTO `fx_countys` VALUES ('2680', '319', '3', '延长县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2681', '319', '3', '延川县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2682', '319', '3', '子长县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2683', '319', '3', '安塞县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2684', '319', '3', '志丹县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2685', '319', '3', '甘泉县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2686', '319', '3', '富县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2687', '319', '3', '洛川县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2688', '319', '3', '宜川县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2689', '319', '3', '黄龙县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2690', '319', '3', '黄陵县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2691', '320', '3', '榆阳区', '1', '0');
INSERT INTO `fx_countys` VALUES ('2692', '320', '3', '神木县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2693', '320', '3', '府谷县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2694', '320', '3', '横山县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2695', '320', '3', '靖边县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2696', '320', '3', '定边县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2697', '320', '3', '绥德县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2698', '320', '3', '米脂县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2699', '320', '3', '佳县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2700', '320', '3', '吴堡县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2701', '320', '3', '清涧县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2702', '320', '3', '子洲县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2703', '321', '3', '长宁区', '1', '0');
INSERT INTO `fx_countys` VALUES ('2704', '321', '3', '闸北区', '1', '0');
INSERT INTO `fx_countys` VALUES ('2705', '321', '3', '闵行区', '1', '0');
INSERT INTO `fx_countys` VALUES ('2706', '321', '3', '徐汇区', '1', '0');
INSERT INTO `fx_countys` VALUES ('2707', '321', '3', '浦东新区', '1', '0');
INSERT INTO `fx_countys` VALUES ('2708', '321', '3', '杨浦区', '1', '0');
INSERT INTO `fx_countys` VALUES ('2709', '321', '3', '普陀区', '1', '0');
INSERT INTO `fx_countys` VALUES ('2710', '321', '3', '静安区', '1', '0');
INSERT INTO `fx_countys` VALUES ('2711', '321', '3', '卢湾区', '1', '0');
INSERT INTO `fx_countys` VALUES ('2712', '321', '3', '虹口区', '1', '0');
INSERT INTO `fx_countys` VALUES ('2713', '321', '3', '黄浦区', '1', '0');
INSERT INTO `fx_countys` VALUES ('2714', '321', '3', '南汇区', '1', '0');
INSERT INTO `fx_countys` VALUES ('2715', '321', '3', '松江区', '1', '0');
INSERT INTO `fx_countys` VALUES ('2716', '321', '3', '嘉定区', '1', '0');
INSERT INTO `fx_countys` VALUES ('2717', '321', '3', '宝山区', '1', '0');
INSERT INTO `fx_countys` VALUES ('2718', '321', '3', '青浦区', '1', '0');
INSERT INTO `fx_countys` VALUES ('2719', '321', '3', '金山区', '1', '0');
INSERT INTO `fx_countys` VALUES ('2720', '321', '3', '奉贤区', '1', '0');
INSERT INTO `fx_countys` VALUES ('2721', '321', '3', '崇明县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2722', '322', '3', '青羊区', '1', '0');
INSERT INTO `fx_countys` VALUES ('2723', '322', '3', '锦江区', '1', '0');
INSERT INTO `fx_countys` VALUES ('2724', '322', '3', '金牛区', '1', '0');
INSERT INTO `fx_countys` VALUES ('2725', '322', '3', '武侯区', '1', '0');
INSERT INTO `fx_countys` VALUES ('2726', '322', '3', '成华区', '1', '0');
INSERT INTO `fx_countys` VALUES ('2727', '322', '3', '龙泉驿区', '1', '0');
INSERT INTO `fx_countys` VALUES ('2728', '322', '3', '青白江区', '1', '0');
INSERT INTO `fx_countys` VALUES ('2729', '322', '3', '新都区', '1', '0');
INSERT INTO `fx_countys` VALUES ('2730', '322', '3', '温江区', '1', '0');
INSERT INTO `fx_countys` VALUES ('2731', '322', '3', '高新区', '1', '0');
INSERT INTO `fx_countys` VALUES ('2732', '322', '3', '高新西区', '1', '0');
INSERT INTO `fx_countys` VALUES ('2733', '322', '3', '都江堰市', '1', '0');
INSERT INTO `fx_countys` VALUES ('2734', '322', '3', '彭州市', '1', '0');
INSERT INTO `fx_countys` VALUES ('2735', '322', '3', '邛崃市', '1', '0');
INSERT INTO `fx_countys` VALUES ('2736', '322', '3', '崇州市', '1', '0');
INSERT INTO `fx_countys` VALUES ('2737', '322', '3', '金堂县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2738', '322', '3', '双流县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2739', '322', '3', '郫县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2740', '322', '3', '大邑县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2741', '322', '3', '蒲江县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2742', '322', '3', '新津县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2743', '322', '3', '都江堰市', '1', '0');
INSERT INTO `fx_countys` VALUES ('2744', '322', '3', '彭州市', '1', '0');
INSERT INTO `fx_countys` VALUES ('2745', '322', '3', '邛崃市', '1', '0');
INSERT INTO `fx_countys` VALUES ('2746', '322', '3', '崇州市', '1', '0');
INSERT INTO `fx_countys` VALUES ('2747', '322', '3', '金堂县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2748', '322', '3', '双流县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2749', '322', '3', '郫县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2750', '322', '3', '大邑县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2751', '322', '3', '蒲江县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2752', '322', '3', '新津县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2753', '323', '3', '涪城区', '1', '0');
INSERT INTO `fx_countys` VALUES ('2754', '323', '3', '游仙区', '1', '0');
INSERT INTO `fx_countys` VALUES ('2755', '323', '3', '江油市', '1', '0');
INSERT INTO `fx_countys` VALUES ('2756', '323', '3', '盐亭县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2757', '323', '3', '三台县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2758', '323', '3', '平武县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2759', '323', '3', '安县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2760', '323', '3', '梓潼县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2761', '323', '3', '北川县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2762', '324', '3', '马尔康县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2763', '324', '3', '汶川县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2764', '324', '3', '理县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2765', '324', '3', '茂县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2766', '324', '3', '松潘县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2767', '324', '3', '九寨沟县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2768', '324', '3', '金川县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2769', '324', '3', '小金县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2770', '324', '3', '黑水县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2771', '324', '3', '壤塘县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2772', '324', '3', '阿坝县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2773', '324', '3', '若尔盖县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2774', '324', '3', '红原县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2775', '325', '3', '巴州区', '1', '0');
INSERT INTO `fx_countys` VALUES ('2776', '325', '3', '通江县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2777', '325', '3', '南江县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2778', '325', '3', '平昌县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2779', '326', '3', '通川区', '1', '0');
INSERT INTO `fx_countys` VALUES ('2780', '326', '3', '万源市', '1', '0');
INSERT INTO `fx_countys` VALUES ('2781', '326', '3', '达县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2782', '326', '3', '宣汉县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2783', '326', '3', '开江县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2784', '326', '3', '大竹县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2785', '326', '3', '渠县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2786', '327', '3', '旌阳区', '1', '0');
INSERT INTO `fx_countys` VALUES ('2787', '327', '3', '广汉市', '1', '0');
INSERT INTO `fx_countys` VALUES ('2788', '327', '3', '什邡市', '1', '0');
INSERT INTO `fx_countys` VALUES ('2789', '327', '3', '绵竹市', '1', '0');
INSERT INTO `fx_countys` VALUES ('2790', '327', '3', '罗江县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2791', '327', '3', '中江县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2792', '328', '3', '康定县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2793', '328', '3', '丹巴县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2794', '328', '3', '泸定县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2795', '328', '3', '炉霍县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2796', '328', '3', '九龙县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2797', '328', '3', '甘孜县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2798', '328', '3', '雅江县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2799', '328', '3', '新龙县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2800', '328', '3', '道孚县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2801', '328', '3', '白玉县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2802', '328', '3', '理塘县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2803', '328', '3', '德格县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2804', '328', '3', '乡城县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2805', '328', '3', '石渠县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2806', '328', '3', '稻城县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2807', '328', '3', '色达县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2808', '328', '3', '巴塘县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2809', '328', '3', '得荣县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2810', '329', '3', '广安区', '1', '0');
INSERT INTO `fx_countys` VALUES ('2811', '329', '3', '华蓥市', '1', '0');
INSERT INTO `fx_countys` VALUES ('2812', '329', '3', '岳池县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2813', '329', '3', '武胜县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2814', '329', '3', '邻水县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2815', '330', '3', '利州区', '1', '0');
INSERT INTO `fx_countys` VALUES ('2816', '330', '3', '元坝区', '1', '0');
INSERT INTO `fx_countys` VALUES ('2817', '330', '3', '朝天区', '1', '0');
INSERT INTO `fx_countys` VALUES ('2818', '330', '3', '旺苍县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2819', '330', '3', '青川县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2820', '330', '3', '剑阁县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2821', '330', '3', '苍溪县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2822', '331', '3', '峨眉山市', '1', '0');
INSERT INTO `fx_countys` VALUES ('2823', '331', '3', '乐山市', '1', '0');
INSERT INTO `fx_countys` VALUES ('2824', '331', '3', '犍为县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2825', '331', '3', '井研县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2826', '331', '3', '夹江县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2827', '331', '3', '沐川县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2828', '331', '3', '峨边', '1', '0');
INSERT INTO `fx_countys` VALUES ('2829', '331', '3', '马边', '1', '0');
INSERT INTO `fx_countys` VALUES ('2830', '332', '3', '西昌市', '1', '0');
INSERT INTO `fx_countys` VALUES ('2831', '332', '3', '盐源县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2832', '332', '3', '德昌县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2833', '332', '3', '会理县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2834', '332', '3', '会东县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2835', '332', '3', '宁南县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2836', '332', '3', '普格县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2837', '332', '3', '布拖县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2838', '332', '3', '金阳县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2839', '332', '3', '昭觉县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2840', '332', '3', '喜德县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2841', '332', '3', '冕宁县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2842', '332', '3', '越西县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2843', '332', '3', '甘洛县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2844', '332', '3', '美姑县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2845', '332', '3', '雷波县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2846', '332', '3', '木里', '1', '0');
INSERT INTO `fx_countys` VALUES ('2847', '333', '3', '东坡区', '1', '0');
INSERT INTO `fx_countys` VALUES ('2848', '333', '3', '仁寿县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2849', '333', '3', '彭山县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2850', '333', '3', '洪雅县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2851', '333', '3', '丹棱县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2852', '333', '3', '青神县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2853', '334', '3', '阆中市', '1', '0');
INSERT INTO `fx_countys` VALUES ('2854', '334', '3', '南部县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2855', '334', '3', '营山县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2856', '334', '3', '蓬安县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2857', '334', '3', '仪陇县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2858', '334', '3', '顺庆区', '1', '0');
INSERT INTO `fx_countys` VALUES ('2859', '334', '3', '高坪区', '1', '0');
INSERT INTO `fx_countys` VALUES ('2860', '334', '3', '嘉陵区', '1', '0');
INSERT INTO `fx_countys` VALUES ('2861', '334', '3', '西充县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2862', '335', '3', '市中区', '1', '0');
INSERT INTO `fx_countys` VALUES ('2863', '335', '3', '东兴区', '1', '0');
INSERT INTO `fx_countys` VALUES ('2864', '335', '3', '威远县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2865', '335', '3', '资中县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2866', '335', '3', '隆昌县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2867', '336', '3', '东  区', '1', '0');
INSERT INTO `fx_countys` VALUES ('2868', '336', '3', '西  区', '1', '0');
INSERT INTO `fx_countys` VALUES ('2869', '336', '3', '仁和区', '1', '0');
INSERT INTO `fx_countys` VALUES ('2870', '336', '3', '米易县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2871', '336', '3', '盐边县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2872', '337', '3', '船山区', '1', '0');
INSERT INTO `fx_countys` VALUES ('2873', '337', '3', '安居区', '1', '0');
INSERT INTO `fx_countys` VALUES ('2874', '337', '3', '蓬溪县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2875', '337', '3', '射洪县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2876', '337', '3', '大英县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2877', '338', '3', '雨城区', '1', '0');
INSERT INTO `fx_countys` VALUES ('2878', '338', '3', '名山县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2879', '338', '3', '荥经县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2880', '338', '3', '汉源县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2881', '338', '3', '石棉县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2882', '338', '3', '天全县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2883', '338', '3', '芦山县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2884', '338', '3', '宝兴县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2885', '339', '3', '翠屏区', '1', '0');
INSERT INTO `fx_countys` VALUES ('2886', '339', '3', '宜宾县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2887', '339', '3', '南溪县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2888', '339', '3', '江安县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2889', '339', '3', '长宁县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2890', '339', '3', '高县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2891', '339', '3', '珙县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2892', '339', '3', '筠连县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2893', '339', '3', '兴文县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2894', '339', '3', '屏山县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2895', '340', '3', '雁江区', '1', '0');
INSERT INTO `fx_countys` VALUES ('2896', '340', '3', '简阳市', '1', '0');
INSERT INTO `fx_countys` VALUES ('2897', '340', '3', '安岳县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2898', '340', '3', '乐至县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2899', '341', '3', '大安区', '1', '0');
INSERT INTO `fx_countys` VALUES ('2900', '341', '3', '自流井区', '1', '0');
INSERT INTO `fx_countys` VALUES ('2901', '341', '3', '贡井区', '1', '0');
INSERT INTO `fx_countys` VALUES ('2902', '341', '3', '沿滩区', '1', '0');
INSERT INTO `fx_countys` VALUES ('2903', '341', '3', '荣县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2904', '341', '3', '富顺县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2905', '342', '3', '江阳区', '1', '0');
INSERT INTO `fx_countys` VALUES ('2906', '342', '3', '纳溪区', '1', '0');
INSERT INTO `fx_countys` VALUES ('2907', '342', '3', '龙马潭区', '1', '0');
INSERT INTO `fx_countys` VALUES ('2908', '342', '3', '泸县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2909', '342', '3', '合江县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2910', '342', '3', '叙永县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2911', '342', '3', '古蔺县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2912', '343', '3', '和平区', '1', '0');
INSERT INTO `fx_countys` VALUES ('2913', '343', '3', '河西区', '1', '0');
INSERT INTO `fx_countys` VALUES ('2914', '343', '3', '南开区', '1', '0');
INSERT INTO `fx_countys` VALUES ('2915', '343', '3', '河北区', '1', '0');
INSERT INTO `fx_countys` VALUES ('2916', '343', '3', '河东区', '1', '0');
INSERT INTO `fx_countys` VALUES ('2917', '343', '3', '红桥区', '1', '0');
INSERT INTO `fx_countys` VALUES ('2918', '343', '3', '东丽区', '1', '0');
INSERT INTO `fx_countys` VALUES ('2919', '343', '3', '津南区', '1', '0');
INSERT INTO `fx_countys` VALUES ('2920', '343', '3', '西青区', '1', '0');
INSERT INTO `fx_countys` VALUES ('2921', '343', '3', '北辰区', '1', '0');
INSERT INTO `fx_countys` VALUES ('2922', '343', '3', '塘沽区', '1', '0');
INSERT INTO `fx_countys` VALUES ('2923', '343', '3', '汉沽区', '1', '0');
INSERT INTO `fx_countys` VALUES ('2924', '343', '3', '大港区', '1', '0');
INSERT INTO `fx_countys` VALUES ('2925', '343', '3', '武清区', '1', '0');
INSERT INTO `fx_countys` VALUES ('2926', '343', '3', '宝坻区', '1', '0');
INSERT INTO `fx_countys` VALUES ('2927', '343', '3', '经济开发区', '1', '0');
INSERT INTO `fx_countys` VALUES ('2928', '343', '3', '宁河县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2929', '343', '3', '静海县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2930', '343', '3', '蓟县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2931', '344', '3', '城关区', '1', '0');
INSERT INTO `fx_countys` VALUES ('2932', '344', '3', '林周县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2933', '344', '3', '当雄县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2934', '344', '3', '尼木县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2935', '344', '3', '曲水县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2936', '344', '3', '堆龙德庆县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2937', '344', '3', '达孜县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2938', '344', '3', '墨竹工卡县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2939', '345', '3', '噶尔县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2940', '345', '3', '普兰县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2941', '345', '3', '札达县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2942', '345', '3', '日土县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2943', '345', '3', '革吉县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2944', '345', '3', '改则县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2945', '345', '3', '措勤县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2946', '346', '3', '昌都县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2947', '346', '3', '江达县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2948', '346', '3', '贡觉县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2949', '346', '3', '类乌齐县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2950', '346', '3', '丁青县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2951', '346', '3', '察雅县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2952', '346', '3', '八宿县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2953', '346', '3', '左贡县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2954', '346', '3', '芒康县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2955', '346', '3', '洛隆县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2956', '346', '3', '边坝县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2957', '347', '3', '林芝县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2958', '347', '3', '工布江达县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2959', '347', '3', '米林县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2960', '347', '3', '墨脱县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2961', '347', '3', '波密县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2962', '347', '3', '察隅县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2963', '347', '3', '朗县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2964', '348', '3', '那曲县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2965', '348', '3', '嘉黎县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2966', '348', '3', '比如县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2967', '348', '3', '聂荣县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2968', '348', '3', '安多县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2969', '348', '3', '申扎县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2970', '348', '3', '索县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2971', '348', '3', '班戈县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2972', '348', '3', '巴青县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2973', '348', '3', '尼玛县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2974', '349', '3', '日喀则市', '1', '0');
INSERT INTO `fx_countys` VALUES ('2975', '349', '3', '南木林县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2976', '349', '3', '江孜县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2977', '349', '3', '定日县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2978', '349', '3', '萨迦县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2979', '349', '3', '拉孜县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2980', '349', '3', '昂仁县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2981', '349', '3', '谢通门县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2982', '349', '3', '白朗县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2983', '349', '3', '仁布县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2984', '349', '3', '康马县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2985', '349', '3', '定结县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2986', '349', '3', '仲巴县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2987', '349', '3', '亚东县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2988', '349', '3', '吉隆县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2989', '349', '3', '聂拉木县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2990', '349', '3', '萨嘎县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2991', '349', '3', '岗巴县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2992', '350', '3', '乃东县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2993', '350', '3', '扎囊县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2994', '350', '3', '贡嘎县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2995', '350', '3', '桑日县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2996', '350', '3', '琼结县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2997', '350', '3', '曲松县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2998', '350', '3', '措美县', '1', '0');
INSERT INTO `fx_countys` VALUES ('2999', '350', '3', '洛扎县', '1', '0');
INSERT INTO `fx_countys` VALUES ('3000', '350', '3', '加查县', '1', '0');
INSERT INTO `fx_countys` VALUES ('3001', '350', '3', '隆子县', '1', '0');
INSERT INTO `fx_countys` VALUES ('3002', '350', '3', '错那县', '1', '0');
INSERT INTO `fx_countys` VALUES ('3003', '350', '3', '浪卡子县', '1', '0');
INSERT INTO `fx_countys` VALUES ('3004', '351', '3', '天山区', '1', '0');
INSERT INTO `fx_countys` VALUES ('3005', '351', '3', '沙依巴克区', '1', '0');
INSERT INTO `fx_countys` VALUES ('3006', '351', '3', '新市区', '1', '0');
INSERT INTO `fx_countys` VALUES ('3007', '351', '3', '水磨沟区', '1', '0');
INSERT INTO `fx_countys` VALUES ('3008', '351', '3', '头屯河区', '1', '0');
INSERT INTO `fx_countys` VALUES ('3009', '351', '3', '达坂城区', '1', '0');
INSERT INTO `fx_countys` VALUES ('3010', '351', '3', '米东区', '1', '0');
INSERT INTO `fx_countys` VALUES ('3011', '351', '3', '乌鲁木齐县', '1', '0');
INSERT INTO `fx_countys` VALUES ('3012', '352', '3', '阿克苏市', '1', '0');
INSERT INTO `fx_countys` VALUES ('3013', '352', '3', '温宿县', '1', '0');
INSERT INTO `fx_countys` VALUES ('3014', '352', '3', '库车县', '1', '0');
INSERT INTO `fx_countys` VALUES ('3015', '352', '3', '沙雅县', '1', '0');
INSERT INTO `fx_countys` VALUES ('3016', '352', '3', '新和县', '1', '0');
INSERT INTO `fx_countys` VALUES ('3017', '352', '3', '拜城县', '1', '0');
INSERT INTO `fx_countys` VALUES ('3018', '352', '3', '乌什县', '1', '0');
INSERT INTO `fx_countys` VALUES ('3019', '352', '3', '阿瓦提县', '1', '0');
INSERT INTO `fx_countys` VALUES ('3020', '352', '3', '柯坪县', '1', '0');
INSERT INTO `fx_countys` VALUES ('3021', '353', '3', '阿拉尔市', '1', '0');
INSERT INTO `fx_countys` VALUES ('3022', '354', '3', '库尔勒市', '1', '0');
INSERT INTO `fx_countys` VALUES ('3023', '354', '3', '轮台县', '1', '0');
INSERT INTO `fx_countys` VALUES ('3024', '354', '3', '尉犁县', '1', '0');
INSERT INTO `fx_countys` VALUES ('3025', '354', '3', '若羌县', '1', '0');
INSERT INTO `fx_countys` VALUES ('3026', '354', '3', '且末县', '1', '0');
INSERT INTO `fx_countys` VALUES ('3027', '354', '3', '焉耆', '1', '0');
INSERT INTO `fx_countys` VALUES ('3028', '354', '3', '和静县', '1', '0');
INSERT INTO `fx_countys` VALUES ('3029', '354', '3', '和硕县', '1', '0');
INSERT INTO `fx_countys` VALUES ('3030', '354', '3', '博湖县', '1', '0');
INSERT INTO `fx_countys` VALUES ('3031', '355', '3', '博乐市', '1', '0');
INSERT INTO `fx_countys` VALUES ('3032', '355', '3', '精河县', '1', '0');
INSERT INTO `fx_countys` VALUES ('3033', '355', '3', '温泉县', '1', '0');
INSERT INTO `fx_countys` VALUES ('3034', '356', '3', '呼图壁县', '1', '0');
INSERT INTO `fx_countys` VALUES ('3035', '356', '3', '米泉市', '1', '0');
INSERT INTO `fx_countys` VALUES ('3036', '356', '3', '昌吉市', '1', '0');
INSERT INTO `fx_countys` VALUES ('3037', '356', '3', '阜康市', '1', '0');
INSERT INTO `fx_countys` VALUES ('3038', '356', '3', '玛纳斯县', '1', '0');
INSERT INTO `fx_countys` VALUES ('3039', '356', '3', '奇台县', '1', '0');
INSERT INTO `fx_countys` VALUES ('3040', '356', '3', '吉木萨尔县', '1', '0');
INSERT INTO `fx_countys` VALUES ('3041', '356', '3', '木垒', '1', '0');
INSERT INTO `fx_countys` VALUES ('3042', '357', '3', '哈密市', '1', '0');
INSERT INTO `fx_countys` VALUES ('3043', '357', '3', '伊吾县', '1', '0');
INSERT INTO `fx_countys` VALUES ('3044', '357', '3', '巴里坤', '1', '0');
INSERT INTO `fx_countys` VALUES ('3045', '358', '3', '和田市', '1', '0');
INSERT INTO `fx_countys` VALUES ('3046', '358', '3', '和田县', '1', '0');
INSERT INTO `fx_countys` VALUES ('3047', '358', '3', '墨玉县', '1', '0');
INSERT INTO `fx_countys` VALUES ('3048', '358', '3', '皮山县', '1', '0');
INSERT INTO `fx_countys` VALUES ('3049', '358', '3', '洛浦县', '1', '0');
INSERT INTO `fx_countys` VALUES ('3050', '358', '3', '策勒县', '1', '0');
INSERT INTO `fx_countys` VALUES ('3051', '358', '3', '于田县', '1', '0');
INSERT INTO `fx_countys` VALUES ('3052', '358', '3', '民丰县', '1', '0');
INSERT INTO `fx_countys` VALUES ('3053', '359', '3', '喀什市', '1', '0');
INSERT INTO `fx_countys` VALUES ('3054', '359', '3', '疏附县', '1', '0');
INSERT INTO `fx_countys` VALUES ('3055', '359', '3', '疏勒县', '1', '0');
INSERT INTO `fx_countys` VALUES ('3056', '359', '3', '英吉沙县', '1', '0');
INSERT INTO `fx_countys` VALUES ('3057', '359', '3', '泽普县', '1', '0');
INSERT INTO `fx_countys` VALUES ('3058', '359', '3', '莎车县', '1', '0');
INSERT INTO `fx_countys` VALUES ('3059', '359', '3', '叶城县', '1', '0');
INSERT INTO `fx_countys` VALUES ('3060', '359', '3', '麦盖提县', '1', '0');
INSERT INTO `fx_countys` VALUES ('3061', '359', '3', '岳普湖县', '1', '0');
INSERT INTO `fx_countys` VALUES ('3062', '359', '3', '伽师县', '1', '0');
INSERT INTO `fx_countys` VALUES ('3063', '359', '3', '巴楚县', '1', '0');
INSERT INTO `fx_countys` VALUES ('3064', '359', '3', '塔什库尔干', '1', '0');
INSERT INTO `fx_countys` VALUES ('3065', '360', '3', '克拉玛依市', '1', '0');
INSERT INTO `fx_countys` VALUES ('3066', '361', '3', '阿图什市', '1', '0');
INSERT INTO `fx_countys` VALUES ('3067', '361', '3', '阿克陶县', '1', '0');
INSERT INTO `fx_countys` VALUES ('3068', '361', '3', '阿合奇县', '1', '0');
INSERT INTO `fx_countys` VALUES ('3069', '361', '3', '乌恰县', '1', '0');
INSERT INTO `fx_countys` VALUES ('3070', '362', '3', '石河子市', '1', '0');
INSERT INTO `fx_countys` VALUES ('3071', '363', '3', '图木舒克市', '1', '0');
INSERT INTO `fx_countys` VALUES ('3072', '364', '3', '吐鲁番市', '1', '0');
INSERT INTO `fx_countys` VALUES ('3073', '364', '3', '鄯善县', '1', '0');
INSERT INTO `fx_countys` VALUES ('3074', '364', '3', '托克逊县', '1', '0');
INSERT INTO `fx_countys` VALUES ('3075', '365', '3', '五家渠市', '1', '0');
INSERT INTO `fx_countys` VALUES ('3076', '366', '3', '阿勒泰市', '1', '0');
INSERT INTO `fx_countys` VALUES ('3077', '366', '3', '布克赛尔', '1', '0');
INSERT INTO `fx_countys` VALUES ('3078', '366', '3', '伊宁市', '1', '0');
INSERT INTO `fx_countys` VALUES ('3079', '366', '3', '布尔津县', '1', '0');
INSERT INTO `fx_countys` VALUES ('3080', '366', '3', '奎屯市', '1', '0');
INSERT INTO `fx_countys` VALUES ('3081', '366', '3', '乌苏市', '1', '0');
INSERT INTO `fx_countys` VALUES ('3082', '366', '3', '额敏县', '1', '0');
INSERT INTO `fx_countys` VALUES ('3083', '366', '3', '富蕴县', '1', '0');
INSERT INTO `fx_countys` VALUES ('3084', '366', '3', '伊宁县', '1', '0');
INSERT INTO `fx_countys` VALUES ('3085', '366', '3', '福海县', '1', '0');
INSERT INTO `fx_countys` VALUES ('3086', '366', '3', '霍城县', '1', '0');
INSERT INTO `fx_countys` VALUES ('3087', '366', '3', '沙湾县', '1', '0');
INSERT INTO `fx_countys` VALUES ('3088', '366', '3', '巩留县', '1', '0');
INSERT INTO `fx_countys` VALUES ('3089', '366', '3', '哈巴河县', '1', '0');
INSERT INTO `fx_countys` VALUES ('3090', '366', '3', '托里县', '1', '0');
INSERT INTO `fx_countys` VALUES ('3091', '366', '3', '青河县', '1', '0');
INSERT INTO `fx_countys` VALUES ('3092', '366', '3', '新源县', '1', '0');
INSERT INTO `fx_countys` VALUES ('3093', '366', '3', '裕民县', '1', '0');
INSERT INTO `fx_countys` VALUES ('3094', '366', '3', '和布克赛尔', '1', '0');
INSERT INTO `fx_countys` VALUES ('3095', '366', '3', '吉木乃县', '1', '0');
INSERT INTO `fx_countys` VALUES ('3096', '366', '3', '昭苏县', '1', '0');
INSERT INTO `fx_countys` VALUES ('3097', '366', '3', '特克斯县', '1', '0');
INSERT INTO `fx_countys` VALUES ('3098', '366', '3', '尼勒克县', '1', '0');
INSERT INTO `fx_countys` VALUES ('3099', '366', '3', '察布查尔', '1', '0');
INSERT INTO `fx_countys` VALUES ('3100', '367', '3', '盘龙区', '1', '0');
INSERT INTO `fx_countys` VALUES ('3101', '367', '3', '五华区', '1', '0');
INSERT INTO `fx_countys` VALUES ('3102', '367', '3', '官渡区', '1', '0');
INSERT INTO `fx_countys` VALUES ('3103', '367', '3', '西山区', '1', '0');
INSERT INTO `fx_countys` VALUES ('3104', '367', '3', '东川区', '1', '0');
INSERT INTO `fx_countys` VALUES ('3105', '367', '3', '安宁市', '1', '0');
INSERT INTO `fx_countys` VALUES ('3106', '367', '3', '呈贡县', '1', '0');
INSERT INTO `fx_countys` VALUES ('3107', '367', '3', '晋宁县', '1', '0');
INSERT INTO `fx_countys` VALUES ('3108', '367', '3', '富民县', '1', '0');
INSERT INTO `fx_countys` VALUES ('3109', '367', '3', '宜良县', '1', '0');
INSERT INTO `fx_countys` VALUES ('3110', '367', '3', '嵩明县', '1', '0');
INSERT INTO `fx_countys` VALUES ('3111', '367', '3', '石林县', '1', '0');
INSERT INTO `fx_countys` VALUES ('3112', '367', '3', '禄劝', '1', '0');
INSERT INTO `fx_countys` VALUES ('3113', '367', '3', '寻甸', '1', '0');
INSERT INTO `fx_countys` VALUES ('3114', '368', '3', '兰坪', '1', '0');
INSERT INTO `fx_countys` VALUES ('3115', '368', '3', '泸水县', '1', '0');
INSERT INTO `fx_countys` VALUES ('3116', '368', '3', '福贡县', '1', '0');
INSERT INTO `fx_countys` VALUES ('3117', '368', '3', '贡山', '1', '0');
INSERT INTO `fx_countys` VALUES ('3118', '369', '3', '宁洱', '1', '0');
INSERT INTO `fx_countys` VALUES ('3119', '369', '3', '思茅区', '1', '0');
INSERT INTO `fx_countys` VALUES ('3120', '369', '3', '墨江', '1', '0');
INSERT INTO `fx_countys` VALUES ('3121', '369', '3', '景东', '1', '0');
INSERT INTO `fx_countys` VALUES ('3122', '369', '3', '景谷', '1', '0');
INSERT INTO `fx_countys` VALUES ('3123', '369', '3', '镇沅', '1', '0');
INSERT INTO `fx_countys` VALUES ('3124', '369', '3', '江城', '1', '0');
INSERT INTO `fx_countys` VALUES ('3125', '369', '3', '孟连', '1', '0');
INSERT INTO `fx_countys` VALUES ('3126', '369', '3', '澜沧', '1', '0');
INSERT INTO `fx_countys` VALUES ('3127', '369', '3', '西盟', '1', '0');
INSERT INTO `fx_countys` VALUES ('3128', '370', '3', '古城区', '1', '0');
INSERT INTO `fx_countys` VALUES ('3129', '370', '3', '宁蒗', '1', '0');
INSERT INTO `fx_countys` VALUES ('3130', '370', '3', '玉龙', '1', '0');
INSERT INTO `fx_countys` VALUES ('3131', '370', '3', '永胜县', '1', '0');
INSERT INTO `fx_countys` VALUES ('3132', '370', '3', '华坪县', '1', '0');
INSERT INTO `fx_countys` VALUES ('3133', '371', '3', '隆阳区', '1', '0');
INSERT INTO `fx_countys` VALUES ('3134', '371', '3', '施甸县', '1', '0');
INSERT INTO `fx_countys` VALUES ('3135', '371', '3', '腾冲县', '1', '0');
INSERT INTO `fx_countys` VALUES ('3136', '371', '3', '龙陵县', '1', '0');
INSERT INTO `fx_countys` VALUES ('3137', '371', '3', '昌宁县', '1', '0');
INSERT INTO `fx_countys` VALUES ('3138', '372', '3', '楚雄市', '1', '0');
INSERT INTO `fx_countys` VALUES ('3139', '372', '3', '双柏县', '1', '0');
INSERT INTO `fx_countys` VALUES ('3140', '372', '3', '牟定县', '1', '0');
INSERT INTO `fx_countys` VALUES ('3141', '372', '3', '南华县', '1', '0');
INSERT INTO `fx_countys` VALUES ('3142', '372', '3', '姚安县', '1', '0');
INSERT INTO `fx_countys` VALUES ('3143', '372', '3', '大姚县', '1', '0');
INSERT INTO `fx_countys` VALUES ('3144', '372', '3', '永仁县', '1', '0');
INSERT INTO `fx_countys` VALUES ('3145', '372', '3', '元谋县', '1', '0');
INSERT INTO `fx_countys` VALUES ('3146', '372', '3', '武定县', '1', '0');
INSERT INTO `fx_countys` VALUES ('3147', '372', '3', '禄丰县', '1', '0');
INSERT INTO `fx_countys` VALUES ('3148', '373', '3', '大理市', '1', '0');
INSERT INTO `fx_countys` VALUES ('3149', '373', '3', '祥云县', '1', '0');
INSERT INTO `fx_countys` VALUES ('3150', '373', '3', '宾川县', '1', '0');
INSERT INTO `fx_countys` VALUES ('3151', '373', '3', '弥渡县', '1', '0');
INSERT INTO `fx_countys` VALUES ('3152', '373', '3', '永平县', '1', '0');
INSERT INTO `fx_countys` VALUES ('3153', '373', '3', '云龙县', '1', '0');
INSERT INTO `fx_countys` VALUES ('3154', '373', '3', '洱源县', '1', '0');
INSERT INTO `fx_countys` VALUES ('3155', '373', '3', '剑川县', '1', '0');
INSERT INTO `fx_countys` VALUES ('3156', '373', '3', '鹤庆县', '1', '0');
INSERT INTO `fx_countys` VALUES ('3157', '373', '3', '漾濞', '1', '0');
INSERT INTO `fx_countys` VALUES ('3158', '373', '3', '南涧', '1', '0');
INSERT INTO `fx_countys` VALUES ('3159', '373', '3', '巍山', '1', '0');
INSERT INTO `fx_countys` VALUES ('3160', '374', '3', '潞西市', '1', '0');
INSERT INTO `fx_countys` VALUES ('3161', '374', '3', '瑞丽市', '1', '0');
INSERT INTO `fx_countys` VALUES ('3162', '374', '3', '梁河县', '1', '0');
INSERT INTO `fx_countys` VALUES ('3163', '374', '3', '盈江县', '1', '0');
INSERT INTO `fx_countys` VALUES ('3164', '374', '3', '陇川县', '1', '0');
INSERT INTO `fx_countys` VALUES ('3165', '375', '3', '香格里拉县', '1', '0');
INSERT INTO `fx_countys` VALUES ('3166', '375', '3', '德钦县', '1', '0');
INSERT INTO `fx_countys` VALUES ('3167', '375', '3', '维西', '1', '0');
INSERT INTO `fx_countys` VALUES ('3168', '376', '3', '泸西县', '1', '0');
INSERT INTO `fx_countys` VALUES ('3169', '376', '3', '蒙自县', '1', '0');
INSERT INTO `fx_countys` VALUES ('3170', '376', '3', '个旧市', '1', '0');
INSERT INTO `fx_countys` VALUES ('3171', '376', '3', '开远市', '1', '0');
INSERT INTO `fx_countys` VALUES ('3172', '376', '3', '绿春县', '1', '0');
INSERT INTO `fx_countys` VALUES ('3173', '376', '3', '建水县', '1', '0');
INSERT INTO `fx_countys` VALUES ('3174', '376', '3', '石屏县', '1', '0');
INSERT INTO `fx_countys` VALUES ('3175', '376', '3', '弥勒县', '1', '0');
INSERT INTO `fx_countys` VALUES ('3176', '376', '3', '元阳县', '1', '0');
INSERT INTO `fx_countys` VALUES ('3177', '376', '3', '红河县', '1', '0');
INSERT INTO `fx_countys` VALUES ('3178', '376', '3', '金平', '1', '0');
INSERT INTO `fx_countys` VALUES ('3179', '376', '3', '河口', '1', '0');
INSERT INTO `fx_countys` VALUES ('3180', '376', '3', '屏边', '1', '0');
INSERT INTO `fx_countys` VALUES ('3181', '377', '3', '临翔区', '1', '0');
INSERT INTO `fx_countys` VALUES ('3182', '377', '3', '凤庆县', '1', '0');
INSERT INTO `fx_countys` VALUES ('3183', '377', '3', '云县', '1', '0');
INSERT INTO `fx_countys` VALUES ('3184', '377', '3', '永德县', '1', '0');
INSERT INTO `fx_countys` VALUES ('3185', '377', '3', '镇康县', '1', '0');
INSERT INTO `fx_countys` VALUES ('3186', '377', '3', '双江', '1', '0');
INSERT INTO `fx_countys` VALUES ('3187', '377', '3', '耿马', '1', '0');
INSERT INTO `fx_countys` VALUES ('3188', '377', '3', '沧源', '1', '0');
INSERT INTO `fx_countys` VALUES ('3189', '378', '3', '麒麟区', '1', '0');
INSERT INTO `fx_countys` VALUES ('3190', '378', '3', '宣威市', '1', '0');
INSERT INTO `fx_countys` VALUES ('3191', '378', '3', '马龙县', '1', '0');
INSERT INTO `fx_countys` VALUES ('3192', '378', '3', '陆良县', '1', '0');
INSERT INTO `fx_countys` VALUES ('3193', '378', '3', '师宗县', '1', '0');
INSERT INTO `fx_countys` VALUES ('3194', '378', '3', '罗平县', '1', '0');
INSERT INTO `fx_countys` VALUES ('3195', '378', '3', '富源县', '1', '0');
INSERT INTO `fx_countys` VALUES ('3196', '378', '3', '会泽县', '1', '0');
INSERT INTO `fx_countys` VALUES ('3197', '378', '3', '沾益县', '1', '0');
INSERT INTO `fx_countys` VALUES ('3198', '379', '3', '文山县', '1', '0');
INSERT INTO `fx_countys` VALUES ('3199', '379', '3', '砚山县', '1', '0');
INSERT INTO `fx_countys` VALUES ('3200', '379', '3', '西畴县', '1', '0');
INSERT INTO `fx_countys` VALUES ('3201', '379', '3', '麻栗坡县', '1', '0');
INSERT INTO `fx_countys` VALUES ('3202', '379', '3', '马关县', '1', '0');
INSERT INTO `fx_countys` VALUES ('3203', '379', '3', '丘北县', '1', '0');
INSERT INTO `fx_countys` VALUES ('3204', '379', '3', '广南县', '1', '0');
INSERT INTO `fx_countys` VALUES ('3205', '379', '3', '富宁县', '1', '0');
INSERT INTO `fx_countys` VALUES ('3206', '380', '3', '景洪市', '1', '0');
INSERT INTO `fx_countys` VALUES ('3207', '380', '3', '勐海县', '1', '0');
INSERT INTO `fx_countys` VALUES ('3208', '380', '3', '勐腊县', '1', '0');
INSERT INTO `fx_countys` VALUES ('3209', '381', '3', '红塔区', '1', '0');
INSERT INTO `fx_countys` VALUES ('3210', '381', '3', '江川县', '1', '0');
INSERT INTO `fx_countys` VALUES ('3211', '381', '3', '澄江县', '1', '0');
INSERT INTO `fx_countys` VALUES ('3212', '381', '3', '通海县', '1', '0');
INSERT INTO `fx_countys` VALUES ('3213', '381', '3', '华宁县', '1', '0');
INSERT INTO `fx_countys` VALUES ('3214', '381', '3', '易门县', '1', '0');
INSERT INTO `fx_countys` VALUES ('3215', '381', '3', '峨山', '1', '0');
INSERT INTO `fx_countys` VALUES ('3216', '381', '3', '新平', '1', '0');
INSERT INTO `fx_countys` VALUES ('3217', '381', '3', '元江', '1', '0');
INSERT INTO `fx_countys` VALUES ('3218', '382', '3', '昭阳区', '1', '0');
INSERT INTO `fx_countys` VALUES ('3219', '382', '3', '鲁甸县', '1', '0');
INSERT INTO `fx_countys` VALUES ('3220', '382', '3', '巧家县', '1', '0');
INSERT INTO `fx_countys` VALUES ('3221', '382', '3', '盐津县', '1', '0');
INSERT INTO `fx_countys` VALUES ('3222', '382', '3', '大关县', '1', '0');
INSERT INTO `fx_countys` VALUES ('3223', '382', '3', '永善县', '1', '0');
INSERT INTO `fx_countys` VALUES ('3224', '382', '3', '绥江县', '1', '0');
INSERT INTO `fx_countys` VALUES ('3225', '382', '3', '镇雄县', '1', '0');
INSERT INTO `fx_countys` VALUES ('3226', '382', '3', '彝良县', '1', '0');
INSERT INTO `fx_countys` VALUES ('3227', '382', '3', '威信县', '1', '0');
INSERT INTO `fx_countys` VALUES ('3228', '382', '3', '水富县', '1', '0');
INSERT INTO `fx_countys` VALUES ('3229', '383', '3', '西湖区', '1', '0');
INSERT INTO `fx_countys` VALUES ('3230', '383', '3', '上城区', '1', '0');
INSERT INTO `fx_countys` VALUES ('3231', '383', '3', '下城区', '1', '0');
INSERT INTO `fx_countys` VALUES ('3232', '383', '3', '拱墅区', '1', '0');
INSERT INTO `fx_countys` VALUES ('3233', '383', '3', '滨江区', '1', '0');
INSERT INTO `fx_countys` VALUES ('3234', '383', '3', '江干区', '1', '0');
INSERT INTO `fx_countys` VALUES ('3235', '383', '3', '萧山区', '1', '0');
INSERT INTO `fx_countys` VALUES ('3236', '383', '3', '余杭区', '1', '0');
INSERT INTO `fx_countys` VALUES ('3237', '383', '3', '市郊', '1', '0');
INSERT INTO `fx_countys` VALUES ('3238', '383', '3', '建德市', '1', '0');
INSERT INTO `fx_countys` VALUES ('3239', '383', '3', '富阳市', '1', '0');
INSERT INTO `fx_countys` VALUES ('3240', '383', '3', '临安市', '1', '0');
INSERT INTO `fx_countys` VALUES ('3241', '383', '3', '桐庐县', '1', '0');
INSERT INTO `fx_countys` VALUES ('3242', '383', '3', '淳安县', '1', '0');
INSERT INTO `fx_countys` VALUES ('3243', '384', '3', '吴兴区', '1', '0');
INSERT INTO `fx_countys` VALUES ('3244', '384', '3', '南浔区', '1', '0');
INSERT INTO `fx_countys` VALUES ('3245', '384', '3', '德清县', '1', '0');
INSERT INTO `fx_countys` VALUES ('3246', '384', '3', '长兴县', '1', '0');
INSERT INTO `fx_countys` VALUES ('3247', '384', '3', '安吉县', '1', '0');
INSERT INTO `fx_countys` VALUES ('3248', '385', '3', '南湖区', '1', '0');
INSERT INTO `fx_countys` VALUES ('3249', '385', '3', '秀洲区', '1', '0');
INSERT INTO `fx_countys` VALUES ('3250', '385', '3', '海宁市', '1', '0');
INSERT INTO `fx_countys` VALUES ('3251', '385', '3', '嘉善县', '1', '0');
INSERT INTO `fx_countys` VALUES ('3252', '385', '3', '平湖市', '1', '0');
INSERT INTO `fx_countys` VALUES ('3253', '385', '3', '桐乡市', '1', '0');
INSERT INTO `fx_countys` VALUES ('3254', '385', '3', '海盐县', '1', '0');
INSERT INTO `fx_countys` VALUES ('3255', '386', '3', '婺城区', '1', '0');
INSERT INTO `fx_countys` VALUES ('3256', '386', '3', '金东区', '1', '0');
INSERT INTO `fx_countys` VALUES ('3257', '386', '3', '兰溪市', '1', '0');
INSERT INTO `fx_countys` VALUES ('3258', '386', '3', '市区', '1', '0');
INSERT INTO `fx_countys` VALUES ('3259', '386', '3', '佛堂镇', '1', '0');
INSERT INTO `fx_countys` VALUES ('3260', '386', '3', '上溪镇', '1', '0');
INSERT INTO `fx_countys` VALUES ('3261', '386', '3', '义亭镇', '1', '0');
INSERT INTO `fx_countys` VALUES ('3262', '386', '3', '大陈镇', '1', '0');
INSERT INTO `fx_countys` VALUES ('3263', '386', '3', '苏溪镇', '1', '0');
INSERT INTO `fx_countys` VALUES ('3264', '386', '3', '赤岸镇', '1', '0');
INSERT INTO `fx_countys` VALUES ('3265', '386', '3', '东阳市', '1', '0');
INSERT INTO `fx_countys` VALUES ('3266', '386', '3', '永康市', '1', '0');
INSERT INTO `fx_countys` VALUES ('3267', '386', '3', '武义县', '1', '0');
INSERT INTO `fx_countys` VALUES ('3268', '386', '3', '浦江县', '1', '0');
INSERT INTO `fx_countys` VALUES ('3269', '386', '3', '磐安县', '1', '0');
INSERT INTO `fx_countys` VALUES ('3270', '387', '3', '莲都区', '1', '0');
INSERT INTO `fx_countys` VALUES ('3271', '387', '3', '龙泉市', '1', '0');
INSERT INTO `fx_countys` VALUES ('3272', '387', '3', '青田县', '1', '0');
INSERT INTO `fx_countys` VALUES ('3273', '387', '3', '缙云县', '1', '0');
INSERT INTO `fx_countys` VALUES ('3274', '387', '3', '遂昌县', '1', '0');
INSERT INTO `fx_countys` VALUES ('3275', '387', '3', '松阳县', '1', '0');
INSERT INTO `fx_countys` VALUES ('3276', '387', '3', '云和县', '1', '0');
INSERT INTO `fx_countys` VALUES ('3277', '387', '3', '庆元县', '1', '0');
INSERT INTO `fx_countys` VALUES ('3278', '387', '3', '景宁', '1', '0');
INSERT INTO `fx_countys` VALUES ('3279', '388', '3', '海曙区', '1', '0');
INSERT INTO `fx_countys` VALUES ('3280', '388', '3', '江东区', '1', '0');
INSERT INTO `fx_countys` VALUES ('3281', '388', '3', '江北区', '1', '0');
INSERT INTO `fx_countys` VALUES ('3282', '388', '3', '镇海区', '1', '0');
INSERT INTO `fx_countys` VALUES ('3283', '388', '3', '北仑区', '1', '0');
INSERT INTO `fx_countys` VALUES ('3284', '388', '3', '鄞州区', '1', '0');
INSERT INTO `fx_countys` VALUES ('3285', '388', '3', '余姚市', '1', '0');
INSERT INTO `fx_countys` VALUES ('3286', '388', '3', '慈溪市', '1', '0');
INSERT INTO `fx_countys` VALUES ('3287', '388', '3', '奉化市', '1', '0');
INSERT INTO `fx_countys` VALUES ('3288', '388', '3', '象山县', '1', '0');
INSERT INTO `fx_countys` VALUES ('3289', '388', '3', '宁海县', '1', '0');
INSERT INTO `fx_countys` VALUES ('3290', '389', '3', '越城区', '1', '0');
INSERT INTO `fx_countys` VALUES ('3291', '389', '3', '上虞市', '1', '0');
INSERT INTO `fx_countys` VALUES ('3292', '389', '3', '嵊州市', '1', '0');
INSERT INTO `fx_countys` VALUES ('3293', '389', '3', '绍兴县', '1', '0');
INSERT INTO `fx_countys` VALUES ('3294', '389', '3', '新昌县', '1', '0');
INSERT INTO `fx_countys` VALUES ('3295', '389', '3', '诸暨市', '1', '0');
INSERT INTO `fx_countys` VALUES ('3296', '390', '3', '椒江区', '1', '0');
INSERT INTO `fx_countys` VALUES ('3297', '390', '3', '黄岩区', '1', '0');
INSERT INTO `fx_countys` VALUES ('3298', '390', '3', '路桥区', '1', '0');
INSERT INTO `fx_countys` VALUES ('3299', '390', '3', '温岭市', '1', '0');
INSERT INTO `fx_countys` VALUES ('3300', '390', '3', '临海市', '1', '0');
INSERT INTO `fx_countys` VALUES ('3301', '390', '3', '玉环县', '1', '0');
INSERT INTO `fx_countys` VALUES ('3302', '390', '3', '三门县', '1', '0');
INSERT INTO `fx_countys` VALUES ('3303', '390', '3', '天台县', '1', '0');
INSERT INTO `fx_countys` VALUES ('3304', '390', '3', '仙居县', '1', '0');
INSERT INTO `fx_countys` VALUES ('3305', '391', '3', '鹿城区', '1', '0');
INSERT INTO `fx_countys` VALUES ('3306', '391', '3', '龙湾区', '1', '0');
INSERT INTO `fx_countys` VALUES ('3307', '391', '3', '瓯海区', '1', '0');
INSERT INTO `fx_countys` VALUES ('3308', '391', '3', '瑞安市', '1', '0');
INSERT INTO `fx_countys` VALUES ('3309', '391', '3', '乐清市', '1', '0');
INSERT INTO `fx_countys` VALUES ('3310', '391', '3', '洞头县', '1', '0');
INSERT INTO `fx_countys` VALUES ('3311', '391', '3', '永嘉县', '1', '0');
INSERT INTO `fx_countys` VALUES ('3312', '391', '3', '平阳县', '1', '0');
INSERT INTO `fx_countys` VALUES ('3313', '391', '3', '苍南县', '1', '0');
INSERT INTO `fx_countys` VALUES ('3314', '391', '3', '文成县', '1', '0');
INSERT INTO `fx_countys` VALUES ('3315', '391', '3', '泰顺县', '1', '0');
INSERT INTO `fx_countys` VALUES ('3316', '392', '3', '定海区', '1', '0');
INSERT INTO `fx_countys` VALUES ('3317', '392', '3', '普陀区', '1', '0');
INSERT INTO `fx_countys` VALUES ('3318', '392', '3', '岱山县', '1', '0');
INSERT INTO `fx_countys` VALUES ('3319', '392', '3', '嵊泗县', '1', '0');
INSERT INTO `fx_countys` VALUES ('3320', '393', '3', '衢州市', '1', '0');
INSERT INTO `fx_countys` VALUES ('3321', '393', '3', '江山市', '1', '0');
INSERT INTO `fx_countys` VALUES ('3322', '393', '3', '常山县', '1', '0');
INSERT INTO `fx_countys` VALUES ('3323', '393', '3', '开化县', '1', '0');
INSERT INTO `fx_countys` VALUES ('3324', '393', '3', '龙游县', '1', '0');
INSERT INTO `fx_countys` VALUES ('3325', '394', '3', '合川区', '1', '0');
INSERT INTO `fx_countys` VALUES ('3326', '394', '3', '江津区', '1', '0');
INSERT INTO `fx_countys` VALUES ('3327', '394', '3', '南川区', '1', '0');
INSERT INTO `fx_countys` VALUES ('3328', '394', '3', '永川区', '1', '0');
INSERT INTO `fx_countys` VALUES ('3329', '394', '3', '南岸区', '1', '0');
INSERT INTO `fx_countys` VALUES ('3330', '394', '3', '渝北区', '1', '0');
INSERT INTO `fx_countys` VALUES ('3331', '394', '3', '万盛区', '1', '0');
INSERT INTO `fx_countys` VALUES ('3332', '394', '3', '大渡口区', '1', '0');
INSERT INTO `fx_countys` VALUES ('3333', '394', '3', '万州区', '1', '0');
INSERT INTO `fx_countys` VALUES ('3334', '394', '3', '北碚区', '1', '0');
INSERT INTO `fx_countys` VALUES ('3335', '394', '3', '沙坪坝区', '1', '0');
INSERT INTO `fx_countys` VALUES ('3336', '394', '3', '巴南区', '1', '0');
INSERT INTO `fx_countys` VALUES ('3337', '394', '3', '涪陵区', '1', '0');
INSERT INTO `fx_countys` VALUES ('3338', '394', '3', '江北区', '1', '0');
INSERT INTO `fx_countys` VALUES ('3339', '394', '3', '九龙坡区', '1', '0');
INSERT INTO `fx_countys` VALUES ('3340', '394', '3', '渝中区', '1', '0');
INSERT INTO `fx_countys` VALUES ('3341', '394', '3', '黔江开发区', '1', '0');
INSERT INTO `fx_countys` VALUES ('3342', '394', '3', '长寿区', '1', '0');
INSERT INTO `fx_countys` VALUES ('3343', '394', '3', '双桥区', '1', '0');
INSERT INTO `fx_countys` VALUES ('3344', '394', '3', '綦江县', '1', '0');
INSERT INTO `fx_countys` VALUES ('3345', '394', '3', '潼南县', '1', '0');
INSERT INTO `fx_countys` VALUES ('3346', '394', '3', '铜梁县', '1', '0');
INSERT INTO `fx_countys` VALUES ('3347', '394', '3', '大足县', '1', '0');
INSERT INTO `fx_countys` VALUES ('3348', '394', '3', '荣昌县', '1', '0');
INSERT INTO `fx_countys` VALUES ('3349', '394', '3', '璧山县', '1', '0');
INSERT INTO `fx_countys` VALUES ('3350', '394', '3', '垫江县', '1', '0');
INSERT INTO `fx_countys` VALUES ('3351', '394', '3', '武隆县', '1', '0');
INSERT INTO `fx_countys` VALUES ('3352', '394', '3', '丰都县', '1', '0');
INSERT INTO `fx_countys` VALUES ('3353', '394', '3', '城口县', '1', '0');
INSERT INTO `fx_countys` VALUES ('3354', '394', '3', '梁平县', '1', '0');
INSERT INTO `fx_countys` VALUES ('3355', '394', '3', '开县', '1', '0');
INSERT INTO `fx_countys` VALUES ('3356', '394', '3', '巫溪县', '1', '0');
INSERT INTO `fx_countys` VALUES ('3357', '394', '3', '巫山县', '1', '0');
INSERT INTO `fx_countys` VALUES ('3358', '394', '3', '奉节县', '1', '0');
INSERT INTO `fx_countys` VALUES ('3359', '394', '3', '云阳县', '1', '0');
INSERT INTO `fx_countys` VALUES ('3360', '394', '3', '忠县', '1', '0');
INSERT INTO `fx_countys` VALUES ('3361', '394', '3', '石柱', '1', '0');
INSERT INTO `fx_countys` VALUES ('3362', '394', '3', '彭水', '1', '0');
INSERT INTO `fx_countys` VALUES ('3363', '394', '3', '酉阳', '1', '0');
INSERT INTO `fx_countys` VALUES ('3364', '394', '3', '秀山', '1', '0');
INSERT INTO `fx_countys` VALUES ('3365', '395', '3', '沙田区', '1', '0');
INSERT INTO `fx_countys` VALUES ('3366', '395', '3', '东区', '1', '0');
INSERT INTO `fx_countys` VALUES ('3367', '395', '3', '观塘区', '1', '0');
INSERT INTO `fx_countys` VALUES ('3368', '395', '3', '黄大仙区', '1', '0');
INSERT INTO `fx_countys` VALUES ('3369', '395', '3', '九龙城区', '1', '0');
INSERT INTO `fx_countys` VALUES ('3370', '395', '3', '屯门区', '1', '0');
INSERT INTO `fx_countys` VALUES ('3371', '395', '3', '葵青区', '1', '0');
INSERT INTO `fx_countys` VALUES ('3372', '395', '3', '元朗区', '1', '0');
INSERT INTO `fx_countys` VALUES ('3373', '395', '3', '深水埗区', '1', '0');
INSERT INTO `fx_countys` VALUES ('3374', '395', '3', '西贡区', '1', '0');
INSERT INTO `fx_countys` VALUES ('3375', '395', '3', '大埔区', '1', '0');
INSERT INTO `fx_countys` VALUES ('3376', '395', '3', '湾仔区', '1', '0');
INSERT INTO `fx_countys` VALUES ('3377', '395', '3', '油尖旺区', '1', '0');
INSERT INTO `fx_countys` VALUES ('3378', '395', '3', '北区', '1', '0');
INSERT INTO `fx_countys` VALUES ('3379', '395', '3', '南区', '1', '0');
INSERT INTO `fx_countys` VALUES ('3380', '395', '3', '荃湾区', '1', '0');
INSERT INTO `fx_countys` VALUES ('3381', '395', '3', '中西区', '1', '0');
INSERT INTO `fx_countys` VALUES ('3382', '395', '3', '离岛区', '1', '0');
INSERT INTO `fx_countys` VALUES ('3383', '396', '3', '澳门', '1', '0');
INSERT INTO `fx_countys` VALUES ('3384', '397', '3', '台北', '1', '0');
INSERT INTO `fx_countys` VALUES ('3385', '397', '3', '高雄', '1', '0');
INSERT INTO `fx_countys` VALUES ('3386', '397', '3', '基隆', '1', '0');
INSERT INTO `fx_countys` VALUES ('3387', '397', '3', '台中', '1', '0');
INSERT INTO `fx_countys` VALUES ('3388', '397', '3', '台南', '1', '0');
INSERT INTO `fx_countys` VALUES ('3389', '397', '3', '新竹', '1', '0');
INSERT INTO `fx_countys` VALUES ('3390', '397', '3', '嘉义', '1', '0');
INSERT INTO `fx_countys` VALUES ('3391', '397', '3', '宜兰县', '1', '0');
INSERT INTO `fx_countys` VALUES ('3392', '397', '3', '桃园县', '1', '0');
INSERT INTO `fx_countys` VALUES ('3393', '397', '3', '苗栗县', '1', '0');
INSERT INTO `fx_countys` VALUES ('3394', '397', '3', '彰化县', '1', '0');
INSERT INTO `fx_countys` VALUES ('3395', '397', '3', '南投县', '1', '0');
INSERT INTO `fx_countys` VALUES ('3396', '397', '3', '云林县', '1', '0');
INSERT INTO `fx_countys` VALUES ('3397', '397', '3', '屏东县', '1', '0');
INSERT INTO `fx_countys` VALUES ('3398', '397', '3', '台东县', '1', '0');
INSERT INTO `fx_countys` VALUES ('3399', '397', '3', '花莲县', '1', '0');
INSERT INTO `fx_countys` VALUES ('3400', '397', '3', '澎湖县', '1', '0');
INSERT INTO `fx_countys` VALUES ('3401', '3', '2', '合肥', '1', '0');
INSERT INTO `fx_countys` VALUES ('3402', '3401', '3', '庐阳区', '1', '0');
INSERT INTO `fx_countys` VALUES ('3403', '3401', '3', '瑶海区', '1', '0');
INSERT INTO `fx_countys` VALUES ('3404', '3401', '3', '蜀山区', '1', '0');
INSERT INTO `fx_countys` VALUES ('3405', '3401', '3', '包河区', '1', '0');
INSERT INTO `fx_countys` VALUES ('3406', '3401', '3', '长丰县', '1', '0');
INSERT INTO `fx_countys` VALUES ('3407', '3401', '3', '肥东县', '1', '0');
INSERT INTO `fx_countys` VALUES ('3408', '3401', '3', '肥西县', '1', '0');

-- ----------------------------
-- Table structure for fx_favorite
-- ----------------------------
DROP TABLE IF EXISTS `fx_favorite`;
CREATE TABLE `fx_favorite` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `sku_id` int(10) unsigned NOT NULL,
  `create_time` int(10) unsigned NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`),
  KEY `cart_user_id` (`user_id`),
  KEY `sku_id_user_id` (`sku_id`,`user_id`) USING BTREE,
  CONSTRAINT `fx_favorite_ibfk_1` FOREIGN KEY (`sku_id`) REFERENCES `fx_products_sku` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `fx_favorite_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `fx_users` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of fx_favorite
-- ----------------------------
INSERT INTO `fx_favorite` VALUES ('2', '25', '9', '1453171356');
INSERT INTO `fx_favorite` VALUES ('3', '25', '2', '1453171364');
INSERT INTO `fx_favorite` VALUES ('5', '1', '6', '1453174010');
INSERT INTO `fx_favorite` VALUES ('6', '1', '2', '1453174070');

-- ----------------------------
-- Table structure for fx_modules
-- ----------------------------
DROP TABLE IF EXISTS `fx_modules`;
CREATE TABLE `fx_modules` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `module` varchar(20) NOT NULL COMMENT '模块名称',
  PRIMARY KEY (`id`),
  UNIQUE KEY `module` (`module`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of fx_modules
-- ----------------------------
INSERT INTO `fx_modules` VALUES ('4', 'invoices');
INSERT INTO `fx_modules` VALUES ('3', 'orders');
INSERT INTO `fx_modules` VALUES ('5', 'products');
INSERT INTO `fx_modules` VALUES ('1', 'register');
INSERT INTO `fx_modules` VALUES ('2', 'users');

-- ----------------------------
-- Table structure for fx_orders
-- ----------------------------
DROP TABLE IF EXISTS `fx_orders`;
CREATE TABLE `fx_orders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_code` varchar(30) NOT NULL COMMENT '订单号',
  `user_code` varchar(10) NOT NULL COMMENT '用户编号',
  `discount` float(3,2) unsigned DEFAULT '1.00' COMMENT '折扣',
  `paid` float(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '已支付金额',
  `amount` float(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '总金额',
  `order_status` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '订单状态',
  `receiver_address_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '收货人地址信息',
  `pay_method` tinyint(3) unsigned DEFAULT '0' COMMENT '支付方式',
  `pay_transaction_id` varchar(50) DEFAULT NULL COMMENT '支付平台交易号',
  `pay_time` int(10) unsigned DEFAULT NULL COMMENT '付款时间',
  `create_time` int(10) unsigned NOT NULL COMMENT '订单创建时间',
  `ship_name` varchar(20) DEFAULT NULL COMMENT '快递名称',
  `ship_no` varchar(30) DEFAULT NULL COMMENT '货运单号',
  `shipping_cost` decimal(10,2) unsigned DEFAULT '0.00' COMMENT '运费',
  PRIMARY KEY (`id`),
  UNIQUE KEY `order_code` (`order_code`),
  KEY `orders_user_code` (`user_code`),
  KEY `orders_order_status` (`order_status`),
  KEY `pay_method` (`pay_method`),
  KEY `pay_time` (`pay_time`),
  KEY `create_time` (`create_time`),
  KEY `orders_receiver_address_id` (`receiver_address_id`),
  CONSTRAINT `orders_order_status` FOREIGN KEY (`order_status`) REFERENCES `fx_orders_status` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `orders_receiver_address_id` FOREIGN KEY (`receiver_address_id`) REFERENCES `fx_receiver_address` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `orders_user_code` FOREIGN KEY (`user_code`) REFERENCES `fx_users` (`user_code`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=134 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of fx_orders
-- ----------------------------
INSERT INTO `fx_orders` VALUES ('1', 'PC20151118153711123456_SK', 'A1004', '0.75', '200.00', '200.00', '5', '7', '2', null, null, '1445665452', null, '700074134800 ', '0.00');
INSERT INTO `fx_orders` VALUES ('2', 'MO20151210141209597252_YK', 'A1004', '1.00', '0.00', '300.00', '3', '3', '2', null, null, '1449727449', null, null, '0.00');
INSERT INTO `fx_orders` VALUES ('3', 'AD20151210141204611562_BH', 'A1004', '1.00', '0.00', '400.00', '5', '13', '2', null, null, '1449727504', null, null, '0.00');
INSERT INTO `fx_orders` VALUES ('4', 'AD20151210141252385255', 'A1001', '1.00', '0.00', '500.00', '5', '14', '0', null, null, '1449727672', null, null, '0.00');
INSERT INTO `fx_orders` VALUES ('5', 'AD20151210141252385258', 'A1001', '1.00', '0.00', '400.00', '5', '8', '2', null, null, '1449738483', null, null, '0.00');
INSERT INTO `fx_orders` VALUES ('6', 'AD20151210171243214334', 'A1001', '1.00', '0.00', '400.00', '5', '17', '2', null, null, '1449738779', null, null, '0.00');
INSERT INTO `fx_orders` VALUES ('7', 'AD20151210171243214340', 'A1001', '1.00', '0.00', '400.00', '5', '19', '2', null, null, '1449739063', null, null, '0.00');
INSERT INTO `fx_orders` VALUES ('8', 'AD20151211111219771484', 'A1001', '1.00', '0.00', '400.00', '5', '20', '2', null, null, '1449803179', null, null, '0.00');
INSERT INTO `fx_orders` VALUES ('9', 'AD20151211121259972341', 'A1001', '1.00', '0.00', '200.00', '3', '21', '2', null, null, '1449807839', null, null, '0.00');
INSERT INTO `fx_orders` VALUES ('10', 'AD20151215161249204452', 'A1004', '1.00', '0.00', '200.00', '5', '22', '2', null, null, '1450169149', null, null, '0.00');
INSERT INTO `fx_orders` VALUES ('11', 'AD20151215161206830728', 'A1004', '1.00', '0.00', '200.00', '5', '23', '2', null, null, '1450169526', null, null, '0.00');
INSERT INTO `fx_orders` VALUES ('12', 'AD20151223161249454693', 'A1004', '1.00', '0.00', '12000.00', '5', '33', '2', null, null, '1450860709', null, null, '0.00');
INSERT INTO `fx_orders` VALUES ('13', 'AD20151224111249495755', 'A1004', '0.90', '0.00', '36.00', '3', '34', '2', null, null, '1450928989', null, null, '0.00');
INSERT INTO `fx_orders` VALUES ('14', 'AD20151225171227389682', 'A1004', '0.90', '360.00', '360.00', '5', '55', '2', null, null, '1451035827', null, null, '75.00');
INSERT INTO `fx_orders` VALUES ('15', 'AD20151225171211312969', 'A1004', '0.90', '435.00', '435.00', '5', '56', '2', 'test', '1451036231', '1451036231', null, null, '75.00');
INSERT INTO `fx_orders` VALUES ('20', 'PC20151228122030577026', 'A1004', '0.90', '0.00', '252.00', '1', '3', '2', null, null, '0', null, null, '0.00');
INSERT INTO `fx_orders` VALUES ('21', 'PC20151228122600449804', 'A1004', '0.90', '0.00', '252.00', '3', '57', '0', null, null, '0', null, null, '0.00');
INSERT INTO `fx_orders` VALUES ('22', 'PC20151228122736989865', 'A1004', '0.90', '0.00', '252.00', '1', '58', '0', null, null, '0', null, null, '0.00');
INSERT INTO `fx_orders` VALUES ('23', 'PC20151228135814704440_SK', 'A1004', '0.90', '0.00', '252.00', '3', '59', '0', null, null, '0', null, null, '0.00');
INSERT INTO `fx_orders` VALUES ('24', 'PC20151228135826668377_SK', 'A1004', '0.90', '0.00', '252.00', '7', '60', '0', null, null, '0', null, null, '0.00');
INSERT INTO `fx_orders` VALUES ('48', 'PC20151228145708539865_SK', 'A1001', '0.85', '0.00', '272.00', '7', '83', '0', null, null, '0', null, null, '0.00');
INSERT INTO `fx_orders` VALUES ('49', 'AD20151228151249559310_BH', 'A1004', '1.00', '0.00', '0.00', '6', '84', '0', null, null, '1451289109', null, null, '0.00');
INSERT INTO `fx_orders` VALUES ('50', 'PC20151229102205691970_SK', 'A1001', '0.85', '0.00', '340.01', '7', '85', '0', null, null, '0', null, null, '0.00');
INSERT INTO `fx_orders` VALUES ('51', 'FXPC15122911580120SK', 'A1001', '0.85', '0.00', '0.02', '7', '86', '0', null, null, '0', null, null, '0.00');
INSERT INTO `fx_orders` VALUES ('52', 'PC2015122915474268SK', 'A1001', '0.85', '0.01', '0.02', '2', '87', '7', '300046', '1452670172', '0', null, null, '0.00');
INSERT INTO `fx_orders` VALUES ('53', 'PC20151229155002298056_SK', 'A1001', '0.85', '0.00', '340.00', '7', '88', '0', null, null, '0', null, null, '0.00');
INSERT INTO `fx_orders` VALUES ('54', 'PC20151230122252284707_SK', 'A1001', '0.85', '0.00', '0.02', '2', '89', '0', null, '1451036231', '1451289109', null, null, '0.00');
INSERT INTO `fx_orders` VALUES ('59', 'FXAD20160106100149579058', 'A1001', '0.85', '34.00', '34.00', '4', '90', '2', null, null, '1452048589', null, null, '0.00');
INSERT INTO `fx_orders` VALUES ('60', 'FXAD2016010610012442', 'A1004', '0.90', '18.00', '36.00', '2', '91', '2', null, null, '1452048864', null, null, '0.00');
INSERT INTO `fx_orders` VALUES ('61', 'FXPC16011111585049SK', 'A1001', '1.00', '0.00', '520.00', '7', '92', '0', null, null, '1452484730', null, null, '0.00');
INSERT INTO `fx_orders` VALUES ('62', 'FXPC16011112285574SK', 'A1001', '1.00', '0.00', '40.00', '7', '93', '0', null, null, '1452486535', null, null, '0.00');
INSERT INTO `fx_orders` VALUES ('63', 'FXPC16011112313212SK', 'A1001', '1.00', '0.00', '40.00', '7', '94', '0', null, null, '1452486692', null, null, '0.00');
INSERT INTO `fx_orders` VALUES ('64', 'FXPC16011112322093SK', 'A1001', '1.00', '0.00', '40.00', '7', '95', '0', null, null, '1452486740', null, null, '0.00');
INSERT INTO `fx_orders` VALUES ('65', 'FXPC16011112325173SK', 'A1001', '1.00', '0.00', '40.00', '7', '96', '0', null, null, '1452486771', null, null, '0.00');
INSERT INTO `fx_orders` VALUES ('66', 'FXPC16011112410473SK', 'A1001', '1.00', '0.00', '40.00', '7', '97', '0', null, null, '1452487264', null, null, '0.00');
INSERT INTO `fx_orders` VALUES ('67', 'FXPC16011210132176SK', 'A1004', '0.90', '0.00', '288.00', '7', '98', '0', null, null, '1452564801', null, null, '0.00');
INSERT INTO `fx_orders` VALUES ('68', 'FXPC16011210134758SK', 'A1004', '0.90', '0.00', '288.00', '7', '99', '0', null, null, '1452564827', null, null, '0.00');
INSERT INTO `fx_orders` VALUES ('69', 'FXPC16011210140759SK', 'A1004', '0.90', '0.00', '288.00', '7', '100', '0', null, null, '1452564847', null, null, '0.00');
INSERT INTO `fx_orders` VALUES ('70', 'FXPC16011210143360SK', 'A1004', '0.90', '0.00', '36.00', '7', '101', '0', null, null, '1452564873', null, null, '0.00');
INSERT INTO `fx_orders` VALUES ('71', 'FXPC16011210151731SK', 'A1004', '0.90', '0.00', '36.00', '7', '102', '0', null, null, '1452564917', null, null, '0.00');
INSERT INTO `fx_orders` VALUES ('72', 'FXPC16011210155639SK', 'A1004', '0.90', '0.00', '36.00', '7', '103', '0', null, null, '1452564956', null, null, '0.00');
INSERT INTO `fx_orders` VALUES ('73', 'FXPC16011210190077SK', 'A1004', '0.90', '0.00', '288.00', '7', '104', '0', null, null, '1452565140', null, null, '0.00');
INSERT INTO `fx_orders` VALUES ('74', 'FXPC16011210193420SK', 'A1004', '0.90', '0.00', '36.00', '7', '105', '0', null, null, '1452565174', null, null, '0.00');
INSERT INTO `fx_orders` VALUES ('75', 'FXPC16011210221864SK', 'A1004', '0.90', '0.00', '216.00', '7', '106', '0', null, null, '1452565338', null, null, '0.00');
INSERT INTO `fx_orders` VALUES ('76', 'FXPC16011211160040SK', 'A1001', '1.00', '0.00', '40.00', '7', '107', '0', null, null, '1452568560', null, null, '0.00');
INSERT INTO `fx_orders` VALUES ('77', 'FXPC16011211194711SK', 'A1004', '0.90', '0.00', '216.00', '7', '108', '0', null, null, '1452568787', null, null, '0.00');
INSERT INTO `fx_orders` VALUES ('78', 'FXPC16011211202880SK', 'A1004', '0.90', '0.00', '36.00', '7', '109', '0', null, null, '1452568828', null, null, '0.00');
INSERT INTO `fx_orders` VALUES ('79', 'FXPC16011211222562SK', 'A1004', '0.90', '0.00', '36.00', '7', '110', '0', null, null, '1452568945', null, null, '0.00');
INSERT INTO `fx_orders` VALUES ('80', 'FXPC16011211234720SK', 'A1004', '0.90', '0.00', '36.00', '7', '111', '0', null, null, '1452569027', null, null, '0.00');
INSERT INTO `fx_orders` VALUES ('81', 'FXPC16011212114654SK', 'A1001', '1.00', '0.00', '12160.00', '7', '112', '0', null, null, '1452571906', null, null, '0.00');
INSERT INTO `fx_orders` VALUES ('97', 'FXPC16011213195486SK', 'A1001', '1.00', '0.00', '200.00', '7', '128', '0', null, null, '1452575994', null, null, '0.00');
INSERT INTO `fx_orders` VALUES ('101', 'FXPC16011214534633SK', 'A1001', '1.00', '0.00', '280.00', '7', '132', '0', null, null, '1452581626', null, null, '0.00');
INSERT INTO `fx_orders` VALUES ('103', 'FXPC16011215100770SK', 'A1001', '1.00', '0.00', '160.00', '5', '134', '0', null, null, '1455582607', '', '', '0.00');
INSERT INTO `fx_orders` VALUES ('104', 'FXPC16011215133216SK', 'A1001', '1.00', '0.00', '240.00', '6', '135', '0', null, null, '1452582812', '韵达速递', '1901388671557', '0.00');
INSERT INTO `fx_orders` VALUES ('105', 'FXPC16011309462073SK', 'A1001', '1.00', '20.00', '40.01', '5', '136', '5', '300045', '1451036231', '1565649580', '中通速递', '762911212210', '0.00');
INSERT INTO `fx_orders` VALUES ('106', 'FXPC16011309462073YK', 'A1001', '1.00', '0.01', '0.01', '2', '136', '7', '300046', '1451066231', '1452655068', '中通速递', '762911212210', '0.00');
INSERT INTO `fx_orders` VALUES ('107', 'FXPC16011215133216YK', 'A1001', '1.00', '0.00', '240.00', '1', '135', '0', null, null, '1458655392', null, null, '0.00');
INSERT INTO `fx_orders` VALUES ('108', 'FXPC16011415181611SK', 'A1001', '1.00', '0.00', '40.00', '7', '137', '0', null, null, '1452755896', null, null, '0.00');
INSERT INTO `fx_orders` VALUES ('109', 'PC20151230122252284707_YK', 'A1001', '0.85', '0.00', '0.02', '1', '89', '0', null, null, '1452768829', null, null, '0.00');
INSERT INTO `fx_orders` VALUES ('110', 'PC2015122915474268YK', 'A1001', '0.85', '0.00', '0.01', '1', '87', '0', null, null, '1452768893', null, null, '0.00');
INSERT INTO `fx_orders` VALUES ('125', 'FXPC16011309462073BH', 'A1001', '1.00', '0.00', '0.00', '5', '136', '0', '', null, '1452837513', '韵达速递', '1901388671557', '0.00');
INSERT INTO `fx_orders` VALUES ('126', 'FXPC16011215100770BH', 'A1001', '1.00', '0.00', '0.00', '2', '134', '0', null, null, '1452840363', null, null, '0.00');
INSERT INTO `fx_orders` VALUES ('127', 'FXPC16011814244298SK', 'A1004', '0.90', '25.00', '36.00', '2', '141', '0', null, null, '1453098282', null, null, '0.00');
INSERT INTO `fx_orders` VALUES ('128', 'FXPC16011814244298YK', 'A1004', '0.90', '0.00', '11.00', '1', '141', '0', null, null, '1453104611', null, null, '0.00');
INSERT INTO `fx_orders` VALUES ('129', 'FXMO16011818014687SK', 'A1001', '0.85', '0.00', '6358.00', '1', '145', '0', null, null, '1453111306', '韵达速递', '1901388671557', '0.00');
INSERT INTO `fx_orders` VALUES ('130', 'FXMO16011818042387SK', 'A1001', '0.85', '0.00', '34.00', '1', '146', '0', null, null, '1453111463', null, null, '0.00');
INSERT INTO `fx_orders` VALUES ('131', 'FXMO16011818044858SK', 'A1001', '0.85', '0.00', '34.00', '1', '147', '0', null, null, '1453111488', '韵达速递', '1901388671557', '0.00');

-- ----------------------------
-- Table structure for fx_orders_bh
-- ----------------------------
DROP TABLE IF EXISTS `fx_orders_bh`;
CREATE TABLE `fx_orders_bh` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user` varchar(20) NOT NULL,
  `order_code` varchar(30) NOT NULL,
  `sku` varchar(30) NOT NULL,
  `num` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '补货数量',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '状态，0：未补货，1：已补货',
  `create_time` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_order_code_sku` (`user`,`order_code`,`sku`),
  KEY `orders_bh_order_code` (`order_code`),
  KEY `orders_bh_sku` (`sku`),
  KEY `status` (`status`),
  CONSTRAINT `orders_bh_order_code` FOREIGN KEY (`order_code`) REFERENCES `fx_orders` (`order_code`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `orders_bh_sku` FOREIGN KEY (`sku`) REFERENCES `fx_products_sku` (`sku`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `orders_bh_user` FOREIGN KEY (`user`) REFERENCES `fx_users` (`username_phone`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of fx_orders_bh
-- ----------------------------
INSERT INTO `fx_orders_bh` VALUES ('2', '13632252276', 'FXPC16011215133216SK', 'S00001', '10', '0', '1452222222');
INSERT INTO `fx_orders_bh` VALUES ('4', '13632252276', 'FXPC16011215133216SK', 'S00004', '20', '0', '1452222222');
INSERT INTO `fx_orders_bh` VALUES ('5', '13632252276', 'FXPC16011215133216SK', 'S00006', '5', '0', '1452222222');
INSERT INTO `fx_orders_bh` VALUES ('6', '13632252276', 'FXPC16011215100770SK', 'S00005', '2', '1', '1452222222');
INSERT INTO `fx_orders_bh` VALUES ('7', '13632252276', 'FXPC16011309462073SK', 'S00006', '10', '0', '1452845391');
INSERT INTO `fx_orders_bh` VALUES ('8', '13632252276', 'FXPC16011309462073SK', 'S00005', '11', '0', '1452845391');
INSERT INTO `fx_orders_bh` VALUES ('13', '13632252275', 'AD20151225171211312969', 'S00002', '11', '0', '1452845542');

-- ----------------------------
-- Table structure for fx_orders_invoices
-- ----------------------------
DROP TABLE IF EXISTS `fx_orders_invoices`;
CREATE TABLE `fx_orders_invoices` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `order_code` varchar(30) NOT NULL COMMENT '订单号',
  `user_code` varchar(10) NOT NULL COMMENT '用户编号',
  `invoices_code` varchar(50) DEFAULT NULL COMMENT '发票编号',
  `title` varchar(50) NOT NULL COMMENT '发票抬头',
  `amount` float(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '发票金额',
  `type` varchar(10) NOT NULL DEFAULT '普通' COMMENT '发票类型(普通、增值税)',
  `receiver_address_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '收货人地址信息',
  `create_time` int(10) unsigned NOT NULL COMMENT '订单创建时间',
  PRIMARY KEY (`id`),
  KEY `orders_invoices_order_code` (`order_code`),
  KEY `orders_invoices_user_code` (`user_code`),
  KEY `invoices_code` (`invoices_code`),
  KEY `title` (`title`),
  KEY `type` (`type`),
  KEY `create_time` (`create_time`),
  KEY `orders_invoices_receiver_address_id` (`receiver_address_id`),
  CONSTRAINT `orders_invoices_order_code` FOREIGN KEY (`order_code`) REFERENCES `fx_orders` (`order_code`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `orders_invoices_receiver_address_id` FOREIGN KEY (`receiver_address_id`) REFERENCES `fx_receiver_address` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `orders_invoices_user_code` FOREIGN KEY (`user_code`) REFERENCES `fx_users` (`user_code`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of fx_orders_invoices
-- ----------------------------
INSERT INTO `fx_orders_invoices` VALUES ('1', 'PC20151118153711123456_SK', 'A1004', 'fp4545455', 'test', '200.00', '普通', '3', '1445665452');
INSERT INTO `fx_orders_invoices` VALUES ('2', 'MO20151210141209597252_YK', 'A1002', 'fp3483948', 'test', '222.00', '普通', '7', '1445665452');

-- ----------------------------
-- Table structure for fx_orders_log
-- ----------------------------
DROP TABLE IF EXISTS `fx_orders_log`;
CREATE TABLE `fx_orders_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_code` varchar(30) NOT NULL DEFAULT '0',
  `ex_status` varchar(50) DEFAULT NULL COMMENT '未更改前的状态',
  `admin` varchar(64) DEFAULT NULL COMMENT '管理员名称',
  `action` varchar(50) DEFAULT NULL COMMENT '订单状态',
  `ip` varchar(50) DEFAULT NULL COMMENT '操作者IP',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '操作时间',
  PRIMARY KEY (`id`),
  KEY `ordercode` (`order_code`),
  KEY `adminid` (`admin`),
  CONSTRAINT `ordercode` FOREIGN KEY (`order_code`) REFERENCES `fx_orders` (`order_code`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of fx_orders_log
-- ----------------------------
INSERT INTO `fx_orders_log` VALUES ('1', 'FXPC16011215100770SK', '取消订单', '13632252276', '订单取消', '192.168.75.99', '1452740068');
INSERT INTO `fx_orders_log` VALUES ('2', 'FXPC16011215100770SK', '取消订单', '13632252276', '订单取消', '192.168.75.99', '1452741175');
INSERT INTO `fx_orders_log` VALUES ('3', 'FXPC16011215100770SK', '取消订单', '13632252276', '订单取消', '192.168.75.99', '1452741341');
INSERT INTO `fx_orders_log` VALUES ('4', 'FXPC16011215100770SK', '取消订单', '13632252276', '订单取消', '192.168.75.99', '1452741622');
INSERT INTO `fx_orders_log` VALUES ('5', 'FXPC16011215100770SK', '取消订单', '13632252276', '订单取消', '192.168.75.99', '1452741930');
INSERT INTO `fx_orders_log` VALUES ('6', 'FXPC16011215100770SK', '取消订单', '13632252276', '订单取消', '192.168.75.99', '1452741993');
INSERT INTO `fx_orders_log` VALUES ('7', 'FXPC16011215100770SK', '取消订单', '13632252276', '订单取消', '192.168.75.99', '1452742030');
INSERT INTO `fx_orders_log` VALUES ('8', 'FXPC16011415181611SK', '取消订单', '13632252276', '订单取消', '192.168.75.99', '1452755907');
INSERT INTO `fx_orders_log` VALUES ('9', 'FXPC16011309462073BH', '已支付，待发货', 'root', '已完结', '127.0.0.1', '1453175273');
INSERT INTO `fx_orders_log` VALUES ('10', 'FXPC16011215133216SK', '待支付', 'root', '订单取消', '127.0.0.1', '1453175737');
INSERT INTO `fx_orders_log` VALUES ('11', 'FXPC16011215133216SK', '待支付', 'root', '订单取消', '127.0.0.1', '1453176381');
INSERT INTO `fx_orders_log` VALUES ('12', 'FXPC16011215133216SK', '待支付', 'root', '订单取消', '127.0.0.1', '1453176760');
INSERT INTO `fx_orders_log` VALUES ('13', 'FXPC16011215133216SK', '待支付', 'root', '订单取消', '127.0.0.1', '1453177014');

-- ----------------------------
-- Table structure for fx_orders_products
-- ----------------------------
DROP TABLE IF EXISTS `fx_orders_products`;
CREATE TABLE `fx_orders_products` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `order_code` varchar(30) NOT NULL COMMENT '订单号',
  `product_sku` varchar(30) NOT NULL COMMENT '商品的SKU',
  `product_num` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '商品数量',
  `exp_date` int(10) unsigned DEFAULT NULL COMMENT '产品批号',
  PRIMARY KEY (`id`),
  UNIQUE KEY `order_code_product_sku_exp_date` (`order_code`,`product_sku`,`exp_date`),
  KEY `orders_products_order_code` (`order_code`),
  KEY `orders_prodcuts_sku` (`product_sku`),
  KEY `orders_products_exp_date` (`exp_date`),
  CONSTRAINT `orders_prodcuts_sku` FOREIGN KEY (`product_sku`) REFERENCES `fx_products_sku` (`sku`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `orders_products_exp_date` FOREIGN KEY (`exp_date`) REFERENCES `fx_products_stock` (`exp_date`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `orders_products_order_code` FOREIGN KEY (`order_code`) REFERENCES `fx_orders` (`order_code`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=173 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of fx_orders_products
-- ----------------------------
INSERT INTO `fx_orders_products` VALUES ('1', 'PC20151118153711123456_SK', 'S00001', '100', '1458241600');
INSERT INTO `fx_orders_products` VALUES ('2', 'PC20151118153711123456_SK', 'S00001', '100', '1458355200');
INSERT INTO `fx_orders_products` VALUES ('3', 'PC20151118153711123456_SK', 'S00005', '1', '1542333331');
INSERT INTO `fx_orders_products` VALUES ('4', 'AD20151210141252385255', 'S00005', '1', '1542333331');
INSERT INTO `fx_orders_products` VALUES ('5', 'AD20151210141252385258', 'S00005', '1', '1542333331');
INSERT INTO `fx_orders_products` VALUES ('6', 'AD20151210141204611562_BH', 'S00007', '1', '1542333331');
INSERT INTO `fx_orders_products` VALUES ('7', 'AD20151210171243214334', 'S00006', '1', '1552569027');
INSERT INTO `fx_orders_products` VALUES ('8', 'AD20151210141204611562_BH', 'S00005', '23', '1542333331');
INSERT INTO `fx_orders_products` VALUES ('9', 'AD20151210171243214340', 'S00006', '1', '1552569027');
INSERT INTO `fx_orders_products` VALUES ('10', 'AD20151210171243214340', 'S00005', '1', '1542333331');
INSERT INTO `fx_orders_products` VALUES ('11', 'MO20151210141209597252_YK', 'S00005', '1', '1542333331');
INSERT INTO `fx_orders_products` VALUES ('12', 'AD20151211111219771484', 'S00006', '1', '1542333331');
INSERT INTO `fx_orders_products` VALUES ('13', 'AD20151211121259972341', 'S00005', '1', '1542333331');
INSERT INTO `fx_orders_products` VALUES ('14', 'AD20151215161249204452', 'S00006', '20', '1552569027');
INSERT INTO `fx_orders_products` VALUES ('15', 'AD20151215161206830728', 'S00005', '5', '1542333331');
INSERT INTO `fx_orders_products` VALUES ('16', 'AD20151223161249454693', 'S00006', '300', '1552569027');
INSERT INTO `fx_orders_products` VALUES ('17', 'AD20151224111249495755', 'S00006', '1', '1552569027');
INSERT INTO `fx_orders_products` VALUES ('18', 'AD20151225171227389682', 'S00002', '20', '1448553600');
INSERT INTO `fx_orders_products` VALUES ('19', 'AD20151225171211312969', 'S00002', '20', null);
INSERT INTO `fx_orders_products` VALUES ('20', 'PC20151118153711123456_SK', 'S00004', '10', null);
INSERT INTO `fx_orders_products` VALUES ('21', 'PC20151228145708539865_SK', 'S00004', '4', null);
INSERT INTO `fx_orders_products` VALUES ('22', 'FXPC16011309462073SK', 'S00006', '4', null);
INSERT INTO `fx_orders_products` VALUES ('23', 'AD20151228151249559310_BH', 'S00006', '1', '1552569027');
INSERT INTO `fx_orders_products` VALUES ('24', 'PC20151229102205691970_SK', 'S00004', '8', null);
INSERT INTO `fx_orders_products` VALUES ('25', 'PC20151229102205691970_SK', 'S00005', '2', null);
INSERT INTO `fx_orders_products` VALUES ('26', 'FXPC15122911580120SK', 'S00005', '1', null);
INSERT INTO `fx_orders_products` VALUES ('27', 'PC2015122915474268SK', 'S00005', '1', null);
INSERT INTO `fx_orders_products` VALUES ('28', 'PC20151229155002298056_SK', 'S00004', '8', null);
INSERT INTO `fx_orders_products` VALUES ('29', 'PC20151230122252284707_SK', 'S00004', '2', null);
INSERT INTO `fx_orders_products` VALUES ('30', 'PC20151230122252284707_SK', 'S00005', '1', null);
INSERT INTO `fx_orders_products` VALUES ('31', 'PC20151230122252284707_SK', 'S00005', '2', null);
INSERT INTO `fx_orders_products` VALUES ('32', 'FXAD20160106100149579058', 'S00006', '1', '1552569027');
INSERT INTO `fx_orders_products` VALUES ('33', 'FXAD2016010610012442', 'S00007', '1', '1542333331');
INSERT INTO `fx_orders_products` VALUES ('34', 'FXPC16011111585049SK', 'S00006', '3', null);
INSERT INTO `fx_orders_products` VALUES ('35', 'FXPC16011111585049SK', 'S00004', '6', null);
INSERT INTO `fx_orders_products` VALUES ('36', 'FXPC16011111585049SK', 'S00005', '4', null);
INSERT INTO `fx_orders_products` VALUES ('37', 'FXPC16011112285574SK', 'S00004', '1', null);
INSERT INTO `fx_orders_products` VALUES ('38', 'FXPC16011112313212SK', 'S00004', '1', null);
INSERT INTO `fx_orders_products` VALUES ('39', 'AD20151210141252385255', 'S00001', '362', '1458241600');
INSERT INTO `fx_orders_products` VALUES ('40', 'FXPC16011210132176SK', 'S00005', '6', null);
INSERT INTO `fx_orders_products` VALUES ('41', 'FXPC16011210132176SK', 'S00006', '2', null);
INSERT INTO `fx_orders_products` VALUES ('42', 'FXPC16011309462073SK', 'S00005', '6', null);
INSERT INTO `fx_orders_products` VALUES ('43', 'FXPC16011210134758SK', 'S00006', '2', null);
INSERT INTO `fx_orders_products` VALUES ('44', 'FXPC16011210140759SK', 'S00005', '6', null);
INSERT INTO `fx_orders_products` VALUES ('45', 'FXPC16011210140759SK', 'S00006', '2', null);
INSERT INTO `fx_orders_products` VALUES ('46', 'FXPC16011210143360SK', 'S00004', '1', null);
INSERT INTO `fx_orders_products` VALUES ('47', 'FXPC16011210151731SK', 'S00004', '1', null);
INSERT INTO `fx_orders_products` VALUES ('48', 'FXPC16011210155639SK', 'S00004', '1', null);
INSERT INTO `fx_orders_products` VALUES ('49', 'FXPC16011210190077SK', 'S00005', '6', null);
INSERT INTO `fx_orders_products` VALUES ('50', 'FXPC16011210190077SK', 'S00006', '2', null);
INSERT INTO `fx_orders_products` VALUES ('51', 'FXPC16011215100770SK', 'S00004', '5', null);
INSERT INTO `fx_orders_products` VALUES ('52', 'FXPC16011210221864SK', 'S00005', '6', null);
INSERT INTO `fx_orders_products` VALUES ('73', 'AD20151210141252385255', 'S00001', '982', '1458355200');
INSERT INTO `fx_orders_products` VALUES ('74', 'AD20151210141252385255', 'S00001', '156', '1552569027');
INSERT INTO `fx_orders_products` VALUES ('75', 'FXPC16011211160040SK', 'S00004', '1', null);
INSERT INTO `fx_orders_products` VALUES ('76', 'FXPC16011211194711SK', 'S00005', '6', null);
INSERT INTO `fx_orders_products` VALUES ('77', 'FXPC16011211202880SK', 'S00004', '1', null);
INSERT INTO `fx_orders_products` VALUES ('78', 'FXPC16011211222562SK', 'S00004', '1', null);
INSERT INTO `fx_orders_products` VALUES ('79', 'FXPC16011211234720SK', 'S00004', '1', null);
INSERT INTO `fx_orders_products` VALUES ('80', 'FXPC16011212114654SK', 'S00004', '300', null);
INSERT INTO `fx_orders_products` VALUES ('81', 'FXPC16011212114654SK', 'S00005', '4', null);
INSERT INTO `fx_orders_products` VALUES ('112', 'FXPC16011213195486SK', 'S00004', '1', null);
INSERT INTO `fx_orders_products` VALUES ('113', 'FXPC16011213195486SK', 'S00005', '4', null);
INSERT INTO `fx_orders_products` VALUES ('123', 'FXPC16011214534633SK', 'S00001', '2', null);
INSERT INTO `fx_orders_products` VALUES ('124', 'FXPC16011214534633SK', 'S00004', '4', null);
INSERT INTO `fx_orders_products` VALUES ('125', 'FXPC16011214534633SK', 'S00005', '1', null);
INSERT INTO `fx_orders_products` VALUES ('126', 'FXPC16011215100770SK', 'S00005', '4', null);
INSERT INTO `fx_orders_products` VALUES ('127', 'FXPC16011215133216SK', 'S00006', '2', '1552569027');
INSERT INTO `fx_orders_products` VALUES ('128', 'FXPC16011215133216SK', 'S00001', '2', '1552569027');
INSERT INTO `fx_orders_products` VALUES ('129', 'FXPC16011215133216SK', 'S00004', '1', null);
INSERT INTO `fx_orders_products` VALUES ('130', 'FXPC16011215133216SK', 'S00005', '1', '1552569027');
INSERT INTO `fx_orders_products` VALUES ('132', 'FXPC16011215133216SK', 'S00006', '1', '1458355200');
INSERT INTO `fx_orders_products` VALUES ('133', 'FXPC16011309462073SK', 'S00005', '1', null);
INSERT INTO `fx_orders_products` VALUES ('134', 'FXPC16011415181611SK', 'S00005', '1', null);
INSERT INTO `fx_orders_products` VALUES ('146', 'FXPC16011215133216SK', 'S00004', '20', '1552569027');
INSERT INTO `fx_orders_products` VALUES ('147', 'FXPC16011215133216SK', 'S00001', '10', '1458355200');
INSERT INTO `fx_orders_products` VALUES ('167', 'FXPC16011309462073BH', 'S00005', '2', '1542333331');
INSERT INTO `fx_orders_products` VALUES ('168', 'FXPC16011215100770BH', 'S00005', '2', '1542333331');
INSERT INTO `fx_orders_products` VALUES ('169', 'FXPC16011814244298SK', 'S00005', '1', null);
INSERT INTO `fx_orders_products` VALUES ('170', 'FXMO16011818014687SK', 'S00005', '187', null);
INSERT INTO `fx_orders_products` VALUES ('171', 'FXMO16011818042387SK', 'S00005', '1', null);
INSERT INTO `fx_orders_products` VALUES ('172', 'FXMO16011818044858SK', 'S00005', '1', null);

-- ----------------------------
-- Table structure for fx_orders_status
-- ----------------------------
DROP TABLE IF EXISTS `fx_orders_status`;
CREATE TABLE `fx_orders_status` (
  `id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(10) NOT NULL COMMENT '状态代码',
  `name` varchar(10) NOT NULL COMMENT '状态名称',
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of fx_orders_status
-- ----------------------------
INSERT INTO `fx_orders_status` VALUES ('1', 'pending', '待支付');
INSERT INTO `fx_orders_status` VALUES ('2', 'paid', '已支付，待发货');
INSERT INTO `fx_orders_status` VALUES ('3', 'shipped', '已发货');
INSERT INTO `fx_orders_status` VALUES ('4', 'receipt', '已收货，待结款');
INSERT INTO `fx_orders_status` VALUES ('5', 'completed', '已完结');
INSERT INTO `fx_orders_status` VALUES ('6', 'cancelled', '订单取消');
INSERT INTO `fx_orders_status` VALUES ('7', 'closed', '订单关闭');

-- ----------------------------
-- Table structure for fx_payment_method
-- ----------------------------
DROP TABLE IF EXISTS `fx_payment_method`;
CREATE TABLE `fx_payment_method` (
  `id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT COMMENT '自然序号',
  `code` varchar(10) NOT NULL COMMENT '支付方法代码',
  `name` varchar(255) NOT NULL DEFAULT ' ' COMMENT '英文名称',
  `description` varchar(500) DEFAULT NULL COMMENT '英文描述',
  `sort` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '排序号',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态：启用1，禁用0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`code`),
  KEY `sort` (`sort`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of fx_payment_method
-- ----------------------------
INSERT INTO `fx_payment_method` VALUES ('2', 'alipay', '在线支付-支付宝', '', '2', '1');
INSERT INTO `fx_payment_method` VALUES ('3', 'bank', '银行转账', '银行转账', '3', '1');
INSERT INTO `fx_payment_method` VALUES ('4', 'ptpcard', '帕斯婷一卡通', '帕斯婷一卡通', '4', '1');
INSERT INTO `fx_payment_method` VALUES ('5', 'unionwap', '银联手机在线', '银联手机在线支付', '5', '1');
INSERT INTO `fx_payment_method` VALUES ('6', 'cash', '现金支付', '到现场用现金支付', '6', '1');
INSERT INTO `fx_payment_method` VALUES ('7', 'unionpay', '银联网付通', '银联网付通在线支付', '7', '1');
INSERT INTO `fx_payment_method` VALUES ('8', 'wxpay', '微信支付', '微信支付', '8', '1');
INSERT INTO `fx_payment_method` VALUES ('9', 'wxnative', ' 微信扫码支付', ' 微信扫码支付', '9', '1');

-- ----------------------------
-- Table structure for fx_privilege
-- ----------------------------
DROP TABLE IF EXISTS `fx_privilege`;
CREATE TABLE `fx_privilege` (
  `id` smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `title` varchar(50) DEFAULT NULL,
  `status` tinyint(1) DEFAULT '1',
  `remark` varchar(255) DEFAULT '0',
  `sort` smallint(6) unsigned DEFAULT '0',
  `pid` smallint(6) unsigned NOT NULL,
  `level` tinyint(1) unsigned NOT NULL,
  `type` tinyint(1) NOT NULL DEFAULT '0',
  `group_id` tinyint(3) unsigned DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `level` (`level`),
  KEY `pid` (`pid`),
  KEY `status` (`status`),
  KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=503 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of fx_privilege
-- ----------------------------
INSERT INTO `fx_privilege` VALUES ('1', 'Cpanel', 'Cpanel后台管理', '1', '0', '0', '0', '1', '0', '0');
INSERT INTO `fx_privilege` VALUES ('2', 'PrivilegeGroup', '权限组管理', '1', '0', '0', '1', '2', '0', '2');
INSERT INTO `fx_privilege` VALUES ('3', 'PrivilegeModel', '模块权限', '1', '0', '0', '1', '2', '0', '2');
INSERT INTO `fx_privilege` VALUES ('4', 'PrivilegeOperation', '操作权限', '1', '0', '0', '1', '2', '0', '2');
INSERT INTO `fx_privilege` VALUES ('6', 'Role', '角色管理', '1', '0', '0', '1', '2', '0', '2');
INSERT INTO `fx_privilege` VALUES ('7', 'Admin', '管理员列表', '1', '0', '0', '1', '2', '0', '2');
INSERT INTO `fx_privilege` VALUES ('30', 'Public', '公共模块', '1', '0', '0', '1', '2', '0', '10');
INSERT INTO `fx_privilege` VALUES ('31', 'add', '添加权限组', '1', '0', '0', '2', '3', '0', '0');
INSERT INTO `fx_privilege` VALUES ('32', 'delete', '删除权限组', '1', '0', '0', '2', '3', '0', '0');
INSERT INTO `fx_privilege` VALUES ('33', 'edit', '编辑权限组', '1', '0', '0', '2', '3', '0', '0');
INSERT INTO `fx_privilege` VALUES ('34', 'index', '查看权限组', '1', '0', '0', '2', '3', '0', '0');
INSERT INTO `fx_privilege` VALUES ('36', 'add', '添加模块权限', '1', '0', '0', '3', '3', '0', '0');
INSERT INTO `fx_privilege` VALUES ('37', 'delete', '删除模块权限', '1', '0', '0', '3', '3', '0', '0');
INSERT INTO `fx_privilege` VALUES ('38', 'edit', '编辑模块权限', '1', '0', '0', '3', '3', '0', '0');
INSERT INTO `fx_privilege` VALUES ('39', 'index', '查看模块权限', '1', '0', '0', '3', '3', '0', '0');
INSERT INTO `fx_privilege` VALUES ('40', 'Index', '默认模块', '1', '0', '0', '1', '2', '0', '10');
INSERT INTO `fx_privilege` VALUES ('82', 'main', '登陆后台默认首页', '1', '0', '0', '40', '3', '0', '0');
INSERT INTO `fx_privilege` VALUES ('83', 'index', '登录成功后首页', '1', '0', '0', '40', '3', '0', '0');
INSERT INTO `fx_privilege` VALUES ('84', 'delete', '删除', '0', '0', '0', '40', '3', '0', '0');
INSERT INTO `fx_privilege` VALUES ('85', 'add', '添加', '0', '0', '0', '40', '3', '0', '40');
INSERT INTO `fx_privilege` VALUES ('93', 'add', '添加管理员', '1', '0', '0', '7', '3', '0', '40');
INSERT INTO `fx_privilege` VALUES ('94', 'delete', '删除管理员', '1', '0', '0', '7', '3', '0', '0');
INSERT INTO `fx_privilege` VALUES ('95', 'edit', '编辑管理员', '1', '0', '0', '7', '3', '0', '0');
INSERT INTO `fx_privilege` VALUES ('96', 'index', '查看管理员', '1', '0', '0', '7', '3', '0', '0');
INSERT INTO `fx_privilege` VALUES ('97', 'changePassword', '修改管理员的密码(仅当前登录)', '1', '0', '0', '7', '3', '0', '0');
INSERT INTO `fx_privilege` VALUES ('100', 'add', '添加角色', '1', '0', '0', '6', '3', '0', '0');
INSERT INTO `fx_privilege` VALUES ('101', 'delete', '删除角色', '1', '0', '0', '6', '3', '0', '0');
INSERT INTO `fx_privilege` VALUES ('102', 'edit', '编辑角色', '1', '0', '0', '6', '3', '0', '0');
INSERT INTO `fx_privilege` VALUES ('103', 'index', '查看角色', '1', '0', '0', '6', '3', '0', '0');
INSERT INTO `fx_privilege` VALUES ('106', 'add', '添加操作权限', '1', '0', '0', '4', '3', '0', '0');
INSERT INTO `fx_privilege` VALUES ('107', 'delete', '删除操作权限', '1', '0', '0', '4', '3', '0', '0');
INSERT INTO `fx_privilege` VALUES ('108', 'edit', '修改操作权限', '1', '0', '0', '4', '3', '0', '0');
INSERT INTO `fx_privilege` VALUES ('109', 'index', '查看操作权限', '1', '0', '0', '4', '3', '0', '0');
INSERT INTO `fx_privilege` VALUES ('122', 'Category', '产品分类管理', '1', '0', '0', '1', '2', '0', '7');
INSERT INTO `fx_privilege` VALUES ('123', 'Product', '产品管理', '1', '0', '0', '1', '2', '0', '7');
INSERT INTO `fx_privilege` VALUES ('124', 'add', '添加产品分类', '1', '0', '0', '122', '3', '0', '0');
INSERT INTO `fx_privilege` VALUES ('125', 'delete', '删除产品分类', '1', '0', '0', '122', '3', '0', '0');
INSERT INTO `fx_privilege` VALUES ('126', 'edit', '编辑产品分类', '1', '0', '0', '122', '3', '0', '0');
INSERT INTO `fx_privilege` VALUES ('127', 'index', '查看产品分类', '1', '0', '0', '122', '3', '0', '0');
INSERT INTO `fx_privilege` VALUES ('128', 'add', '添加产品', '1', '0', '0', '123', '3', '0', '0');
INSERT INTO `fx_privilege` VALUES ('129', 'delete', '删除产品', '1', '0', '0', '123', '3', '0', '0');
INSERT INTO `fx_privilege` VALUES ('130', 'edit', '编辑产品', '1', '0', '0', '123', '3', '0', '0');
INSERT INTO `fx_privilege` VALUES ('131', 'index', '查看产品', '1', '0', '0', '123', '3', '0', '0');
INSERT INTO `fx_privilege` VALUES ('142', 'User', '分销商管理', '1', '0', '0', '1', '2', '0', '6');
INSERT INTO `fx_privilege` VALUES ('143', 'add', '添加用户', '1', '0', '0', '142', '3', '0', '0');
INSERT INTO `fx_privilege` VALUES ('144', 'delete', '删除用户', '1', '0', '0', '142', '3', '0', '0');
INSERT INTO `fx_privilege` VALUES ('145', 'edit', '编辑用户', '1', '0', '0', '142', '3', '0', '0');
INSERT INTO `fx_privilege` VALUES ('146', 'index', '查看用户', '1', '0', '0', '142', '3', '0', '0');
INSERT INTO `fx_privilege` VALUES ('147', 'Order', '订单管理', '1', '0', '0', '1', '2', '0', '8');
INSERT INTO `fx_privilege` VALUES ('148', 'add', '添加订单', '1', '0', '0', '147', '3', '0', '0');
INSERT INTO `fx_privilege` VALUES ('149', 'delete', '删除订单', '1', '0', '0', '147', '3', '0', '0');
INSERT INTO `fx_privilege` VALUES ('150', 'edit', '编辑订单', '1', '0', '0', '147', '3', '0', '0');
INSERT INTO `fx_privilege` VALUES ('151', 'index', '查看订单', '1', '0', '0', '147', '3', '0', '0');
INSERT INTO `fx_privilege` VALUES ('152', 'OrderStatus', '订单状态', '1', '0', '0', '1', '2', '0', '8');
INSERT INTO `fx_privilege` VALUES ('153', 'add', '添加订单状态', '1', '0', '0', '152', '3', '0', '0');
INSERT INTO `fx_privilege` VALUES ('154', 'delete', '删除订单状态', '1', '0', '0', '152', '3', '0', '0');
INSERT INTO `fx_privilege` VALUES ('155', 'edit', '编辑订单状态', '1', '0', '0', '152', '3', '0', '0');
INSERT INTO `fx_privilege` VALUES ('156', 'index', '订单状态列表', '1', '0', '0', '152', '3', '0', '0');
INSERT INTO `fx_privilege` VALUES ('157', 'ShippingMethod', '发货方式', '0', '0', '0', '1', '2', '0', '8');
INSERT INTO `fx_privilege` VALUES ('158', 'add', '添加发货方式', '1', '0', '0', '157', '3', '0', '0');
INSERT INTO `fx_privilege` VALUES ('159', 'delete', '删除发货方式', '1', '0', '0', '157', '3', '0', '0');
INSERT INTO `fx_privilege` VALUES ('160', 'edit', '编辑发货方式', '1', '0', '0', '157', '3', '0', '0');
INSERT INTO `fx_privilege` VALUES ('161', 'index', '查看发货方式', '1', '0', '0', '157', '3', '0', '0');
INSERT INTO `fx_privilege` VALUES ('162', 'PaymentMethod', '付款方式', '1', '0', '0', '1', '2', '0', '8');
INSERT INTO `fx_privilege` VALUES ('163', 'add', '添加付款方式', '1', '0', '0', '162', '3', '0', '0');
INSERT INTO `fx_privilege` VALUES ('164', 'delete', '删除付款方式', '1', '0', '0', '162', '3', '0', '0');
INSERT INTO `fx_privilege` VALUES ('165', 'edit', '编辑付款方式', '1', '0', '0', '162', '3', '0', '0');
INSERT INTO `fx_privilege` VALUES ('166', 'index', '查看付款方式', '1', '0', '0', '162', '3', '0', '0');
INSERT INTO `fx_privilege` VALUES ('172', 'OrderReport', '订单报表', '1', '0', '0', '1', '2', '0', '18');
INSERT INTO `fx_privilege` VALUES ('173', 'index', '查看订单报表', '1', '0', '0', '172', '3', '0', '0');
INSERT INTO `fx_privilege` VALUES ('174', 'ProductReport', '产品报表', '1', '0', '0', '1', '2', '0', '18');
INSERT INTO `fx_privilege` VALUES ('175', 'index', '查看产品报表', '1', '0', '0', '174', '3', '0', '0');
INSERT INTO `fx_privilege` VALUES ('176', 'UserReport', '分销商报表', '1', '0', '0', '1', '2', '0', '18');
INSERT INTO `fx_privilege` VALUES ('177', 'index', '查看会员报表', '1', '0', '0', '176', '3', '0', '0');
INSERT INTO `fx_privilege` VALUES ('178', 'SetMail', '配置邮件服务器参数', '0', '0', '0', '1', '2', '0', '15');
INSERT INTO `fx_privilege` VALUES ('179', 'Newsletter', '邀请邮件管理', '0', '0', '0', '1', '2', '0', '15');
INSERT INTO `fx_privilege` VALUES ('180', 'add', '添加邀请邮件', '1', '0', '0', '179', '3', '0', '0');
INSERT INTO `fx_privilege` VALUES ('181', 'delete', '删除邀请邮件', '1', '0', '0', '179', '3', '0', '0');
INSERT INTO `fx_privilege` VALUES ('182', 'edit', '编辑邀请邮件', '1', '0', '0', '179', '3', '0', '0');
INSERT INTO `fx_privilege` VALUES ('183', 'index', '查看邀请邮件', '1', '0', '0', '179', '3', '0', '0');
INSERT INTO `fx_privilege` VALUES ('184', 'MailTemplate', '邮件模板', '0', '0', '0', '1', '2', '0', '15');
INSERT INTO `fx_privilege` VALUES ('185', 'add', '添加邮件模板', '1', '0', '0', '184', '3', '0', '0');
INSERT INTO `fx_privilege` VALUES ('186', 'delete', '删除邮件模板', '1', '0', '0', '184', '3', '0', '0');
INSERT INTO `fx_privilege` VALUES ('187', 'edit', '编辑邮件模板', '1', '0', '0', '184', '3', '0', '0');
INSERT INTO `fx_privilege` VALUES ('188', 'index', '查看邮件模板', '1', '0', '0', '184', '3', '0', '0');
INSERT INTO `fx_privilege` VALUES ('189', 'SendMail', '发送邮件', '0', '0', '0', '1', '2', '0', '15');
INSERT INTO `fx_privilege` VALUES ('190', 'index', '发送邮件', '1', '0', '0', '189', '3', '0', '0');
INSERT INTO `fx_privilege` VALUES ('191', 'index', '查看邮件服务器配置参数', '1', '0', '0', '178', '3', '0', '0');
INSERT INTO `fx_privilege` VALUES ('192', 'edit', '编辑邮件服务器配置参数', '1', '0', '0', '178', '3', '0', '0');
INSERT INTO `fx_privilege` VALUES ('195', 'ClearBuffer', '清除缓存', '1', '0', '0', '1', '2', '0', '15');
INSERT INTO `fx_privilege` VALUES ('196', 'cpanelSystem', '后台系统缓存', '1', '0', '0', '195', '3', '0', '0');
INSERT INTO `fx_privilege` VALUES ('197', 'cpanelTemplate', '后台模板缓存', '1', '0', '0', '195', '3', '0', '0');
INSERT INTO `fx_privilege` VALUES ('198', 'frontSystem', '前台系统缓存', '1', '0', '0', '195', '3', '0', '0');
INSERT INTO `fx_privilege` VALUES ('199', 'frontTemplate', '前台模板缓存', '1', '0', '0', '195', '3', '0', '0');
INSERT INTO `fx_privilege` VALUES ('200', 'Country', '地区管理', '1', '0', '0', '1', '2', '0', '15');
INSERT INTO `fx_privilege` VALUES ('201', 'add', '添加国家', '1', '0', '0', '200', '3', '0', '0');
INSERT INTO `fx_privilege` VALUES ('202', 'delete', '删除国家', '1', '0', '0', '200', '3', '0', '0');
INSERT INTO `fx_privilege` VALUES ('203', 'edit', '编辑国家', '1', '0', '0', '200', '3', '0', '0');
INSERT INTO `fx_privilege` VALUES ('204', 'index', '国家列表', '1', '0', '0', '200', '3', '0', '0');
INSERT INTO `fx_privilege` VALUES ('205', 'givePrivilege', '角色授权', '1', '0', '0', '6', '3', '0', '0');
INSERT INTO `fx_privilege` VALUES ('206', 'index', '清除缓存列表', '1', '0', '0', '195', '3', '0', '0');
INSERT INTO `fx_privilege` VALUES ('223', 'printShipping', '打印发货单', '1', '0', '0', '147', '3', '0', '0');
INSERT INTO `fx_privilege` VALUES ('224', 'printExpress', '打印快递单', '0', '0', '0', '147', '3', '0', '0');
INSERT INTO `fx_privilege` VALUES ('254', 'Database', '数据库备份', '1', '0', '0', '1', '2', '0', '15');
INSERT INTO `fx_privilege` VALUES ('255', 'index', '查看备份数据', '1', '0', '0', '254', '3', '0', '0');
INSERT INTO `fx_privilege` VALUES ('256', 'backup', '备份数据库', '1', '0', '0', '254', '3', '0', '0');
INSERT INTO `fx_privilege` VALUES ('257', 'delete', '删除备份数据库', '1', '0', '0', '254', '3', '0', '0');
INSERT INTO `fx_privilege` VALUES ('273', 'editColor', '编辑产品颜色', '1', '0', '0', '123', '3', '0', '0');
INSERT INTO `fx_privilege` VALUES ('274', 'deleteProductPhoto', '删除产品图片', '1', '0', '0', '123', '3', '0', '0');
INSERT INTO `fx_privilege` VALUES ('275', 'deleteColor', '删除产品颜色', '1', '0', '0', '123', '3', '0', '0');
INSERT INTO `fx_privilege` VALUES ('276', 'upload', '上传数据库备份文件', '1', '0', '0', '254', '3', '0', '0');
INSERT INTO `fx_privilege` VALUES ('277', 'download', '下载数据库备份文件', '1', '0', '0', '254', '3', '0', '0');
INSERT INTO `fx_privilege` VALUES ('278', 'restore', '恢复数据库', '1', '0', '0', '254', '3', '0', '0');
INSERT INTO `fx_privilege` VALUES ('279', 'optimize', '优化数据表', '1', '0', '0', '254', '3', '0', '0');
INSERT INTO `fx_privilege` VALUES ('286', 'Setting', '网站基本设置', '1', '0', '0', '1', '2', '0', '15');
INSERT INTO `fx_privilege` VALUES ('287', 'edit', '修改网站设置', '1', '0', '0', '286', '3', '0', '0');
INSERT INTO `fx_privilege` VALUES ('288', 'index', '查看网站设置', '1', '0', '0', '286', '3', '0', '0');
INSERT INTO `fx_privilege` VALUES ('290', 'Exportorder', '导出订单', '1', '0', '0', '1', '2', '0', '8');
INSERT INTO `fx_privilege` VALUES ('291', 'index', '导出订单数据', '1', '0', '0', '290', '3', '0', '0');
INSERT INTO `fx_privilege` VALUES ('292', 'export', '导出产品数据', '1', '0', '0', '123', '3', '0', '0');
INSERT INTO `fx_privilege` VALUES ('293', 'import', '导入产品数据', '1', '0', '0', '123', '3', '0', '0');
INSERT INTO `fx_privilege` VALUES ('314', 'single', '单个产品销量统计', '1', '0', '0', '174', '3', '0', '0');
INSERT INTO `fx_privilege` VALUES ('327', 'editprice', '修改价格', '1', '0', '0', '123', '3', '0', '0');
INSERT INTO `fx_privilege` VALUES ('328', 'updateOrderstatus', '更新订单状态', '1', '0', '0', '147', '3', '0', '0');
INSERT INTO `fx_privilege` VALUES ('409', 'monthReport', '销售指标分析', '0', '0', '0', '1', '2', '0', '18');
INSERT INTO `fx_privilege` VALUES ('410', 'index', '销售指标分析', '1', '0', '0', '409', '3', '0', '0');
INSERT INTO `fx_privilege` VALUES ('411', 'keywords', '搜索关键字', '0', '0', '0', '1', '2', '0', '15');
INSERT INTO `fx_privilege` VALUES ('412', 'index', '关键字列表', '1', '0', '0', '411', '3', '0', '0');
INSERT INTO `fx_privilege` VALUES ('413', 'delete', '删除关键字', '1', '0', '0', '411', '3', '0', '0');
INSERT INTO `fx_privilege` VALUES ('414', 'Stock', '库存管理', '1', '0', '0', '1', '2', '0', '7');
INSERT INTO `fx_privilege` VALUES ('415', 'Tag', '标签管理', '1', '0', '0', '1', '2', '0', '7');
INSERT INTO `fx_privilege` VALUES ('416', 'UserGroup', '分销商级别管理', '1', '0', '0', '1', '2', '0', '6');
INSERT INTO `fx_privilege` VALUES ('417', 'index', '显示分销商级别列表', '1', '0', '0', '416', '3', '0', '0');
INSERT INTO `fx_privilege` VALUES ('418', 'delete', '删除分销商级别', '1', '0', '0', '416', '3', '0', '0');
INSERT INTO `fx_privilege` VALUES ('419', 'edit', '编辑分销商级别', '1', '0', '0', '416', '3', '0', '0');
INSERT INTO `fx_privilege` VALUES ('420', 'add', '增加分销商级别', '1', '0', '0', '416', '3', '0', '0');
INSERT INTO `fx_privilege` VALUES ('421', 'UserSupport', '申请支持管理', '1', '0', '0', '1', '2', '0', '6');
INSERT INTO `fx_privilege` VALUES ('422', 'index', '显示申请支持', '1', '0', '0', '421', '3', '0', '0');
INSERT INTO `fx_privilege` VALUES ('423', 'edit', '编辑申请支持', '1', '0', '0', '421', '3', '0', '0');
INSERT INTO `fx_privilege` VALUES ('424', 'add', '增加申请支持', '1', '0', '0', '421', '3', '0', '0');
INSERT INTO `fx_privilege` VALUES ('425', 'delete', '删除申请支持', '1', '0', '0', '421', '3', '0', '0');
INSERT INTO `fx_privilege` VALUES ('426', 'index', '显示库存', '1', '0', '0', '414', '3', '0', '0');
INSERT INTO `fx_privilege` VALUES ('427', 'edit', '编辑库存', '1', '0', '0', '414', '3', '0', '0');
INSERT INTO `fx_privilege` VALUES ('428', 'delete', '删除库存', '1', '0', '0', '414', '3', '0', '0');
INSERT INTO `fx_privilege` VALUES ('429', 'add', '增加库存', '1', '0', '0', '414', '3', '0', '0');
INSERT INTO `fx_privilege` VALUES ('430', 'index', '显示标签列表', '1', '0', '0', '415', '3', '0', '0');
INSERT INTO `fx_privilege` VALUES ('431', 'add', '增加标签', '1', '0', '0', '415', '3', '0', '0');
INSERT INTO `fx_privilege` VALUES ('432', 'delete', '删除标签', '1', '0', '0', '415', '3', '0', '0');
INSERT INTO `fx_privilege` VALUES ('433', 'edit', '编辑标签', '1', '0', '0', '415', '3', '0', '0');
INSERT INTO `fx_privilege` VALUES ('434', 'Invoice', '发票管理', '1', '0', '0', '1', '2', '0', '11');
INSERT INTO `fx_privilege` VALUES ('435', 'index', '查看发票列表', '1', '0', '0', '434', '3', '0', '0');
INSERT INTO `fx_privilege` VALUES ('436', 'add', '增加发票', '1', '0', '0', '434', '3', '0', '0');
INSERT INTO `fx_privilege` VALUES ('437', 'delete', '删除发票', '1', '0', '0', '434', '3', '0', '0');
INSERT INTO `fx_privilege` VALUES ('438', 'edit', '编辑发票', '1', '0', '0', '434', '3', '0', '0');
INSERT INTO `fx_privilege` VALUES ('479', 'Fare', '运费模板', '1', '0', '0', '1', '2', '0', '8');
INSERT INTO `fx_privilege` VALUES ('480', 'Faremethod', '运费方式', '1', '0', '0', '1', '2', '0', '8');
INSERT INTO `fx_privilege` VALUES ('481', 'index', '显示运费模板', '1', '0', '0', '479', '3', '0', '0');
INSERT INTO `fx_privilege` VALUES ('482', 'edit', '编辑运费模板', '1', '0', '0', '479', '3', '0', '0');
INSERT INTO `fx_privilege` VALUES ('483', 'delete', '删除运费模板', '1', '0', '0', '479', '3', '0', '0');
INSERT INTO `fx_privilege` VALUES ('484', 'add', '增加运费模板', '1', '0', '0', '479', '3', '0', '0');
INSERT INTO `fx_privilege` VALUES ('485', 'index', '显示运费方式', '1', '0', '0', '480', '3', '0', '0');
INSERT INTO `fx_privilege` VALUES ('486', 'edit', '编辑运费方式', '1', '0', '0', '480', '3', '0', '0');
INSERT INTO `fx_privilege` VALUES ('487', 'delete', '删除运费方式', '1', '0', '0', '480', '3', '0', '0');
INSERT INTO `fx_privilege` VALUES ('488', 'add', '增加运费方式', '1', '0', '0', '480', '3', '0', '0');
INSERT INTO `fx_privilege` VALUES ('489', 'Logs', '日志管理', '1', '0', '0', '1', '2', '0', '15');
INSERT INTO `fx_privilege` VALUES ('490', 'index', '日志列表', '1', '0', '0', '489', '3', '0', '0');
INSERT INTO `fx_privilege` VALUES ('491', 'edit', '查看日志', '1', '0', '0', '489', '3', '0', '0');
INSERT INTO `fx_privilege` VALUES ('492', 'delete', '删除日志', '1', '0', '0', '489', '3', '0', '0');
INSERT INTO `fx_privilege` VALUES ('493', 'Attribute', '产品属性管理', '1', '0', '0', '1', '2', '0', '7');
INSERT INTO `fx_privilege` VALUES ('494', 'index', '显示产品属性列表', '1', '0', '0', '493', '3', '0', '0');
INSERT INTO `fx_privilege` VALUES ('495', 'edit', '编辑产品属性', '1', '0', '0', '493', '3', '0', '0');
INSERT INTO `fx_privilege` VALUES ('496', 'delete', '删除产品属性', '1', '0', '0', '493', '3', '0', '0');
INSERT INTO `fx_privilege` VALUES ('497', 'add', '增加产品属性', '1', '0', '0', '493', '3', '0', '0');
INSERT INTO `fx_privilege` VALUES ('498', 'supplement', '补货登记管理', '1', '0', '0', '1', '2', '0', '8');
INSERT INTO `fx_privilege` VALUES ('499', 'index', '显示补货记录', '1', '0', '0', '498', '3', '0', '0');
INSERT INTO `fx_privilege` VALUES ('500', 'edit', '编辑补货记录', '1', '0', '0', '498', '3', '0', '0');
INSERT INTO `fx_privilege` VALUES ('501', 'add', '添加补货记录', '1', '0', '0', '498', '3', '0', '0');
INSERT INTO `fx_privilege` VALUES ('502', 'delete', '删除补货记录', '1', '0', '0', '498', '3', '0', '0');

-- ----------------------------
-- Table structure for fx_privilege_group
-- ----------------------------
DROP TABLE IF EXISTS `fx_privilege_group`;
CREATE TABLE `fx_privilege_group` (
  `id` smallint(3) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(25) NOT NULL,
  `title` varchar(50) NOT NULL,
  `create_time` int(11) unsigned NOT NULL,
  `update_time` int(11) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `sort` smallint(3) unsigned NOT NULL DEFAULT '0',
  `show` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of fx_privilege_group
-- ----------------------------
INSERT INTO `fx_privilege_group` VALUES ('2', 'App', '管理权限', '1222841259', '0', '1', '0', '0');
INSERT INTO `fx_privilege_group` VALUES ('6', 'Users', '分销商管理', '0', '0', '1', '0', '0');
INSERT INTO `fx_privilege_group` VALUES ('7', 'Products', '产品管理', '0', '0', '1', '0', '0');
INSERT INTO `fx_privilege_group` VALUES ('8', 'Orders', '订单管理', '0', '0', '1', '0', '0');
INSERT INTO `fx_privilege_group` VALUES ('9', 'Pages', '页面管理', '0', '0', '0', '0', '0');
INSERT INTO `fx_privilege_group` VALUES ('10', 'Public', '公共模块组', '0', '0', '0', '0', '0');
INSERT INTO `fx_privilege_group` VALUES ('11', 'Invoice', '发票管理', '0', '0', '1', '0', '0');
INSERT INTO `fx_privilege_group` VALUES ('15', 'System', '系统管理', '1288920496', '0', '1', '0', '0');
INSERT INTO `fx_privilege_group` VALUES ('18', 'Report', '报表统计', '1289380959', '0', '1', '0', '0');

-- ----------------------------
-- Table structure for fx_products_attribute
-- ----------------------------
DROP TABLE IF EXISTS `fx_products_attribute`;
CREATE TABLE `fx_products_attribute` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(10) NOT NULL COMMENT '属性名称',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of fx_products_attribute
-- ----------------------------
INSERT INTO `fx_products_attribute` VALUES ('1', '规格');
INSERT INTO `fx_products_attribute` VALUES ('2', '颜色');

-- ----------------------------
-- Table structure for fx_products_category
-- ----------------------------
DROP TABLE IF EXISTS `fx_products_category`;
CREATE TABLE `fx_products_category` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '大货号',
  `pid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '父节点ID',
  `name` varchar(30) NOT NULL COMMENT '分类名称',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '状态',
  `sort` int(11) NOT NULL DEFAULT '0' COMMENT '排序',
  PRIMARY KEY (`id`),
  KEY `status` (`status`),
  KEY `sort` (`sort`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of fx_products_category
-- ----------------------------
INSERT INTO `fx_products_category` VALUES ('1', '0', '瑞士护肤品', '1', '0');
INSERT INTO `fx_products_category` VALUES ('2', '0', '妇科圣品', '1', '0');
INSERT INTO `fx_products_category` VALUES ('3', '0', '皮肤饮料', '1', '0');
INSERT INTO `fx_products_category` VALUES ('4', '0', '海外医疗', '1', '0');
INSERT INTO `fx_products_category` VALUES ('5', '1', '精华素系列', '1', '0');
INSERT INTO `fx_products_category` VALUES ('6', '1', '抗皱复颜系列', '1', '0');
INSERT INTO `fx_products_category` VALUES ('7', '1', '防晒美白系列', '1', '0');
INSERT INTO `fx_products_category` VALUES ('8', '1', '保湿舒缓系列', '1', '0');
INSERT INTO `fx_products_category` VALUES ('9', '1', '洁肤排毒系列', '1', '0');
INSERT INTO `fx_products_category` VALUES ('10', '1', '眼部修护系列', '1', '0');

-- ----------------------------
-- Table structure for fx_products_item
-- ----------------------------
DROP TABLE IF EXISTS `fx_products_item`;
CREATE TABLE `fx_products_item` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `item` varchar(30) NOT NULL COMMENT '大货号',
  `title` varchar(60) NOT NULL COMMENT '商品标题名称',
  `summary` varchar(500) DEFAULT NULL COMMENT '产品描述摘要',
  `category_id` int(10) unsigned NOT NULL,
  `details` text NOT NULL COMMENT '图文详情',
  `create_time` int(10) unsigned DEFAULT NULL COMMENT '创建时间',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '状态',
  PRIMARY KEY (`id`),
  UNIQUE KEY `item` (`item`),
  KEY `status` (`status`),
  KEY `products_category` (`category_id`),
  KEY `title` (`title`),
  CONSTRAINT `products_category` FOREIGN KEY (`category_id`) REFERENCES `fx_products_category` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of fx_products_item
-- ----------------------------
INSERT INTO `fx_products_item` VALUES ('1', 'P1001', '女性生殖健康膳食补充品', '细胞激活素──让肌肤更加晶莹剔透，勾勒立体轮廓。', '2', '<img src=\"/images/hufu.jpg\" />', '1447862400', '1');
INSERT INTO `fx_products_item` VALUES ('3', 'P1002', '帕斯婷有机黑土糠芽活糙米', '细胞激活素──让肌肤更加晶莹剔透，勾勒立体轮廓。', '3', '<img src=\"/images/hufu.jpg\" />', '1448380800', '1');
INSERT INTO `fx_products_item` VALUES ('4', 'P1003', '帕斯婷细胞再生素', '细胞激活素──让肌肤更加晶莹剔透，勾勒立体轮廓。', '5', '<img src=\"/images/hufu.jpg\" />', '1448553600', '1');
INSERT INTO `fx_products_item` VALUES ('5', 'P1004', '帕斯婷细胞激活素', '细胞激活素──让肌肤更加晶莹剔透，勾勒立体轮廓。', '5', '<img src=\"/images/hufu.jpg\" />', '1448597225', '1');

-- ----------------------------
-- Table structure for fx_products_item_tag
-- ----------------------------
DROP TABLE IF EXISTS `fx_products_item_tag`;
CREATE TABLE `fx_products_item_tag` (
  `item` varchar(30) NOT NULL COMMENT '产品表中的SKU',
  `tag_id` int(10) unsigned NOT NULL COMMENT '图片路径',
  KEY `product_item_tag_tag_id` (`tag_id`),
  KEY `product_item_tag_item` (`item`) USING BTREE,
  CONSTRAINT `product_item_tag_item` FOREIGN KEY (`item`) REFERENCES `fx_products_item` (`item`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `product_item_tag_tag_id` FOREIGN KEY (`tag_id`) REFERENCES `fx_products_tag` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of fx_products_item_tag
-- ----------------------------
INSERT INTO `fx_products_item_tag` VALUES ('P1002', '2');
INSERT INTO `fx_products_item_tag` VALUES ('P1003', '1');
INSERT INTO `fx_products_item_tag` VALUES ('P1001', '1');
INSERT INTO `fx_products_item_tag` VALUES ('P1001', '3');

-- ----------------------------
-- Table structure for fx_products_pic
-- ----------------------------
DROP TABLE IF EXISTS `fx_products_pic`;
CREATE TABLE `fx_products_pic` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `sku` varchar(30) NOT NULL COMMENT '产品表中的SKU',
  `path` varchar(100) NOT NULL COMMENT '图片路径',
  `sort` tinyint(3) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `products_pic_sku` (`sku`),
  KEY `sort` (`sort`),
  CONSTRAINT `products_pic_sku` FOREIGN KEY (`sku`) REFERENCES `fx_products_sku` (`sku`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of fx_products_pic
-- ----------------------------
INSERT INTO `fx_products_pic` VALUES ('1', 'S00001', '1.jpg', '1');
INSERT INTO `fx_products_pic` VALUES ('2', 'S00002', '1.jpg', '0');
INSERT INTO `fx_products_pic` VALUES ('3', 'S00003', '1.jpg', '0');
INSERT INTO `fx_products_pic` VALUES ('4', 'S00004', '1.jpg', '0');
INSERT INTO `fx_products_pic` VALUES ('5', 'S00005', '1.jpg', '0');
INSERT INTO `fx_products_pic` VALUES ('25', 'S00006', '1.jpg', '0');
INSERT INTO `fx_products_pic` VALUES ('26', 'S00001', '1.jpg', '1');
INSERT INTO `fx_products_pic` VALUES ('29', 'S00007', '1.jpg', '0');
INSERT INTO `fx_products_pic` VALUES ('30', 'S00008', '1.jpg', '0');

-- ----------------------------
-- Table structure for fx_products_sku
-- ----------------------------
DROP TABLE IF EXISTS `fx_products_sku`;
CREATE TABLE `fx_products_sku` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `sku` varchar(30) NOT NULL COMMENT '单品货号',
  `item` varchar(30) NOT NULL COMMENT '大货品号',
  `attribute_id` smallint(5) unsigned DEFAULT NULL,
  `sku_name` varchar(20) NOT NULL COMMENT 'SKU名称',
  `old_price` float(10,2) DEFAULT '0.00' COMMENT '原始价',
  `current_price` float(10,2) NOT NULL DEFAULT '0.00' COMMENT '当前价',
  `view_num` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '前台用户流量次数',
  `create_time` int(10) unsigned DEFAULT NULL COMMENT '创建时间',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '状态',
  `is_shipping` tinyint(2) DEFAULT '0' COMMENT '是否需要运费(1为需要运费，0为免费)',
  `shipping_mode_id` tinyint(5) DEFAULT '0' COMMENT '运费模板id',
  PRIMARY KEY (`id`),
  UNIQUE KEY `sku` (`sku`),
  KEY `prodcts_item` (`item`),
  KEY `curent_price` (`current_price`) USING BTREE,
  KEY `view_num` (`view_num`),
  KEY `status` (`status`),
  KEY `products_attribute_id` (`attribute_id`),
  CONSTRAINT `prodcts_item` FOREIGN KEY (`item`) REFERENCES `fx_products_item` (`item`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `products_attribute_id` FOREIGN KEY (`attribute_id`) REFERENCES `fx_products_attribute` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of fx_products_sku
-- ----------------------------
INSERT INTO `fx_products_sku` VALUES ('1', 'S00001', 'P1001', '1', '12支装', '40.00', '40.00', '10', '1447862400', '1', '0', '0');
INSERT INTO `fx_products_sku` VALUES ('2', 'S00002', 'P1001', '1', '6支装', '30.00', '20.00', '40', '1447862400', '1', '1', '2');
INSERT INTO `fx_products_sku` VALUES ('3', 'S00003', 'P1004', '2', '红色', '55.00', '40.00', '45', '1447919159', '1', '0', '0');
INSERT INTO `fx_products_sku` VALUES ('4', 'S00004', 'P1004', '2', '蓝色', '56.00', '40.00', '67', '1447919162', '1', '0', '0');
INSERT INTO `fx_products_sku` VALUES ('6', 'S00005', 'P1004', '1', '12支', '51.00', '40.00', '532', '1448380800', '1', '1', '2');
INSERT INTO `fx_products_sku` VALUES ('7', 'S00006', 'P1002', '2', '红色', '52.00', '40.00', '8', '1448419623', '1', '0', '0');
INSERT INTO `fx_products_sku` VALUES ('8', 'S00007', 'P1003', '1', '12支', '53.00', '40.00', '7', '1448380800', '1', '0', '0');
INSERT INTO `fx_products_sku` VALUES ('9', 'S00008', 'P1003', '1', '12支', '54.00', '40.00', '71', '1448439917', '1', '0', '0');

-- ----------------------------
-- Table structure for fx_products_stock
-- ----------------------------
DROP TABLE IF EXISTS `fx_products_stock`;
CREATE TABLE `fx_products_stock` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `product_sku` varchar(30) NOT NULL COMMENT '商品的SKU',
  `stock` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '商品库存',
  `date` int(10) unsigned NOT NULL COMMENT '商品生产日期',
  `exp_date` int(10) unsigned NOT NULL COMMENT '产品过期时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `product_sku` (`product_sku`,`exp_date`) USING BTREE,
  KEY `exp_date` (`exp_date`),
  KEY `orders_products_product_sku` (`product_sku`) USING BTREE,
  CONSTRAINT `fx_products_stock_stock` FOREIGN KEY (`product_sku`) REFERENCES `fx_products_sku` (`sku`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of fx_products_stock
-- ----------------------------
INSERT INTO `fx_products_stock` VALUES ('1', 'S00001', '438', '1446998400', '1458355200');
INSERT INTO `fx_products_stock` VALUES ('2', 'S00001', '0', '1446998400', '1458241600');
INSERT INTO `fx_products_stock` VALUES ('3', 'S00001', '199', '1447919159', '1552333331');
INSERT INTO `fx_products_stock` VALUES ('4', 'S00002', '160', '1446998400', '1448553600');
INSERT INTO `fx_products_stock` VALUES ('5', 'S00004', '79', '1446998400', '1552569027');
INSERT INTO `fx_products_stock` VALUES ('6', 'S00004', '201', '1447084800', '1452581626');
INSERT INTO `fx_products_stock` VALUES ('7', 'S00005', '198', '1447919159', '1542333331');
INSERT INTO `fx_products_stock` VALUES ('8', 'S00006', '8', '1446998400', '1552569027');
INSERT INTO `fx_products_stock` VALUES ('9', 'S00001', '204', '1446998400', '1548553602');
INSERT INTO `fx_products_stock` VALUES ('10', 'S00007', '111', '1452441600', '1452528000');
INSERT INTO `fx_products_stock` VALUES ('11', 'S00006', '10', '1446998400', '1558553611');

-- ----------------------------
-- Table structure for fx_products_stock_lock
-- ----------------------------
DROP TABLE IF EXISTS `fx_products_stock_lock`;
CREATE TABLE `fx_products_stock_lock` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `order_code` varchar(30) NOT NULL COMMENT '订单号',
  `product_sku` varchar(30) NOT NULL COMMENT '商品的SKU',
  `product_num` int(10) unsigned DEFAULT NULL,
  `exp_date` int(10) unsigned DEFAULT NULL,
  `create_time` int(10) unsigned DEFAULT NULL,
  `status` tinyint(3) unsigned DEFAULT '0' COMMENT '状态，0未到期，1已付款，2到期未付款',
  PRIMARY KEY (`id`),
  KEY `exp_date` (`exp_date`) USING BTREE,
  KEY `create_time` (`create_time`),
  KEY `product_stock_lock_order_code` (`order_code`) USING BTREE,
  KEY `status` (`status`) USING BTREE,
  KEY `product_stock_lock_product_sku` (`product_sku`),
  CONSTRAINT `product_stock_lock_product_sku` FOREIGN KEY (`product_sku`) REFERENCES `fx_products_sku` (`sku`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `product_stock_lock_order_code` FOREIGN KEY (`order_code`) REFERENCES `fx_orders` (`order_code`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of fx_products_stock_lock
-- ----------------------------
INSERT INTO `fx_products_stock_lock` VALUES ('1', 'AD20151210141252385255', 'S00001', '362', '1458241600', '1452508859', '1');
INSERT INTO `fx_products_stock_lock` VALUES ('2', 'AD20151210141252385255', 'S00001', '982', '1458355200', '1452508859', '1');
INSERT INTO `fx_products_stock_lock` VALUES ('3', 'AD20151210141252385255', 'S00001', '156', '1548553602', '1452508859', '1');
INSERT INTO `fx_products_stock_lock` VALUES ('8', 'FXPC16011210155639SK', 'S00004', '1', '1548553602', '1452564956', '0');
INSERT INTO `fx_products_stock_lock` VALUES ('9', 'FXPC16011210190077SK', 'S00006', '2', '1548553600', '1452565140', '0');
INSERT INTO `fx_products_stock_lock` VALUES ('10', 'FXPC16011210193420SK', 'S00004', '1', '1548553602', '1452565174', '0');
INSERT INTO `fx_products_stock_lock` VALUES ('11', 'FXPC16011211160040SK', 'S00004', '1', '1548553602', '1452568560', '2');
INSERT INTO `fx_products_stock_lock` VALUES ('12', 'FXPC16011211202880SK', 'S00004', '1', '1548553602', '1452568828', '0');
INSERT INTO `fx_products_stock_lock` VALUES ('13', 'FXPC16011211222562SK', 'S00004', '1', '1548553602', '1452568945', '0');
INSERT INTO `fx_products_stock_lock` VALUES ('14', 'FXPC16011215100770SK', 'S00004', '1', '1452581626', '1452581626', '2');
INSERT INTO `fx_products_stock_lock` VALUES ('17', 'FXPC16011213195486SK', 'S00005', '4', '1542333331', '1452575994', '2');
INSERT INTO `fx_products_stock_lock` VALUES ('33', 'FXPC16011214534633SK', 'S00001', '0', '1458241600', '1452581626', '2');
INSERT INTO `fx_products_stock_lock` VALUES ('34', 'FXPC16011214534633SK', 'S00001', '2', '1458355200', '1452581626', '2');
INSERT INTO `fx_products_stock_lock` VALUES ('35', 'FXPC16011214534633SK', 'S00004', '4', '1568553602', '1452581626', '0');
INSERT INTO `fx_products_stock_lock` VALUES ('36', 'FXPC16011214534633SK', 'S00005', '1', '1542333331', '1452581626', '2');
INSERT INTO `fx_products_stock_lock` VALUES ('37', 'FXPC16011215100770SK', 'S00004', '4', '1452569027', '1452569027', '2');
INSERT INTO `fx_products_stock_lock` VALUES ('38', 'FXPC16011215133216SK', 'S00006', '2', '1548553600', '1452582812', '0');
INSERT INTO `fx_products_stock_lock` VALUES ('39', 'FXPC16011215133216SK', 'S00001', '0', '1458241600', '1452582812', '0');
INSERT INTO `fx_products_stock_lock` VALUES ('40', 'FXPC16011215133216SK', 'S00001', '2', '1458355200', '1452582812', '0');
INSERT INTO `fx_products_stock_lock` VALUES ('41', 'FXPC16011215133216SK', 'S00004', '1', '1568553602', '1452582812', '0');
INSERT INTO `fx_products_stock_lock` VALUES ('42', 'FXPC16011215133216SK', 'S00005', '1', '1542333331', '1452582812', '0');
INSERT INTO `fx_products_stock_lock` VALUES ('43', 'FXPC16011309462073SK', 'S00005', '1', '1542333331', '1452649580', '0');
INSERT INTO `fx_products_stock_lock` VALUES ('44', 'FXPC16011415181611SK', 'S00005', '1', '1542333331', '1452755896', '2');
INSERT INTO `fx_products_stock_lock` VALUES ('45', 'FXPC16011814244298SK', 'S00005', '1', '1542333331', '1453098282', '0');
INSERT INTO `fx_products_stock_lock` VALUES ('46', 'FXMO16011818014687SK', 'S00005', '187', '1542333331', '1453111306', '0');
INSERT INTO `fx_products_stock_lock` VALUES ('47', 'FXMO16011818042387SK', 'S00005', '1', '1542333331', '1453111463', '0');
INSERT INTO `fx_products_stock_lock` VALUES ('48', 'FXMO16011818044858SK', 'S00005', '1', '1542333331', '1453111488', '0');

-- ----------------------------
-- Table structure for fx_products_tag
-- ----------------------------
DROP TABLE IF EXISTS `fx_products_tag`;
CREATE TABLE `fx_products_tag` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '大货号',
  `name` varchar(30) NOT NULL COMMENT '标签名称',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '状态',
  PRIMARY KEY (`id`),
  KEY `status` (`status`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of fx_products_tag
-- ----------------------------
INSERT INTO `fx_products_tag` VALUES ('1', '美容', '1');
INSERT INTO `fx_products_tag` VALUES ('2', 'test', '1');
INSERT INTO `fx_products_tag` VALUES ('3', 'testss', '1');

-- ----------------------------
-- Table structure for fx_receiver_address
-- ----------------------------
DROP TABLE IF EXISTS `fx_receiver_address`;
CREATE TABLE `fx_receiver_address` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL COMMENT '所属用户ID',
  `module_id` int(10) unsigned NOT NULL COMMENT '所属模块ID',
  `receiver_name` varchar(10) NOT NULL COMMENT '收货人姓名',
  `receiver_phone` varchar(12) NOT NULL COMMENT '收货人电话',
  `receiver_province` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '收货省份',
  `receiver_city` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '收货城市',
  `receiver_county` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '收货区/县',
  `receiver_address` varchar(200) NOT NULL COMMENT '收货人具体地址',
  `receiver_postcode` char(6) DEFAULT NULL COMMENT '收货人邮政编码',
  `create_time` int(10) unsigned DEFAULT NULL,
  `sort` smallint(5) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `receiver_city` (`receiver_city`),
  KEY `receiver_county` (`receiver_county`),
  KEY `receiver_province` (`receiver_province`),
  KEY `receiver_name-receiver_phone` (`receiver_name`,`receiver_phone`),
  KEY `receiver_address_user_id` (`user_id`),
  KEY `receiver_module_id` (`module_id`),
  KEY `sort` (`sort`),
  CONSTRAINT `receiver_address_user_id` FOREIGN KEY (`user_id`) REFERENCES `fx_users` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `receiver_city` FOREIGN KEY (`receiver_city`) REFERENCES `fx_countys` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `receiver_county` FOREIGN KEY (`receiver_county`) REFERENCES `fx_countys` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `receiver_module_id` FOREIGN KEY (`module_id`) REFERENCES `fx_modules` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `receiver_province` FOREIGN KEY (`receiver_province`) REFERENCES `fx_countys` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=150 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of fx_receiver_address
-- ----------------------------
INSERT INTO `fx_receiver_address` VALUES ('3', '25', '2', '颜平平', '15616689842', '32', '394', '3336', 'ABC', '515102', '1449199479', '9999');
INSERT INTO `fx_receiver_address` VALUES ('7', '1', '1', '张小生', '13632252276', '17', '236', '2000', '阳明路', '332266', '1449726987', '0');
INSERT INTO `fx_receiver_address` VALUES ('8', '1', '3', '张小生', '13632252276', '17', '236', '2000', '阳明路', '332266', '1449727069', '0');
INSERT INTO `fx_receiver_address` VALUES ('9', '1', '3', '张小生', '13632252276', '17', '236', '2000', '阳明路', '332266', '1449727225', '0');
INSERT INTO `fx_receiver_address` VALUES ('10', '1', '3', '张小生', '13632252276', '17', '236', '2000', '阳明路', '332266', '1449727245', '0');
INSERT INTO `fx_receiver_address` VALUES ('11', '1', '3', '张小生', '13632252276', '17', '236', '2000', '阳明路', '332266', '1449727366', '0');
INSERT INTO `fx_receiver_address` VALUES ('12', '1', '3', '张小生', '13632252276', '17', '236', '2000', '阳明路', '332266', '1449727449', '0');
INSERT INTO `fx_receiver_address` VALUES ('13', '1', '3', '张小生', '13632252276', '17', '236', '2000', '阳明路', '332266', '1449727504', '0');
INSERT INTO `fx_receiver_address` VALUES ('14', '1', '3', '张小生', '13632252276', '17', '236', '2000', '阳明路', '332266', '1449727672', '0');
INSERT INTO `fx_receiver_address` VALUES ('16', '1', '3', '张小生', '13632252276', '17', '236', '2000', '阳明路', '332266', '1449738695', '0');
INSERT INTO `fx_receiver_address` VALUES ('17', '1', '3', '张小生', '13632252276', '17', '236', '2000', '阳明路', '332266', '1449738779', '0');
INSERT INTO `fx_receiver_address` VALUES ('18', '1', '3', '张小生', '13632252276', '17', '236', '2000', '阳明路', '332266', '1449738946', '0');
INSERT INTO `fx_receiver_address` VALUES ('19', '1', '3', '张小生', '13632252276', '17', '236', '2000', '阳明路', '332266', '1449739063', '0');
INSERT INTO `fx_receiver_address` VALUES ('20', '1', '3', '张小生', '13632252276', '17', '236', '2000', '阳明路', '332266', '1449803179', '0');
INSERT INTO `fx_receiver_address` VALUES ('21', '1', '3', '张小生', '13632252276', '17', '236', '2000', '阳明路', '332266', '1449807839', '0');
INSERT INTO `fx_receiver_address` VALUES ('22', '1', '1', 'fasdf', '13632252275', '6', '76', '695', 'aad', 'sdfsdf', '1450169149', '0');
INSERT INTO `fx_receiver_address` VALUES ('23', '25', '1', 'fasdf', '13632252275', '6', '76', '695', 'aad', 'sdfsdf', '1450169526', '0');
INSERT INTO `fx_receiver_address` VALUES ('25', '21', '2', 'yan', '13535353535', '32', '394', '3336', 'ABC', '332266', '1450432923', '0');
INSERT INTO `fx_receiver_address` VALUES ('26', '25', '2', 'fasdf', '13632252276', '3', '37', '410', 'aad', '332266', '1450859909', '0');
INSERT INTO `fx_receiver_address` VALUES ('27', '25', '3', 'fasdf', '13632252276', '3', '37', '410', 'aad', '332266', '1450860158', '0');
INSERT INTO `fx_receiver_address` VALUES ('28', '25', '3', 'fasdf', '13632252276', '3', '37', '410', 'aad', '332266', '1450860226', '0');
INSERT INTO `fx_receiver_address` VALUES ('29', '25', '3', 'fasdf', '13632252276', '3', '37', '410', 'aad', '332266', '1450860298', '0');
INSERT INTO `fx_receiver_address` VALUES ('30', '25', '3', 'fasdf', '13632252276', '3', '37', '410', 'aad', '332266', '1450860369', '0');
INSERT INTO `fx_receiver_address` VALUES ('31', '25', '3', 'fasdf', '13632252276', '3', '37', '410', 'aad', '332266', '1450860470', '0');
INSERT INTO `fx_receiver_address` VALUES ('32', '25', '3', 'fasdf', '13632252276', '3', '37', '410', 'aad', '332266', '1450860637', '0');
INSERT INTO `fx_receiver_address` VALUES ('33', '25', '3', 'fasdf', '13632252276', '3', '37', '410', 'aad', '332266', '1450860709', '0');
INSERT INTO `fx_receiver_address` VALUES ('34', '25', '3', 'fasdf', '13632252276', '3', '37', '410', 'aad', '332266', '1450928989', '0');
INSERT INTO `fx_receiver_address` VALUES ('37', '1', '2', '张小生', '13632252275', '6', '76', '693', '珠江新城华强路3号富力盈力大厦1801室', '510230', '1451025747', '0');
INSERT INTO `fx_receiver_address` VALUES ('52', '1', '2', '张小生', '13632252275', '6', '76', '699', '石化路文冲地铁站', '', '1451034916', '0');
INSERT INTO `fx_receiver_address` VALUES ('53', '1', '2', '张小生', '13632252275', '6', '76', '693', '珠江新城华强路3号富力盈力大厦2904室', '510230', '1451035585', '0');
INSERT INTO `fx_receiver_address` VALUES ('55', '25', '3', '颜平平', '15616689842', '2', '52', '500', 'ABC', '515102', '1451035827', '0');
INSERT INTO `fx_receiver_address` VALUES ('56', '25', '3', '颜平平', '15616689842', '2', '52', '500', 'ABC', '515102', '1451036231', '0');
INSERT INTO `fx_receiver_address` VALUES ('57', '25', '2', 'hhhhhh', '13632252275', '6', '76', '695', 'aad', 'sdfsdf', '1449208631', '0');
INSERT INTO `fx_receiver_address` VALUES ('58', '25', '3', 'hhhhhh', '13632252275', '6', '76', '695', 'aad', 'sdfsdf', '1449208631', '0');
INSERT INTO `fx_receiver_address` VALUES ('59', '25', '3', 'hhhhhh', '13632252275', '6', '76', '695', 'aad', 'sdfsdf', '1449208631', '0');
INSERT INTO `fx_receiver_address` VALUES ('60', '25', '3', 'hhhhhh', '13632252275', '6', '76', '695', 'aad', 'sdfsdf', '1449208631', '0');
INSERT INTO `fx_receiver_address` VALUES ('83', '1', '3', '张小生', '13632252275', '6', '76', '693', '珠江新城华强路3号富力盈力大厦2904室', '510230', '1451035585', '0');
INSERT INTO `fx_receiver_address` VALUES ('84', '25', '3', '颜平平', '15616689842', '32', '394', '3336', 'ABC', '515102', '1451289109', '0');
INSERT INTO `fx_receiver_address` VALUES ('85', '1', '3', '张小生', '13632252275', '6', '76', '693', '珠江新城华强路3号富力盈力大厦2904室', '510230', '1451035585', '0');
INSERT INTO `fx_receiver_address` VALUES ('86', '1', '3', '张小生', '13632252275', '6', '76', '693', '珠江新城华强路3号富力盈力大厦2904室', '510230', '1451035585', '0');
INSERT INTO `fx_receiver_address` VALUES ('87', '1', '3', '张小生', '13632252275', '6', '76', '693', '珠江新城华强路3号富力盈力大厦2904室', '510230', '1451035585', '0');
INSERT INTO `fx_receiver_address` VALUES ('88', '1', '3', '张小生', '13632252276', '6', '76', '693', '珠江新城华强路3号富力盈力大厦2904室', '510230', '1451035585', '0');
INSERT INTO `fx_receiver_address` VALUES ('89', '1', '3', '张小生', '13632252276', '6', '76', '693', '珠江新城华强路3号富力盈力大厦2904室', '510230', '1451035585', '0');
INSERT INTO `fx_receiver_address` VALUES ('90', '1', '3', '张小生', '13632252276', '17', '236', '2000', '阳明路', '332266', '1452048589', '0');
INSERT INTO `fx_receiver_address` VALUES ('91', '25', '3', '颜平平', '15616689842', '32', '394', '3336', 'ABC', '515102', '1452048864', '0');
INSERT INTO `fx_receiver_address` VALUES ('92', '1', '3', '张小生', '13632252275', '6', '76', '693', '珠江新城华强路3号富力盈力大厦2904室', '510230', '1451035585', '0');
INSERT INTO `fx_receiver_address` VALUES ('93', '1', '3', '张小生', '13632252275', '6', '76', '693', '珠江新城华强路3号富力盈力大厦2904室', '510230', '1451035585', '0');
INSERT INTO `fx_receiver_address` VALUES ('94', '1', '3', '张小生', '13632252275', '6', '76', '693', '珠江新城华强路3号富力盈力大厦2904室', '510230', '1451035585', '0');
INSERT INTO `fx_receiver_address` VALUES ('95', '1', '3', '张小生', '13632252275', '6', '76', '693', '珠江新城华强路3号富力盈力大厦2904室', '510230', '1451035585', '0');
INSERT INTO `fx_receiver_address` VALUES ('96', '1', '3', '张小生', '13632252275', '6', '76', '693', '珠江新城华强路3号富力盈力大厦2904室', '510230', '1451035585', '0');
INSERT INTO `fx_receiver_address` VALUES ('97', '1', '3', '张小生', '13632252275', '6', '76', '693', '珠江新城华强路3号富力盈力大厦2904室', '510230', '1451035585', '0');
INSERT INTO `fx_receiver_address` VALUES ('98', '25', '3', 'hhhhhh', '13632252275', '6', '76', '695', 'aad', 'sdfsdf', '1449208631', '0');
INSERT INTO `fx_receiver_address` VALUES ('99', '25', '3', '颜平平', '15616689842', '32', '394', '3336', 'ABC', '515102', '1449199479', '0');
INSERT INTO `fx_receiver_address` VALUES ('100', '25', '3', 'hhhhhh', '13632252275', '6', '76', '695', 'aad', 'sdfsdf', '1449208631', '0');
INSERT INTO `fx_receiver_address` VALUES ('101', '25', '3', 'hhhhhh', '13632252275', '6', '76', '695', 'aad', 'sdfsdf', '1449208631', '0');
INSERT INTO `fx_receiver_address` VALUES ('102', '25', '3', 'hhhhhh', '13632252275', '6', '76', '695', 'aad', 'sdfsdf', '1449208631', '0');
INSERT INTO `fx_receiver_address` VALUES ('103', '25', '3', 'hhhhhh', '13632252275', '6', '76', '695', 'aad', 'sdfsdf', '1449208631', '0');
INSERT INTO `fx_receiver_address` VALUES ('104', '25', '3', 'hhhhhh', '13632252275', '6', '76', '695', 'aad', 'sdfsdf', '1449208631', '0');
INSERT INTO `fx_receiver_address` VALUES ('105', '25', '3', 'hhhhhh', '13632252275', '6', '76', '695', 'aad', 'sdfsdf', '1449208631', '0');
INSERT INTO `fx_receiver_address` VALUES ('106', '25', '3', 'hhhhhh', '13632252275', '6', '76', '695', 'aad', 'sdfsdf', '1449208631', '0');
INSERT INTO `fx_receiver_address` VALUES ('107', '1', '3', '张小生', '13632252275', '6', '76', '693', '珠江新城华强路3号富力盈力大厦2904室', '510230', '1451035585', '0');
INSERT INTO `fx_receiver_address` VALUES ('108', '25', '3', 'hhhhhh', '13632252275', '6', '76', '695', 'aad', 'sdfsdf', '1449208631', '0');
INSERT INTO `fx_receiver_address` VALUES ('109', '25', '3', 'hhhhhh', '13632252275', '6', '76', '695', 'aad', 'sdfsdf', '1449208631', '0');
INSERT INTO `fx_receiver_address` VALUES ('110', '25', '3', 'hhhhhh', '13632252275', '6', '76', '695', 'aad', 'sdfsdf', '1449208631', '0');
INSERT INTO `fx_receiver_address` VALUES ('111', '25', '3', 'hhhhhh', '13632252275', '6', '76', '695', 'aad', 'sdfsdf', '1449208631', '0');
INSERT INTO `fx_receiver_address` VALUES ('112', '1', '3', '张小生', '13632252275', '6', '76', '693', '珠江新城华强路3号富力盈力大厦2904室', '510230', '1451035585', '0');
INSERT INTO `fx_receiver_address` VALUES ('128', '1', '3', '张小生', '13632252275', '6', '76', '693', '珠江新城华强路3号富力盈力大厦2904室', '510230', '1451035585', '0');
INSERT INTO `fx_receiver_address` VALUES ('132', '1', '3', '张小生', '13632252275', '6', '76', '693', '珠江新城华强路3号富力盈力大厦2904室', '510230', '1451035585', '0');
INSERT INTO `fx_receiver_address` VALUES ('134', '1', '3', '张小生', '13632252275', '6', '76', '693', '珠江新城华强路3号富力盈力大厦2904室', '510230', '1451035585', '0');
INSERT INTO `fx_receiver_address` VALUES ('135', '1', '3', '张小生', '13632252275', '6', '76', '693', '珠江新城华强路3号富力盈力大厦2904室', '510230', '1451035585', '0');
INSERT INTO `fx_receiver_address` VALUES ('136', '1', '3', '张小生', '13632252275', '6', '76', '693', '珠江新城华强路3号富力盈力大厦2904室', '510230', '1451035585', '0');
INSERT INTO `fx_receiver_address` VALUES ('137', '1', '3', '张小生', '13632252275', '6', '76', '693', '珠江新城华强路3号富力盈力大厦2904室', '510230', '1451035585', '0');
INSERT INTO `fx_receiver_address` VALUES ('138', '26', '2', 'dfffffffff', '13632252277', '25', '321', '2717', '珠江新城华强路3号富力盈力大厦2904室', '510230', '1453083301', '0');
INSERT INTO `fx_receiver_address` VALUES ('139', '27', '2', 'asdfsf', '13632252278', '3', '36', '403', '珠江新城华强路3号富力盈力大厦2904室', '510230', '1453084063', '0');
INSERT INTO `fx_receiver_address` VALUES ('140', '28', '2', 'asdfs', '13632252279', '3', '36', '403', '珠江新城华强路3号富力盈力大厦2904室', '510230', '1453084133', '0');
INSERT INTO `fx_receiver_address` VALUES ('141', '25', '3', 'hhhhhh', '13632252275', '6', '76', '695', 'aad', 'sdfsdf', '1449208631', '0');
INSERT INTO `fx_receiver_address` VALUES ('142', '1', '2', '张小生', '13632252275', '8', '111', '966', '石化路文冲地铁站', '510230', '1453109888', '0');
INSERT INTO `fx_receiver_address` VALUES ('143', '1', '2', 'asdfsadf', 'asdfasd', '25', '321', '2717', 'adsf', 'adfsf', '1453110005', '0');
INSERT INTO `fx_receiver_address` VALUES ('144', '1', '2', '张小生', '13632252275', '9', '137', '1067', 'adasf', 'asdf', '1453110063', '9999');
INSERT INTO `fx_receiver_address` VALUES ('145', '1', '3', '张小生', '13632252275', '9', '137', '1067', 'adasf', 'asdf', '1453110063', '9999');
INSERT INTO `fx_receiver_address` VALUES ('146', '1', '3', '张小生', '13632252275', '9', '137', '1067', 'adasf', 'asdf', '1453110063', '9999');
INSERT INTO `fx_receiver_address` VALUES ('147', '1', '3', '张小生', '13632252275', '9', '137', '1067', 'adasf', 'asdf', '1453110063', '9999');

-- ----------------------------
-- Table structure for fx_role
-- ----------------------------
DROP TABLE IF EXISTS `fx_role`;
CREATE TABLE `fx_role` (
  `id` smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `pid` smallint(6) DEFAULT '0',
  `status` tinyint(1) unsigned DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `ename` varchar(5) DEFAULT '0',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `parentId` (`pid`),
  KEY `ename` (`ename`),
  KEY `status` (`status`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of fx_role
-- ----------------------------
INSERT INTO `fx_role` VALUES ('1', '超级管理员', '0', '1', '备注一下', '', '1208784792', '1254325558');
INSERT INTO `fx_role` VALUES ('2', '高级管理员', '0', '1', '', '', '1215496283', '1311753389');

-- ----------------------------
-- Table structure for fx_role_admin
-- ----------------------------
DROP TABLE IF EXISTS `fx_role_admin`;
CREATE TABLE `fx_role_admin` (
  `role_id` mediumint(9) unsigned DEFAULT NULL,
  `admin_id` char(32) DEFAULT NULL,
  KEY `group_id` (`role_id`),
  KEY `admin_id` (`admin_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of fx_role_admin
-- ----------------------------
INSERT INTO `fx_role_admin` VALUES ('1', '1');
INSERT INTO `fx_role_admin` VALUES ('2', '2');

-- ----------------------------
-- Table structure for fx_role_privilege
-- ----------------------------
DROP TABLE IF EXISTS `fx_role_privilege`;
CREATE TABLE `fx_role_privilege` (
  `role_id` smallint(6) unsigned NOT NULL,
  `privilege_id` smallint(6) unsigned NOT NULL,
  `level` tinyint(1) NOT NULL,
  `pid` smallint(6) NOT NULL,
  `module` varchar(50) DEFAULT NULL,
  KEY `groupId` (`role_id`),
  KEY `nodeId` (`privilege_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of fx_role_privilege
-- ----------------------------
INSERT INTO `fx_role_privilege` VALUES ('1', '50', '3', '40', '');
INSERT INTO `fx_role_privilege` VALUES ('1', '1', '1', '0', '');
INSERT INTO `fx_role_privilege` VALUES ('1', '39', '3', '30', '');
INSERT INTO `fx_role_privilege` VALUES ('1', '69', '2', '1', '');
INSERT INTO `fx_role_privilege` VALUES ('1', '30', '2', '1', '');
INSERT INTO `fx_role_privilege` VALUES ('1', '40', '2', '1', '');
INSERT INTO `fx_role_privilege` VALUES ('1', '49', '3', '30', '');
INSERT INTO `fx_role_privilege` VALUES ('1', '37', '3', '30', '');
INSERT INTO `fx_role_privilege` VALUES ('1', '36', '3', '30', '');
INSERT INTO `fx_role_privilege` VALUES ('1', '35', '3', '30', '');
INSERT INTO `fx_role_privilege` VALUES ('1', '34', '3', '30', '');
INSERT INTO `fx_role_privilege` VALUES ('1', '33', '3', '30', '');
INSERT INTO `fx_role_privilege` VALUES ('1', '32', '3', '30', '');
INSERT INTO `fx_role_privilege` VALUES ('1', '31', '3', '30', '');
INSERT INTO `fx_role_privilege` VALUES ('2', '82', '3', '40', null);
INSERT INTO `fx_role_privilege` VALUES ('2', '83', '3', '40', null);
INSERT INTO `fx_role_privilege` VALUES ('2', '40', '2', '1', null);
INSERT INTO `fx_role_privilege` VALUES ('2', '1', '1', '0', null);
INSERT INTO `fx_role_privilege` VALUES ('2', '109', '3', '4', null);
INSERT INTO `fx_role_privilege` VALUES ('2', '108', '3', '4', null);
INSERT INTO `fx_role_privilege` VALUES ('2', '107', '3', '4', null);
INSERT INTO `fx_role_privilege` VALUES ('2', '106', '3', '4', null);
INSERT INTO `fx_role_privilege` VALUES ('2', '4', '2', '1', null);
INSERT INTO `fx_role_privilege` VALUES ('2', '38', '3', '3', null);
INSERT INTO `fx_role_privilege` VALUES ('2', '36', '3', '3', null);
INSERT INTO `fx_role_privilege` VALUES ('2', '37', '3', '3', null);
INSERT INTO `fx_role_privilege` VALUES ('2', '39', '3', '3', null);
INSERT INTO `fx_role_privilege` VALUES ('2', '3', '2', '1', null);
INSERT INTO `fx_role_privilege` VALUES ('2', '31', '3', '2', null);
INSERT INTO `fx_role_privilege` VALUES ('2', '32', '3', '2', null);
INSERT INTO `fx_role_privilege` VALUES ('2', '33', '3', '2', null);
INSERT INTO `fx_role_privilege` VALUES ('2', '34', '3', '2', null);
INSERT INTO `fx_role_privilege` VALUES ('2', '2', '2', '1', null);
INSERT INTO `fx_role_privilege` VALUES ('2', '205', '3', '6', null);
INSERT INTO `fx_role_privilege` VALUES ('2', '103', '3', '6', null);
INSERT INTO `fx_role_privilege` VALUES ('2', '102', '3', '6', null);
INSERT INTO `fx_role_privilege` VALUES ('2', '100', '3', '6', null);
INSERT INTO `fx_role_privilege` VALUES ('2', '101', '3', '6', null);
INSERT INTO `fx_role_privilege` VALUES ('2', '6', '2', '1', null);
INSERT INTO `fx_role_privilege` VALUES ('2', '94', '3', '7', null);
INSERT INTO `fx_role_privilege` VALUES ('2', '93', '3', '7', null);
INSERT INTO `fx_role_privilege` VALUES ('2', '97', '3', '7', null);
INSERT INTO `fx_role_privilege` VALUES ('2', '96', '3', '7', null);
INSERT INTO `fx_role_privilege` VALUES ('2', '95', '3', '7', null);
INSERT INTO `fx_role_privilege` VALUES ('2', '7', '2', '1', null);

-- ----------------------------
-- Table structure for fx_setting
-- ----------------------------
DROP TABLE IF EXISTS `fx_setting`;
CREATE TABLE `fx_setting` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `company` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `district` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `country` varchar(255) DEFAULT NULL,
  `province` varchar(50) DEFAULT NULL COMMENT '省份',
  `page_title` text,
  `meta_keyword` text,
  `meta_description` text,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of fx_setting
-- ----------------------------
INSERT INTO `fx_setting` VALUES ('1', 'Placentin', 'http://www.ptp.cn', '帕斯婷商贸有限公司', '华强路富力盈力大厦南塔2903号', 'service@placentin.com', '400-883-3338', '天河区', '广州市', '中国', '广东省', '瑞士帕斯婷（placentin)官方网站暨官方网上商城', '帕斯婷 瑞士帕斯婷 抗衰老  抗衰老产品  抗衰老护肤品  抗衰老护理  化妆品 眼霜 面部修护', '帕斯婷——让年龄成为您一辈子的秘密！细胞修复、细胞激活、细胞再生从最根本的技术角度解决皮肤衰老的本质问题。');

-- ----------------------------
-- Table structure for fx_shipping_method
-- ----------------------------
DROP TABLE IF EXISTS `fx_shipping_method`;
CREATE TABLE `fx_shipping_method` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `sid` smallint(10) NOT NULL,
  `area` varchar(50) NOT NULL DEFAULT '' COMMENT '配送区域名称',
  `start_num` int(10) NOT NULL DEFAULT '0' COMMENT '首重',
  `start_fee` float(10,2) NOT NULL DEFAULT '0.00' COMMENT '首重价格',
  `step_num` int(10) NOT NULL DEFAULT '0' COMMENT '续重价格',
  `step_fee` float(10,2) NOT NULL DEFAULT '0.00' COMMENT '续重重量',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of fx_shipping_method
-- ----------------------------
INSERT INTO `fx_shipping_method` VALUES ('1', '2', '北京,广州', '1', '25.00', '10', '25.00');
INSERT INTO `fx_shipping_method` VALUES ('2', '2', '深圳', '1', '50.00', '10', '50.00');

-- ----------------------------
-- Table structure for fx_shipping_mode
-- ----------------------------
DROP TABLE IF EXISTS `fx_shipping_mode`;
CREATE TABLE `fx_shipping_mode` (
  `id` smallint(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `status` tinyint(2) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of fx_shipping_mode
-- ----------------------------
INSERT INTO `fx_shipping_mode` VALUES ('2', '开发测试运费', '1');

-- ----------------------------
-- Table structure for fx_users
-- ----------------------------
DROP TABLE IF EXISTS `fx_users`;
CREATE TABLE `fx_users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_code` varchar(10) NOT NULL COMMENT '商户编号',
  `username_phone` varchar(20) NOT NULL COMMENT '用户名的手机号',
  `type` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '身份类别(0:个人, 1:企业)',
  `user_level` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '用户级别，关联用户级别表',
  `level_start_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '该用户级别的开始时间',
  `identity` varchar(30) NOT NULL COMMENT '身份证号/营业执照号',
  `legal_name` varchar(10) NOT NULL COMMENT '法人姓名/个人身份证姓名',
  `legal_identity` varchar(20) DEFAULT NULL COMMENT '企业法人身份证号码',
  `enterprise_name` varchar(100) DEFAULT NULL COMMENT '企业名称',
  `email` varchar(50) DEFAULT NULL COMMENT '负责人邮箱',
  `receiver_address_id` int(10) unsigned DEFAULT NULL COMMENT '收货人地址信息',
  `sales_channel` varchar(500) DEFAULT NULL COMMENT '销售渠道和对应的用户数',
  `how_to_kown_we` varchar(100) DEFAULT NULL COMMENT '如何知道我们的',
  `salesman` varchar(20) DEFAULT NULL COMMENT '跟单员/业务员/推荐人',
  `certification_photo` varchar(100) DEFAULT NULL COMMENT '证件原件照片',
  `person_hold_photo` varchar(100) DEFAULT NULL COMMENT '个人/企业法人认证时的手持证件照片',
  `enterprise_legal_photo` varchar(100) DEFAULT NULL COMMENT '企业法人身份证照片',
  `enterprise_grant_photo` varchar(100) DEFAULT NULL COMMENT '企业授权书照片',
  `enterprise_tax_photo` varchar(100) DEFAULT NULL COMMENT '企业税收照片',
  `others_photo` varchar(100) DEFAULT NULL COMMENT '其他补充资料照片',
  `audit_time` int(10) unsigned DEFAULT '0' COMMENT '通过审核时间',
  `last_login_time` int(11) unsigned DEFAULT '0',
  `last_login_ip` varchar(15) DEFAULT NULL,
  `login_time` int(11) unsigned DEFAULT NULL,
  `login_ip` varchar(15) DEFAULT NULL,
  `login_count` int(10) unsigned DEFAULT '0',
  `create_time` int(11) unsigned NOT NULL,
  `status` tinyint(4) DEFAULT '0' COMMENT '状态(0:待审核,1:审核通过,-1:欠费冻结)',
  `info` text COMMENT '其他资料',
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_code` (`user_code`),
  UNIQUE KEY `username_phone` (`username_phone`),
  KEY `type` (`type`),
  KEY `identity` (`identity`),
  KEY `legal_name` (`legal_name`),
  KEY `users_receiver_address_id` (`receiver_address_id`),
  KEY `how_to_kown_we` (`how_to_kown_we`),
  KEY `enterprise_name` (`enterprise_name`),
  KEY `status` (`status`),
  KEY `salesman` (`salesman`),
  KEY `user_user_level_id` (`user_level`),
  CONSTRAINT `users_receiver_address_id` FOREIGN KEY (`receiver_address_id`) REFERENCES `fx_receiver_address` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `user_user_level_id` FOREIGN KEY (`user_level`) REFERENCES `fx_users_level` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of fx_users
-- ----------------------------
INSERT INTO `fx_users` VALUES ('1', 'A1001', '13632252276', '0', '3', '1452048590', '432222222222222222', '张珅', '', '', '', '7', '销售渠道', '获知渠道', '某某某', '13632252276_1_certification_photo.jpg', '13632252276_1_person_hold_photo.jpg', '', '', '', '13632252276_1_others_photo.jpg', '0', '1453109989', '192.168.75.99', '1453112528', '127.0.0.1', '27', '1449199479', '1', '');
INSERT INTO `fx_users` VALUES ('8', 'A1002', '15616689842', '0', '2', '1445665452', '362199199909091451', '颜某某', null, null, 'isonz@qq.com', '3', null, null, null, null, null, null, null, null, null, '0', '1449199479', '192.168.75.99', null, null, '1', '1449199479', '0', null);
INSERT INTO `fx_users` VALUES ('21', 'A1003', '13222222221', '0', '1', '1445665452', 'test', 'test', '', '', 'yanping12346@yeah.net', '25', 'test', 'test', 'test', null, null, null, null, null, null, '0', '0', null, null, null, '0', '1449207823', '0', '');
INSERT INTO `fx_users` VALUES ('25', 'A1004', '13632252275', '1', '2', '1452048864', '4433665599899', '周日亮', '430422198802166579', '广州帕斯婷商贸有限公司', 'isonz@qq.com', '3', '销售渠道', '获知渠道', '', '13632252275_25_certification_photo.jpg', '13632252275_25_person_hold_photo.jpg', '13632252275_25_enterprise_legal_photo.jpg', '13632252275_25_enterprise_grant_photo.jpg', '13632252275_25_enterprise_tax_photo.jpg', '13632252275_25_others_photo.jpg', '0', '1453114292', '192.168.75.99', '1453174182', '127.0.0.1', '49', '1449208631', '1', '');
INSERT INTO `fx_users` VALUES ('26', 'A1005', '13632252277', '1', '1', '0', 'ddddddddddddddd', 'dfffffffff', 'dddddddddddddddd', 'ffffffffffff', 'isonz@qq.com', '138', null, null, null, null, null, null, null, null, null, '0', '1453083301', '192.168.75.99', '1453083301', '192.168.75.99', '1', '1453083301', '0', null);
INSERT INTO `fx_users` VALUES ('27', 'A1006', '13632252278', '1', '1', '0', '444444444444444444444', 'asdfsf', 'aeweweeeeeeeeeeeeee', 'aadadsf', 'isonz@qq.com', '139', null, null, null, null, null, null, null, null, null, '0', '1453084063', '192.168.75.99', '1453084063', '192.168.75.99', '1', '1453084063', '0', null);
INSERT INTO `fx_users` VALUES ('28', 'A1007', '13632252279', '0', '1', '0', 'sssssssssss', 'asdfs', null, null, 'system@placentin.com', '140', null, null, null, null, null, null, null, null, null, '0', '1453084133', '192.168.75.99', '1453084133', '192.168.75.99', '1', '1453084133', '0', null);

-- ----------------------------
-- Table structure for fx_users_history
-- ----------------------------
DROP TABLE IF EXISTS `fx_users_history`;
CREATE TABLE `fx_users_history` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '用户编号',
  `module_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '模块ID',
  `log` text COMMENT '日志',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  PRIMARY KEY (`id`),
  KEY `create_time` (`create_time`),
  KEY `users_history_user_id` (`user_id`),
  KEY `users_history_module_id` (`module_id`),
  CONSTRAINT `users_history_module_id` FOREIGN KEY (`module_id`) REFERENCES `fx_modules` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `users_history_user_id` FOREIGN KEY (`user_id`) REFERENCES `fx_users` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=508 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of fx_users_history
-- ----------------------------
INSERT INTO `fx_users_history` VALUES ('1', '25', '1', null, '0');
INSERT INTO `fx_users_history` VALUES ('2', '25', '5', '{\"op\":\"view\",\"id\":6,\"url\":\"http:\\/\\/192.168.75.99:85\\/product\\/?id=6\"}', '1450844701');
INSERT INTO `fx_users_history` VALUES ('3', '25', '5', '{\"op\":\"view\",\"id\":6,\"url\":\"http:\\/\\/192.168.75.99:85\\/product\\/?id=6\"}', '1450844727');
INSERT INTO `fx_users_history` VALUES ('4', '25', '5', '{\"op\":\"view\",\"id\":9,\"url\":\"http:\\/\\/192.168.75.99:85\\/product\\/?id=9\"}', '1450850506');
INSERT INTO `fx_users_history` VALUES ('5', '25', '5', '{\"op\":\"view\",\"id\":9,\"url\":\"http:\\/\\/192.168.75.99:85\\/product\\/?id=9\"}', '1450850559');
INSERT INTO `fx_users_history` VALUES ('6', '25', '5', '{\"op\":\"view\",\"id\":9,\"url\":\"http:\\/\\/192.168.75.99:85\\/product\\/?id=9\"}', '1450850565');
INSERT INTO `fx_users_history` VALUES ('7', '25', '5', '{\"op\":\"view\",\"id\":9,\"url\":\"http:\\/\\/192.168.75.99:85\\/product\\/?id=9\"}', '1450850667');
INSERT INTO `fx_users_history` VALUES ('8', '25', '5', '{\"op\":\"view\",\"id\":9,\"url\":\"http:\\/\\/192.168.75.99:85\\/product\\/?id=9\"}', '1450850689');
INSERT INTO `fx_users_history` VALUES ('9', '25', '5', '{\"op\":\"view\",\"id\":9,\"url\":\"http:\\/\\/192.168.75.99:85\\/product\\/?id=9\"}', '1450852059');
INSERT INTO `fx_users_history` VALUES ('10', '25', '5', '{\"op\":\"view\",\"id\":6,\"url\":\"http:\\/\\/192.168.75.99:85\\/product\\/?id=6\"}', '1450852069');
INSERT INTO `fx_users_history` VALUES ('11', '25', '5', '{\"op\":\"view\",\"id\":6,\"url\":\"http:\\/\\/192.168.75.99:85\\/product\\/?id=6\"}', '1450852071');
INSERT INTO `fx_users_history` VALUES ('12', '25', '5', '{\"op\":\"view\",\"id\":6,\"url\":\"http:\\/\\/192.168.75.99:85\\/product\\/?id=6\"}', '1450852072');
INSERT INTO `fx_users_history` VALUES ('13', '25', '5', '{\"op\":\"view\",\"id\":6,\"url\":\"http:\\/\\/192.168.75.99:85\\/product\\/?id=6\"}', '1450852073');
INSERT INTO `fx_users_history` VALUES ('14', '25', '5', '{\"op\":\"view\",\"id\":6,\"url\":\"http:\\/\\/192.168.75.99:85\\/product\\/?id=6\"}', '1450852074');
INSERT INTO `fx_users_history` VALUES ('15', '25', '5', '{\"op\":\"view\",\"id\":9,\"url\":\"http:\\/\\/192.168.75.99:85\\/product\\/?id=9\"}', '1450852077');
INSERT INTO `fx_users_history` VALUES ('16', '25', '5', '{\"op\":\"view\",\"id\":9,\"url\":\"http:\\/\\/192.168.75.99:85\\/product\\/?id=9\"}', '1450852078');
INSERT INTO `fx_users_history` VALUES ('17', '25', '5', '{\"op\":\"view\",\"id\":9,\"url\":\"http:\\/\\/192.168.75.99:85\\/product\\/?id=9\"}', '1450852079');
INSERT INTO `fx_users_history` VALUES ('18', '25', '5', '{\"op\":\"view\",\"id\":9,\"url\":\"http:\\/\\/192.168.75.99:85\\/product\\/?id=9\"}', '1450852080');
INSERT INTO `fx_users_history` VALUES ('19', '25', '5', '{\"op\":\"view\",\"id\":9,\"url\":\"http:\\/\\/192.168.75.99:85\\/product\\/?id=9\"}', '1450852081');
INSERT INTO `fx_users_history` VALUES ('20', '25', '5', '{\"op\":\"view\",\"id\":6,\"url\":\"http:\\/\\/192.168.75.99:85\\/product\\/?id=6\"}', '1450852083');
INSERT INTO `fx_users_history` VALUES ('21', '25', '5', '{\"op\":\"view\",\"id\":6,\"url\":\"http:\\/\\/192.168.75.99:85\\/product\\/?id=6\"}', '1450852091');
INSERT INTO `fx_users_history` VALUES ('22', '25', '5', '{\"op\":\"view\",\"id\":9,\"url\":\"http:\\/\\/192.168.75.99:85\\/product\\/?id=9\"}', '1450852097');
INSERT INTO `fx_users_history` VALUES ('23', '25', '5', '{\"op\":\"view\",\"id\":6,\"url\":\"http:\\/\\/192.168.75.99:85\\/product\\/?id=6\"}', '1450852099');
INSERT INTO `fx_users_history` VALUES ('24', '25', '5', '{\"op\":\"view\",\"id\":9,\"url\":\"http:\\/\\/192.168.75.99:85\\/product\\/?id=9\"}', '1450852102');
INSERT INTO `fx_users_history` VALUES ('25', '25', '5', '{\"op\":\"view\",\"id\":6,\"url\":\"http:\\/\\/192.168.75.99:85\\/product\\/?id=6\"}', '1450852113');
INSERT INTO `fx_users_history` VALUES ('26', '25', '5', '{\"op\":\"view\",\"id\":6,\"url\":\"http:\\/\\/192.168.75.99:85\\/product\\/?id=6\"}', '1450852113');
INSERT INTO `fx_users_history` VALUES ('27', '25', '5', '{\"op\":\"view\",\"id\":4,\"url\":\"http:\\/\\/192.168.75.99:85\\/product\\/?id=4\"}', '1450852137');
INSERT INTO `fx_users_history` VALUES ('28', '25', '5', '{\"op\":\"view\",\"id\":3,\"url\":\"http:\\/\\/192.168.75.99:85\\/product\\/?id=3\"}', '1450852140');
INSERT INTO `fx_users_history` VALUES ('29', '25', '5', '{\"op\":\"view\",\"id\":3,\"url\":\"http:\\/\\/192.168.75.99:85\\/product\\/?id=3\"}', '1450852341');
INSERT INTO `fx_users_history` VALUES ('30', '25', '5', '{\"op\":\"view\",\"id\":3,\"url\":\"http:\\/\\/192.168.75.99:85\\/product\\/?id=3\"}', '1450852352');
INSERT INTO `fx_users_history` VALUES ('31', '25', '5', '{\"op\":\"view\",\"id\":3,\"url\":\"http:\\/\\/192.168.75.99:85\\/product\\/?id=3\"}', '1450852353');
INSERT INTO `fx_users_history` VALUES ('32', '25', '5', '{\"op\":\"view\",\"id\":3,\"url\":\"http:\\/\\/192.168.75.99:85\\/product\\/?id=3\"}', '1450852353');
INSERT INTO `fx_users_history` VALUES ('33', '25', '5', '{\"op\":\"view\",\"id\":3,\"url\":\"http:\\/\\/192.168.75.99:85\\/product\\/?id=3\"}', '1450852353');
INSERT INTO `fx_users_history` VALUES ('34', '25', '5', '{\"op\":\"view\",\"id\":3,\"url\":\"http:\\/\\/192.168.75.99:85\\/product\\/?id=3\"}', '1450852353');
INSERT INTO `fx_users_history` VALUES ('35', '25', '5', '{\"op\":\"view\",\"id\":3,\"url\":\"http:\\/\\/192.168.75.99:85\\/product\\/?id=3\"}', '1450852390');
INSERT INTO `fx_users_history` VALUES ('36', '25', '5', '{\"op\":\"view\",\"id\":3,\"url\":\"http:\\/\\/192.168.75.99:85\\/product\\/?id=3\"}', '1450852395');
INSERT INTO `fx_users_history` VALUES ('37', '25', '5', '{\"op\":\"view\",\"id\":3,\"url\":\"http:\\/\\/192.168.75.99:85\\/product\\/?id=3\"}', '1450852416');
INSERT INTO `fx_users_history` VALUES ('38', '25', '5', '{\"op\":\"view\",\"id\":3,\"url\":\"http:\\/\\/192.168.75.99:85\\/product\\/?id=3\"}', '1450852417');
INSERT INTO `fx_users_history` VALUES ('39', '25', '5', '{\"op\":\"view\",\"id\":3,\"url\":\"http:\\/\\/192.168.75.99:85\\/product\\/?id=3\"}', '1450852418');
INSERT INTO `fx_users_history` VALUES ('40', '25', '5', '{\"op\":\"view\",\"id\":3,\"url\":\"http:\\/\\/192.168.75.99:85\\/product\\/?id=3\"}', '1450852440');
INSERT INTO `fx_users_history` VALUES ('41', '25', '5', '{\"op\":\"view\",\"id\":3,\"url\":\"http:\\/\\/192.168.75.99:85\\/product\\/?id=3\"}', '1450852478');
INSERT INTO `fx_users_history` VALUES ('42', '25', '5', '{\"op\":\"view\",\"id\":3,\"url\":\"http:\\/\\/192.168.75.99:85\\/product\\/?id=3\"}', '1450852480');
INSERT INTO `fx_users_history` VALUES ('43', '25', '5', '{\"op\":\"view\",\"id\":3,\"url\":\"http:\\/\\/192.168.75.99:85\\/product\\/?id=3\"}', '1450852484');
INSERT INTO `fx_users_history` VALUES ('44', '25', '5', '{\"op\":\"view\",\"id\":6,\"url\":\"http:\\/\\/192.168.75.99:85\\/product\\/?id=6\"}', '1450852490');
INSERT INTO `fx_users_history` VALUES ('45', '25', '5', '{\"op\":\"view\",\"id\":4,\"url\":\"http:\\/\\/192.168.75.99:85\\/product\\/?id=4\"}', '1450852492');
INSERT INTO `fx_users_history` VALUES ('46', '25', '5', '{\"op\":\"view\",\"id\":3,\"url\":\"http:\\/\\/192.168.75.99:85\\/product\\/?id=3\"}', '1450852498');
INSERT INTO `fx_users_history` VALUES ('47', '25', '5', '{\"op\":\"view\",\"id\":3,\"url\":\"http:\\/\\/192.168.75.99:85\\/product\\/?id=3\"}', '1450852498');
INSERT INTO `fx_users_history` VALUES ('48', '25', '5', '{\"op\":\"view\",\"id\":3,\"url\":\"http:\\/\\/192.168.75.99:85\\/product\\/?id=3\"}', '1450852501');
INSERT INTO `fx_users_history` VALUES ('49', '25', '5', '{\"op\":\"view\",\"id\":6,\"url\":\"http:\\/\\/192.168.75.99:85\\/product\\/?id=6\"}', '1450852505');
INSERT INTO `fx_users_history` VALUES ('50', '25', '5', '{\"op\":\"view\",\"id\":6,\"url\":\"http:\\/\\/192.168.75.99:85\\/product\\/?id=6\"}', '1450853029');
INSERT INTO `fx_users_history` VALUES ('51', '25', '5', '{\"op\":\"view\",\"id\":6,\"url\":\"http:\\/\\/192.168.75.99:85\\/product\\/?id=6\"}', '1450853032');
INSERT INTO `fx_users_history` VALUES ('52', '25', '5', '{\"op\":\"view\",\"id\":6,\"url\":\"http:\\/\\/192.168.75.99:85\\/product\\/?id=6\"}', '1450853036');
INSERT INTO `fx_users_history` VALUES ('53', '25', '5', '{\"op\":\"view\",\"id\":6,\"url\":\"http:\\/\\/192.168.75.99:85\\/product\\/?id=6\"}', '1450853080');
INSERT INTO `fx_users_history` VALUES ('54', '25', '5', '{\"op\":\"view\",\"id\":6,\"url\":\"http:\\/\\/192.168.75.99:85\\/product\\/?id=6\"}', '1450853199');
INSERT INTO `fx_users_history` VALUES ('55', '25', '5', '{\"op\":\"view\",\"id\":6,\"url\":\"http:\\/\\/192.168.75.99:85\\/product\\/?id=6\"}', '1450853293');
INSERT INTO `fx_users_history` VALUES ('56', '25', '5', '{\"op\":\"view\",\"id\":6,\"url\":\"http:\\/\\/192.168.75.99:85\\/product\\/?id=6\"}', '1450853297');
INSERT INTO `fx_users_history` VALUES ('57', '25', '5', '{\"op\":\"view\",\"id\":4,\"url\":\"http:\\/\\/192.168.75.99:85\\/product\\/?id=4\"}', '1450853332');
INSERT INTO `fx_users_history` VALUES ('58', '25', '5', '{\"op\":\"view\",\"id\":6,\"url\":\"http:\\/\\/192.168.75.99:85\\/product\\/?id=6\"}', '1450853335');
INSERT INTO `fx_users_history` VALUES ('59', '1', '5', '{\"op\":\"view\",\"id\":6,\"url\":\"http:\\/\\/192.168.75.99:85\\/product\\/?id=6\"}', '1450853765');
INSERT INTO `fx_users_history` VALUES ('60', '1', '5', '{\"op\":\"view\",\"id\":6,\"url\":\"http:\\/\\/192.168.75.99:85\\/product\\/?id=6\"}', '1450853904');
INSERT INTO `fx_users_history` VALUES ('61', '1', '5', '{\"op\":\"view\",\"id\":6,\"url\":\"http:\\/\\/192.168.75.99:85\\/product\\/?id=6\"}', '1450853909');
INSERT INTO `fx_users_history` VALUES ('62', '1', '5', '{\"op\":\"view\",\"id\":6,\"url\":\"http:\\/\\/192.168.75.99:85\\/product\\/?id=6\"}', '1450854702');
INSERT INTO `fx_users_history` VALUES ('63', '1', '5', '{\"op\":\"view\",\"id\":6,\"url\":\"http:\\/\\/192.168.75.99:85\\/product\\/?id=6\"}', '1450862418');
INSERT INTO `fx_users_history` VALUES ('64', '1', '5', '{\"op\":\"view\",\"id\":6,\"url\":\"http:\\/\\/192.168.75.99:85\\/product\\/?id=6\"}', '1450862419');
INSERT INTO `fx_users_history` VALUES ('65', '1', '5', '{\"op\":\"view\",\"id\":6,\"url\":\"http:\\/\\/192.168.75.99:85\\/product\\/?id=6\"}', '1450863807');
INSERT INTO `fx_users_history` VALUES ('66', '1', '5', '{\"op\":\"view\",\"id\":6,\"url\":\"http:\\/\\/192.168.75.99:85\\/product\\/?id=6\"}', '1450864063');
INSERT INTO `fx_users_history` VALUES ('67', '1', '5', '{\"op\":\"view\",\"id\":6,\"url\":\"http:\\/\\/192.168.75.99:85\\/product\\/?id=6\"}', '1450864069');
INSERT INTO `fx_users_history` VALUES ('68', '1', '5', '{\"op\":\"view\",\"id\":6,\"url\":\"http:\\/\\/192.168.75.99:85\\/product\\/?id=6\"}', '1450864076');
INSERT INTO `fx_users_history` VALUES ('69', '1', '5', '{\"op\":\"view\",\"id\":6,\"url\":\"http:\\/\\/192.168.75.99:85\\/product\\/?id=6\"}', '1450864137');
INSERT INTO `fx_users_history` VALUES ('70', '1', '5', '{\"op\":\"view\",\"id\":6,\"url\":\"http:\\/\\/192.168.75.99:85\\/product\\/?id=6\"}', '1450864137');
INSERT INTO `fx_users_history` VALUES ('71', '1', '5', '{\"op\":\"view\",\"id\":6,\"url\":\"http:\\/\\/192.168.75.99:85\\/product\\/?id=6\"}', '1450864139');
INSERT INTO `fx_users_history` VALUES ('72', '1', '5', '{\"op\":\"view\",\"id\":6,\"url\":\"http:\\/\\/192.168.75.99:85\\/product\\/?id=6\"}', '1450864140');
INSERT INTO `fx_users_history` VALUES ('73', '1', '5', '{\"op\":\"view\",\"id\":6,\"url\":\"http:\\/\\/192.168.75.99:85\\/product\\/?id=6\"}', '1450864660');
INSERT INTO `fx_users_history` VALUES ('74', '1', '5', '{\"op\":\"view\",\"id\":6,\"url\":\"http:\\/\\/192.168.75.99:85\\/product\\/?id=6\"}', '1450925513');
INSERT INTO `fx_users_history` VALUES ('75', '1', '5', '{\"op\":\"view\",\"id\":6,\"url\":\"http:\\/\\/192.168.75.99:85\\/product\\/?id=6\"}', '1450926666');
INSERT INTO `fx_users_history` VALUES ('76', '1', '5', '{\"op\":\"view\",\"id\":6,\"url\":\"http:\\/\\/192.168.75.99:85\\/product\\/?id=6\"}', '1450926667');
INSERT INTO `fx_users_history` VALUES ('77', '1', '5', '{\"op\":\"view\",\"id\":6,\"url\":\"http:\\/\\/192.168.75.99:85\\/product\\/?id=6\"}', '1450926668');
INSERT INTO `fx_users_history` VALUES ('78', '1', '5', '{\"op\":\"view\",\"id\":6,\"url\":\"http:\\/\\/192.168.75.99:85\\/product\\/?id=6\"}', '1450926705');
INSERT INTO `fx_users_history` VALUES ('79', '1', '5', '{\"op\":\"view\",\"id\":6,\"url\":\"http:\\/\\/192.168.75.99:85\\/product\\/?id=6\"}', '1450926706');
INSERT INTO `fx_users_history` VALUES ('80', '1', '5', '{\"op\":\"view\",\"id\":6,\"url\":\"http:\\/\\/192.168.75.99:85\\/product\\/?id=6\"}', '1450926761');
INSERT INTO `fx_users_history` VALUES ('81', '1', '5', '{\"op\":\"view\",\"id\":6,\"url\":\"http:\\/\\/192.168.75.99:85\\/product\\/?id=6\"}', '1450926820');
INSERT INTO `fx_users_history` VALUES ('82', '1', '5', '{\"op\":\"view\",\"id\":9,\"url\":\"http:\\/\\/192.168.75.99:85\\/product\\/?id=9\"}', '1450926831');
INSERT INTO `fx_users_history` VALUES ('83', '1', '5', '{\"op\":\"view\",\"id\":2,\"url\":\"http:\\/\\/192.168.75.99:85\\/product\\/?id=2\"}', '1450926842');
INSERT INTO `fx_users_history` VALUES ('84', '1', '5', '{\"op\":\"view\",\"id\":6,\"url\":\"http:\\/\\/192.168.75.99:85\\/product\\/?id=6\"}', '1450926883');
INSERT INTO `fx_users_history` VALUES ('85', '1', '5', '{\"op\":\"view\",\"id\":4,\"url\":\"http:\\/\\/192.168.75.99:85\\/product\\/?id=4\"}', '1450926886');
INSERT INTO `fx_users_history` VALUES ('86', '1', '5', '{\"op\":\"view\",\"id\":4,\"url\":\"http:\\/\\/192.168.75.99:85\\/product\\/?id=4\"}', '1450926916');
INSERT INTO `fx_users_history` VALUES ('87', '1', '5', '{\"op\":\"view\",\"id\":4,\"url\":\"http:\\/\\/192.168.75.99:85\\/product\\/?id=4\"}', '1450927498');
INSERT INTO `fx_users_history` VALUES ('88', '1', '5', '{\"op\":\"view\",\"id\":4,\"url\":\"http:\\/\\/192.168.75.99:85\\/product\\/?id=4\"}', '1450927677');
INSERT INTO `fx_users_history` VALUES ('89', '1', '5', '{\"op\":\"view\",\"id\":4,\"url\":\"http:\\/\\/192.168.75.99:85\\/product\\/?id=4\"}', '1450927678');
INSERT INTO `fx_users_history` VALUES ('90', '1', '5', '{\"op\":\"view\",\"id\":4,\"url\":\"http:\\/\\/192.168.75.99:85\\/product\\/?id=4\"}', '1450927779');
INSERT INTO `fx_users_history` VALUES ('91', '1', '5', '{\"op\":\"view\",\"id\":4,\"url\":\"http:\\/\\/192.168.75.99:85\\/product\\/?id=4\"}', '1450927787');
INSERT INTO `fx_users_history` VALUES ('92', '1', '5', '{\"op\":\"view\",\"id\":4,\"url\":\"http:\\/\\/192.168.75.99:85\\/product\\/?id=4\"}', '1450927790');
INSERT INTO `fx_users_history` VALUES ('93', '1', '5', '{\"op\":\"view\",\"id\":4,\"url\":\"http:\\/\\/192.168.75.99:85\\/product\\/?id=4\"}', '1450927838');
INSERT INTO `fx_users_history` VALUES ('94', '1', '5', '{\"op\":\"view\",\"id\":4,\"url\":\"http:\\/\\/192.168.75.99:85\\/product\\/?id=4\"}', '1450927839');
INSERT INTO `fx_users_history` VALUES ('95', '1', '5', '{\"op\":\"view\",\"id\":4,\"url\":\"http:\\/\\/192.168.75.99:85\\/product\\/?id=4\"}', '1450927840');
INSERT INTO `fx_users_history` VALUES ('96', '1', '5', '{\"op\":\"view\",\"id\":4,\"url\":\"http:\\/\\/192.168.75.99:85\\/product\\/?id=4\"}', '1450927843');
INSERT INTO `fx_users_history` VALUES ('97', '1', '5', '{\"op\":\"view\",\"id\":4,\"url\":\"http:\\/\\/192.168.75.99:85\\/product\\/?id=4\"}', '1450927844');
INSERT INTO `fx_users_history` VALUES ('98', '25', '5', '{\"op\":\"view\",\"id\":9,\"url\":\"http:\\/\\/wws.fxptp.com\\/product\\/?id=9\"}', '1450927998');
INSERT INTO `fx_users_history` VALUES ('99', '25', '5', '{\"op\":\"view\",\"id\":6,\"url\":\"http:\\/\\/wws.fxptp.com\\/product\\/?id=6\"}', '1450928022');
INSERT INTO `fx_users_history` VALUES ('100', '25', '5', '{\"op\":\"view\",\"id\":2,\"url\":\"http:\\/\\/wws.fxptp.com\\/product\\/?id=2\"}', '1450928113');
INSERT INTO `fx_users_history` VALUES ('101', '25', '5', '{\"op\":\"view\",\"id\":6,\"url\":\"http:\\/\\/wws.fxptp.com\\/product\\/?id=6\"}', '1450928151');
INSERT INTO `fx_users_history` VALUES ('102', '25', '5', '{\"op\":\"view\",\"id\":6,\"url\":\"http:\\/\\/wws.fxptp.com\\/product\\/?id=6\"}', '1450928284');
INSERT INTO `fx_users_history` VALUES ('103', '25', '5', '{\"op\":\"view\",\"id\":3,\"url\":\"http:\\/\\/wws.fxptp.com\\/product\\/?id=3\"}', '1450928290');
INSERT INTO `fx_users_history` VALUES ('104', '25', '5', '{\"op\":\"view\",\"id\":4,\"url\":\"http:\\/\\/wws.fxptp.com\\/product\\/?id=4\"}', '1450928292');
INSERT INTO `fx_users_history` VALUES ('105', '25', '5', '{\"op\":\"view\",\"id\":6,\"url\":\"http:\\/\\/wws.fxptp.com\\/product\\/?id=6\"}', '1450928299');
INSERT INTO `fx_users_history` VALUES ('106', '25', '5', '{\"op\":\"view\",\"id\":6,\"url\":\"http:\\/\\/wws.fxptp.com\\/product\\/?id=6\"}', '1450928299');
INSERT INTO `fx_users_history` VALUES ('107', '25', '5', '{\"op\":\"view\",\"id\":4,\"url\":\"http:\\/\\/wws.fxptp.com\\/product\\/?id=4\"}', '1450928299');
INSERT INTO `fx_users_history` VALUES ('108', '25', '5', '{\"op\":\"view\",\"id\":4,\"url\":\"http:\\/\\/wws.fxptp.com\\/product\\/?id=4\"}', '1450928299');
INSERT INTO `fx_users_history` VALUES ('109', '25', '5', '{\"op\":\"view\",\"id\":3,\"url\":\"http:\\/\\/wws.fxptp.com\\/product\\/?id=3\"}', '1450928299');
INSERT INTO `fx_users_history` VALUES ('110', '25', '5', '{\"op\":\"view\",\"id\":3,\"url\":\"http:\\/\\/wws.fxptp.com\\/product\\/?id=3\"}', '1450928331');
INSERT INTO `fx_users_history` VALUES ('111', '25', '5', '{\"op\":\"view\",\"id\":3,\"url\":\"http:\\/\\/wws.fxptp.com\\/product\\/?id=3\"}', '1450928339');
INSERT INTO `fx_users_history` VALUES ('112', '25', '5', '{\"op\":\"view\",\"id\":3,\"url\":\"http:\\/\\/wws.fxptp.com\\/product\\/?id=3\"}', '1450928443');
INSERT INTO `fx_users_history` VALUES ('113', '25', '5', '{\"op\":\"view\",\"id\":3,\"url\":\"http:\\/\\/wws.fxptp.com\\/product\\/?id=3\"}', '1450928467');
INSERT INTO `fx_users_history` VALUES ('114', '25', '5', '{\"op\":\"view\",\"id\":3,\"url\":\"http:\\/\\/wws.fxptp.com\\/product\\/?id=3\"}', '1450928468');
INSERT INTO `fx_users_history` VALUES ('115', '25', '5', '{\"op\":\"view\",\"id\":3,\"url\":\"http:\\/\\/wws.fxptp.com\\/product\\/?id=3\"}', '1450928504');
INSERT INTO `fx_users_history` VALUES ('116', '25', '5', '{\"op\":\"view\",\"id\":3,\"url\":\"http:\\/\\/wws.fxptp.com\\/product\\/?id=3\"}', '1450928525');
INSERT INTO `fx_users_history` VALUES ('117', '25', '5', '{\"op\":\"view\",\"id\":3,\"url\":\"http:\\/\\/wws.fxptp.com\\/product\\/?id=3\"}', '1450928532');
INSERT INTO `fx_users_history` VALUES ('118', '25', '5', '{\"op\":\"view\",\"id\":3,\"url\":\"http:\\/\\/wws.fxptp.com\\/product\\/?id=3\"}', '1450928567');
INSERT INTO `fx_users_history` VALUES ('119', '25', '5', '{\"op\":\"view\",\"id\":3,\"url\":\"http:\\/\\/wws.fxptp.com\\/product\\/?id=3\"}', '1450928585');
INSERT INTO `fx_users_history` VALUES ('120', '25', '5', '{\"op\":\"view\",\"id\":3,\"url\":\"http:\\/\\/wws.fxptp.com\\/product\\/?id=3\"}', '1450928587');
INSERT INTO `fx_users_history` VALUES ('121', '25', '5', '{\"op\":\"view\",\"id\":4,\"url\":\"http:\\/\\/wws.fxptp.com\\/product\\/?id=4\"}', '1450928593');
INSERT INTO `fx_users_history` VALUES ('122', '25', '5', '{\"op\":\"view\",\"id\":6,\"url\":\"http:\\/\\/wws.fxptp.com\\/product\\/?id=6\"}', '1450928593');
INSERT INTO `fx_users_history` VALUES ('123', '25', '5', '{\"op\":\"view\",\"id\":4,\"url\":\"http:\\/\\/wws.fxptp.com\\/product\\/?id=4\"}', '1450928594');
INSERT INTO `fx_users_history` VALUES ('124', '25', '5', '{\"op\":\"view\",\"id\":3,\"url\":\"http:\\/\\/wws.fxptp.com\\/product\\/?id=3\"}', '1450928594');
INSERT INTO `fx_users_history` VALUES ('125', '25', '5', '{\"op\":\"view\",\"id\":4,\"url\":\"http:\\/\\/wws.fxptp.com\\/product\\/?id=4\"}', '1450928594');
INSERT INTO `fx_users_history` VALUES ('126', '25', '5', '{\"op\":\"view\",\"id\":6,\"url\":\"http:\\/\\/wws.fxptp.com\\/product\\/?id=6\"}', '1450928596');
INSERT INTO `fx_users_history` VALUES ('127', '25', '5', '{\"op\":\"view\",\"id\":6,\"url\":\"http:\\/\\/wws.fxptp.com\\/product\\/?id=6\"}', '1450928636');
INSERT INTO `fx_users_history` VALUES ('128', '25', '5', '{\"op\":\"view\",\"id\":6,\"url\":\"http:\\/\\/wws.fxptp.com\\/product\\/?id=6\"}', '1450929020');
INSERT INTO `fx_users_history` VALUES ('129', '25', '5', '{\"op\":\"view\",\"id\":6,\"url\":\"http:\\/\\/wws.fxptp.com\\/product\\/?id=6\"}', '1450929025');
INSERT INTO `fx_users_history` VALUES ('130', '25', '5', '{\"op\":\"view\",\"id\":6,\"url\":\"http:\\/\\/wws.fxptp.com\\/product\\/?id=6\"}', '1450929026');
INSERT INTO `fx_users_history` VALUES ('131', '25', '5', '{\"op\":\"view\",\"id\":6,\"url\":\"http:\\/\\/wws.fxptp.com\\/product\\/?id=6\"}', '1450929035');
INSERT INTO `fx_users_history` VALUES ('132', '1', '5', '{\"op\":\"view\",\"id\":6,\"url\":\"http:\\/\\/192.168.75.99:85\\/product\\/?id=6\"}', '1450929196');
INSERT INTO `fx_users_history` VALUES ('133', '25', '5', '{\"op\":\"view\",\"id\":6,\"url\":\"http:\\/\\/wws.fxptp.com\\/product\\/?id=6\"}', '1450929076');
INSERT INTO `fx_users_history` VALUES ('134', '1', '5', '{\"op\":\"view\",\"id\":6,\"url\":\"http:\\/\\/192.168.75.99:85\\/product\\/?id=6\"}', '1450929610');
INSERT INTO `fx_users_history` VALUES ('135', '25', '5', '{\"op\":\"view\",\"id\":6,\"url\":\"http:\\/\\/wws.fxptp.com\\/product\\/?id=6\"}', '1450929515');
INSERT INTO `fx_users_history` VALUES ('136', '1', '5', '{\"op\":\"view\",\"id\":4,\"url\":\"http:\\/\\/192.168.75.99:85\\/product\\/?id=4\"}', '1450937422');
INSERT INTO `fx_users_history` VALUES ('137', '1', '5', '{\"op\":\"view\",\"id\":6,\"url\":\"http:\\/\\/192.168.75.99:85\\/product\\/?id=6\"}', '1450937426');
INSERT INTO `fx_users_history` VALUES ('138', '1', '5', '{\"op\":\"view\",\"id\":6,\"url\":\"http:\\/\\/192.168.75.99:85\\/product\\/?id=6\"}', '1450937551');
INSERT INTO `fx_users_history` VALUES ('139', '1', '5', '{\"op\":\"view\",\"id\":6,\"url\":\"http:\\/\\/192.168.75.99:85\\/product\\/?id=6\"}', '1450937559');
INSERT INTO `fx_users_history` VALUES ('140', '25', '5', '{\"op\":\"view\",\"id\":6,\"url\":\"http:\\/\\/wws.fxptp.com\\/product\\/?id=6\"}', '1450938488');
INSERT INTO `fx_users_history` VALUES ('141', '25', '5', '{\"op\":\"view\",\"id\":6,\"url\":\"http:\\/\\/wws.fxptp.com\\/product\\/?id=6\"}', '1450938703');
INSERT INTO `fx_users_history` VALUES ('142', '1', '5', '{\"op\":\"view\",\"id\":6,\"url\":\"http:\\/\\/192.168.75.99:85\\/product\\/?id=6\"}', '1451007643');
INSERT INTO `fx_users_history` VALUES ('143', '1', '5', '{\"op\":\"view\",\"id\":6,\"url\":\"http:\\/\\/192.168.75.99:85\\/product\\/?id=6\"}', '1451007649');
INSERT INTO `fx_users_history` VALUES ('144', '1', '5', '{\"op\":\"view\",\"id\":6,\"url\":\"http:\\/\\/192.168.75.99:85\\/product\\/?id=6\"}', '1451008662');
INSERT INTO `fx_users_history` VALUES ('145', '1', '5', '{\"op\":\"view\",\"id\":4,\"url\":\"http:\\/\\/192.168.75.99:85\\/product\\/?id=4\"}', '1451008666');
INSERT INTO `fx_users_history` VALUES ('146', '1', '5', '{\"op\":\"view\",\"id\":3,\"url\":\"http:\\/\\/192.168.75.99:85\\/product\\/?id=3\"}', '1451008669');
INSERT INTO `fx_users_history` VALUES ('147', '1', '5', '{\"op\":\"view\",\"id\":6,\"url\":\"http:\\/\\/192.168.75.99:85\\/product\\/?id=6\"}', '1451008677');
INSERT INTO `fx_users_history` VALUES ('148', '1', '5', '{\"op\":\"view\",\"id\":6,\"url\":\"http:\\/\\/192.168.75.99:85\\/product\\/?id=6\"}', '1451008677');
INSERT INTO `fx_users_history` VALUES ('149', '1', '5', '{\"op\":\"view\",\"id\":3,\"url\":\"http:\\/\\/192.168.75.99:85\\/product\\/?id=3\"}', '1451008683');
INSERT INTO `fx_users_history` VALUES ('150', '1', '5', '{\"op\":\"view\",\"id\":4,\"url\":\"http:\\/\\/192.168.75.99:85\\/product\\/?id=4\"}', '1451008685');
INSERT INTO `fx_users_history` VALUES ('151', '1', '5', '{\"op\":\"view\",\"id\":3,\"url\":\"http:\\/\\/192.168.75.99:85\\/product\\/?id=3\"}', '1451008688');
INSERT INTO `fx_users_history` VALUES ('152', '1', '5', '{\"op\":\"view\",\"id\":4,\"url\":\"http:\\/\\/192.168.75.99:85\\/product\\/?id=4\"}', '1451008695');
INSERT INTO `fx_users_history` VALUES ('153', '1', '5', '{\"op\":\"view\",\"id\":6,\"url\":\"http:\\/\\/192.168.75.99:85\\/product\\/?id=6\"}', '1451008697');
INSERT INTO `fx_users_history` VALUES ('154', '1', '5', '{\"op\":\"view\",\"id\":4,\"url\":\"http:\\/\\/192.168.75.99:85\\/product\\/?id=4\"}', '1451008699');
INSERT INTO `fx_users_history` VALUES ('155', '1', '5', '{\"op\":\"view\",\"id\":3,\"url\":\"http:\\/\\/192.168.75.99:85\\/product\\/?id=3\"}', '1451008705');
INSERT INTO `fx_users_history` VALUES ('156', '1', '5', '{\"op\":\"view\",\"id\":3,\"url\":\"http:\\/\\/192.168.75.99:85\\/product\\/?id=3\"}', '1451008705');
INSERT INTO `fx_users_history` VALUES ('157', '1', '5', '{\"op\":\"view\",\"id\":3,\"url\":\"http:\\/\\/192.168.75.99:85\\/product\\/?id=3\"}', '1451008705');
INSERT INTO `fx_users_history` VALUES ('158', '1', '5', '{\"op\":\"view\",\"id\":3,\"url\":\"http:\\/\\/192.168.75.99:85\\/product\\/?id=3\"}', '1451008706');
INSERT INTO `fx_users_history` VALUES ('159', '1', '5', '{\"op\":\"view\",\"id\":6,\"url\":\"http:\\/\\/192.168.75.99:85\\/product\\/?id=6\"}', '1451008707');
INSERT INTO `fx_users_history` VALUES ('160', '25', '5', '{\"op\":\"view\",\"id\":9,\"url\":\"http:\\/\\/192.168.75.99:85\\/product\\/?id=9\"}', '1451027209');
INSERT INTO `fx_users_history` VALUES ('161', '25', '5', '{\"op\":\"view\",\"id\":2,\"url\":\"http:\\/\\/192.168.75.99:85\\/product\\/?id=2\"}', '1451027215');
INSERT INTO `fx_users_history` VALUES ('162', '25', '5', '{\"op\":\"view\",\"id\":7,\"url\":\"http:\\/\\/192.168.75.99:85\\/product\\/?id=7\"}', '1451027219');
INSERT INTO `fx_users_history` VALUES ('163', '25', '5', '{\"op\":\"view\",\"id\":7,\"url\":\"http:\\/\\/192.168.75.99:85\\/product\\/?id=7\"}', '1451027233');
INSERT INTO `fx_users_history` VALUES ('164', '25', '5', '{\"op\":\"view\",\"id\":7,\"url\":\"http:\\/\\/192.168.75.99:85\\/product\\/?id=7\"}', '1451027267');
INSERT INTO `fx_users_history` VALUES ('165', '25', '5', '{\"op\":\"view\",\"id\":6,\"url\":\"http:\\/\\/192.168.75.99:85\\/product\\/?id=6\"}', '1451266830');
INSERT INTO `fx_users_history` VALUES ('166', '25', '5', '{\"op\":\"view\",\"id\":6,\"url\":\"http:\\/\\/192.168.75.99:85\\/product\\/?id=6\"}', '1451269761');
INSERT INTO `fx_users_history` VALUES ('167', '25', '5', '{\"op\":\"view\",\"id\":6,\"url\":\"http:\\/\\/192.168.75.99:85\\/product\\/?id=6\"}', '1451269775');
INSERT INTO `fx_users_history` VALUES ('168', '25', '5', '{\"op\":\"view\",\"id\":6,\"url\":\"http:\\/\\/192.168.75.99:85\\/product\\/?id=6\"}', '1451270485');
INSERT INTO `fx_users_history` VALUES ('169', '25', '5', '{\"op\":\"view\",\"id\":6,\"url\":\"http:\\/\\/192.168.75.99:85\\/product\\/?id=6\"}', '1451270537');
INSERT INTO `fx_users_history` VALUES ('170', '25', '5', '{\"op\":\"view\",\"id\":6,\"url\":\"http:\\/\\/192.168.75.99:85\\/product\\/?id=6\"}', '1451270538');
INSERT INTO `fx_users_history` VALUES ('171', '25', '5', '{\"op\":\"view\",\"id\":6,\"url\":\"http:\\/\\/192.168.75.99:85\\/product\\/?id=6\"}', '1451270550');
INSERT INTO `fx_users_history` VALUES ('172', '25', '5', '{\"op\":\"view\",\"id\":6,\"url\":\"http:\\/\\/192.168.75.99:85\\/product\\/?id=6\"}', '1451270581');
INSERT INTO `fx_users_history` VALUES ('173', '25', '5', '{\"op\":\"view\",\"id\":6,\"url\":\"http:\\/\\/192.168.75.99:85\\/product\\/?id=6\"}', '1451270587');
INSERT INTO `fx_users_history` VALUES ('174', '25', '5', '{\"op\":\"view\",\"id\":6,\"url\":\"http:\\/\\/192.168.75.99:85\\/product\\/?id=6\"}', '1451272529');
INSERT INTO `fx_users_history` VALUES ('175', '25', '5', '{\"op\":\"view\",\"id\":6,\"url\":\"http:\\/\\/192.168.75.99:85\\/product\\/?id=6\"}', '1451275110');
INSERT INTO `fx_users_history` VALUES ('176', '25', '5', '{\"op\":\"view\",\"id\":6,\"url\":\"http:\\/\\/192.168.75.99:85\\/product\\/?id=6\"}', '1451275114');
INSERT INTO `fx_users_history` VALUES ('177', '25', '5', '{\"op\":\"view\",\"id\":6,\"url\":\"http:\\/\\/192.168.75.99:85\\/product\\/?id=6\"}', '1451275454');
INSERT INTO `fx_users_history` VALUES ('178', '1', '5', '{\"op\":\"view\",\"id\":6,\"url\":\"http:\\/\\/192.168.75.99:85\\/product\\/?id=6\"}', '1451361478');
INSERT INTO `fx_users_history` VALUES ('179', '1', '5', '{\"op\":\"view\",\"id\":6,\"url\":\"http:\\/\\/192.168.75.99:85\\/product\\/?id=6\"}', '1451375259');
INSERT INTO `fx_users_history` VALUES ('180', '1', '5', '{\"op\":\"view\",\"id\":6,\"url\":\"http:\\/\\/192.168.75.99:85\\/product\\/?id=6\"}', '1451449368');
INSERT INTO `fx_users_history` VALUES ('181', '25', '5', '{\"op\":\"view\",\"id\":6,\"url\":\"http:\\/\\/m.wws.fxptp.com\\/product\\/?id=6\"}', '1451556331');
INSERT INTO `fx_users_history` VALUES ('182', '25', '5', '{\"op\":\"view\",\"id\":6,\"url\":\"http:\\/\\/m.wws.fxptp.com\\/product\\/?id=6\"}', '1451888113');
INSERT INTO `fx_users_history` VALUES ('183', '25', '5', '{\"op\":\"view\",\"id\":6,\"url\":\"http:\\/\\/m.wws.fxptp.com\\/product\\/?id=6\"}', '1451890747');
INSERT INTO `fx_users_history` VALUES ('184', '25', '5', '{\"op\":\"view\",\"id\":6,\"url\":\"http:\\/\\/m.wws.fxptp.com\\/product\\/?id=6\"}', '1451890785');
INSERT INTO `fx_users_history` VALUES ('185', '25', '5', '{\"op\":\"view\",\"id\":6,\"url\":\"http:\\/\\/m.wws.fxptp.com\\/product\\/?id=6\"}', '1451890792');
INSERT INTO `fx_users_history` VALUES ('186', '25', '5', '{\"op\":\"view\",\"id\":6,\"url\":\"http:\\/\\/m.wws.fxptp.com\\/product\\/?id=6\"}', '1451890920');
INSERT INTO `fx_users_history` VALUES ('187', '25', '5', '{\"op\":\"view\",\"id\":6,\"url\":\"http:\\/\\/m.wws.fxptp.com\\/product\\/?id=6\"}', '1451890993');
INSERT INTO `fx_users_history` VALUES ('188', '25', '5', '{\"op\":\"view\",\"id\":6,\"url\":\"http:\\/\\/m.wws.fxptp.com\\/product\\/?id=6\"}', '1451891054');
INSERT INTO `fx_users_history` VALUES ('189', '25', '5', '{\"op\":\"view\",\"id\":6,\"url\":\"http:\\/\\/m.wws.fxptp.com\\/product\\/?id=6\"}', '1451891059');
INSERT INTO `fx_users_history` VALUES ('190', '25', '5', '{\"op\":\"view\",\"id\":6,\"url\":\"http:\\/\\/m.wws.fxptp.com\\/product\\/?id=6\"}', '1451893103');
INSERT INTO `fx_users_history` VALUES ('191', '25', '5', '{\"op\":\"view\",\"id\":6,\"url\":\"http:\\/\\/m.wws.fxptp.com\\/product\\/?id=6\"}', '1451893259');
INSERT INTO `fx_users_history` VALUES ('192', '25', '5', '{\"op\":\"view\",\"id\":6,\"url\":\"http:\\/\\/m.wws.fxptp.com\\/product\\/?id=6\"}', '1451893301');
INSERT INTO `fx_users_history` VALUES ('193', '25', '5', '{\"op\":\"view\",\"id\":6,\"url\":\"http:\\/\\/m.wws.fxptp.com\\/product\\/?id=6\"}', '1451893326');
INSERT INTO `fx_users_history` VALUES ('194', '25', '5', '{\"op\":\"view\",\"id\":6,\"url\":\"http:\\/\\/m.wws.fxptp.com\\/product\\/?id=6\"}', '1451893347');
INSERT INTO `fx_users_history` VALUES ('195', '25', '5', '{\"op\":\"view\",\"id\":6,\"url\":\"http:\\/\\/m.wws.fxptp.com\\/product\\/?id=6\"}', '1451893357');
INSERT INTO `fx_users_history` VALUES ('196', '25', '5', '{\"op\":\"view\",\"id\":6,\"url\":\"http:\\/\\/m.wws.fxptp.com\\/product\\/?id=6\"}', '1451893382');
INSERT INTO `fx_users_history` VALUES ('197', '25', '5', '{\"op\":\"view\",\"id\":6,\"url\":\"http:\\/\\/m.wws.fxptp.com\\/product\\/?id=6\"}', '1451893406');
INSERT INTO `fx_users_history` VALUES ('198', '25', '5', '{\"op\":\"view\",\"id\":6,\"url\":\"http:\\/\\/m.wws.fxptp.com\\/product\\/?id=6\"}', '1451893465');
INSERT INTO `fx_users_history` VALUES ('199', '25', '5', '{\"op\":\"view\",\"id\":6,\"url\":\"http:\\/\\/m.wws.fxptp.com\\/product\\/?id=6\"}', '1451893467');
INSERT INTO `fx_users_history` VALUES ('200', '25', '5', '{\"op\":\"view\",\"id\":6,\"url\":\"http:\\/\\/m.wws.fxptp.com\\/product\\/?id=6\"}', '1451893493');
INSERT INTO `fx_users_history` VALUES ('201', '25', '5', '{\"op\":\"view\",\"id\":6,\"url\":\"http:\\/\\/m.wws.fxptp.com\\/product\\/?id=6\"}', '1451893494');
INSERT INTO `fx_users_history` VALUES ('202', '25', '5', '{\"op\":\"view\",\"id\":6,\"url\":\"http:\\/\\/m.wws.fxptp.com\\/product\\/?id=6\"}', '1451893515');
INSERT INTO `fx_users_history` VALUES ('203', '25', '5', '{\"op\":\"view\",\"id\":6,\"url\":\"http:\\/\\/m.wws.fxptp.com\\/product\\/?id=6\"}', '1451893516');
INSERT INTO `fx_users_history` VALUES ('204', '25', '5', '{\"op\":\"view\",\"id\":6,\"url\":\"http:\\/\\/m.wws.fxptp.com\\/product\\/?id=6\"}', '1451893535');
INSERT INTO `fx_users_history` VALUES ('205', '25', '5', '{\"op\":\"view\",\"id\":6,\"url\":\"http:\\/\\/m.wws.fxptp.com\\/product\\/?id=6\"}', '1451893541');
INSERT INTO `fx_users_history` VALUES ('206', '25', '5', '{\"op\":\"view\",\"id\":6,\"url\":\"http:\\/\\/m.wws.fxptp.com\\/product\\/?id=6\"}', '1451893549');
INSERT INTO `fx_users_history` VALUES ('207', '25', '5', '{\"op\":\"view\",\"id\":6,\"url\":\"http:\\/\\/m.wws.fxptp.com\\/product\\/?id=6\"}', '1451893682');
INSERT INTO `fx_users_history` VALUES ('208', '25', '5', '{\"op\":\"view\",\"id\":6,\"url\":\"http:\\/\\/m.wws.fxptp.com\\/product\\/?id=6\"}', '1451893689');
INSERT INTO `fx_users_history` VALUES ('209', '25', '5', '{\"op\":\"view\",\"id\":6,\"url\":\"http:\\/\\/m.wws.fxptp.com\\/product\\/?id=6\"}', '1451893725');
INSERT INTO `fx_users_history` VALUES ('210', '25', '5', '{\"op\":\"view\",\"id\":6,\"url\":\"http:\\/\\/m.wws.fxptp.com\\/product\\/?id=6\"}', '1451893731');
INSERT INTO `fx_users_history` VALUES ('211', '25', '5', '{\"op\":\"view\",\"id\":6,\"url\":\"http:\\/\\/m.wws.fxptp.com\\/product\\/?id=6\"}', '1451894587');
INSERT INTO `fx_users_history` VALUES ('212', '25', '5', '{\"op\":\"view\",\"id\":6,\"url\":\"http:\\/\\/m.wws.fxptp.com\\/product\\/?id=6\"}', '1451895556');
INSERT INTO `fx_users_history` VALUES ('213', '25', '5', '{\"op\":\"view\",\"id\":6,\"url\":\"http:\\/\\/m.wws.fxptp.com\\/product\\/?id=6\"}', '1451895593');
INSERT INTO `fx_users_history` VALUES ('214', '25', '5', '{\"op\":\"view\",\"id\":6,\"url\":\"http:\\/\\/m.wws.fxptp.com\\/product\\/?id=6\"}', '1451896263');
INSERT INTO `fx_users_history` VALUES ('215', '25', '5', '{\"op\":\"view\",\"id\":6,\"url\":\"http:\\/\\/wws.fxptp.com\\/product\\/?id=6\"}', '1451896297');
INSERT INTO `fx_users_history` VALUES ('216', '25', '5', '{\"op\":\"view\",\"id\":6,\"url\":\"http:\\/\\/m.wws.fxptp.com\\/product\\/?id=6\"}', '1451896325');
INSERT INTO `fx_users_history` VALUES ('217', '25', '5', '{\"op\":\"view\",\"id\":6,\"url\":\"http:\\/\\/m.wws.fxptp.com\\/product\\/?id=6\"}', '1451896430');
INSERT INTO `fx_users_history` VALUES ('218', '25', '5', '{\"op\":\"view\",\"id\":6,\"url\":\"http:\\/\\/m.wws.fxptp.com\\/product\\/?id=6\"}', '1451896443');
INSERT INTO `fx_users_history` VALUES ('219', '25', '5', '{\"op\":\"view\",\"id\":6,\"url\":\"http:\\/\\/m.wws.fxptp.com\\/product\\/?id=6\"}', '1451896448');
INSERT INTO `fx_users_history` VALUES ('220', '25', '5', '{\"op\":\"view\",\"id\":6,\"url\":\"http:\\/\\/m.wws.fxptp.com\\/product\\/?id=6\"}', '1451896449');
INSERT INTO `fx_users_history` VALUES ('221', '25', '5', '{\"op\":\"view\",\"id\":6,\"url\":\"http:\\/\\/m.wws.fxptp.com\\/product\\/?id=6\"}', '1451896482');
INSERT INTO `fx_users_history` VALUES ('222', '25', '5', '{\"op\":\"view\",\"id\":6,\"url\":\"http:\\/\\/m.wws.fxptp.com\\/product\\/?id=6\"}', '1451896531');
INSERT INTO `fx_users_history` VALUES ('223', '25', '5', '{\"op\":\"view\",\"id\":6,\"url\":\"http:\\/\\/m.wws.fxptp.com\\/product\\/?id=6\"}', '1451896587');
INSERT INTO `fx_users_history` VALUES ('224', '25', '5', '{\"op\":\"view\",\"id\":6,\"url\":\"http:\\/\\/m.wws.fxptp.com\\/product\\/?id=6\"}', '1451896602');
INSERT INTO `fx_users_history` VALUES ('225', '25', '5', '{\"op\":\"view\",\"id\":6,\"url\":\"http:\\/\\/m.wws.fxptp.com\\/product\\/?id=6\"}', '1451896619');
INSERT INTO `fx_users_history` VALUES ('226', '25', '5', '{\"op\":\"view\",\"id\":6,\"url\":\"http:\\/\\/m.wws.fxptp.com\\/product\\/?id=6\"}', '1451896647');
INSERT INTO `fx_users_history` VALUES ('227', '25', '5', '{\"op\":\"view\",\"id\":6,\"url\":\"http:\\/\\/m.wws.fxptp.com\\/product\\/?id=6\"}', '1451896686');
INSERT INTO `fx_users_history` VALUES ('228', '25', '5', '{\"op\":\"view\",\"id\":6,\"url\":\"http:\\/\\/m.wws.fxptp.com\\/product\\/?id=6\"}', '1451896687');
INSERT INTO `fx_users_history` VALUES ('229', '25', '5', '{\"op\":\"view\",\"id\":6,\"url\":\"http:\\/\\/m.wws.fxptp.com\\/product\\/?id=6\"}', '1451896693');
INSERT INTO `fx_users_history` VALUES ('230', '25', '5', '{\"op\":\"view\",\"id\":6,\"url\":\"http:\\/\\/m.wws.fxptp.com\\/product\\/?id=6\"}', '1451896701');
INSERT INTO `fx_users_history` VALUES ('231', '25', '5', '{\"op\":\"view\",\"id\":6,\"url\":\"http:\\/\\/m.wws.fxptp.com\\/product\\/?id=6\"}', '1451896709');
INSERT INTO `fx_users_history` VALUES ('232', '25', '5', '{\"op\":\"view\",\"id\":6,\"url\":\"http:\\/\\/m.wws.fxptp.com\\/product\\/?id=6\"}', '1451896716');
INSERT INTO `fx_users_history` VALUES ('233', '25', '5', '{\"op\":\"view\",\"id\":6,\"url\":\"http:\\/\\/m.wws.fxptp.com\\/product\\/?id=6\"}', '1451896724');
INSERT INTO `fx_users_history` VALUES ('234', '25', '5', '{\"op\":\"view\",\"id\":6,\"url\":\"http:\\/\\/m.wws.fxptp.com\\/product\\/?id=6\"}', '1451897250');
INSERT INTO `fx_users_history` VALUES ('235', '25', '5', '{\"op\":\"view\",\"id\":6,\"url\":\"http:\\/\\/m.wws.fxptp.com\\/product\\/?id=6\"}', '1451897269');
INSERT INTO `fx_users_history` VALUES ('236', '25', '5', '{\"op\":\"view\",\"id\":6,\"url\":\"http:\\/\\/m.wws.fxptp.com\\/product\\/?id=6\"}', '1451897595');
INSERT INTO `fx_users_history` VALUES ('237', '25', '5', '{\"op\":\"view\",\"id\":6,\"url\":\"http:\\/\\/m.wws.fxptp.com\\/product\\/?id=6\"}', '1451963016');
INSERT INTO `fx_users_history` VALUES ('238', '25', '5', '{\"op\":\"view\",\"id\":4,\"url\":\"http:\\/\\/m.wws.fxptp.com\\/product\\/?id=4\"}', '1451963179');
INSERT INTO `fx_users_history` VALUES ('239', '25', '5', '{\"op\":\"view\",\"id\":3,\"url\":\"http:\\/\\/m.wws.fxptp.com\\/product\\/?id=3\"}', '1451963182');
INSERT INTO `fx_users_history` VALUES ('240', '25', '5', '{\"op\":\"view\",\"id\":4,\"url\":\"http:\\/\\/m.wws.fxptp.com\\/product\\/?id=4\"}', '1451963188');
INSERT INTO `fx_users_history` VALUES ('241', '25', '5', '{\"op\":\"view\",\"id\":6,\"url\":\"http:\\/\\/m.wws.fxptp.com\\/product\\/?id=6\"}', '1451963190');
INSERT INTO `fx_users_history` VALUES ('242', '25', '5', '{\"op\":\"view\",\"id\":6,\"url\":\"http:\\/\\/m.wws.fxptp.com\\/product\\/?id=6\"}', '1451963310');
INSERT INTO `fx_users_history` VALUES ('243', '25', '5', '{\"op\":\"view\",\"id\":4,\"url\":\"http:\\/\\/m.wws.fxptp.com\\/product\\/?id=4\"}', '1451963317');
INSERT INTO `fx_users_history` VALUES ('244', '25', '5', '{\"op\":\"view\",\"id\":4,\"url\":\"http:\\/\\/m.wws.fxptp.com\\/product\\/?id=4\"}', '1451963493');
INSERT INTO `fx_users_history` VALUES ('245', '25', '5', '{\"op\":\"view\",\"id\":6,\"url\":\"http:\\/\\/m.wws.fxptp.com\\/product\\/?id=6\"}', '1451963802');
INSERT INTO `fx_users_history` VALUES ('246', '25', '5', '{\"op\":\"view\",\"id\":4,\"url\":\"http:\\/\\/m.wws.fxptp.com\\/product\\/?id=4\"}', '1451963805');
INSERT INTO `fx_users_history` VALUES ('247', '25', '5', '{\"op\":\"view\",\"id\":4,\"url\":\"http:\\/\\/m.wws.fxptp.com\\/product\\/?id=4\"}', '1451963838');
INSERT INTO `fx_users_history` VALUES ('248', '25', '5', '{\"op\":\"view\",\"id\":6,\"url\":\"http:\\/\\/m.wws.fxptp.com\\/product\\/?id=6\"}', '1451963847');
INSERT INTO `fx_users_history` VALUES ('249', '25', '5', '{\"op\":\"view\",\"id\":3,\"url\":\"http:\\/\\/m.wws.fxptp.com\\/product\\/?id=3\"}', '1451963850');
INSERT INTO `fx_users_history` VALUES ('250', '25', '5', '{\"op\":\"view\",\"id\":4,\"url\":\"http:\\/\\/m.wws.fxptp.com\\/product\\/?id=4\"}', '1451963853');
INSERT INTO `fx_users_history` VALUES ('251', '25', '5', '{\"op\":\"view\",\"id\":6,\"url\":\"http:\\/\\/m.wws.fxptp.com\\/product\\/?id=6\"}', '1451963862');
INSERT INTO `fx_users_history` VALUES ('252', '1', '5', '{\"op\":\"view\",\"id\":2,\"url\":\"http:\\/\\/192.168.75.99:85\\/product\\/?id=2\"}', '1452484679');
INSERT INTO `fx_users_history` VALUES ('253', '1', '5', '{\"op\":\"view\",\"id\":1,\"url\":\"http:\\/\\/192.168.75.99:85\\/product\\/?id=1\"}', '1452484681');
INSERT INTO `fx_users_history` VALUES ('254', '1', '5', '{\"op\":\"view\",\"id\":2,\"url\":\"http:\\/\\/192.168.75.99:85\\/product\\/?id=2\"}', '1452484682');
INSERT INTO `fx_users_history` VALUES ('255', '1', '5', '{\"op\":\"view\",\"id\":10,\"url\":\"http:\\/\\/192.168.75.99:85\\/product\\/?id=10\"}', '1452484686');
INSERT INTO `fx_users_history` VALUES ('256', '1', '5', '{\"op\":\"view\",\"id\":8,\"url\":\"http:\\/\\/192.168.75.99:85\\/product\\/?id=8\"}', '1452484687');
INSERT INTO `fx_users_history` VALUES ('257', '1', '5', '{\"op\":\"view\",\"id\":9,\"url\":\"http:\\/\\/192.168.75.99:85\\/product\\/?id=9\"}', '1452484688');
INSERT INTO `fx_users_history` VALUES ('258', '1', '5', '{\"op\":\"view\",\"id\":10,\"url\":\"http:\\/\\/192.168.75.99:85\\/product\\/?id=10\"}', '1452484689');
INSERT INTO `fx_users_history` VALUES ('259', '1', '5', '{\"op\":\"view\",\"id\":6,\"url\":\"http:\\/\\/192.168.75.99:85\\/product\\/?id=6\"}', '1452484692');
INSERT INTO `fx_users_history` VALUES ('260', '1', '5', '{\"op\":\"view\",\"id\":4,\"url\":\"http:\\/\\/192.168.75.99:85\\/product\\/?id=4\"}', '1452484695');
INSERT INTO `fx_users_history` VALUES ('261', '1', '5', '{\"op\":\"view\",\"id\":4,\"url\":\"http:\\/\\/192.168.75.99:85\\/product\\/?id=4\"}', '1452484708');
INSERT INTO `fx_users_history` VALUES ('262', '1', '5', '{\"op\":\"view\",\"id\":7,\"url\":\"http:\\/\\/192.168.75.99:85\\/product\\/?id=7\"}', '1452484712');
INSERT INTO `fx_users_history` VALUES ('263', '1', '5', '{\"op\":\"view\",\"id\":6,\"url\":\"http:\\/\\/192.168.75.99:85\\/product\\/?id=6\"}', '1452486460');
INSERT INTO `fx_users_history` VALUES ('264', '1', '5', '{\"op\":\"view\",\"id\":6,\"url\":\"http:\\/\\/192.168.75.99:85\\/product\\/?id=6\"}', '1452486463');
INSERT INTO `fx_users_history` VALUES ('265', '1', '5', '{\"op\":\"view\",\"id\":4,\"url\":\"http:\\/\\/192.168.75.99:85\\/product\\/?id=4\"}', '1452486464');
INSERT INTO `fx_users_history` VALUES ('266', '1', '5', '{\"op\":\"view\",\"id\":6,\"url\":\"http:\\/\\/192.168.75.99:85\\/product\\/?id=6\"}', '1452486736');
INSERT INTO `fx_users_history` VALUES ('267', '1', '5', '{\"op\":\"view\",\"id\":4,\"url\":\"http:\\/\\/192.168.75.99:85\\/product\\/?id=4\"}', '1452486738');
INSERT INTO `fx_users_history` VALUES ('268', '1', '5', '{\"op\":\"view\",\"id\":6,\"url\":\"http:\\/\\/192.168.75.99:85\\/product\\/?id=6\"}', '1452486767');
INSERT INTO `fx_users_history` VALUES ('269', '1', '5', '{\"op\":\"view\",\"id\":4,\"url\":\"http:\\/\\/192.168.75.99:85\\/product\\/?id=4\"}', '1452486769');
INSERT INTO `fx_users_history` VALUES ('270', '1', '5', '{\"op\":\"view\",\"id\":6,\"url\":\"http:\\/\\/192.168.75.99:85\\/product\\/?id=6\"}', '1452487261');
INSERT INTO `fx_users_history` VALUES ('271', '1', '5', '{\"op\":\"view\",\"id\":4,\"url\":\"http:\\/\\/192.168.75.99:85\\/product\\/?id=4\"}', '1452487262');
INSERT INTO `fx_users_history` VALUES ('272', '25', '5', '{\"op\":\"view\",\"id\":6,\"url\":\"http:\\/\\/wws.fxptp.com\\/product\\/?id=6\"}', '1452564868');
INSERT INTO `fx_users_history` VALUES ('273', '25', '5', '{\"op\":\"view\",\"id\":4,\"url\":\"http:\\/\\/wws.fxptp.com\\/product\\/?id=4\"}', '1452564870');
INSERT INTO `fx_users_history` VALUES ('274', '25', '5', '{\"op\":\"view\",\"id\":4,\"url\":\"http:\\/\\/wws.fxptp.com\\/product\\/?id=4\"}', '1452564904');
INSERT INTO `fx_users_history` VALUES ('275', '25', '5', '{\"op\":\"view\",\"id\":4,\"url\":\"http:\\/\\/wws.fxptp.com\\/product\\/?id=4\"}', '1452564953');
INSERT INTO `fx_users_history` VALUES ('276', '25', '5', '{\"op\":\"view\",\"id\":6,\"url\":\"http:\\/\\/wws.fxptp.com\\/product\\/?id=6\"}', '1452565170');
INSERT INTO `fx_users_history` VALUES ('277', '25', '5', '{\"op\":\"view\",\"id\":4,\"url\":\"http:\\/\\/wws.fxptp.com\\/product\\/?id=4\"}', '1452565172');
INSERT INTO `fx_users_history` VALUES ('278', '25', '5', '{\"op\":\"view\",\"id\":6,\"url\":\"http:\\/\\/m.wws.fxptp.com\\/product\\/?id=6\"}', '1452565416');
INSERT INTO `fx_users_history` VALUES ('279', '25', '5', '{\"op\":\"view\",\"id\":4,\"url\":\"http:\\/\\/m.wws.fxptp.com\\/product\\/?id=4\"}', '1452565419');
INSERT INTO `fx_users_history` VALUES ('280', '25', '5', '{\"op\":\"view\",\"id\":6,\"url\":\"http:\\/\\/m.wws.fxptp.com\\/product\\/?id=6\"}', '1452565656');
INSERT INTO `fx_users_history` VALUES ('281', '25', '5', '{\"op\":\"view\",\"id\":4,\"url\":\"http:\\/\\/m.wws.fxptp.com\\/product\\/?id=4\"}', '1452565659');
INSERT INTO `fx_users_history` VALUES ('282', '1', '5', '{\"op\":\"view\",\"id\":6,\"url\":\"http:\\/\\/192.168.75.99:85\\/product\\/?id=6\"}', '1452568529');
INSERT INTO `fx_users_history` VALUES ('283', '1', '5', '{\"op\":\"view\",\"id\":4,\"url\":\"http:\\/\\/192.168.75.99:85\\/product\\/?id=4\"}', '1452568531');
INSERT INTO `fx_users_history` VALUES ('284', '1', '5', '{\"op\":\"view\",\"id\":4,\"url\":\"http:\\/\\/192.168.75.99:85\\/product\\/?id=4\"}', '1452568645');
INSERT INTO `fx_users_history` VALUES ('285', '25', '5', '{\"op\":\"view\",\"id\":6,\"url\":\"http:\\/\\/wws.fxptp.com\\/product\\/?id=6\"}', '1452568680');
INSERT INTO `fx_users_history` VALUES ('286', '25', '5', '{\"op\":\"view\",\"id\":6,\"url\":\"http:\\/\\/wws.fxptp.com\\/product\\/?id=6\"}', '1452568823');
INSERT INTO `fx_users_history` VALUES ('287', '25', '5', '{\"op\":\"view\",\"id\":4,\"url\":\"http:\\/\\/wws.fxptp.com\\/product\\/?id=4\"}', '1452568825');
INSERT INTO `fx_users_history` VALUES ('288', '25', '5', '{\"op\":\"view\",\"id\":6,\"url\":\"http:\\/\\/wws.fxptp.com\\/product\\/?id=6\"}', '1452568942');
INSERT INTO `fx_users_history` VALUES ('289', '25', '5', '{\"op\":\"view\",\"id\":4,\"url\":\"http:\\/\\/wws.fxptp.com\\/product\\/?id=4\"}', '1452568943');
INSERT INTO `fx_users_history` VALUES ('290', '25', '5', '{\"op\":\"view\",\"id\":6,\"url\":\"http:\\/\\/wws.fxptp.com\\/product\\/?id=6\"}', '1452569024');
INSERT INTO `fx_users_history` VALUES ('291', '25', '5', '{\"op\":\"view\",\"id\":4,\"url\":\"http:\\/\\/wws.fxptp.com\\/product\\/?id=4\"}', '1452569026');
INSERT INTO `fx_users_history` VALUES ('292', '1', '5', '{\"op\":\"view\",\"id\":6,\"url\":\"http:\\/\\/192.168.75.99:85\\/product\\/?id=6\"}', '1452571758');
INSERT INTO `fx_users_history` VALUES ('293', '1', '5', '{\"op\":\"view\",\"id\":4,\"url\":\"http:\\/\\/192.168.75.99:85\\/product\\/?id=4\"}', '1452571760');
INSERT INTO `fx_users_history` VALUES ('294', '1', '5', '{\"op\":\"view\",\"id\":6,\"url\":\"http:\\/\\/192.168.75.99:85\\/product\\/?id=6\"}', '1452580524');
INSERT INTO `fx_users_history` VALUES ('295', '1', '5', '{\"op\":\"view\",\"id\":6,\"url\":\"http:\\/\\/192.168.75.99:85\\/product\\/?id=6\"}', '1452580539');
INSERT INTO `fx_users_history` VALUES ('296', '1', '5', '{\"op\":\"view\",\"id\":6,\"url\":\"http:\\/\\/192.168.75.99:85\\/product\\/?id=6\"}', '1452580591');
INSERT INTO `fx_users_history` VALUES ('297', '1', '5', '{\"op\":\"view\",\"id\":6,\"url\":\"http:\\/\\/192.168.75.99:85\\/product\\/?id=6\"}', '1452580733');
INSERT INTO `fx_users_history` VALUES ('298', '1', '5', '{\"op\":\"view\",\"id\":6,\"url\":\"http:\\/\\/192.168.75.99:85\\/product\\/?id=6\"}', '1452580776');
INSERT INTO `fx_users_history` VALUES ('299', '1', '5', '{\"op\":\"view\",\"id\":6,\"url\":\"http:\\/\\/192.168.75.99:85\\/product\\/?id=6\"}', '1452580878');
INSERT INTO `fx_users_history` VALUES ('300', '1', '5', '{\"op\":\"view\",\"id\":6,\"url\":\"http:\\/\\/192.168.75.99:85\\/product\\/?id=6\"}', '1452580884');
INSERT INTO `fx_users_history` VALUES ('301', '1', '5', '{\"op\":\"view\",\"id\":6,\"url\":\"http:\\/\\/192.168.75.99:85\\/product\\/?id=6\"}', '1452580935');
INSERT INTO `fx_users_history` VALUES ('302', '1', '5', '{\"op\":\"view\",\"id\":6,\"url\":\"http:\\/\\/192.168.75.99:85\\/product\\/?id=6\"}', '1452580956');
INSERT INTO `fx_users_history` VALUES ('303', '1', '5', '{\"op\":\"view\",\"id\":9,\"url\":\"http:\\/\\/192.168.75.99:85\\/product\\/?id=9\"}', '1452580989');
INSERT INTO `fx_users_history` VALUES ('304', '1', '5', '{\"op\":\"view\",\"id\":8,\"url\":\"http:\\/\\/192.168.75.99:85\\/product\\/?id=8\"}', '1452580990');
INSERT INTO `fx_users_history` VALUES ('305', '1', '5', '{\"op\":\"view\",\"id\":9,\"url\":\"http:\\/\\/192.168.75.99:85\\/product\\/?id=9\"}', '1452580991');
INSERT INTO `fx_users_history` VALUES ('306', '1', '5', '{\"op\":\"view\",\"id\":2,\"url\":\"http:\\/\\/192.168.75.99:85\\/product\\/?id=2\"}', '1452580995');
INSERT INTO `fx_users_history` VALUES ('307', '1', '5', '{\"op\":\"view\",\"id\":1,\"url\":\"http:\\/\\/192.168.75.99:85\\/product\\/?id=1\"}', '1452580997');
INSERT INTO `fx_users_history` VALUES ('308', '1', '5', '{\"op\":\"view\",\"id\":6,\"url\":\"http:\\/\\/192.168.75.99:85\\/product\\/?id=6\"}', '1452581413');
INSERT INTO `fx_users_history` VALUES ('309', '1', '5', '{\"op\":\"view\",\"id\":6,\"url\":\"http:\\/\\/192.168.75.99:85\\/product\\/?id=6\"}', '1452581529');
INSERT INTO `fx_users_history` VALUES ('310', '1', '5', '{\"op\":\"view\",\"id\":4,\"url\":\"http:\\/\\/192.168.75.99:85\\/product\\/?id=4\"}', '1452581543');
INSERT INTO `fx_users_history` VALUES ('311', '1', '5', '{\"op\":\"view\",\"id\":4,\"url\":\"http:\\/\\/192.168.75.99:85\\/product\\/?id=4\"}', '1452581560');
INSERT INTO `fx_users_history` VALUES ('312', '1', '5', '{\"op\":\"view\",\"id\":2,\"url\":\"http:\\/\\/192.168.75.99:85\\/product\\/?id=2\"}', '1452581577');
INSERT INTO `fx_users_history` VALUES ('313', '1', '5', '{\"op\":\"view\",\"id\":1,\"url\":\"http:\\/\\/192.168.75.99:85\\/product\\/?id=1\"}', '1452581579');
INSERT INTO `fx_users_history` VALUES ('314', '1', '5', '{\"op\":\"view\",\"id\":6,\"url\":\"http:\\/\\/192.168.75.99:85\\/product\\/?id=6\"}', '1452581650');
INSERT INTO `fx_users_history` VALUES ('315', '1', '5', '{\"op\":\"view\",\"id\":6,\"url\":\"http:\\/\\/192.168.75.99:85\\/product\\/?id=6\"}', '1452581665');
INSERT INTO `fx_users_history` VALUES ('316', '1', '5', '{\"op\":\"view\",\"id\":2,\"url\":\"http:\\/\\/192.168.75.99:85\\/product\\/?id=2\"}', '1452582671');
INSERT INTO `fx_users_history` VALUES ('317', '1', '5', '{\"op\":\"view\",\"id\":1,\"url\":\"http:\\/\\/192.168.75.99:85\\/product\\/?id=1\"}', '1452582675');
INSERT INTO `fx_users_history` VALUES ('318', '1', '5', '{\"op\":\"view\",\"id\":6,\"url\":\"http:\\/\\/192.168.75.99:85\\/product\\/?id=6\"}', '1452582768');
INSERT INTO `fx_users_history` VALUES ('319', '1', '5', '{\"op\":\"view\",\"id\":6,\"url\":\"http:\\/\\/192.168.75.99:85\\/product\\/?id=6\"}', '1452582773');
INSERT INTO `fx_users_history` VALUES ('320', '1', '5', '{\"op\":\"view\",\"id\":4,\"url\":\"http:\\/\\/192.168.75.99:85\\/product\\/?id=4\"}', '1452582776');
INSERT INTO `fx_users_history` VALUES ('321', '1', '5', '{\"op\":\"view\",\"id\":3,\"url\":\"http:\\/\\/192.168.75.99:85\\/product\\/?id=3\"}', '1452582778');
INSERT INTO `fx_users_history` VALUES ('322', '1', '5', '{\"op\":\"view\",\"id\":9,\"url\":\"http:\\/\\/192.168.75.99:85\\/product\\/?id=9\"}', '1452582782');
INSERT INTO `fx_users_history` VALUES ('323', '1', '5', '{\"op\":\"view\",\"id\":8,\"url\":\"http:\\/\\/192.168.75.99:85\\/product\\/?id=8\"}', '1452582783');
INSERT INTO `fx_users_history` VALUES ('324', '1', '5', '{\"op\":\"view\",\"id\":9,\"url\":\"http:\\/\\/192.168.75.99:85\\/product\\/?id=9\"}', '1452582784');
INSERT INTO `fx_users_history` VALUES ('325', '1', '5', '{\"op\":\"view\",\"id\":2,\"url\":\"http:\\/\\/192.168.75.99:85\\/product\\/?id=2\"}', '1452582790');
INSERT INTO `fx_users_history` VALUES ('326', '1', '5', '{\"op\":\"view\",\"id\":1,\"url\":\"http:\\/\\/192.168.75.99:85\\/product\\/?id=1\"}', '1452582791');
INSERT INTO `fx_users_history` VALUES ('327', '1', '5', '{\"op\":\"view\",\"id\":7,\"url\":\"http:\\/\\/192.168.75.99:85\\/product\\/?id=7\"}', '1452582796');
INSERT INTO `fx_users_history` VALUES ('328', '1', '5', '{\"op\":\"view\",\"id\":6,\"url\":\"http:\\/\\/192.168.75.99:85\\/product\\/?id=6\"}', '1452583254');
INSERT INTO `fx_users_history` VALUES ('329', '1', '5', '{\"op\":\"view\",\"id\":6,\"url\":\"http:\\/\\/192.168.75.99:85\\/product\\/?id=6\"}', '1452595917');
INSERT INTO `fx_users_history` VALUES ('330', '1', '5', '{\"op\":\"view\",\"id\":2,\"url\":\"http:\\/\\/192.168.75.99:85\\/product\\/?id=2\"}', '1452596818');
INSERT INTO `fx_users_history` VALUES ('331', '1', '5', '{\"op\":\"view\",\"id\":4,\"url\":\"http:\\/\\/192.168.75.99:85\\/product\\/?id=4\"}', '1452596924');
INSERT INTO `fx_users_history` VALUES ('332', '1', '5', '{\"op\":\"view\",\"id\":7,\"url\":\"http:\\/\\/192.168.75.99:85\\/product\\/?id=7\"}', '1452596929');
INSERT INTO `fx_users_history` VALUES ('333', '1', '5', '{\"op\":\"view\",\"id\":6,\"url\":\"http:\\/\\/192.168.75.99:85\\/product\\/?id=6\"}', '1452649577');
INSERT INTO `fx_users_history` VALUES ('334', '1', '5', '{\"op\":\"view\",\"id\":6,\"url\":\"http:\\/\\/192.168.75.99:85\\/product\\/?id=6\"}', '1452651678');
INSERT INTO `fx_users_history` VALUES ('335', '1', '5', '{\"op\":\"view\",\"id\":6,\"url\":\"http:\\/\\/192.168.75.99:85\\/product\\/?id=6\"}', '1452656558');
INSERT INTO `fx_users_history` VALUES ('336', '1', '5', '{\"op\":\"view\",\"id\":6,\"url\":\"http:\\/\\/192.168.75.99:85\\/product\\/?id=6\"}', '1452755893');
INSERT INTO `fx_users_history` VALUES ('337', '1', '5', '{\"op\":\"view\",\"id\":4,\"url\":\"http:\\/\\/192.168.75.99:85\\/product\\/?id=4\"}', '1452765988');
INSERT INTO `fx_users_history` VALUES ('338', '1', '5', '{\"op\":\"view\",\"id\":1,\"url\":\"http:\\/\\/192.168.75.99:85\\/product\\/?id=1\"}', '1452765991');
INSERT INTO `fx_users_history` VALUES ('339', '1', '5', '{\"op\":\"view\",\"id\":6,\"url\":\"http:\\/\\/wws.fxptp.com\\/product\\/?id=6\"}', '1452830910');
INSERT INTO `fx_users_history` VALUES ('340', '1', '5', '{\"op\":\"view\",\"id\":4,\"url\":\"http:\\/\\/wws.fxptp.com\\/product\\/?id=4\"}', '1452830929');
INSERT INTO `fx_users_history` VALUES ('341', '1', '5', '{\"op\":\"view\",\"id\":3,\"url\":\"http:\\/\\/wws.fxptp.com\\/product\\/?id=3\"}', '1452830930');
INSERT INTO `fx_users_history` VALUES ('342', '1', '5', '{\"op\":\"view\",\"id\":4,\"url\":\"http:\\/\\/wws.fxptp.com\\/product\\/?id=4\"}', '1452830931');
INSERT INTO `fx_users_history` VALUES ('343', '1', '5', '{\"op\":\"view\",\"id\":6,\"url\":\"http:\\/\\/wws.fxptp.com\\/product\\/?id=6\"}', '1452830932');
INSERT INTO `fx_users_history` VALUES ('344', '1', '5', '{\"op\":\"view\",\"id\":4,\"url\":\"http:\\/\\/wws.fxptp.com\\/product\\/?id=4\"}', '1452830934');
INSERT INTO `fx_users_history` VALUES ('345', '1', '5', '{\"op\":\"view\",\"id\":3,\"url\":\"http:\\/\\/wws.fxptp.com\\/product\\/?id=3\"}', '1452830935');
INSERT INTO `fx_users_history` VALUES ('346', '1', '5', '{\"op\":\"view\",\"id\":6,\"url\":\"http:\\/\\/wws.fxptp.com\\/product\\/?id=6\"}', '1452830936');
INSERT INTO `fx_users_history` VALUES ('347', '1', '5', '{\"op\":\"view\",\"id\":1,\"url\":\"http:\\/\\/wws.fxptp.com\\/product\\/?id=1\"}', '1452831415');
INSERT INTO `fx_users_history` VALUES ('348', '1', '5', '{\"op\":\"view\",\"id\":1,\"url\":\"http:\\/\\/wws.fxptp.com\\/product\\/?id=1\"}', '1452831415');
INSERT INTO `fx_users_history` VALUES ('349', '1', '5', '{\"op\":\"view\",\"id\":4,\"url\":\"http:\\/\\/wws.fxptp.com\\/product\\/?id=4\"}', '1452831439');
INSERT INTO `fx_users_history` VALUES ('350', '1', '5', '{\"op\":\"view\",\"id\":6,\"url\":\"http:\\/\\/wws.fxptp.com\\/product\\/?id=6\"}', '1452832134');
INSERT INTO `fx_users_history` VALUES ('351', '1', '5', '{\"op\":\"view\",\"id\":6,\"url\":\"http:\\/\\/192.168.75.99:85\\/product\\/?id=6\"}', '1452845725');
INSERT INTO `fx_users_history` VALUES ('352', '1', '5', '{\"op\":\"view\",\"id\":6,\"url\":\"http:\\/\\/192.168.75.99:85\\/product\\/?id=6\"}', '1452845943');
INSERT INTO `fx_users_history` VALUES ('353', '1', '5', '{\"op\":\"view\",\"id\":6,\"url\":\"http:\\/\\/192.168.75.99:85\\/product\\/?id=6\"}', '1452846136');
INSERT INTO `fx_users_history` VALUES ('354', '1', '5', '{\"op\":\"view\",\"id\":6,\"url\":\"http:\\/\\/192.168.75.99:85\\/product\\/?id=6\"}', '1452846137');
INSERT INTO `fx_users_history` VALUES ('355', '1', '5', '{\"op\":\"view\",\"id\":6,\"url\":\"http:\\/\\/192.168.75.99:85\\/product\\/?id=6\"}', '1452846140');
INSERT INTO `fx_users_history` VALUES ('356', '1', '5', '{\"op\":\"view\",\"id\":6,\"url\":\"http:\\/\\/192.168.75.99:85\\/product\\/?id=6\"}', '1452846148');
INSERT INTO `fx_users_history` VALUES ('357', '1', '5', '{\"op\":\"view\",\"id\":6,\"url\":\"http:\\/\\/192.168.75.99:85\\/product\\/?id=6\"}', '1452846171');
INSERT INTO `fx_users_history` VALUES ('358', '1', '5', '{\"op\":\"view\",\"id\":6,\"url\":\"http:\\/\\/192.168.75.99:85\\/product\\/?id=6\"}', '1452846172');
INSERT INTO `fx_users_history` VALUES ('359', '1', '5', '{\"op\":\"view\",\"id\":6,\"url\":\"http:\\/\\/192.168.75.99:85\\/product\\/?id=6\"}', '1452846193');
INSERT INTO `fx_users_history` VALUES ('360', '1', '5', '{\"op\":\"view\",\"id\":6,\"url\":\"http:\\/\\/192.168.75.99:85\\/product\\/?id=6\"}', '1452846194');
INSERT INTO `fx_users_history` VALUES ('361', '1', '5', '{\"op\":\"view\",\"id\":6,\"url\":\"http:\\/\\/192.168.75.99:85\\/product\\/?id=6\"}', '1452846224');
INSERT INTO `fx_users_history` VALUES ('362', '1', '5', '{\"op\":\"view\",\"id\":6,\"url\":\"http:\\/\\/192.168.75.99:85\\/product\\/?id=6\"}', '1452846225');
INSERT INTO `fx_users_history` VALUES ('363', '1', '5', '{\"op\":\"view\",\"id\":6,\"url\":\"http:\\/\\/192.168.75.99:85\\/product\\/?id=6\"}', '1452846236');
INSERT INTO `fx_users_history` VALUES ('364', '1', '5', '{\"op\":\"view\",\"id\":7,\"url\":\"http:\\/\\/192.168.75.99:85\\/product\\/?id=7\"}', '1452852127');
INSERT INTO `fx_users_history` VALUES ('365', '1', '5', '{\"op\":\"view\",\"id\":6,\"url\":\"http:\\/\\/192.168.75.99:85\\/product\\/?id=6\"}', '1452852460');
INSERT INTO `fx_users_history` VALUES ('366', '25', '5', '{\"op\":\"view\",\"id\":4,\"url\":\"http:\\/\\/192.168.75.99:85\\/product\\/?id=4\"}', '1453086562');
INSERT INTO `fx_users_history` VALUES ('367', '25', '5', '{\"op\":\"view\",\"id\":4,\"url\":\"http:\\/\\/192.168.75.99:85\\/product\\/?id=4\"}', '1453086565');
INSERT INTO `fx_users_history` VALUES ('368', '25', '5', '{\"op\":\"view\",\"id\":6,\"url\":\"http:\\/\\/192.168.75.99:85\\/product\\/?id=6\"}', '1453086569');
INSERT INTO `fx_users_history` VALUES ('369', '25', '5', '{\"op\":\"view\",\"id\":6,\"url\":\"http:\\/\\/192.168.75.99:85\\/product\\/?id=6\"}', '1453086572');
INSERT INTO `fx_users_history` VALUES ('370', '25', '5', '{\"op\":\"view\",\"id\":6,\"url\":\"http:\\/\\/192.168.75.99:85\\/product\\/?id=6\"}', '1453086572');
INSERT INTO `fx_users_history` VALUES ('371', '25', '5', '{\"op\":\"view\",\"id\":6,\"url\":\"http:\\/\\/192.168.75.99:85\\/product\\/?id=6\"}', '1453086573');
INSERT INTO `fx_users_history` VALUES ('372', '25', '5', '{\"op\":\"view\",\"id\":6,\"url\":\"http:\\/\\/192.168.75.99:85\\/product\\/?id=6\"}', '1453086574');
INSERT INTO `fx_users_history` VALUES ('373', '25', '5', '{\"op\":\"view\",\"id\":6,\"url\":\"http:\\/\\/192.168.75.99:85\\/product\\/?id=6\"}', '1453086574');
INSERT INTO `fx_users_history` VALUES ('374', '25', '5', '{\"op\":\"view\",\"id\":6,\"url\":\"http:\\/\\/192.168.75.99:85\\/product\\/?id=6\"}', '1453086575');
INSERT INTO `fx_users_history` VALUES ('375', '25', '5', '{\"op\":\"view\",\"id\":7,\"url\":\"http:\\/\\/192.168.75.99:85\\/product\\/?id=7\"}', '1453086994');
INSERT INTO `fx_users_history` VALUES ('376', '25', '5', '{\"op\":\"view\",\"id\":4,\"url\":\"http:\\/\\/192.168.75.99:85\\/product\\/?id=4\"}', '1453093530');
INSERT INTO `fx_users_history` VALUES ('377', '25', '5', '{\"op\":\"view\",\"id\":9,\"url\":\"http:\\/\\/wws.fxptp.com\\/product\\/?id=9\"}', '1453093796');
INSERT INTO `fx_users_history` VALUES ('378', '25', '5', '{\"op\":\"view\",\"id\":4,\"url\":\"http:\\/\\/192.168.75.99:85\\/product\\/?id=4\"}', '1453094223');
INSERT INTO `fx_users_history` VALUES ('379', '25', '5', '{\"op\":\"view\",\"id\":4,\"url\":\"http:\\/\\/192.168.75.99:85\\/product\\/?id=4\"}', '1453094233');
INSERT INTO `fx_users_history` VALUES ('380', '25', '5', '{\"op\":\"view\",\"id\":4,\"url\":\"http:\\/\\/192.168.75.99:85\\/product\\/?id=4\"}', '1453094235');
INSERT INTO `fx_users_history` VALUES ('381', '25', '5', '{\"op\":\"view\",\"id\":9,\"url\":\"http:\\/\\/wws.fxptp.com\\/product\\/?id=9\"}', '1453096321');
INSERT INTO `fx_users_history` VALUES ('382', '25', '5', '{\"op\":\"view\",\"id\":6,\"url\":\"http:\\/\\/192.168.75.99:85\\/product\\/?id=6\"}', '1453098266');
INSERT INTO `fx_users_history` VALUES ('383', '25', '5', '{\"op\":\"view\",\"id\":6,\"url\":\"http:\\/\\/192.168.75.99:85\\/product\\/?id=6\"}', '1453098276');
INSERT INTO `fx_users_history` VALUES ('384', '25', '5', '{\"op\":\"view\",\"id\":9,\"url\":\"http:\\/\\/wws.fxptp.com\\/product\\/?id=9\"}', '1453106691');
INSERT INTO `fx_users_history` VALUES ('385', '25', '5', '{\"op\":\"view\",\"id\":8,\"url\":\"http:\\/\\/wws.fxptp.com\\/product\\/?id=8\"}', '1453106695');
INSERT INTO `fx_users_history` VALUES ('386', '25', '5', '{\"op\":\"view\",\"id\":9,\"url\":\"http:\\/\\/wws.fxptp.com\\/product\\/?id=9\"}', '1453106697');
INSERT INTO `fx_users_history` VALUES ('387', '25', '5', '{\"op\":\"view\",\"id\":6,\"url\":\"http:\\/\\/wws.fxptp.com\\/product\\/?id=6\"}', '1453106699');
INSERT INTO `fx_users_history` VALUES ('388', '25', '5', '{\"op\":\"view\",\"id\":6,\"url\":\"http:\\/\\/wws.fxptp.com\\/product\\/?id=6\"}', '1453106917');
INSERT INTO `fx_users_history` VALUES ('389', '25', '5', '{\"op\":\"view\",\"id\":6,\"url\":\"http:\\/\\/wws.fxptp.com\\/product\\/?id=6\"}', '1453106922');
INSERT INTO `fx_users_history` VALUES ('390', '25', '5', '{\"op\":\"view\",\"id\":6,\"url\":\"http:\\/\\/wws.fxptp.com\\/product\\/?id=6\"}', '1453106938');
INSERT INTO `fx_users_history` VALUES ('391', '25', '5', '{\"op\":\"view\",\"id\":6,\"url\":\"http:\\/\\/wws.fxptp.com\\/product\\/?id=6\"}', '1453106958');
INSERT INTO `fx_users_history` VALUES ('392', '25', '5', '{\"op\":\"view\",\"id\":6,\"url\":\"http:\\/\\/wws.fxptp.com\\/product\\/?id=6\"}', '1453106982');
INSERT INTO `fx_users_history` VALUES ('393', '25', '5', '{\"op\":\"view\",\"id\":6,\"url\":\"http:\\/\\/wws.fxptp.com\\/product\\/?id=6\"}', '1453106994');
INSERT INTO `fx_users_history` VALUES ('394', '25', '5', '{\"op\":\"view\",\"id\":6,\"url\":\"http:\\/\\/wws.fxptp.com\\/product\\/?id=6\"}', '1453107017');
INSERT INTO `fx_users_history` VALUES ('395', '1', '5', '{\"op\":\"view\",\"id\":6,\"url\":\"http:\\/\\/192.168.75.99:85\\/product\\/?id=6\"}', '1453107586');
INSERT INTO `fx_users_history` VALUES ('396', '1', '5', '{\"op\":\"view\",\"id\":6,\"url\":\"http:\\/\\/192.168.75.99:85\\/product\\/?id=6\"}', '1453109276');
INSERT INTO `fx_users_history` VALUES ('397', '1', '5', '{\"op\":\"view\",\"id\":6,\"url\":\"http:\\/\\/192.168.75.99:85\\/product\\/?id=6\"}', '1453109308');
INSERT INTO `fx_users_history` VALUES ('398', '1', '5', '{\"op\":\"view\",\"id\":6,\"url\":\"http:\\/\\/192.168.75.99:85\\/product\\/?id=6\"}', '1453109309');
INSERT INTO `fx_users_history` VALUES ('399', '1', '5', '{\"op\":\"view\",\"id\":6,\"url\":\"http:\\/\\/192.168.75.99:85\\/product\\/?id=6\"}', '1453109326');
INSERT INTO `fx_users_history` VALUES ('400', '1', '5', '{\"op\":\"view\",\"id\":6,\"url\":\"http:\\/\\/192.168.75.99:85\\/product\\/?id=6\"}', '1453109329');
INSERT INTO `fx_users_history` VALUES ('401', '1', '5', '{\"op\":\"view\",\"id\":6,\"url\":\"http:\\/\\/192.168.75.99:85\\/product\\/?id=6\"}', '1453109331');
INSERT INTO `fx_users_history` VALUES ('402', '1', '5', '{\"op\":\"view\",\"id\":6,\"url\":\"http:\\/\\/192.168.75.99:85\\/product\\/?id=6\"}', '1453109334');
INSERT INTO `fx_users_history` VALUES ('403', '1', '5', '{\"op\":\"view\",\"id\":6,\"url\":\"http:\\/\\/192.168.75.99:85\\/product\\/?id=6\"}', '1453109352');
INSERT INTO `fx_users_history` VALUES ('404', '1', '5', '{\"op\":\"view\",\"id\":6,\"url\":\"http:\\/\\/192.168.75.99:85\\/product\\/?id=6\"}', '1453109353');
INSERT INTO `fx_users_history` VALUES ('405', '1', '5', '{\"op\":\"view\",\"id\":6,\"url\":\"http:\\/\\/192.168.75.99:85\\/product\\/?id=6\"}', '1453109391');
INSERT INTO `fx_users_history` VALUES ('406', '1', '5', '{\"op\":\"view\",\"id\":6,\"url\":\"http:\\/\\/192.168.75.99:85\\/product\\/?id=6\"}', '1453109416');
INSERT INTO `fx_users_history` VALUES ('407', '1', '5', '{\"op\":\"view\",\"id\":6,\"url\":\"http:\\/\\/192.168.75.99:85\\/product\\/?id=6\"}', '1453109424');
INSERT INTO `fx_users_history` VALUES ('408', '1', '5', '{\"op\":\"view\",\"id\":6,\"url\":\"http:\\/\\/192.168.75.99:85\\/product\\/?id=6\"}', '1453109442');
INSERT INTO `fx_users_history` VALUES ('409', '1', '5', '{\"op\":\"view\",\"id\":6,\"url\":\"http:\\/\\/192.168.75.99:86\\/product\\/?id=6\"}', '1453109995');
INSERT INTO `fx_users_history` VALUES ('410', '1', '5', '{\"op\":\"view\",\"id\":6,\"url\":\"http:\\/\\/192.168.75.99:85\\/product\\/?id=6\"}', '1453110902');
INSERT INTO `fx_users_history` VALUES ('411', '1', '5', '{\"op\":\"view\",\"id\":6,\"url\":\"http:\\/\\/192.168.75.99:85\\/product\\/?id=6\"}', '1453110903');
INSERT INTO `fx_users_history` VALUES ('412', '1', '5', '{\"op\":\"view\",\"id\":6,\"url\":\"http:\\/\\/192.168.75.99:85\\/product\\/?id=6\"}', '1453110941');
INSERT INTO `fx_users_history` VALUES ('413', '1', '5', '{\"op\":\"view\",\"id\":6,\"url\":\"http:\\/\\/192.168.75.99:85\\/product\\/?id=6\"}', '1453110955');
INSERT INTO `fx_users_history` VALUES ('414', '1', '5', '{\"op\":\"view\",\"id\":6,\"url\":\"http:\\/\\/192.168.75.99:85\\/product\\/?id=6\"}', '1453110959');
INSERT INTO `fx_users_history` VALUES ('415', '1', '5', '{\"op\":\"view\",\"id\":6,\"url\":\"http:\\/\\/192.168.75.99:85\\/product\\/?id=6\"}', '1453111006');
INSERT INTO `fx_users_history` VALUES ('416', '1', '5', '{\"op\":\"view\",\"id\":6,\"url\":\"http:\\/\\/192.168.75.99:85\\/product\\/?id=6\"}', '1453111095');
INSERT INTO `fx_users_history` VALUES ('417', '1', '5', '{\"op\":\"view\",\"id\":6,\"url\":\"http:\\/\\/192.168.75.99:85\\/product\\/?id=6\"}', '1453111096');
INSERT INTO `fx_users_history` VALUES ('418', '1', '5', '{\"op\":\"view\",\"id\":6,\"url\":\"http:\\/\\/192.168.75.99:85\\/product\\/?id=6\"}', '1453111107');
INSERT INTO `fx_users_history` VALUES ('419', '1', '5', '{\"op\":\"view\",\"id\":6,\"url\":\"http:\\/\\/192.168.75.99:85\\/product\\/?id=6\"}', '1453111413');
INSERT INTO `fx_users_history` VALUES ('420', '1', '5', '{\"op\":\"view\",\"id\":6,\"url\":\"http:\\/\\/192.168.75.99:85\\/product\\/?id=6\"}', '1453111420');
INSERT INTO `fx_users_history` VALUES ('421', '1', '5', '{\"op\":\"view\",\"id\":6,\"url\":\"http:\\/\\/192.168.75.99:85\\/product\\/?id=6\"}', '1453111451');
INSERT INTO `fx_users_history` VALUES ('422', '1', '5', '{\"op\":\"view\",\"id\":6,\"url\":\"http:\\/\\/192.168.75.99:85\\/product\\/?id=6\"}', '1453111484');
INSERT INTO `fx_users_history` VALUES ('423', '1', '5', '{\"op\":\"view\",\"id\":6,\"url\":\"http:\\/\\/192.168.75.99:85\\/product\\/?id=6\"}', '1453111508');
INSERT INTO `fx_users_history` VALUES ('424', '1', '5', '{\"op\":\"view\",\"id\":6,\"url\":\"http:\\/\\/192.168.75.99:85\\/product\\/?id=6\"}', '1453112692');
INSERT INTO `fx_users_history` VALUES ('425', '1', '5', '{\"op\":\"view\",\"id\":2,\"url\":\"http:\\/\\/192.168.75.99:85\\/product\\/?id=2\"}', '1453112751');
INSERT INTO `fx_users_history` VALUES ('426', '1', '5', '{\"op\":\"view\",\"id\":6,\"url\":\"http:\\/\\/192.168.75.99:85\\/product\\/?id=6\"}', '1453112763');
INSERT INTO `fx_users_history` VALUES ('427', '1', '5', '{\"op\":\"view\",\"id\":6,\"url\":\"http:\\/\\/192.168.75.99:85\\/product\\/?id=6\"}', '1453112773');
INSERT INTO `fx_users_history` VALUES ('428', '1', '5', '{\"op\":\"view\",\"id\":6,\"url\":\"http:\\/\\/192.168.75.99:85\\/product\\/?id=6\"}', '1453112915');
INSERT INTO `fx_users_history` VALUES ('429', '1', '5', '{\"op\":\"view\",\"id\":9,\"url\":\"http:\\/\\/192.168.75.99:85\\/product\\/?id=9\"}', '1453112955');
INSERT INTO `fx_users_history` VALUES ('430', '1', '5', '{\"op\":\"view\",\"id\":6,\"url\":\"http:\\/\\/192.168.75.99:85\\/product\\/?id=6\"}', '1453112958');
INSERT INTO `fx_users_history` VALUES ('431', '1', '5', '{\"op\":\"view\",\"id\":9,\"url\":\"http:\\/\\/192.168.75.99:85\\/product\\/?id=9\"}', '1453112960');
INSERT INTO `fx_users_history` VALUES ('432', '1', '5', '{\"op\":\"view\",\"id\":8,\"url\":\"http:\\/\\/192.168.75.99:85\\/product\\/?id=8\"}', '1453112963');
INSERT INTO `fx_users_history` VALUES ('433', '1', '5', '{\"op\":\"view\",\"id\":2,\"url\":\"http:\\/\\/192.168.75.99:85\\/product\\/?id=2\"}', '1453112968');
INSERT INTO `fx_users_history` VALUES ('434', '1', '5', '{\"op\":\"view\",\"id\":1,\"url\":\"http:\\/\\/192.168.75.99:85\\/product\\/?id=1\"}', '1453112970');
INSERT INTO `fx_users_history` VALUES ('435', '25', '5', '{\"op\":\"view\",\"id\":6,\"url\":\"http:\\/\\/192.168.75.99:85\\/product\\/?id=6\"}', '1453166986');
INSERT INTO `fx_users_history` VALUES ('436', '25', '5', '{\"op\":\"view\",\"id\":6,\"url\":\"http:\\/\\/192.168.75.99:85\\/product\\/?id=6\"}', '1453167013');
INSERT INTO `fx_users_history` VALUES ('437', '25', '5', '{\"op\":\"view\",\"id\":6,\"url\":\"http:\\/\\/192.168.75.99:85\\/product\\/?id=6\"}', '1453167525');
INSERT INTO `fx_users_history` VALUES ('438', '25', '5', '{\"op\":\"view\",\"id\":6,\"url\":\"http:\\/\\/192.168.75.99:85\\/product\\/?id=6\"}', '1453167608');
INSERT INTO `fx_users_history` VALUES ('439', '25', '5', '{\"op\":\"view\",\"id\":6,\"url\":\"http:\\/\\/192.168.75.99:85\\/product\\/?id=6\"}', '1453167615');
INSERT INTO `fx_users_history` VALUES ('440', '25', '5', '{\"op\":\"view\",\"id\":6,\"url\":\"http:\\/\\/192.168.75.99:85\\/product\\/?id=6\"}', '1453167650');
INSERT INTO `fx_users_history` VALUES ('441', '25', '5', '{\"op\":\"view\",\"id\":6,\"url\":\"http:\\/\\/192.168.75.99:85\\/product\\/?id=6\"}', '1453167651');
INSERT INTO `fx_users_history` VALUES ('442', '25', '5', '{\"op\":\"view\",\"id\":9,\"url\":\"http:\\/\\/192.168.75.99:85\\/product\\/?id=9\"}', '1453167659');
INSERT INTO `fx_users_history` VALUES ('443', '25', '5', '{\"op\":\"view\",\"id\":6,\"url\":\"http:\\/\\/192.168.75.99:85\\/product\\/?id=6\"}', '1453169442');
INSERT INTO `fx_users_history` VALUES ('444', '25', '5', '{\"op\":\"view\",\"id\":6,\"url\":\"http:\\/\\/192.168.75.99:85\\/product\\/?id=6\"}', '1453169474');
INSERT INTO `fx_users_history` VALUES ('445', '25', '5', '{\"op\":\"view\",\"id\":6,\"url\":\"http:\\/\\/192.168.75.99:85\\/product\\/?id=6\"}', '1453169475');
INSERT INTO `fx_users_history` VALUES ('446', '25', '5', '{\"op\":\"view\",\"id\":6,\"url\":\"http:\\/\\/192.168.75.99:85\\/product\\/?id=6\"}', '1453169476');
INSERT INTO `fx_users_history` VALUES ('447', '25', '5', '{\"op\":\"view\",\"id\":6,\"url\":\"http:\\/\\/192.168.75.99:85\\/product\\/?id=6\"}', '1453169476');
INSERT INTO `fx_users_history` VALUES ('448', '25', '5', '{\"op\":\"view\",\"id\":6,\"url\":\"http:\\/\\/192.168.75.99:85\\/product\\/?id=6\"}', '1453169495');
INSERT INTO `fx_users_history` VALUES ('449', '25', '5', '{\"op\":\"view\",\"id\":6,\"url\":\"http:\\/\\/192.168.75.99:85\\/product\\/?id=6\"}', '1453169496');
INSERT INTO `fx_users_history` VALUES ('450', '25', '5', '{\"op\":\"view\",\"id\":6,\"url\":\"http:\\/\\/192.168.75.99:85\\/product\\/?id=6\"}', '1453169502');
INSERT INTO `fx_users_history` VALUES ('451', '25', '5', '{\"op\":\"view\",\"id\":6,\"url\":\"http:\\/\\/192.168.75.99:85\\/product\\/?id=6\"}', '1453169909');
INSERT INTO `fx_users_history` VALUES ('452', '25', '5', '{\"op\":\"view\",\"id\":6,\"url\":\"http:\\/\\/192.168.75.99:85\\/product\\/?id=6\"}', '1453169929');
INSERT INTO `fx_users_history` VALUES ('453', '25', '5', '{\"op\":\"view\",\"id\":6,\"url\":\"http:\\/\\/192.168.75.99:85\\/product\\/?id=6\"}', '1453169980');
INSERT INTO `fx_users_history` VALUES ('454', '25', '5', '{\"op\":\"view\",\"id\":6,\"url\":\"http:\\/\\/192.168.75.99:85\\/product\\/?id=6\"}', '1453170040');
INSERT INTO `fx_users_history` VALUES ('455', '25', '5', '{\"op\":\"view\",\"id\":6,\"url\":\"http:\\/\\/192.168.75.99:85\\/product\\/?id=6\"}', '1453170597');
INSERT INTO `fx_users_history` VALUES ('456', '25', '5', '{\"op\":\"view\",\"id\":6,\"url\":\"http:\\/\\/192.168.75.99:85\\/product\\/?id=6\"}', '1453170630');
INSERT INTO `fx_users_history` VALUES ('457', '25', '5', '{\"op\":\"view\",\"id\":6,\"url\":\"http:\\/\\/192.168.75.99:85\\/product\\/?id=6\"}', '1453171189');
INSERT INTO `fx_users_history` VALUES ('458', '25', '5', '{\"op\":\"view\",\"id\":6,\"url\":\"http:\\/\\/192.168.75.99:85\\/product\\/?id=6\"}', '1453171230');
INSERT INTO `fx_users_history` VALUES ('459', '25', '5', '{\"op\":\"view\",\"id\":9,\"url\":\"http:\\/\\/192.168.75.99:85\\/product\\/?id=9\"}', '1453171353');
INSERT INTO `fx_users_history` VALUES ('460', '25', '5', '{\"op\":\"view\",\"id\":2,\"url\":\"http:\\/\\/192.168.75.99:85\\/product\\/?id=2\"}', '1453171362');
INSERT INTO `fx_users_history` VALUES ('461', '25', '5', '{\"op\":\"view\",\"id\":6,\"url\":\"http:\\/\\/192.168.75.99:85\\/product\\/?id=6\"}', '1453173139');
INSERT INTO `fx_users_history` VALUES ('462', '25', '5', '{\"op\":\"view\",\"id\":6,\"url\":\"http:\\/\\/192.168.75.99:85\\/product\\/?id=6\"}', '1453173294');
INSERT INTO `fx_users_history` VALUES ('463', '25', '5', '{\"op\":\"view\",\"id\":9,\"url\":\"http:\\/\\/192.168.75.99:85\\/product\\/?id=9\"}', '1453173297');
INSERT INTO `fx_users_history` VALUES ('464', '25', '5', '{\"op\":\"view\",\"id\":2,\"url\":\"http:\\/\\/192.168.75.99:85\\/product\\/?id=2\"}', '1453173305');
INSERT INTO `fx_users_history` VALUES ('465', '25', '5', '{\"op\":\"view\",\"id\":2,\"url\":\"http:\\/\\/192.168.75.99:85\\/product\\/?id=2\"}', '1453173381');
INSERT INTO `fx_users_history` VALUES ('466', '25', '5', '{\"op\":\"view\",\"id\":2,\"url\":\"http:\\/\\/192.168.75.99:85\\/product\\/?id=2\"}', '1453173381');
INSERT INTO `fx_users_history` VALUES ('467', '25', '5', '{\"op\":\"view\",\"id\":2,\"url\":\"http:\\/\\/192.168.75.99:85\\/product\\/?id=2\"}', '1453173381');
INSERT INTO `fx_users_history` VALUES ('468', '25', '5', '{\"op\":\"view\",\"id\":2,\"url\":\"http:\\/\\/192.168.75.99:85\\/product\\/?id=2\"}', '1453173381');
INSERT INTO `fx_users_history` VALUES ('469', '25', '5', '{\"op\":\"view\",\"id\":2,\"url\":\"http:\\/\\/192.168.75.99:85\\/product\\/?id=2\"}', '1453173381');
INSERT INTO `fx_users_history` VALUES ('470', '25', '5', '{\"op\":\"view\",\"id\":2,\"url\":\"http:\\/\\/192.168.75.99:85\\/product\\/?id=2\"}', '1453173381');
INSERT INTO `fx_users_history` VALUES ('471', '25', '5', '{\"op\":\"view\",\"id\":2,\"url\":\"http:\\/\\/192.168.75.99:85\\/product\\/?id=2\"}', '1453173381');
INSERT INTO `fx_users_history` VALUES ('472', '25', '5', '{\"op\":\"view\",\"id\":2,\"url\":\"http:\\/\\/192.168.75.99:85\\/product\\/?id=2\"}', '1453173386');
INSERT INTO `fx_users_history` VALUES ('473', '25', '5', '{\"op\":\"view\",\"id\":2,\"url\":\"http:\\/\\/192.168.75.99:85\\/product\\/?id=2\"}', '1453173387');
INSERT INTO `fx_users_history` VALUES ('474', '25', '5', '{\"op\":\"view\",\"id\":2,\"url\":\"http:\\/\\/192.168.75.99:85\\/product\\/?id=2\"}', '1453173387');
INSERT INTO `fx_users_history` VALUES ('475', '25', '5', '{\"op\":\"view\",\"id\":2,\"url\":\"http:\\/\\/192.168.75.99:85\\/product\\/?id=2\"}', '1453173387');
INSERT INTO `fx_users_history` VALUES ('476', '25', '5', '{\"op\":\"view\",\"id\":2,\"url\":\"http:\\/\\/192.168.75.99:85\\/product\\/?id=2\"}', '1453173387');
INSERT INTO `fx_users_history` VALUES ('477', '25', '5', '{\"op\":\"view\",\"id\":2,\"url\":\"http:\\/\\/192.168.75.99:85\\/product\\/?id=2\"}', '1453173387');
INSERT INTO `fx_users_history` VALUES ('478', '25', '5', '{\"op\":\"view\",\"id\":2,\"url\":\"http:\\/\\/192.168.75.99:85\\/product\\/?id=2\"}', '1453173387');
INSERT INTO `fx_users_history` VALUES ('479', '25', '5', '{\"op\":\"view\",\"id\":2,\"url\":\"http:\\/\\/192.168.75.99:85\\/product\\/?id=2\"}', '1453173387');
INSERT INTO `fx_users_history` VALUES ('480', '25', '5', '{\"op\":\"view\",\"id\":2,\"url\":\"http:\\/\\/192.168.75.99:85\\/product\\/?id=2\"}', '1453173387');
INSERT INTO `fx_users_history` VALUES ('481', '25', '5', '{\"op\":\"view\",\"id\":2,\"url\":\"http:\\/\\/192.168.75.99:85\\/product\\/?id=2\"}', '1453173388');
INSERT INTO `fx_users_history` VALUES ('482', '25', '5', '{\"op\":\"view\",\"id\":2,\"url\":\"http:\\/\\/192.168.75.99:85\\/product\\/?id=2\"}', '1453173389');
INSERT INTO `fx_users_history` VALUES ('483', '25', '5', '{\"op\":\"view\",\"id\":2,\"url\":\"http:\\/\\/192.168.75.99:85\\/product\\/?id=2\"}', '1453173390');
INSERT INTO `fx_users_history` VALUES ('484', '25', '5', '{\"op\":\"view\",\"id\":2,\"url\":\"http:\\/\\/192.168.75.99:85\\/product\\/?id=2\"}', '1453173391');
INSERT INTO `fx_users_history` VALUES ('485', '25', '5', '{\"op\":\"view\",\"id\":2,\"url\":\"http:\\/\\/192.168.75.99:85\\/product\\/?id=2\"}', '1453173393');
INSERT INTO `fx_users_history` VALUES ('486', '25', '5', '{\"op\":\"view\",\"id\":2,\"url\":\"http:\\/\\/192.168.75.99:85\\/product\\/?id=2\"}', '1453173394');
INSERT INTO `fx_users_history` VALUES ('487', '25', '5', '{\"op\":\"view\",\"id\":2,\"url\":\"http:\\/\\/192.168.75.99:85\\/product\\/?id=2\"}', '1453173403');
INSERT INTO `fx_users_history` VALUES ('488', '25', '5', '{\"op\":\"view\",\"id\":2,\"url\":\"http:\\/\\/192.168.75.99:85\\/product\\/?id=2\"}', '1453173404');
INSERT INTO `fx_users_history` VALUES ('489', '25', '5', '{\"op\":\"view\",\"id\":2,\"url\":\"http:\\/\\/192.168.75.99:85\\/product\\/?id=2\"}', '1453173681');
INSERT INTO `fx_users_history` VALUES ('490', '25', '5', '{\"op\":\"view\",\"id\":9,\"url\":\"http:\\/\\/192.168.75.99:85\\/product\\/?id=9\"}', '1453173685');
INSERT INTO `fx_users_history` VALUES ('491', '25', '5', '{\"op\":\"view\",\"id\":6,\"url\":\"http:\\/\\/192.168.75.99:85\\/product\\/?id=6\"}', '1453173692');
INSERT INTO `fx_users_history` VALUES ('492', '1', '5', '{\"op\":\"view\",\"id\":9,\"url\":\"http:\\/\\/192.168.75.99:86\\/product\\/?id=9\"}', '1453173915');
INSERT INTO `fx_users_history` VALUES ('493', '1', '5', '{\"op\":\"view\",\"id\":9,\"url\":\"http:\\/\\/192.168.75.99:86\\/product\\/?id=9\"}', '1453173942');
INSERT INTO `fx_users_history` VALUES ('494', '1', '5', '{\"op\":\"view\",\"id\":9,\"url\":\"http:\\/\\/192.168.75.99:86\\/product\\/?id=9\"}', '1453173943');
INSERT INTO `fx_users_history` VALUES ('495', '1', '5', '{\"op\":\"view\",\"id\":9,\"url\":\"http:\\/\\/192.168.75.99:86\\/product\\/?id=9\"}', '1453173989');
INSERT INTO `fx_users_history` VALUES ('496', '1', '5', '{\"op\":\"view\",\"id\":6,\"url\":\"http:\\/\\/192.168.75.99:86\\/product\\/?id=6\"}', '1453174007');
INSERT INTO `fx_users_history` VALUES ('497', '1', '5', '{\"op\":\"view\",\"id\":6,\"url\":\"http:\\/\\/192.168.75.99:86\\/product\\/?id=6\"}', '1453174038');
INSERT INTO `fx_users_history` VALUES ('498', '1', '5', '{\"op\":\"view\",\"id\":6,\"url\":\"http:\\/\\/192.168.75.99:86\\/product\\/?id=6\"}', '1453174040');
INSERT INTO `fx_users_history` VALUES ('499', '1', '5', '{\"op\":\"view\",\"id\":2,\"url\":\"http:\\/\\/192.168.75.99:86\\/product\\/?id=2\"}', '1453174069');
INSERT INTO `fx_users_history` VALUES ('500', '1', '5', '{\"op\":\"view\",\"id\":6,\"url\":\"http:\\/\\/192.168.75.99:86\\/product\\/?id=6\"}', '1453174092');
INSERT INTO `fx_users_history` VALUES ('501', '1', '5', '{\"op\":\"view\",\"id\":6,\"url\":\"http:\\/\\/192.168.75.99:86\\/product\\/?id=6\"}', '1453174185');
INSERT INTO `fx_users_history` VALUES ('502', '1', '5', '{\"op\":\"view\",\"id\":6,\"url\":\"http:\\/\\/192.168.75.99:86\\/product\\/?id=6\"}', '1453174196');
INSERT INTO `fx_users_history` VALUES ('503', '25', '5', '{\"op\":\"view\",\"id\":9,\"url\":\"http:\\/\\/wws.fxptp.com\\/product\\/?id=9\"}', '1453174201');
INSERT INTO `fx_users_history` VALUES ('504', '25', '5', '{\"op\":\"view\",\"id\":8,\"url\":\"http:\\/\\/wws.fxptp.com\\/product\\/?id=8\"}', '1453174203');
INSERT INTO `fx_users_history` VALUES ('505', '25', '5', '{\"op\":\"view\",\"id\":9,\"url\":\"http:\\/\\/wws.fxptp.com\\/product\\/?id=9\"}', '1453174205');
INSERT INTO `fx_users_history` VALUES ('506', '25', '5', '{\"op\":\"view\",\"id\":8,\"url\":\"http:\\/\\/wws.fxptp.com\\/product\\/?id=8\"}', '1453174205');
INSERT INTO `fx_users_history` VALUES ('507', '25', '5', '{\"op\":\"view\",\"id\":6,\"url\":\"http:\\/\\/192.168.75.99:85\\/product\\/?id=6\"}', '1453174644');

-- ----------------------------
-- Table structure for fx_users_level
-- ----------------------------
DROP TABLE IF EXISTS `fx_users_level`;
CREATE TABLE `fx_users_level` (
  `id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(10) NOT NULL COMMENT '级别名称',
  `need_pnum` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '达到该级别所需购买的商品数',
  `need_bnum` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '达到该级别所需支付金额数',
  `exp_days` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '有效期（天）数',
  `discount` float(3,2) unsigned NOT NULL DEFAULT '1.00' COMMENT '该级别享有的折扣',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of fx_users_level
-- ----------------------------
INSERT INTO `fx_users_level` VALUES ('1', '普通用户', '0', '0', '0', '1.00');
INSERT INTO `fx_users_level` VALUES ('2', '银卡用户', '100', '10000', '180', '0.90');
INSERT INTO `fx_users_level` VALUES ('3', '金卡用户', '300', '30000', '180', '0.85');
INSERT INTO `fx_users_level` VALUES ('4', '钻石用户', '600', '60000', '180', '0.70');

-- ----------------------------
-- Table structure for fx_users_support
-- ----------------------------
DROP TABLE IF EXISTS `fx_users_support`;
CREATE TABLE `fx_users_support` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_code` varchar(10) NOT NULL COMMENT '用户编号',
  `product_skus` varchar(500) DEFAULT NULL COMMENT '产品SKU，多个时用英文逗号分开',
  `content` text COMMENT '申请内容',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  PRIMARY KEY (`id`),
  KEY `user_code` (`user_code`),
  KEY `create_time` (`create_time`),
  CONSTRAINT `fx_users_support_ibfk_1` FOREIGN KEY (`user_code`) REFERENCES `fx_users` (`user_code`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of fx_users_support
-- ----------------------------
INSERT INTO `fx_users_support` VALUES ('1', 'A1001', '000001', 'testtetssdfsdfd', '1445616000');
