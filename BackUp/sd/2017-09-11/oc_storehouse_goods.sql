
DROP TABLE IF EXISTS `oc_storehouse_goods`;
CREATE TABLE `oc_storehouse_goods` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `goods_type_name` varchar(50) DEFAULT '' COMMENT '商品类型',
  `goods_id` varchar(11) DEFAULT '' COMMENT '商品编号',
  `goods_name` varchar(50) DEFAULT '' COMMENT '商品名称',
  `goods_spec` varchar(50) DEFAULT '' COMMENT '商品规格',
  `goods_min_unit` varchar(10) DEFAULT '' COMMENT '商品最小计量单位',
  `goods_rates` varchar(100) DEFAULT '' COMMENT '换算率集合',
  `goods_stock_balance` decimal(10,2) DEFAULT '0.00' COMMENT '商品库存量',
  `goods_cost_price` decimal(10,2) DEFAULT '0.00' COMMENT '商品成本价',
  `goods_market_price` decimal(10,2) DEFAULT '0.00' COMMENT '商品销售价',
  `storehouse_name` varchar(50) DEFAULT '' COMMENT '商品所在仓库',
  `username` varchar(20) DEFAULT '' COMMENT '操作人（英文）',
  `nickname` varchar(20) DEFAULT '' COMMENT '操作人（中文）',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `status` tinyint(3) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

INSERT INTO `oc_storehouse_goods` VALUES ('8', '原材料', '456456456', '士大夫', '士大夫', '士大夫', '士大夫 ', '0.00', '3.23', '0.00', '产品仓', '', '', '2017-09-05 15:12:17', '0000-00-00 00:00:00', '1');
INSERT INTO `oc_storehouse_goods` VALUES ('7', '成品', '234324', '1·1', '11', '11', '11', '11.00', '11.00', '11.00', '11', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '-1');
INSERT INTO `oc_storehouse_goods` VALUES ('9', '成品', '234', 'ewk', 'ee', '123', '234', '234.00', '234.00', '234.00', '产品仓', 'admin', '超级管理员', '2017-09-05 16:01:58', '0000-00-00 00:00:00', '1');
