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
class CustomerModel extends Model
{
    /**
     * 数据库表名
     * @author jry <598821125@qq.com>
     */
    protected $tableName = 'storehouse_customer';

    /**
     * 自动验证规则
     * @author jry <598821125@qq.com>
     */
    protected $_validate = array(

        array('customer_id', 'require', '客户编号不能为空', self::MUST_VALIDATE, 'regex', self::MODEL_BOTH),
        array('customer_name', 'require', '客户名称不能为空', self::MUST_VALIDATE, 'regex', self::MODEL_BOTH),
        array('types', 'require', '请选择客户类别', self::MUST_VALIDATE, 'regex', self::MODEL_BOTH),
        array('customer_address', 'require', '地址不能为空', self::MUST_VALIDATE, 'regex', self::MODEL_BOTH),
        array('customer_phone', 'require', '电话不能为空', self::MUST_VALIDATE, 'regex', self::MODEL_BOTH),
        array('customer_phone', '/^1\d{10}$/', '电话号码格式不正确', self::EXISTS_VALIDATE, 'regex', self::MODEL_BOTH),
    );

    /**
     * 获取列表
     */
    public function getList(){
        $list = $this->getField('customer_name,customer_name as name');
        return $list?$list:[];
    }

}
