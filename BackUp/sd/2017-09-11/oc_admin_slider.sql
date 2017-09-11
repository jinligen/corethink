
DROP TABLE IF EXISTS `oc_admin_slider`;
CREATE TABLE `oc_admin_slider` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '幻灯ID',
  `title` char(80) NOT NULL DEFAULT '' COMMENT '标题',
  `cover` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '封面ID',
  `url` varchar(255) NOT NULL DEFAULT '' COMMENT '点击链接',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `sort` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '状态',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='幻灯切换表';

