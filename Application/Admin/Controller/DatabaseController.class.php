<?php
// +----------------------------------------------------------------------
// | OneThink [ WE CAN DO IT JUST THINK IT ]
// +----------------------------------------------------------------------
// | Copyright (c) 2013 http://www.onethink.cn All rights reserved.
// +----------------------------------------------------------------------
// | Author: 麦当苗儿 <zuojiazi@vip.qq.com> <http://www.zjzit.cn>
// +----------------------------------------------------------------------

namespace Admin\Controller;

use Common\Util\Think\Page;
use Think\Controller;
use Common\Util\Think\Str;
use Think\Db;
use Think\Storage;
/**
 * 数据库备份还原控制器
 * @author 麦当苗儿 <zuojiazi@vip.qq.com>
 */
class DatabaseController extends AdminController
{

    /**
     * 数据库备份/还原列表
     * @param  String $type import-还原，export-备份
     * @author 麦当苗儿 <zuojiazi@vip.qq.com>
     */
    public function index()
    {

        $file_path = $_SERVER['DOCUMENT_ROOT'] . substr($_SERVER['PHP_SELF'], 0, strrpos($_SERVER['PHP_SELF'], '/') + 1) . 'BackUp/sd/sd.text';
        $file_path = str_replace('/', '\\\\', $file_path);
        $date_path = $_SERVER['DOCUMENT_ROOT'] . substr($_SERVER['PHP_SELF'], 0, strrpos($_SERVER['PHP_SELF'], '/') + 1) . 'BackUp/sd/date.text';
        $date_path = str_replace('/', '\\\\', $date_path);

//
//        $dataList = [];
//        for($i=0;$i<60000;$i++){
//            $dataList[] =array('test'=>'sdfdsf'.$i);
//        }
//
//        $id =  D('test')->addAll($dataList);
//


        if(file_exists($file_path)){
            $json_string = file_get_contents($file_path);
            $list = $json_string;
            $date = file_get_contents($date_path);
        }else{
            $Db = Db::getInstance();
            $list = $Db->query('SHOW TABLE STATUS');
            $list = array_map('array_change_key_case', $list);
            foreach ($list as $key=> $value){
                $list[$key]['backup_time'] = $list[$key]['create_time'];
            }
            $json_string = json_encode($list);
            file_put_contents($file_path, $json_string);
            $date =json_encode(date('Y-m-d', NOW_TIME)) ;
            $list = json_encode($list);
        }

        $this->assign('_date', $date);
        $this->assign('_list', $list);
//echo var_dump($list);exit;
        $this->display();
//        $this->redirect('/index.php?s=/Import/step2.html', array('cate_id' => 2), 5, '页面跳转中...');
    }

    /**
     * 备份数据库
     */
    public function export()
    {
        $path = MODULE_PATH . 'Data/' . date('Y-m-d', NOW_TIME) . '/';
        $path = str_replace('/', '\\\\', $path);
        if (!file_exists($path)) {
            mkdir($path);
        }else{
            $this->deldir($path);
        }

        if (IS_POST) { //初始化

            echo json_encode('{error:"0000",msg:"备份可以开始了！"}');
            exit;


        } elseif (IS_GET) { //备份数据
            $this->echoRetrun("备份开始！");


            $ret = $this->backup($path.'install.sql');

            $this->echoRetrun("备份结束！");
        }

    }

