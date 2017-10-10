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
    /**
     * 默认方法
     * @author jry <598821125@qq.com>
     */
    public function index()
    {
        $url='https://qyapi.weixin.qq.com/cgi-bin/gettoken?corpid=wx538077f2d77d0c5b&corpsecret=bkO2Dv9MFkwT0FwxB_LIXm5EzWinItdp_lfe9NkM4JuB5RBXdlo4TE5S4YIz3rmi';
        $ret = $this->httpsGet($url);
        if($ret['access_token']){
            $ret1 = $this->httpsGet('https://qyapi.weixin.qq.com/cgi-bin/get_jsapi_ticket?access_token='.$ret['access_token']);
            echo $ret1['ticket'];
        }else{
        }

    }

    public function httpsGet($url){
        $curl = curl_init();
        curl_setopt($curl, CURLOPT_URL, $url);
        curl_setopt($curl, CURLOPT_RETURNTRANSFER, 1);
        curl_setopt($curl, CURLOPT_SSL_VERIFYPEER, false);// https请求不验证证书和hosts
        curl_setopt($curl, CURLOPT_SSL_VERIFYHOST, false);
        $res=json_decode(curl_exec($curl),true);
        curl_close($curl);
        return $res;
    }
    public function httpsPost($url,$post_data){
        $ch = curl_init();
        curl_setopt($ch, CURLOPT_URL, $url);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
        // post数据
        curl_setopt($ch, CURLOPT_POST, 1);
        curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, FALSE); // https请求 不验证证书和hosts
        curl_setopt($ch, CURLOPT_SSL_VERIFYHOST, false);
        // post的变量
        curl_setopt($ch, CURLOPT_POSTFIELDS, $post_data);
        $output=json_decode(curl_exec($ch),true);
        curl_close($ch);
        return $output;
    }
}
