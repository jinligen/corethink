<?php
// +----------------------------------------------------------------------
// | OpenCMF [ Simple Efficient Excellent ]
// +----------------------------------------------------------------------
// | Copyright (c) 2014 http://www.lingyun.net All rights reserved.
// +----------------------------------------------------------------------
// | Author: jry <598821125@qq.com>
// +----------------------------------------------------------------------
// 模块信息配置
return array(
    // 模块信息
    'info'       => array(
        'name'        => 'Admin',
        'title'       => '系统',
        'icon'        => 'fa fa-cog',
        'icon_color'  => '#3CA6F1',
        'description' => '核心系统',
        'developer'   => '南京科斯克网络科技有限公司',
        'website'     => 'http://www.lingyun.net',
        'version'     => '1.3.0',
    ),

    // 后台菜单及权限节点配置
    'admin_menu' => array(
        '1'  => array(
            'pid'   => '0',
            'title' => '系统',
            'icon'  => 'fa fa-cog',
            'level' => 'system',
        ),

        'a'  => array(
            'pid'   => '1',
            'title' => '系统功能',
            'icon'  => 'fa fa-folder-open-o',
        ),
        'a1'  => array(
            'pid'   => 'a',
            'title' => '系统设置',
            'icon'  => 'fa fa-wrench',
            'url'   => 'Admin/Config/group',
        ),
        'a11'  => array(
            'pid'   => 'a1',
            'title' => '修改设置',
            'url'   => 'Admin/Config/groupSave',
        ),


        'a2' => array(
            'pid'   => 'a',
            'title' => '用户列表',
            'icon'  => 'fa fa-user',
            'url'   => 'Admin/User/index',
        ),

        'a21' => array(
            'pid'   => 'a2',
            'title' => '新增',
            'url'   => 'Admin/User/add',
        ),
        'a22' => array(
            'pid'   => 'a2',
            'title' => '编辑',
            'url'   => 'Admin/User/edit',
        ),
        'a23' => array(
            'pid'   => 'a2',
            'title' => '设置状态',
            'url'   => 'Admin/User/setStatus',
        ),

        'a3' => array(
            'pid'   => 'a',
            'title' => '用户分组',
            'icon'  => 'fa fa-lock',
            'url'   => 'Admin/Access/index',
        ),
        'a31' => array(
            'pid'   => 'a3',
            'title' => '新增',
            'url'   => 'Admin/Access/add',
        ),
        'a32' => array(
            'pid'   => 'a3',
            'title' => '编辑',
            'url'   => 'Admin/Access/edit',
        ),
        'a33' => array(
            'pid'   => 'a3',
            'title' => '设置状态',
            'url'   => 'Admin/Access/setStatus',
        ),

        'a4' => array(
            'pid'   => 'a',
            'title' => '角色管理',
            'icon'  => 'fa fa-sitemap',
            'url'   => 'Admin/Group/index',
        ),
        'a41' => array(
            'pid'   => 'a4',
            'title' => '新增',
            'url'   => 'Admin/Group/add',
        ),
        'a42' => array(
            'pid'   => 'a4',
            'title' => '编辑',
            'url'   => 'Admin/Group/edit',
        ),
        'a43' => array(
            'pid'   => 'a4',
            'title' => '设置状态',
            'url'   => 'Admin/Group/setStatus',
        ),

        'a5' => array(
            'pid'   => 'a',
            'title' => '功能模块',
            'icon'  => 'fa fa-th-large',
            'url'   => 'Admin/Module/index',
        ),
        'a51' => array(
            'pid'   => 'a5',
            'title' => '安装',
            'url'   => 'Admin/Module/install',
        ),
        'a52' => array(
            'pid'   => 'a5',
            'title' => '卸载',
            'url'   => 'Admin/Module/uninstall',
        ),
        'a53' => array(
            'pid'   => 'a5',
            'title' => '更新信息',
            'url'   => 'Admin/Module/updateInfo',
        ),
        'a54' => array(
            'pid'   => 'a5',
            'title' => '设置状态',
            'url'   => 'Admin/Module/setStatus',
        ),
        'a6' => array(
            'pid'   => 'a',
            'title' => '数据备份',
            'icon'  => 'fa fa-book',
            'url'   => 'admin/database/index',
        ),




        'b'  => array(
             'pid'   => '1',
             'title' => '库存管理',
             'icon'  => 'fa fa-folder-open-o',
         ),
        'b1'  => array(
            'pid'   => 'b',
            'title' => '采购入库单',
            'icon'  => 'fa fa-file-o',
            'url'   => 'Admin/EntryOrder/purchaseEntryOrder',
        ),
        'b8'  => array(
            'pid'   => 'b',
            'title' => '产品入库单',
            'icon'  => 'fa fa-file-o',
            'url'   => 'Admin/EntryOrder/productEntryOrder',
        ),
        'b2'  => array(
            'pid'   => 'b',
            'title' => '材料出库单',
            'icon'  => 'fa fa-files-o',
            'url'   => 'Admin/OutOrder/materialOutOrder',
        ),
        'b9'  => array(
            'pid'   => 'b',
            'title' => '销售出库单',
            'icon'  => 'fa fa-files-o',
            'url'   => 'Admin/OutOrder/salesOutOrder',
        ),
        'b3'  => array(
            'pid'   => 'b',
            'title' => '付款单',
            'icon'  => 'fa fa-list-alt',
            'url'   => 'Admin/PaymentOrder/index',
        ),
        'b4'  => array(
            'pid'   => 'b',
            'title' => '收款单',
            'icon'  => 'fa fa-floppy-o',
            'url'   => 'Admin/GatheringOrder/index',
        ),
        'b5'  => array(
            'pid'   => 'b',
            'title' => '盘点列表',
            'icon'  => 'fa fa-list-ol',
            'url'   => 'Admin/GoodsCheck/index',
        ),
        'b6'  => array(
            'pid'   => 'b',
            'title' => '销售订单',
            'icon'  => 'fa fa-bookmark-o',
            'url'   => 'Admin/SalesOrder/index',
        ),
        'b7'  => array(
            'pid'   => 'b',
            'title' => '成本计算表',
            'icon'  => 'fa fa-bookmark',
            'url'   => 'Admin/public/demo',
        ),



        'b10'  => array(
            'pid'   => 'b',
            'title' => '财务结账',
            'icon'  => 'fa fa-bookmark',
            'url'   => 'Admin/CloseAccounts/index',
        ),



        'c'  => array(
            'pid'   => '1',
            'title' => '报表管理',
            'icon'  => 'fa fa-bar-chart-o',
        ),
        'c1'  => array(
            'pid'   => 'c',
            'title' => '库房即时查询',
            'icon'  => 'fa fa-eye',
            'url'   => 'Admin/InstantInventory/index',
        ),
        'c2'  => array(
            'pid'   => 'c',
            'title' => '采购报表',
            'icon'  => 'fa fa-table',
            'url'   => 'Admin/SummaryPurchase/index',
        ),
        'c3'  => array(
            'pid'   => 'c',
            'title' => '销售报表',
            'icon'  => 'fa fa-building-o',
            'url'   => 'Admin/SummarySales/index',
        ),

        'c4'  => array(
            'pid'   => 'c',
            'title' => '库存商品明细账',
            'icon'  => 'fa fa-building-o',
            'url'   => 'Admin/BaoBiao/index',
        ),


        'd'  => array(
            'pid'   => '1',
            'title' => '基础信息管理',
            'icon'  => 'fa fa-folder-open-o',
        ),
        'd1'  => array(
            'pid'   => 'd',
            'title' => '仓库信息',
            'icon'  => 'fa fa-info-circle',
            'url'   => 'Admin/StoreHouseInfo/index',
        ),
        'd2'  => array(
            'pid'   => 'd',
            'title' => '商品信息',
            'icon'  => 'fa fa-info',
            'url'   => 'Admin/goods/index',
        ),
        'd3'  => array(
            'pid'   => 'd',
            'title' => '商品类型',
            'icon'  => 'fa fa-wrench',
            'url'   => 'Admin/goodsType/index',
        ),
        'd4'  => array(
            'pid'   => 'd',
            'title' => '客户列表',
            'icon'  => 'fa fa-user-md',
            'url'   => 'Admin/customer/index',
        ),
        'd5'  => array(
            'pid'   => 'd',
            'title' => '业务员列表',
            'icon'  => 'fa fa-user',
            'url'   => 'Admin/clerk/index',
        ),

    ),
);
