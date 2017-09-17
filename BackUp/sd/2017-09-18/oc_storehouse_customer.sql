
DROP TABLE IF EXISTS `oc_storehouse_customer`;
CREATE TABLE `oc_storehouse_customer` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `customer_id` varchar(11) DEFAULT '' COMMENT '客户编号',
  `customer_name` varchar(50) DEFAULT '' COMMENT '客户名称',
  `customer_type` varchar(50) DEFAULT '' COMMENT '客户类别',
  `customer_address` varchar(50) DEFAULT '' COMMENT '用户地址',
  `customer_phone` varchar(15) DEFAULT '' COMMENT '客户电话',
  `types` varchar(50) DEFAULT '' COMMENT '类别：如供应商、部门、客户',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `status` tinyint(3) DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQUE` (`customer_id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

INSERT INTO `oc_storehouse_customer` VALUES ('1', 'BM1001', '财务部', '公司部门', '/', '13544565874', '公司部门', '2017-09-05 17:11:09', '0000-00-00 00:00:00', '1');
INSERT INTO `oc_storehouse_customer` VALUES ('2', 'GYS1001', 'XXX建材有限公司', '公司部门', '河南省郑州市百合路118号', '13544565874', '供应商', '2017-09-07 12:38:23', '0000-00-00 00:00:00', '1');
INSERT INTO `oc_storehouse_customer` VALUES ('3', 'KH0001', 'XXX市政局', '4X', '解放路', '13265656565', '客户', '2017-09-11 21:42:31', '0000-00-00 00:00:00', '1');
INSERT INTO `oc_storehouse_customer` VALUES ('4', 'KH0002', '郑州市市政管理中心', '', '泰中路1256号', '13655465234', '客户', '2017-09-17 20:47:24', '0000-00-00 00:00:00', '1');
