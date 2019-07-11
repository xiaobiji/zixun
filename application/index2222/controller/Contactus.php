<?php
/**
 * Created by PhpStorm.
 * User: yifeng
 * Date: 2017/12/20
 * Time: 23:06
 */

namespace app\index\controller;


class Contactus extends Common
{
    public function contact(){
       return $this->fetch();
    }
}