<?php
// +----------------------------------------------------------------------
// | ThinkPHP [ WE CAN DO IT JUST THINK ]
// +----------------------------------------------------------------------
// | Copyright (c) 2006~2016 http://thinkphp.cn All rights reserved.
// +----------------------------------------------------------------------
// | Licensed ( http://www.apache.org/licenses/LICENSE-2.0 )
// +----------------------------------------------------------------------
// | Author: liu21st <liu21st@gmail.com>
// +----------------------------------------------------------------------
//think\Route::rule('page/[:id]','index/Page/index');
//think\Route::rule('page/[:id]','index/Page/index','get','',['id'=>'\d+']);
use think\Route;
//后台登录
// Route::rule('admin_jghc','admin/login/index','get');
//首页路由
//Route::rule('/','index/Index/index');
//关于我们
Route::rule('about/:id','index/Page/index','get','',['id'=>'\d+']);
//专业团队
//Route::rule('team/:id','index/Page/team','get','',['id'=>'\d+']);
Route::group('team',[
    'list/:id'   => ['index/Page/team', ['method' => 'get'], ['id' => '\d+']],
    'show/:id' => ['index/Page/teamshow', ['method' => 'get'], ['id' => '\d+']],
]);
//摄影作品
//1.列表
//Route::rule('works/list/:id','index/Works/index','get','',['id'=>'\d+']);
//2.详情
//Route::rule('works/show/:id','index/Works/show','get','',['id'=>'\d+']);
//分组方式注册路由
Route::group('works',[
    'list/:id'   => ['index/Works/index', ['method' => 'get'], ['id' => '\d+']],
    'show/:id' => ['index/Works/show', ['method' => 'get'], ['id' => '\d+']],
]);
//模特资料
//1.列表
Route::rule('model/list/:id','index/Model/index','get','',['id'=>'\d+']);
//2.详情
Route::rule('model/show/:id','index/Model/show','get','',['id'=>'\d+']);
//摄影场景
//1.列表
Route::rule('scene/list/:id','index/Scene/index','get','',['id'=>'\d+']);
//2.详情
Route::rule('scene/show/:id','index/Scene/show','get','',['id'=>'\d+']);
//新闻
//1.列表
//Route::rule('news/list/:id','index/News/index','get','',['id'=>'\d+']);
//2.详情
//Route::rule('news/show/:id','index/News/show','get','',['id'=>'\d+']);
//联系我们
Route::rule('contactus/:id','index/Contactus/index','get','',['id'=>'\d+']);

