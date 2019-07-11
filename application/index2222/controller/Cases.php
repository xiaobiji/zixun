<?php
/**
 * Created by PhpStorm.
 * User: zhaoxu
 * Date: 2018/11/6
 * Time: 14:13
 */
namespace app\index\controller;


class Cases extends Common
{
    //工程案例首页
    public function index(){
        $res_pid = db('category')->where('mark','gongcheng')->field('id')->find();
        $res = db('article')->alias('a')
            ->join('pics b','b.aid=a.id')
            ->where('a.cid',$res_pid['id'])
            ->field('a.id,a.title,a.desc,a.content,a.addtime,b.pic')
            ->paginate(12);
        $page = $res->render();
        $this->assign('caseinfo',$res);
        $this->assign('page',$page);
        return $this->fetch();
    }
    //工程案例详情页
    public function detail(){
        $aid = request()->param('id');
        //上一篇
        $cid = db('article')->where('id',$aid)->field('cid')->find();
        $front = db('article')->where('cid',$cid['cid'])->where('id','<',$aid)->field('id,title')->limit(1)->find();
        $this->assign('front',$front);

        //下一篇
        $after = db('article')->where('cid',$cid['cid'])->where('id','>',$aid)->field('id,title')->limit(1)->find();
        $this->assign('after',$after);
        $get_news_byid = db('article')->where('id',$aid)->order('id desc')->field('title,author,views,content,addtime')->find();
        $this->assign('detail',$get_news_byid);
        return $this->fetch();
    }
}