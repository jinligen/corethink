
DROP TABLE IF EXISTS `oc_storehouse_customer`;
CREATE TABLE `oc_storehouse_customer` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `customer_id` varchar(11) DEFAULT '' COMMENT '客户编号',
  `customer_name` varchar(50) DEFAULT '' COMMENT '客户名称',
  `customer_type` varchar(50) DEFAULT '' COMMENT '客户类别',
  `customer_address` varchar(50) DEFAULT '' COMMENT '用户地址',
  `customer_phone` varchar(15) DEFAULT '' COMMENT '客户电话',
  `types` varchar(50) DEFAULT '' COMMENT '类别：如供应商、部门、客户',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `status` tinyint(3) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

INSERT INTO `oc_storehouse_customer` VALUES ('1', 'GYS1001', 'XX供应商', '公司部门', '234', '13544565874', '公司部门', '2017-09-05 17:11:09', '0000-00-00 00:00:00', '1');
INSERT INTO `oc_storehouse_customer` VALUES ('2', 'KH1001', 'XXX世纪百货', '公司部门', '234', '13544565874', '供应商', '2017-09-07 12:38:23', '0000-00-00 00:00:00', '1');
INSERT INTO `oc_storehouse_customer` VALUES ('3', 'KH0002', '玫瑰之家', '4X', '士大夫十分', '13265656565', '客户', '2017-09-11 21:42:31', '0000-00-00 00:00:00', '1');
