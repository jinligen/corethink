
DROP TABLE IF EXISTS `oc_storehouse_out_order`;
CREATE TABLE `oc_storehouse_out_order` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `out_order_type_name` varchar(50) DEFAULT '' COMMENT '出库单类型',
  `out_order_id` varchar(11) DEFAULT '' COMMENT '出库单编号',
  `out_order_invoice_number` varchar(50) DEFAULT '' COMMENT '发票号码',
  `out_order_price` decimal(10,2) DEFAULT '0.00' COMMENT '单据金额',
  `out_order_payment_way` varchar(10) DEFAULT '' COMMENT '支付方式',
  `out_order_remark` varchar(50) DEFAULT '' COMMENT '摘要',
  `out_order_payment_account` varchar(20) DEFAULT '' COMMENT '支付账户',
  `out_order_deposit_rate` decimal(4,2) DEFAULT '0.00' COMMENT '折扣率',
  `out_order_tax_rate` decimal(4,2) DEFAULT '0.00' COMMENT '税率',
  `out_order_including_tax_price` decimal(10,2) DEFAULT '0.00' COMMENT '含税金额',
  `out_order_account_receivable` decimal(10,2) DEFAULT '0.00' COMMENT '应收金额',
  `out_order_actual_payment` decimal(10,2) DEFAULT '0.00' COMMENT '实际支付',
  `out_order_payment_date` date DEFAULT '0000-00-00' COMMENT '支付日期',
  `out_order_is_audited` int(2) DEFAULT '0' COMMENT '是否审核',
  `audited_date` date DEFAULT NULL COMMENT '审核日期',
  `out_order_date` date DEFAULT '0000-00-00' COMMENT '单据发生日期',
  `customer_id` varchar(50) DEFAULT '' COMMENT '客户/供应商/部门 编号',
  `customer_name` varchar(50) DEFAULT '' COMMENT '客户/供应商/部门 名称',
  `storehouse_name` varchar(50) DEFAULT '' COMMENT '所属仓库',
  `invoice_type` varchar(50) DEFAULT '' COMMENT '发票类型',
  `username` varchar(50) DEFAULT '' COMMENT '操作人（英文）',
  `nickname` varchar(50) DEFAULT '' COMMENT '操作人（中文）',
  `clerk_id` varchar(50) DEFAULT '',
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
  `goods_out_unit_price` decimal(10,2) DEFAULT '0.00' COMMENT '商品调出单价',
  `goods_out_total_quantity` decimal(10,2) DEFAULT '0.00' COMMENT '商品调出数量',
  `goods_out_total_price` decimal(10,2) DEFAULT '0.00' COMMENT '商品调出金额',
  `goods_return_unit_price` decimal(10,2) DEFAULT '0.00' COMMENT '商品退货单价',
  `goods_return_total_quantity` decimal(10,2) DEFAULT '0.00' COMMENT '商品退货数量',
  `goods_return_total_price` decimal(10,2) DEFAULT '0.00' COMMENT '商品退货金额',
  `goods_remark` varchar(20) DEFAULT '' COMMENT '商品备注',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '单据生成时间',
  `update_time` timestamp NULL DEFAULT '0000-00-00 00:00:00',
  `status` tinyint(3) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

