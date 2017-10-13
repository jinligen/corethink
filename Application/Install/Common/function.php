<?php
// +----------------------------------------------------------------------
// | OpenCMF [ Simple Efficient Excellent ]
// +----------------------------------------------------------------------
// | Copyright (c) 2014 http://www.lingyun.net All rights reserved.
// +----------------------------------------------------------------------
// | Author: jry <598821125@qq.com>
// +----------------------------------------------------------------------

/**
 * 系统环境检测
 * @return array 系统环境数据
 * @author jry <598821125@qq.com>
 */
function check_env()
{
    $items = array(
        'os'     => array(
            'title'   => '操作系统',
            'limit'   => '不限制',
            'current' => PHP_OS,
            'icon'    => 'fa-check text-success',
        ),
        'php'    => array(
            'title'   => 'PHP版本',
            'limit'   => '5.3+',
            'current' => PHP_VERSION,
            'icon'    => 'fa-check text-success',
        ),
        'upload' => array(
            'title'   => '附件上传',
            'limit'   => '不限制',
            'current' => ini_get('file_uploads') ? ini_get('upload_max_filesize') : '未知',
            'icon'    => 'fa-check text-success',
        ),
        'gd'     => array(
            'title'   => 'GD库',
            'limit'   => '2.0+',
            'current' => '未知',
            'icon'    => 'fa-check text-success',
        ),
        'disk'   => array(
            'title'   => '磁盘空间',
            'limit'   => '100M+',
            'current' => '未知',
            'icon'    => 'fa-check text-success',
        ),
    );

    //PHP环境检测
    if ($items['php']['current'] < 5.3) {
        $items['php']['icon'] = 'fa-remove text-danger';
        session('error', true);
    }

    //GD库检测
    $tmp = function_exists('gd_info') ? gd_info() : array();
    if (!$tmp['GD Version']) {
        $items['gd']['current'] = '未安装';
        $items['gd']['icon']    = 'fa-remove text-danger';
        session('error', true);
    } else {
        $items['gd']['current'] = $tmp['GD Version'];
    }
    unset($tmp);

    //磁盘空间检测
    if (function_exists('disk_free_space')) {
        $disk_size                = floor(disk_free_space('./') / (1024 * 1024)) . 'M';
        $items['disk']['current'] = $disk_size . 'MB';
        if ($disk_size < 100) {
            $items['disk']['icon'] = 'fa-remove text-danger';
            session('error', true);
        }
    }

    return $items;
}

/**
 * 目录，文件读写检测
 * @return array 检测数据
 * @author jry <598821125@qq.com>
 */
function check_dirfile()
{
    $items = array(
        '0' => array(
            'type'  => 'dir',
            'path'  => RUNTIME_PATH,
            'title' => '可写',
            'icon'  => 'fa-check text-success',
        ),
        '1' => array(
            'type'  => 'dir',
            'path'  => './Uploads',
            'title' => '可写',
            'icon'  => 'fa-check text-success',
        ),
        '2' => array(
            'type'  => 'dir',
            'path'  => './Data',
            'title' => '可写',
            'icon'  => 'fa-check text-success',
        ),
    );

    foreach ($items as &$val) {
        $path = $val['path'];
        if ('dir' === $val['type']) {
            if (!is_writable($path)) {
                if (is_dir($path)) {
                    $val['title'] = '不可写';
                    $val['icon']  = 'fa-remove text-danger';
                    session('error', true);
                } else {
                    $val['title'] = '不存在';
                    $val['icon']  = 'fa-remove text-danger';
                    session('error', true);
                }
            }
        } else {
            if (file_exists($path)) {
                if (!is_writable($path)) {
                    $val['title'] = '不可写';
                    $val['icon']  = 'fa-remove text-danger';
                    session('error', true);
                }
            } else {
                if (!is_writable(dirname($path))) {
                    $val['title'] = '不存在';
                    $val['icon']  = 'fa-remove text-danger';
                    session('error', true);
                }
            }
        }
    }
    return $items;
}

/**
 * 函数检测
 * @return array 检测数据
 */
