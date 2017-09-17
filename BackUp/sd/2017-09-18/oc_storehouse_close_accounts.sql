
DROP TABLE IF EXISTS `oc_storehouse_close_accounts`;
CREATE TABLE `oc_storehouse_close_accounts` (
  `id` int(8) unsigned NOT NULL AUTO_INCREMENT,
  `close_date` date DEFAULT '0000-00-00' COMMENT '结账日期',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `status` tinyint(2) DEFAULT '1',
  `username` varchar(50) DEFAULT '',
  `nickname` varchar(50) DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

INSERT INTO `oc_storehouse_close_accounts` VALUES ('1', '2017-09-25', '2017-09-17 23:24:39', '0000-00-00 00:00:00', '1', 'admin', '超级管理员');
