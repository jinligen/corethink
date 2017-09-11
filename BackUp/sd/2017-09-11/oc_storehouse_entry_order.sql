
DROP TABLE IF EXISTS `oc_storehouse_entry_order`;
CREATE TABLE `oc_storehouse_entry_order` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_order_type_name` varchar(50) DEFAULT '' COMMENT '入库单类型',
  `entry_order_id` varchar(11) DEFAULT '' COMMENT '入库单编号',
  `entry_order_invoice_number` varchar(50) DEFAULT '' COMMENT '发票号码',
  `entry_order_price` decimal(10,2) DEFAULT '0.00' COMMENT '单据金额',
  `entry_order_payment_way` varchar(10) DEFAULT '' COMMENT '支付方式',
  `entry_order_remark` varchar(50) DEFAULT '' COMMENT '摘要',
  `entry_order_payment_account` varchar(20) DEFAULT '' COMMENT '支付账户',
  `entry_order_deposit_rate` decimal(4,2) DEFAULT '0.00' COMMENT '折扣率',
  `entry_order_tax_rate` decimal(4,2) DEFAULT '0.00' COMMENT '税率',
  `entry_order_including_tax_price` decimal(10,2) DEFAULT '0.00' COMMENT '含税金额',
  `entry_order_account_payable` decimal(10,2) DEFAULT '0.00' COMMENT '应付金额',
  `entry_order_actual_payment` decimal(10,2) DEFAULT '0.00' COMMENT '实际支付',
  `entry_order_payment_date` date DEFAULT NULL COMMENT '支付日期',
  `entry_order_is_audited` int(2) DEFAULT '0' COMMENT '是否审核',
  `customer_id` varchar(50) DEFAULT '' COMMENT '客户/供应商/部门 编号',
  `customer_name` varchar(50) DEFAULT '' COMMENT '客户/供应商/部门 名称',
  `storehouse_name` varchar(50) DEFAULT '' COMMENT '所属仓库',
  `invoice_type` varchar(50) DEFAULT '' COMMENT '发票类型',
  `username` varchar(50) DEFAULT '' COMMENT '操作人（英文）',
  `nickname` varchar(50) DEFAULT '' COMMENT '操作人（中文）',
  `clerk_name` varchar(50) DEFAULT '' COMMENT '业务员',
  `goods_id` varchar(11) DEFAULT '' COMMENT '商品编码',
  `goods_name` varchar(50) DEFAULT '' COMMENT '商品名称',
  `goods_spec` varchar(50) DEFAULT '' COMMENT '商品规格',
  `goods_min_unit` varchar(10) DEFAULT '' COMMENT '商品最小单位',
  `goods_actual_unit` varchar(10) DEFAULT '' COMMENT '商品实际单位',
  `goods_stock_balance` decimal(10,2) DEFAULT '0.00' COMMENT '商品帐存量',
  `goods_actual_stock_balance` decimal(10,2) DEFAULT '0.00' COMMENT '商品实际数量',
  `goods_cost_price` decimal(10,2) DEFAULT '0.00' COMMENT '商品单价',
  `goods_order_quantity` decimal(10,2) DEFAULT '0.00' COMMENT '商品订购数量',
  `goods_is_free` int(2) DEFAULT '0' COMMENT '商品是否为赠品 0-否 1-是',
  `goods_entry_unit_price` decimal(10,2) DEFAULT '0.00' COMMENT '商品调入单价',
  `goods_entry_total_quantity` decimal(10,2) DEFAULT '0.00' COMMENT '商品调入数量',
  `goods_entry_total_price` decimal(10,2) DEFAULT '0.00' COMMENT '商品调入金额',
  `goods_return_unit_price` decimal(10,2) DEFAULT '0.00' COMMENT '商品退货单价',
  `goods_return_total_quantity` decimal(10,2) DEFAULT '0.00' COMMENT '商品退货数量',
  `goods_return_total_price` decimal(10,2) DEFAULT '0.00' COMMENT '商品退货金额',
  `goods_remark` varchar(20) DEFAULT '' COMMENT '商品备注',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '单据生成时间',
  `update_time` timestamp NULL DEFAULT '0000-00-00 00:00:00',
  `status` tinyint(3) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

INSERT INTO `oc_storehouse_entry_order` VALUES ('1', '采购入库单', 'JD0001', '', '500.00', '', '特殊', '', '0.00', '0.00', '0.00', '0.00', '88.00', '2017-09-20', '1', 'KH1001', 'XXX世纪百货', '1号仓', '', 'admin', '超级管理员', '', '456456456', '士大夫', '士大夫', '', '士大夫', '0.00', '0.00', '0.00', '0.00', '0', '3.23', '520.00', '1679.60', '0.00', '0.00', '0.00', '', '2017-09-10 17:45:26', '0000-00-00 00:00:00', '1');
INSERT INTO `oc_storehouse_entry_order` VALUES ('2', '采购入库单', 'JD0001', '', '500.00', '', '特殊', '', '0.00', '0.00', '0.00', '0.00', '88.00', '2017-09-20', '1', 'KH1001', 'XXX世纪百货', '1号仓', '', 'admin', '超级管理员', '', '234324', '1·1', '11', '', '11', '0.00', '0.00', '0.00', '0.00', '0', '11.00', '25.00', '275.00', '0.00', '0.00', '0.00', '', '2017-09-10 17:45:26', '0000-00-00 00:00:00', '1');
INSERT INTO `oc_storehouse_entry_order` VALUES ('3', '采购入库单', 'JD0001', '', '500.00', '', '特殊', '', '0.00', '0.00', '0.00', '0.00', '88.00', '2017-09-20', '1', 'KH1001', 'XXX世纪百货', '1号仓', '', 'admin', '超级管理员', '', '234', 'ewk', 'ee', '', '123', '0.00', '0.00', '0.00', '0.00', '0', '234.00', '222.00', '51948.00', '0.00', '0.00', '0.00', '', '2017-09-10 17:45:26', '0000-00-00 00:00:00', '1');
INSERT INTO `oc_storehouse_entry_order` VALUES ('4', '采购入库单', 'JD00002', '', '222.00', '', 'sdfsdf ', '', '0.00', '0.00', '0.00', '0.00', '3.00', '2017-09-14', '1', 'KH1001', 'XXX世纪百货', '2号仓', '', 'admin', '超级管理员', '', '456456456', '士大夫', '士大夫', '', '士大夫', '0.00', '0.00', '0.00', '0.00', '0', '3.23', '3.00', '9.69', '0.00', '0.00', '0.00', '', '2017-09-10 18:51:56', '0000-00-00 00:00:00', '1');
INSERT INTO `oc_storehouse_entry_order` VALUES ('5', '采购入库单', 'JD00002', '', '222.00', '', 'sdfsdf ', '', '0.00', '0.00', '0.00', '0.00', '3.00', '2017-09-14', '1', 'KH1001', 'XXX世纪百货', '2号仓', '', 'admin', '超级管理员', '', '234324', '1·1', '11', '', '11', '0.00', '0.00', '0.00', '0.00', '0', '11.00', '3.00', '33.00', '0.00', '0.00', '0.00', '', '2017-09-10 18:51:56', '0000-00-00 00:00:00', '1');
INSERT INTO `oc_storehouse_entry_order` VALUES ('6', '采购入库单', 'JD00002', '', '222.00', '', 'sdfsdf ', '', '0.00', '0.00', '0.00', '0.00', '3.00', '2017-09-14', '1', 'KH1001', 'XXX世纪百货', '2号仓', '', 'admin', '超级管理员', '', '234', 'ewk', 'ee', '', '123', '0.00', '0.00', '0.00', '0.00', '0', '234.00', '3.00', '702.00', '0.00', '0.00', '0.00', '', '2017-09-10 18:51:56', '0000-00-00 00:00:00', '1');
INSERT INTO `oc_storehouse_entry_order` VALUES ('7', '产品入库单', 'JD0002', '', '0.00', '', 'sdfsdfsdf', '', '0.00', '0.00', '0.00', '0.00', '0.00', '2017-09-21', '0', 'GYS1001', 'XX供应商', '2号仓', '', 'admin', '超级管理员', '', '234324', '1·1', '11', '', '11', '0.00', '0.00', '0.00', '0.00', '0', '11.00', '23.00', '253.00', '0.00', '0.00', '0.00', '', '2017-09-10 22:13:59', '0000-00-00 00:00:00', '1');
INSERT INTO `oc_storehouse_entry_order` VALUES ('8', '产品入库单', 'JD0002', '', '0.00', '', 'sdfsdfsdf', '', '0.00', '0.00', '0.00', '0.00', '0.00', '2017-09-21', '0', 'GYS1001', 'XX供应商', '2号仓', '', 'admin', '超级管理员', '', '234', 'ewk', 'ee', '', '123', '0.00', '0.00', '0.00', '0.00', '0', '234.00', '23.00', '5382.00', '0.00', '0.00', '0.00', '', '2017-09-10 22:13:59', '0000-00-00 00:00:00', '1');
INSERT INTO `oc_storehouse_entry_order` VALUES ('9', '产品入库单', 'JD0003', '', '0.00', '', 'sdfsdf', '', '0.00', '0.00', '0.00', '0.00', '0.00', '2017-09-14', '1', 'GYS1001', 'XX供应商', '2号仓', '', 'admin', '超级管理员', '', '234324', '1·1', '11', '', '11', '0.00', '0.00', '0.00', '0.00', '0', '11.00', '2.00', '22.00', '0.00', '0.00', '0.00', '', '2017-09-10 22:17:55', '0000-00-00 00:00:00', '1');
