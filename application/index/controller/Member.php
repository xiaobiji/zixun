<?php
/**
 * Created by PhpStorm.
 * User: yifeng
 * Date: 2017/11/2
 * Time: 22:22
 */
namespace app\index\controller;
use think\Db;
use think\Lang;
use think\Request;
class Member extends Common
{

    //会员列表
    public function index(){
        $info = Db::name('member')->paginate(5);
        $page = $info->render();
        $this->assign('page',$page);
        $this->assign('userinfo',$info);
        return $this->fetch();
    }
    //根据会员id获取用户信息
    public function getUserById(Request $request){
        $uid = $request->get('uid');
        $info = Db::name('member')->where('id',$uid)->find();
        echo json_encode($info);
        exit;
    }
    //修改用户信息
    public function editUserInfo(Request $request){
        if ($request->isPost()){
            $arr = [];
            $arr['id'] = $request->post('uid');//["2", "wukong1", "悟空", "女", "12545669999", "741@qq.com", "海南", "关闭"]

            $arr['username'] = $request->post('uname');

            $arr['realname'] = $request->post('urname');
            switch ($request->post('usex')){
                case '男' :
                    $arr['sex'] = 0;
                    break;
                case '女' :
                    $arr['sex'] = 1;
                    break;
                case '保密' :
                    $arr['sex'] = 2;
                    break;
            }
            $arr['telnum'] = $request->post('utel');
            $arr['email'] = $request->post('uemail');
            $arr['addr'] = $request->post('uaddr');
            switch ($request->post('ustatus')){
                case '开启' :
                    $arr['mstatus'] = 0;
                    break;
                case '关闭' :
                    $arr['mstatus'] = 1;
                    break;
            }
            $result = Db::name('member')->update($arr);
            if ($result){
                echo json_encode(['status'=>'successful']);
            }else{
                echo json_encode(['status'=>'failure']);
            }
        }
    }
    //删除用户信息
    public function qyMemDel(){
        if (request()->isPost()){
            $uid = request()->post('id');
            $result = \app\index\model\Member::destroy($uid);
            if ($result){
                echo json_encode(['status'=>'successful']);
                exit;
            }else{
                echo json_encode(['status'=>'failure']);
                exit;
            }
        }
    }
}