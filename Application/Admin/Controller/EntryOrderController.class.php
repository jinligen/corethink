<?php
// +----------------------------------------------------------------------
// | OpenCMF [ Simple Efficient Excellent ]
// +----------------------------------------------------------------------
// | Copyright (c) 2014 http://www.lingyun.net All rights reserved.
// +----------------------------------------------------------------------
// | Author: jry <598821125@qq.com>
// +----------------------------------------------------------------------
namespace Admin\Controller;

use Common\Util\Think\Page;

/**
 * 入库单控制器
 * @author jry <598821125@qq.com>
 */
class EntryOrderController extends AdminController
{
    /**
     * 入库单入口
     * @author jry <598821125@qq.com>
     */
    public function index()
    {


    }


    public function purchaseEntryOrder()
    {
        $map['status'] = array('egt', '1'); // 禁用和正常状态
        $map['entry_order_type_name'] = array('like', '%采购入库单%');

        $p = !empty($_GET["p"]) ? $_GET['p'] : 1;

        $d_object = D('EntryOrder');

        $field = 'id,
                   customer_name,
                   entry_order_payment_date,
                   entry_order_id,
                   storehouse_name,
                   entry_order_price,
                   entry_order_actual_payment,
                   entry_order_remark,
                   create_time,
                   status,
                   entry_order_is_audited';
        $data_list = $d_object->page($p, C('ADMIN_PAGE_ROWS'))->field($field)->where($map)->order('entry_order_id')->group('entry_order_id')->select();
        $page = new Page($d_object->where($map)->field($field)->group('entry_order_id')->count(), C('ADMIN_PAGE_ROWS'));

//        echo var_dump($data_list);
//        exit;

        $add['title'] = '新增';
        $add['class'] = 'btn btn-primary';
        $add['href'] = U('Admin/EntryOrder/purchaseEntryOrderAdd');


        $details['title'] = '详情';
        $details['class'] = 'label label-primary';
        $details['href'] = U('Admin/EntryOrder/purchaseEntryOrderDetails', array('id' => '__data_id__'));


        $audite['title'] = '审核';
        $audite['class'] = 'label label-primary';


        // 使用Builder快速建立列表页面。
        $builder = new \Common\Builder\ListBuilder();
        $builder->setMetaTitle('采购入库单列表')// 设置页面标题
            ->addTopButton('self', $add)// 添加新增按钮
            ->addTopButton('audite')// 添加审核按钮
            ->addTopButton('delete')// 添加删除按钮

            ->addTableColumn('id', 'ID', '', '', '50%')
            ->addTableColumn('customer_name', '供应商')
            ->addTableColumn('entry_order_payment_date', '采购日期')
            ->addTableColumn('entry_order_id', '单据编号')
            ->addTableColumn('storehouse_name', '所在仓库')
            ->addTableColumn('entry_order_price', '单据金额')
            ->addTableColumn('entry_order_actual_payment', '实际支付')
            ->addTableColumn('entry_order_remark', '摘要')
            ->addTableColumn('create_time', '创建时间')
            ->addTableColumn('entry_order_is_audited', '审核状态', 'status')
            ->setTableDataList($data_list)// 数据列表
            ->setTableDataPage($page->show())// 数据列表分页


            ->addTableColumn('right_button', '操作', 'btn')
            ->addRightButton('audite')
            ->addRightButton('self', $details)
 
            ->addRightButton('delete')// 添加删除按钮
            ->display();


    }


    public function productEntryOrder()
    {
        $map['status'] = array('egt', '1'); // 禁用和正常状态
        $map['entry_order_type_name'] = array('like', '%产品入库单%');

        $p = !empty($_GET["p"]) ? $_GET['p'] : 1;

        $d_object = D('EntryOrder');

        $field = 'id,
                   customer_name,
                   entry_order_payment_date,
                   entry_order_id,
                   storehouse_name,
                   entry_order_price,
                   entry_order_actual_payment,
                   entry_order_remark,
                   create_time,
                   status,
                   entry_order_is_audited';
        $data_list = $d_object->page($p, C('ADMIN_PAGE_ROWS'))->field($field)->where($map)->order('entry_order_id')->group('entry_order_id')->select();
        $page = new Page($d_object->where($map)->field($field)->group('entry_order_id')->count(), C('ADMIN_PAGE_ROWS'));

//        echo var_dump($data_list);
//        exit;

        $add['title'] = '新增';
        $add['class'] = 'btn btn-primary';
        $add['href'] = U('Admin/EntryOrder/productEntryOrderAdd');


        $details['title'] = '详情';
        $details['class'] = 'label label-primary';
        $details['href'] = U('Admin/EntryOrder/productEntryOrderDetails', array('id' => '__data_id__'));


        $audite['title'] = '审核';
        $audite['class'] = 'label label-primary';


        // 使用Builder快速建立列表页面。
        $builder = new \Common\Builder\ListBuilder();
        $builder->setMetaTitle('产品入库单列表')// 设置页面标题
        ->addTopButton('self', $add)// 添加新增按钮
        ->addTopButton('audite')// 添加审核按钮
        ->addTopButton('delete')// 添加删除按钮

        ->addTableColumn('id', 'ID', '', '', '50%')
            ->addTableColumn('customer_name', '部门')
            ->addTableColumn('entry_order_payment_date', '日期')
            ->addTableColumn('entry_order_id', '单据编号')
            ->addTableColumn('storehouse_name', '所在仓库')
            ->addTableColumn('entry_order_remark', '摘要')
            ->addTableColumn('create_time', '创建时间')
            ->addTableColumn('entry_order_is_audited', '审核状态', 'status')
            ->setTableDataList($data_list)// 数据列表
            ->setTableDataPage($page->show())// 数据列表分页


            ->addTableColumn('right_button', '操作', 'btn')
            ->addRightButton('audite')
            ->addRightButton('self', $details)

            ->addRightButton('delete')// 添加删除按钮
            ->display();

    }


