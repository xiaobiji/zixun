<?php
/**
 * Created by PhpStorm.
 * User: zhaoxu
 * Date: 2018/11/6
 * Time: 16:28
 */
namespace app\index\controller;


class Operation extends Common
{
    public function index(){
        return $this->fetch();
    }
}