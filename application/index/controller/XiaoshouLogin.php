<?php
namespace app\index\controller;
use think\Db;
use think\Lang;
use think\Controller;
class XiaoshouLogin extends Controller
{
    public function login($username='',$password='')
    {
        if (isset($_SERVER['HTTP_REFERER']) && $_SERVER['HTTP_REFERER'] == 'http://xiaoshou.huayu8.cn/SysLeft.php') {
                if(!empty($username)&&empty(!$password)){
                    $data['account'] = $username;
                    $data['password'] = $password;
                    //2.验证用户名在数据库中是否存在
                    $res=db('manager')->where('account',$data['account'])->find();
                    if(!$res){
                        $data['role_id']=0;
                        $data['state']=1;
                        if(db('manager')->insert($data)){
                            $userId = Db::name('manager')->getLastInsID();

                            p($userId);

                            session('loginname', $data['account'], 'index');
                            session('loginid', $userId, 'index');
                            $this->success("管理员登录成功",'index/index');
                        }else{
                            $this->error("管理员同步异常，请手动登录",'index/login');
                        }
                        return;
                    }else{
                        session('loginname', $res['account'], 'index');
                        session('loginid', $res['id'], 'index');
                        $this->success("管理员登录成功",'index/index');
                    }
//            验证通过，数据写入数据库
                }else{
                    $this->error("数据格式错误，请手动登录",'index/login');
                }
            }else{
                $this->error("打开方式错误，请手动登录",'index/login');
            }
    }
}
