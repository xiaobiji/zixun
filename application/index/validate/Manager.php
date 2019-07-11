<?php
/**
 * Created by PhpStorm.
 * User: yifeng
 * Date: 2017/10/8
 * Time: 23:54
 */

namespace app\index\validate;


use think\Validate;

class Manager extends Validate
{
    protected $rule =   [
//        'account'  => 'require|min:4|unique:manager',
        'account'  => 'require|unique:manager',
//        'password'   => 'require|min:6|confirm:repassword',
        'password'   => 'require|confirm:repassword',
        'code'  =>'require|captcha'
    ];
    protected $message  =   [
        'account.require' => '账号不能为空',
//        'account.min' => '账号长度不合法',
        'account.unique'     => '账号已存在',
        'password.require'   => '密码不能为空',
//        'password.min'  => '密码长度不能小于6位',
        'password.confirm'        => '两次密码输入不一致',
        'code.require'  =>'验证码不能为空',
        'code.captcha' =>'验证码输入不正确'
    ];
    protected $scene = [
        'add'   =>['account','password'],
        'edit'  =>  ['password'],
//        'login' =>['account'=>'require|min:4','password'=>'require|min:6','code'],
        'login' =>['account'=>'require','password'=>'require','code'],
        'xiaoshou_add' =>['account']
    ];
}