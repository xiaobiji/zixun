<?php
/**
 * Created by PhpStorm.
 * User: zhaoxu
 * Date: 2018/11/6
 * Time: 13:26
 */
namespace app\index\controller;

use think\Db;

class Service extends Common
{
    public function index(){
        //获取产品服务文章信息
        $cid = db('category')->where('mark','zuopin')->field('id')->find();
        $res = Db::name('article')->alias('a')
            ->join('pics b','b.aid=a.id')
            ->where('a.cid',$cid['id'])
            ->field('a.id,a.title,a.desc,a.content,b.pic')
            ->paginate(5);
        $page = $res->render();
        $info = array();
        //只取一张图片
        foreach ($res as $k=>$v){
            $info[$v['id']] = $v;
        }
        $this->assign('serinfo',$info);
        $this->assign('page',$page);
        return $this->fetch();
    }
    //产品详情页
    public function detail(){
        $aid = request()->param('id');
        //产品详情
        $info = db('article')->where('id',$aid)
            ->field('id,title,desc,content')
            ->find();
        //产品图片
        $pics = db('pics')->where('aid',$info['id'])->column('pic');
        $this->assign('pics',$pics);
        $this->assign('info',$info);
        return $this->fetch();
    }
}