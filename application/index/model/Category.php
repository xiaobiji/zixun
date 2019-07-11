<?php
/**
 * Created by PhpStorm.
 * User: yifeng
 * Date: 2017/10/23
 * Time: 12:46
 */

namespace app\index\model;


use think\Model;

class Category extends Model
{
    //使用获取器取栏目类型
    public function getTypeAttr($value){
        $type=[
            1=>"<span class=\"layui-badge layui-bg-blue\">单页</span>",
            2=>"<span class=\"layui-badge\">摄影作品</span>",
            3=>"<span class=\"layui-badge layui-bg-cyan\">模特资料</span>",
            4=>"<span class=\"layui-badge layui-bg-green\">摄影场景</span>",
            5=>"<span class=\"layui-badge layui-bg-orange\">新闻资讯</span>",
            6=>"<span class=\"layui-badge layui-bg-red\">专业团队</span>",
            7=>"<span class=\"layui-badge layui-bg-black\">联系我们</span>"
        ];
        return $type[$value];
    }
    //获取栏目列表-不建议使用
    public static function getcategory($pid=0,$level=-1){
        $res=self::where('pid',$pid)->select();
        static $arr=array();
        $level+=1;//$lelve=$level+1;
        if($level==0){
            $str="";
        }else{
            $str="|";
        }
        foreach ($res as $v){
            $tmp_arr=array();
            $tmp_arr['id']=$v['id'];
            $tmp_arr['name']=$str.str_repeat("----",$level).$v['name'];
            $tmp_arr['pid']=$v['pid'];
            $arr[]=$tmp_arr;
            self::getcategory($v['id'],$level);
        }
        return $arr;
    }

    //获取栏目列表-优化

    /**
     * @param $data 包含 所有栏目分类的数组
     * @param int $pid  上级栏目标识
     * @param int $level 层级数
     * @return array
     */
    public static function getcateall($data,$pid=0,$level=-1){
            //$res=self::where('pid',$pid)->select();
            static $arr=array();
            $level+=1;//$lelve=$level+1;
            if($level==0){
                $str="";
            }else{
                $str="|";
            }
            foreach ($data as $v){
                if($pid==$v['pid']){
                    $tmp_arr=array();
                    $tmp_arr['id']=$v['id'];
                    $tmp_arr['name']=$str.str_repeat("----",$level).$v['name'];
                    $tmp_arr['pid']=$v['pid'];
                    $tmp_arr['sort']=$v['sort'];
                    $tmp_arr['type']=$v['type'];
                    $tmp_arr['typeid']=$v->getData('type');
                    $arr[]=$tmp_arr;
                    self::getcateall($data,$v['id'],$level);
                    unset($v);
                }

            }
            return $arr;
    }


    //获取栏目列表-引用方式

    /**
     * @param $data 包含 所有栏目分类的数组
     * @param int $pid  上级栏目标识
     * @param int $level 层级数
     * @return array
     */
    public static function getcate($data,$pid=0,$level=-1,&$arr=[]){
        //$res=self::where('pid',$pid)->select();
        //static $arr=array();
        $level+=1;//$lelve=$level+1;
        if($level==0){
            $str="";
        }else{
            $str="|";
        }
        foreach ($data as $v){
            if($pid==$v['pid']){
                $tmp_arr=array();
                $tmp_arr['id']=$v['id'];
                $tmp_arr['name']=$str.str_repeat("----",$level).$v['name'];
                $tmp_arr['pid']=$v['pid'];
                $arr[]=$tmp_arr;
                self::getcate($data,$v['id'],$level,$arr);
                unset($v);
            }

        }
    }
    //栏目排序
    public static function sort($data){
        foreach ($data as $id=>$sort){
            self::where('id',$id)->update(['sort'=>$sort]);
        }
        return true;
    }
    //获取子栏目id,包含自身ID
    public static function getchildids($id){
        $res=self::where('pid',$id)->field('id')->select();
        static $arr=array();
        foreach ($res as $v){
            $arr[]=$v['id'];
            self::getchildids($v['id']);
        }
        return $arr;
    }
}