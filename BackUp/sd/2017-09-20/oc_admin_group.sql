
DROP TABLE IF EXISTS `oc_admin_group`;
CREATE TABLE `oc_admin_group` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '部门ID',
  `pid` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '上级部门ID',
  `title` varchar(31) NOT NULL DEFAULT '' COMMENT '部门名称',
  `icon` varchar(31) NOT NULL DEFAULT '' COMMENT '图标',
  `menu_auth` text NOT NULL COMMENT '权限列表',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '修改时间',
  `sort` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '排序（同级有效）',
  `status` tinyint(3) NOT NULL DEFAULT '0' COMMENT '状态',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='部门信息表';

INSERT INTO `oc_admin_group` VALUES ('1', '0', '超级管理员', '', '', '1426881003', '1427552428', '0', '1');
INSERT INTO `oc_admin_group` VALUES ('2', '0', '库房', 'fa-folder', '{"Admin":["1","a","a2","a22","a3","a33","a4","a43"]}', '1503989351', '1504597248', '0', '1');
