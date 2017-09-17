
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
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQUE` (`goods_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

INSERT INTO `oc_storehouse_goods` VALUES ('1', '产品', 'CP0001', '井盖', 'JQ-300*300', 'kg', '500/箱,1000/吨', '3500.00', '5.00', '10.00', '产品仓', '', '', '2017-09-15 01:26:08', '0000-00-00 00:00:00', '1');
INSERT INTO `oc_storehouse_goods` VALUES ('2', '原材料', 'YCL0001', '铸铁', '500*500 B125', 'kg', '300/件,500/箱,3000/吨', '2000.00', '3.00', '0.00', '原料仓', '', '', '2017-09-15 01:26:08', '0000-00-00 00:00:00', '1');
