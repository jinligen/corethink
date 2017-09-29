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
class BaoBiaoController extends AdminController
{
    /**
     * 商品列表
     * @author jry <598821125@qq.com>
     */
    public function index()
    {

        $this->display();
         
    }

    /**
     * 商品库存业务汇总表
     */
    public function shangPinKuCunHuiZongBiao()
    {


        $this->display();

    }


    /**
     * 库存商品明细账
     */
    public function kuCunMingXiZhang()
    {

        $this->display();

    }



    /**
     *应付账款明细表
     * @author jry <598821125@qq.com>
     */
    public function yingFuMingXiZhang()
    {

        $this->display();

    }

 

    /**
     *应收账款明细表
     * @author jry <598821125@qq.com>
     */
    public function yingShouMingXiZhang()
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


    /**
     *供应商对账单
     * @author jry <598821125@qq.com>
     */
    public function supplierBill()
    {

        $this->display();

    }


    /**
     *客户对账单
     * @author jry <598821125@qq.com>
     */
    public function customerBill()
    {

        $this->display();

    }


}
