<?php
/**
 * Created by PhpStorm.
 * User: zhaoxu
 * Date: 2018/11/5
 * Time: 17:24
 */
namespace app\index\controller;

use think\Db;

class Comprofile extends Common
{
    public function index(){
        $info = db('category')->where('mark','about')->field('id,desc,content')->find();
        $this->assign('info',$info);
        return $this->fetch();
    }
}