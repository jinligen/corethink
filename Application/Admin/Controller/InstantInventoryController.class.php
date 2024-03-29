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
class InstantInventoryController extends AdminController
{
    /**
     * 商品列表
     * @author jry <598821125@qq.com>
     */
    public function index()
    {



        // 搜索
        $keyword                                  = I('keyword', '', 'string');
        $condition                                = array('like', '%' . $keyword . '%');
        $map['storehouse_name|goods_id|goods_name'] = array(
            $condition,
            $condition,
            $condition,
            '_multi' => true,
        );

        // 获取所有用户
        $map['status'] = array('egt', '1'); // 禁用和正常状态
        $p             = !empty($_GET["p"]) ? $_GET['p'] : 1;
        $user_object   = D('Goods');
        $data_list     = $user_object->page($p, C('ADMIN_PAGE_ROWS'))->where($map)->order('id desc')->select();
        $page          = new Page($user_object->where($map)->count(), C('ADMIN_PAGE_ROWS') );


        $attr['title'] = '刷新';
        $attr['class'] = 'btn btn-success';
        $attr['href']  = U('index');

        // 使用Builder快速建立列表页面。
        $builder = new \Common\Builder\ListBuilder();
        $builder->setMetaTitle('即时库存') // 设置页面标题
            ->addTopButton('self', $attr)

            ->setSearch('仓库名称/商品编号/商品名称', U('index'))
            ->addTableColumn('id', 'ID')

            ->addTableColumn('storehouse_name', '所在仓库')
            ->addTableColumn('goods_type_name', '类别')
            ->addTableColumn('goods_id', '商品编号')
            ->addTableColumn('goods_name', '商品名称')
            ->addTableColumn('goods_min_unit', '商品最小计量单位')
            ->addTableColumn('goods_stock_balance', '商品库存量')

            ->setTableDataList($data_list) // 数据列表
            ->setTableDataPage($page->show()) // 数据列表分页
            ->display();
    }


}
