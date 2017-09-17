
DROP TABLE IF EXISTS `oc_storehouse_goods_check`;
CREATE TABLE `oc_storehouse_goods_check` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `goods_check_id` varchar(50) DEFAULT '',
  `goods_type_name` varchar(50) DEFAULT '' COMMENT '商品类型',
  `goods_id` varchar(11) DEFAULT '' COMMENT '商品编号',
  `goods_name` varchar(50) DEFAULT '' COMMENT '商品名称',
  `goods_spec` varchar(50) DEFAULT '' COMMENT '商品规格',
  `goods_min_unit` varchar(10) DEFAULT '' COMMENT '商品最小计量单位',
  `goods_stock_balance` decimal(10,2) DEFAULT '0.00' COMMENT '商品库存量',
  `goods_check_balance` decimal(10,2) DEFAULT '0.00' COMMENT '商品盘点数量',
  `storehouse_name` varchar(50) DEFAULT '' COMMENT '商品所在仓库',
  `goods_check_is_audited` int(2) DEFAULT '0' COMMENT '是否审核',
  `username` varchar(20) DEFAULT '' COMMENT '操作人（英文）',
  `nickname` varchar(20) DEFAULT '' COMMENT '操作人（中文）',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `status` tinyint(3) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

INSERT INTO `oc_storehouse_goods_check` VALUES ('1', 'PD000001', '', 'CP0001', '井盖', 'JQ-300*300', 'kg', '501.00', '500.00', '产品仓', '1', 'admin', '超级管理员', '2017-09-17 21:55:18', '0000-00-00 00:00:00', '1');
INSERT INTO `oc_storehouse_goods_check` VALUES ('2', 'PD000002', '', 'YCL0001', '铸铁', '500*500 B125', 'kg', '2100.00', '2000.00', '原料仓', '1', 'admin', '超级管理员', '2017-09-17 22:00:23', '0000-00-00 00:00:00', '1');
