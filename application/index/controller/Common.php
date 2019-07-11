<?php
/**
 * Created by PhpStorm.
 * User: yifeng
 * Date: 2017/10/17
 * Time: 23:05
 */

namespace app\index\controller;


use think\Controller;
class Common extends Controller
{
    protected $user_id;
    protected $user_name;
   protected function _initialize()
   {
       parent::_initialize(); // 继承父类的初始化方法
       //登录状态验证
       if(!session('loginname', '', 'index') || !session('loginid', '', 'index')){
           $controller=request()->controller();//获取当前控制器
           $action=request()->action();//获取当前方法
           if($controller==="Index" && $action==="index"){
               $this->redirect('login/index');
           }
           $this->error("未登录，不允许访问",'login/index');
           //$this->redirect('login/index')
       }
       $this->user_id = $_SESSION['index']['loginid'];

       $this->user_name = $_SESSION['index']['loginname'];
       //获取网站配置信息
       $configRes=db('config')->find();
       $config=json_decode($configRes['config'],true);
       $this->assign('config',$config);
       $this->assign('admin',session('loginname','','index'));
   }

    /**
     * 栏目图片上传
     *
     */
    public function uploadimg(){
        //获得上传文件对像
        $file = request()->file('imgfile');
        //判断$file是不是文件对像
        if($file){
            $info = $file->move(ROOT_PATH . 'public' . DS . 'uploads');
            $imgpath="uploads\\" . $info->getSaveName();
            return json(['code'=>1,'msg'=>'上传成功','img'=>$imgpath]);
        }else{
            return json(['code'=>0,'msg'=>$file->getError()]);
        }

    }
    //单张图片删除

    /**
     * @param string $url  图片地址
     */
    public function delimg($url=""){
        if($url!=="" || !empty($url)){
            $file=ROOT_PATH."public\\".$url;
            if(file_exists($file)){
                $res=unlink($file);
                if($res){
                    //删除成功
                    $this->delpic($url);
                    return json(['code'=>1,'msg'=>"删除成功"]);
                }
                return json(['code'=>0,'msg'=>"删除失败"]);
            }
            $this->delpic($url);
            return json(['code'=>2,'msg'=>"文件不存在"]);
        }

    }

    //删除数据表中图片记录
    protected function delpic($url){
        $pic=db('pics')->where('pic',$url)->field('id')->find();
        if($pic){
            db('pics')->delete($pic['id']);
        }
    }
//判断是否为图片
    protected function isimgs($file){
        if($file){
            $imgs = ['.png','.jpeg','.gif','.jpg','.png'];
            $type = strrchr($file,'.');
            if(in_array($type,$imgs)){
                return true;
            }else{
                return false;
            }

        }
    }

    public function json($code=0,$arr=[],$msg=''){
        $data=[
            'code'=>$code,
            'data'=>$arr,
            'msg'=>$msg
        ];
        return $data;
    }
}