<?php
/**
 * Created by PhpStorm.
 * User: yifeng
 * Date: 2017/11/2
 * Time: 21:51
 */

namespace app\index\model;


use think\Model;

class Article extends Model
{
    protected static function init(){
        //添加之后
        self::afterInsert(function ($data) {
            if($data['pic']!=''){
                //拆分图片地址
                $arr_tmp=explode(',',$data['pic']);
                //获取新增文章id
                $aid=model('Article')->id;
                $thum=[];
                foreach ($arr_tmp as $v){
                    $thum[]=['aid'=>$aid,'pic'=>$v];
                }
                db('pics')->insertAll($thum);
            }
        });
        //更新之后
        self::afterUpdate(function ($data) {
            if($data['pic']!=''){
                //拆分图片地址
                $arr_tmp=explode(',',$data['pic']);
                //获取新增文章id
                $aid=input('id');
                $thum=[];
                foreach ($arr_tmp as $v){
                    $thum[]=['aid'=>$aid,'pic'=>$v];
                }
                db('pics')->insertAll($thum);
            }
        });
        //删除之后
        self::afterDelete(function ($data) {
            $aid=$data['id'];
            $res=db('pics')->where('aid',$aid)->select();
            if($res){//如果有对应的图片，图片文件的删除
                foreach ($res as $v){
                    $file=ROOT_PATH ."\\public\\".$v['pic'];
                    if(file_exists($file)){
                        @unlink($file);
                    }
                }
                db('pics')->where('aid',$aid)->delete();
            }
        });
    }
}