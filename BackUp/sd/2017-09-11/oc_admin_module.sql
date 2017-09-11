
DROP TABLE IF EXISTS `oc_admin_module`;
CREATE TABLE `oc_admin_module` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `name` varchar(31) NOT NULL DEFAULT '' COMMENT '名称',
  `title` varchar(63) NOT NULL DEFAULT '' COMMENT '标题',
  `logo` varchar(63) NOT NULL DEFAULT '' COMMENT '图片图标',
  `icon` varchar(31) NOT NULL DEFAULT '' COMMENT '字体图标',
  `icon_color` varchar(7) NOT NULL DEFAULT '' COMMENT '字体图标颜色',
  `description` varchar(127) NOT NULL DEFAULT '' COMMENT '描述',
  `developer` varchar(31) NOT NULL DEFAULT '' COMMENT '开发者',
  `version` varchar(7) NOT NULL DEFAULT '' COMMENT '版本',
  `user_nav` text NOT NULL COMMENT '个人中心导航',
  `config` text NOT NULL COMMENT '配置',
  `admin_menu` text NOT NULL COMMENT '菜单节点',
  `is_system` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否允许卸载',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `sort` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  `status` tinyint(3) NOT NULL DEFAULT '0' COMMENT '状态',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='模块功能表';

INSERT INTO `oc_admin_module` VALUES ('1', 'Admin', '系统', '', 'fa fa-cog', '#3CA6F1', '核心系统', '南京科斯克网络科技有限公司', '1.3.0', '', '', '{"1":{"pid":"0","title":"\u7cfb\u7edf","icon":"fa fa-cog","level":"system","id":"1"},"a":{"pid":"1","title":"\u7cfb\u7edf\u529f\u80fd","icon":"fa fa-folder-open-o","id":"a"},"a1":{"pid":"a","title":"\u7cfb\u7edf\u8bbe\u7f6e","icon":"fa fa-wrench","url":"Admin\/Config\/group","id":"a1"},"a11":{"pid":"a1","title":"\u4fee\u6539\u8bbe\u7f6e","url":"Admin\/Config\/groupSave","id":"a11"},"a2":{"pid":"a","title":"\u7528\u6237\u5217\u8868","icon":"fa fa-user","url":"Admin\/User\/index","id":"a2"},"a21":{"pid":"a2","title":"\u65b0\u589e","url":"Admin\/User\/add","id":"a21"},"a22":{"pid":"a2","title":"\u7f16\u8f91","url":"Admin\/User\/edit","id":"a22"},"a23":{"pid":"a2","title":"\u8bbe\u7f6e\u72b6\u6001","url":"Admin\/User\/setStatus","id":"a23"},"a3":{"pid":"a","title":"\u7528\u6237\u5206\u7ec4","icon":"fa fa-lock","url":"Admin\/Access\/index","id":"a3"},"a31":{"pid":"a3","title":"\u65b0\u589e","url":"Admin\/Access\/add","id":"a31"},"a32":{"pid":"a3","title":"\u7f16\u8f91","url":"Admin\/Access\/edit","id":"a32"},"a33":{"pid":"a3","title":"\u8bbe\u7f6e\u72b6\u6001","url":"Admin\/Access\/setStatus","id":"a33"},"a4":{"pid":"a","title":"\u89d2\u8272\u7ba1\u7406","icon":"fa fa-sitemap","url":"Admin\/Group\/index","id":"a4"},"a41":{"pid":"a4","title":"\u65b0\u589e","url":"Admin\/Group\/add","id":"a41"},"a42":{"pid":"a4","title":"\u7f16\u8f91","url":"Admin\/Group\/edit","id":"a42"},"a43":{"pid":"a4","title":"\u8bbe\u7f6e\u72b6\u6001","url":"Admin\/Group\/setStatus","id":"a43"},"a5":{"pid":"a","title":"\u529f\u80fd\u6a21\u5757","icon":"fa fa-th-large","url":"Admin\/Module\/index","id":"a5"},"a51":{"pid":"a5","title":"\u5b89\u88c5","url":"Admin\/Module\/install","id":"a51"},"a52":{"pid":"a5","title":"\u5378\u8f7d","url":"Admin\/Module\/uninstall","id":"a52"},"a53":{"pid":"a5","title":"\u66f4\u65b0\u4fe1\u606f","url":"Admin\/Module\/updateInfo","id":"a53"},"a54":{"pid":"a5","title":"\u8bbe\u7f6e\u72b6\u6001","url":"Admin\/Module\/setStatus","id":"a54"},"a6":{"pid":"a","title":"\u6570\u636e\u5907\u4efd","icon":"fa fa-book","url":"admin\/database\/index\/type\/export","id":"a6"},"a7":{"pid":"a","title":"\u6570\u636e\u8fd8\u539f","icon":"fa fa-share","url":"admin\/database\/index\/type\/import","id":"a7"},"b":{"pid":"1","title":"\u5e93\u5b58\u7ba1\u7406","icon":"fa fa-folder-open-o","id":"b"},"b1":{"pid":"b","title":"\u91c7\u8d2d\u5165\u5e93\u5355","icon":"fa fa-file-o","url":"Admin\/EntryOrder\/purchaseEntryOrder","id":"b1"},"b8":{"pid":"b","title":"\u4ea7\u54c1\u5165\u5e93\u5355","icon":"fa fa-file-o","url":"Admin\/EntryOrder\/productEntryOrder","id":"b8"},"b2":{"pid":"b","title":"\u6750\u6599\u51fa\u5e93\u5355","icon":"fa fa-files-o","url":"Admin\/OutOrder\/materialOutOrder","id":"b2"},"b9":{"pid":"b","title":"\u9500\u552e\u51fa\u5e93\u5355","icon":"fa fa-files-o","url":"Admin\/OutOrder\/salesOutOrder","id":"b9"},"b3":{"pid":"b","title":"\u4ed8\u6b3e\u5355","icon":"fa fa-list-alt","url":"Admin\/PaymentOrder\/index","id":"b3"},"b4":{"pid":"b","title":"\u6536\u6b3e\u5355","icon":"fa fa-floppy-o","url":"Admin\/GatheringOrder\/index","id":"b4"},"b5":{"pid":"b","title":"\u76d8\u70b9\u5217\u8868","icon":"fa fa-list-ol","url":"Admin\/GoodsCheck\/index","id":"b5"},"b6":{"pid":"b","title":"\u5e94\u6536\u5e8f\u65f6\u7c3f","icon":"fa fa-bookmark-o","url":"Admin\/public\/demo","id":"b6"},"b7":{"pid":"b","title":"\u5e94\u4ed8\u5e8f\u65f6\u7c3f","icon":"fa fa-bookmark","url":"Admin\/public\/demo","id":"b7"},"c":{"pid":"1","title":"\u62a5\u8868\u7ba1\u7406","icon":"fa fa-bar-chart-o","id":"c"},"c1":{"pid":"c","title":"\u5e93\u623f\u5373\u65f6\u67e5\u8be2","icon":"fa fa-eye","url":"Admin\/public\/demo","id":"c1"},"c2":{"pid":"c","title":"\u91c7\u8d2d\u62a5\u8868","icon":"fa fa-table","url":"Admin\/public\/demo","id":"c2"},"c3":{"pid":"c","title":"\u9500\u552e\u62a5\u8868","icon":"fa fa-building-o","url":"Admin\/public\/demo","id":"c3"},"d":{"pid":"1","title":"\u57fa\u7840\u4fe1\u606f\u7ba1\u7406","icon":"fa fa-folder-open-o","id":"d"},"d1":{"pid":"d","title":"\u4ed3\u5e93\u4fe1\u606f","icon":"fa fa-info-circle","url":"Admin\/StoreHouseInfo\/index","id":"d1"},"d2":{"pid":"d","title":"\u5546\u54c1\u4fe1\u606f","icon":"fa fa-info","url":"Admin\/goods\/index","id":"d2"},"d3":{"pid":"d","title":"\u5546\u54c1\u7c7b\u578b","icon":"fa fa-wrench","url":"Admin\/goodsType\/index","id":"d3"},"d4":{"pid":"d","title":"\u5ba2\u6237\u5217\u8868","icon":"fa fa-user-md","url":"Admin\/customer\/index","id":"d4"},"d5":{"pid":"d","title":"\u4e1a\u52a1\u5458\u5217\u8868","icon":"fa fa-user","url":"Admin\/clerk\/index","id":"d5"}}', '1', '1438651748', '1505142955', '0', '1');
