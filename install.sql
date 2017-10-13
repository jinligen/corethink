
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



DROP TABLE IF EXISTS `oc_admin_addon`;
CREATE TABLE `oc_admin_addon` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(32) NOT NULL DEFAULT '' COMMENT '插件名或标识',
  `title` varchar(32) NOT NULL DEFAULT '' COMMENT '中文名',
  `description` text NOT NULL COMMENT '插件描述',
  `config` text COMMENT '配置',
  `author` varchar(32) NOT NULL DEFAULT '' COMMENT '作者',
  `version` varchar(8) NOT NULL DEFAULT '' COMMENT '版本号',
  `adminlist` tinyint(4) unsigned NOT NULL DEFAULT '0' COMMENT '是否有后台列表',
  `type` tinyint(4) unsigned NOT NULL DEFAULT '0' COMMENT '插件类型',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '安装时间',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '修改时间',
  `sort` tinyint(4) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '状态',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='插件表';

INSERT INTO `oc_admin_addon` VALUES ('1', 'RocketToTop', '小火箭返回顶部', '小火箭返回顶部', '{"status":"1"}', 'OpenCMF', '1.2.0', '0', '0', '1471175585', '1471175585', '0', '1');



DROP TABLE IF EXISTS `oc_admin_config`;
CREATE TABLE `oc_admin_config` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '配置ID',
  `title` varchar(32) NOT NULL DEFAULT '' COMMENT '配置标题',
  `name` varchar(32) NOT NULL DEFAULT '' COMMENT '配置名称',
  `value` text NOT NULL COMMENT '配置值',
  `group` tinyint(4) unsigned NOT NULL DEFAULT '0' COMMENT '配置分组',
  `type` varchar(16) NOT NULL DEFAULT '' COMMENT '配置类型',
  `options` varchar(255) NOT NULL DEFAULT '' COMMENT '配置额外值',
  `tip` varchar(100) NOT NULL DEFAULT '' COMMENT '配置说明',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `sort` tinyint(4) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=29 DEFAULT CHARSET=utf8 COMMENT='系统配置表';

INSERT INTO `oc_admin_config` VALUES ('1', '站点开关', 'TOGGLE_WEB_SITE', '0', '1', 'select', '0:关闭1:开启', '站点关闭后将不能访问', '1378898976', '1406992386', '1', '1');
INSERT INTO `oc_admin_config` VALUES ('3', '网站口号', 'WEB_SITE_SLOGAN', '互联网WEB产品最佳选择', '1', 'text', '', '网站口号、宣传标语、一句话介绍', '1434081649', '1434081649', '3', '1');
INSERT INTO `oc_admin_config` VALUES ('4', '网站LOGO', 'WEB_SITE_LOGO', '', '1', 'picture', '', '网站LOGO', '1407003397', '1407004692', '4', '1');
INSERT INTO `oc_admin_config` VALUES ('5', '网站描述', 'WEB_SITE_DESCRIPTION', 'CoreThink是一套基于统一核心的通用互联网+信息化服务解决方案，追求简单、高效、卓越。可轻松实现支持多终端的WEB产品快速搭建、部署、上线。系统功能采用模块化、组件化、插件化等开放化低耦合设计，应用商城拥有丰富的功能模块、插件、主题，便于用户灵活扩展和二次开发。', '1', 'textarea', '', '网站搜索引擎描述', '1378898976', '1379235841', '5', '1');
INSERT INTO `oc_admin_config` VALUES ('6', '网站关键字', 'WEB_SITE_KEYWORD', 'OpenCMF、CoreThink、南京科斯克网络科技', '1', 'textarea', '', '网站搜索引擎关键字', '1378898976', '1381390100', '6', '1');
INSERT INTO `oc_admin_config` VALUES ('7', '版权信息', 'WEB_SITE_COPYRIGHT', 'Copyright © 南京科斯克网络科技有限公司 All rights reserved.', '1', 'text', '', '设置在网站底部显示的版权信息，如“版权所有 © 2014-2015 科斯克网络科技”', '1406991855', '1406992583', '7', '1');
INSERT INTO `oc_admin_config` VALUES ('8', '网站备案号', 'WEB_SITE_ICP', '苏ICP备1502009-2号', '1', 'text', '', '设置在网站底部显示的备案号，如“苏ICP备1502009-2号"', '1378900335', '1415983236', '8', '1');
INSERT INTO `oc_admin_config` VALUES ('9', '站点统计', 'WEB_SITE_STATISTICS', '', '1', 'textarea', '', '支持百度、Google、cnzz等所有Javascript的统计代码', '1378900335', '1415983236', '9', '1');
INSERT INTO `oc_admin_config` VALUES ('10', '文件上传大小', 'UPLOAD_FILE_SIZE', '10', '2', 'num', '', '文件上传大小单位：MB', '1428681031', '1428681031', '1', '1');
INSERT INTO `oc_admin_config` VALUES ('11', '图片上传大小', 'UPLOAD_IMAGE_SIZE', '2', '2', 'num', '', '图片上传大小单位：MB', '1428681071', '1428681071', '2', '1');
INSERT INTO `oc_admin_config` VALUES ('12', '后台多标签', 'ADMIN_TABS', '1', '2', 'radio', '0:关闭1:开启', '', '1453445526', '1453445526', '3', '1');
INSERT INTO `oc_admin_config` VALUES ('13', '分页数量', 'ADMIN_PAGE_ROWS', '10', '2', 'num', '', '分页时每页的记录数', '1434019462', '1434019481', '4', '1');
INSERT INTO `oc_admin_config` VALUES ('14', '后台主题', 'ADMIN_THEME', 'default', '2', 'select', 'default:默认主题blue:蓝色理想green:绿色生活', '后台界面主题', '1436678171', '1436690570', '5', '1');
INSERT INTO `oc_admin_config` VALUES ('15', '导航分组', 'NAV_GROUP_LIST', 'main:主导航top:顶部导航bottom:底部导航wap_bottom:Wap底部导航', '2', 'array', '', '导航分组', '1458382037', '1458382061', '6', '1');
INSERT INTO `oc_admin_config` VALUES ('16', '配置分组', 'CONFIG_GROUP_LIST', '1:基本2:系统3:开发4:部署5:授权', '2', 'array', '', '配置分组', '1379228036', '1426930700', '7', '1');
INSERT INTO `oc_admin_config` VALUES ('17', '开发模式', 'DEVELOP_MODE', '0', '3', 'select', '1:开启0:关闭', '开发模式下会显示菜单管理、配置管理、数据字典等开发者工具', '1432393583', '1432393583', '1', '1');
INSERT INTO `oc_admin_config` VALUES ('18', '是否显示页面Trace', 'SHOW_PAGE_TRACE', '0', '3', 'select', '0:关闭1:开启', '是否显示页面Trace信息', '1387165685', '1387165685', '2', '1');
INSERT INTO `oc_admin_config` VALUES ('19', '系统加密KEY', 'AUTH_KEY', '{A>!uq/oJx%/"w!=YKt^oT%w/v@Q$Q{lqU]Bhw~$vVNz~JvBr=}dZM^M#)js:]nZ', '3', 'textarea', '', '轻易不要修改此项，否则容易造成用户无法登录；如要修改，务必备份原key', '1438647773', '1438647815', '3', '1');
INSERT INTO `oc_admin_config` VALUES ('20', 'URL模式', 'URL_MODEL', '3', '4', 'select', '0:普通模式1:PATHINFO模式2:REWRITE模式3:兼容模式', '', '1438423248', '1438423248', '1', '1');
INSERT INTO `oc_admin_config` VALUES ('21', '静态文件独立域名', 'STATIC_DOMAIN', '', '4', 'text', '', '静态文件独立域名一般用于在用户无感知的情况下平和的将网站图片自动存储到腾讯万象优图、又拍云等第三方服务。', '1438564784', '1438564784', '2', '1');
INSERT INTO `oc_admin_config` VALUES ('22', '开启子域名配置', 'APP_SUB_DOMAIN_DEPLOY', '0', '4', 'radio', '1:是0:否', '是否开启子域名配置', '1467549933', '1467549933', '3', '1');
INSERT INTO `oc_admin_config` VALUES ('23', '子域名规则', 'APP_SUB_DOMAIN_RULES', '', '4', 'array', '', '子域名规则', '1467549993', '1467549993', '4', '1');
INSERT INTO `oc_admin_config` VALUES ('24', '域名后缀', 'APP_DOMAIN_SUFFIX', '', '4', 'text', '', 'com.cn 、net.cn之类的需要配置此项', '1467550066', '1467550066', '5', '1');
INSERT INTO `oc_admin_config` VALUES ('25', '强制Wap主题', 'WAP_MODE', '0', '4', 'radio', '1:是0:否', '是否在电脑端强制显示Wap主题', '1467121607', '1467121607', '6', '1');
INSERT INTO `oc_admin_config` VALUES ('26', '官网账号', 'AUTH_USERNAME', 'trial', '5', 'text', '', '官网登陆账号（用户名）', '1438647815', '1438647815', '1', '1');
INSERT INTO `oc_admin_config` VALUES ('27', '官网密码', 'AUTH_PASSWORD', 'trial', '5', 'text', '', '官网密码', '1438647815', '1438647815', '2', '1');
INSERT INTO `oc_admin_config` VALUES ('28', '密钥', 'AUTH_SN', '', '5', 'textarea', '', '密钥请通过登陆官网至个人中心获取', '1438647815', '1438647815', '3', '1');



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



DROP TABLE IF EXISTS `oc_admin_hook`;
CREATE TABLE `oc_admin_hook` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '钩子ID',
  `name` varchar(32) NOT NULL DEFAULT '' COMMENT '钩子名称',
  `description` text NOT NULL COMMENT '描述',
  `addons` varchar(255) NOT NULL DEFAULT '' COMMENT '钩子挂载的插件',
  `type` tinyint(4) unsigned NOT NULL DEFAULT '1' COMMENT '类型',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '状态',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='钩子表';

