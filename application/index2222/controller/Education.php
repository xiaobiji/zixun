<?php
/**
 * Created by PhpStorm.
 * User: zhaoxu
 * Date: 2018/11/7
 * Time: 10:47
 */
namespace app\index\controller;


class Education extends Common
{
    public function index(){
        //获取教育培训栏目信息
        $cid = db('category')->where('mark','jiaoyu')->field('id')->find();
        $res = db('article')->alias('a')
            ->join('pics b','a.id=b.aid')
            ->where('cid',$cid['id'])
            ->group('a.id')
            ->field('a.id,a.title,a.desc,a.content,b.pic')
            ->paginate(12);
        $page = $res->render();
        $this->assign('page',$page);
        $this->assign('info',$res);
        return $this->fetch();
    }

    /**
     * 教育培训详情页
     */
    public function detail(){
        $aid = request()->param('id');
        if (empty($aid)){
            $this->redirect('index/education/index');
        }
        //上一篇
        $cid = db('article')->where('id',$aid)->field('cid')->find();
        $front = db('article')->where('cid',$cid['cid'])->where('id','<',$aid)->field('id,title')->find();
        $this->assign('front',$front);

        //下一篇
        $after = db('article')->where('cid',$cid['cid'])->where('id','>',$aid)->field('id,title')->find();
        $this->assign('after',$after);

        $res = db('article')->where('id',$aid)->field('title,addtime,author,views,content')->find();
        $this->assign('info',$res);
        return $this->fetch();
    }
}