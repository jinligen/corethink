
DROP TABLE IF EXISTS `oc_admin_theme`;
CREATE TABLE `oc_admin_theme` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `name` varchar(32) NOT NULL DEFAULT '' COMMENT '名称',
  `title` varchar(64) NOT NULL DEFAULT '' COMMENT '标题',
  `description` varchar(127) NOT NULL DEFAULT '' COMMENT '描述',
  `developer` varchar(32) NOT NULL DEFAULT '' COMMENT '开发者',
  `version` varchar(8) NOT NULL DEFAULT '' COMMENT '版本',
  `config` text COMMENT '主题配置',
  `current` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否当前主题',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `sort` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  `status` tinyint(3) NOT NULL DEFAULT '0' COMMENT '状态',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='前台主题表';

