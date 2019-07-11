<?php

namespace app\index\controller;

use think\Controller;
use think\Request;
use Think\Db;

class Category extends Common
{
    /**
     * 显示资源列表
     *
     * @return \think\Response
     */
    public function index($id)
    {
        $articles = $this->getArticles(10,$id);
        $cateData = $this->getCate($id);
        $childCate = $this->getChildCate($id);
        //面包屑导航
        $position = $this->position($id);
        $this->assign([
            'cateData'=>$cateData,
            'childCate'=>$childCate,
            'articles'=>$articles,
            'position'=>$position,
        ]);
        return view();
    }
    /**
     * lee获取当前栏目信息
     */
    private function getCate($id){
        $data=Db::name('category')
            ->where('id',$id)
            ->field('id,name,keyword,desc')
            ->find();
        return $data;
    }

    /**
     * lee获取当前栏目下子级栏目信息
     */
    private function getChildCate($id){
        $data=Db::name('category')
            ->where('pid',$id)
            ->field('id,name,keyword,desc')
            ->select();
        return $data;
    }
    /**
     * lee获取栏目页文章,按照发布时间排序
     */
    private function getArticles($num='10',$id){
        $res=Db::name('article')
            ->where('cid',$id)
            ->field('id,title,cid,desc,thumb,author,addtime')
            ->select();
        $count = count($res);
        $data = Db::name('article')
            ->where('cid',$id)
            ->field('id,title,cid,desc,thumb,author,addtime,click_num,cmt_count')
            ->paginate($num,$count);
        return $data;
    }
}
