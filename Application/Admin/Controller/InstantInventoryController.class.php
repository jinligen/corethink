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


        // 获取所有用户
        $map['status'] = array('egt', '1'); // 禁用和正常状态
        $p             = !empty($_GET["p"]) ? $_GET['p'] : 1;
        $user_object   = D('Goods');
        $data_list     = $user_object->page($p, C('ADMIN_PAGE_ROWS'))->where($map)->order('id desc')->select();
        $page          = new Page($user_object->where($map)->count(), C('ADMIN_PAGE_ROWS') );

        echo $_GET['storehouse_name'];
        
        
        // 使用Builder快速建立列表页面。
        $builder = new \Common\Builder\ListBuilder();
        $builder->setMetaTitle('商品列表') // 设置页面标题

//        ->setPostUrl(('admin/InstantInventory/index')) //设置表单提交地址
//        ->addFormItem('storehouse_name', 'text', '用户名', '', '', '', '', $_GET['storehouse_name']?$_GET['storehouse_name']:'')


            ->addTopButton('addnew') // 添加新增按钮
            ->addTopButton('delete') // 添加删除按钮

            ->addTableColumn('id', 'ID')
            ->addTableColumn('storehouse_name', '仓库名称')

            ->addTableColumn('create_time', '创建时间')
            ->addTableColumn('status', '状态', 'status')
            ->addTableColumn('right_button', '操作', 'btn')
            ->setTableDataList($data_list) // 数据列表
            ->setTableDataPage($page->show()) // 数据列表分页
            ->addRightButton('edit') // 添加编辑按钮
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
            $user_object = D('StoreHouseInfo');
            $data        = $user_object->create();
            if ($data) {

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

                ->addFormItem('storehouse_id', 'text', '仓库编码', '','','','')
                ->addFormItem('storehouse_name', 'text', '仓库名称', '','','','')

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
            $d_object = D('StoreHouseInfo');
            $data        = $d_object->create();
            if ($data) {
                $result = $d_object
                    ->field('id,storehouse_id,storehouse_name,update_time')
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

            $info = D('StoreHouseInfo')->find($id);

            // 使用FormBuilder快速建立表单页面。
            $builder = new \Common\Builder\FormBuilder();
            $builder->setMetaTitle('编辑') // 设置页面标题
                ->setPostUrl(U('edit')) // 设置表单提交地址
                ->addFormItem('id', 'hidden', 'ID', 'ID')
                ->addFormItem('storehouse_id', 'text', '仓库编码', '','','','')
                ->addFormItem('storehouse_name', 'text', '仓库名称', '','','','')

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
