<?php
// +----------------------------------------------------------------------
// | OpenCMF [ Simple Efficient Excellent ]
// +----------------------------------------------------------------------
// | Copyright (c) 2014 http://www.lingyun.net All rights reserved.
// +----------------------------------------------------------------------
// | Author: jry <598821125@qq.com>
// +----------------------------------------------------------------------
namespace Admin\Model;

use Common\Util\Tree;
use Think\Model;
use Think\Storage;

/**
 * 功能模块模型
 * @author jry <598821125@qq.com>
 */
class ModuleModel extends Model
{
    /**
     * 数据库表名
     * @author jry <598821125@qq.com>
     */
    protected $tableName = 'admin_module';

    /**
     * 自动验证规则
     * @author jry <598821125@qq.com>
     */
    protected $_validate = array(
        array('name', 'require', '模块名称不能为空', self::MUST_VALIDATE, 'regex', self::MODEL_BOTH),
        array('name', '', '该模块已存在', self::MUST_VALIDATE, 'unique', self::MODEL_BOTH),
        array('title', 'require', '模块标题不能为空', self::MUST_VALIDATE, 'regex', self::MODEL_BOTH),
        array('description', 'require', '模块描述不能为空', self::MUST_VALIDATE, 'regex', self::MODEL_BOTH),
        array('developer', 'require', '模块开发者不能为空', self::MUST_VALIDATE, 'regex', self::MODEL_BOTH),
        array('version', 'require', '模块版本不能为空', self::MUST_VALIDATE, 'regex', self::MODEL_BOTH),
        array('admin_menu', 'require', '模块菜单节点不能为空', self::MUST_VALIDATE, 'regex', self::MODEL_BOTH),
    );

    /**
     * 自动完成规则
     * @author jry <598821125@qq.com>
     */
    protected $_auto = array(
        array('create_time', 'time', self::MODEL_INSERT, 'function'),
        array('update_time', 'time', self::MODEL_BOTH, 'function'),
        array('sort', '0', self::MODEL_INSERT),
        array('status', '1', self::MODEL_INSERT),
    );

    /**
     * 安装描述文件名
     * @author jry <598821125@qq.com>
     */
    public function install_file()
    {
        return 'opencmf.php';
    }

    /**
     * 获取模块菜单
     * @author jry <598821125@qq.com>
     */
    public function getAdminMenu($module_name = MODULE_NAME)
    {
        // 获取模块左侧导航
        $where['name']   = $module_name;
        $module_info     = $this->where($where)->find();
        $_side_menu_list = json_decode($module_info['admin_menu'], true);

        // 转换成树结构
        $tree = new tree();
        return $tree->list_to_tree($_side_menu_list);
    }

    /**
     * 获取模块当前菜单
     * @author jry <598821125@qq.com>
     */
    public function getCurrentMenu($module_name = MODULE_NAME)
    {
        $admin_menu = $this->getFieldByName($module_name, 'admin_menu');
        $admin_menu = json_decode($admin_menu, true);
        foreach ($admin_menu as $key => $val) {
            if (isset($val['url'])) {
                $config_url  = U($val['url']);
                $current_url = U(MODULE_NAME . '/' . CONTROLLER_NAME . '/' . ACTION_NAME);
                if ($config_url === $current_url) {
                    $result = $val;
                }
            }
        }
        return $result;
    }

    /**
     * 获取所有模块菜单
     * @param string $addon_dir
     * @author jry <598821125@qq.com>
     */
    public function getAllMenu()
    {
        $menu_list = S('MENU_LIST');
        if (!$menu_list || APP_DEBUG === true) {
            $con['status']      = 1;
            $system_module_list = $this->where($con)->order('sort asc, id asc')->select();
            $tree               = new tree();
            $menu_list          = array();
            foreach ($system_module_list as $key => &$module) {
                $temp                               = $tree->list_to_tree(json_decode($module['admin_menu'], true));
                $menu_list[$module['name']]         = $temp[0];
                $menu_list[$module['name']]['id']   = $module['id'];
                $menu_list[$module['name']]['name'] = $module['name'];
            }

            // 如果模块顶级菜单配置了top字段则移动菜单至top所指的模块下边
            foreach ($menu_list as $key => &$value) {
                if ($value['top']) {
                    if ($menu_list[$value['top']]) {
                        $menu_list[$value['top']]['_child'] = array_merge(
                            $menu_list[$value['top']]['_child'],
                            $value['_child']
                        );
                        unset($menu_list[$key]);
                    }
                }
            }

            S('MENU_LIST', $menu_list, 3600); // 缓存配置
        }
        return $menu_list;
    }

