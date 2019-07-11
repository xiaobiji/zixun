<?php

namespace app\index\controller;

use think\Controller;
use think\Request;
use app\index\model\Notice as NoticeMoble;
class Notice extends Common
{
    /**
     * 显示资源列表
     *
     * @return \think\Response
     */
    public function index()
    {
        $data=NoticeMoble::order('sort Desc,id Asc')->select();
        foreach ($data as $k=>$v){
            $data[$k]['show_time'] = date("Y-m-d H:i:s",$v['show_time']);
        }
        $this->assign('data',$data);
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
            $data['show_time']=strtotime($data['show_time']);
            $result = NoticeMoble::create($data);
            if($result){
                $this->success("公告添加成功");
            }
        }
        //
        return view();
    }

    /**
     * 显示编辑资源表单页.
     *
     * @param  int  $id
     * @return \think\Response
     */
    public function edit($id)
    {
        if(request()->isPost()){
            $data = input('post.');
            if(!isset($data['is_show'])){
                $data['is_show']=0;
            }
            $data['show_time']=strtotime($data['show_time']);
            //列新栏目数据
            if(NoticeMoble::where('id',$id)->update($data)){
                $this->success("更新成功",'notice/index');
            }
        }
        //获取当前标签信息
        $result=NoticeMoble::get($id);
        $result['show_time']=date("Y-m-d H:i:s",$result['show_time']);
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
        if(NoticeMoble::destroy($id)){
            $this->success("删除成功",'notice/index');
        }
        $this->error("删除失败");
    }

    //处理异步数据
    public function setajax(){
        if(request()->isAjax()){
            $data=input('post.');
            $newdata=[];
            $newdata['id']=$data['id'];
            if($data['act']=="sort"){
                $newdata['sort']=$data['v'];
            }
            if(model('Notice')->update($newdata)){
                return json(1);
            }else{
                return json(0);
            }
        }
    }

}
