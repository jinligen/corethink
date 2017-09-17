
DROP TABLE IF EXISTS `oc_admin_upload`;
CREATE TABLE `oc_admin_upload` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `uid` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'UID',
  `name` varchar(255) NOT NULL DEFAULT '' COMMENT '文件名',
  `path` varchar(255) NOT NULL DEFAULT '' COMMENT '文件路径',
  `url` varchar(255) NOT NULL DEFAULT '' COMMENT '文件链接',
  `ext` char(4) NOT NULL DEFAULT '' COMMENT '文件类型',
  `size` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '文件大小',
  `md5` char(32) NOT NULL DEFAULT '' COMMENT '文件md5',
  `sha1` char(40) NOT NULL DEFAULT '' COMMENT '文件sha1编码',
  `location` varchar(15) NOT NULL DEFAULT '' COMMENT '文件存储位置',
  `download` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '下载次数',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '上传时间',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '修改时间',
  `sort` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='文件上传表';

INSERT INTO `oc_admin_upload` VALUES ('1', '1', 'logo.png', '/Application/Home/View/Public/img/default/logo.png', '', 'png', '51490', '1a564cb3b2f2cbb8e3fa81d9d87cfd9d', 'bf46e8dada8c65a51ff820d6ec4450c404a27537', 'Local', '0', '1449838885', '1449838885', '0', '1');
INSERT INTO `oc_admin_upload` VALUES ('2', '1', 'demo.jpg', '/Uploads/2017-09-15/59babcf8f0285.jpg', '', 'jpg', '483159', 'b1c080d8832da254c7381bf896852550', '8416ff57fdd2f66baf6bbb1408a2d381a90a4831', 'Local', '0', '1505410296', '1505410296', '0', '1');
