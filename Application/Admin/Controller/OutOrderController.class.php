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
class OutOrderController extends AdminController
{
    /**
     * 入库单入口
     * @author jry <598821125@qq.com>
     */
    public function index()
    {
         $this->display();
    }

    /**
     * 新增用户
     * @author jry <598821125@qq.com>
     */
    public function add()
    {

    }

    /**
     * 编辑用户
     * @author jry <598821125@qq.com>
     */
    public function edit($id)
    {

    }

    public function materialOutOrder()
    {
        $this->display();
    }


    public function salesOutOrder()
    {
        $this->display();
    }




}
