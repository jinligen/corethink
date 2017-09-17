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
class GatheringOrderController extends AdminController
{
    /**
     * 入库单入口
     * @author jry <598821125@qq.com>
     */
    public function index()
    {
        $map['status'] = array('egt', '1'); // 禁用和正常状态
//        $map['gathering_order_type_name'] = array('like', '%付款单%');

        $p = !empty($_GET["p"]) ? $_GET['p'] : 1;

        $d_object = D('GatheringOrder'); 
        $field = 'id,
                   gathering_order_id,
                   gathering_order_type_name,
                   gathering_order_price,
                   gathering_order_deposit_rate,
                   gathering_order_deposit_after_price,
                   gathering_order_receivable_price,
                   gathering_order_actual_payment,
                   gathering_order_remark, 
                   create_time,
                   status,
                   gathering_order_is_audited';
        $data_list = $d_object->page($p, C('ADMIN_PAGE_ROWS'))->field($field)->where($map)->order('gathering_order_id')->group('gathering_order_id')->select();

//        echo var_dump($d_object->getLastSql());
//        exit;
        $page = new Page($d_object->where($map)->field($field)->group('gathering_order_id')->count(), C('ADMIN_PAGE_ROWS'));



        $add['title'] = '新增';
        $add['class'] = 'btn btn-primary';
        $add['href'] = U('Admin/GatheringOrder/gatheringOrderAdd');


        $details['title'] = '详情';
        $details['class'] = 'label label-primary';
        $details['href'] = U('Admin/GatheringOrder/gatheringOrderDetails', array('id' => '__data_id__'));


        $audite['title'] = '审核';
        $audite['class'] = 'label label-primary';


        // 使用Builder快速建立列表页面。
        $builder = new \Common\Builder\ListBuilder();
        $builder->setMetaTitle('列表')// 设置页面标题
        ->addTopButton('self', $add)// 添加新增按钮
        ->addTopButton('audite')// 添加审核按钮
        ->addTopButton('delete')// 添加删除按钮


        ->addTableColumn('id', 'ID', '', '', '50%')
            ->addTableColumn('gathering_order_id', '单据编号')
            ->addTableColumn('gathering_order_type_name', '日期')
            ->addTableColumn('gathering_order_price', '单据金额')
            ->addTableColumn('gathering_order_deposit_rate', '折扣率')
            ->addTableColumn('gathering_order_deposit_after_price', '折扣额')
            ->addTableColumn('gathering_order_receivable_price', '应收账款')
            ->addTableColumn('gathering_order_actual_payment', '实际支付')
            ->addTableColumn('gathering_order_remark', '摘要')
            ->addTableColumn('create_time', '创建时间')
            ->addTableColumn('gathering_order_is_audited', '审核状态', 'status')
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
    public function gatheringOrderAdd()
    {
        if (IS_POST) {
            $headInfo = ($_POST['headInfo']);
            $tableInfo = ($_POST['tableInfo']);

            $map['gathering_order_id'] = array('eq',$headInfo['gathering_order_id']);
            $id = D('GatheringOrder')->where($map)->find();
            if($id){
                echo json_encode('{error:"0002",msg:"'.$headInfo['gathering_order_id'].'已保存！",data:[]}');
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
                $d_object = D('GatheringOrder');
                $id = $d_object->addAll($dataList);
//                echo json_encode($dataList);
//                echo json_encode($id);exit;
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
            $this->assign('_storehouse_name', D('Admin/StoreHouseInfo')->getList()); //仓库列表
            $this->display();
        }

    }



    /**
     * 详情
     * @author jry <598821125@qq.com>
     */
    public function gatheringOrderDetails($id=null)
    {


        if (IS_POST) {

            if ($_POST['gathering_order_id']) {
                
                $where['gathering_order_id'] = array('eq',$_POST['gathering_order_id']);
                $where['gathering_order_is_audited'] = array('eq','1');
                $id = D('GatheringOrder')->where($where)->find();
                if($id){
                    echo json_encode('{error:"0002",msg:"'.$_POST['gathering_order_id'].'已审核！",data:[]}');
                    exit;
                }
                
                
                
                $map['gathering_order_id'] = $_POST['gathering_order_id'];

                $data['gathering_order_is_audited'] = 1;
                $d_object = D('GatheringOrder');

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

            $gathering_order = D('storehouse_gathering_order')->where($map)->find();

            $map1['gathering_order_id'] =array('eq',$gathering_order['gathering_order_id']);

            $list = D('storehouse_gathering_order')->where($map1)->select();

            $this->assign('_list',  json_encode($list));

//            echo var_dump($list);exit;
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

        $d_object = D('GatheringOrder');
        $gathering_order_ids = implode(',',$d_object->where($map)->getField('gathering_order_id',true));
        $where['gathering_order_id'] = array('in',$gathering_order_ids);
//        $this->error($status);
        switch ($status) {
            case 'audite' :  // 审核条目

                $data['gathering_order_is_audited'] = 1;
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