INSERT INTO `oc_storehouse_out_order` VALUES ('1', '材料出库单', 'CL000001', '', '3.00', '', '实验室', '', '0.00', '0.00', '0.00', '0.00', '0.00', '0000-00-00', '1', '', '2017-09-15', 'BM1001', '财务部', '原料仓', '', 'admin', '超级管理员', '', '', '', 'YCL0001', '铸铁', '500*500 B125', 'kg', '300/件,500/箱,3000/吨', '件', '300.00', '0.00', '0.00', '0.00', '0.00', '0', '3.00', '1.00', '3.00', '0.00', '0.00', '0.00', '似的士大夫士大夫', '2017-09-17 13:25:30', '0000-00-00 00:00:00', '1');
INSERT INTO `oc_storehouse_out_order` VALUES ('2', '销售出库单', 'XS000001', '', '15.00', '', 'sdfsdfsd', '', '0.00', '10.00', '1.50', '13.50', '10.00', '0000-00-00', '0', '', '2017-09-13', 'KH0002', '郑州市市政管理中心', '产品仓', '', 'admin', '超级管理员', '', '', '', 'CP0001', '井盖', 'JQ-300*300', 'kg', '500/箱,1000/吨', '箱', '1500.00', '0.00', '0.00', '0.00', '0.00', '0', '5.00', '3.00', '15.00', '0.00', '0.00', '0.00', 'sdf', '2017-09-17 13:37:14', '0000-00-00 00:00:00', '1');
INSERT INTO `oc_storehouse_out_order` VALUES ('3', '销售出库单', 'XSCKD00002', '', '32.00', '', '', '', '0.00', '1.00', '0.32', '31.68', '31.68', '0000-00-00', '0', '', '2017-09-21', 'KH0001', 'XXX市政局', '产品仓', '', 'admin', '超级管理员', '', '', '', 'CP0001', '井盖', 'JQ-300*300', 'kg', '500/箱,1000/吨', '箱', '2000.00', '0.00', '0.00', '0.00', '0.00', '0', '8.00', '4.00', '32.00', '0.00', '0.00', '0.00', 'sdfsfdsdf', '2017-09-17 17:41:24', '0000-00-00 00:00:00', '1');
INSERT INTO `oc_storehouse_out_order` VALUES ('4', '材料出库单', 'sdfdsf', '', '0.00', '', 'sdfdsf', '', '0.00', '0.00', '0.00', '0.00', '0.00', '0000-00-00', '0', '', '2017-09-14', 'BM1001', '财务部', '原料仓', '', 'admin', '超级管理员', '', '', '', 'YCL0001', '铸铁', '500*500 B125', 'kg', '300/件,500/箱,3000/吨', 'kg', '0.00', '0.00', '0.00', '0.00', '0.00', '0', '3.00', '0.00', '0.00', '0.00', '0.00', '0.00', '', '2017-09-19 16:42:57', '0000-00-00 00:00:00', '1');
INSERT INTO `oc_storehouse_out_order` VALUES ('5', '销售出库单', 'sdfsdf', '', '10.00', '', '', '', '0.00', '0.00', '0.00', '10.00', '0.00', '0000-00-00', '0', '', '2017-09-20', 'KH0002', '郑州市市政管理中心', '产品仓', '', 'admin', '超级管理员', '', '', '', 'CP0001', '井盖', 'JQ-300*300', 'kg', '500/箱,1000/吨', 'kg', '2.00', '0.00', '0.00', '0.00', '0.00', '0', '5.00', '2.00', '10.00', '0.00', '0.00', '0.00', '2343', '2017-09-19 16:45:14', '0000-00-00 00:00:00', '1');
INSERT INTO `oc_storehouse_out_order` VALUES ('6', '销售出库单', 'dsdfsdf', '', '25.00', '', '', '', '0.00', '0.00', '0.00', '25.00', '0.00', '0000-00-00', '0', '', '2017-09-13', 'KH0002', '郑州市市政管理中心', '产品仓', '', 'admin', '超级管理员', '', '', '', 'CP0001', '井盖', 'JQ-300*300', 'kg', '500/箱,1000/吨', 'kg', '5.00', '0.00', '0.00', '0.00', '0.00', '0', '5.00', '5.00', '25.00', '0.00', '0.00', '0.00', '', '2017-09-19 16:47:22', '0000-00-00 00:00:00', '1');
INSERT INTO `oc_storehouse_out_order` VALUES ('7', '销售出库单', 'sdf', '', '20.00', '', '', '', '0.00', '21.00', '4.20', '15.80', '0.00', '0000-00-00', '0', '', '2017-09-21', 'KH0001', 'XXX市政局', '原料仓', '', 'admin', '超级管理员', '', '', '', 'CP0001', '井盖', 'JQ-300*300', 'kg', '500/箱,1000/吨', 'kg', '4.00', '0.00', '0.00', '0.00', '0.00', '0', '5.00', '4.00', '20.00', '0.00', '0.00', '0.00', '', '2017-09-19 16:53:38', '0000-00-00 00:00:00', '1');
INSERT INTO `oc_storehouse_out_order` VALUES ('8', '销售出库单', '43534', '', '2.00', '', '', '', '0.00', '0.00', '0.00', '2.00', '0.00', '0000-00-00', '0', '', '2017-09-14', 'KH0001', 'XXX市政局', '原料仓', '', 'admin', '超级管理员', '', '', '', 'CP0001', '井盖', 'JQ-300*300', 'kg', '500/箱,1000/吨', 'kg', '0.00', '0.00', '0.00', '0.00', '0.00', '0', '5.00', '0.00', '0.00', '0.00', '0.00', '0.00', '', '2017-09-19 16:55:03', '0000-00-00 00:00:00', '1');
INSERT INTO `oc_storehouse_out_order` VALUES ('9', '销售出库单', '123213', '', '22.00', '', '2334', '', '0.00', '0.00', '0.00', '22.00', '12.00', '0000-00-00', '1', '', '2017-09-07', 'KH0001', 'XXX市政局', '产品仓', '', 'admin', '超级管理员', 'YWY0002', '王文静', '财务部', 'CP0001', '井盖', 'JQ-300*300', 'kg', '500/箱,1000/吨', '箱', '2000.00', '0.00', '0.00', '0.00', '0.00', '0', '5.50', '4.00', '22.00', '0.00', '0.00', '0.00', 'sdfsfdsdf', '2017-09-19 17:04:04', '0000-00-00 00:00:00', '1');
