<?php
namespace app\weixin\controller;
Class Index extends Wechat
{
    public function index(){
        define('TOKEN',$this->getweixin('token'));
        if(isset($_GET['echostr'])){
            $this->valid();
        }else{
//            逻辑处理
          $this->responsemsg();
        }
    }
}
?>