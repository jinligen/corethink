
DROP TABLE IF EXISTS `oc_storehouse_clerk`;
CREATE TABLE `oc_storehouse_clerk` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `clerk_id` varchar(50) DEFAULT '' COMMENT '业务员编号',
  `clerk_name` varchar(50) DEFAULT '' COMMENT '业务员名称',
  `clerk_phone` varchar(15) DEFAULT '' COMMENT '业务员电话',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `status` tinyint(3) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

INSERT INTO `oc_storehouse_clerk` VALUES ('1', 'YWY0001', '张三', '15233652321', '2017-09-05 08:57:58', '0000-00-00 00:00:00', '1');
INSERT INTO `oc_storehouse_clerk` VALUES ('2', 'YWY0002', '王文静', '19866545852', '2017-09-17 11:29:06', '0000-00-00 00:00:00', '1');
INSERT INTO `oc_storehouse_clerk` VALUES ('3', 'YWY0003', '李思静', '13566548652', '2017-09-17 11:29:23', '0000-00-00 00:00:00', '1');
