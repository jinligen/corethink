<?php
// +----------------------------------------------------------------------
// | OpenCMF [ Simple Efficient Excellent ]
// +----------------------------------------------------------------------
// | Copyright (c) 2014 http://www.lingyun.net All rights reserved.
// +----------------------------------------------------------------------
// | Author: jry <598821125@qq.com>
// +----------------------------------------------------------------------
namespace Home\Controller;

use Think\Controller;

/**
 * 前台默认控制器
 * @author jry <598821125@qq.com>
 */
class TestController extends HomeController
{
    private $appid = 'wx4bc22a924a9e3172';
    private $secret = '1212f60d1cbaeabbd4f330365b9b618c';

    /**
     * 默认方法
     * @author jry <598821125@qq.com>
     */
    public function index()
    {


        echo '333';

    }

    /**
     * 默认方法
     * @author jry <598821125@qq.com>
     */
    public function test()
    {

        $noncestr = 'abcd1234';
        $timestamp = time();
        $url = urldecode($_GET['url']);
        if (S('token') || S('token') == null) {
            $token = S('token');
        } else {
            $token = $this->getToken();
        }
        if (!$token || $token == '') {
            echo '获取token失败！';
            exit;
        }

        if (S('ticket') || S('ticket') == null) {
            $ticket = S('ticket');
        } else {

            $ticket = $this->getTicket($token);
        }



        if (!$ticket || $ticket == '') {
            echo '获取ticket失败！'.$ticket;
            exit;
        }

        $str = "jsapi_ticket=" . $ticket . "&noncestr=" . $noncestr . "&timestamp=" . $timestamp . "&url=".$url;
        $signature = sha1($str);
        $list = array(
            "noncestr" => $noncestr,
            "ticket" => $ticket,
            "timestamp" => $timestamp,
            "url" => $url,
            "str" => $str,
            "signature"=>$signature,
            "appid" => $this->appid
        );

        echo json_encode($list);

    }

    public function getToken()
    {
        $url = 'https://api.weixin.qq.com/cgi-bin/token?grant_type=client_credential&appid=' . $this->appid . '&secret=' . $this->secret;

        $ret = $this->httpsGet($url);
//        echo json_encode($ret,JSON_HEX_TAG | JSON_HEX_APOS | JSON_HEX_QUOT | JSON_HEX_AMP | JSON_UNESCAPED_UNICODE);exit;

        if ($ret['access_token']) {
            S('token',$ret['access_token'],7000);
//            echo  var_dump($ret['access_token']);
            return $ret['access_token'];
        } else {
            echo  var_dump($ret);
            return false;
        }
    }


    public function getTicket($token)
    {
        $url = 'https://api.weixin.qq.com/cgi-bin/ticket/getticket?access_token=' . $token.'&type=jsapi';

        $ret = $this->httpsGet($url);

        if ($ret['errcode'] == 0) {
            S('ticket',$ret['ticket'],7000);
//            echo '2';
            return $ret['ticket'];
        } else {
            echo  var_dump($ret);
            return false;
        }
    }

    public function httpsGet($url)
    {
        $curl = curl_init();
        curl_setopt($curl, CURLOPT_URL, $url);
        curl_setopt($curl, CURLOPT_RETURNTRANSFER, 1);
        curl_setopt($curl, CURLOPT_SSL_VERIFYPEER, false);// https请求不验证证书和hosts
        curl_setopt($curl, CURLOPT_SSL_VERIFYHOST, false);
        $res = json_decode(curl_exec($curl), true);
        curl_close($curl);
        return $res;
    }

    public function httpsPost($url, $post_data)
    {
        $ch = curl_init();
        curl_setopt($ch, CURLOPT_URL, $url);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
        // post数据
        curl_setopt($ch, CURLOPT_POST, 1);
        curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, FALSE); // https请求 不验证证书和hosts
        curl_setopt($ch, CURLOPT_SSL_VERIFYHOST, false);
        // post的变量
        curl_setopt($ch, CURLOPT_POSTFIELDS, $post_data);
        $output = json_decode(curl_exec($ch), true);
        curl_close($ch);
        return $output;
    }
}
