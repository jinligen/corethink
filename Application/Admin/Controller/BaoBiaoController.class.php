<?php
// +----------------------------------------------------------------------
// | OpenCMF [ Simple Efficient Excellent ]
// +----------------------------------------------------------------------
// | Copyright (c) 2014 http://www.lingyun.net All rights reserved.
// +----------------------------------------------------------------------
// | Author: jry <598821125@qq.com>
// +----------------------------------------------------------------------
namespace Admin\Controller;

use Common\Controller\CommonController;

/**
 * 商品控制器
 * @author jry <598821125@qq.com>
 */
class BaoBiaoController extends CommonController
{
    /**
     * 商品列表
     * @author jry <598821125@qq.com>
     */
    public function index()
    {

        echo 'sdfdsf';
//        $this->display();

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

        if (IS_POST) {
            $field = '
            entry_order_date as order_date,
            entry_order_id as order_id,
            invoice_type as invoice_type,
            customer_name as customer_name,
            storehouse_name as storehouse_name,
            entry_order_is_audited as entry_order_is_audited,
            goods_id as goods_id,
            goods_name as goods_name,
            goods_spec as goods_spec,
            goods_actual_unit as goods_actual_unit,
            goods_entry_total_quantity as goods_entry_total_quantity,
            goods_weight as goods_weight,
            entry_order_account_payable as entry_order_account_payable,
            entry_order_actual_payment as entry_order_actual_payment,
            entry_order_payment_way as order_payment_way,
            nickname as nickname
        ';

            $map['entry_order_type_name'] = array('like','%采购%');
            if($_POST['start_date']){
                $where = "entry_order_date >='".$_POST['start_date']."' and entry_order_date <= '9999-99-99'";
            }
            if($_POST['end_date']){
                $where = "entry_order_date >='0000-00-00' and entry_order_date <= '".$_POST['end_date']."'";
            }
            if($_POST['start_date']&&$_POST['end_date']){
                $where = "entry_order_date >='".$_POST['start_date']."' and entry_order_date <= '".$_POST['end_date']."'";
            }

            $list = D('storehouse_entry_order')->field($field)->where($map)->where($where)->order('entry_order_date')->select();
            if ($list && count($list) > 1) {
                for ($i = 0, $len = count($list); $i < $len; $i++) {
                    if ($list[$i + 1] && $list[$i]['order_id'] == $list[$i + 1]['order_id']) {
                        $list[$i + 1]['order_date'] = '';
                        $list[$i + 1]['order_id'] = '';
                        $list[$i + 1]['invoice_type'] = '';
                        $list[$i + 1]['customer_name'] = '';
                        $list[$i + 1]['storehouse_name'] = '';
                    }
                }
            }

            if(count($list)>0){
                $_list  = json_encode($list,JSON_HEX_TAG | JSON_HEX_APOS | JSON_HEX_QUOT | JSON_HEX_AMP | JSON_UNESCAPED_UNICODE);
                $ret = json_encode( '{error:"0000",msg:"查询成功！",list:'.$_list.'}',JSON_HEX_TAG | JSON_HEX_APOS | JSON_HEX_QUOT | JSON_HEX_AMP | JSON_UNESCAPED_UNICODE);

            }else{
                $ret = json_encode('{error:"0001",msg:"未查到任何数据！"}');

            }

            echo $ret;
            exit;
        }else{
            $this->display();
        }




    }

