<?php
/**
 * Created by PhpStorm.
 * User: yifeng
 * Date: 2018/1/20
 * Time: 0:16
 */

namespace app\base\controller;


use think\Controller;
use think\Lang;
class Setlang extends Controller
{
//    缓存当前语言
    public function set(){
        if(request()->isAjax()){
            $lang=Lang::detect();
            cookie('think_var',$lang);
            return json(1);
        }
    }
}