<?php

namespace app\index\controller;

use think\Controller;
use think\Request;
use Think\Db;

class Search extends Common
{
    /**
     * 显示资源列表
     *
     * @return \think\Response
     */
    public function index()
    {
        if(request()->isPost()){
            $keywords = input('post.');
            $keywords = $keywords['keywords'];
        }
        if(!empty($keywords)){
            $res = Db::name('article')
                ->where('title','like','%'.$keywords.'%')
                ->select();
            $count = count($res);
            $data = Db::name('article')
                ->where('title','like','%'.$keywords.'%')
                ->field('id,title,cid,desc,thumb,author,addtime,click_num,cmt_count')
                ->order(['id'=>'desc'])
                ->paginate(10,$count);
            $this->assign([
                'keyWords'=>$keywords,
                'data'=>$data,
            ]);
            if($count>0){
                return view();
            }else{
                $this->error('搜索无数据');
            }
        }else{
            $this->error('请输入关键词');
        }

    }

    /**
     * 关键词搜素 显示 id号  不显示汉字
     */
    public function tags($keywords)
    {
        if(!empty($keywords)){
            $tdata=Db::name('tags')
                ->where('id',$keywords)
                ->field('id,tname')
                ->find();
            $res = Db::name('article')
                ->where('title','like','%'.$tdata['tname'].'%')
                ->select();
            $count = count($res);
            $data = Db::name('article')
                ->where('title','like','%'.$tdata['tname'].'%')
                ->field('id,title,cid,desc,thumb,author,addtime,click_num,cmt_count')
                ->order(['id'=>'desc'])
                ->paginate(10,$count);
            $this->assign([
                'keyWords'=>$keywords,
                'data'=>$data,
            ]);
            if($count>0){
                return view();
            }else{
                $this->error('搜索无数据');
            }
        }else{
            $this->error('请输入关键词');
        }

    }

}
