
DROP TABLE IF EXISTS `oc_admin_access`;
CREATE TABLE `oc_admin_access` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '管理员ID',
  `uid` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `group` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '管理员用户组',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `sort` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  `status` tinyint(3) NOT NULL DEFAULT '0' COMMENT '状态',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='后台管理员与用户组对应关系表';

INSERT INTO `oc_admin_access` VALUES ('1', '1', '1', '1438651748', '1438651748', '0', '1');
INSERT INTO `oc_admin_access` VALUES ('4', '2', '2', '1504080046', '1504597267', '0', '1');