INSERT INTO `oc_admin_hook` VALUES ('1', 'AdminIndex', '后台首页小工具', '后台首页小工具', '1', '1446522155', '1446522155', '1');
INSERT INTO `oc_admin_hook` VALUES ('2', 'FormBuilderExtend', 'FormBuilder类型扩展Builder', '', '1', '1447831268', '1447831268', '1');
INSERT INTO `oc_admin_hook` VALUES ('3', 'UploadFile', '上传文件钩子', '', '1', '1407681961', '1407681961', '1');
INSERT INTO `oc_admin_hook` VALUES ('4', 'PageHeader', '页面header钩子，一般用于加载插件CSS文件和代码', '', '1', '1407681961', '1407681961', '1');
INSERT INTO `oc_admin_hook` VALUES ('5', 'PageFooter', '页面footer钩子，一般用于加载插件CSS文件和代码', 'RocketToTop', '1', '1407681961', '1407681961', '1');
INSERT INTO `oc_admin_hook` VALUES ('6', 'CommonHook', '通用钩子，自定义用途，一般用来定制特殊功能', '', '1', '1456147822', '1456147822', '1');



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

INSERT INTO `oc_admin_module` VALUES ('1', 'Admin', '系统', '', 'fa fa-cog', '#3CA6F1', '核心系统', '南京科斯克网络科技有限公司', '1.3.0', '', '', '{"1":{"pid":"0","title":"系统","icon":"fa fa-cog","level":"system","id":"1"},"a":{"pid":"1","title":"系统功能","icon":"fa fa-folder-open-o","id":"a"},"a1":{"pid":"a","title":"系统设置","icon":"fa fa-wrench","url":"Admin/Config/group","id":"a1"},"a11":{"pid":"a1","title":"修改设置","url":"Admin/Config/groupSave","id":"a11"},"a2":{"pid":"a","title":"用户列表","icon":"fa fa-user","url":"Admin/User/index","id":"a2"},"a21":{"pid":"a2","title":"新增","url":"Admin/User/add","id":"a21"},"a22":{"pid":"a2","title":"编辑","url":"Admin/User/edit","id":"a22"},"a23":{"pid":"a2","title":"设置状态","url":"Admin/User/setStatus","id":"a23"},"a3":{"pid":"a","title":"用户分组","icon":"fa fa-lock","url":"Admin/Access/index","id":"a3"},"a31":{"pid":"a3","title":"新增","url":"Admin/Access/add","id":"a31"},"a32":{"pid":"a3","title":"编辑","url":"Admin/Access/edit","id":"a32"},"a33":{"pid":"a3","title":"设置状态","url":"Admin/Access/setStatus","id":"a33"},"a4":{"pid":"a","title":"角色管理","icon":"fa fa-sitemap","url":"Admin/Group/index","id":"a4"},"a41":{"pid":"a4","title":"新增","url":"Admin/Group/add","id":"a41"},"a42":{"pid":"a4","title":"编辑","url":"Admin/Group/edit","id":"a42"},"a43":{"pid":"a4","title":"设置状态","url":"Admin/Group/setStatus","id":"a43"},"a5":{"pid":"a","title":"功能模块","icon":"fa fa-th-large","url":"Admin/Module/index","id":"a5"},"a51":{"pid":"a5","title":"安装","url":"Admin/Module/install","id":"a51"},"a52":{"pid":"a5","title":"卸载","url":"Admin/Module/uninstall","id":"a52"},"a53":{"pid":"a5","title":"更新信息","url":"Admin/Module/updateInfo","id":"a53"},"a54":{"pid":"a5","title":"设置状态","url":"Admin/Module/setStatus","id":"a54"},"a6":{"pid":"a","title":"数据备份","icon":"fa fa-book","url":"admin/database/index","id":"a6"},"b":{"pid":"1","title":"库存管理","icon":"fa fa-folder-open-o","id":"b"},"b1":{"pid":"b","title":"采购入库单","icon":"fa fa-file-o","url":"Admin/EntryOrder/purchaseEntryOrder","id":"b1"},"b2":{"pid":"b","title":"产品入库单","icon":"fa fa-file-o","url":"Admin/EntryOrder/productEntryOrder","id":"b2"},"b3":{"pid":"b","title":"材料出库单","icon":"fa fa-files-o","url":"Admin/OutOrder/materialOutOrder","id":"b3"},"b4":{"pid":"b","title":"销售出库单","icon":"fa fa-files-o","url":"Admin/OutOrder/salesOutOrder","id":"b4"},"b5":{"pid":"b","title":"付款单","icon":"fa fa-list-alt","url":"Admin/PaymentOrder/index","id":"b5"},"b6":{"pid":"b","title":"收款单","icon":"fa fa-floppy-o","url":"Admin/GatheringOrder/index","id":"b6"},"b7":{"pid":"b","title":"盘点列表","icon":"fa fa-list-ol","url":"Admin/GoodsCheck/index","id":"b7"},"b8":{"pid":"b","title":"销售订单","icon":"fa fa-bookmark-o","url":"Admin/SalesOrder/index","id":"b8"},"b10":{"pid":"b","title":"财务结账","icon":"fa fa-bookmark","url":"Admin/CloseAccounts/index","id":"b10"},"c":{"pid":"1","title":"报表管理","icon":"fa fa-bar-chart-o","id":"c"},"c1":{"pid":"c","title":"库房即时查询","icon":"fa fa-eye","url":"Admin/InstantInventory/index","id":"c1"},"c5":{"pid":"c","title":"采购入库单序时簿","icon":"fa fa-file-o","url":"Admin/BaoBiao/purchaceEntryOrder","id":"c5"},"c6":{"pid":"c","title":"产品入库单序时簿","icon":"fa fa-file-o","url":"Admin/BaoBiao/productEntryOrder","id":"c6"},"c7":{"pid":"c","title":"材料出库单序时簿","icon":"fa fa-files-o","url":"Admin/BaoBiao/materialOutOrder","id":"c7"},"c8":{"pid":"c","title":"销售出库单序时簿","icon":"fa fa-files-o","url":"Admin/BaoBiao/salesOutOrder","id":"c8"},"c9":{"pid":"c","title":"收款单序时簿","icon":"fa fa-floppy-o","url":"Admin/BaoBiao/gatheringOrder","id":"c9"},"c10":{"pid":"c","title":"付款单序时簿","icon":"fa fa-list-alt","url":"Admin/BaoBiao/paymentOrder","id":"c10"},"c11":{"pid":"c","title":"供应商对账单","icon":"fa fa-list-alt","url":"Admin/BaoBiao/supplierBill","id":"c11"},"c12":{"pid":"c","title":"客户对账单","icon":"fa fa-list-alt","url":"Admin/BaoBiao/customerBill","id":"c12"},"c13":{"pid":"c","title":"库存商品明细账","icon":"fa fa-columns","url":"Admin/BaoBiao/kuCunMingXiZhang","id":"c13"},"c14":{"pid":"c","title":"应付账款明细表","icon":"fa fa-columns","url":"Admin/BaoBiao/yingFuMingXiZhang","id":"c14"},"c15":{"pid":"c","title":"应收账款明细表","icon":"fa fa-columns","url":"Admin/BaoBiao/yingShouMingXiZhang","id":"c15"},"d":{"pid":"1","title":"基础信息管理","icon":"fa fa-folder-open-o","id":"d"},"d1":{"pid":"d","title":"仓库信息","icon":"fa fa-info-circle","url":"Admin/StoreHouseInfo/index","id":"d1"},"d2":{"pid":"d","title":"商品信息","icon":"fa fa-info","url":"Admin/goods/index","id":"d2"},"d3":{"pid":"d","title":"商品类型","icon":"fa fa-wrench","url":"Admin/goodsType/index","id":"d3"},"d4":{"pid":"d","title":"客户列表","icon":"fa fa-user-md","url":"Admin/customer/index","id":"d4"},"d5":{"pid":"d","title":"业务员列表","icon":"fa fa-user","url":"Admin/clerk/index","id":"d5"},"d7":{"pid":"d","title":"支付方式列表","icon":"fa fa-strikethrough","url":"Admin/PaymentWay/index","id":"d7"}}', '1', '1438651748', '1507856131', '0', '1');



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



DROP TABLE IF EXISTS `oc_admin_post`;
CREATE TABLE `oc_admin_post` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `cid` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '分类ID',
  `title` varchar(127) NOT NULL DEFAULT '' COMMENT '标题',
  `cover` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '封面',
  `abstract` varchar(255) DEFAULT '' COMMENT '摘要',
  `content` text COMMENT '内容',
  `view_count` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '阅读',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '修改时间',
  `sort` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '状态',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='文章列表';




