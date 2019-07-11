<?php

namespace app\admin\controller;

use think\Controller;
use think\Request;
use app\admin\model\Typelink as TypelinkModel;
class Typelink extends Common
{
    /**
     * 显示资源列表
     *
     * @return \think\Response
     */
    public function index()
    {
        $data=TypelinkModel::order('sort Desc,id Asc')->select();
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
            $result = TypelinkModel::create($data);
            if($result){
                $this->success("链接添加成功");
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
            if(TypelinkModel::where('id',$id)->update($data)){
                $this->success("更新成功",'typelink/index');
            }
        }
        //获取当前信息
        $result=TypelinkModel::get($id);
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
        if(TypelinkModel::destroy($id)){
            $this->success("删除成功",'typelink/index');
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
            if(model('Typelink')->update($newdata)){
                return json(1);
            }else{
                return json(0);
            }
        }
    }
}
