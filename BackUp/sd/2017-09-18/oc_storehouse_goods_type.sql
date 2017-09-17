
DROP TABLE IF EXISTS `oc_storehouse_goods_type`;
CREATE TABLE `oc_storehouse_goods_type` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `goods_type_id` varchar(11) DEFAULT '' COMMENT '商品类型编号',
  `goods_type_name` varchar(50) DEFAULT '' COMMENT '商品类型名称',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` timestamp NULL DEFAULT '0000-00-00 00:00:00',
  `status` tinyint(3) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

INSERT INTO `oc_storehouse_goods_type` VALUES ('1', 'SP001', '原材料', '2017-09-05 17:13:26', '0000-00-00 00:00:00', '1');
INSERT INTO `oc_storehouse_goods_type` VALUES ('2', 'SP002', '产品', '2017-09-05 17:14:15', '0000-00-00 00:00:00', '1');
