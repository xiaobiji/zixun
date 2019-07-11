<?php
namespace app\index\controller;

use think\Db;

class Index extends Common
{
    public function index()
    {
        $banner=$this->getbanner();
        $about=$this->getabout();
        $zuopin=$this->getzuopin();
        $huoban=$this->gethuoban();
        $case = $this->getCase();
        $articles = $this->getnewarticle();
        $res_pid = db('category')->where('mark','xinwen')->field('id')->find();
        $news_id = db('category')->where('pid',$res_pid['id'])->field('id,name')->select();;
        if(!empty($news_id[0])){
            //查询子栏目文章页
            $news_one_info = db('article')->alias('a')
                ->join('pics b','b.aid=a.id')
                ->where('a.cid',$news_id[0]['id'])
                ->order('a.id desc')
                ->field('a.id,a.title,a.desc,a.content,a.addtime,b.pic')
                ->select();
            $this->assign('news_one_info' ,$news_one_info);
        }
        if (!empty($news_id[1])) {
            $news_two_info = db('article')->alias('a')
            ->join('pics b','b.aid=a.id')
            ->where('a.cid',$news_id[1]['id'])
            ->order('a.id desc')
            ->field('a.id,a.title,a.desc,a.content,a.addtime,b.pic')
            ->select();
            $this->assign('news_two_info' ,$news_two_info);
        }

        $this->assign([
            'banner'=>$banner,
            'about'=>$about,
            'articles'=>$articles,
            'zuopin'=>$zuopin,
            'huoban'=>$huoban,
            'case'  =>$case,
            'news_after_name'=>$news_id
        ]);
        return view();
    }
    //获取关于我们
    private function getabout(){
        $res=db('category')->where('mark','about')->field('content')->find();
        return $res['content'];
    }
    //获取轮播图
    private function getbanner(){
        $res=db('banner')->where('isshow',1)->order('sort ASC')->field('title,pic,url')->select();
        return $res;
    }

    /**
     * lee添加首页获取所有文章,按照发布时间排序
     */
    private function getnewarticle($num='10'){
        $res=Db::name('article')
            ->field('id,title,desc,thumb,author,addtime')
            ->select();
        $count = count($res);
        $data = Db::name('article')->paginate($num,$count);
        return $data;
    }

    //获取产品服务栏目信息
    private function getzuopin(){
        $res_pid=db('category')->where('mark','zuopin')->field('id')->find();
        $res = Db::name('article')->alias('a')
                ->join('pics b','b.aid=a.id')
                ->where('a.cid',$res_pid['id'])
                ->field('a.id,a.title,a.desc,b.pic')
                ->select();
        $info = array();
        //只取一张图片
        foreach ($res as $k=>$v){
            $info[$v['id']] = $v;
        }
        return $info;
    }
    

    //获取工程案例信息
    private  function getCase(){
        $res_pid = db('category')->where('mark','gongcheng')->field('id')->find();
        $res = db('article')->alias('a')
            ->join('pics b','b.aid=a.id')
            ->where('a.cid',$res_pid['id'])
            ->field('a.id,a.title,a.desc,a.content,b.pic')
            ->select();
        return $res;
    }
    //获取合作伙伴
    private function gethuoban(){
        $res_pid=db('category')->where('mark','huoban')->field('id')->find();
        $res=db('article')->alias('a')
            ->join('pics b','b.aid=a.id')
            ->where('a.cid',$res_pid['id'])
            ->order('a.id desc')
            ->field('a.title,a.content,b.pic')
            ->select();
        return $res;
    }
}
