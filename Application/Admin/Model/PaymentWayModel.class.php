<?php
// +----------------------------------------------------------------------
// | OpenCMF [ Simple Efficient Excellent ]
// +----------------------------------------------------------------------
// | Copyright (c) 2014 http://www.lingyun.net All rights reserved.
// +----------------------------------------------------------------------
// | Author: jry <598821125@qq.com>
// +----------------------------------------------------------------------
namespace Admin\Model;

use Think\Model;

/**
 * 模型
 * @author jry <598821125@qq.com>
 */
class PaymentWayModel extends Model
{
    /**
     * 数据库表名
     * @author jry <598821125@qq.com>
     */
    protected $tableName = 'order_payment_way';

    /**
     * 自动验证规则
     * @author jry <598821125@qq.com>
     */
    protected $_validate = array(

        array('payment_way', 'require', '支付方式不能为空', self::MUST_VALIDATE, 'regex', self::MODEL_BOTH),
        array('payment_account', 'require', '支付账户不能为空', self::MUST_VALIDATE, 'regex', self::MODEL_BOTH),

    );

    /**
     * 获取仓库列表
     */
    public function getList(){
        $list = $this->getField('payment_way,payment_account');
        return $list?$list:[];
    }

}
