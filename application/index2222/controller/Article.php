<?php

namespace app\index\controller;

use think\Controller;
use think\Request;
use Think\Db;

class Article extends Common
{
    /**
     * 显示资源列表
     *
     * @return \think\Response
     */
    public function index($id)
    {
        //获取当前文章信息
        $articleData=Db::name('article')
            ->where('id',$id)
            ->field('id,cid,title,content,author,addtime,click_num,cmt_count,keyword,desc')
            ->find();

        //获取标签名称
        $keywords_id = explode(",",$articleData['keyword']);
        $keywords=[];
        foreach ($keywords_id as $k => $v){
            $a=Db::name('tags')
                ->where('id',$v)
                ->field('id,tname')
                ->find();
            array_push($keywords,$a);
        }
        $articleData['keyword'] = $keywords;
        //面包屑导航
        $position = $this->position($articleData['cid']);
        //上一篇
        $front=Db::name('article')
            ->where("id<".$id)
            ->order('id desc')
            ->limit('1')
            ->find();
        //下一篇
        $after=Db::name('article')
            ->where("id>".$id)
            ->order('id asc')
            ->limit('1')
            ->find();
        $this->assign([
            'articleData'=>$articleData,
            'position'=>$position,
            'front'=>$front,
            'after'=>$after,
            'keyData'=>$articleData['keyword']
        ]);
        return view();
    }

    /**
     * 显示创建资源表单页.
     *
     * @return \think\Response
     */
    public function commont_add()
    {
        if(request()->isPost()){
            $keywords = input('post.');
            p($keywords);
        }
    }

    /**
     * 保存新建的资源
     *
     * @param  \think\Request  $request
     * @return \think\Response
     */
    public function save(Request $request)
    {
        //
    }

    /**
     * 显示指定的资源
     *
     * @param  int  $id
     * @return \think\Response
     */
    public function read($id)
    {
        //
    }

    /**
     * 显示编辑资源表单页.
     *
     * @param  int  $id
     * @return \think\Response
     */
    public function edit($id)
    {
        //
    }

    /**
     * 保存更新的资源
     *
     * @param  \think\Request  $request
     * @param  int  $id
     * @return \think\Response
     */
    public function update(Request $request, $id)
    {
        //
    }

    /**
     * 删除指定资源
     *
     * @param  int  $id
     * @return \think\Response
     */
    public function delete($id)
    {
        //
    }
}
