/*
Navicat MySQL Data Transfer

Source Server         : localhost-pms
Source Server Version : 50505
Source Host           : localhost:3306
Source Database       : bbjx

Target Server Type    : MYSQL
Target Server Version : 50505
File Encoding         : 65001

Date: 2021-04-13 18:14:49
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for bbjx_cart
-- ----------------------------
DROP TABLE IF EXISTS `bbjx_cart`;
CREATE TABLE `bbjx_cart` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `openid` varchar(40) NOT NULL,
  `product_id` int(11) DEFAULT NULL,
  `count` int(11) DEFAULT NULL,
  `create_time` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bbjx_cart
-- ----------------------------
INSERT INTO `bbjx_cart` VALUES ('1', 'omGBq5C2WbNa2SStdhmsJ5fcSu_k', '26', '4', '2021-04-09 15:14:59.000000');
INSERT INTO `bbjx_cart` VALUES ('2', 'omGBq5C2WbNa2SStdhmsJ5fcSu_k', '27', '4', '2021-04-09 15:21:31.000000');
INSERT INTO `bbjx_cart` VALUES ('3', 'omGBq5C2WbNa2SStdhmsJ5fcSu_k', '33', '1', '2021-04-09 18:00:21.000000');
INSERT INTO `bbjx_cart` VALUES ('4', '', '30', '1', '2021-04-09 18:34:59.000000');
INSERT INTO `bbjx_cart` VALUES ('5', '', '29', '1', '2021-04-09 18:56:44.000000');
INSERT INTO `bbjx_cart` VALUES ('6', 'omGBq5C2WbNa2SStdhmsJ5fcSu_k', '28', '1', '2021-04-09 18:56:53.000000');
INSERT INTO `bbjx_cart` VALUES ('7', 'omGBq5C2WbNa2SStdhmsJ5fcSu_k', '36', '1', '2021-04-09 18:57:00.000000');
INSERT INTO `bbjx_cart` VALUES ('8', 'omGBq5C2WbNa2SStdhmsJ5fcSu_k', '41', '1', '2021-04-09 18:57:05.000000');
INSERT INTO `bbjx_cart` VALUES ('9', 'omGBq5C2WbNa2SStdhmsJ5fcSu_k', '39', '3', '2021-04-09 18:57:10.000000');
INSERT INTO `bbjx_cart` VALUES ('10', 'omGBq5C2WbNa2SStdhmsJ5fcSu_k', '40', '1', '2021-04-12 19:11:40.000000');

-- ----------------------------
-- Table structure for bbjx_category
-- ----------------------------
DROP TABLE IF EXISTS `bbjx_category`;
CREATE TABLE `bbjx_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '类别Id',
  `parent_id` int(11) DEFAULT NULL COMMENT '父类别id当id=0时说明是根节点,一级类别',
  `name` varchar(50) DEFAULT NULL COMMENT '类别名称',
  `img` varchar(255) DEFAULT NULL,
  `status` tinyint(1) DEFAULT 1 COMMENT '类别状态1-正常,2-已废弃',
  `sort_order` int(11) NOT NULL DEFAULT 0 COMMENT '排序编号,同类展示顺序,数值相等则自然排序',
  `create_time` datetime DEFAULT current_timestamp() COMMENT '创建时间',
  `update_time` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=100034 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bbjx_category
-- ----------------------------
INSERT INTO `bbjx_category` VALUES ('100001', '0', '家用电器', 'https://img.alicdn.com/imgextra/i3/22250511/O1CN01AkHT5R1Fe53rLFYU1_!!0-saturn_solar.jpg_468x468q75.jpg_.webp', '1', '0', '2000-03-25 16:46:00', '2021-04-03 15:36:16');
INSERT INTO `bbjx_category` VALUES ('100002', '0', '数码3C', 'https://img.alicdn.com/imgextra/i3/22250511/O1CN01AkHT5R1Fe53rLFYU1_!!0-saturn_solar.jpg_468x468q75.jpg_.webp', '1', '0', '2000-03-25 16:46:21', '2021-04-03 15:36:16');
INSERT INTO `bbjx_category` VALUES ('100003', '0', '服装箱包', 'https://img.alicdn.com/imgextra/i3/22250511/O1CN01AkHT5R1Fe53rLFYU1_!!0-saturn_solar.jpg_468x468q75.jpg_.webp', '1', '0', '2000-03-25 16:49:53', '2021-04-03 15:36:16');
INSERT INTO `bbjx_category` VALUES ('100004', '0', '食品生鲜', 'https://img.alicdn.com/imgextra/i3/22250511/O1CN01AkHT5R1Fe53rLFYU1_!!0-saturn_solar.jpg_468x468q75.jpg_.webp', '1', '0', '2000-03-25 16:50:19', '2021-04-03 15:36:16');
INSERT INTO `bbjx_category` VALUES ('100005', '0', '酒水饮料', 'https://img.alicdn.com/imgextra/i3/22250511/O1CN01AkHT5R1Fe53rLFYU1_!!0-saturn_solar.jpg_468x468q75.jpg_.webp', '1', '1', '2000-03-25 16:50:29', '2021-04-03 15:36:16');
INSERT INTO `bbjx_category` VALUES ('100006', '100001', '冰箱', 'https://img.alicdn.com/imgextra/i3/22250511/O1CN01AkHT5R1Fe53rLFYU1_!!0-saturn_solar.jpg_468x468q75.jpg_.webp', '1', '0', '2000-03-25 16:52:15', '2021-04-03 15:22:21');
INSERT INTO `bbjx_category` VALUES ('100007', '100001', '电视', 'https://img.alicdn.com/imgextra/i3/22250511/O1CN01AkHT5R1Fe53rLFYU1_!!0-saturn_solar.jpg_468x468q75.jpg_.webp', '1', '0', '2000-03-25 16:52:26', '2021-04-03 15:22:25');
INSERT INTO `bbjx_category` VALUES ('100008', '100001', '洗衣机', 'https://img.alicdn.com/imgextra/i3/22250511/O1CN01AkHT5R1Fe53rLFYU1_!!0-saturn_solar.jpg_468x468q75.jpg_.webp', '1', '0', '2000-03-25 16:52:39', '2021-04-03 15:22:28');
INSERT INTO `bbjx_category` VALUES ('100009', '100001', '空调', 'https://img.alicdn.com/imgextra/i3/22250511/O1CN01AkHT5R1Fe53rLFYU1_!!0-saturn_solar.jpg_468x468q75.jpg_.webp', '1', '0', '2000-03-25 16:52:45', '2021-04-03 15:30:04');
INSERT INTO `bbjx_category` VALUES ('100010', '100001', '电热水器', 'https://img.alicdn.com/imgextra/i3/22250511/O1CN01AkHT5R1Fe53rLFYU1_!!0-saturn_solar.jpg_468x468q75.jpg_.webp', '1', '0', '2000-03-25 16:52:54', '2021-04-03 15:36:16');
INSERT INTO `bbjx_category` VALUES ('100011', '100002', '电脑', 'https://img.alicdn.com/imgextra/i3/22250511/O1CN01AkHT5R1Fe53rLFYU1_!!0-saturn_solar.jpg_468x468q75.jpg_.webp', '1', '1', '2000-03-25 16:53:18', '2021-04-03 15:36:16');
INSERT INTO `bbjx_category` VALUES ('100012', '100002', '手机', 'https://img.alicdn.com/imgextra/i3/22250511/O1CN01AkHT5R1Fe53rLFYU1_!!0-saturn_solar.jpg_468x468q75.jpg_.webp', '1', '0', '2000-03-25 16:53:27', '2021-04-03 15:36:16');
INSERT INTO `bbjx_category` VALUES ('100013', '100002', '平板电脑', 'https://img.alicdn.com/imgextra/i3/22250511/O1CN01AkHT5R1Fe53rLFYU1_!!0-saturn_solar.jpg_468x468q75.jpg_.webp', '1', '0', '2000-03-25 16:53:35', '2021-04-03 15:36:16');
INSERT INTO `bbjx_category` VALUES ('100014', '100002', '数码相机', 'https://img.alicdn.com/imgextra/i3/22250511/O1CN01AkHT5R1Fe53rLFYU1_!!0-saturn_solar.jpg_468x468q75.jpg_.webp', '1', '0', '2000-03-25 16:53:56', '2021-04-03 15:36:16');
INSERT INTO `bbjx_category` VALUES ('100015', '100002', '3C配件', 'https://img.alicdn.com/imgextra/i3/22250511/O1CN01AkHT5R1Fe53rLFYU1_!!0-saturn_solar.jpg_468x468q75.jpg_.webp', '1', '0', '2000-03-25 16:54:07', '2021-04-03 15:36:16');
INSERT INTO `bbjx_category` VALUES ('100016', '100003', '女装', 'https://img.alicdn.com/imgextra/i3/22250511/O1CN01AkHT5R1Fe53rLFYU1_!!0-saturn_solar.jpg_468x468q75.jpg_.webp', '1', '0', '2000-03-25 16:54:44', '2021-04-03 15:36:16');
INSERT INTO `bbjx_category` VALUES ('100017', '100003', '帽子', 'https://img.alicdn.com/imgextra/i3/22250511/O1CN01AkHT5R1Fe53rLFYU1_!!0-saturn_solar.jpg_468x468q75.jpg_.webp', '1', '0', '2000-03-25 16:54:51', '2021-04-03 15:36:16');
INSERT INTO `bbjx_category` VALUES ('100018', '100003', '旅行箱', 'https://img.alicdn.com/imgextra/i3/22250511/O1CN01AkHT5R1Fe53rLFYU1_!!0-saturn_solar.jpg_468x468q75.jpg_.webp', '1', '0', '2000-03-25 16:55:02', '2021-04-03 15:36:16');
INSERT INTO `bbjx_category` VALUES ('100019', '100003', '手提包', 'https://img.alicdn.com/imgextra/i3/22250511/O1CN01AkHT5R1Fe53rLFYU1_!!0-saturn_solar.jpg_468x468q75.jpg_.webp', '1', '0', '2000-03-25 16:55:09', '2021-04-03 15:36:16');
INSERT INTO `bbjx_category` VALUES ('100020', '100003', '保暖内衣', 'https://img.alicdn.com/imgextra/i3/22250511/O1CN01AkHT5R1Fe53rLFYU1_!!0-saturn_solar.jpg_468x468q75.jpg_.webp', '1', '0', '2000-03-25 16:55:18', '2021-04-03 15:36:16');
INSERT INTO `bbjx_category` VALUES ('100021', '100004', '零食', 'https://img.alicdn.com/imgextra/i3/22250511/O1CN01AkHT5R1Fe53rLFYU1_!!0-saturn_solar.jpg_468x468q75.jpg_.webp', '1', '0', '2000-03-25 16:55:30', '2021-04-03 15:36:16');
INSERT INTO `bbjx_category` VALUES ('100022', '100004', '生鲜', 'https://img.alicdn.com/imgextra/i3/22250511/O1CN01AkHT5R1Fe53rLFYU1_!!0-saturn_solar.jpg_468x468q75.jpg_.webp', '1', '0', '2000-03-25 16:55:37', '2021-04-03 15:36:16');
INSERT INTO `bbjx_category` VALUES ('100023', '100004', '半成品菜', 'https://img.alicdn.com/imgextra/i3/22250511/O1CN01AkHT5R1Fe53rLFYU1_!!0-saturn_solar.jpg_468x468q75.jpg_.webp', '1', '0', '2000-03-25 16:55:47', '2021-04-03 15:36:16');
INSERT INTO `bbjx_category` VALUES ('100024', '100004', '速冻食品', 'https://img.alicdn.com/imgextra/i3/22250511/O1CN01AkHT5R1Fe53rLFYU1_!!0-saturn_solar.jpg_468x468q75.jpg_.webp', '1', '0', '2000-03-25 16:55:56', '2021-04-03 15:36:16');
INSERT INTO `bbjx_category` VALUES ('100025', '100004', '进口食品', 'https://img.alicdn.com/imgextra/i3/22250511/O1CN01AkHT5R1Fe53rLFYU1_!!0-saturn_solar.jpg_468x468q75.jpg_.webp', '1', '0', '2000-03-25 16:56:06', '2021-04-03 15:36:16');
INSERT INTO `bbjx_category` VALUES ('100026', '100005', '白酒', 'https://img.alicdn.com/imgextra/i3/22250511/O1CN01AkHT5R1Fe53rLFYU1_!!0-saturn_solar.jpg_468x468q75.jpg_.webp', '1', '0', '2000-03-25 16:56:22', '2021-04-03 15:36:16');
INSERT INTO `bbjx_category` VALUES ('100027', '100005', '红酒', 'https://img.alicdn.com/imgextra/i3/22250511/O1CN01AkHT5R1Fe53rLFYU1_!!0-saturn_solar.jpg_468x468q75.jpg_.webp', '1', '0', '2000-03-25 16:56:30', '2021-04-03 15:36:16');
INSERT INTO `bbjx_category` VALUES ('100028', '100005', '饮料', 'https://img.alicdn.com/imgextra/i3/22250511/O1CN01AkHT5R1Fe53rLFYU1_!!0-saturn_solar.jpg_468x468q75.jpg_.webp', '1', '0', '2000-03-25 16:56:37', '2021-04-03 15:36:16');
INSERT INTO `bbjx_category` VALUES ('100029', '100005', '调制鸡尾酒', 'https://img.alicdn.com/imgextra/i3/22250511/O1CN01AkHT5R1Fe53rLFYU1_!!0-saturn_solar.jpg_468x468q75.jpg_.webp', '1', '0', '2000-03-25 16:56:45', '2021-04-03 15:36:16');
INSERT INTO `bbjx_category` VALUES ('100030', '100005', '进口洋酒', 'https://img.alicdn.com/imgextra/i3/22250511/O1CN01AkHT5R1Fe53rLFYU1_!!0-saturn_solar.jpg_468x468q75.jpg_.webp', '1', '0', '2000-03-25 16:57:05', '2021-04-03 15:36:16');
INSERT INTO `bbjx_category` VALUES ('100031', null, null, 'https://img.alicdn.com/imgextra/i3/22250511/O1CN01AkHT5R1Fe53rLFYU1_!!0-saturn_solar.jpg_468x468q75.jpg_.webp', '1', '0', '2021-04-03 15:28:18', '2021-04-03 15:28:18');
INSERT INTO `bbjx_category` VALUES ('100032', null, null, 'https://img.alicdn.com/imgextra/i3/22250511/O1CN01AkHT5R1Fe53rLFYU1_!!0-saturn_solar.jpg_468x468q75.jpg_.webp', '1', '0', '2021-04-03 15:29:14', '2021-04-03 15:29:14');
INSERT INTO `bbjx_category` VALUES ('100033', null, null, 'https://img.alicdn.com/imgextra/i3/22250511/O1CN01AkHT5R1Fe53rLFYU1_!!0-saturn_solar.jpg_468x468q75.jpg_.webp', '1', '0', '2021-04-03 15:33:56', '2021-04-03 15:33:56');

-- ----------------------------
-- Table structure for bbjx_order
-- ----------------------------
DROP TABLE IF EXISTS `bbjx_order`;
CREATE TABLE `bbjx_order` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '订单id',
  `order_no` bigint(20) DEFAULT NULL COMMENT '订单号',
  `openid` varchar(40) DEFAULT '' COMMENT '用户id',
  `shipping_id` int(11) DEFAULT NULL,
  `payment` decimal(20,2) DEFAULT NULL COMMENT '实际付款金额,单位是元,保留两位小数',
  `payment_type` int(11) DEFAULT NULL COMMENT '支付类型,1-在线支付',
  `postage` int(11) DEFAULT NULL COMMENT '运费,单位是元',
  `status` int(11) DEFAULT NULL COMMENT '订单状态:0-已取消-10-未付款，20-已付款，40-已发货，50-交易成功，60-交易关闭',
  `payment_time` datetime DEFAULT NULL COMMENT '支付时间',
  `send_time` datetime DEFAULT NULL COMMENT '发货时间',
  `end_time` datetime DEFAULT NULL COMMENT '交易完成时间',
  `close_time` datetime DEFAULT NULL COMMENT '交易关闭时间',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `order_no_index` (`order_no`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bbjx_order
-- ----------------------------

-- ----------------------------
-- Table structure for bbjx_order_item
-- ----------------------------
DROP TABLE IF EXISTS `bbjx_order_item`;
CREATE TABLE `bbjx_order_item` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '订单子表id',
  `openid` varchar(40) DEFAULT '',
  `order_no` bigint(20) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL COMMENT '商品id',
  `product_name` varchar(100) DEFAULT NULL COMMENT '商品名称',
  `product_image` varchar(500) DEFAULT NULL COMMENT '商品图片地址',
  `current_unit_price` decimal(20,2) DEFAULT NULL COMMENT '生成订单时的商品单价，单位是元,保留两位小数',
  `quantity` int(11) DEFAULT NULL COMMENT '商品数量',
  `total_price` decimal(20,2) DEFAULT NULL COMMENT '商品总价,单位是元,保留两位小数',
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `order_no_index` (`order_no`) USING BTREE,
  KEY `order_no_user_id_index` (`openid`,`order_no`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bbjx_order_item
-- ----------------------------

-- ----------------------------
-- Table structure for bbjx_pay_info
-- ----------------------------
DROP TABLE IF EXISTS `bbjx_pay_info`;
CREATE TABLE `bbjx_pay_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL COMMENT '用户id',
  `order_no` bigint(20) NOT NULL COMMENT '订单号',
  `pay_platform` int(11) DEFAULT NULL COMMENT '支付平台:1-支付宝,2-微信',
  `platform_number` varchar(200) DEFAULT NULL COMMENT '支付流水号',
  `platform_status` varchar(20) DEFAULT NULL COMMENT '支付状态',
  `pay_amount` decimal(20,2) NOT NULL COMMENT '支付金额',
  `create_time` datetime DEFAULT current_timestamp() COMMENT '创建时间',
  `update_time` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT '更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uqe_order_no` (`order_no`),
  UNIQUE KEY `uqe_platform_number` (`platform_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bbjx_pay_info
-- ----------------------------

-- ----------------------------
-- Table structure for bbjx_product
-- ----------------------------
DROP TABLE IF EXISTS `bbjx_product`;
CREATE TABLE `bbjx_product` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '商品id',
  `hot` varchar(11) NOT NULL DEFAULT '1',
  `category_id` int(11) NOT NULL COMMENT '分类id,对应bbjx_category表的主键',
  `title` varchar(255) DEFAULT '',
  `name` varchar(100) NOT NULL COMMENT '商品名称',
  `subtitle` varchar(200) DEFAULT NULL COMMENT '商品副标题',
  `main_image` varchar(500) DEFAULT NULL COMMENT '产品主图,url相对地址',
  `sub_images` text DEFAULT NULL COMMENT '图片地址,json格式,扩展用',
  `status` int(11) DEFAULT 1 COMMENT '商品状态.1-在售 2-下架 3-删除',
  `detail` text DEFAULT NULL COMMENT '商品详情',
  `discount_price` varchar(20) DEFAULT '',
  `subsidize` decimal(10,0) DEFAULT NULL COMMENT '补贴价',
  `tip` varchar(10) DEFAULT NULL,
  `price` varchar(20) NOT NULL COMMENT '价格,单位-元保留两位小数',
  `stock` int(11) NOT NULL COMMENT '库存数量',
  `comment` varchar(255) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=59 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bbjx_product
-- ----------------------------
INSERT INTO `bbjx_product` VALUES ('26', '1', '100002', '品质手机', 'Apple iPhone 7 Plus (A1661) 128G 玫瑰金色 移动联通电信4G手机', 'iPhone 7，现更以红色呈现。', 'https://ftp.bmp.ovh/imgs/2021/04/80bae57111fddd22.png', '241997c4-9e62-4824-b7f0-7425c3c28917.jpeg,b6c56eb0-1748-49a9-98dc-bcc4b9788a54.jpeg,92f17532-1527-4563-aa1d-ed01baa0f7b2.jpeg,3adbe4f7-e374-4533-aa79-cc4a98c529bf.jpeg', '1', '<p><img alt=\"10000.jpg\" src=\"http://img.springboot.cn/00bce8d4-e9af-4c8d-b205-e6c75c7e252b.jpg\" width=\"790\" height=\"553\"><br></p><p><img alt=\"20000.jpg\" src=\"http://img.springboot.cn/4a70b4b4-01ee-46af-9468-31e67d0995b8.jpg\" width=\"790\" height=\"525\"><br></p><p><img alt=\"30000.jpg\" src=\"http://img.springboot.cn/0570e033-12d7-49b2-88f3-7a5d84157223.jpg\" width=\"790\" height=\"365\"><br></p><p><img alt=\"40000.jpg\" src=\"http://img.springboot.cn/50515c02-3255-44b9-a829-9e141a28c08a.jpg\" width=\"790\" height=\"525\"><br></p><p><img alt=\"50000.jpg\" src=\"http://img.springboot.cn/c138fc56-5843-4287-a029-91cf3732d034.jpg\" width=\"790\" height=\"525\"><br></p><p><img alt=\"60000.jpg\" src=\"http://img.springboot.cn/c92d1f8a-9827-453f-9d37-b10a3287e894.jpg\" width=\"790\" height=\"525\"><br></p><p><br></p><p><img alt=\"TB24p51hgFkpuFjSspnXXb4qFXa-1776456424.jpg\" src=\"http://img.springboot.cn/bb1511fc-3483-471f-80e5-c7c81fa5e1dd.jpg\" width=\"790\" height=\"375\"><br></p><p><br></p><p><img alt=\"shouhou.jpg\" src=\"http://img.springboot.cn/698e6fbe-97ea-478b-8170-008ad24030f7.jpg\" width=\"750\" height=\"150\"><br></p><p><img alt=\"999.jpg\" src=\"http://img.springboot.cn/ee276fe6-5d79-45aa-8393-ba1d210f9c89.jpg\" width=\"790\" height=\"351\"><br></p>', '23.00', '2', '立减', '6999.00', '10', '100%好评', null, '2000-04-13 21:45:41');
INSERT INTO `bbjx_product` VALUES ('27', '2', '100006', '精品家电', 'Midea/美的 BCD-535WKZM(E)冰箱双开门对开门风冷无霜智能电家用', '送品牌烤箱，五一大促', 'https://ftp.bmp.ovh/imgs/2021/04/80bae57111fddd22.png', 'ac3e571d-13ce-4fad-89e8-c92c2eccf536.jpeg,4bb02f1c-62d5-48cc-b358-97b05af5740d.jpeg,36bdb49c-72ae-4185-9297-78829b54b566.jpeg', '1', '<p><img alt=\"miaoshu.jpg\" src=\"http://img.springboot.cn/9c5c74e6-6615-4aa0-b1fc-c17a1eff6027.jpg\" width=\"790\" height=\"444\"><br></p><p><img alt=\"miaoshu2.jpg\" src=\"http://img.springboot.cn/31dc1a94-f354-48b8-a170-1a1a6de8751b.jpg\" width=\"790\" height=\"1441\"><img alt=\"miaoshu3.jpg\" src=\"http://img.springboot.cn/7862594b-3063-4b52-b7d4-cea980c604e0.jpg\" width=\"790\" height=\"1442\"><img alt=\"miaoshu4.jpg\" src=\"http://img.springboot.cn/9a650563-dc85-44d6-b174-d6960cfb1d6a.jpg\" width=\"790\" height=\"1441\"><br></p>', '23.00', '2', '立减', '3299.00', '99', '100%好评', '2000-04-13 18:51:54', '2000-04-13 21:45:41');
INSERT INTO `bbjx_product` VALUES ('28', '2', '100012', '精品手机', '4+64G送手环/Huawei/华为 nova 手机P9/P10plus青春', 'NOVA青春版1999元', 'https://ftp.bmp.ovh/imgs/2021/04/80bae57111fddd22.png', '0093f5d3-bdb4-4fb0-bec5-5465dfd26363.jpeg,13da2172-4445-4eb5-a13f-c5d4ede8458c.jpeg,58d5d4b7-58d4-4948-81b6-2bae4f79bf02.jpeg', '1', '<p><img alt=\"11TB2fKK3cl0kpuFjSsziXXa.oVXa_!!1777180618.jpg\" src=\"http://img.springboot.cn/5c2d1c6d-9e09-48ce-bbdb-e833b42ff664.jpg\" width=\"790\" height=\"966\"><img alt=\"22TB2YP3AkEhnpuFjSZFpXXcpuXXa_!!1777180618.jpg\" src=\"http://img.springboot.cn/9a10b877-818f-4a27-b6f7-62887f3fb39d.jpg\" width=\"790\" height=\"1344\"><img alt=\"33TB2Yyshk.hnpuFjSZFpXXcpuXXa_!!1777180618.jpg\" src=\"http://img.springboot.cn/7d7fbd69-a3cb-4efe-8765-423bf8276e3e.jpg\" width=\"790\" height=\"700\"><img alt=\"TB2diyziB8kpuFjSspeXXc7IpXa_!!1777180618.jpg\" src=\"http://img.springboot.cn/1d7160d2-9dba-422f-b2a0-e92847ba6ce9.jpg\" width=\"790\" height=\"393\"><br></p>', '23.00', '2', '立减', '1999.00', '100', '100%好评', '2000-04-13 18:57:18', '2000-04-13 21:45:41');
INSERT INTO `bbjx_product` VALUES ('29', '2', '100008', '精品家电', 'Haier/海尔HJ100-1HU1 10公斤滚筒洗衣机全自动带烘干家用大容量 洗烘一体', '门店机型 德邦送货', 'https://ftp.bmp.ovh/imgs/2021/04/80bae57111fddd22.png', '173335a4-5dce-4afd-9f18-a10623724c4e.jpeg,42b1b8bc-27c7-4ee1-80ab-753d216a1d49.jpeg,2f1b3de1-1eb1-4c18-8ca2-518934931bec.jpeg', '1', '<p><img alt=\"1TB2WLZrcIaK.eBjSspjXXXL.XXa_!!2114960396.jpg\" src=\"http://img.springboot.cn/ffcce953-81bd-463c-acd1-d690b263d6df.jpg\" width=\"790\" height=\"920\"><img alt=\"2TB2zhOFbZCO.eBjSZFzXXaRiVXa_!!2114960396.jpg\" src=\"http://img.springboot.cn/58a7bd25-c3e7-4248-9dba-158ef2a90e70.jpg\" width=\"790\" height=\"1052\"><img alt=\"3TB27mCtb7WM.eBjSZFhXXbdWpXa_!!2114960396.jpg\" src=\"http://img.springboot.cn/2edbe9b3-28be-4a8b-a9c3-82e40703f22f.jpg\" width=\"790\" height=\"820\"><br></p>', '23.00', '2', '立减', '4299.00', '100', '100%好评', '2000-04-13 19:07:47', '2000-04-13 21:45:41');
INSERT INTO `bbjx_product` VALUES ('30', '1', '100002', '品质手机', 'Apple iPhone 7 Plus (A1661) 128G 玫瑰金色 移动联通电信4G手机', 'iPhone 7，现更以红色呈现。', 'https://ftp.bmp.ovh/imgs/2021/04/80bae57111fddd22.png', '241997c4-9e62-4824-b7f0-7425c3c28917.jpeg,b6c56eb0-1748-49a9-98dc-bcc4b9788a54.jpeg,92f17532-1527-4563-aa1d-ed01baa0f7b2.jpeg,3adbe4f7-e374-4533-aa79-cc4a98c529bf.jpeg', '1', '<p><img alt=\"10000.jpg\" src=\"http://img.springboot.cn/00bce8d4-e9af-4c8d-b205-e6c75c7e252b.jpg\" width=\"790\" height=\"553\"><br></p><p><img alt=\"20000.jpg\" src=\"http://img.springboot.cn/4a70b4b4-01ee-46af-9468-31e67d0995b8.jpg\" width=\"790\" height=\"525\"><br></p><p><img alt=\"30000.jpg\" src=\"http://img.springboot.cn/0570e033-12d7-49b2-88f3-7a5d84157223.jpg\" width=\"790\" height=\"365\"><br></p><p><img alt=\"40000.jpg\" src=\"http://img.springboot.cn/50515c02-3255-44b9-a829-9e141a28c08a.jpg\" width=\"790\" height=\"525\"><br></p><p><img alt=\"50000.jpg\" src=\"http://img.springboot.cn/c138fc56-5843-4287-a029-91cf3732d034.jpg\" width=\"790\" height=\"525\"><br></p><p><img alt=\"60000.jpg\" src=\"http://img.springboot.cn/c92d1f8a-9827-453f-9d37-b10a3287e894.jpg\" width=\"790\" height=\"525\"><br></p><p><br></p><p><img alt=\"TB24p51hgFkpuFjSspnXXb4qFXa-1776456424.jpg\" src=\"http://img.springboot.cn/bb1511fc-3483-471f-80e5-c7c81fa5e1dd.jpg\" width=\"790\" height=\"375\"><br></p><p><br></p><p><img alt=\"shouhou.jpg\" src=\"http://img.springboot.cn/698e6fbe-97ea-478b-8170-008ad24030f7.jpg\" width=\"750\" height=\"150\"><br></p><p><img alt=\"999.jpg\" src=\"http://img.springboot.cn/ee276fe6-5d79-45aa-8393-ba1d210f9c89.jpg\" width=\"790\" height=\"351\"><br></p>', '23.00', '2', '立减', '6999.00', '96', '100%好评', '2021-04-07 22:30:39', '2000-04-13 21:45:41');
INSERT INTO `bbjx_product` VALUES ('31', '2', '100006', '精品家电', 'Midea/美的 BCD-535WKZM(E)冰箱双开门对开门风冷无霜智能电家用', '送品牌烤箱，五一大促', 'https://ftp.bmp.ovh/imgs/2021/04/80bae57111fddd22.png', 'ac3e571d-13ce-4fad-89e8-c92c2eccf536.jpeg,4bb02f1c-62d5-48cc-b358-97b05af5740d.jpeg,36bdb49c-72ae-4185-9297-78829b54b566.jpeg', '1', '<p><img alt=\"miaoshu.jpg\" src=\"http://img.springboot.cn/9c5c74e6-6615-4aa0-b1fc-c17a1eff6027.jpg\" width=\"790\" height=\"444\"><br></p><p><img alt=\"miaoshu2.jpg\" src=\"http://img.springboot.cn/31dc1a94-f354-48b8-a170-1a1a6de8751b.jpg\" width=\"790\" height=\"1441\"><img alt=\"miaoshu3.jpg\" src=\"http://img.springboot.cn/7862594b-3063-4b52-b7d4-cea980c604e0.jpg\" width=\"790\" height=\"1442\"><img alt=\"miaoshu4.jpg\" src=\"http://img.springboot.cn/9a650563-dc85-44d6-b174-d6960cfb1d6a.jpg\" width=\"790\" height=\"1441\"><br></p>', '23.00', '2', '立减', '3299.00', '99', '100%好评', '2000-04-13 18:51:54', '2000-04-13 21:45:41');
INSERT INTO `bbjx_product` VALUES ('32', '2', '100012', '精品手机', '4+64G送手环/Huawei/华为 nova 手机P9/P10plus青春', 'NOVA青春版1999元', 'https://ftp.bmp.ovh/imgs/2021/04/80bae57111fddd22.png', '0093f5d3-bdb4-4fb0-bec5-5465dfd26363.jpeg,13da2172-4445-4eb5-a13f-c5d4ede8458c.jpeg,58d5d4b7-58d4-4948-81b6-2bae4f79bf02.jpeg', '1', '<p><img alt=\"11TB2fKK3cl0kpuFjSsziXXa.oVXa_!!1777180618.jpg\" src=\"http://img.springboot.cn/5c2d1c6d-9e09-48ce-bbdb-e833b42ff664.jpg\" width=\"790\" height=\"966\"><img alt=\"22TB2YP3AkEhnpuFjSZFpXXcpuXXa_!!1777180618.jpg\" src=\"http://img.springboot.cn/9a10b877-818f-4a27-b6f7-62887f3fb39d.jpg\" width=\"790\" height=\"1344\"><img alt=\"33TB2Yyshk.hnpuFjSZFpXXcpuXXa_!!1777180618.jpg\" src=\"http://img.springboot.cn/7d7fbd69-a3cb-4efe-8765-423bf8276e3e.jpg\" width=\"790\" height=\"700\"><img alt=\"TB2diyziB8kpuFjSspeXXc7IpXa_!!1777180618.jpg\" src=\"http://img.springboot.cn/1d7160d2-9dba-422f-b2a0-e92847ba6ce9.jpg\" width=\"790\" height=\"393\"><br></p>', '23.00', '2', '立减', '1999.00', '100', '100%好评', '2000-04-13 18:57:18', '2021-04-07 21:45:41');
INSERT INTO `bbjx_product` VALUES ('33', '2', '100008', '精品家电', 'Haier/海尔HJ100-1HU1 10公斤滚筒洗衣机全自动带烘干家用大容量 洗烘一体', '门店机型 德邦送货', 'https://ftp.bmp.ovh/imgs/2021/04/80bae57111fddd22.png', '173335a4-5dce-4afd-9f18-a10623724c4e.jpeg,42b1b8bc-27c7-4ee1-80ab-753d216a1d49.jpeg,2f1b3de1-1eb1-4c18-8ca2-518934931bec.jpeg', '1', '<p><img alt=\"1TB2WLZrcIaK.eBjSspjXXXL.XXa_!!2114960396.jpg\" src=\"http://img.springboot.cn/ffcce953-81bd-463c-acd1-d690b263d6df.jpg\" width=\"790\" height=\"920\"><img alt=\"2TB2zhOFbZCO.eBjSZFzXXaRiVXa_!!2114960396.jpg\" src=\"http://img.springboot.cn/58a7bd25-c3e7-4248-9dba-158ef2a90e70.jpg\" width=\"790\" height=\"1052\"><img alt=\"3TB27mCtb7WM.eBjSZFhXXbdWpXa_!!2114960396.jpg\" src=\"http://img.springboot.cn/2edbe9b3-28be-4a8b-a9c3-82e40703f22f.jpg\" width=\"790\" height=\"820\"><br></p>', '23.00', '2', '立减', '4299.00', '100', '100%好评', '2000-04-13 19:07:47', '2021-04-07 21:45:41');
INSERT INTO `bbjx_product` VALUES ('34', '1', '100002', '品质手机', 'Apple iPhone 7 Plus (A1661) 128G 玫瑰金色 移动联通电信4G手机', 'iPhone 7，现更以红色呈现。', 'https://ftp.bmp.ovh/imgs/2021/04/80bae57111fddd22.png', '241997c4-9e62-4824-b7f0-7425c3c28917.jpeg,b6c56eb0-1748-49a9-98dc-bcc4b9788a54.jpeg,92f17532-1527-4563-aa1d-ed01baa0f7b2.jpeg,3adbe4f7-e374-4533-aa79-cc4a98c529bf.jpeg', '1', '<p><img alt=\"10000.jpg\" src=\"http://img.springboot.cn/00bce8d4-e9af-4c8d-b205-e6c75c7e252b.jpg\" width=\"790\" height=\"553\"><br></p><p><img alt=\"20000.jpg\" src=\"http://img.springboot.cn/4a70b4b4-01ee-46af-9468-31e67d0995b8.jpg\" width=\"790\" height=\"525\"><br></p><p><img alt=\"30000.jpg\" src=\"http://img.springboot.cn/0570e033-12d7-49b2-88f3-7a5d84157223.jpg\" width=\"790\" height=\"365\"><br></p><p><img alt=\"40000.jpg\" src=\"http://img.springboot.cn/50515c02-3255-44b9-a829-9e141a28c08a.jpg\" width=\"790\" height=\"525\"><br></p><p><img alt=\"50000.jpg\" src=\"http://img.springboot.cn/c138fc56-5843-4287-a029-91cf3732d034.jpg\" width=\"790\" height=\"525\"><br></p><p><img alt=\"60000.jpg\" src=\"http://img.springboot.cn/c92d1f8a-9827-453f-9d37-b10a3287e894.jpg\" width=\"790\" height=\"525\"><br></p><p><br></p><p><img alt=\"TB24p51hgFkpuFjSspnXXb4qFXa-1776456424.jpg\" src=\"http://img.springboot.cn/bb1511fc-3483-471f-80e5-c7c81fa5e1dd.jpg\" width=\"790\" height=\"375\"><br></p><p><br></p><p><img alt=\"shouhou.jpg\" src=\"http://img.springboot.cn/698e6fbe-97ea-478b-8170-008ad24030f7.jpg\" width=\"750\" height=\"150\"><br></p><p><img alt=\"999.jpg\" src=\"http://img.springboot.cn/ee276fe6-5d79-45aa-8393-ba1d210f9c89.jpg\" width=\"790\" height=\"351\"><br></p>', '23.00', '2', '立减', '6999.00', '96', '100%好评', '2021-04-07 22:31:59', '2000-04-13 21:45:41');
INSERT INTO `bbjx_product` VALUES ('35', '2', '100006', '精品家电', 'Midea/美的 BCD-535WKZM(E)冰箱双开门对开门风冷无霜智能电家用', '送品牌烤箱，五一大促', 'https://ftp.bmp.ovh/imgs/2021/04/80bae57111fddd22.png', 'ac3e571d-13ce-4fad-89e8-c92c2eccf536.jpeg,4bb02f1c-62d5-48cc-b358-97b05af5740d.jpeg,36bdb49c-72ae-4185-9297-78829b54b566.jpeg', '1', '<p><img alt=\"miaoshu.jpg\" src=\"http://img.springboot.cn/9c5c74e6-6615-4aa0-b1fc-c17a1eff6027.jpg\" width=\"790\" height=\"444\"><br></p><p><img alt=\"miaoshu2.jpg\" src=\"http://img.springboot.cn/31dc1a94-f354-48b8-a170-1a1a6de8751b.jpg\" width=\"790\" height=\"1441\"><img alt=\"miaoshu3.jpg\" src=\"http://img.springboot.cn/7862594b-3063-4b52-b7d4-cea980c604e0.jpg\" width=\"790\" height=\"1442\"><img alt=\"miaoshu4.jpg\" src=\"http://img.springboot.cn/9a650563-dc85-44d6-b174-d6960cfb1d6a.jpg\" width=\"790\" height=\"1441\"><br></p>', '23.00', '2', '立减', '3299.00', '99', '100%好评', '2000-04-13 18:51:54', '2000-04-13 21:45:41');
INSERT INTO `bbjx_product` VALUES ('36', '2', '100012', '精品手机', '4+64G送手环/Huawei/华为 nova 手机P9/P10plus青春', 'NOVA青春版1999元', 'https://ftp.bmp.ovh/imgs/2021/04/80bae57111fddd22.png', '0093f5d3-bdb4-4fb0-bec5-5465dfd26363.jpeg,13da2172-4445-4eb5-a13f-c5d4ede8458c.jpeg,58d5d4b7-58d4-4948-81b6-2bae4f79bf02.jpeg', '1', '<p><img alt=\"11TB2fKK3cl0kpuFjSsziXXa.oVXa_!!1777180618.jpg\" src=\"http://img.springboot.cn/5c2d1c6d-9e09-48ce-bbdb-e833b42ff664.jpg\" width=\"790\" height=\"966\"><img alt=\"22TB2YP3AkEhnpuFjSZFpXXcpuXXa_!!1777180618.jpg\" src=\"http://img.springboot.cn/9a10b877-818f-4a27-b6f7-62887f3fb39d.jpg\" width=\"790\" height=\"1344\"><img alt=\"33TB2Yyshk.hnpuFjSZFpXXcpuXXa_!!1777180618.jpg\" src=\"http://img.springboot.cn/7d7fbd69-a3cb-4efe-8765-423bf8276e3e.jpg\" width=\"790\" height=\"700\"><img alt=\"TB2diyziB8kpuFjSspeXXc7IpXa_!!1777180618.jpg\" src=\"http://img.springboot.cn/1d7160d2-9dba-422f-b2a0-e92847ba6ce9.jpg\" width=\"790\" height=\"393\"><br></p>', '23.00', '2', '立减', '1999.00', '100', '100%好评', '2000-04-13 18:57:18', '2000-04-13 21:45:41');
INSERT INTO `bbjx_product` VALUES ('37', '2', '100008', '精品家电', 'Haier/海尔HJ100-1HU1 10公斤滚筒洗衣机全自动带烘干家用大容量 洗烘一体', '门店机型 德邦送货', 'https://ftp.bmp.ovh/imgs/2021/04/80bae57111fddd22.png', '173335a4-5dce-4afd-9f18-a10623724c4e.jpeg,42b1b8bc-27c7-4ee1-80ab-753d216a1d49.jpeg,2f1b3de1-1eb1-4c18-8ca2-518934931bec.jpeg', '1', '<p><img alt=\"1TB2WLZrcIaK.eBjSspjXXXL.XXa_!!2114960396.jpg\" src=\"http://img.springboot.cn/ffcce953-81bd-463c-acd1-d690b263d6df.jpg\" width=\"790\" height=\"920\"><img alt=\"2TB2zhOFbZCO.eBjSZFzXXaRiVXa_!!2114960396.jpg\" src=\"http://img.springboot.cn/58a7bd25-c3e7-4248-9dba-158ef2a90e70.jpg\" width=\"790\" height=\"1052\"><img alt=\"3TB27mCtb7WM.eBjSZFhXXbdWpXa_!!2114960396.jpg\" src=\"http://img.springboot.cn/2edbe9b3-28be-4a8b-a9c3-82e40703f22f.jpg\" width=\"790\" height=\"820\"><br></p>', '23.00', '2', '立减', '4299.00', '100', '100%好评', '2000-04-13 19:07:47', '2000-04-13 21:45:41');
INSERT INTO `bbjx_product` VALUES ('38', '1', '100002', '品质手机', 'Apple iPhone 7 Plus (A1661) 128G 玫瑰金色 移动联通电信4G手机', 'iPhone 7，现更以红色呈现。', 'https://ftp.bmp.ovh/imgs/2021/04/80bae57111fddd22.png', '241997c4-9e62-4824-b7f0-7425c3c28917.jpeg,b6c56eb0-1748-49a9-98dc-bcc4b9788a54.jpeg,92f17532-1527-4563-aa1d-ed01baa0f7b2.jpeg,3adbe4f7-e374-4533-aa79-cc4a98c529bf.jpeg', '1', '<p><img alt=\"10000.jpg\" src=\"http://img.springboot.cn/00bce8d4-e9af-4c8d-b205-e6c75c7e252b.jpg\" width=\"790\" height=\"553\"><br></p><p><img alt=\"20000.jpg\" src=\"http://img.springboot.cn/4a70b4b4-01ee-46af-9468-31e67d0995b8.jpg\" width=\"790\" height=\"525\"><br></p><p><img alt=\"30000.jpg\" src=\"http://img.springboot.cn/0570e033-12d7-49b2-88f3-7a5d84157223.jpg\" width=\"790\" height=\"365\"><br></p><p><img alt=\"40000.jpg\" src=\"http://img.springboot.cn/50515c02-3255-44b9-a829-9e141a28c08a.jpg\" width=\"790\" height=\"525\"><br></p><p><img alt=\"50000.jpg\" src=\"http://img.springboot.cn/c138fc56-5843-4287-a029-91cf3732d034.jpg\" width=\"790\" height=\"525\"><br></p><p><img alt=\"60000.jpg\" src=\"http://img.springboot.cn/c92d1f8a-9827-453f-9d37-b10a3287e894.jpg\" width=\"790\" height=\"525\"><br></p><p><br></p><p><img alt=\"TB24p51hgFkpuFjSspnXXb4qFXa-1776456424.jpg\" src=\"http://img.springboot.cn/bb1511fc-3483-471f-80e5-c7c81fa5e1dd.jpg\" width=\"790\" height=\"375\"><br></p><p><br></p><p><img alt=\"shouhou.jpg\" src=\"http://img.springboot.cn/698e6fbe-97ea-478b-8170-008ad24030f7.jpg\" width=\"750\" height=\"150\"><br></p><p><img alt=\"999.jpg\" src=\"http://img.springboot.cn/ee276fe6-5d79-45aa-8393-ba1d210f9c89.jpg\" width=\"790\" height=\"351\"><br></p>', '23.00', '2', '立减', '6999.00', '96', '100%好评', '2021-04-07 22:30:39', '2000-04-13 21:45:41');
INSERT INTO `bbjx_product` VALUES ('39', '2', '100006', '精品家电', 'Midea/美的 BCD-535WKZM(E)冰箱双开门对开门风冷无霜智能电家用', '送品牌烤箱，五一大促', 'https://ftp.bmp.ovh/imgs/2021/04/80bae57111fddd22.png', 'ac3e571d-13ce-4fad-89e8-c92c2eccf536.jpeg,4bb02f1c-62d5-48cc-b358-97b05af5740d.jpeg,36bdb49c-72ae-4185-9297-78829b54b566.jpeg', '1', '<p><img alt=\"miaoshu.jpg\" src=\"http://img.springboot.cn/9c5c74e6-6615-4aa0-b1fc-c17a1eff6027.jpg\" width=\"790\" height=\"444\"><br></p><p><img alt=\"miaoshu2.jpg\" src=\"http://img.springboot.cn/31dc1a94-f354-48b8-a170-1a1a6de8751b.jpg\" width=\"790\" height=\"1441\"><img alt=\"miaoshu3.jpg\" src=\"http://img.springboot.cn/7862594b-3063-4b52-b7d4-cea980c604e0.jpg\" width=\"790\" height=\"1442\"><img alt=\"miaoshu4.jpg\" src=\"http://img.springboot.cn/9a650563-dc85-44d6-b174-d6960cfb1d6a.jpg\" width=\"790\" height=\"1441\"><br></p>', '23.00', '2', '立减', '3299.00', '99', '100%好评', '2000-04-13 18:51:54', '2000-04-13 21:45:41');
INSERT INTO `bbjx_product` VALUES ('40', '2', '100012', '精品手机', '4+64G送手环/Huawei/华为 nova 手机P9/P10plus青春', 'NOVA青春版1999元', 'https://ftp.bmp.ovh/imgs/2021/04/80bae57111fddd22.png', '0093f5d3-bdb4-4fb0-bec5-5465dfd26363.jpeg,13da2172-4445-4eb5-a13f-c5d4ede8458c.jpeg,58d5d4b7-58d4-4948-81b6-2bae4f79bf02.jpeg', '1', '<p><img alt=\"11TB2fKK3cl0kpuFjSsziXXa.oVXa_!!1777180618.jpg\" src=\"http://img.springboot.cn/5c2d1c6d-9e09-48ce-bbdb-e833b42ff664.jpg\" width=\"790\" height=\"966\"><img alt=\"22TB2YP3AkEhnpuFjSZFpXXcpuXXa_!!1777180618.jpg\" src=\"http://img.springboot.cn/9a10b877-818f-4a27-b6f7-62887f3fb39d.jpg\" width=\"790\" height=\"1344\"><img alt=\"33TB2Yyshk.hnpuFjSZFpXXcpuXXa_!!1777180618.jpg\" src=\"http://img.springboot.cn/7d7fbd69-a3cb-4efe-8765-423bf8276e3e.jpg\" width=\"790\" height=\"700\"><img alt=\"TB2diyziB8kpuFjSspeXXc7IpXa_!!1777180618.jpg\" src=\"http://img.springboot.cn/1d7160d2-9dba-422f-b2a0-e92847ba6ce9.jpg\" width=\"790\" height=\"393\"><br></p>', '23.00', '2', '立减', '1999.00', '100', '100%好评', '2000-04-13 18:57:18', '2021-04-07 21:45:41');
INSERT INTO `bbjx_product` VALUES ('41', '2', '100008', '精品家电', 'Haier/海尔HJ100-1HU1 10公斤滚筒洗衣机全自动带烘干家用大容量 洗烘一体', '门店机型 德邦送货', 'https://ftp.bmp.ovh/imgs/2021/04/80bae57111fddd22.png', '173335a4-5dce-4afd-9f18-a10623724c4e.jpeg,42b1b8bc-27c7-4ee1-80ab-753d216a1d49.jpeg,2f1b3de1-1eb1-4c18-8ca2-518934931bec.jpeg', '1', '<p><img alt=\"1TB2WLZrcIaK.eBjSspjXXXL.XXa_!!2114960396.jpg\" src=\"http://img.springboot.cn/ffcce953-81bd-463c-acd1-d690b263d6df.jpg\" width=\"790\" height=\"920\"><img alt=\"2TB2zhOFbZCO.eBjSZFzXXaRiVXa_!!2114960396.jpg\" src=\"http://img.springboot.cn/58a7bd25-c3e7-4248-9dba-158ef2a90e70.jpg\" width=\"790\" height=\"1052\"><img alt=\"3TB27mCtb7WM.eBjSZFhXXbdWpXa_!!2114960396.jpg\" src=\"http://img.springboot.cn/2edbe9b3-28be-4a8b-a9c3-82e40703f22f.jpg\" width=\"790\" height=\"820\"><br></p>', '23.00', '2', '立减', '4299.00', '100', '100%好评', '2000-04-13 19:07:47', '2021-04-07 21:45:41');
INSERT INTO `bbjx_product` VALUES ('42', '2', '100006', '3253', '4326rfhdf', 'trrewter', '/images/goods/1c078f90-9c01-11eb-8328-178b9f31\r\n199c_360.jpeg', null, '1', null, '222', null, null, '222', '1000', null, null, null);
INSERT INTO `bbjx_product` VALUES ('43', '2', '100006', '3253', '4326rfhdf', 'trrewter', '/images/goods/1c078f90-9c01-11eb-8328-178b9f31199c_360.jpeg', null, '1', null, '222', null, null, '222', '1000', null, null, null);
INSERT INTO `bbjx_product` VALUES ('44', '2', '100006', '3253', '4326rfhdf', 'trrewter', '/images/goods/1c078f90-9c01-11eb-8328-178b9f31199c_360.jpeg', null, '1', null, '222', null, null, '222', '1000', null, null, null);
INSERT INTO `bbjx_product` VALUES ('45', '2', '100006', '3253', '4326rfhdf', 'trrewter', 'http://binbin-dev.bcjgy.com//images/goods/db839cd0-9c04-11eb-ac7d-794e52b99e0b_360.png', null, '1', null, '222', null, null, '222', '1000', null, null, null);
INSERT INTO `bbjx_product` VALUES ('46', '2', '100006', '3253', '4326rfhdf', 'trrewter', 'http://binbin-dev.bcjgy.com//images/goods/e615e950-9c04-11eb-ac7d-794e52b99e0b_360.jpeg', null, '1', null, '222', null, null, '222', '1000', null, null, null);
INSERT INTO `bbjx_product` VALUES ('47', '2', '100006', '3253', '4326rfhdf', 'trrewter', 'http://binbin-dev.bcjgy.com//images/goods/ef114220-9c04-11eb-ac7d-794e52b99e0b_360.jpeg', null, '1', null, '222', null, null, '222', '1000', null, null, null);
INSERT INTO `bbjx_product` VALUES ('48', '2', '100006', '3253', '4326rfhdf', 'trrewter', 'http://binbin-dev.bcjgy.com//images/goods/f8a1af00-9c04-11eb-ac7d-794e52b99e0b_360.jpeg', null, '1', null, '222', null, null, '222', '1000', null, null, null);
INSERT INTO `bbjx_product` VALUES ('49', '2', '100006', '3253', '4326rfhdf', 'trrewter', 'http://binbin-dev.bcjgy.com//images/goods/03c258d0-9c05-11eb-ac7d-794e52b99e0b_360.jpeg', null, '1', null, '222', null, null, '222', '1000', null, null, null);
INSERT INTO `bbjx_product` VALUES ('50', '2', '100011', '精品中精品', '精品中精品', '数码', 'http://binbin-dev.bcjgy.com//images/goods/4094b870-9c05-11eb-ac7d-794e52b99e0b_360.jpeg', null, '1', null, '221', null, null, '222', '1000', null, null, null);
INSERT INTO `bbjx_product` VALUES ('51', '2', '100013', '精品中精品', '精品中精品', '精品电脑', 'http://binbin-dev.bcjgy.com//images/goods/565c6f40-9c05-11eb-ac7d-794e52b99e0b_360.jpeg', null, '1', null, '4444', null, null, '4449', '1000', null, null, null);
INSERT INTO `bbjx_product` VALUES ('52', '2', '100013', '精品中精品', '精品中精品', '精品电脑', 'http://binbin-dev.bcjgy.com//images/goods/5d35d270-9c05-11eb-ac7d-794e52b99e0b_360.jpeg', null, '1', null, '4444', null, null, '4449', '1000', null, null, null);
INSERT INTO `bbjx_product` VALUES ('53', '2', '100013', '精品中精品', '精品中精品', '精品电脑', 'http://binbin-dev.bcjgy.com//images/goods/63e6c610-9c05-11eb-ac7d-794e52b99e0b_360.jpeg', null, '1', null, '4444', null, null, '4449', '1000', null, null, null);
INSERT INTO `bbjx_product` VALUES ('54', '2', '100013', '精品中精品', '精品中精品', '精品电脑', 'http://binbin-dev.bcjgy.com//images/goods/6d04e920-9c05-11eb-ac7d-794e52b99e0b_360.jpeg', null, '1', null, '4444', null, null, '4449', '1000', null, null, null);
INSERT INTO `bbjx_product` VALUES ('55', '2', '100013', '精品中精品', '精品中精品', '精品电脑', 'http://binbin-dev.bcjgy.com//images/goods/74317560-9c05-11eb-ac7d-794e52b99e0b_360.jpeg', null, '1', null, '4444', null, null, '4449', '1000', null, null, null);
INSERT INTO `bbjx_product` VALUES ('56', '2', '100013', '精品中精品', '精品中精品', '精品电脑', 'http://binbin-dev.bcjgy.com//images/goods/7a442d30-9c05-11eb-ac7d-794e52b99e0b_360.jpeg', null, '1', null, '4444', null, null, '4449', '1000', null, null, null);
INSERT INTO `bbjx_product` VALUES ('57', '2', '100015', '精品中精品', '精品中精品', '精品电脑', 'http://binbin-dev.bcjgy.com//images/goods/8a1566c0-9c05-11eb-ac7d-794e52b99e0b_360.jpeg', null, '1', null, '4444', null, null, '4449', '1000', null, null, null);
INSERT INTO `bbjx_product` VALUES ('58', '2', '100015', '精品中精品', '精品中精品', '精品电脑', 'http://binbin-dev.bcjgy.com//images/goods/92a3a5e0-9c05-11eb-ac7d-794e52b99e0b_360.jpeg', null, '1', null, '4444', null, null, '4449', '1000', null, null, null);

-- ----------------------------
-- Table structure for bbjx_shipping
-- ----------------------------
DROP TABLE IF EXISTS `bbjx_shipping`;
CREATE TABLE `bbjx_shipping` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL COMMENT '用户id',
  `receiver_name` varchar(20) DEFAULT NULL COMMENT '收货姓名',
  `receiver_phone` varchar(20) DEFAULT NULL COMMENT '收货固定电话',
  `receiver_mobile` varchar(20) DEFAULT NULL COMMENT '收货移动电话',
  `receiver_province` varchar(20) DEFAULT NULL COMMENT '省份',
  `receiver_city` varchar(20) DEFAULT NULL COMMENT '城市',
  `receiver_district` varchar(20) DEFAULT NULL COMMENT '区/县',
  `receiver_address` varchar(200) DEFAULT NULL COMMENT '详细地址',
  `receiver_zip` varchar(6) DEFAULT NULL COMMENT '邮编',
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bbjx_shipping
-- ----------------------------
INSERT INTO `bbjx_shipping` VALUES ('4', '1', '廖师兄', '010', '18688888888', '北京', '北京市', '海淀区', '中关村慕课网大楼', '100000', '2000-01-22 14:26:25', '2000-01-22 14:26:25');

-- ----------------------------
-- Table structure for bbjx_user
-- ----------------------------
DROP TABLE IF EXISTS `bbjx_user`;
CREATE TABLE `bbjx_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户表id',
  `openid` varchar(40) DEFAULT '',
  `username` varchar(50) DEFAULT NULL COMMENT '用户名',
  `password` varchar(256) DEFAULT NULL COMMENT '用户密码，MD5加密',
  `email` varchar(50) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `question` varchar(100) DEFAULT NULL COMMENT '找回密码问题',
  `answer` varchar(100) DEFAULT NULL COMMENT '找回密码答案',
  `role` int(11) DEFAULT NULL COMMENT '角色0-管理员,1-普通用户',
  `create_time` datetime DEFAULT current_timestamp() COMMENT '创建时间',
  `update_time` datetime DEFAULT current_timestamp() COMMENT '最后一次更新时间',
  `session_key` varchar(255) DEFAULT NULL,
  `status` int(2) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_name_unique` (`username`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bbjx_user
-- ----------------------------
INSERT INTO `bbjx_user` VALUES ('1', null, 'admin', '21232F297A57A5A743894A0E4A801FC3', 'admin@qq.com', null, null, null, '0', '2000-08-06 15:12:00', '2000-08-06 15:12:00', null, '1');
INSERT INTO `bbjx_user` VALUES ('2', null, '123456', 'e10adc3949ba59abbe56e057f20f883e', '123455@qq.com', null, null, null, '1', '2021-02-14 16:20:08', '2021-02-14 16:20:08', null, '1');
INSERT INTO `bbjx_user` VALUES ('3', null, 'xixingya', '$2a$10$cLpY17Mw1gt8t6ksfIkw7OT8ePsjxR/mRbxfxSHuy8KklmMQFzG.K', '2679431923@qq.com', null, null, null, '1', '2021-03-30 20:03:35', '2021-03-30 20:03:35', null, '1');
INSERT INTO `bbjx_user` VALUES ('4', 'omGBq5C2WbNa2SStdhmsJ5fcSu_k', null, null, null, null, null, null, '2', '2021-04-08 21:03:51', '2021-04-08 21:03:51', 'DgRIOUyjzLu5VRKIcUnSzA==', '1');
INSERT INTO `bbjx_user` VALUES ('5', '', '555', '202cb962ac59075b964b07152d234b70', null, null, null, null, '1', '2021-04-12 17:12:54', '2021-04-12 17:12:54', null, '1');
