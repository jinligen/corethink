
DROP TABLE IF EXISTS `oc_storehouse_clerk`;
CREATE TABLE `oc_storehouse_clerk` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `clerk_name` varchar(50) DEFAULT '' COMMENT '业务员名称',
  `clerk_phone` varchar(15) DEFAULT '' COMMENT '业务员电话',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `status` tinyint(3) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

INSERT INTO `oc_storehouse_clerk` VALUES ('1', '张三', '135886654896', '2017-09-05 16:57:58', '0000-00-00 00:00:00', '1');
INSERT INTO `oc_storehouse_clerk` VALUES ('2', '王文静', '19866545852', '2017-09-17 19:29:06', '0000-00-00 00:00:00', '1');
INSERT INTO `oc_storehouse_clerk` VALUES ('3', '李思静', '13566548652', '2017-09-17 19:29:23', '0000-00-00 00:00:00', '1');
