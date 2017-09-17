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
class GoodsCheckController extends AdminController
{
    /**
     * 入库单入口
     * @author jry <598821125@qq.com>
     */
    public function index()
    {
        $map['status'] = array('egt', '1'); // 禁用和正常状态


        $p = !empty($_GET["p"]) ? $_GET['p'] : 1;

        $d_object = D('GoodsCheck');

        $field = 'id,
                   goods_check_id,
                   nickname,
                   storehouse_name,
                   goods_check_is_audited, 
                   create_time,
                   status';
        $data_list = $d_object->page($p, C('ADMIN_PAGE_ROWS'))->field($field)->where($map)->order('goods_check_id')->group('goods_check_id')->select();
        $page = new Page($d_object->where($map)->field($field)->group('goods_check_id')->count(), C('ADMIN_PAGE_ROWS'));

//        echo var_dump($data_list);
//        exit;

        $add['title'] = '新增';
        $add['class'] = 'btn btn-primary';
        $add['href'] = U('Admin/GoodsCheck/add');


        $details['title'] = '详情';
        $details['class'] = 'label label-primary';
        $details['href'] = U('Admin/GoodsCheck/details', array('id' => '__data_id__'));


        $audite['title'] = '审核';
        $audite['class'] = 'label label-primary';


        // 使用Builder快速建立列表页面。
        $builder = new \Common\Builder\ListBuilder();
        $builder->setMetaTitle('列表')// 设置页面标题
        ->addTopButton('self', $add)// 添加新增按钮
        ->addTopButton('audite')// 添加审核按钮
        ->addTopButton('delete')// 添加删除按钮

        ->addTableColumn('id', 'ID', '', '', '50%')
            ->addTableColumn('goods_check_id', '单据编号')
            ->addTableColumn('storehouse_name', '所在仓库')
            ->addTableColumn('nickname', '创建人')
            ->addTableColumn('create_time', '创建时间')
            ->addTableColumn('goods_check_is_audited', '审核状态', 'status')
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
    public function add()
    {
        if (IS_POST) {
            $headInfo = ($_POST['headInfo']);
            $tableInfo = ($_POST['tableInfo']);

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
                $d_object = D('GoodsCheck');
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
            $this->assign('_storehouse_name', D('Admin/StoreHouseInfo')->getList()); //仓库列表
            $this->display();
        }

    }



    /**
     * 详情
     * @author jry <598821125@qq.com>
     */
    public function details($id=null)
    {


        if (IS_POST) {

            if ($_POST['goods_check_id']) {
                $map['goods_check_id'] = $_POST['goods_check_id'];

                $data['goods_check_is_audited'] = 1;
                $d_object = D('GoodsCheck');

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

            $goods_check = D('storehouse_goods_check')->where($map)->find();

            $map1['goods_check_id'] =array('eq',$goods_check['goods_check_id']);

            $list = D('storehouse_goods_check')->where($map1)->select();

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

        $d_object = D('GoodsCheck');
        $goods_check_ids = implode(',',$d_object->where($map)->getField('goods_check_id',true));
        $where['goods_check_id'] = array('in',$goods_check_ids);
//        $this->error($status);
        switch ($status) {
            case 'audite' :  // 审核条目

                $data['goods_check_is_audited'] = 1;
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