    /**
     * 备份数据库
     */
    public function export1()
    {
        $path = $_SERVER['DOCUMENT_ROOT'] . substr($_SERVER['PHP_SELF'], 0, strrpos($_SERVER['PHP_SELF'], '/') + 1) . 'BackUp/sd/' . date('Y-m-d', NOW_TIME) . '/';
        $path = str_replace('/', '\\\\', $path);
        if (!file_exists($path)) {
            mkdir($path);
        }else{
            $this->deldir($path);
        }
        //读取备份配置
        $config = array(
            'path' => $path,
            'part' => '',
            'compress' => C('DATA_BACKUP_COMPRESS'),
            'level' => C('DATA_BACKUP_COMPRESS_LEVEL'),
        );

        if (IS_POST) { //初始化

            //检查是否有正在执行的任务
            $lock = "{$config['path']}backup.lock";
            if (is_file($lock)) {
                echo json_encode('{error:"0001",msg:"备份任务已存在，请稍后！"}');
                exit;
            } else {
                //创建锁文件
                file_put_contents($lock, NOW_TIME);
                echo json_encode('{error:"0000",msg:"备份可以开始了！"}');
                exit;
            }


        } elseif (IS_GET) { //备份数据
            $this->echoRetrun("备份开始！");



            $Db = Db::getInstance();
            $list = $Db->query('SHOW TABLE STATUS');
            $list = array_map('array_change_key_case', $list);
            $count = 0;

            $file_path = $_SERVER['DOCUMENT_ROOT'] . substr($_SERVER['PHP_SELF'], 0, strrpos($_SERVER['PHP_SELF'], '/') + 1) . 'BackUp/sd/sd.text';
            $file_path = str_replace('/', '\\\\', $file_path);
            $date_path = $_SERVER['DOCUMENT_ROOT'] . substr($_SERVER['PHP_SELF'], 0, strrpos($_SERVER['PHP_SELF'], '/') + 1) . 'BackUp/sd/date.text';
            $date_path = str_replace('/', '\\\\', $date_path);


            if(file_exists($file_path)){    //如果存在  就读取文件内容

                $json_string = file_get_contents($file_path);
                $data = json_decode($json_string, true);
            }else{
                $data = $list;
                foreach ($data as $key=> $value){
                    $data[$key]['backup_time'] = $data[$key]['create_time'];
                }
                $json_string = json_encode($data);
                file_put_contents($file_path, $json_string);

            }

            foreach ($list as $key=>$item) {

                $file = array(
                    'name' => $item['name'],
                    'part' => 1,
                );

                $Database = new Database($file, $config);

                $backup = $Database->backup($item['name']);

                if ($backup) {
                    $this->echoRetrun($item['name'] . "备份完成！");
                    $data[$count]['backup_time'] = date('Y-m-d H:i:s', NOW_TIME);

                } else {
                    $this->echoRetrun($item['name'] . "备份失败！");
                }
                $count++;
            }


            unlink(session('backup_config.path') . 'backup.lock');
            session('backup_tables', null);
            session('backup_file', null);
            session('backup_config', null);

            $this->deldir($file_path);
            $json_string = json_encode($data);
            file_put_contents($file_path, $json_string);
            file_put_contents($date_path, json_encode(date('Y-m-d', NOW_TIME)));

            $this->echoRetrun("备份结束！");
        }

    }



    /**
     * 还原数据库
     * @author 麦当苗儿 <zuojiazi@vip.qq.com>
     */
    public function import()
    {


        if (IS_POST) {
            echo json_encode('{error:"0000",msg:"备份可以开始了！"}');
            exit;
        } else {
            $this->echoRetrun( "还原开始！");
            $prama = urldecode($_GET['prama']) ;
            $prama = json_decode($prama,true);

            $tables = $prama['tables'];
            $date = $prama['date'];


            $path       = $_SERVER['DOCUMENT_ROOT'] . substr($_SERVER['PHP_SELF'], 0, strrpos($_SERVER['PHP_SELF'], '/') + 1) . 'BackUp/sd/' . $date . '/';

            $sql_object = new Sql();

            foreach ($tables as $value){

                $table = $value;
                $file_path = $path . "{$table}.sql";
                if (file_exists($file_path)) {
                    
                    $sql_status = $sql_object->execute_sql_from_file($file_path);
                    
                    if ($sql_status) {
                        $this->echoRetrun($table . '还原成功！');
                    } else {
                        $this->echoRetrun($table . '还原失败！');
                    }

                } else {
                    $this->echoRetrun($table . "文件不存在！");
                }
            }
            $this->echoRetrun( "还原结束！");
        }

    }

