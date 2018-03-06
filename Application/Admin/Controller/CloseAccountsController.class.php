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
class CloseAccountsController extends AdminController
{
    /**
     * 列表
     * @author jry <598821125@qq.com>
     */
    public function index()
    {


        // 获取所有用户
        $map['status'] = array('egt', '1'); // 禁用和正常状态
        $p             = !empty($_GET["p"]) ? $_GET['p'] : 1;
        $user_object   = D('storehouse_close_accounts');
        $data_list     = $user_object->page($p, C('ADMIN_PAGE_ROWS'))->where($map)->order('close_date desc')->select();
        $page          = new Page($user_object->where($map)->count(), C('ADMIN_PAGE_ROWS') );

        // 使用Builder快速建立列表页面。
        $builder = new \Common\Builder\ListBuilder();
        $builder->setMetaTitle('结账列表') // 设置页面标题
            ->addTopButton('addnew') // 添加新增按钮

            ->addTableColumn('id', 'ID')
            ->addTableColumn('close_date', '结账月份')
            ->addTableColumn('nickname', '操作人')
//
//            ->addTableColumn('create_time', '创建时间')
            ->addTableColumn('is_audited', '状态', 'callback', array(D('CloseAccounts'), 'getIsAudite'))
            ->addTableColumn('right_button', '操作', 'btn')
            ->setTableDataList($data_list) // 数据列表
            ->setTableDataPage($page->show()) // 数据列表分页
            ->addRightButton('jiezhang')
            ->addRightButton('nojiezhang')
            ->addRightButton('edit') // 添加编辑按钮
//            ->addRightButton('recycle') // 添加删除按钮
            ->display();
    }

    /**
     * 新增商品
     * @author jry <598821125@qq.com>
     */
    public function add()
    {
        if (IS_POST) {
            $user_object = D('storehouse_close_accounts');
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

                ->addFormItem('close_date', 'yearmonth', '结账月份', '','','','')

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
            $d_object = D('storehouse_close_accounts');
            $data        = $d_object->create();
            if ($data) {

                $data["username"] = session('user_auth')["username"];
                $data["nickname"] = session('user_auth')["nickname"];
                $result = $d_object->save($data);
                if ($result) {
                    $this->success('更新成功', U('index'));
                } else {
                    $this->error('更新失败', $d_object->getError());
                }
            } else {
                $this->error($d_object->getError());
            }
        } else {

            $info = D('storehouse_close_accounts')->find($id);
            if($info['is_audited'] == 1){
                $extra_attr = 'disabled';
            }else{
                $extra_attr = '';
            }
//            echo var_dump($info);
            // 使用FormBuilder快速建立表单页面。
            $builder = new \Common\Builder\FormBuilder();
            $builder->setMetaTitle('编辑') // 设置页面标题
                ->setPostUrl(U('edit')) // 设置表单提交地址
                ->addFormItem('id', 'hidden', 'ID', 'ID')
                ->addFormItem('close_date', 'yearmonth', '结账月份', '','','',$extra_attr)

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

        $ids    = I('request.ids');
        $status = I('request.status');
        if (empty($ids)) {
            $this->error('请选择要操作的数据');
        }
        $map['id'] = array('in',$ids);

        $d_object = D('storehouse_close_accounts');
        switch ($status) {
            case 'jiezhang' :  // 审核条目

                $data['is_audited'] = 1;
                $count = $d_object->where($map)->save($data);
//                $this->error($count);
                if ($count > 0) {
                    $this->success('操作成功');
                } else {
                    $this->error('操作失败');
                }
                break;
            case 'nojiezhang' :  // 反审核条目

                $_ID = $d_object->order('close_date desc')->find();
//                $this->error($_ID['id']);
                if($_ID['id']!=$ids){
                    $this->error('不能反结账');
                }
                $data['is_audited'] = 0;
                $count = $d_object->where($map)->save($data);
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
