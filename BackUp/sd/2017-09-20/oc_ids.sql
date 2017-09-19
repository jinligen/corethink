
DROP TABLE IF EXISTS `oc_ids`;
CREATE TABLE `oc_ids` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `type` varchar(50) DEFAULT '',
  `order_id` varchar(50) DEFAULT '',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `status` tinyint(2) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

INSERT INTO `oc_ids` VALUES ('1', 'CGRKD', '5', '2017-09-19 23:07:55', '0000-00-00 00:00:00', '1');
INSERT INTO `oc_ids` VALUES ('2', 'CPRKD', '4', '2017-09-19 23:08:03', '0000-00-00 00:00:00', '1');
INSERT INTO `oc_ids` VALUES ('3', 'CLCKD', '1', '2017-09-19 23:08:10', '0000-00-00 00:00:00', '1');
INSERT INTO `oc_ids` VALUES ('4', 'XSCKD', '3', '2017-09-19 23:08:17', '0000-00-00 00:00:00', '1');
INSERT INTO `oc_ids` VALUES ('5', 'FKD', '2', '2017-09-19 23:08:24', '0000-00-00 00:00:00', '1');
INSERT INTO `oc_ids` VALUES ('6', 'SKD', '2', '2017-09-19 23:08:29', '0000-00-00 00:00:00', '1');
INSERT INTO `oc_ids` VALUES ('7', 'XSDD', '2', '2017-09-19 23:08:37', '0000-00-00 00:00:00', '1');
INSERT INTO `oc_ids` VALUES ('8', 'CPRKD', '5', '2017-09-19 23:15:56', '0000-00-00 00:00:00', '1');
