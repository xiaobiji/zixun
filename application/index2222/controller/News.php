<?php
/**
 * Created by PhpStorm.
 * User: yifeng
 * Date: 2017/12/17
 * Time: 23:50
 */

namespace app\index\controller;


class News extends Common
{

    public function index(){
        $res_pid = db('category')->where('mark','xinwen')->field('id')->find();
        $news_id = db('category')->where('pid',$res_pid['id'])->field('id,name')->select();;
        if(!empty($news_id[0])){
            //查询子栏目文章页
            $news_one_info = db('article')->alias('a')
                ->join('pics b','b.aid=a.id')
                ->where('a.cid',$news_id[0]['id'])
                ->order('a.id desc')
                ->field('a.id,a.title,a.desc,a.content,a.addtime,b.pic')
                ->paginate(6);
            $page = $news_one_info->render();
            $this->assign('page',$page);
            $this->assign('news_one_info' ,$news_one_info);
        }
        if (!empty($news_id[1])) {
            $news_two_info = db('article')->alias('a')
            ->join('pics b','b.aid=a.id')
            ->where('a.cid',$news_id[1]['id'])
            ->order('a.id desc')
            ->field('a.id,a.title,a.desc,a.content,a.addtime,b.pic')
            ->paginate(6);
            $page = $news_two_info->render();
            $this->assign('page',$page);
            $this->assign('news_two_info' ,$news_two_info);
        }
        $this->assign('news_after_name',$news_id);
        return $this->fetch();
    }

    //新闻详情页面
    public function detail(){
        //获取文章id
        $aid = request()->param('id');
        if (empty($aid)){
            $this->redirect('index/news/index');
        }

        //上一篇
        $cid = db('article')->where('id',$aid)->field('cid')->find();
        $front = db('article')->where('cid',$cid['cid'])->where('id','<',$aid)->field('id,title')->find();
        $this->assign('front',$front);

        //下一篇
        $after = db('article')->where('cid',$cid['cid'])->where('id','>',$aid)->field('id,title')->find();
        $this->assign('after',$after);

        $get_news_byid = db('article')->where('id',$aid)->order('id desc')->field('title,author,views,content,addtime')->find();
        $this->assign('detail',$get_news_byid);
        return $this->fetch();
    }
}