function check_func_and_ext()
{
    $items = array(
        '0' => array(
            'type'    => 'ext',
            'name'    => 'pdo',
            'title'   => '支持',
            'current' => extension_loaded('pdo'),
            'icon'    => 'fa-check text-success',
        ),
        '1' => array(
            'type'    => 'ext',
            'name'    => 'pdo_mysql',
            'title'   => '支持',
            'current' => extension_loaded('pdo_mysql'),
            'icon'    => 'fa-check text-success',
        ),
        '2' => array(
            'type'  => 'func',
            'name'  => 'file_get_contents',
            'title' => '支持',
            'icon'  => 'fa-check text-success',
        ),
        '3' => array(
            'type'  => 'func',
            'name'  => 'mb_strlen',
            'title' => '支持',
            'icon'  => 'fa-check text-success',
        ),
    );
    foreach ($items as &$val) {
        switch ($val['type']) {
            case 'ext':
                if (!$val['current']) {
                    $val['title'] = '不支持';
                    $val['icon']  = 'fa-remove text-danger';
                    session('error', true);
                }
                break;
            case 'func':
                if (!function_exists($val['name'])) {
                    $val['title'] = '不支持';
                    $val['icon']  = 'fa-remove text-danger';
                    session('error', true);
                }
                break;
        }
    }

    return $items;
}

/**
 * 创建数据表
 * @param  resource $db 数据库连接资源
 */
