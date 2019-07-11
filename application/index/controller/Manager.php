<?php
/**
 * Created by PhpStorm.
 * User: yifeng
 * Date: 2017/10/5
 * Time: 23:30
 */

namespace app\index\controller;

class Manager extends Common
{
//    管理员列表
    public function index(){
        $res=db('manager')->paginate(10);
        $this->assign('manager',$res);
        return view();
    }
//    添加管理员
    public function add()
    {
        if(request()->isPost()){
            $data=input('post.');
            $validate=validate('Manager');//实例化验证器
            //数据验证
            if(!$validate->scene('add')->check($data)){
                $this->error($validate->getError(),'add','',1);
                return;
            }
//            验证通过，数据写入数据库
            unset($data['repassword']);
            $data['password']=md5($data['password']);
            if(db('manager')->insert($data)){
                $this->success("管理员添加成功",'add','',1);
            }else{
                $this->error("数据添加异常",'add');
            }
            return;
        }
        return view();
    }
//编辑管理员
    public function edit($id){//使用了方法的参数绑定
        //管理员编辑的核心代码部分
        if(request()->isPost()){
            $data=input('post.');
//            验证提交来的数据是否有管理账号，如果有直接销毁
            if(isset($data['account'])){
                unset($data['account']);
            }
            //密码验证部分
            if(!$data['password']){//密码为空时，不需要更新密码字段
                unset($data['password']);//删除$data中的password
                unset($data['repassword']);//同上
            }else{//密码不为空时，对密码进行后端次验证
                $validate=validate('Manager');
                if(!$validate->scene('edit')->check($data)){//使用验证器场景验证来验证密码
                    $this->error($validate->getError());
                }
                unset($data['repassword']);//删除确认密码字断
                $data['password']=md5($data['password']);//md5加密
            }
            //超级管理员不允许锁定
            if($data['state']==0 && $id==1){
                $this->error("超级管理员不允许锁定！");
            }
            //以上验证都通过后继续向下执行
            $result=db('manager')->where('id',$id)->update($data);//更新数据
            if(!$result){
                $this->error("管理员修改失败");
            }
            $this->success("管理员修改成功",'manager/index');
            return;
        }
        $res=db('manager')->where('id',$id)->field('account,state')->find();
        $this->assign('manager',$res);
        return view();
    }
//管理删除
    public function del($id){//参数绑定
        //假定id为1的管理员为超级管理员
        if($id==1){
            $this->success('超级管理员不允许删除','manager/index');
        }
        $result=db('manager')->where('id',$id)->delete();
        if($result){
            $this->success('删除成功','manager/index');
        }else{
            $this->success('删除失败','manager/index');
        }
    }

//    管理员密码修改
    public function setpass(){
        if(request()->isPost()){
            $data=input('post.');
            $validate=validate('Manager');//实验化验证器类
            //验证器场景验证
            if(!$validate->scene('edit')->check($data)){
                $this->error($validate->getError());
            }
            $res=db('manager')->field('password')->find(session('loginid','','index'));
            if(md5($data['oldpassword'])!=$res['password']){
                $this->error('旧密码输入不正确');
            }
            $result=db('manager')->where('id',session('loginid','','index'))->setField('password',md5($data['password']));
            if(!$result){
                $this->error("密码修改失败！");
            }
            $this->success("密码修改成功");
            return;
        }
        return view();
    }
}