    /**
     *
     */
    public function echoRetrun($msg)
    {
        echo "<script type='text/javascript'> 
                window.parent.processReturn('$msg');
               </script>";
    }

    /**
     *删除文件夹下的内容
     */
    public function deldir($dir)
    {
        //删除目录下的文件：
        $dh = opendir($dir);

        while ($file = readdir($dh)) {
            if ($file != "." && $file != "..") {
                $fullpath = $dir . "/" . $file;

                if (!is_dir($fullpath)) {
                    unlink($fullpath);
                } else {
                    deldir($fullpath);
                }
            }
        }

        closedir($dh);
    }


    /**
     * 备份表结构
     * @param  string $table 表名
     * @param  integer $start 起始行数
     * @return boolean        false - 备份失败
     */
    public function backup($path)
    {
        //创建DB对象
        $db = Db::getInstance();
        $list = $db->query('SHOW TABLE STATUS');
        $list = array_map('array_change_key_case', $list);
        $sql = "\n";
        $flag = '1';
        foreach ($list as $key=>$item) {

            $table = $item['name'];

            if(stripos($table,"_view")||stripos($table,"_trigger")){
                continue;
            }
            //备份表结构
            $result = $db->query("SHOW CREATE TABLE `{$table}`");

            $sql0  = "\n";
            $sql0 .= "DROP TABLE IF EXISTS `{$table}`;\n";
            $create = trim($result[0]['Create Table']) ;
            $sql0 .= $create. ";\n\n";

            if(!$sql0){
                $this->echoRetrun('<span style="color: red">备份'. $table.'失败！</span>');
                $flag = '0';
            }

            //备份数据记录
            $result = $db->query("SELECT * FROM `{$table}` ");
            $sql1 = '';
            foreach ($result as $row) {
                $arr = [];
                foreach ($row as $value) {
                    array_push($arr, $value);
                }

                $sql1 .= "INSERT INTO `{$table}` VALUES ('" . implode("', '", $arr) . "');\n";

            }
            file_put_contents($path, $sql0 . $sql1."\n\n",FILE_APPEND );
            $this->echoRetrun('<span >备份'. $table.'完成！</span>');

        }

        $view = "DROP VIEW  IF EXISTS `oc_storehouse_entry_order_view`;
CREATE  VIEW `oc_storehouse_entry_order_view` AS (SELECT `oc_storehouse_entry_order`.`entry_order_date` AS `entry_order_date`,`oc_storehouse_entry_order`.`entry_order_id` AS `entry_order_id`,`oc_storehouse_entry_order`.`customer_id` AS `customer_id`,`oc_storehouse_entry_order`.`customer_name` AS `customer_name`,`oc_storehouse_entry_order`.`entry_order_price` AS `entry_order_price`,`oc_storehouse_entry_order`.`entry_order_account_payable` AS `entry_order_account_payable`,`oc_storehouse_entry_order`.`entry_order_actual_payment` AS `already_clear_price`,(`oc_storehouse_entry_order`.`entry_order_account_payable` - `oc_storehouse_entry_order`.`entry_order_actual_payment`) AS `no_clear_price`,`oc_storehouse_entry_order`.`entry_order_remark` AS `order_remark` FROM `oc_storehouse_entry_order` WHERE ((`oc_storehouse_entry_order`.`entry_order_is_audited` = '1') AND (`oc_storehouse_entry_order`.`status` = '1') AND (`oc_storehouse_entry_order`.`entry_order_type_name` LIKE '%采购%')) GROUP BY `oc_storehouse_entry_order`.`entry_order_id` ORDER BY `oc_storehouse_entry_order`.`entry_order_date` DESC) ;"."\n"."\n";

        file_put_contents($path, $view."\n\n",FILE_APPEND );
        $this->echoRetrun("备份oc_storehouse_entry_order_view完成！");

        $view = "DROP VIEW  IF EXISTS `oc_storehouse_out_order_view`;
CREATE VIEW `oc_storehouse_out_order_view` AS (SELECT `oc_storehouse_out_order`.`out_order_date` AS `out_order_date`,`oc_storehouse_out_order`.`out_order_id` AS `out_order_id`,`oc_storehouse_out_order`.`customer_id` AS `customer_id`,`oc_storehouse_out_order`.`customer_name` AS `customer_name`,`oc_storehouse_out_order`.`out_order_price` AS `out_order_price`,`oc_storehouse_out_order`.`out_order_account_receivable` AS `out_order_account_receivable`,`oc_storehouse_out_order`.`out_order_actual_payment` AS `already_clear_price`,(`oc_storehouse_out_order`.`out_order_account_receivable` - `oc_storehouse_out_order`.`out_order_actual_payment`) AS `no_clear_price`,`oc_storehouse_out_order`.`out_order_remark` AS `order_remark` FROM `oc_storehouse_out_order` WHERE ((`oc_storehouse_out_order`.`out_order_is_audited` = '1') AND (`oc_storehouse_out_order`.`status` = '1') AND (`oc_storehouse_out_order`.`out_order_type_name` LIKE '%销售%')) GROUP BY `oc_storehouse_out_order`.`out_order_id` ORDER BY `oc_storehouse_out_order`.`out_order_date` DESC) ;";

        file_put_contents($path, $view."\n\n",FILE_APPEND );
        $this->echoRetrun("备份oc_storehouse_out_order_view完成！");


       $trigger =  "
DROP TRIGGER IF EXISTS oc_storehouse_goods_check_trigger;
DELIMITER $$
CREATE TRIGGER `opencmf_corethink`.`oc_storehouse_goods_check_trigger` BEFORE UPDATE ON `oc_storehouse_goods_check`
    FOR EACH ROW BEGIN
    IF old.goods_check_is_audited = '0' AND new.goods_check_is_audited = '1' THEN
         UPDATE oc_storehouse_goods SET goods_stock_balance = new.goods_check_balance WHERE goods_id =  new.goods_id;
    END IF;
    END$$
DELIMITER ;"."\n"."\n";
        file_put_contents($path, $trigger."\n\n",FILE_APPEND );
        $this->echoRetrun("备份oc_storehouse_goods_check_trigger完成！");
        $trigger = "
DROP TRIGGER IF EXISTS oc_storehouse_out_order_trigger;
DELIMITER $$
CREATE TRIGGER `oc_storehouse_out_order_trigger` BEFORE UPDATE ON `oc_storehouse_out_order`
    FOR EACH ROW BEGIN
    IF old.out_order_is_audited = '0' AND new.out_order_is_audited = '1' THEN
         UPDATE oc_storehouse_goods SET goods_stock_balance = goods_stock_balance - new.goods_weight WHERE goods_id =  new.goods_id;
    END IF;
    END$$
DELIMITER ;";

        file_put_contents($path, $trigger."\n\n",FILE_APPEND );
        $this->echoRetrun("备份oc_storehouse_goods_check_trigger完成！");

        if($flag=='1'){
            $this->echoRetrun("备份结束！");
            $date_path = $_SERVER['DOCUMENT_ROOT'] . substr($_SERVER['PHP_SELF'], 0, strrpos($_SERVER['PHP_SELF'], '/') + 1) . 'BackUp/sd/date.text';
            $date_path = str_replace('/', '\\\\', $date_path);

            file_put_contents($date_path, json_encode(date('Y-m-d', NOW_TIME)));
        }else{
            $this->echoRetrun("备份失败！");
        }

        return $flag;
    }

}
