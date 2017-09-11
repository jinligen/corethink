
DROP TABLE IF EXISTS `oc_storehouse_payment_order_clear`;
CREATE TABLE `oc_storehouse_payment_order_clear` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `payment_order_id` varchar(11) DEFAULT '' COMMENT '收款单编号',
  `payment_order_price` decimal(10,2) DEFAULT '0.00' COMMENT '单据金额',
  `goods_id` varchar(11) DEFAULT '' COMMENT '商品编码',
  `goods_name` varchar(50) DEFAULT '' COMMENT '商品名称',
  `goods_no_clear_price` decimal(10,2) DEFAULT '0.00' COMMENT '未核销金额',
  `goods_already_clear_price` decimal(10,2) DEFAULT '0.00' COMMENT '已核销金额',
  `goods_already_now_clear_price` decimal(10,2) DEFAULT '0.00' COMMENT '本次核销金额',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '单据生成时间',
  `update_time` timestamp NULL DEFAULT '0000-00-00 00:00:00',
  `status` tinyint(3) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

