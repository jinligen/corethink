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
class PaymentListController extends AdminController
{
    /**
     * 商品列表
     * @author jry <598821125@qq.com>
     */
    public function index()
    {

         
        $list = D('storehouse_entry_order_view')->select();
 
        $this->assign('_list', json_encode($list));  
        $this->display();
    }


}
