<?php
namespace app\index\controller;
use think\Db;
use think\Lang;
class Index extends Common
{
    public function index()
    {
       return view();
    }

    /**
     * 后台首页面
     * @return \think\response\View
     */
    public function system()
    {
        //获取服务信息,超全局变量：$_SERVER
        $system=[
            'ip'=>$_SERVER['SERVER_ADDR'],//获取服务器IP地址
            //服务器域名/主机名
            'host'=>$_SERVER['SERVER_NAME'],
            //服务器操作系统/php_uname
            'os'=>PHP_OS,
            //运行环境
            'server'=>$_SERVER["SERVER_SOFTWARE"],
            //服务器端口
            'port'=>$_SERVER['SERVER_PORT'],
            //PHP版本
            'php_ver'=>PHP_VERSION,
            'mysql_ver'=>Db::query('select version() as ver')[0]['ver'],
            'database'=>config('database')['database']
        ];
        $logRes=db('loginlog')->order('logintime desc')->where('mid',session('loginid','','admin'))->limit(10)->select();
        $this->assign('system',$system);
        $this->assign('log',$logRes);
        return view();
    }
}
