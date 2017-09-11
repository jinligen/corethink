
DROP TABLE IF EXISTS `oc_storehouse_out_order_type`;
CREATE TABLE `oc_storehouse_out_order_type` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `out_order_type_id` varchar(11) DEFAULT '' COMMENT '出库单类型编号',
  `out_order_type_name` varchar(50) DEFAULT '' COMMENT '出库单类型名称',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `status` tinyint(3) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

INSERT INTO `oc_storehouse_out_order_type` VALUES ('1', '001', '材料出库单', '2017-09-11 21:04:57', '0000-00-00 00:00:00', '1');
INSERT INTO `oc_storehouse_out_order_type` VALUES ('2', '002', '产品出库单', '2017-09-11 21:05:07', '0000-00-00 00:00:00', '1');