    /**
     *产品入库单时序薄
     * @author jry <598821125@qq.com>
     */
    public function productEntryOrder()
    {

        if (IS_POST) {
            $field = '
            entry_order_date as order_date,
            entry_order_id as order_id, 
            customer_name as customer_name,
            storehouse_name as storehouse_name,
            entry_order_is_audited as entry_order_is_audited,
            goods_id as goods_id,
            goods_name as goods_name,
            goods_spec as goods_spec,
            goods_actual_unit as goods_actual_unit,
            goods_entry_total_quantity as goods_entry_total_quantity,
            goods_weight as goods_weight, 
            nickname as nickname
        ';

            $map['entry_order_type_name'] = array('like','%产品%');
            if($_POST['start_date']){
                $where = "entry_order_date >='".$_POST['start_date']."' and entry_order_date <= '9999-99-99'";
            }
            if($_POST['end_date']){
                $where = "entry_order_date >='0000-00-00' and entry_order_date <= '".$_POST['end_date']."'";
            }
            if($_POST['start_date']&&$_POST['end_date']){
                $where = "entry_order_date >='".$_POST['start_date']."' and entry_order_date <= '".$_POST['end_date']."'";
            }

            $list = D('storehouse_entry_order')->field($field)->where($map)->where($where)->order('entry_order_date')->select();
            if ($list && count($list) > 1) {
                for ($i = 0, $len = count($list); $i < $len; $i++) {
                    if ($list[$i + 1] && $list[$i]['order_id'] == $list[$i + 1]['order_id']) {
                        $list[$i + 1]['order_date'] = '';
                        $list[$i + 1]['order_id'] = '';
                        $list[$i + 1]['customer_name'] = '';
                        $list[$i + 1]['storehouse_name'] = '';
                    }
                }
            }

            if(count($list)>0){
                $_list  = json_encode($list,JSON_HEX_TAG | JSON_HEX_APOS | JSON_HEX_QUOT | JSON_HEX_AMP | JSON_UNESCAPED_UNICODE);
                $ret = json_encode( '{error:"0000",msg:"查询成功！",list:'.$_list.'}',JSON_HEX_TAG | JSON_HEX_APOS | JSON_HEX_QUOT | JSON_HEX_AMP | JSON_UNESCAPED_UNICODE);

            }else{
                $ret = json_encode('{error:"0001",msg:"未查到任何数据！"}');

            }

            echo $ret;
            exit;
        }else{
            $this->display();
        }



    }

    /**
     *材料出库单时序薄
     * @author jry <598821125@qq.com>
     */
    public function materialOutOrder()
    {

        if (IS_POST) {
            $field = '
            out_order_date as order_date,
            out_order_id as order_id, 
            customer_name as customer_name,
            storehouse_name as storehouse_name,
            out_order_is_audited as out_order_is_audited,
            goods_id as goods_id,
            goods_name as goods_name,
            goods_spec as goods_spec,
            goods_actual_unit as goods_actual_unit,
            goods_out_total_quantity as goods_out_total_quantity,
            goods_weight as goods_weight, 
            nickname as nickname
        ';
            $map['out_order_type_name'] = array('like','%材料%');
            if($_POST['start_date']){
                $where = "out_order_date >='".$_POST['start_date']."' and out_order_date <= '9999-99-99'";
            }
            if($_POST['end_date']){
                $where = "out_order_date >='0000-00-00' and out_order_date <= '".$_POST['end_date']."'";
            }
            if($_POST['start_date']&&$_POST['end_date']){
                $where = "out_order_date >='".$_POST['start_date']."' and out_order_date <= '".$_POST['end_date']."'";
            }

            $list = D('storehouse_out_order')->field($field)->where($map)->where($where)->order('out_order_date')->select();
            if ($list && count($list) > 1) {
                for ($i = 0, $len = count($list); $i < $len; $i++) {
                    if ($list[$i + 1] && $list[$i]['order_id'] == $list[$i + 1]['order_id']) {
                        $list[$i + 1]['order_date'] = '';
                        $list[$i + 1]['order_id'] = ''; 
                        $list[$i + 1]['customer_name'] = '';
                        $list[$i + 1]['storehouse_name'] = '';
                    }
                }
            }

            if(count($list)>0){
                $_list  = json_encode($list,JSON_HEX_TAG | JSON_HEX_APOS | JSON_HEX_QUOT | JSON_HEX_AMP | JSON_UNESCAPED_UNICODE);
                $ret = json_encode( '{error:"0000",msg:"查询成功！",list:'.$_list.'}',JSON_HEX_TAG | JSON_HEX_APOS | JSON_HEX_QUOT | JSON_HEX_AMP | JSON_UNESCAPED_UNICODE);

            }else{
                $ret = json_encode('{error:"0001",msg:"未查到任何数据！"}');

            }

            echo $ret;
            exit;
        }else{
            $this->display();
        }


    }

