<?php
/**
 * Created by PhpStorm.
 * User: zhaoxu
 * Date: 2018/11/9
 * Time: 9:38
 */
namespace app\index\controller;

use think\Request;
use think\Session;
use think\Validate;

class Member extends Common
{
    /**
     * 会员登录
     */
    public function login(Request $request){
        if ($request->isPost()){
            $form_data['username'] = trim($request->param('user_info'));
            $form_data['password'] = trim($request->param('pwd_info'));
            //数据校验
            $rules = [
                'username'  =>  'require',
                'password'  =>  'require',
            ];
            $msg = [
                'username.require'  =>  '用户名必填',
                'password.require'  =>  '密码必填',
            ];
            $validate = new Validate($rules,$msg);
            if (!$validate->batch()->check($form_data)){
                //验证失败,获取错误信息
                $errorinfo = $validate->getError();
                return ['status' => 'failure','errorinfo' => implode(',',$errorinfo)];
            }
            $result = db('member')->where('username',$form_data['username'])
                        ->where('password',md5($form_data['password']))
                        ->find();
            if ($result){
                Session::set('username',$form_data['username']);
                return ['status'=>'success'];
            }else{
                return ['status'=>'failure','errorinfo'=>'用户名和密码错误'];
            }
        }
        return $this->fetch();
    }

    /**
     * @param Request $request
     * @return array|mixed
     * 会员注册
     */
    public function register(Request $request){
        if ($request->isPost()){
            //获取表单提交数据
            $form_data['username'] = trim($request->param('info_user'));
            $password = trim($request->param('info_pwd'));
            $password2 = trim($request->param('info_pwd2'));
            if ($password !== $password2){
                return ['status'=>'failure','errorinfo'=>'两次输入的密码不同'];
            }

            $form_data['password'] = md5($password);
            $form_data['telnum'] = trim($request->param('info_tel'));
            $form_data['email'] = trim($request->param('info_email'));

            $user_info_res = db('member')->where('username',$form_data['username'])->find();
            if ($user_info_res !== null){
                return ['status'=>'failure','errorinfo'=>'用户名已存在'];
            }
            //数据校验
            $rules = [
                'username'  =>  'require|max:25',
                'password'  =>  'require',
                'email'     =>  'email'
            ];
            $msg = [
                'username.require'  =>  '用户名必填',
                'username.max'  =>  '用户名最长不能超过25个字符',
                'password.require'  =>  '密码必填',
                'email'  =>  '邮箱格式错误',
            ];
            $validate = new Validate($rules,$msg);
            if ($validate->batch()->check($form_data)){
                //验证通过,添加数据
                $result = db('member')->insert($form_data);
                if ($result){
                    Session::set('username',$form_data['username']);
                    return ['status'=>'success','session_user'=>Session::get('username')];
                }else{
                    return ['status'=>'failure','errorinfo'=>'添加失败,请联系管理员'];
                }
            }else{
                //验证失败,获取错误信息
                $errorinfo = $validate->getError();
                return ['status' => 'failure','errorinfo' => implode(',',$errorinfo)];
            }
        }
        return $this->fetch();
    }

    /**
     * 会员退出登录
     */
    public function logout(){
        Session::clear();
        $this->redirect("/");
    }
}