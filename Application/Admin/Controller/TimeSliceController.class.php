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
class TimeSliceController extends AdminController
{
    /**
     *
     * @author jry <598821125@qq.com>
     */
    public function index()
    {

        $this->display();
         
    }

    /**
     *采购入库单时序薄
     * @author jry <598821125@qq.com>
     */
    public function purchaceEntryOrder()
    {

        $this->display();

    }

    /**
     *产品入库单时序薄
     * @author jry <598821125@qq.com>
     */
    public function productEntryOrder()
    {

        $this->display();

    }

    /**
     *材料出库单时序薄
     * @author jry <598821125@qq.com>
     */
    public function materialOutOrder()
    {

        $this->display();

    }

    /**
     *产品出库单时序薄
     * @author jry <598821125@qq.com>
     */
    public function productOutOrder()
    {

        $this->display();

    }


    /**
     *付款单时序薄
     * @author jry <598821125@qq.com>
     */
    public function paymentOrder()
    {

        $this->display();

    }


    /**
     *收款单时序薄
     * @author jry <598821125@qq.com>
     */
    public function gatheringOrder()
    {

        $this->display();

    }


}
