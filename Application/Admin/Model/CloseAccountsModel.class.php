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
class CloseAccountsModel extends Model
{
    /**
     * 数据库表名
     * @author jry <598821125@qq.com>
     */
    protected $tableName = 'storehouse_close_accounts';

    /**
     * 自动验证规则
     * @author jry <598821125@qq.com>
     */
    protected $_validate = array(

    );

    /**
     * 获取列表
     */
    public function getCloseDate(){
        $list = $this->order('close_date desc')->limit(1)->getField('close_date',true);

        return $list?$list[0].'-01':'0000-00-00';
    }

    /**
     * 审核状态
     */
    public function getIsAudite($audite){
        return $audite==1?'<span style="color: green">已结</span>':'<span style="color: red">未结</span>';
    }

}
