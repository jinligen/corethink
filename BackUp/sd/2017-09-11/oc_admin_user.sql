
DROP TABLE IF EXISTS `oc_admin_user`;
CREATE TABLE `oc_admin_user` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'UID',
  `user_type` int(11) NOT NULL DEFAULT '1' COMMENT '用户类型',
  `nickname` varchar(63) NOT NULL DEFAULT '' COMMENT '昵称',
  `username` varchar(31) NOT NULL DEFAULT '' COMMENT '用户名',
  `password` varchar(63) NOT NULL DEFAULT '' COMMENT '密码',
  `email` varchar(63) NOT NULL DEFAULT '' COMMENT '邮箱',
  `email_bind` tinyint(1) NOT NULL DEFAULT '0' COMMENT '邮箱验证',
  `mobile` varchar(11) NOT NULL DEFAULT '' COMMENT '手机号',
  `mobile_bind` tinyint(1) NOT NULL DEFAULT '0' COMMENT '邮箱验证',
  `avatar` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '头像',
  `score` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '积分',
  `money` decimal(11,2) NOT NULL DEFAULT '0.00' COMMENT '余额',
  `reg_ip` bigint(20) NOT NULL DEFAULT '0' COMMENT '注册IP',
  `reg_type` varchar(15) NOT NULL DEFAULT '' COMMENT '注册方式',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(3) NOT NULL DEFAULT '0' COMMENT '状态',
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='用户账号表';

INSERT INTO `oc_admin_user` VALUES ('1', '1', '超级管理员', 'admin', '1f9060bc2432d6f83dc244ed83943a83', '', '0', '', '0', '0', '0', '0.00', '0', '', '1438651748', '1438651748', '1');
INSERT INTO `oc_admin_user` VALUES ('2', '1', '张三', 'zhangsan', '180b9c6ea8326ead5a0a2f8024ab661d', '1163828436@qq.com', '0', '18799298676', '0', '0', '0', '0.00', '0', 'admin', '1503989309', '1503989309', '1');