    /**
     * 根据菜单ID的获取其所有父级菜单
     * @param array $current_menu 当前菜单信息
     * @return array 父级菜单集合
     * @author jry <598821125@qq.com>
     */
    public function getParentMenu($current_menu = '', $module_name = MODULE_NAME)
    {
        if (!$current_menu) {
            $current_menu = $this->getCurrentMenu();
        }
        if (!$current_menu) {
            return false;
        }
        $admin_menu = $this->getFieldByName($module_name, 'admin_menu');
        $admin_menu = json_decode($admin_menu, true);
        $pid        = $current_menu['pid'];
        $temp       = array();
        $result[]   = $current_menu;
        while (true) {
            foreach ($admin_menu as $key => $val) {
                if ($val['id'] == $pid) {
                    $pid = $val['pid'];
                    array_unshift($result, $val); // 将父菜单插入到第一个元素前
                }
            }
            if ($pid == '0') {
                break;
            }
        }
        return $result;
    }

    /**
     * 获取模块列表
     * @param string $addon_dir
     * @author jry <598821125@qq.com>
     */
    public function getAll()
    {
        // 获取除了Common等系统模块外的用户模块
        // 文件夹下必须有$install_file定义的安装描述文件
        $dirs = array_map('basename', glob(APP_PATH . '*', GLOB_ONLYDIR));
        foreach ($dirs as $dir) {
            $config_file = realpath(APP_PATH . $dir) . '/' . $this->install_file();
            if (Storage::has($config_file)) {
                $module_dir_list[]                      = $dir;
                $temp_arr                               = include $config_file;
                $temp_arr['info']['status']             = -1; //未安装
                $module_list[$temp_arr['info']['name']] = $temp_arr['info'];
            }
        }

        // 获取系统已经安装的模块信息
        $installed_module_list = $this->field(true)
            ->order('sort asc,id asc')
            ->select();
        if ($installed_module_list) {
            foreach ($installed_module_list as &$module) {
                $new_module_list[$module['name']]               = $module;
                $new_module_list[$module['name']]['admin_menu'] = json_decode($module['admin_menu'], true);
            }
            // 系统已经安装的模块信息与文件夹下模块信息合并
            $module_list = array_merge($module_list, $new_module_list);
        }

        foreach ($module_list as &$val) {
            switch ($val['status']) {
                case '-2': // 损坏
                    $val['status_icon']                          = '<span class="text-danger">删除记录</span>';
                    $val['right_button']['damaged']['title']     = '删除记录';
                    $val['right_button']['damaged']['attribute'] = 'class="label label-danger ajax-get" href="' . U('setStatus', array('status' => 'delete', 'ids' => $val['id'])) . '"';
                    break;
                case '-1': // 未安装
                    $val['status_icon']                                 = '<i class="fa fa-download text-success"></i>';
                    $val['right_button']['install_before']['title']     = '安装';
                    $val['right_button']['install_before']['attribute'] = 'class="label label-success" href="' . U('install_before', array('name' => $val['name'])) . '"';
                    break;
                case '0': // 禁用
                    $val['status_icon']                                   = '<i class="fa fa-ban text-danger"></i>';
                    $val['right_button']['update_info']['title']          = '更新菜单';
                    $val['right_button']['update_info']['attribute']      = 'class="label label-info ajax-get" href="' . U('updateInfo', array('id' => $val['id'])) . '"';
                    $val['right_button']['forbid']['title']               = '启用';
                    $val['right_button']['forbid']['attribute']           = 'class="label label-success ajax-get" href="' . U('setStatus', array('status' => 'resume', 'ids' => $val['id'])) . '"';
                    $val['right_button']['uninstall_before']['title']     = '卸载';
                    $val['right_button']['uninstall_before']['attribute'] = 'class="label label-danger" href="' . U('uninstall_before', array('id' => $val['id'])) . '"';
                    break;
                case '1': // 正常
                    $val['status_icon']                              = '<i class="fa fa-check text-success"></i>';
                    $val['right_button']['update_info']['title']     = '更新菜单';
                    $val['right_button']['update_info']['attribute'] = 'class="label label-info ajax-get" href="' . U('updateInfo', array('id' => $val['id'])) . '"';
                    if (!$val['is_system']) {
                        $val['right_button']['forbid']['title']               = '禁用';
                        $val['right_button']['forbid']['attribute']           = 'class="label label-warning ajax-get" href="' . U('setStatus', array('status' => 'forbid', 'ids' => $val['id'])) . '"';
                        $val['right_button']['uninstall_before']['title']     = '卸载';
                        $val['right_button']['uninstall_before']['attribute'] = 'class="label label-danger" href="' . U('uninstall_before', array('id' => $val['id'])) . '"';
                    }
                    break;
            }
        }
        return $module_list;
    }

