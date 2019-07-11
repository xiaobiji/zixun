<?php
/**
 * Created by PhpStorm.
 * User: zhaoxu
 * Date: 2018/11/6
 * Time: 13:49
 */
namespace app\index\controller;

use think\Db;

class Technical extends Common
{
    public function index(){

        return $this->fetch();
    }
}