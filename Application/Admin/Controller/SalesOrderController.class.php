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
 * 出库单控制器
 * @author jry <598821125@qq.com>
 */
class SalesOrderController extends AdminController
{
    /**
     * 出库单入口
     * @author jry <598821125@qq.com>
     */
    public function index()
    {
        $map['status'] = array('egt', '1'); // 禁用和正常状态

        $p = !empty($_GET["p"]) ? $_GET['p'] : 1;

        $d_object = D('SalesOrder');

        $field = 'id,
                   customer_name,
                   sales_order_date,
                   sales_order_id,
                   
                   sales_order_give_date, 
                   sales_order_remark,
                   create_time,
                   status,
                   sales_order_is_audited';
        $data_list = $d_object->page($p, C('ADMIN_PAGE_ROWS'))->field($field)->where($map)->order('sales_order_id')->group('sales_order_id')->select();
        $page = new Page($d_object->where($map)->field($field)->group('sales_order_id')->count(), C('ADMIN_PAGE_ROWS'));

//        echo var_dump($data_list);
//        exit;

        $add['title'] = '新增';
        $add['class'] = 'btn btn-primary';
        $add['href'] = U('Admin/SalesOrder/SalesOrderAdd');


        $details['title'] = '详情';
        $details['class'] = 'label label-primary';
        $details['href'] = U('Admin/SalesOrder/SalesOrderDetails', array('id' => '__data_id__'));


        $audite['title'] = '审核';
        $audite['class'] = 'label label-primary';


        // 使用Builder快速建立列表页面。
        $builder = new \Common\Builder\ListBuilder();
        $builder->setMetaTitle('材料出库单列表')// 设置页面标题
        ->addTopButton('self', $add)// 添加新增按钮
        ->addTopButton('audite')// 添加审核按钮
        ->addTopButton('delete')// 添加删除按钮

        ->addTableColumn('id', 'ID', '', '', '50%')
            ->addTableColumn('customer_name', '客户')
            ->addTableColumn('sales_order_date', '日期')
            ->addTableColumn('sales_order_id', '单据编号')
            ->addTableColumn('sales_order_give_date', '交付日期')   
            
            ->addTableColumn('sales_order_remark', '摘要')
            ->addTableColumn('create_time', '创建时间')
            ->addTableColumn('sales_order_is_audited', '审核状态', 'status')
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
    public function SalesOrderAdd()
    {
        if (IS_POST) {
            $headInfo = ($_POST['headInfo']);
            $tableInfo = ($_POST['tableInfo']);

            $map['sales_order_id'] = array('eq',$headInfo['sales_order_id']);
            $id = D('SalesOrder')->where($map)->find();
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
                $d_object = D('SalesOrder');
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
            // 使用FormBuilder快速建立表单页面。

            $item = D('SalesOrder')->order('sales_order_id desc')->find();
            $num = D('Admin/Ids')->getNum($item['sales_order_id']);
            $order_id = D('Admin/Ids')->getOrderId('XSDD',$num);
            $this->assign('_order_id', ($order_id)); //系统生成单据编号


            $this->assign('_storehouse_name', D('Admin/StoreHouseInfo')->getList()); //仓库列表
            $this->assign('_closeDate', json_encode(D('Admin/CloseAccounts')->getCloseDate(),JSON_HEX_TAG | JSON_HEX_APOS | JSON_HEX_QUOT | JSON_HEX_AMP | JSON_UNESCAPED_UNICODE)); //最近结账日期
            $this->display();
        }

    }
 

    /**
     * 详情
     * @author jry <598821125@qq.com>
     */
    public function SalesOrderDetails($id=null)
    {


        if (IS_POST) {

            if ($_POST['sales_order_id']) {

                $where['sales_order_id'] = array('eq',$_POST['sales_order_id']);
                $where['sales_order_is_audited'] = array('eq','1');
                $id = D('SalesOrder')->where($where)->find();
                if($id){
                    echo json_encode('{error:"0002",msg:"已审核！",data:[]}');
                    exit;
                }


                $map['sales_order_id'] = $_POST['sales_order_id'];

                $data['sales_order_is_audited'] = 1;
                $d_object = D('SalesOrder');

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

            $sales_order = D('storehouse_sales_order')->where($map)->find();

            $map1['sales_order_id'] =array('eq',$sales_order['sales_order_id']);

            $list = D('storehouse_sales_order')->where($map1)->select();

            $this->assign('_list',  json_encode($list,JSON_HEX_TAG | JSON_HEX_APOS | JSON_HEX_QUOT | JSON_HEX_AMP | JSON_UNESCAPED_UNICODE));

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

        $d_object = D('SalesOrder');
        $sales_order_ids = implode(',',$d_object->where($map)->getField('sales_order_id',true));
        $where['sales_order_id'] = array('in',$sales_order_ids);
//        $this->error($status);
        switch ($status) {
            case 'audite' :  // 审核条目

                $data['sales_order_is_audited'] = 1;
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