    /**
     * 数据导出
     * @ahor jry <598821125@qq.com>
     */
    public function export($arr,$filename='example',$head=array()){


        import("Org.Util.PHPExcel");
        $Excel = new \PHPExcel(); 
        $Excel
            ->getProperties()
            ->setCreator("dee")
            ->setLastModifiedBy("dee")
            ->setTitle("数据EXCEL导出")
            ->setSubject("数据EXCEL导出")
            ->setDescription("数据EXCEL导出")
            ->setKeywords("excel")
            ->setCategory("result file");

        $cellName = array('A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R','S','T','U','V','W','X','Y','Z','AA','AB','AC','AD','AE','AF','AG','AH','AI','AJ','AK','AL','AM','AN','AO','AP','AQ','AR','AS','AT','AU','AV','AW','AX','AY','AZ');

        if(count($head)>0){

            for($i=0;$i<count($head);$i++){

                $Excel->setActiveSheetIndex(0)
                    ->setCellValue($cellName[$i] . (1),$head[$i]);
                $Excel->getActiveSheet()->getStyle($cellName[$i] . (1),$head[$i])->getAlignment()->setHorizontal(\PHPExcel_Style_Alignment::HORIZONTAL_CENTER);
            }

            for($hang=0;$hang<count($arr);$hang++){
                $row=$arr[$hang];
                $lie=0;
                foreach ($row as  $v) {
                    $Excel->setActiveSheetIndex(0)
                        ->setCellValue($cellName[$lie++] . ($hang + 2),' '.$v);

                }
            }

        }else{

            for($hang=0;$hang<count($arr);$hang++){
                $row=$arr[$hang];
                $lie=0;
                foreach ($row as  $v) {
                    $Excel->setActiveSheetIndex(0)
                        ->setCellValue($cellName[$lie++] . ($hang + 1),' '.$v);

                }
            }
        }

        $Excel->getActiveSheet()->getStyle('A1:'.$cellName[count($head)-1].(count($arr)+1))->getBorders()->getAllBorders()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN);

        $Excel->getActiveSheet()->setTitle($filename);
        $Excel->setActiveSheetIndex(0);
        ob_end_clean();//清除缓冲区,避免乱码
        header('Content-Type: application/vnd.ms-excel');
        header('Content-Disposition: attachment; filename=' . $filename.'.xls');
        header('Cache-Control: max-age=0');


// If you're serving to IE 9, then the following may be needed
        header('Cache-Control: max-age=1');
// If you're serving to IE over SSL, then the following may be needed
        header('Expires: Mon, 26 Jul 1997 05:00:00 GMT'); // Date in the past
        header('Last-Modified: ' . gmdate('D, d M Y H:i:s') . ' GMT'); // always modified
        header('Cache-Control: cache, must-revalidate'); // HTTP/1.1
        header('Pragma: public'); // HTTP/1.0

