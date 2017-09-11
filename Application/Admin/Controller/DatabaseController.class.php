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
    public function index($type = null)
    {
        switch ($type) {
            /* 数据还原 */
            case 'import':
                //列出备份文件列表
                $path = realpath(C('DATA_BACKUP_PATH'));
                $flag = \FilesystemIterator::KEY_AS_FILENAME;
                $glob = new \FilesystemIterator($path, $flag);

                $list = array();
                foreach ($glob as $name => $file) {
                    if (preg_match('/^\d{8,8}-\d{6,6}-\d+\.sql(?:\.gz)?$/', $name)) {
                        $name = sscanf($name, '%4s%2s%2s-%2s%2s%2s-%d');

                        $date = "{$name[0]}-{$name[1]}-{$name[2]}";
                        $time = "{$name[3]}:{$name[4]}:{$name[5]}";
                        $part = $name[6];

                        if (isset($list["{$date} {$time}"])) {
                            $info = $list["{$date} {$time}"];
                            $info['part'] = max($info['part'], $part);
                            $info['size'] = $info['size'] + $file->getSize();
                        } else {
                            $info['part'] = $part;
                            $info['size'] = $file->getSize();
                        }
                        $extension = strtoupper(pathinfo($file->getFilename(), PATHINFO_EXTENSION));
                        $info['compress'] = ($extension === 'SQL') ? '-' : $extension;
                        $info['time'] = strtotime("{$date} {$time}");

                        $list["{$date} {$time}"] = $info;
                    }
                }
                $title = '数据还原';
                break;

            /* 数据备份 */
            case 'export':
                $Db = Db::getInstance();
                $list = $Db->query('SHOW TABLE STATUS');
                $list = array_map('array_change_key_case', $list);
                $title = '数据备份';
                break;

            default:
                $this->error('参数错误！');
        }

        //渲染模板
        $this->assign('meta_title', $title);
        $this->assign('_list', json_encode($list));

        $this->display($type);
    }

    /**
     * 优化表
     * @param  String $tables 表名
     * @author 麦当苗儿 <zuojiazi@vip.qq.com>
     */
    public function optimize($tables = null)
    {
        if ($tables) {
            $Db = Db::getInstance();
            if (is_array($tables)) {
                $tables = implode('`,`', $tables);
                $list = $Db->query("OPTIMIZE TABLE `{$tables}`");

                if ($list) {
                    $this->success("数据表优化完成！");
                } else {
                    $this->error("数据表优化出错请重试！");
                }
            } else {
                $list = $Db->query("OPTIMIZE TABLE `{$tables}`");
                if ($list) {
                    $this->success("数据表'{$tables}'优化完成！");
                } else {
                    $this->error("数据表'{$tables}'优化出错请重试！");
                }
            }
        } else {
            $this->error("请指定要优化的表！");
        }
    }

    /**
     * 修复表
     * @param  String $tables 表名
     * @author 麦当苗儿 <zuojiazi@vip.qq.com>
     */
    public function repair($tables = null)
    {
        if ($tables) {
            $Db = Db::getInstance();
            if (is_array($tables)) {
                $tables = implode('`,`', $tables);
                $list = $Db->query("REPAIR TABLE `{$tables}`");

                if ($list) {
                    $this->success("数据表修复完成！");
                } else {
                    $this->error("数据表修复出错请重试！");
                }
            } else {
                $list = $Db->query("REPAIR TABLE `{$tables}`");
                if ($list) {
                    $this->success("数据表'{$tables}'修复完成！");
                } else {
                    $this->error("数据表'{$tables}'修复出错请重试！");
                }
            }
        } else {
            $this->error("请指定要修复的表！");
        }
    }

    /**
     * 删除备份文件
     * @param  Integer $time 备份时间
     * @author 麦当苗儿 <zuojiazi@vip.qq.com>
     */
    public function del($time = 0)
    {
        if ($time) {
            $name = date('Ymd-His', $time) . '-*.sql*';
            $path = realpath(C('DATA_BACKUP_PATH')) . DIRECTORY_SEPARATOR . $name;
            array_map("unlink", glob($path));
            if (count(glob($path))) {
                $this->success('备份文件删除失败，请检查权限！');
            } else {
                $this->success('备份文件删除成功！');
            }
        } else {
            $this->error('参数错误！');
        }
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
            $this->echoRetrun($path);
            $Db = Db::getInstance();
            $list = $Db->query('SHOW TABLE STATUS');
            $list = array_map('array_change_key_case', $list);
            $count = 0;

            foreach ($list as $item) {

                $file = array(
                    'name' => $item['name'],
                    'part' => 1,
                );

                $Database = new Database($file, $config);

                $backup = $Database->backup($item['name']);

                if ($backup) {
                    $this->echoRetrun($item['name'] . "备份完成！");
                } else {
                    $this->echoRetrun($item['name'] . "备份失败！");
                }
                $count++;
            }


            unlink(session('backup_config.path') . 'backup.lock');
            session('backup_tables', null);
            session('backup_file', null);
            session('backup_config', null);

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


            $path = $_SERVER['DOCUMENT_ROOT'] . substr($_SERVER['PHP_SELF'], 0, strrpos($_SERVER['PHP_SELF'], '/') + 1) . 'BackUp/sd/' . $date . '/';

            foreach ($tables as $value){
                $this->echoRetrun($value);
                $table = $value;
                $file_path = $path . "{$table}.sql";
                $this->echoRetrun($file_path);
                if (file_exists($file_path)) {

                    $fp = fopen($file_path, "r");
                    $str = fread($fp, filesize($file_path));//指定读取大小，这里把整个文件内容读取出来
                    $str = str_replace("\r\n", "<br />", $str);

                    $db = Db::getInstance();
                    $this->echoRetrun(44);

                    $ret = $db->query($str);
                    $this->echoRetrun(333);

                    if ($ret) {
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