DROP TABLE IF EXISTS `oc_admin_session`;
CREATE TABLE `oc_admin_session` (
  `session_id` varchar(255) NOT NULL,
  `session_expire` int(11) NOT NULL,
  `session_data` blob,
  UNIQUE KEY `session_id` (`session_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='session存储表';




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

INSERT INTO `oc_admin_user` VALUES ('1', '1', '超级管理员', 'admin', '21232f297a57a5a743894a0e4a801fc3', '', '0', '', '0', '0', '0', '0.00', '0', '', '1438651748', '1438651748', '1');
INSERT INTO `oc_admin_user` VALUES ('2', '1', '张三', 'zhangsan', '180b9c6ea8326ead5a0a2f8024ab661d', '1163828436@qq.com', '0', '18799298676', '0', '0', '0', '0.00', '0', 'admin', '1503989309', '1503989309', '1');



DROP TABLE IF EXISTS `oc_ids`;
CREATE TABLE `oc_ids` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `type` varchar(50) DEFAULT '',
  `order_id` varchar(50) DEFAULT '',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `status` tinyint(2) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=70 DEFAULT CHARSET=utf8;

INSERT INTO `oc_ids` VALUES ('1', 'CGRKD', '1', '2017-09-24 22:52:11', '0000-00-00 00:00:00', '1');
INSERT INTO `oc_ids` VALUES ('2', 'XSCKD', '1', '2017-09-26 20:26:37', '0000-00-00 00:00:00', '1');
INSERT INTO `oc_ids` VALUES ('3', 'XSCKD', '1', '2017-09-26 20:27:36', '0000-00-00 00:00:00', '1');
INSERT INTO `oc_ids` VALUES ('4', 'XSCKD', '1', '2017-09-26 20:29:14', '0000-00-00 00:00:00', '1');
INSERT INTO `oc_ids` VALUES ('5', 'SKD', '1', '2017-09-26 20:55:34', '0000-00-00 00:00:00', '1');
INSERT INTO `oc_ids` VALUES ('6', 'FKD', '1', '2017-09-26 21:34:43', '0000-00-00 00:00:00', '1');
INSERT INTO `oc_ids` VALUES ('7', 'CGRKD', '1', '2017-09-26 21:34:58', '0000-00-00 00:00:00', '1');
INSERT INTO `oc_ids` VALUES ('8', 'CGRKD', '1', '2017-09-26 21:46:25', '0000-00-00 00:00:00', '1');
INSERT INTO `oc_ids` VALUES ('9', 'CGRKD', '1', '2017-09-29 08:53:37', '0000-00-00 00:00:00', '1');
INSERT INTO `oc_ids` VALUES ('10', 'CGRKD', '1', '2017-09-29 09:32:22', '0000-00-00 00:00:00', '1');
INSERT INTO `oc_ids` VALUES ('11', 'CGRKD', '1', '2017-09-29 09:53:47', '0000-00-00 00:00:00', '1');
INSERT INTO `oc_ids` VALUES ('12', 'CGRKD', '1', '2017-09-29 09:59:38', '0000-00-00 00:00:00', '1');
INSERT INTO `oc_ids` VALUES ('13', 'CGRKD', '1', '2017-09-29 09:59:59', '0000-00-00 00:00:00', '1');
INSERT INTO `oc_ids` VALUES ('14', 'CGRKD', '1', '2017-09-29 10:19:40', '0000-00-00 00:00:00', '1');
INSERT INTO `oc_ids` VALUES ('15', 'CGRKD', '1', '2017-09-29 10:22:44', '0000-00-00 00:00:00', '1');
INSERT INTO `oc_ids` VALUES ('16', 'CGRKD', '1', '2017-09-29 10:27:50', '0000-00-00 00:00:00', '1');
INSERT INTO `oc_ids` VALUES ('17', 'XSCKD', '1', '2017-09-29 10:28:00', '0000-00-00 00:00:00', '1');
INSERT INTO `oc_ids` VALUES ('18', 'XSCKD', '1', '2017-09-29 10:30:57', '0000-00-00 00:00:00', '1');
INSERT INTO `oc_ids` VALUES ('19', 'XSCKD', '1', '2017-09-29 10:31:15', '0000-00-00 00:00:00', '1');
INSERT INTO `oc_ids` VALUES ('20', 'XSCKD', '1', '2017-09-29 10:31:45', '0000-00-00 00:00:00', '1');
INSERT INTO `oc_ids` VALUES ('21', 'XSCKD', '2', '2017-09-29 10:52:32', '0000-00-00 00:00:00', '1');
INSERT INTO `oc_ids` VALUES ('22', 'CGRKD', '1', '2017-09-29 12:29:09', '0000-00-00 00:00:00', '1');
INSERT INTO `oc_ids` VALUES ('23', 'FKD', '1', '2017-09-29 12:30:58', '0000-00-00 00:00:00', '1');
INSERT INTO `oc_ids` VALUES ('24', 'XSCKD', '3', '2017-09-29 12:39:08', '0000-00-00 00:00:00', '1');
INSERT INTO `oc_ids` VALUES ('25', 'SKD', '1', '2017-09-29 12:39:26', '0000-00-00 00:00:00', '1');
INSERT INTO `oc_ids` VALUES ('26', 'CGRKD', '2', '2017-09-29 12:41:43', '0000-00-00 00:00:00', '1');
INSERT INTO `oc_ids` VALUES ('27', 'SKD', '1', '2017-09-29 12:42:39', '0000-00-00 00:00:00', '1');
INSERT INTO `oc_ids` VALUES ('28', 'SKD', '2', '2017-09-29 12:43:39', '0000-00-00 00:00:00', '1');
INSERT INTO `oc_ids` VALUES ('29', 'FKD', '2', '2017-09-29 12:47:34', '0000-00-00 00:00:00', '1');
INSERT INTO `oc_ids` VALUES ('30', 'FKD', '3', '2017-09-29 13:34:40', '0000-00-00 00:00:00', '1');
INSERT INTO `oc_ids` VALUES ('31', 'CGRKD', '3', '2017-09-29 13:43:34', '0000-00-00 00:00:00', '1');
INSERT INTO `oc_ids` VALUES ('32', 'CGRKD', '4', '2017-09-29 14:25:22', '0000-00-00 00:00:00', '1');
INSERT INTO `oc_ids` VALUES ('33', 'CGRKD', '5', '2017-09-29 14:27:15', '0000-00-00 00:00:00', '1');
INSERT INTO `oc_ids` VALUES ('34', 'CGRKD', '6', '2017-09-29 14:28:24', '0000-00-00 00:00:00', '1');
INSERT INTO `oc_ids` VALUES ('35', 'CGRKD', '7', '2017-09-29 14:43:22', '0000-00-00 00:00:00', '1');
INSERT INTO `oc_ids` VALUES ('36', 'CPRKD', '1', '2017-09-29 21:54:43', '0000-00-00 00:00:00', '1');
INSERT INTO `oc_ids` VALUES ('37', 'CLCKD', '1', '2017-09-29 21:56:02', '0000-00-00 00:00:00', '1');
INSERT INTO `oc_ids` VALUES ('38', 'FKD', '4', '2017-09-29 22:23:49', '0000-00-00 00:00:00', '1');
INSERT INTO `oc_ids` VALUES ('39', 'FKD', '5', '2017-09-29 22:39:42', '0000-00-00 00:00:00', '1');
INSERT INTO `oc_ids` VALUES ('40', 'FKD', '1', '2017-09-29 22:45:08', '0000-00-00 00:00:00', '1');
INSERT INTO `oc_ids` VALUES ('41', 'XSCKD', '4', '2017-09-30 19:36:57', '0000-00-00 00:00:00', '1');
INSERT INTO `oc_ids` VALUES ('42', 'CGRKD', '8', '2017-09-30 20:08:25', '0000-00-00 00:00:00', '1');
INSERT INTO `oc_ids` VALUES ('43', 'FKD', '6', '2017-09-30 20:08:37', '0000-00-00 00:00:00', '1');
INSERT INTO `oc_ids` VALUES ('44', 'FKD', '7', '2017-09-30 23:48:00', '0000-00-00 00:00:00', '1');
INSERT INTO `oc_ids` VALUES ('45', 'FKD', '8', '2017-10-01 11:06:01', '0000-00-00 00:00:00', '1');
INSERT INTO `oc_ids` VALUES ('46', 'SKD', '3', '2017-10-01 11:24:50', '0000-00-00 00:00:00', '1');
INSERT INTO `oc_ids` VALUES ('47', 'SKD', '4', '2017-10-01 11:26:20', '0000-00-00 00:00:00', '1');
INSERT INTO `oc_ids` VALUES ('48', 'FKD', '9', '2017-10-01 11:30:45', '0000-00-00 00:00:00', '1');
INSERT INTO `oc_ids` VALUES ('49', 'SKD', '5', '2017-10-01 11:33:43', '0000-00-00 00:00:00', '1');
INSERT INTO `oc_ids` VALUES ('50', 'SKD', '6', '2017-10-01 11:35:34', '0000-00-00 00:00:00', '1');
INSERT INTO `oc_ids` VALUES ('51', 'CGRKD', '9', '2017-10-09 11:23:13', '0000-00-00 00:00:00', '1');
INSERT INTO `oc_ids` VALUES ('52', 'CGRKD', '10', '2017-10-09 14:30:56', '0000-00-00 00:00:00', '1');
INSERT INTO `oc_ids` VALUES ('53', 'XSCKD', '5', '2017-10-09 15:54:24', '0000-00-00 00:00:00', '1');
INSERT INTO `oc_ids` VALUES ('54', 'SKD', '7', '2017-10-09 16:37:38', '0000-00-00 00:00:00', '1');
INSERT INTO `oc_ids` VALUES ('55', 'SKD', '8', '2017-10-09 16:54:10', '0000-00-00 00:00:00', '1');
INSERT INTO `oc_ids` VALUES ('56', 'SKD', '9', '2017-10-09 16:58:18', '0000-00-00 00:00:00', '1');
INSERT INTO `oc_ids` VALUES ('57', 'XSCKD', '6', '2017-10-09 22:46:49', '0000-00-00 00:00:00', '1');
INSERT INTO `oc_ids` VALUES ('58', 'CPRKD', '2', '2017-10-09 22:48:54', '0000-00-00 00:00:00', '1');
INSERT INTO `oc_ids` VALUES ('59', 'XSCKD', '7', '2017-10-10 08:24:26', '0000-00-00 00:00:00', '1');
INSERT INTO `oc_ids` VALUES ('60', 'XSCKD', '8', '2017-10-10 08:29:01', '0000-00-00 00:00:00', '1');
INSERT INTO `oc_ids` VALUES ('61', 'XSCKD', '9', '2017-10-10 08:45:26', '0000-00-00 00:00:00', '1');
INSERT INTO `oc_ids` VALUES ('62', 'XSCKD', '10', '2017-10-10 08:48:35', '0000-00-00 00:00:00', '1');
INSERT INTO `oc_ids` VALUES ('63', 'XSCKD', '11', '2017-10-10 09:00:34', '0000-00-00 00:00:00', '1');
INSERT INTO `oc_ids` VALUES ('64', 'XSCKD', '12', '2017-10-10 09:01:55', '0000-00-00 00:00:00', '1');
INSERT INTO `oc_ids` VALUES ('65', 'XSCKD', '13', '2017-10-10 09:03:07', '0000-00-00 00:00:00', '1');
INSERT INTO `oc_ids` VALUES ('66', 'XSCKD', '14', '2017-10-10 09:04:42', '0000-00-00 00:00:00', '1');
INSERT INTO `oc_ids` VALUES ('67', 'XSCKD', '15', '2017-10-10 09:06:47', '0000-00-00 00:00:00', '1');
INSERT INTO `oc_ids` VALUES ('68', 'CPRKD', '3', '2017-10-10 09:13:43', '0000-00-00 00:00:00', '1');
INSERT INTO `oc_ids` VALUES ('69', 'CGRKD', '11', '2017-10-13 08:59:42', '0000-00-00 00:00:00', '1');



DROP TABLE IF EXISTS `oc_order_payment_way`;
CREATE TABLE `oc_order_payment_way` (
  `id` int(4) unsigned NOT NULL AUTO_INCREMENT,
  `payment_way` varchar(50) DEFAULT '' COMMENT '支付方式',
  `payment_account` varchar(50) DEFAULT '' COMMENT '支付账户',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `status` tinyint(2) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

INSERT INTO `oc_order_payment_way` VALUES ('1', '微信', 'jsmh1357911', '2017-09-29 09:58:20', '0000-00-00 00:00:00', '1');
INSERT INTO `oc_order_payment_way` VALUES ('2', '银行转账', '53254652564568425', '2017-09-29 09:58:52', '0000-00-00 00:00:00', '1');
INSERT INTO `oc_order_payment_way` VALUES ('3', '支付宝转账', '876736257@163.com', '2017-09-29 09:59:26', '0000-00-00 00:00:00', '1');



DROP TABLE IF EXISTS `oc_storehouse_clerk`;
CREATE TABLE `oc_storehouse_clerk` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `clerk_name` varchar(50) DEFAULT '' COMMENT '业务员名称',
  `clerk_phone` varchar(15) DEFAULT '' COMMENT '业务员电话',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `status` tinyint(3) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

INSERT INTO `oc_storehouse_clerk` VALUES ('1', '张三', '135886654896', '2017-09-05 08:57:58', '0000-00-00 00:00:00', '1');
INSERT INTO `oc_storehouse_clerk` VALUES ('2', '王文静', '19866545852', '2017-09-17 11:29:06', '0000-00-00 00:00:00', '1');
INSERT INTO `oc_storehouse_clerk` VALUES ('3', '李思静', '13566548652', '2017-09-17 11:29:23', '0000-00-00 00:00:00', '1');



DROP TABLE IF EXISTS `oc_storehouse_close_accounts`;
CREATE TABLE `oc_storehouse_close_accounts` (
  `id` int(8) unsigned NOT NULL AUTO_INCREMENT,
  `close_date` varchar(15) DEFAULT '' COMMENT '结账日期',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `status` tinyint(2) DEFAULT '1',
  `username` varchar(50) DEFAULT '',
  `nickname` varchar(50) DEFAULT '',
  `is_audited` tinyint(2) DEFAULT '0' COMMENT '审核',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

INSERT INTO `oc_storehouse_close_accounts` VALUES ('1', '2017-10', '2017-09-17 15:24:39', '0000-00-00 00:00:00', '1', 'admin', '超级管理员', '1');
INSERT INTO `oc_storehouse_close_accounts` VALUES ('2', '2017-09', '2017-10-01 21:24:52', '0000-00-00 00:00:00', '1', 'admin', '超级管理员', '1');



DROP TABLE IF EXISTS `oc_storehouse_customer`;
CREATE TABLE `oc_storehouse_customer` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `customer_id` varchar(11) DEFAULT '' COMMENT '客户编号',
  `customer_name` varchar(50) DEFAULT '' COMMENT '客户名称',
  `customer_type` varchar(50) DEFAULT '' COMMENT '客户类别',
  `customer_contacts` varchar(20) DEFAULT '' COMMENT '联系人',
  `customer_phone` varchar(15) DEFAULT '' COMMENT '客户电话',
  `customer_address` varchar(50) DEFAULT '' COMMENT '用户地址',
  `types` varchar(50) DEFAULT '' COMMENT '类别：如供应商、部门、客户',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `status` tinyint(3) DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQUE` (`customer_id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

INSERT INTO `oc_storehouse_customer` VALUES ('1', 'BM1001', '财务部', '公司部门', '', '13544565874', '/', '公司部门', '2017-09-05 09:11:09', '0000-00-00 00:00:00', '1');
INSERT INTO `oc_storehouse_customer` VALUES ('2', 'GYS1001', 'XXX建材有限公司', '公司部门', '', '13544565874', '河南省郑州市百合路118号', '供应商', '2017-09-07 04:38:23', '0000-00-00 00:00:00', '1');
INSERT INTO `oc_storehouse_customer` VALUES ('3', 'KH0001', 'XXX市政局', '4X', '', '13265656565', '解放路', '客户', '2017-09-11 13:42:31', '0000-00-00 00:00:00', '1');
INSERT INTO `oc_storehouse_customer` VALUES ('4', 'KH0002', '郑州市市政管理中心', '', '', '13655465234', '泰中路1256号', '客户', '2017-09-17 12:47:24', '0000-00-00 00:00:00', '1');



DROP TABLE IF EXISTS `oc_storehouse_entry_order`;
CREATE TABLE `oc_storehouse_entry_order` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_order_type_name` varchar(50) DEFAULT '' COMMENT '入库单类型',
  `entry_order_id` varchar(50) DEFAULT '' COMMENT '入库单编号',
  `entry_order_invoice_number` varchar(50) DEFAULT '' COMMENT '发票号码',
  `entry_order_price` decimal(10,2) DEFAULT '0.00' COMMENT '单据金额',
  `entry_order_payment_way` varchar(10) DEFAULT '' COMMENT '支付方式',
  `entry_order_remark` varchar(50) DEFAULT '' COMMENT '摘要',
  `entry_order_payment_account` varchar(20) DEFAULT '' COMMENT '支付账户',
  `entry_order_deposit_rate` decimal(4,2) DEFAULT '0.00' COMMENT '折扣率',
  `entry_order_tax_rate` decimal(4,2) DEFAULT '0.00' COMMENT '税率',
  `entry_order_before_payment` decimal(10,2) DEFAULT '0.00' COMMENT '预付金额',
  `entry_order_including_tax_price` decimal(10,2) DEFAULT '0.00' COMMENT '含税金额',
  `entry_order_account_payable` decimal(10,2) DEFAULT '0.00' COMMENT '应付金额',
  `entry_order_actual_payment` decimal(10,2) DEFAULT '0.00' COMMENT '实际支付',
  `entry_order_payment_date` date DEFAULT '0000-00-00' COMMENT '支付日期',
  `entry_order_is_audited` int(2) DEFAULT '0' COMMENT '是否审核',
  `entry_order_date` date DEFAULT '0000-00-00' COMMENT '单据发生日期',
  `customer_id` varchar(50) DEFAULT '' COMMENT '客户/供应商/部门 编号',
  `customer_name` varchar(50) DEFAULT '' COMMENT '客户/供应商/部门 名称',
  `customer_contacts` varchar(20) DEFAULT '',
  `customer_phone` varchar(15) DEFAULT '',
  `customer_address` varchar(50) DEFAULT '',
  `storehouse_name` varchar(50) DEFAULT '' COMMENT '所属仓库',
  `invoice_type` varchar(50) DEFAULT '' COMMENT '发票类型',
  `username` varchar(50) DEFAULT '' COMMENT '操作人（英文）',
  `nickname` varchar(50) DEFAULT '' COMMENT '操作人（中文）',
  `clerk_name` varchar(50) DEFAULT '' COMMENT '业务员',
  `department` varchar(50) DEFAULT '' COMMENT '部门',
  `audited_date` varchar(15) DEFAULT '' COMMENT '审核日期',
  `goods_id` varchar(11) DEFAULT '' COMMENT '商品编码',
  `goods_name` varchar(50) DEFAULT '' COMMENT '商品名称',
  `goods_spec` varchar(50) DEFAULT '' COMMENT '商品规格',
  `goods_min_unit` varchar(10) DEFAULT '' COMMENT '商品最小单位',
  `goods_rates` varchar(100) DEFAULT '' COMMENT '换算率集合',
  `goods_actual_unit` varchar(10) DEFAULT '' COMMENT '商品实际单位',
  `goods_weight` decimal(10,2) DEFAULT '0.00' COMMENT '商品重量',
  `goods_stock_balance` decimal(10,2) DEFAULT '0.00' COMMENT '商品帐存量',
  `goods_actual_stock_balance` decimal(10,2) DEFAULT '0.00' COMMENT '商品实际数量',
  `goods_cost_price` decimal(10,2) DEFAULT '0.00' COMMENT '商品单价',
  `goods_order_quantity` decimal(10,2) DEFAULT '0.00' COMMENT '商品订购数量',
  `goods_is_free` int(2) DEFAULT '0' COMMENT '商品是否为赠品 0-否 1-是',
  `goods_entry_unit_price` decimal(10,2) DEFAULT '0.00' COMMENT '商品调入单价',
  `goods_entry_total_quantity` decimal(10,2) DEFAULT '0.00' COMMENT '商品调入数量',
  `goods_entry_total_price` decimal(10,2) DEFAULT '0.00' COMMENT '商品调入金额',
  `goods_return_unit_price` decimal(10,2) DEFAULT '0.00' COMMENT '商品退货单价',
  `goods_return_total_quantity` decimal(10,2) DEFAULT '0.00' COMMENT '商品退货数量',
  `goods_return_total_price` decimal(10,2) DEFAULT '0.00' COMMENT '商品退货金额',
  `goods_remark` varchar(20) DEFAULT '' COMMENT '商品备注',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '单据生成时间',
  `update_time` timestamp NULL DEFAULT '0000-00-00 00:00:00',
  `status` tinyint(3) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

INSERT INTO `oc_storehouse_entry_order` VALUES ('1', '采购入库单', 'CGRKD00000001', '', '20000.00', '银行转账', '还好', '53254652564568425', '0.00', '4.00', '0.00', '800.00', '20800.00', '20800.00', '0000-00-00', '1', '2017-09-14', 'GYS1001', 'XXX建材有限公司', '张三', '13544565874', '河南省郑州市百合路118号', '原料仓', '普通发票', 'admin', '超级管理员', '王文静', '财务部', '2017-09-29', 'YCL0001', '铸铁', '500*500 B125', 'kg', '300/件,500/箱,3000/吨', 'kg', '200.00', '0.00', '0.00', '0.00', '0.00', '0', '100.00', '200.00', '20000.00', '0.00', '0.00', '0.00', '', '2017-09-29 12:30:11', '0000-00-00 00:00:00', '1');
INSERT INTO `oc_storehouse_entry_order` VALUES ('2', '采购入库单', 'CGRKD00000005', '', '3000.00', '支付宝转账', '', '876736257@163.com', '0.00', '4.00', '0.00', '120.00', '3120.00', '3000.00', '0000-00-00', '1', '2017-09-21', 'GYS1001', 'XXX建材有限公司', '', '13544565874', '河南省郑州市百合路118号', '原料仓', '普通发票', 'admin', '超级管理员', '张三', '财务部', '2017-09-29', 'YCL0001', '铸铁', '500*500 B125', 'kg', '300/件,500/箱,3000/吨', 'kg', '1000.00', '0.00', '0.00', '0.00', '0.00', '0', '3.00', '1000.00', '3000.00', '0.00', '0.00', '0.00', '', '2017-09-29 14:28:18', '0000-00-00 00:00:00', '1');
INSERT INTO `oc_storehouse_entry_order` VALUES ('3', '采购入库单', 'CGRKD00000006', '', '1500.00', '银行转账', 'sdfsdf', '53254652564568425', '0.00', '4.00', '0.00', '60.00', '1560.00', '1560.00', '0000-00-00', '1', '2017-10-18', 'GYS1001', 'XXX建材有限公司', '234', '13544565874', '河南省郑州市百合路118号', '原料仓', '普通发票', 'admin', '超级管理员', '李思静', '财务部', '2017-09-29', 'YCL0001', '铸铁', '500*500 B125', 'kg', '300/件,500/箱,3000/吨', 'kg', '500.00', '0.00', '0.00', '0.00', '0.00', '0', '3.00', '500.00', '1500.00', '0.00', '0.00', '0.00', '', '2017-09-29 14:29:19', '0000-00-00 00:00:00', '1');
INSERT INTO `oc_storehouse_entry_order` VALUES ('4', '采购入库单', 'CGRKD00000007', '', '10300.00', '微信', '', 'jsmh1357911', '0.00', '0.00', '0.00', '0.00', '10300.00', '10000.00', '0000-00-00', '1', '2017-10-18', 'GYS1001', 'XXX建材有限公司', '', '13544565874', '河南省郑州市百合路118号', '原料仓', '普通发票', 'admin', '超级管理员', '王文静', '财务部', '2017-09-29', 'YCL0001', '铸铁', '500*500 B125', 'kg', '300/件,500/箱,3000/吨', '件', '30000.00', '0.00', '0.00', '0.00', '0.00', '0', '3.00', '100.00', '300.00', '0.00', '0.00', '0.00', '', '2017-09-29 14:44:44', '0000-00-00 00:00:00', '1');
INSERT INTO `oc_storehouse_entry_order` VALUES ('11', '产品入库单(补差)', 'CPRKD-XSCKD00000015', '', '0.00', '', '', '', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0000-00-00', '1', '2017-11-14', '', '', '', '', '', '产品仓', '', 'admin', '超级管理员', '', '', '2017-10-10', 'CP0001', '井盖', 'JQ-300*300', 'kg', '500/箱,1000/吨', 'kg', '200.87', '0.00', '0.00', '0.00', '0.00', '0', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '', '2017-10-10 09:29:26', '0000-00-00 00:00:00', '1');
INSERT INTO `oc_storehouse_entry_order` VALUES ('12', '产品入库单(补差)', 'CPRKD-XSCKD00000015', '', '0.00', '', '', '', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0000-00-00', '1', '2017-11-14', '', '', '', '', '', '产品仓', '', 'admin', '超级管理员', '', '', '2017-10-10', 'CP0002', '一号井盖', 'JQ-300*300', 'kg', '500/箱,1000/吨', 'kg', '184.13', '0.00', '0.00', '0.00', '0.00', '0', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '', '2017-10-10 09:29:26', '0000-00-00 00:00:00', '1');



DROP TABLE IF EXISTS `oc_storehouse_entry_order_type`;
CREATE TABLE `oc_storehouse_entry_order_type` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_order_type_id` varchar(11) DEFAULT '' COMMENT '入库单类型编号',
  `entry_order_type_name` varchar(50) DEFAULT '' COMMENT '入库单类型名称',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `status` tinyint(3) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;




DROP TABLE IF EXISTS `oc_storehouse_gathering_order`;
CREATE TABLE `oc_storehouse_gathering_order` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `gathering_order_type_name` varchar(50) DEFAULT '' COMMENT '收款单类型',
  `gathering_order_id` varchar(50) DEFAULT '' COMMENT '收款单编号',
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
  `gathering_order_payment_date` date DEFAULT '0000-00-00' COMMENT '支付日期',
  `gathering_order_is_audited` int(2) DEFAULT '0' COMMENT '是否审核',
  `gathering_order_date` date DEFAULT '0000-00-00' COMMENT '单据发生日期',
  `customer_id` varchar(50) DEFAULT '' COMMENT '客户/供应商/部门 编号',
  `customer_name` varchar(50) DEFAULT '' COMMENT '客户/供应商/部门 名称',
  `clerk_name` varchar(50) DEFAULT '' COMMENT '业务员',
  `storehouse_name` varchar(50) DEFAULT '' COMMENT '所属仓库',
  `invoice_type` varchar(50) DEFAULT '' COMMENT '发票类型',
  `username` varchar(50) DEFAULT '' COMMENT '操作人（英文）',
  `nickname` varchar(50) DEFAULT '' COMMENT '操作人（中文）',
  `department` varchar(50) DEFAULT '',
  `audited_date` varchar(15) DEFAULT '',
  `out_order_date` date DEFAULT '0000-00-00' COMMENT '单据发生日期',
  `out_order_id` varchar(50) DEFAULT '' COMMENT '单据编号',
  `out_order_price` decimal(10,2) DEFAULT '0.00' COMMENT '单据金额',
  `out_order_account_receivable` decimal(10,2) DEFAULT '0.00' COMMENT '应收金额',
  `already_clear_price` decimal(10,2) DEFAULT '0.00' COMMENT '已核销',
  `no_clear_price` decimal(10,2) DEFAULT '0.00' COMMENT '未核销',
  `now_clear_price` decimal(10,2) DEFAULT '0.00' COMMENT '本次核销',
  `order_remark` varchar(20) DEFAULT '' COMMENT '商品备注',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '单据生成时间',
  `update_time` timestamp NULL DEFAULT '0000-00-00 00:00:00',
  `status` tinyint(3) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

INSERT INTO `oc_storehouse_gathering_order` VALUES ('1', '预收款', 'SKD00000001', '', '', '', '', '6800.00', '0.00', '0.00', '0.00', '0.00', '6800.00', '6800.00', '2017-09-06', '1', '0000-00-00', 'KH0001', 'XXX市政局', '王文静', '', '', 'admin', '超级管理员', '财务部', '2017-09-29', '2017-09-20', 'XSCKD00000001', '45000.00', '46800.00', '40000.00', '6800.00', '6800.00', '', '2017-09-29 12:43:04', '0000-00-00 00:00:00', '1');
INSERT INTO `oc_storehouse_gathering_order` VALUES ('2', '预收款', 'SKD00000004', '', '', '', '', '0.00', '0.00', '0.00', '0.00', '0.00', '500.00', '500.00', '0000-00-00', '0', '2017-10-20', 'KH0001', 'XXX市政局', '王文静', '', '', '', '', '财务部', '', '0000-00-00', '', '0.00', '0.00', '0.00', '0.00', '0.00', '', '2017-10-01 11:33:14', '0000-00-00 00:00:00', '1');



DROP TABLE IF EXISTS `oc_storehouse_gathering_order_clear`;
CREATE TABLE `oc_storehouse_gathering_order_clear` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `gathering_order_id` varchar(11) DEFAULT '' COMMENT '收款单编号',
  `gathering_order_price` decimal(10,2) DEFAULT '0.00' COMMENT '单据金额',
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




DROP TABLE IF EXISTS `oc_storehouse_goods`;
CREATE TABLE `oc_storehouse_goods` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `goods_type_name` varchar(50) DEFAULT '' COMMENT '商品类型',
  `goods_id` varchar(50) DEFAULT '' COMMENT '商品编号',
  `goods_name` varchar(50) DEFAULT '' COMMENT '商品名称',
  `goods_spec` varchar(50) DEFAULT '' COMMENT '商品规格',
  `goods_min_unit` varchar(10) DEFAULT '' COMMENT '商品最小计量单位',
  `goods_rates` varchar(100) DEFAULT '' COMMENT '换算率集合',
  `goods_stock_balance` decimal(10,2) DEFAULT '0.00' COMMENT '商品库存量',
  `goods_cost_price` decimal(10,2) DEFAULT '0.00' COMMENT '商品成本价',
  `goods_market_price` decimal(10,2) DEFAULT '0.00' COMMENT '商品销售价',
  `storehouse_name` varchar(50) DEFAULT '' COMMENT '商品所在仓库',
  `username` varchar(20) DEFAULT '' COMMENT '操作人（英文）',
  `nickname` varchar(20) DEFAULT '' COMMENT '操作人（中文）',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `status` tinyint(3) DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQUE` (`goods_id`)
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

INSERT INTO `oc_storehouse_goods` VALUES ('1', '产品', 'CP0001', '井盖', 'JQ-300*300', 'kg', '500/箱,1000/吨', '2627.39', '5.00', '10.00', '产品仓', '', '', '2017-09-14 17:26:08', '0000-00-00 00:00:00', '1');
INSERT INTO `oc_storehouse_goods` VALUES ('2', '原材料', 'YCL0001', '铸铁', '500*500 B125', 'kg', '300/件,500/箱,3000/吨', '33697.00', '3.00', '0.00', '原料仓', '', '', '2017-09-14 17:26:08', '0000-00-00 00:00:00', '1');
INSERT INTO `oc_storehouse_goods` VALUES ('3', '原材料', 'YCL00002', '生铁', '500*500 L125', 'kg', '300/件,500/箱,3000/吨', '51000.00', '100.00', '500.00', '原料仓', 'admin', '超级管理员', '2017-09-29 14:43:17', '0000-00-00 00:00:00', '1');
INSERT INTO `oc_storehouse_goods` VALUES ('13', '产品', 'CP0002', '一号井盖', 'JQ-300*300', 'kg', '500/箱,1000/吨', '2692.61', '5.00', '10.00', '产品仓', '', '', '2017-10-10 08:59:58', '0000-00-00 00:00:00', '1');



DROP TABLE IF EXISTS `oc_storehouse_goods_check`;
CREATE TABLE `oc_storehouse_goods_check` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `goods_check_id` varchar(50) DEFAULT '',
  `goods_type_name` varchar(50) DEFAULT '' COMMENT '商品类型',
  `goods_id` varchar(11) DEFAULT '' COMMENT '商品编号',
  `goods_name` varchar(50) DEFAULT '' COMMENT '商品名称',
  `goods_spec` varchar(50) DEFAULT '' COMMENT '商品规格',
  `goods_min_unit` varchar(10) DEFAULT '' COMMENT '商品最小计量单位',
  `goods_stock_balance` decimal(10,2) DEFAULT '0.00' COMMENT '商品库存量',
  `goods_check_balance` decimal(10,2) DEFAULT '0.00' COMMENT '商品盘点数量',
  `storehouse_name` varchar(50) DEFAULT '' COMMENT '商品所在仓库',
  `goods_check_is_audited` int(2) DEFAULT '0' COMMENT '是否审核',
  `username` varchar(20) DEFAULT '' COMMENT '操作人（英文）',
  `nickname` varchar(20) DEFAULT '' COMMENT '操作人（中文）',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `status` tinyint(3) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

INSERT INTO `oc_storehouse_goods_check` VALUES ('1', 'PD000001', '', 'CP0001', '井盖', 'JQ-300*300', 'kg', '501.00', '500.00', '产品仓', '1', 'admin', '超级管理员', '2017-09-17 13:55:18', '0000-00-00 00:00:00', '1');
INSERT INTO `oc_storehouse_goods_check` VALUES ('2', 'PD000002', '', 'YCL0001', '铸铁', '500*500 B125', 'kg', '2100.00', '2000.00', '原料仓', '1', 'admin', '超级管理员', '2017-09-17 14:00:23', '0000-00-00 00:00:00', '1');



DROP TABLE IF EXISTS `oc_storehouse_goods_type`;
CREATE TABLE `oc_storehouse_goods_type` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `goods_type_id` varchar(11) DEFAULT '' COMMENT '商品类型编号',
  `goods_type_name` varchar(50) DEFAULT '' COMMENT '商品类型名称',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` timestamp NULL DEFAULT '0000-00-00 00:00:00',
  `status` tinyint(3) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

INSERT INTO `oc_storehouse_goods_type` VALUES ('1', 'SP001', '原材料', '2017-09-05 09:13:26', '0000-00-00 00:00:00', '1');
INSERT INTO `oc_storehouse_goods_type` VALUES ('2', 'SP002', '产品', '2017-09-05 09:14:15', '0000-00-00 00:00:00', '1');



DROP TABLE IF EXISTS `oc_storehouse_info`;
CREATE TABLE `oc_storehouse_info` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `storehouse_id` varchar(11) DEFAULT '' COMMENT '仓库编号',
  `storehouse_name` varchar(50) DEFAULT '' COMMENT '仓库名称',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `status` tinyint(3) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

INSERT INTO `oc_storehouse_info` VALUES ('2', 'CK0002', '产品仓', '2017-09-05 08:12:30', '0000-00-00 00:00:00', '1');
INSERT INTO `oc_storehouse_info` VALUES ('3', 'CK0001', '原料仓', '2017-09-13 11:36:38', '0000-00-00 00:00:00', '1');



DROP TABLE IF EXISTS `oc_storehouse_order_logs`;
CREATE TABLE `oc_storehouse_order_logs` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `order_type_name` varchar(50) DEFAULT '' COMMENT '单据类型',
  `order_id` varchar(50) DEFAULT '' COMMENT '单据编号',
  `order_price` decimal(10,2) DEFAULT '0.00' COMMENT '单据金额',
  `order_date` date DEFAULT '0000-00-00' COMMENT '单据发生日期',
  `goods_id` varchar(11) DEFAULT '' COMMENT '商品编码',
  `goods_name` varchar(50) DEFAULT '' COMMENT '商品名称',
  `goods_spec` varchar(50) DEFAULT '' COMMENT '商品规格',
  `goods_unit` varchar(10) DEFAULT '' COMMENT '商品单位',
  `goods_weight` decimal(10,2) DEFAULT '0.00' COMMENT '商品重量',
  `goods_balance` decimal(10,2) DEFAULT '0.00' COMMENT '商品数量',
  `goods_price` decimal(10,2) DEFAULT '0.00' COMMENT '商品单价',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '单据生成时间',
  `update_time` timestamp NULL DEFAULT '0000-00-00 00:00:00',
  `status` tinyint(3) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;




DROP TABLE IF EXISTS `oc_storehouse_out_order`;
CREATE TABLE `oc_storehouse_out_order` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `out_order_type_name` varchar(50) DEFAULT '' COMMENT '出库单类型',
  `out_order_id` varchar(50) DEFAULT '' COMMENT '出库单编号',
  `out_order_invoice_number` varchar(50) DEFAULT '' COMMENT '发票号码',
  `out_order_price` decimal(10,2) DEFAULT '0.00' COMMENT '单据金额',
  `out_order_payment_way` varchar(10) DEFAULT '' COMMENT '支付方式',
  `out_order_remark` varchar(50) DEFAULT '' COMMENT '摘要',
  `out_order_payment_account` varchar(20) DEFAULT '' COMMENT '支付账户',
  `out_order_deposit_rate` decimal(4,2) DEFAULT '0.00' COMMENT '折扣率',
  `out_order_tax_rate` decimal(4,2) DEFAULT '0.00' COMMENT '税率',
  `out_order_before_payment` decimal(10,2) DEFAULT '0.00' COMMENT '预付金额',
  `out_order_including_tax_price` decimal(10,2) DEFAULT '0.00' COMMENT '含税金额',
  `out_order_account_receivable` decimal(10,2) DEFAULT '0.00' COMMENT '应收金额',
  `out_order_actual_payment` decimal(10,2) DEFAULT '0.00' COMMENT '实际支付',
  `out_order_payment_date` date DEFAULT '0000-00-00' COMMENT '支付日期',
  `out_order_is_audited` int(2) DEFAULT '0' COMMENT '是否审核',
  `out_order_date` date DEFAULT '0000-00-00' COMMENT '单据发生日期',
  `customer_id` varchar(50) DEFAULT '' COMMENT '客户/供应商/部门 编号',
  `customer_name` varchar(50) DEFAULT '' COMMENT '客户/供应商/部门 名称',
  `customer_contacts` varchar(20) DEFAULT '',
  `customer_phone` varchar(15) DEFAULT '',
  `customer_address` varchar(50) DEFAULT '',
  `storehouse_name` varchar(50) DEFAULT '' COMMENT '所属仓库',
  `invoice_type` varchar(50) DEFAULT '' COMMENT '发票类型',
  `username` varchar(50) DEFAULT '' COMMENT '操作人（英文）',
  `nickname` varchar(50) DEFAULT '' COMMENT '操作人（中文）',
  `clerk_name` varchar(50) DEFAULT '' COMMENT '业务员',
  `department` varchar(50) DEFAULT '',
  `audited_date` varchar(15) DEFAULT '',
  `goods_id` varchar(11) DEFAULT '' COMMENT '商品编码',
  `goods_name` varchar(50) DEFAULT '' COMMENT '商品名称',
  `goods_spec` varchar(50) DEFAULT '' COMMENT '商品规格',
  `goods_min_unit` varchar(10) DEFAULT '' COMMENT '商品最小单位',
  `goods_rates` varchar(100) DEFAULT '' COMMENT '换算率集合',
  `goods_actual_unit` varchar(10) DEFAULT '' COMMENT '商品实际单位',
  `goods_weight` decimal(10,2) DEFAULT '0.00' COMMENT '商品实际重量',
  `goods_weight_standard` decimal(10,2) DEFAULT '0.00' COMMENT '商品标准重量',
  `goods_stock_balance` decimal(10,2) DEFAULT '0.00' COMMENT '商品帐存量',
  `goods_actual_stock_balance` decimal(10,2) DEFAULT '0.00' COMMENT '商品实际数量',
  `goods_cost_price` decimal(10,2) DEFAULT '0.00' COMMENT '商品单价',
  `goods_order_quantity` decimal(10,2) DEFAULT '0.00' COMMENT '商品订购数量',
  `goods_is_free` int(2) DEFAULT '0' COMMENT '商品是否为赠品 0-否 1-是',
  `goods_out_unit_price` decimal(10,2) DEFAULT '0.00' COMMENT '商品调出单价',
  `goods_out_total_quantity` decimal(10,2) DEFAULT '0.00' COMMENT '商品调出数量',
  `goods_out_total_price` decimal(10,2) DEFAULT '0.00' COMMENT '商品调出金额',
  `goods_return_unit_price` decimal(10,2) DEFAULT '0.00' COMMENT '商品退货单价',
  `goods_return_total_quantity` decimal(10,2) DEFAULT '0.00' COMMENT '商品退货数量',
  `goods_return_total_price` decimal(10,2) DEFAULT '0.00' COMMENT '商品退货金额',
  `goods_remark` varchar(20) DEFAULT '' COMMENT '商品备注',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '单据生成时间',
  `update_time` timestamp NULL DEFAULT '0000-00-00 00:00:00',
  `status` tinyint(3) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

INSERT INTO `oc_storehouse_out_order` VALUES ('1', '销售出库单', 'XSCKD00000001', '', '45000.00', '银行转账', '', '53254652564568425', '0.00', '4.00', '0.00', '1800.00', '46800.00', '46800.00', '0000-00-00', '1', '2017-09-20', 'KH0001', 'XXX市政局', '', '13265656565', '解放路', '产品仓', '普通发票', 'admin', '超级管理员', '李思静', '财务部', '2017-09-29', 'CP0001', '井盖', 'JQ-300*300', 'kg', '500/箱,1000/吨', 'kg', '90.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0', '500.00', '90.00', '45000.00', '0.00', '0.00', '0.00', '', '2017-09-29 10:33:05', '0000-00-00 00:00:00', '1');
INSERT INTO `oc_storehouse_out_order` VALUES ('2', '材料出库单', 'CLCKD00000001', '', '2030.00', '', '似的发射点', '', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0000-00-00', '0', '2017-09-15', 'BM1001', '财务部', '', '', '', '原料仓', '', 'admin', '超级管理员', '', '', '', 'YCL0001', '铸铁', '500*500 B125', 'kg', '300/件,500/箱,3000/吨', '吨', '30000.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0', '3.00', '10.00', '30.00', '0.00', '0.00', '0.00', '', '2017-09-29 21:56:40', '0000-00-00 00:00:00', '1');
INSERT INTO `oc_storehouse_out_order` VALUES ('3', '材料出库单', 'CLCKD00000001', '', '2030.00', '', '似的发射点', '', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0000-00-00', '0', '2017-09-15', 'BM1001', '财务部', '', '', '', '原料仓', '', 'admin', '超级管理员', '', '', '', 'YCL00002', '生铁', '500*500 L125', 'kg', '300/件,500/箱,3000/吨', '件', '6000.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0', '100.00', '20.00', '2000.00', '0.00', '0.00', '0.00', '', '2017-09-29 21:56:40', '0000-00-00 00:00:00', '1');
INSERT INTO `oc_storehouse_out_order` VALUES ('4', '销售出库单', 'XSCKD00000015', '', '575.00', '银行转账', '', '53254652564568425', '0.00', '0.00', '100.00', '0.00', '475.00', '0.00', '0000-00-00', '1', '2017-11-14', 'KH0001', 'XXX市政局', '', '13265656565', '解放路', '产品仓', '普通发票', 'admin', '超级管理员', '张三', '财务部', '2017-10-10', 'CP0001', '井盖', 'JQ-300*300', 'kg', '500/箱,1000/吨', 'kg', '260.87', '60.00', '0.00', '0.00', '0.00', '0.00', '0', '5.00', '60.00', '300.00', '0.00', '0.00', '0.00', '', '2017-10-10 09:10:01', '0000-00-00 00:00:00', '1');
INSERT INTO `oc_storehouse_out_order` VALUES ('5', '销售出库单', 'XSCKD00000015', '', '575.00', '银行转账', '', '53254652564568425', '0.00', '0.00', '100.00', '0.00', '475.00', '0.00', '0000-00-00', '1', '2017-11-14', 'KH0001', 'XXX市政局', '', '13265656565', '解放路', '产品仓', '普通发票', 'admin', '超级管理员', '张三', '财务部', '2017-10-10', 'CP0002', '一号井盖', 'JQ-300*300', 'kg', '500/箱,1000/吨', 'kg', '239.13', '55.00', '0.00', '0.00', '0.00', '0.00', '0', '5.00', '55.00', '275.00', '0.00', '0.00', '0.00', '', '2017-10-10 09:10:01', '0000-00-00 00:00:00', '1');



DROP TABLE IF EXISTS `oc_storehouse_out_order_type`;
CREATE TABLE `oc_storehouse_out_order_type` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `out_order_type_id` varchar(11) DEFAULT '' COMMENT '出库单类型编号',
  `out_order_type_name` varchar(50) DEFAULT '' COMMENT '出库单类型名称',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `status` tinyint(3) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;




DROP TABLE IF EXISTS `oc_storehouse_payment_order`;
CREATE TABLE `oc_storehouse_payment_order` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `payment_order_type_name` varchar(50) DEFAULT '' COMMENT '付款单类型',
  `payment_order_id` varchar(50) DEFAULT '' COMMENT '付款单编号',
  `payment_order_invoice_number` varchar(50) DEFAULT '' COMMENT '发票号码',
  `payment_order_payment_way` varchar(10) DEFAULT '' COMMENT '支付方式',
  `payment_order_remark` varchar(50) DEFAULT '' COMMENT '摘要',
  `payment_order_payment_account` varchar(20) DEFAULT '' COMMENT '支付账户',
  `payment_order_price` decimal(10,2) DEFAULT '0.00' COMMENT '单据金额',
  `payment_order_deposit_rate` decimal(4,2) DEFAULT '0.00' COMMENT '折扣率',
  `payment_order_deposit_after_price` decimal(10,2) DEFAULT '0.00' COMMENT '折后金额',
  `payment_order_tax_rate` decimal(4,2) DEFAULT '0.00' COMMENT '税率',
  `payment_order_including_tax_price` decimal(10,2) DEFAULT '0.00' COMMENT '含税金额',
  `payment_order_should_payment_price` decimal(10,2) DEFAULT '0.00' COMMENT '应付金额',
  `payment_order_actual_payment` decimal(10,2) DEFAULT '0.00' COMMENT '实际支付',
  `payment_order_payment_date` date DEFAULT NULL COMMENT '支付日期',
  `payment_order_is_audited` int(2) DEFAULT '0' COMMENT '是否审核',
  `payment_order_date` date DEFAULT '0000-00-00' COMMENT '单据发生日期',
  `customer_id` varchar(50) DEFAULT '' COMMENT '客户/供应商/部门 编号',
  `customer_name` varchar(50) DEFAULT '' COMMENT '客户/供应商/部门 名称',
  `storehouse_name` varchar(50) DEFAULT '' COMMENT '所属仓库',
  `invoice_type` varchar(50) DEFAULT '' COMMENT '发票类型',
  `username` varchar(50) DEFAULT '' COMMENT '操作人（英文）',
  `nickname` varchar(50) DEFAULT '' COMMENT '操作人（中文）',
  `clerk_name` varchar(50) DEFAULT '' COMMENT '业务员',
  `department` varchar(50) DEFAULT '',
  `audited_date` varchar(15) DEFAULT '',
  `entry_order_date` date DEFAULT '0000-00-00' COMMENT '单据发生日期',
  `entry_order_id` varchar(50) DEFAULT '' COMMENT '单据编号',
  `entry_order_price` decimal(10,2) DEFAULT '0.00' COMMENT '单据金额',
  `entry_order_account_payable` decimal(10,2) DEFAULT '0.00' COMMENT '应付金额',
  `already_clear_price` decimal(10,2) DEFAULT '0.00' COMMENT '已核销',
  `no_clear_price` decimal(10,2) DEFAULT '0.00' COMMENT '未核销',
  `now_clear_price` decimal(10,2) DEFAULT '0.00' COMMENT '本次核销',
  `order_remark` varchar(20) DEFAULT '' COMMENT '商品备注',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '单据生成时间',
  `update_time` timestamp NULL DEFAULT '0000-00-00 00:00:00',
  `status` tinyint(3) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

INSERT INTO `oc_storehouse_payment_order` VALUES ('1', '预付款', 'FKD00000001', '', '', '', '', '300.00', '0.00', '0.00', '0.00', '0.00', '300.00', '300.00', '0000-00-00', '0', '2017-09-22', 'GYS1001', 'XXX建材有限公司', '', '', 'admin', '超级管理员', '张三', '财务部', '', '2017-09-30', 'CGRKD00000007', '10300.00', '10300.00', '10000.00', '300.00', '300.00', '', '2017-09-29 22:45:46', '0000-00-00 00:00:00', '1');



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




DROP TABLE IF EXISTS `oc_storehouse_sales_order`;
CREATE TABLE `oc_storehouse_sales_order` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `sales_order_id` varchar(50) DEFAULT '' COMMENT '订单编号',
  `sales_order_remark` varchar(50) DEFAULT '' COMMENT '摘要',
  `sales_order_give_date` date DEFAULT '0000-00-00' COMMENT '交付日期',
  `sales_order_is_audited` int(2) DEFAULT '0' COMMENT '是否审核',
  `sales_order_date` date DEFAULT '0000-00-00' COMMENT '单据发生日期',
  `customer_id` varchar(50) DEFAULT '' COMMENT '客户/供应商/部门 编号',
  `customer_name` varchar(50) DEFAULT '' COMMENT '客户/供应商/部门 名称',
  `username` varchar(50) DEFAULT '' COMMENT '操作人（英文）',
  `nickname` varchar(50) DEFAULT '' COMMENT '操作人（中文）',
  `clerk_name` varchar(50) DEFAULT '' COMMENT '业务员',
  `goods_id` varchar(11) DEFAULT '' COMMENT '商品编码',
  `goods_name` varchar(50) DEFAULT '' COMMENT '商品名称',
  `goods_spec` varchar(50) DEFAULT '' COMMENT '商品规格',
  `goods_min_unit` varchar(10) DEFAULT '' COMMENT '商品最小单位',
  `goods_rates` varchar(100) DEFAULT '' COMMENT '换算率集合',
  `goods_actual_unit` varchar(10) DEFAULT '' COMMENT '商品实际单位',
  `goods_weight` decimal(10,2) DEFAULT '0.00' COMMENT '商品重量',
  `goods_stock_balance` decimal(10,2) DEFAULT '0.00' COMMENT '商品帐存量',
  `goods_actual_stock_balance` decimal(10,2) DEFAULT '0.00' COMMENT '商品实际数量',
  `goods_cost_price` decimal(10,2) DEFAULT '0.00' COMMENT '商品单价',
  `goods_order_quantity` decimal(10,2) DEFAULT '0.00' COMMENT '商品订购数量',
  `goods_is_free` int(2) DEFAULT '0' COMMENT '商品是否为赠品 0-否 1-是',
  `goods_sales_unit_price` decimal(10,2) DEFAULT '0.00' COMMENT '商品调出单价',
  `goods_sales_total_quantity` decimal(10,2) DEFAULT '0.00' COMMENT '商品调出数量',
  `goods_sales_total_price` decimal(10,2) DEFAULT '0.00' COMMENT '商品调出金额',
  `goods_return_unit_price` decimal(10,2) DEFAULT '0.00' COMMENT '商品退货单价',
  `goods_return_total_quantity` decimal(10,2) DEFAULT '0.00' COMMENT '商品退货数量',
  `goods_return_total_price` decimal(10,2) DEFAULT '0.00' COMMENT '商品退货金额',
  `goods_remark` varchar(20) DEFAULT '' COMMENT '商品备注',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '单据生成时间',
  `update_time` timestamp NULL DEFAULT '0000-00-00 00:00:00',
  `status` tinyint(3) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

INSERT INTO `oc_storehouse_sales_order` VALUES ('3', 'XSDD0000001', 'dfgsfsdf', '2017-10-01', '1', '2017-09-30', 'KH0001', 'XXX市政局', 'admin', '超级管理员', '', 'CP0001', '井盖', 'JQ-300*300', 'kg', '500/箱,1000/吨', '箱', '2000.00', '0.00', '0.00', '0.00', '0.00', '0', '5.50', '4.00', '22.00', '0.00', '0.00', '0.00', 'sdfsfdsdf', '2017-09-17 16:57:01', '0000-00-00 00:00:00', '1');



DROP TABLE IF EXISTS `oc_storehouse_start_stock_balance`;
CREATE TABLE `oc_storehouse_start_stock_balance` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `close_date` varchar(15) DEFAULT '' COMMENT '结账日期',
  `goods_type_name` varchar(50) DEFAULT '' COMMENT '商品类型',
  `goods_id` varchar(50) DEFAULT '' COMMENT '商品编号',
  `goods_name` varchar(50) DEFAULT '' COMMENT '商品名称',
  `goods_spec` varchar(50) DEFAULT '' COMMENT '商品规格',
  `goods_min_unit` varchar(10) DEFAULT '' COMMENT '商品最小计量单位',
  `goods_rates` varchar(100) DEFAULT '' COMMENT '换算率集合',
  `goods_stock_balance` decimal(10,2) DEFAULT '0.00' COMMENT '商品库存量',
  `goods_cost_price` decimal(10,2) DEFAULT '0.00' COMMENT '商品成本价',
  `goods_market_price` decimal(10,2) DEFAULT '0.00' COMMENT '商品销售价',
  `storehouse_name` varchar(50) DEFAULT '' COMMENT '商品所在仓库',
  `username` varchar(20) DEFAULT '' COMMENT '操作人（英文）',
  `nickname` varchar(20) DEFAULT '' COMMENT '操作人（中文）',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `status` tinyint(3) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=30 DEFAULT CHARSET=utf8;

INSERT INTO `oc_storehouse_start_stock_balance` VALUES ('26', '2017-10', '产品', 'CP0001', '井盖', 'JQ-300*300', 'kg', '500/箱,1000/吨', '2627.39', '5.00', '10.00', '产品仓', '', '', '2017-09-14 17:26:08', '0000-00-00 00:00:00', '1');
INSERT INTO `oc_storehouse_start_stock_balance` VALUES ('28', '2017-10', '原材料', 'YCL00002', '生铁', '500*500 L125', 'kg', '300/件,500/箱,3000/吨', '51000.00', '100.00', '500.00', '原料仓', 'admin', '超级管理员', '2017-10-09 10:04:43', '0000-00-00 00:00:00', '1');
INSERT INTO `oc_storehouse_start_stock_balance` VALUES ('19', '2017-09', '原材料', 'YCL00002', '生铁', '500*500 L125', 'kg', '300/件,500/箱,3000/吨', '51000.00', '100.00', '500.00', '原料仓', 'admin', '超级管理员', '2017-10-09 10:01:33', '0000-00-00 00:00:00', '1');
INSERT INTO `oc_storehouse_start_stock_balance` VALUES ('27', '2017-10', '原材料', 'YCL0001', '铸铁', '500*500 B125', 'kg', '300/件,500/箱,3000/吨', '33697.00', '3.00', '0.00', '原料仓', '', '', '2017-10-09 10:04:43', '0000-00-00 00:00:00', '1');
INSERT INTO `oc_storehouse_start_stock_balance` VALUES ('18', '2017-09', '原材料', 'YCL0001', '铸铁', '500*500 B125', 'kg', '300/件,500/箱,3000/吨', '33697.00', '3.00', '0.00', '原料仓', '', '', '2017-10-09 10:01:33', '0000-00-00 00:00:00', '1');
INSERT INTO `oc_storehouse_start_stock_balance` VALUES ('17', '2017-09', '产品', 'CP0001', '井盖', 'JQ-300*300', 'kg', '500/箱,1000/吨', '2627.39', '5.00', '10.00', '产品仓', '', '', '2017-09-14 17:26:08', '0000-00-00 00:00:00', '1');
INSERT INTO `oc_storehouse_start_stock_balance` VALUES ('29', '0000-00', '产品', 'CP0002', '一号井盖', 'JQ-300*300', 'kg', '500/箱,1000/吨', '2692.61', '5.00', '10.00', '产品仓', '', '', '2017-10-10 08:59:58', '0000-00-00 00:00:00', '1');


DROP VIEW  IF EXISTS `oc_storehouse_entry_order_view`;
CREATE  VIEW `oc_storehouse_entry_order_view` AS (SELECT `oc_storehouse_entry_order`.`entry_order_date` AS `entry_order_date`,`oc_storehouse_entry_order`.`entry_order_id` AS `entry_order_id`,`oc_storehouse_entry_order`.`customer_id` AS `customer_id`,`oc_storehouse_entry_order`.`customer_name` AS `customer_name`,`oc_storehouse_entry_order`.`entry_order_price` AS `entry_order_price`,`oc_storehouse_entry_order`.`entry_order_account_payable` AS `entry_order_account_payable`,`oc_storehouse_entry_order`.`entry_order_actual_payment` AS `already_clear_price`,(`oc_storehouse_entry_order`.`entry_order_account_payable` - `oc_storehouse_entry_order`.`entry_order_actual_payment`) AS `no_clear_price`,`oc_storehouse_entry_order`.`entry_order_remark` AS `order_remark` FROM `oc_storehouse_entry_order` WHERE ((`oc_storehouse_entry_order`.`entry_order_is_audited` = '1') AND (`oc_storehouse_entry_order`.`status` = '1') AND (`oc_storehouse_entry_order`.`entry_order_type_name` LIKE '%采购%')) GROUP BY `oc_storehouse_entry_order`.`entry_order_id` ORDER BY `oc_storehouse_entry_order`.`entry_order_date` DESC) ;



DROP VIEW  IF EXISTS `oc_storehouse_out_order_view`;
CREATE VIEW `oc_storehouse_out_order_view` AS (SELECT `oc_storehouse_out_order`.`out_order_date` AS `out_order_date`,`oc_storehouse_out_order`.`out_order_id` AS `out_order_id`,`oc_storehouse_out_order`.`customer_id` AS `customer_id`,`oc_storehouse_out_order`.`customer_name` AS `customer_name`,`oc_storehouse_out_order`.`out_order_price` AS `out_order_price`,`oc_storehouse_out_order`.`out_order_account_receivable` AS `out_order_account_receivable`,`oc_storehouse_out_order`.`out_order_actual_payment` AS `already_clear_price`,(`oc_storehouse_out_order`.`out_order_account_receivable` - `oc_storehouse_out_order`.`out_order_actual_payment`) AS `no_clear_price`,`oc_storehouse_out_order`.`out_order_remark` AS `order_remark` FROM `oc_storehouse_out_order` WHERE ((`oc_storehouse_out_order`.`out_order_is_audited` = '1') AND (`oc_storehouse_out_order`.`status` = '1') AND (`oc_storehouse_out_order`.`out_order_type_name` LIKE '%销售%')) GROUP BY `oc_storehouse_out_order`.`out_order_id` ORDER BY `oc_storehouse_out_order`.`out_order_date` DESC) ;

