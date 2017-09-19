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
class ClerkModel extends Model
{
    /**
     * 数据库表名
     * @author jry <598821125@qq.com>
     */
    protected $tableName = 'storehouse_clerk';

    /**
     * 自动验证规则
     * @author jry <598821125@qq.com>
     */
    protected $_validate = array(

        array('clerk_id', 'require', '业务员编号不能为空', self::MUST_VALIDATE, 'regex', self::MODEL_BOTH),
        array('clerk_phone', 'require', '电话不能为空', self::MUST_VALIDATE, 'regex', self::MODEL_BOTH),
        array('clerk_name', 'require', '业务员名称不能为空', self::MUST_VALIDATE, 'regex', self::MODEL_BOTH),
        array('clerk_phone', '/^1\d{10}$/', '电话号码格式不正确', self::EXISTS_VALIDATE, 'regex', self::MODEL_BOTH),
    );

    /**
     * 获取列表
     */
    public function getList(){
        $list = $this->getField('clerk_name,clerk_name as name');
        return $list?$list:[];
    }

}
