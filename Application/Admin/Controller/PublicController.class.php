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
use Think\Verify;

/**
 * 后台唯一不需要权限验证的控制器
 * @author jry <598821125@qq.com>
 */
class PublicController extends CommonController
{
    /**
     * 后台登陆
     * @author jry <598821125@qq.com>
     */
    public function login()
    {
        if (IS_POST) {
            $username = I('username');
            $password = I('password');

            // 图片验证码校验
            if (!$this->check_verify(I('post.verify'))) {
                $this->error('验证码输入错误！');
            }

            // 验证用户名密码是否正确
            $user_object = D('Admin/User');
            $user_info   = $user_object->login($username, $password);
            if (!$user_info) {
                $this->error($user_object->getError());
            }

            // 验证管理员表里是否有该用户
            $account_object = D('Admin/Access');
            $where['uid']   = $user_info['id'];
            $account_info   = $account_object->where($where)->find();
            if (!$account_info) {
                $this->error('该用户没有管理员权限' . $account_object->getError());
            }

            // 设置登录状态
            $uid = $user_object->auto_login($user_info);

            // 跳转
            if (0 < $account_info['uid'] && $account_info['uid'] === $uid) {
                $this->success('登录成功！', U('Admin/Index/index'));
            } else {
                $this->logout();
            }
        } else {
            $this->assign('meta_title', '管理员登录');
            $this->display();
        }
    }

    /**
     * 注销
     * @author jry <598821125@qq.com>
     */
    public function logout()
    {
        session('user_auth', null);
        session('user_auth_sign', null);
        $this->success('退出成功！', U('login'));
    }

    /**
     * 图片验证码生成，用于登录和注册
     * @author jry <598821125@qq.com>
     */
    public function verify($vid = 1)
    {
        $verify         = new Verify();
        $verify->length = 4;
        $verify->entry($vid);
    }

    /**
     * 检测验证码
     * @param  integer $id 验证码ID
     * @return boolean 检测结果
     */
    public function check_verify($code, $vid = 1)
    {
        $verify = new Verify();
        return $verify->check($code, $vid);
    }

    /**
     * 获取商品列表
     * @param  integer $id 验证码ID
     * @return boolean 检测结果
     */
    public function goodsList()
    {
        $storehouse_name = $_GET['storehouse_name'];
        $goods_type_name = $_GET['goods_type_name'];
        $map['goods_type_name'] = array('like','%'.$goods_type_name.'%');
        $map['storehouse_name'] = array('like','%'.$storehouse_name.'%');
        $list = D('storehouse_goods')->where($map)->select();
        $this->assign('_list',  json_encode($list));
//        echo  var_dump(json_encode($list));exit;
        $this->display();
    }
    /**
     * 获取客户列表
     * @param  integer $id 验证码ID
     * @return boolean 检测结果
     */
    public function customerList()
    {

        $type = $_GET['type'];
        $map['types'] = array('like','%'.$type.'%');
        $list = D('storehouse_customer')->where($map)->select();

        $this->assign('_list',  json_encode($list));
//        echo  var_dump( $type);exit;
        $this->display();
    }

    /**
     * 获取应付列表
     * @param  integer $id 验证码ID
     * @return boolean 检测结果
     */
    public function paymentList()
    {

        $type = $_GET['customer_id'];
        $map['customer_id'] = array('like','%'.$type.'%');
        $list = D('storehouse_entry_order_view')->where($map)->select();

        $this->assign('_list', json_encode($list));
        $this->display();
    }
    
    /**
     * 获取应收列表
     * @param  integer $id 验证码ID
     * @return boolean 检测结果
     */
    public function gatheringList()
    {

        $type = $_GET['customer_id'];
        $map['customer_id'] = array('like','%'.$type.'%');
        $list = D('storehouse_out_order_view')->where($map)->select();

        $this->assign('_list', json_encode($list));
        $this->display();
    }


    /**
     * 
     * @param  integer $id 验证码ID
     * @return boolean 检测结果
     */
    public function checkEntryOrderId(){

        $entry_order_id = $_POST['entry_order_id'];
        $map['entry_order_id'] = array('eq',$entry_order_id);
        $ret = D('storehouse_entry_order')->where($map)->find();

        if($ret){
            echo json_encode('{error:"0001",msg:"该单据编号已存在！",data:[]}');
        }else{
            echo json_encode('{error:"0000",msg:"未查到该单据编号的信息",data:[]}');
        }

    }

    /**
     *
     * @param  integer $id 验证码ID
     * @return boolean 检测结果
     */
    public function checkOutOrderId(){

        $out_order_id = $_POST['out_order_id'];
        $map['out_order_id'] = array('eq',$out_order_id);
        $ret = D('storehouse_out_order')->where($map)->find();

        if($ret){
            echo json_encode('{error:"0001",msg:"该单据编号已存在！",data:[]}');
        }else{
            echo json_encode('{error:"0000",msg:"未查到该单据编号的信息",data:[]}');
        }

    }

   

    /**
     *
     * @param  integer $id 验证码ID
     * @return boolean 检测结果
     */
    public function checkPaymentOrderId(){

        $payment_order_id = $_POST['payment_order_id'];
        $map['payment_order_id'] = array('eq',$payment_order_id);
        $ret = D('storehouse_payment_order')->where($map)->find();

        if($ret){
            echo json_encode('{error:"0001",msg:"该单据编号已存在！",data:[]}');
        }else{
            echo json_encode('{error:"0000",msg:"未查到该单据编号的信息",data:[]}');
        }

    }

    /**
     *
     * @param  integer $id 验证码ID
     * @return boolean 检测结果
     */
    public function checkGatheringOrderId(){

        $gathering_order_id = $_POST['gathering_order_id'];
        $map['gathering_order_id'] = array('eq',$gathering_order_id);
        $ret = D('storehouse_gathering_order')->where($map)->find();

        if($ret){
            echo json_encode('{error:"0001",msg:"该单据编号已存在！",data:[]}');
        }else{
            echo json_encode('{error:"0000",msg:"未查到该单据编号的信息",data:[]}');
        }

    }
    /**
     *
     * @param  integer $id 验证码ID
     * @return boolean 检测结果
     */
    public function checkGoodsCheckId(){

        $goods_check_id = $_POST['goods_check_id'];
        $map['goods_check_id'] = array('eq',$goods_check_id);
        $ret = D('storehouse_goods_check')->where($map)->find();

        if($ret){
            echo json_encode('{error:"0001",msg:"该单据编号已存在！",data:[]}');
        }else{
            echo json_encode('{error:"0000",msg:"未查到该单据编号的信息",data:[]}');
        }

    }


    /**
     * 获取业务员列表
     * @param  integer $id 验证码ID
     * @return boolean 检测结果
     */
    public function clerkList()
    {

        $this->display();
    }




}
