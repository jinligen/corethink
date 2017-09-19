
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
  `entry_order_payment_date` date DEFAULT '0000-00-00' COMMENT '支付日期',
  `entry_order_is_audited` int(2) DEFAULT '0' COMMENT '是否审核',
  `audited_date` date DEFAULT NULL COMMENT '审核日期',
  `entry_order_date` date DEFAULT '0000-00-00' COMMENT '单据发生日期',
  `customer_id` varchar(50) DEFAULT '' COMMENT '客户/供应商/部门 编号',
  `customer_name` varchar(50) DEFAULT '' COMMENT '客户/供应商/部门 名称',
  `storehouse_name` varchar(50) DEFAULT '' COMMENT '所属仓库',
  `invoice_type` varchar(50) DEFAULT '' COMMENT '发票类型',
  `username` varchar(50) DEFAULT '' COMMENT '操作人（英文）',
  `nickname` varchar(50) DEFAULT '' COMMENT '操作人（中文）',
  `clerk_id` varchar(50) DEFAULT '' COMMENT '业务员编号',
  `clerk_name` varchar(50) DEFAULT '' COMMENT '业务员',
  `department` varchar(50) DEFAULT '' COMMENT '部门',
  `goods_id` varchar(11) DEFAULT '' COMMENT '商品编码',
  `goods_name` varchar(50) DEFAULT '' COMMENT '商品名称',
  `goods_spec` varchar(50) DEFAULT '' COMMENT '商品规格',
  `goods_min_unit` varchar(10) DEFAULT '' COMMENT '商品最小单位',
  `goods_rates` varchar(100) DEFAULT '' COMMENT '换算率集合',
  `goods_actual_unit` varchar(10) DEFAULT '' COMMENT '商品实际单位',
  `goods_weight` decimal(10,2) DEFAULT '0.00' COMMENT '商品重量',
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
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

INSERT INTO `oc_storehouse_entry_order` VALUES ('1', '采购入库单', 'CGRKD000001', '', '150.00', '', '测试下雨', '', '0.00', '0.00', '0.00', '150.00', '100.00', '0000-00-00', '1', '', '2017-09-14', 'GYS1001', 'XXX建材有限公司', '原料仓', '', 'admin', '超级管理员', '', '', '', 'YCL0001', '铸铁', '500*500 B125', 'kg', '300/件,500/箱,3000/吨', '件', '900.00', '0.00', '0.00', '0.00', '0.00', '0', '50.00', '3.00', '150.00', '0.00', '0.00', '0.00', 'test', '2017-09-17 12:18:16', '0000-00-00 00:00:00', '1');
INSERT INTO `oc_storehouse_entry_order` VALUES ('4', '产品入库单', 'CPRKD00003', '', '25.00', '', 'SDFSDF', '', '0.00', '0.00', '0.00', '0.00', '0.00', '0000-00-00', '0', '', '2017-09-21', 'BM1001', '财务部', '产品仓', '', 'admin', '超级管理员', '', '', '', 'CP0001', '井盖', 'JQ-300*300', 'kg', '500/箱,1000/吨', '吨', '5000.00', '0.00', '0.00', '0.00', '0.00', '0', '5.00', '5.00', '25.00', '0.00', '0.00', '0.00', 'SDFSDWERW', '2017-09-17 17:42:46', '0000-00-00 00:00:00', '1');
INSERT INTO `oc_storehouse_entry_order` VALUES ('3', '产品入库单', 'CP000001', '', '8.00', '', 'sdfsdf ', '', '0.00', '0.00', '0.00', '0.00', '0.00', '0000-00-00', '1', '', '2017-09-21', 'BM1001', '财务部', '产品仓', '', 'admin', '超级管理员', '', '', '', 'CP0001', '井盖', 'JQ-300*300', 'kg', '500/箱,1000/吨', '箱', '500.00', '0.00', '0.00', '0.00', '0.00', '0', '8.00', '1.00', '8.00', '0.00', '0.00', '0.00', 'sdfsdf', '2017-09-17 13:33:21', '0000-00-00 00:00:00', '1');
INSERT INTO `oc_storehouse_entry_order` VALUES ('5', '采购入库单', 'CGRKD000002', '', '9.00', '', 'dsfdsf', '', '0.00', '17.00', '1.53', '7.47', '7.47', '0000-00-00', '0', '', '2017-09-14', 'GYS1001', 'XXX建材有限公司', '原料仓', '', 'admin', '超级管理员', 'YWY0002', '王文静', '财务部', 'YCL0001', '铸铁', '500*500 B125', 'kg', '300/件,500/箱,3000/吨', '吨', '9000.00', '0.00', '0.00', '0.00', '0.00', '0', '3.00', '3.00', '9.00', '0.00', '0.00', '0.00', '', '2017-09-19 14:29:24', '0000-00-00 00:00:00', '1');
INSERT INTO `oc_storehouse_entry_order` VALUES ('6', '采购入库单', 'CGRKD000003', '', '3.00', '', '', '', '0.00', '12.00', '0.36', '2.64', '2.60', '0000-00-00', '0', '', '2017-09-05', 'GYS1001', 'XXX建材有限公司', '原料仓', '', 'admin', '超级管理员', 'YWY0003', '李思静', '财务部', 'YCL0001', '铸铁', '500*500 B125', 'kg', '300/件,500/箱,3000/吨', 'kg', '1.00', '0.00', '0.00', '0.00', '0.00', '0', '3.00', '1.00', '3.00', '0.00', '0.00', '0.00', '', '2017-09-19 16:15:19', '0000-00-00 00:00:00', '1');
INSERT INTO `oc_storehouse_entry_order` VALUES ('7', '采购入库单', 'CGRKD000004', '', '3.00', '', '', '', '0.00', '1.00', '0.03', '2.97', '2.00', '0000-00-00', '0', '', '2017-09-20', 'GYS1001', 'XXX建材有限公司', '原料仓', '', 'admin', '超级管理员', 'YWY0001', '张三', '财务部', 'YCL0001', '铸铁', '500*500 B125', 'kg', '300/件,500/箱,3000/吨', 'kg', '1.00', '0.00', '0.00', '0.00', '0.00', '0', '3.00', '1.00', '3.00', '0.00', '0.00', '0.00', '', '2017-09-19 16:17:05', '0000-00-00 00:00:00', '1');