    /**
     * 新增
     * @author jry <598821125@qq.com>
     */
    public function purchaseEntryOrderAdd()
    {
        if (IS_POST) {
            $headInfo = ($_POST['headInfo']);
            $tableInfo = ($_POST['tableInfo']);
            $map['entry_order_id'] = array('eq',$headInfo['entry_order_id']);
            $id = D('EntryOrder')->where($map)->find();
            if($id){
                echo json_encode('{error:"0002",msg:"已保存！",data:[]}');
                exit;
            }
            $dataList = [];


            for ($i = 0, $leng = count($tableInfo); $i < $leng; $i++) {

                foreach ($headInfo as $key => $value) {
                    $arr[$key] = $value;

                }
                foreach ($tableInfo[$i] as $key => $value) {
                    $arr[$key] = $value;
                }
                $arr["username"] = session('user_auth')["username"];
                $arr["nickname"] = session('user_auth')["nickname"];

                $dataList[] = $arr;
            }



            if (count($dataList)>0) {
                $d_object = D('EntryOrder');
                $id = $d_object->addAll($dataList);
                if ($id) {
                    echo json_encode('{error:"0000",msg:"操作成功！",data:[]}');
                } else {
                    echo json_encode('{error:"0001",msg:"操作失败！",data:[]}');
                }

            } else {
                echo json_encode('{error:"0001",msg:"未插入任何数据！",data:[]}');
            }
        } else {

            $map['entry_order_type_name'] = array('like','%采购%');
            $item = D('EntryOrder')->where($map)->order('entry_order_id desc')->find(); 
            $num = D('Admin/Ids')->getNum($item['entry_order_id']);
            $order_id = D('Admin/Ids')->getOrderId('CGRKD',$num);  
            $this->assign('_order_id', ($order_id)); //系统生成单据编号
            

            
            // 使用FormBuilder快速建立表单页面。
            $this->assign('entry_order_type_name', '采购入库单'); //页面标题
            $this->assign('_storehouse_name', D('Admin/StoreHouseInfo')->getList()); //仓库列表

            $this->assign('_closeDate', json_encode(D('Admin/CloseAccounts')->getCloseDate())); //最近结账日期


            $this->display();
        }

    }

    /**
     * 新增
     * @author jry <598821125@qq.com>
     */
    public function productEntryOrderAdd()
    {
        if (IS_POST) {
            $headInfo = ($_POST['headInfo']);
            $tableInfo = ($_POST['tableInfo']);
            $map['entry_order_id'] = array('eq',$headInfo['entry_order_id']);
            $id = D('EntryOrder')->where($map)->find();
            if($id){
                echo json_encode('{error:"0002",msg:"已保存！",data:[]}');
                exit;
            }

            $dataList = [];


            for ($i = 0, $leng = count($tableInfo); $i < $leng; $i++) {

                foreach ($headInfo as $key => $value) {
                    $arr[$key] = $value;

                }
                foreach ($tableInfo[$i] as $key => $value) {
                    $arr[$key] = $value;
                }
                $arr["username"] = session('user_auth')["username"];
                $arr["nickname"] = session('user_auth')["nickname"];

                $dataList[] = $arr;
            }


            if (count($dataList)>0) {
                $d_object = D('EntryOrder');
                $id = $d_object->addAll($dataList);
                if ($id) {
                    echo json_encode('{error:"0000",msg:"操作成功！",data:[]}');
                } else {
                    echo json_encode('{error:"0001",msg:"操作失败！",data:[]}');
                }

            } else {
                echo json_encode('{error:"0001",msg:"未插入任何数据！",data:[]}');
            }
        } else {
            $map['entry_order_type_name'] = array('like','%产品%');
            $item = D('EntryOrder')->where($map)->order('entry_order_id desc')->find();
            $num = D('Admin/Ids')->getNum($item['entry_order_id']);
            $order_id = D('Admin/Ids')->getOrderId('CPRKD',$num);
            $this->assign('_order_id', ($order_id)); //系统生成单据编号


            // 使用FormBuilder快速建立表单页面。
            $this->assign('entry_order_type_name', '产品入库单'); //页面标题
            $this->assign('_storehouse_name', D('Admin/StoreHouseInfo')->getList()); //仓库列表
            $this->assign('_closeDate', json_encode(D('Admin/CloseAccounts')->getCloseDate())); //最近结账日期
            $this->display();
        }
    }


