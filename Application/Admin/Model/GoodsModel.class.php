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
 * 用户模型
 * @author jry <598821125@qq.com>
 */
class GoodsModel extends Model
{
    /**
     * 数据库表名
     * @author jry <598821125@qq.com>
     */
    protected $tableName = 'storehouse_goods';

    /**
     * 自动验证规则
     * @author jry <598821125@qq.com>
     */
    protected $_validate = array(

        array('goods_id', 'require', '商品编码不能为空', self::MUST_VALIDATE, 'regex', self::MODEL_BOTH),
        array('goods_name', 'require', '商品名称不能为空', self::MUST_VALIDATE, 'regex', self::MODEL_BOTH),
        array('goods_spec', 'require', '商品规格不能为空', self::MUST_VALIDATE, 'regex', self::MODEL_BOTH),
        array('goods_min_unit', 'require', '商品最小计量单位不能为空', self::MUST_VALIDATE, 'regex', self::MODEL_BOTH),
        array('goods_rates', 'require', '商品转换率不能为空', self::MUST_VALIDATE, 'regex', self::MODEL_BOTH),
        array('goods_cost_price', 'require', '商品成本价不能为空', self::MUST_VALIDATE, 'regex', self::MODEL_BOTH),
        array('goods_market_price', 'require', '商品市场价不能为空', self::MUST_VALIDATE, 'regex', self::MODEL_BOTH),
        array('storehouse_name', 'require', '商品所在仓库不能为空', self::MUST_VALIDATE, 'regex', self::MODEL_BOTH),

    );

}
