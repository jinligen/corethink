
DROP TABLE IF EXISTS `oc_admin_nav`;
CREATE TABLE `oc_admin_nav` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `group` varchar(11) NOT NULL DEFAULT '' COMMENT '分组',
  `pid` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '父ID',
  `title` varchar(31) NOT NULL DEFAULT '' COMMENT '导航标题',
  `type` varchar(15) NOT NULL DEFAULT '' COMMENT '导航类型',
  `value` text COMMENT '导航值',
  `target` varchar(11) NOT NULL DEFAULT '' COMMENT '打开方式',
  `icon` varchar(32) NOT NULL DEFAULT '' COMMENT '图标',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '修改时间',
  `sort` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  `status` tinyint(3) NOT NULL DEFAULT '0' COMMENT '状态',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=25 DEFAULT CHARSET=utf8 COMMENT='前台导航表';

INSERT INTO `oc_admin_nav` VALUES ('1', 'bottom', '0', '关于', 'link', '', '', '', '1449742225', '1449742255', '0', '1');
INSERT INTO `oc_admin_nav` VALUES ('2', 'bottom', '1', '关于我们', 'link', 'http://www.lingyun.net', '', '', '1449742312', '1449742312', '0', '1');
INSERT INTO `oc_admin_nav` VALUES ('4', 'bottom', '1', '服务产品', 'link', 'http://www.lingyun.net', '', '', '1449742597', '1449742651', '0', '1');
INSERT INTO `oc_admin_nav` VALUES ('5', 'bottom', '1', '商务合作', 'link', 'http://www.lingyun.net', '', '', '1449742664', '1449742664', '0', '1');
INSERT INTO `oc_admin_nav` VALUES ('6', 'bottom', '1', '加入我们', 'link', 'http://www.lingyun.net', '', '', '1449742678', '1449742697', '0', '1');
INSERT INTO `oc_admin_nav` VALUES ('7', 'bottom', '0', '帮助', 'link', '', '', '', '1449742688', '1449742688', '0', '1');
INSERT INTO `oc_admin_nav` VALUES ('8', 'bottom', '7', '用户协议', 'link', 'http://www.lingyun.net', '', '', '1449742706', '1449742706', '0', '1');
INSERT INTO `oc_admin_nav` VALUES ('9', 'bottom', '7', '意见反馈', 'link', 'http://www.lingyun.net', '', '', '1449742716', '1449742716', '0', '1');
INSERT INTO `oc_admin_nav` VALUES ('10', 'bottom', '7', '常见问题', 'link', 'http://www.lingyun.net', '', '', '1449742728', '1449742728', '0', '1');
INSERT INTO `oc_admin_nav` VALUES ('11', 'bottom', '0', '联系方式', 'link', '', '', '', '1449742742', '1449742742', '0', '1');
INSERT INTO `oc_admin_nav` VALUES ('12', 'bottom', '11', '联系我们', 'link', 'http://www.lingyun.net', '', '', '1449742752', '1449742752', '0', '1');
INSERT INTO `oc_admin_nav` VALUES ('13', 'bottom', '11', '新浪微博', 'link', 'http://weibo.com/u/5667168319', '', '', '1449742802', '1449742802', '0', '1');
INSERT INTO `oc_admin_nav` VALUES ('14', 'main', '0', '产品中心', 'page', '', '', '', '1457084559', '1457084559', '0', '0');
INSERT INTO `oc_admin_nav` VALUES ('15', 'main', '0', '客户服务', 'page', '', '', '', '1457084572', '1457084572', '0', '1');
INSERT INTO `oc_admin_nav` VALUES ('16', 'main', '0', '案例展示', 'page', '', '', '', '1457084583', '1457084583', '0', '1');
INSERT INTO `oc_admin_nav` VALUES ('17', 'main', '0', '新闻动态', 'page', '', '', '', '1457084714', '1457084714', '0', '1');
INSERT INTO `oc_admin_nav` VALUES ('18', 'main', '0', 'weex中文网', 'link', 'http://weex-china.org', '_blank', '', '1457084725', '1489897549', '0', '1');
INSERT INTO `oc_admin_nav` VALUES ('19', 'wap_bottom', '0', '首页', 'link', '/', '', 'fa-home', '1458382401', '1458382401', '0', '1');
INSERT INTO `oc_admin_nav` VALUES ('20', 'wap_bottom', '0', '充值', 'link', 'Wallet/Recharge/index', '', 'fa-credit-card', '1458382603', '1461381689', '0', '1');
INSERT INTO `oc_admin_nav` VALUES ('21', 'wap_bottom', '0', '钱包', 'module', 'Wallet', '', 'fa-money', '1458382637', '1461381704', '0', '1');
INSERT INTO `oc_admin_nav` VALUES ('22', 'wap_bottom', '0', '我的', 'link', 'User/Center/index', '', 'fa-user', '1458382814', '1461207462', '0', '1');
INSERT INTO `oc_admin_nav` VALUES ('23', 'top', '0', '用户', 'module', 'User', '', 'fa fa-users', '1471174771', '1471174771', '0', '1');
INSERT INTO `oc_admin_nav` VALUES ('24', 'top', '0', 'CMS', 'module', 'Cms', '', 'fa fa-newspaper-o', '1471174779', '1471174779', '0', '1');
