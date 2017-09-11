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
class GoodsController extends AdminController
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
        $map['goods_id|goods_name'] = array(
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

        // 使用Builder快速建立列表页面。
        $builder = new \Common\Builder\ListBuilder();
        $builder->setMetaTitle('商品列表') // 设置页面标题
            ->addTopButton('addnew') // 添加新增按钮
//            ->addTopButton('resume') // 添加启用按钮
//            ->addTopButton('forbid') // 添加禁用按钮
            ->addTopButton('delete') // 添加删除按钮
            ->setSearch('商品编号/商品名称', U('index'))
            ->addTableColumn('id', 'ID')
            ->addTableColumn('goods_id', '商品编号')
            ->addTableColumn('goods_name', '商品名称')
            ->addTableColumn('goods_spec', '商品规格')
            ->addTableColumn('goods_min_unit', '商品最小计量单位')
            ->addTableColumn('goods_rates', '换算率集合')
            ->addTableColumn('goods_stock_balance', '商品库存量')
            ->addTableColumn('goods_cost_price', '商品成本价')
            ->addTableColumn('goods_market_price', '商品销售价')
            ->addTableColumn('storehouse_name', '所在仓库')
            ->addTableColumn('nickname', '操作人')
            ->addTableColumn('create_time', '创建时间')
            ->addTableColumn('status', '状态', 'status')
            ->addTableColumn('right_button', '操作', 'btn')
            ->setTableDataList($data_list) // 数据列表
            ->setTableDataPage($page->show()) // 数据列表分页
            ->addRightButton('edit') // 添加编辑按钮
//            ->addRightButton('forbid') // 添加禁用/启用按钮
            ->addRightButton('recycle') // 添加删除按钮
            ->display();
    }

    /**
     * 新增商品
     * @author jry <598821125@qq.com>
     */
    public function add()
    {
        if (IS_POST) {
            $user_object = D('Goods');
            $data        = $user_object->create();
            if ($data) {

                $data["username"] = session('user_auth')["username"];
                $data["nickname"] = session('user_auth')["nickname"];
                $id = $user_object->add($data);
                if ($id) {
                    $this->success('新增成功', U('index'));
                } else {
                    $this->error('新增失败');
                }
            } else {
                $this->error($user_object->getError());
            }
        } else {


            // 使用FormBuilder快速建立表单页面。
            $builder = new \Common\Builder\FormBuilder();
            $builder->setMetaTitle('新增') //设置页面标题
                ->setPostUrl(U('add')) //设置表单提交地址

                ->addFormItem('goods_id', 'text', '商品编码', '','','','')
                ->addFormItem('goods_name', 'text', '商品名称', '','','','')
                ->addFormItem('goods_spec', 'text', '商品规格', '')
                ->addFormItem('goods_min_unit', 'text', '商品最小计量单位', '')

                ->addFormItem('goods_rates', 'text', '换算率集合', '')
                ->addFormItem('goods_stock_balance', 'text', '商品库存量', '')
                ->addFormItem('goods_cost_price', 'text', '商品成本价', '')
                ->addFormItem('goods_market_price', 'text', '商品销售价', '')
                ->addFormItem('storehouse_name', 'select', '商品所在仓库', '',D('Admin/StoreHouseInfo')->getList())
                ->setFormData()
                ->display();
        }
    }

    /**
     * 编辑用户
     * @author jry <598821125@qq.com>
     */
    public function edit($id)
    {
        if (IS_POST) {

            // 提交数据
            $d_object = D('Goods');
            $data        = $d_object->create();
            if ($data) {
                $result = $d_object
                    ->field('id,goods_id,goods_name,goods_spec,goods_min_unit,goods_rates,goods_stock_balance,goods_cost_price,goods_market_price,storehouse_name,update_time')
                    ->save($data);
                if ($result) {
                    $this->success('更新成功', U('index'));
                } else {
                    $this->error('更新失败', $d_object->getError());
                }
            } else {
                $this->error($d_object->getError());
            }
        } else {

            $info = D('Goods')->find($id);

            // 使用FormBuilder快速建立表单页面。
            $builder = new \Common\Builder\FormBuilder();
            $builder->setMetaTitle('编辑') // 设置页面标题
                ->setPostUrl(U('edit')) // 设置表单提交地址
                ->addFormItem('id', 'hidden', 'ID', 'ID')
                ->addFormItem('goods_id', 'text', '商品编码', '','','','')
                ->addFormItem('goods_name', 'text', '商品名称', '','','','')
                ->addFormItem('goods_spec', 'text', '商品规格', '')
                ->addFormItem('goods_min_unit', 'text', '商品最小计量单位', '')

                ->addFormItem('goods_rates', 'text', '换算率集合', '')
                ->addFormItem('goods_stock_balance', 'text', '商品库存量', '')
                ->addFormItem('goods_cost_price', 'price', '商品成本价', '')
                ->addFormItem('goods_market_price', 'price', '商品销售价', '')
                ->addFormItem('storehouse_name', 'select', '商品所在仓库', '',D('Admin/StoreHouseInfo')->getList())

                ->setFormData($info)
                ->display();
        }
    }

    /**
     * 设置一条或者多条数据的状态
     * @author jry <598821125@qq.com>
     */
    public function setStatus($model = CONTROLLER_NAME)
    {

        parent::setStatus($model);
    }

}
