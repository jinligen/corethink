<?php
// +----------------------------------------------------------------------
// | OneThink [ WE CAN DO IT JUST THINK IT ]
// +----------------------------------------------------------------------
// | Copyright (c) 2013 http://www.onethink.cn All rights reserved.
// +----------------------------------------------------------------------
// | Author: 麦当苗儿 <zuojiazi@vip.qq.com> <http://www.zjzit.cn>
// +----------------------------------------------------------------------

namespace Admin\Controller;

use Think\Db;
use OT\Database;
use Common\Util\Sql;
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

//
//        $dataList = [];
//        for($i=0;$i<60000;$i++){
//            $dataList[] =array('test'=>'sdfdsf'.$i);
//        }
//
//        $id =  D('test')->addAll($dataList);
//


        if(file_exists($file_path)){
            $fp = fopen($file_path,"r");
            $str = fread($fp,filesize($file_path));//指定读取大小，这里把整个文件内容读取出来
            $list = ($str);
        }else{
            $Db = Db::getInstance();
            $list = $Db->query('SHOW TABLE STATUS');
            $list = array_map('array_change_key_case', $list);
            foreach ($list as $key=> $value){
                $list[$key]['backup_time'] = $list[$key]['create_time'];
            }
            $json_string = json_encode($list);
            file_put_contents($file_path, $json_string);

            $list = json_encode($list);
        }

        $this->assign('_list', $list);
//echo var_dump($list);exit;
        $this->display();
    }

    /**
     * 备份数据库
     */
    public function export()
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
            $this->echoRetrun($file_path);
            $sql_object = new Sql();
            $this->echoRetrun($file_path);
            foreach ($tables as $value){

                $table = $value;
                $file_path = $path . "{$table}.sql";
                if (file_exists($file_path)) {
                    $this->echoRetrun($file_path);
                    $sql_status = $sql_object->execute_sql_from_file($file_path);
                    $this->echoRetrun($sql_status);
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
}
