<?php
// +----------------------------------------------------------------------
// | OpenCMF [ Simple Efficient Excellent ]
// +----------------------------------------------------------------------
// | Copyright (c) 2014 http://www.lingyun.net All rights reserved.
// +----------------------------------------------------------------------
// | Author: jry <598821125@qq.com>
// +----------------------------------------------------------------------
namespace Admin\Model;

use Common\Util\Tree;
use Think\Model;
use Think\Storage;

/**
 * 功能模块模型
 * @author jry <598821125@qq.com>
 */
class IdsModel extends Model
{
    /**
     * 数据库表名
     * @author jry <598821125@qq.com>
     */
    protected $tableName = 'ids';

    /**
     *获取单据ID
     */
    public function getOrderId($type, $order_id)
    {

        $map['type'] = array('eq', $type);
        $list = $this->where($map)->order('order_id desc')->getField('order_id', true);


        $ret_order_id = $list && count($list) > 0 ? $this->lookForId($list, $order_id) : $order_id;

 

        $data['type'] = $type;

        $data['order_id'] = $ret_order_id;
 
        $id = $this->add($data);
        return $id ? $type.str_pad($ret_order_id,8,"0",STR_PAD_LEFT) : '';

    }

    /**
     *$arr中查找$order_id 若没有则返回  若有说明有人使用则生成新的$order_id+1 在和$arr比较
     */
    public function lookForId($arr, $order_id)
    {

        return !in_array($order_id,$arr)?$order_id:$this->lookForId($arr, (intval($order_id) + 1) + '');

    }

    /**
     *提取单据中的数字
     */
    public function getNum($str = '')
    {

        $str=trim($str);
        if(empty($str)){return '';}
        $temp=array('1','2','3','4','5','6','7','8','9','0');
        $result='';
        for($i=0;$i<strlen($str);$i++){
            if(in_array($str[$i],$temp)){
                $result.=$str[$i];
            }
        }
        return $result==''?1:intval($result)+1;

    }


}
