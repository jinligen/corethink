
DROP TABLE IF EXISTS `oc_storehouse_info`;
CREATE TABLE `oc_storehouse_info` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `storehouse_id` varchar(11) DEFAULT '' COMMENT '仓库编号',
  `storehouse_name` varchar(50) DEFAULT '' COMMENT '仓库名称',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `status` tinyint(3) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

INSERT INTO `oc_storehouse_info` VALUES ('2', 'CK0002', '产品仓', '2017-09-05 16:12:30', '0000-00-00 00:00:00', '1');
INSERT INTO `oc_storehouse_info` VALUES ('3', 'CK0001', '原料仓', '2017-09-13 19:36:38', '0000-00-00 00:00:00', '1');
