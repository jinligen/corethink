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
 * 商品控制器
 * @author jry <598821125@qq.com>
 */
class SummaryPurchaseController extends AdminController
{
    /**
     * 列表
     * @author jry <598821125@qq.com>
     */
    public function index()
    {



        // 搜索
        $keyword                                  = I('keyword', '', 'string');
        $condition                                = array('like', '%' . $keyword . '%');
        $map['goods_id|goods_name'] = array(
            $condition,
            $condition,
            '_multi' => true,
        );

        // 获取所有用户
        $map['status'] = array('egt', '1'); // 禁用和正常状态
        $map['entry_order_type_name'] = array('like', '%采购%'); // 禁用和正常状态


        $p             = !empty($_GET["p"]) ? $_GET['p'] : 1;
        $user_object   = D('storehouse_entry_order');
        $data_list     = $user_object->page($p, C('ADMIN_PAGE_ROWS'))->where($map)->order('goods_id desc')->select();
        $page          = new Page($user_object->where($map)->count(), C('ADMIN_PAGE_ROWS') );


        $attr['title'] = '刷新';
        $attr['class'] = 'btn btn-success';
        $attr['href']  = U('index');

        // 使用Builder快速建立列表页面。
        $builder = new \Common\Builder\ListBuilder();
        $builder->setMetaTitle('即时库存') // 设置页面标题
            ->addTopButton('self', $attr)

            ->setSearch('商品编号/商品名称', U('index'))
//            ->addTableColumn('id', 'ID')

            ->addTableColumn('goods_id', '商品编号')
            ->addTableColumn('goods_name', '商品名称')
            ->addTableColumn('goods_min_unit', '商品最小计量单位')
            ->addTableColumn('goods_actual_unit', '商品实际单位')
            ->addTableColumn('goods_weight', '商品重量')
            ->addTableColumn('goods_entry_unit_price', '单价')
            ->addTableColumn('goods_entry_total_quantity', '数量')
            ->addTableColumn('goods_entry_total_price', '金额')


            ->setTableDataList($data_list) // 数据列表
            ->setTableDataPage($page->show()) // 数据列表分页
            ->display();
    }


}