function create_tables($db, $prefix = '')
{
    //读取SQL文件
    $sql = file_get_contents( './install.sql');
    $sql = str_replace("\r", "\n", $sql);
    $sql = explode(";\n", $sql);

    //替换表前缀
    $orginal = C('ORIGINAL_TABLE_PREFIX');
    $sql     = str_replace(" `{$orginal}", " `{$prefix}", $sql);

    $trigger1= "CREATE TRIGGER oc_storehouse_goods_check_trigger BEFORE UPDATE ON `oc_storehouse_goods_check` FOR EACH ROW 
IF old.goods_check_is_audited = '0' AND new.goods_check_is_audited = '1' THEN
         UPDATE oc_storehouse_goods SET goods_stock_balance = new.goods_check_balance WHERE goods_id =  new.goods_id;
END IF";

    $trigger2= "CREATE TRIGGER oc_storehouse_entry_order_trigger BEFORE UPDATE ON `oc_storehouse_entry_order` FOR EACH ROW 
IF old.entry_order_is_audited = '0' AND new.entry_order_is_audited = '1' THEN
         UPDATE oc_storehouse_goods SET goods_stock_balance = goods_stock_balance + new.goods_weight WHERE goods_id =  new.goods_id;
    END IF";

    $trigger3= "CREATE TRIGGER oc_storehouse_out_order_trigger BEFORE UPDATE ON `oc_storehouse_out_order` FOR EACH ROW 
IF old.out_order_is_audited = '0' AND new.out_order_is_audited = '1' THEN
         UPDATE oc_storehouse_goods SET goods_stock_balance = goods_stock_balance - new.goods_weight WHERE goods_id =  new.goods_id;
         IF new.goods_weight <> new.goods_weight_standard THEN
		INSERT INTO opencmf_corethink.oc_storehouse_entry_order ( 
		  entry_order_type_name,
		  entry_order_id, 
		  entry_order_remark, 
		  entry_order_is_audited,
		  entry_order_date,  
		  storehouse_name, 
		  username,
		  nickname,  
		  audited_date, 
		  goods_id,
		  goods_name,
		  goods_spec,
		  goods_min_unit,
		  goods_rates,
		  goods_actual_unit,
		  goods_weight, 
		  goods_remark  
		) 
		VALUES
		  (
		     '产品入库单(补差)',
		  CONCAT('CPRKD-',new.out_order_id), 
		  new.out_order_remark, 
		  '1',   
		  new.out_order_date, 
		  new.storehouse_name, 
		  new.username,
		  new.nickname,  
		  new.audited_date, 
		  new.goods_id,
		  new.goods_name,
		  new.goods_spec,
		  new.goods_min_unit,
		  new.goods_rates,
		  new.goods_actual_unit,
		  new.goods_weight-new.goods_weight_standard, 
		  new.goods_remark 
		  ) ;
	 END IF;
    END IF";

    $trigger4= "CREATE TRIGGER oc_storehouse_payment_order_trigger BEFORE UPDATE ON `oc_storehouse_payment_order` FOR EACH ROW 
IF old.payment_order_is_audited = '0' AND new.payment_order_is_audited = '1' THEN
         UPDATE oc_storehouse_entry_order SET entry_order_actual_payment = entry_order_actual_payment + new.now_clear_price WHERE entry_order_id =  new.entry_order_id;
    END IF";

    $trigger5= "CREATE TRIGGER oc_storehouse_gathering_order_trigger BEFORE UPDATE ON `oc_storehouse_gathering_order` FOR EACH ROW 
IF old.gathering_order_is_audited = '0' AND new.gathering_order_is_audited = '1' THEN
         UPDATE oc_storehouse_out_order SET out_order_actual_payment = out_order_actual_payment + new.now_clear_price WHERE out_order_id =  new.out_order_id;
    END IF";

    $trigger6= "CREATE TRIGGER `oc_storehouse_close_accounts_trigger` AFTER UPDATE ON `oc_storehouse_close_accounts` 
    FOR EACH ROW    
BEGIN
DELETE  FROM `oc_storehouse_start_stock_balance` WHERE `close_date` = new.close_date;
INSERT INTO `oc_storehouse_start_stock_balance` (
  `close_date`,
  `goods_type_name`,
  `goods_id`,
  `goods_name`,
  `goods_spec`,
  `goods_min_unit`,
  `goods_rates`,
  `goods_stock_balance`,
  `goods_cost_price`,
  `goods_market_price`,
  `storehouse_name`,
  `username`,
  `nickname`
) 
SELECT 
  '9999-99' AS close_date,
  `goods_type_name`,
  `goods_id`,
  `goods_name`,
  `goods_spec`,
  `goods_min_unit`,
  `goods_rates`,
  `goods_stock_balance`,
  `goods_cost_price`,
  `goods_market_price`,
  `storehouse_name`,
  `username`,
  `nickname`
FROM `oc_storehouse_goods` ;
UPDATE  `oc_storehouse_start_stock_balance` SET `close_date` = new.close_date WHERE `close_date` = '9999-99';
END";

    $trigger7= "CREATE TRIGGER `oc_storehouse_goods_add_trigger` AFTER INSERT ON `oc_storehouse_goods` 
    FOR EACH ROW    
BEGIN
DELETE  FROM `opencmf_corethink`.`oc_storehouse_start_stock_balance` WHERE `goods_id` = new.`goods_id`; 
INSERT INTO `opencmf_corethink`.`oc_storehouse_start_stock_balance` (
  `close_date`,
  `goods_type_name`,
  `goods_id`,
  `goods_name`,
  `goods_spec`,
  `goods_min_unit`,
  `goods_rates`,
  `goods_stock_balance`,
  `goods_cost_price`,
  `goods_market_price`,
  `storehouse_name`,
  `username`,
  `nickname`,
  `create_time`,
  `update_time`,
  `status`
) 
VALUES
  (
   '0000-00',
   new.`goods_type_name`,
  new.`goods_id`,
  new.`goods_name`,
  new.`goods_spec`,
  new.`goods_min_unit`,
  new.`goods_rates`,
  new.`goods_stock_balance`,
  new.`goods_cost_price`,
  new.`goods_market_price`,
  new.`storehouse_name`,
  new.`username`,
  new.`nickname`,
  new.`create_time`,
  new.`update_time`,
  new.`status`
  ) ;
END";


    $trigger8= "CREATE TRIGGER `oc_storehouse_goods_update_trigger` AFTER UPDATE ON `oc_storehouse_goods` 
    FOR EACH ROW    
BEGIN 
UPDATE 
  `opencmf_corethink`.`oc_storehouse_start_stock_balance` 
SET
  `goods_type_name` = new.goods_type_name,
  `goods_id` = new.goods_id,
  `goods_name` = new.goods_name,
  `goods_spec` = new.goods_spec,
  `goods_min_unit` = new.goods_min_unit,
  `goods_rates` = new.goods_rates,
  `goods_stock_balance` = new.goods_stock_balance,
  `goods_cost_price` = new.goods_cost_price,
  `goods_market_price` = new.goods_market_price,
  `storehouse_name` = new.storehouse_name,
  `username` = new.username,
  `nickname` = new.nickname,
  `create_time` = new.create_time,
  `update_time` = new.update_time,
  `status` = new.status
WHERE `goods_id` = new.goods_id;
END";

    //开始安装
    show_msg('开始安装数据库...');
    foreach ($sql as $value) {
        $value = trim($value);
        if (empty($value)) {
            continue;
        }

        if (substr($value, 0, 12) == 'CREATE TABLE') {
            $name = preg_replace("/^CREATE TABLE `(\w+)` .*/s", "\\1", $value);
            $msg  = "创建数据表{$name}";
            if (false !== $db->execute($value)) {
                show_msg($msg . '...成功');
            } else {
                show_msg($msg . '...失败！', 'error');
                session('error', true);
            }
        } else {
            $db->execute($value);
        }
    }



    $Model = new \Think\Model();
    $Model->execute("DROP TRIGGER IF EXISTS oc_storehouse_goods_check_trigger");
    $Model->execute("DROP TRIGGER IF EXISTS oc_storehouse_entry_order_trigger");
    $Model->execute("DROP TRIGGER IF EXISTS oc_storehouse_out_order_trigger");
    $Model->execute("DROP TRIGGER IF EXISTS oc_storehouse_payment_order_trigger");
    $Model->execute("DROP TRIGGER IF EXISTS oc_storehouse_gathering_order_trigger");

    $Model->execute("DROP TRIGGER IF EXISTS oc_storehouse_close_accounts_trigger");
    $Model->execute("DROP TRIGGER IF EXISTS oc_storehouse_goods_add_trigger");
    $Model->execute("DROP TRIGGER IF EXISTS oc_storehouse_goods_update_trigger");

    $execute_trigger1 = $Model->execute($trigger1);
    $execute_trigger2 = $Model->execute($trigger2);
    $execute_trigger3 = $Model->execute($trigger3);
    $execute_trigger4 = $Model->execute($trigger4);
    $execute_trigger5 = $Model->execute($trigger5);
    $execute_trigger6 = $Model->execute($trigger6);
    $execute_trigger7 = $Model->execute($trigger7);
    $execute_trigger8 = $Model->execute($trigger8);
    $temp = '';
    if($execute_trigger1!=0){
        $temp .= 'oc_storehouse_goods_check_trigger';
    }
    if($execute_trigger2!=0){
        $temp .= 'oc_storehouse_entry_order_trigger';
    }
    if($execute_trigger3!=0){
        $temp .= 'oc_storehouse_out_order_trigger';
    }
    if($execute_trigger4!=0){
        $temp .= 'oc_storehouse_payment_order_trigger';
    }
    if($execute_trigger5!=0){
        $temp .= 'oc_storehouse_gathering_order_trigger';
    }

    if($execute_trigger6!=0){
        $temp .= 'oc_storehouse_close_accounts_trigger';
    }

    if($execute_trigger7!=0){
        $temp .= 'oc_storehouse_goods_add_trigger';
    }

    if($execute_trigger8!=0){
        $temp .= 'oc_storehouse_goods_update_trigger';
    }

    if($temp==''){
        show_msg( '所有触发器创建成功...');
    }else{
        show_msg( $temp.'...失败！', 'error');
        session('error', true);
    }




}

/**
 * 写入配置文件
 * @param  array $config 配置信息
 */
function write_config($config, $auth)
{
    if (is_array($config)) {
        //读取配置内容
        $conf = file_get_contents(MODULE_PATH . 'Data/config.tpl');
        //替换配置项
        foreach ($config as $name => $value) {
            $conf = str_replace("[{$name}]", $value, $conf);
        }
        $conf = str_replace('[AUTH_KEY]', $auth, $conf);
        //写入应用配置文件

        if (file_put_contents('./Data/db.php', $conf)) {
            show_msg('配置文件写入成功');
        } else {
            show_msg('配置文件写入失败！', 'error');
            session('error', true);
        }
        return true;
    }
}

/**
 * 及时显示提示信息
 * @param  string $msg 提示信息
 */
function show_msg($msg, $class = '')
{
    echo "<script type=\"text/javascript\">showmsg(\"{$msg}\", \"{$class}\")</script>";
    flush();
    ob_flush();
}