    /**
     *产品出库单时序薄
     * @author jry <598821125@qq.com>
     */
    public function salesOutOrder()
    {

        if (IS_POST) {
            $field = '
            out_order_date as order_date,
            out_order_id as order_id,
            invoice_type as invoice_type,
            customer_name as customer_name,
            storehouse_name as storehouse_name,
            out_order_is_audited as out_order_is_audited,
            goods_id as goods_id,
            goods_name as goods_name,
            goods_spec as goods_spec,
            goods_actual_unit as goods_actual_unit,
            goods_out_total_quantity as goods_out_total_quantity,
            goods_weight as goods_weight,
            out_order_account_receivable as out_order_account_receivable,
            out_order_actual_payment as out_order_actual_payment,
            out_order_payment_way as order_payment_way,
            nickname as nickname
        ';
            $map['out_order_type_name'] = array('like','%销售%');
            if($_POST['start_date']){
                $where = "out_order_date >='".$_POST['start_date']."' and out_order_date <= '9999-99-99'";
            }
            if($_POST['end_date']){
                $where = "out_order_date >='0000-00-00' and out_order_date <= '".$_POST['end_date']."'";
            }
            if($_POST['start_date']&&$_POST['end_date']){
                $where = "out_order_date >='".$_POST['start_date']."' and out_order_date <= '".$_POST['end_date']."'";
            }

            $list = D('storehouse_out_order')->field($field)->where($map)->where($where)->order('out_order_date')->select();
            if ($list && count($list) > 1) {
                for ($i = 0, $len = count($list); $i < $len; $i++) {
                    if ($list[$i + 1] && $list[$i]['order_id'] == $list[$i + 1]['order_id']) {
                        $list[$i + 1]['order_date'] = '';
                        $list[$i + 1]['order_id'] = '';
                        $list[$i + 1]['invoice_type'] = '';
                        $list[$i + 1]['customer_name'] = '';
                        $list[$i + 1]['storehouse_name'] = '';
                    }
                }
            }

            if(count($list)>0){
                $_list  = json_encode($list,JSON_HEX_TAG | JSON_HEX_APOS | JSON_HEX_QUOT | JSON_HEX_AMP | JSON_UNESCAPED_UNICODE);
                $ret = json_encode( '{error:"0000",msg:"查询成功！",list:'.$_list.'}',JSON_HEX_TAG | JSON_HEX_APOS | JSON_HEX_QUOT | JSON_HEX_AMP | JSON_UNESCAPED_UNICODE);

            }else{
                $ret = json_encode('{error:"0001",msg:"未查到任何数据！"}');

            }

            echo $ret;
            exit;
        }else{
            $this->display();
        }


    }


    /**
     *付款单时序薄
     * @author jry <598821125@qq.com>
     */
    public function paymentOrder()
    {

        if (IS_POST) {
            $field = '
            payment_order_date as order_date,
            payment_order_id as order_id, 
            payment_order_type_name as payment_order_type_name,
            customer_name as customer_name,
            payment_order_should_payment_price as payment_order_should_payment_price,
            payment_order_deposit_after_price as payment_order_deposit_after_price,
            payment_order_deposit_rate as payment_order_deposit_rate,
            payment_order_is_audited as payment_order_is_audited,
            entry_order_price as entry_order_price,
            already_clear_price as already_clear_price,
            no_clear_price as no_clear_price,
            now_clear_price as now_clear_price, 
            payment_order_actual_payment as payment_order_actual_payment, 
            nickname as nickname
        ';

            if($_POST['start_date']){
                $where = "payment_order_date >='".$_POST['start_date']."' and payment_order_date <= '9999-99-99'";
            }
            if($_POST['end_date']){
                $where = "payment_order_date >='0000-00-00' and payment_order_date <= '".$_POST['end_date']."'";
            }
            if($_POST['start_date']&&$_POST['end_date']){
                $where = "payment_order_date >='".$_POST['start_date']."' and payment_order_date <= '".$_POST['end_date']."'";
            }

            $list = D('storehouse_payment_order')->field($field)->where($where)->order('payment_order_date')->select();
//            echo $list;
//            exit;
            if ($list && count($list) > 1) {
                for ($i = 0, $len = count($list); $i < $len; $i++) {
                    if ($list[$i + 1] && $list[$i]['order_id'] == $list[$i + 1]['order_id']) {
                        $list[$i + 1]['order_date'] = '';
                        $list[$i + 1]['order_id'] = '';
                        $list[$i + 1]['payment_order_type_name'] = '';
                        $list[$i + 1]['customer_name'] = '';
                        $list[$i + 1]['payment_order_should_payment_price'] = '';
                        $list[$i + 1]['payment_order_deposit_after_price'] = '';
                        $list[$i + 1]['payment_order_deposit_rate'] = '';
                        $list[$i + 1]['payment_order_is_audited'] = '';
                        $list[$i + 1]['payment_order_actual_payment'] = '';
                    }
                }
            }

            if(count($list)>0){
                $_list  = json_encode($list,JSON_HEX_TAG | JSON_HEX_APOS | JSON_HEX_QUOT | JSON_HEX_AMP | JSON_UNESCAPED_UNICODE);
                $ret = json_encode( '{error:"0000",msg:"查询成功！",list:'.$_list.'}',JSON_HEX_TAG | JSON_HEX_APOS | JSON_HEX_QUOT | JSON_HEX_AMP | JSON_UNESCAPED_UNICODE);

            }else{
                $ret = json_encode('{error:"0001",msg:"未查到任何数据！"}');

            }

            echo $ret;
            exit;
        }else{
            $this->display();
        }

    }


