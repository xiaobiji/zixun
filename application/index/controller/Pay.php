<?php
/**
 * Created by PhpStorm.
 * User: yifeng
 * Date: 2017/11/2
 * Time: 22:22
 */
namespace app\admin\controller;
use think\Lang;
class Pay extends Common
{

    //内容列表
    public function index(){
        return $this->fetch();
    }
    //支付配置
    public function setpay(){
        return $this->fetch();
    }
}