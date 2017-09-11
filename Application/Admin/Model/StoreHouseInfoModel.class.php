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
class StoreHouseInfoModel extends Model
{
    /**
     * 数据库表名
     * @author jry <598821125@qq.com>
     */
    protected $tableName = 'storehouse_info';

    /**
     * 自动验证规则
     * @author jry <598821125@qq.com>
     */
    protected $_validate = array(

        array('goods_id', 'require', '仓库编号不能为空', self::MUST_VALIDATE, 'regex', self::MODEL_BOTH),
        array('goods_name', 'require', '仓库名称不能为空', self::MUST_VALIDATE, 'regex', self::MODEL_BOTH),

    );

    /**
     * 获取仓库列表
     */
    public function getList(){
        $list = $this->getField('storehouse_name,storehouse_name as name');
        return $list?$list:[];
    }

}