    /**
     *收款单时序薄
     * @author jry <598821125@qq.com>
     */
    public function gatheringOrder()
    {

        if (IS_POST) {
            $field = '
            gathering_order_date as order_date,
            gathering_order_id as order_id, 
            gathering_order_type_name as gathering_order_type_name,
            customer_name as customer_name,
            gathering_order_receivable_price as gathering_order_receivable_price,
            gathering_order_deposit_after_price as gathering_order_deposit_after_price,
            gathering_order_deposit_rate as gathering_order_deposit_rate,
            gathering_order_is_audited as gathering_order_is_audited,
            out_order_price as out_order_price,
            already_clear_price as already_clear_price,
            no_clear_price as no_clear_price,
            now_clear_price as now_clear_price, 
            gathering_order_actual_payment as gathering_order_actual_payment, 
            nickname as nickname
        ';

            if($_POST['start_date']){
                $where = "gathering_order_date >='".$_POST['start_date']."' and gathering_order_date <= '9999-99-99'";
            }
            if($_POST['end_date']){
                $where = "gathering_order_date >='0000-00-00' and gathering_order_date <= '".$_POST['end_date']."'";
            }
            if($_POST['start_date']&&$_POST['end_date']){
                $where = "gathering_order_date >='".$_POST['start_date']."' and gathering_order_date <= '".$_POST['end_date']."'";
            }

            $list = D('storehouse_gathering_order')->field($field)->where($where)->order('gathering_order_date')->select();
//            echo $list;
//            exit;
            if ($list && count($list) > 1) {
                for ($i = 0, $len = count($list); $i < $len; $i++) {
                    if ($list[$i + 1] && $list[$i]['order_id'] == $list[$i + 1]['order_id']) {
                        $list[$i + 1]['order_date'] = '';
                        $list[$i + 1]['order_id'] = '';
                        $list[$i + 1]['gathering_order_type_name'] = '';
                        $list[$i + 1]['customer_name'] = '';
                        $list[$i + 1]['gathering_order_receivable_price'] = '';
                        $list[$i + 1]['gathering_order_deposit_after_price'] = '';
                        $list[$i + 1]['gathering_order_deposit_rate'] = '';
                        $list[$i + 1]['gathering_order_is_audited'] = '';
                        $list[$i + 1]['gathering_order_actual_payment'] = '';
                    }
                }
            }

            if(count($list)>0){
                $_list  = json_encode($list,JSON_HEX_TAG | JSON_HEX_APOS | JSON_HEX_QUOT | JSON_HEX_AMP | JSON_UNESCAPED_UNICODE);
                $ret = json_encode( '{error:"0000",msg:"查询成功！",list:'.$_list.'}',JSON_HEX_TAG | JSON_HEX_APOS | JSON_HEX_QUOT | JSON_HEX_AMP | JSON_UNESCAPED_UNICODE);

            }else{
                $ret = json_encode('{error:"0001",msg:"未查到任何数据！"}');

            }

            echo $ret;
            exit;
        }else{
            $this->display();
        }

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
