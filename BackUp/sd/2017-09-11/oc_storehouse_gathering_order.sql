
DROP TABLE IF EXISTS `oc_storehouse_gathering_order`;
CREATE TABLE `oc_storehouse_gathering_order` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `gathering_order_type_name` varchar(50) DEFAULT '' COMMENT '收款单类型',
  `gathering_order_id` varchar(11) DEFAULT '' COMMENT '收款单编号',
  `gathering_order_invoice_number` varchar(50) DEFAULT '' COMMENT '发票号码',
  `gathering_order_payment_way` varchar(10) DEFAULT '' COMMENT '支付方式',
  `gathering_order_remark` varchar(50) DEFAULT '' COMMENT '摘要',
  `gathering_order_payment_account` varchar(20) DEFAULT '' COMMENT '支付账户',
  `gathering_order_price` decimal(10,2) DEFAULT '0.00' COMMENT '单据金额',
  `gathering_order_deposit_rate` decimal(4,2) DEFAULT '0.00' COMMENT '折扣率',
  `gathering_order_deposit_after_price` decimal(10,2) DEFAULT '0.00' COMMENT '折后金额',
  `gathering_order_tax_rate` decimal(4,2) DEFAULT '0.00' COMMENT '税率',
  `gathering_order_including_tax_price` decimal(10,2) DEFAULT '0.00' COMMENT '含税金额',
  `gathering_order_receivable_price` decimal(10,2) DEFAULT '0.00' COMMENT '应收金额',
  `gathering_order_actual_payment` decimal(10,2) DEFAULT '0.00' COMMENT '实际支付',
  `gathering_order_payment_date` date DEFAULT NULL COMMENT '支付日期',
  `gathering_order_is_audited` int(2) DEFAULT '0' COMMENT '是否审核',
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
  `goods_cost_price` decimal(10,2) DEFAULT '0.00' COMMENT '商品单价',
  `goods_order_quantity` decimal(10,2) DEFAULT '0.00' COMMENT '商品订购数量',
  `goods_is_free` int(2) DEFAULT '0' COMMENT '商品是否为赠品 0-否 1-是',
  `goods_no_clear_price` decimal(10,2) DEFAULT '0.00' COMMENT '未核销金额',
  `goods_already_clear_price` decimal(10,2) DEFAULT '0.00' COMMENT '已核销金额',
  `goods_out_unit_price` decimal(10,2) DEFAULT '0.00' COMMENT '销售单价',
  `goods_out_total_quantity` decimal(10,2) DEFAULT '0.00' COMMENT '销售数量',
  `goods_out_total_price` decimal(10,2) DEFAULT '0.00' COMMENT '销售金额',
  `goods_return_unit_price` decimal(10,2) DEFAULT '0.00' COMMENT '商品退货单价',
  `goods_return_total_quantity` decimal(10,2) DEFAULT '0.00' COMMENT '商品退货数量',
  `goods_return_total_price` decimal(10,2) DEFAULT '0.00' COMMENT '商品退货金额',
  `goods_remark` varchar(20) DEFAULT '' COMMENT '商品备注',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '单据生成时间',
  `update_time` timestamp NULL DEFAULT '0000-00-00 00:00:00',
  `status` tinyint(3) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

INSERT INTO `oc_storehouse_gathering_order` VALUES ('1', '收款单', 'DJ0001', '', '', 'sdfsdf', '', '123456.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '', '1', 'KH0002', '玫瑰之家', '3号仓', '', 'admin', '超级管理员', '', '234', 'ewk', 'ee', '', '123', '0.00', '0.00', '0', '0.00', '0.00', '234.00', '23423.00', '5480982.00', '0.00', '0.00', '0.00', '', '2017-09-11 22:33:55', '0000-00-00 00:00:00', '-1');
INSERT INTO `oc_storehouse_gathering_order` VALUES ('2', '收款单', 'DJ0002', '', '', 'sdfsdf', '', '3123123.00', '0.00', '0.00', '0.00', '0.00', '0.00', '123.00', '2017-09-13', '1', 'KH0002', '玫瑰之家', '2号仓', '', 'admin', '超级管理员', '', '234', 'ewk', 'ee', '', '123', '0.00', '0.00', '0', '0.00', '0.00', '234.00', '3.00', '702.00', '0.00', '0.00', '0.00', '', '2017-09-11 22:37:41', '0000-00-00 00:00:00', '1');