    /**
     * 采购详情
     * @author jry <598821125@qq.com>
     */
    public function purchaseEntryOrderDetails($id=null)
    {


        if (IS_POST) {

            
            if ($_POST['entry_order_id']) {


                $where['entry_order_id'] = array('eq',$_POST['entry_order_id']);
                $where['entry_order_is_audited'] = array('eq','1');
                $id = D('EntryOrder')->where($where)->find();
                if($id){
                    echo json_encode('{error:"0002",msg:"已审核！",data:[]}');
                    exit;
                }



                $map['entry_order_id'] = $_POST['entry_order_id'];

                $data['entry_order_is_audited'] = 1;
                $data['audited_date'] = date('Y-m-d');
                $d_object = D('EntryOrder');

                $id = $d_object->where($map)->save($data);
//                echo json_encode($id);
                if ($id) {
                    echo json_encode('{error:"0000",msg:"操作成功！",data:[]}');
                } else {
                    echo json_encode('{error:"0001",msg:"操作失败！",data:[]}');
                }

            } else {
                echo json_encode('{error:"0001",msg:"未插入任何数据！",data:[]}');
            }
        } else {
            $map['id'] = array('eq',$id);

            $entry_order = D('storehouse_entry_order')->where($map)->find();

            $map1['entry_order_id'] =array('eq',$entry_order['entry_order_id']);

            $list = D('storehouse_entry_order')->where($map1)->select();

            $this->assign('_list',  json_encode($list));

            $this->display();
        }
    }


    /**
     * 采购详情
     * @author jry <598821125@qq.com>
     */
    public function productEntryOrderDetails($id=null)
    {
        if (IS_POST) {

            if ($_POST['entry_order_id']) {

                $where['entry_order_id'] = array('eq',$_POST['entry_order_id']);
                $where['entry_order_is_audited'] = array('eq','1');
                $id = D('EntryOrder')->where($where)->find();
                if($id){
                    echo json_encode('{error:"0002",msg:"已审核！",data:[]}');
                    exit;
                }



                $map['entry_order_id'] = $_POST['entry_order_id'];



                $data['entry_order_is_audited'] = 1;
                $data['audited_date'] = date('Y-m-d');
                $d_object = D('EntryOrder');

                $id = $d_object->where($map)->save($data);
//                echo json_encode($id);
                if ($id) {
                    echo json_encode('{error:"0000",msg:"操作成功！",data:[]}');
                } else {
                    echo json_encode('{error:"0001",msg:"操作失败！",data:[]}');
                }

            } else {
                echo json_encode('{error:"0001",msg:"未插入任何数据！",data:[]}');
            }
        } else {
            $map['id'] = array('eq',$id);

            $entry_order = D('storehouse_entry_order')->where($map)->find();

            $map1['entry_order_id'] =array('eq',$entry_order['entry_order_id']);

            $list = D('storehouse_entry_order')->where($map1)->select();

            $this->assign('_list',  json_encode($list));

            $this->display();
        }
    }



    /**
     * 设置一条或者多条数据的状态
     * @author jry <598821125@qq.com>
     */
    public function setStatus($model = CONTROLLER_NAME)
    {
        $ids    = I('request.ids');
        $status = I('request.status');
        if (empty($ids)) {
            $this->error('请选择要操作的数据');
        }
        $map['id'] = array('in',$ids);

        $d_object = D('EntryOrder');
        $entry_order_ids = implode(',',$d_object->where($map)->getField('entry_order_id',true));
        $where['entry_order_id'] = array('in',$entry_order_ids);
//        $this->error($status);
        switch ($status) {
            case 'audite' :  // 审核条目

                $data['entry_order_is_audited'] = 1;
                $data['audited_date'] = date('Y-m-d');
                $count = $d_object->where($where)->save($data);
                if ($count > 0) {
                    $this->success('操作成功');
                } else {
                    $this->error('操作失败');
                }
                break;
            case 'delete' :  // 删除条目

                $data['status'] = -1;

                $count = $d_object->where($where)->save($data);
                if ($count > 0) {
                    $this->success('操作成功');
                } else {
                    $this->error('操作失败');
                }
                break;
            default :
                parent::setStatus($model);
                break;
        }
    }


}
