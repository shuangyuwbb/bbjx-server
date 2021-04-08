/*
Navicat MySQL Data Transfer

Source Server         : localhost-pms
Source Server Version : 50505
Source Host           : localhost:3306
Source Database       : bbjx

Target Server Type    : MYSQL
Target Server Version : 50505
File Encoding         : 65001

Date: 2021-03-13 15:00:14
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for address
-- ----------------------------
DROP TABLE IF EXISTS `address`;
CREATE TABLE `address` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` varchar(255) NOT NULL COMMENT '用户id',
  `name` varchar(255) NOT NULL COMMENT '姓名',
  `tel` varchar(255) NOT NULL COMMENT '手机号',
  `province` varchar(12) NOT NULL COMMENT '省',
  `city` varchar(12) NOT NULL COMMENT '市',
  `county` varchar(12) NOT NULL COMMENT '县区',
  `street` varchar(255) DEFAULT NULL COMMENT '详细地址',
  `code` varchar(255) DEFAULT NULL COMMENT '邮编',
  `isDefault` int(11) DEFAULT 1 COMMENT '是否默认',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='收货地址';

-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) DEFAULT NULL COMMENT '用户名',
  `password` varchar(255) DEFAULT NULL COMMENT '密码',
  `fullname` varchar(255) DEFAULT NULL COMMENT '昵称',
  `sex` varchar(255) DEFAULT '男' COMMENT '性别',
  `avatar` varchar(255) DEFAULT '/images/avatar/default.jpg' COMMENT '头像',
  `tel` varchar(255) DEFAULT NULL COMMENT '手机号码',
  `email` varchar(255) DEFAULT NULL COMMENT '注册邮箱',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `login_time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT '登录时间',
  `login_count` bigint(20) NOT NULL DEFAULT 1 COMMENT '登录次数',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='用户表';

-- ----------------------------
-- Table structure for admin_role
-- ----------------------------
DROP TABLE IF EXISTS `admin_role`;
CREATE TABLE `admin_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `admin_id` int(11) DEFAULT NULL COMMENT '用户id',
  `role_id` int(11) DEFAULT NULL COMMENT '角色id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED;

-- ----------------------------
-- Table structure for cart
-- ----------------------------
DROP TABLE IF EXISTS `cart`;
CREATE TABLE `cart` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` varchar(255) NOT NULL COMMENT '用户id',
  `goods_id` int(11) NOT NULL COMMENT '商品id',
  `goods_num` int(11) NOT NULL COMMENT '商品数量',
  `status` tinyint(4) DEFAULT 1 COMMENT '1-正常，0-禁用，-1-删除',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='购物车';

-- ----------------------------
-- Table structure for category
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL COMMENT '名称',
  `pId` int(11) NOT NULL COMMENT '父级id',
  `level` int(11) DEFAULT NULL COMMENT '层级',
  `img` varchar(255) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=136 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='商品分类';

-- ----------------------------
-- Table structure for city
-- ----------------------------
DROP TABLE IF EXISTS `city`;
CREATE TABLE `city` (
  `_id` int(11) NOT NULL DEFAULT 0,
  `name` varchar(64) DEFAULT NULL,
  `city_id` varchar(12) DEFAULT NULL,
  `province_id` varchar(12) DEFAULT NULL,
  PRIMARY KEY (`_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Table structure for collection
-- ----------------------------
DROP TABLE IF EXISTS `collection`;
CREATE TABLE `collection` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` varchar(255) DEFAULT NULL COMMENT '用户id',
  `goods_id` int(11) DEFAULT NULL COMMENT '商品id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='用户收藏商品';

-- ----------------------------
-- Table structure for county
-- ----------------------------
DROP TABLE IF EXISTS `county`;
CREATE TABLE `county` (
  `_id` int(11) NOT NULL DEFAULT 0,
  `name` varchar(64) DEFAULT NULL,
  `county_id` varchar(12) DEFAULT NULL,
  `city_id` varchar(12) DEFAULT NULL,
  PRIMARY KEY (`_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Table structure for goods
-- ----------------------------
DROP TABLE IF EXISTS `goods`;
CREATE TABLE `goods` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cate_1st` int(11) NOT NULL COMMENT '一级分类id',
  `cate_2nd` int(11) NOT NULL COMMENT '二级分类id',
  `cate_3rd` int(11) DEFAULT NULL COMMENT '三级分类id',
  `name` varchar(255) NOT NULL COMMENT '商品名称',
  `hotPoint` varchar(255) DEFAULT NULL COMMENT '商品热点描述',
  `price` decimal(10,2) NOT NULL COMMENT '商品价格',
  `marketPrice` decimal(10,2) NOT NULL COMMENT '市场价',
  `cost` decimal(10,2) NOT NULL COMMENT '成本价',
  `discount` decimal(10,0) DEFAULT NULL COMMENT '折扣',
  `inventory` int(11) NOT NULL COMMENT '库存',
  `articleNo` int(11) NOT NULL COMMENT '货号',
  `img_lg` varchar(255) NOT NULL COMMENT '商品主图-720',
  `img_md` varchar(255) NOT NULL COMMENT '商品主图-360',
  `slider` varchar(512) NOT NULL COMMENT '商品轮播图片',
  `brand` varchar(255) DEFAULT NULL COMMENT '商品品牌',
  `detail` varchar(5000) NOT NULL COMMENT '商品详情',
  `freight` decimal(10,0) DEFAULT 0 COMMENT '商品运费',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=39 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='商品表';

-- ----------------------------
-- Table structure for icon
-- ----------------------------
DROP TABLE IF EXISTS `icon`;
CREATE TABLE `icon` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL COMMENT '图标名称',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=281 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Table structure for menu
-- ----------------------------
DROP TABLE IF EXISTS `menu`;
CREATE TABLE `menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '菜单id',
  `name` varchar(255) DEFAULT NULL COMMENT '菜单名称',
  `pId` int(11) DEFAULT NULL COMMENT '父级id',
  `component` varchar(255) DEFAULT NULL COMMENT '组件名称',
  `path` varchar(255) DEFAULT NULL COMMENT '链接url',
  `menu_order` varchar(255) DEFAULT NULL COMMENT '显示顺序',
  `icon_id` varchar(255) DEFAULT NULL COMMENT '图标id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Table structure for orders
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` varchar(255) NOT NULL COMMENT '用户id',
  `payment` double(20,2) DEFAULT NULL COMMENT '支付金额',
  `payment_type` tinyint(4) DEFAULT NULL COMMENT '1-在线支付，1-货到付款',
  `pay_time` datetime DEFAULT NULL COMMENT '支付时间',
  `ship_fee` double(20,2) DEFAULT NULL COMMENT '邮费',
  `ship_time` datetime DEFAULT NULL COMMENT '发货时间',
  `ship_name` varchar(255) DEFAULT NULL COMMENT '快递公司',
  `ship_number` varchar(100) DEFAULT NULL COMMENT '快递单号',
  `received_time` datetime DEFAULT NULL COMMENT '收货时间',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `finish_time` datetime DEFAULT NULL COMMENT '交易完成时间',
  `close_time` datetime DEFAULT NULL COMMENT '交易关闭时间',
  `order_state` int(11) DEFAULT 0 COMMENT '状态字典',
  `status` tinyint(4) DEFAULT 1 COMMENT '1-正常，0-禁用，-1-删除',
  `refund_state` tinyint(4) DEFAULT NULL COMMENT '退款状态',
  `comment_state` tinyint(4) DEFAULT NULL COMMENT '评论状态',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='订单表';

-- ----------------------------
-- Table structure for order_address
-- ----------------------------
DROP TABLE IF EXISTS `order_address`;
CREATE TABLE `order_address` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL COMMENT '订单id',
  `name` varchar(255) NOT NULL COMMENT '姓名',
  `tel` varchar(255) NOT NULL COMMENT '手机号',
  `province` varchar(255) NOT NULL COMMENT '省',
  `city` varchar(255) NOT NULL COMMENT '市',
  `county` varchar(255) NOT NULL COMMENT '区',
  `street` varchar(255) DEFAULT NULL COMMENT '街道',
  `code` varchar(255) DEFAULT NULL COMMENT '邮编',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=23 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='收货地址';

-- ----------------------------
-- Table structure for order_goods
-- ----------------------------
DROP TABLE IF EXISTS `order_goods`;
CREATE TABLE `order_goods` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL COMMENT '订单id',
  `goods_id` int(11) DEFAULT NULL COMMENT '商品id',
  `goods_num` int(11) DEFAULT NULL COMMENT '商品数量',
  `goods_price` double(20,2) DEFAULT NULL COMMENT '商品价格',
  `status` tinyint(4) DEFAULT 1 COMMENT '0-禁用，1-正常，-1-删除',
  `update_time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='订单-商品表';

-- ----------------------------
-- Table structure for order_status
-- ----------------------------
DROP TABLE IF EXISTS `order_status`;
CREATE TABLE `order_status` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` tinyint(4) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `text` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='订单状态-字典表';

-- ----------------------------
-- Table structure for province
-- ----------------------------
DROP TABLE IF EXISTS `province`;
CREATE TABLE `province` (
  `_id` int(11) NOT NULL DEFAULT 0,
  `name` varchar(64) DEFAULT NULL,
  `province_id` varchar(12) DEFAULT NULL,
  PRIMARY KEY (`_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '角色id',
  `role_name` varchar(255) DEFAULT NULL COMMENT '角色名称',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Table structure for role_menu
-- ----------------------------
DROP TABLE IF EXISTS `role_menu`;
CREATE TABLE `role_menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role_id` int(11) DEFAULT NULL COMMENT '角色id',
  `menu_id` int(11) DEFAULT NULL COMMENT '权限id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=58 DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED;

-- ----------------------------
-- Table structure for town
-- ----------------------------
DROP TABLE IF EXISTS `town`;
CREATE TABLE `town` (
  `_id` int(11) NOT NULL DEFAULT 0,
  `name` varchar(64) DEFAULT NULL,
  `town_id` varchar(12) DEFAULT NULL,
  `county_id` varchar(12) DEFAULT NULL,
  PRIMARY KEY (`_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nickname` varchar(255) DEFAULT NULL COMMENT '昵称',
  `sex` varchar(255) DEFAULT '男' COMMENT '性别 0：未知、1：男、2：女',
  `avatar` varchar(255) DEFAULT './images/avatar/default.jpg' COMMENT '头像',
  `tel` varchar(255) DEFAULT NULL COMMENT '手机号码',
  `country` varchar(255) DEFAULT NULL COMMENT '国家',
  `province` varchar(255) DEFAULT NULL COMMENT '省',
  `city` varchar(255) DEFAULT NULL COMMENT '市',
  `openid` varchar(255) DEFAULT NULL COMMENT '小程序唯一标示id',
  `session_key` varchar(255) DEFAULT NULL COMMENT '会话密钥',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='用户表';
