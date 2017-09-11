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
 * 控制器
 * @author jry <598821125@qq.com>
 */
class CustomerController extends AdminController
{
    /**
     * 列表
     * @author jry <598821125@qq.com>
     */
    public function index()
    {

        if(IS_POST){
            $d_object = D('Customer');

            if($_POST['type']=='export'){
                $list = $d_object->field('types,customer_id,customer_name,customer_type,customer_address,customer_phone,create_time')->select();
                $filename = '客户列表';
                $head = array("分类,客户编号","客户名称","客户类别","地址","电话","创建时间");
                if($list){
                    D('Module')->export($list,$filename,$head);
                }

            }elseif($_POST['type']=='import'){
                $table='Customer';
                $data = array("types","customer_id","customer_name","customer_type","customer_address","customer_phone");
                D('Module')->import($table,$data);

                redirect(U('index'), 0, '');
            }

        }

        // 获取所有用户
        $map['status'] = array('egt', '1'); // 禁用和正常状态
        $p             = !empty($_GET["p"]) ? $_GET['p'] : 1;
        $user_object   = D('Customer');
        $data_list     = $user_object->page($p, C('ADMIN_PAGE_ROWS'))->where($map)->order('id desc')->select();
        $page          = new Page($user_object->where($map)->count(), C('ADMIN_PAGE_ROWS') );

        $attr['title'] = '模板下载';
        $attr['class'] = 'btn btn-success';
//        $attr['href']  = '/corethink/Uploads/yglb.xlsx';
        // 使用Builder快速建立列表页面。
        $builder = new \Common\Builder\ListBuilder();
        $builder->setMetaTitle('列表') // 设置页面标题
            ->addTopButton('addnew') // 添加新增按钮
            ->addTopButton('delete') // 添加删除按钮

            ->addTopButton('self', $attr)
            ->setImport_Export('import_export', U('index'))

            ->addTableColumn('id', 'ID')

            ->addTableColumn('types', '分类')
            ->addTableColumn('customer_id', '客户编号')
            ->addTableColumn('customer_name', '客户名称')
//            ->addTableColumn('customer_type', '客户类别')
            ->addTableColumn('customer_address', '地址')
            ->addTableColumn('customer_phone', '电话')

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
            $user_object = D('Customer');
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
                 ->addFormItem('types', 'select', '分类', '',array('供应商'=>'供应商','客户'=>'客户','公司部门'=>'公司部门'),'','')
                ->addFormItem('customer_id', 'text', '客户编号', '','','','')
                ->addFormItem('customer_name', 'text', '客户名称', '','','','')
//                ->addFormItem('customer_type', 'text', '客户分类', '','','','')
                ->addFormItem('customer_address', 'text', '地址', '','','','')
                ->addFormItem('customer_phone', 'num', '电话', '','','','')

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
            $d_object = D('Customer');
            $data        = $d_object->create();
            if ($data) {
                $result = $d_object
                    ->field('id,customer_id,customer_name,update_time')
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

            $info = D('Customer')->find($id);

            // 使用FormBuilder快速建立表单页面。
            $builder = new \Common\Builder\FormBuilder();
            $builder->setMetaTitle('编辑') // 设置页面标题
                ->setPostUrl(U('edit')) // 设置表单提交地址
                ->addFormItem('id', 'hidden', 'ID', 'ID')
                ->addFormItem('types', 'select', '类型', '',array('供应商'=>'供应商','客户'=>'客户','公司部门'=>'公司部门'),'','')

                ->addFormItem('customer_id', 'text', '客户编号', '','','','')
                ->addFormItem('customer_name', 'text', '客户名称', '','','','')
                ->addFormItem('customer_address', 'text', '地址', '','','','')
                ->addFormItem('customer_phone', 'num', '电话', '','','','')

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
