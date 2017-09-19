
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
INSERT INTO `oc_admin_config` VALUES ('19', '系统加密KEY', 'AUTH_KEY', 'Z!+K:n]=dn|E&p;=WrQ[#hfZ-FCCpMd~x</oeEceP@I$pE=^jz"d%#Zf$*bh*B+g', '3', 'textarea', '', '轻易不要修改此项，否则容易造成用户无法登录；如要修改，务必备份原key', '1438647773', '1438647815', '3', '1');
INSERT INTO `oc_admin_config` VALUES ('20', 'URL模式', 'URL_MODEL', '3', '4', 'select', '0:普通模式1:PATHINFO模式2:REWRITE模式3:兼容模式', '', '1438423248', '1438423248', '1', '1');
INSERT INTO `oc_admin_config` VALUES ('21', '静态文件独立域名', 'STATIC_DOMAIN', '', '4', 'text', '', '静态文件独立域名一般用于在用户无感知的情况下平和的将网站图片自动存储到腾讯万象优图、又拍云等第三方服务。', '1438564784', '1438564784', '2', '1');
INSERT INTO `oc_admin_config` VALUES ('22', '开启子域名配置', 'APP_SUB_DOMAIN_DEPLOY', '0', '4', 'radio', '1:是0:否', '是否开启子域名配置', '1467549933', '1467549933', '3', '1');
INSERT INTO `oc_admin_config` VALUES ('23', '子域名规则', 'APP_SUB_DOMAIN_RULES', '', '4', 'array', '', '子域名规则', '1467549993', '1467549993', '4', '1');
INSERT INTO `oc_admin_config` VALUES ('24', '域名后缀', 'APP_DOMAIN_SUFFIX', '', '4', 'text', '', 'com.cn 、net.cn之类的需要配置此项', '1467550066', '1467550066', '5', '1');
INSERT INTO `oc_admin_config` VALUES ('25', '强制Wap主题', 'WAP_MODE', '0', '4', 'radio', '1:是0:否', '是否在电脑端强制显示Wap主题', '1467121607', '1467121607', '6', '1');
INSERT INTO `oc_admin_config` VALUES ('26', '官网账号', 'AUTH_USERNAME', 'trial', '5', 'text', '', '官网登陆账号（用户名）', '1438647815', '1438647815', '1', '1');
INSERT INTO `oc_admin_config` VALUES ('27', '官网密码', 'AUTH_PASSWORD', 'trial', '5', 'text', '', '官网密码', '1438647815', '1438647815', '2', '1');
INSERT INTO `oc_admin_config` VALUES ('28', '密钥', 'AUTH_SN', '', '5', 'textarea', '', '密钥请通过登陆官网至个人中心获取', '1438647815', '1438647815', '3', '1');
