
DROP TABLE IF EXISTS `oc_storehouse_entry_order_type`;
CREATE TABLE `oc_storehouse_entry_order_type` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_order_type_id` varchar(11) DEFAULT '' COMMENT '入库单类型编号',
  `entry_order_type_name` varchar(50) DEFAULT '' COMMENT '入库单类型名称',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `status` tinyint(3) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