        $ExcelWriter = \PHPExcel_IOFactory::createWriter($Excel, 'Excel5');
        $ExcelWriter->save('php://output');
    }


    /**
     * 数据导入
     * @ahor jry <598821125@qq.com>
     */
    public function import($table,$data=array()){


        if (!empty($_FILES)) {

            $upload = new \Think\Upload();// 实例化上传类
            $upload->maxSize   =     3145728 ;// 设置附件上传大小

            $info   =   $upload->upload();
            if(!$info) {// 上传错误提示错误信息

                return $upload->getError();
            }
//            dump($info);
//            echo ( $info['import']['ext'] );
//            exit;
            import("Org.Util.PHPExcel");
            $file_name='Uploads/'.$info['import']['savepath'].$info['import']['savename'];
            $objReader='';
            if(strtolower ( $info['import']['ext'] )=='xls'){//判断excel表类型为2003还是2007

                $objReader = \PHPExcel_IOFactory::createReader('Excel5');
            }elseif(strtolower ( $info['import']['ext'] )=='xlsx'){

                $objReader = \PHPExcel_IOFactory::createReader('Excel2007');
            }

            $objPHPExcel = $objReader->load($file_name);
            $sheet = $objPHPExcel->getSheet(0);
            $highestRow = $sheet->getHighestRow(); // 取得总行数
//            $highestColumn = $sheet->getHighestColumn(); // 取得总列数
            $highestColumn = count($data);
            $cellName = array('A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R','S','T','U','V','W','X','Y','Z','AA','AB','AC','AD','AE','AF','AG','AH','AI','AJ','AK','AL','AM','AN','AO','AP','AQ','AR','AS','AT','AU','AV','AW','AX','AY','AZ');

            for($i=1;$i<$highestRow;$i++){
                $list = array();


                for($j=0;$j<$highestColumn;$j++){

                    $list[$data[$j]]= trim($objPHPExcel->getActiveSheet()->getCell($cellName[$j].($i+1))->getValue());
                }

//                  echo $objPHPExcel->getActiveSheet()->getCell("A".$i)->getValue();
                D($table)->add($list);
//              echo  M($table)->error( M($table)->getLastSql());exit;

            }
            return true;
        }else
        {
            return ("请选择上传的文件");
        }

    }


    /**
     * 下载文件
     * @param string $file
     *               被下载文件的路径
     * @param string $name
     *               用户看到的文件名
     */
    public  function download($file,$name=''){
        $fileName = $name ? $name : pathinfo($file,PATHINFO_FILENAME);
        $filePath = realpath($file);

        $fp = fopen($filePath,'rb');

        if(!$filePath || !$fp){
            header('HTTP/1.1 404 Not Found');
            echo "Error: 404 Not Found.(server file path error)<!-- Padding --><!-- Padding --><!-- Padding --><!-- Padding --><!-- Padding --><!-- Padding --><!-- Padding --><!-- Padding --><!-- Padding --><!-- Padding --><!-- Padding --><!-- Padding --><!-- Padding --><!-- Padding -->";
            exit;
        }

        $fileName = $fileName .'.'. pathinfo($filePath,PATHINFO_EXTENSION);
        $encoded_filename = urlencode($fileName);
        $encoded_filename = str_replace("+", "%20", $encoded_filename);

        header('HTTP/1.1 200 OK');
        header( "Pragma: public" );
        header( "Expires: 0" );
        header("Content-type: application/octet-stream");
        header("Content-Length: ".filesize($filePath));
        header("Accept-Ranges: bytes");
        header("Accept-Length: ".filesize($filePath));

        $ua = $_SERVER["HTTP_USER_AGENT"];
        if (preg_match("/MSIE/", $ua)) {
            header('Content-Disposition: attachment; filename="' . $encoded_filename . '"');
        } else if (preg_match("/Firefox/", $ua)) {
            header('Content-Disposition: attachment; filename*="utf8\'\'' . $fileName . '"');
        } else {
            header('Content-Disposition: attachment; filename="' . $fileName . '"');
        }

        // ob_end_clean(); <--有些情况可能需要调用此函数
        // 输出文件内容
        fpassthru($fp);
        exit;
    }

    /**
     * 获取发票类型
     */
    public function getInvoiceTypeList(){
        $list = array(
            "普通发票"=>"普通发票",
            "专用发票"=>"专用发票",
        );
        return $list?$list:[];
    }
}
