<?php

namespace app\admin\controller;

use think\Controller;
use think\Request;
use app\admin\model\Tags as TagsModel;

class Tags extends Common
{
    /**
     * 显示资源列表
     *
     * @return \think\Response
     */
    public function index()
    {
        $tags_data=TagsModel::order('sort Desc,id Asc')->select();
        $this->assign('data',$tags_data);
        return view();
    }

    /**
     * 显示创建资源表单页.
     *
     * @return \think\Response
     */
    public function add()
    {
        if(request()->isPost()){
            $data = input('post.');
            $result = TagsModel::create($data);
            if($result){
                $this->success("标签添加成功");
            }
        }
        //
        return view();
    }


    public function edit($id)
    {
        if(request()->isPost()){
            $data = input('post.');
            if(!isset($data['is_show'])){
                $data['is_show']=0;
            }
            //列新栏目数据
            if(TagsModel::where('id',$id)->update($data)){
                $this->success("更新成功",'tags/index');
            }
        }
        //获取当前标签信息
        $result=TagsModel::get($id);
        $this->assign('editData',$result);
        return view();
    }

    /**
     * 删除指定资源
     *
     * @param  int  $id
     * @return \think\Response
     */
    public function del($id)
    {
        if(TagsModel::destroy($id)){
            $this->success("删除成功",'tags/index');
        }
        $this->error("删除失败");
    }


    //处理异步数据
    public function setajax(){
        if(request()->isAjax()){
            $data=input('post.');
            $newdata=[];
            $newdata['id']=$data['id'];
            if($data['act']=="show"){
                $newdata['is_show']=$data['v'];
            }
            if($data['act']=="sort"){
                $newdata['sort']=$data['v'];
            }
            if(model('Tags')->update($newdata)){
                return json(1);
            }else{
                return json(0);
            }
        }
    }

}
