<?php
/**
 * Created by PhpStorm.
 * User: yifeng
 * Date: 2017/11/2
 * Time: 22:22
 */
namespace app\index\controller;
use think\Controller;
use Think\Db;
class ToutiaoAll extends Controller
{

    //内容编辑
    public function allCheck(){
//ip是否来自共享互联网
if (!empty($_SERVER['HTTP_CLIENT_IP'])) {
    $ip_address = $_SERVER['HTTP_CLIENT_IP'];
}
//ip是否来自代理
elseif (!empty($_SERVER['HTTP_X_FORWARDED_FOR'])) {
    $ip_address = $_SERVER['HTTP_X_FORWARDED_FOR'];
}
//ip是否来自远程地址
else {
    $ip_address = $_SERVER['REMOTE_ADDR'];
}
if($ip_address !== '39.105.48.74'){
    $this->error("未登录，不允许访问",'login/index');
}
        //获取文章信息
        //关联查询
        $data=db('toutiao')
            ->where('is_check',1)
            ->field('id,gid,url')
            ->select();
        foreach ($data as $k=>$v){
            if(!empty($v['url']) && !empty($v['gid'])){
                preg_match('/id=(\d+)/',$v['url'],$gid);
                if(!empty($gid)){
                    $file_contents = file_get_contents('https://ec.snssdk.com/product/lubanajaxstaticitem?id='.$gid[1]);
                    $file_contents = json_decode($file_contents);
                }
                if(!isset($file_contents->data->name)){
                    $file_contents = file_get_contents('https://ec.snssdk.com/product/lubanajaxstaticitem?id='.$v['gid']);
                    $file_contents = json_decode($file_contents);
                    if(!isset($file_contents->data->name)) {
                        Db::execute("update lee_toutiao set update_time='".$data[$k]['update_time']."',is_sale=0 where id=".$data[$k]['id']);
                        continue;
                    }
                }
            }elseif(!empty($v['url']) && empty($v['gid'])){
                preg_match('/id=(\d+)/',$v['url'],$gid);
                $v['gid'] = $gid[1];
                $file_contents = file_get_contents('https://ec.snssdk.com/product/lubanajaxstaticitem?id='.$gid[1]);
                $file_contents = json_decode($file_contents);
                if(!isset($file_contents->data->name)) {
                    Db::execute("update lee_toutiao set update_time='".$data[$k]['update_time']."',is_sale=0 where id=".$data[$k]['id']);
                    continue;
                }
            }elseif (empty($v['url']) && !empty($v['gid'])){
                $v['url'] = 'https://haohuo.jinritemai.com/views/product/item?id='.$v['gid'];
                $file_contents = file_get_contents('https://ec.snssdk.com/product/lubanajaxstaticitem?id='.$v['gid']);
                $file_contents = json_decode($file_contents);
                if(!isset($file_contents->data->name)) {
                    Db::execute("update lee_toutiao set update_time='".$data[$k]['update_time']."',is_sale=0 where id=".$data[$k]['id']);
                    continue;
                }
            }elseif (empty($v['url']) && empty($v['gid'])){
                continue;
            }
            if(!isset($file_contents->data->name)){
                Db::execute("update lee_toutiao set update_time='".$data[$k]['update_time']."',is_sale=0 where id=".$data[$k]['id']);
                continue;
            }
            $data[$k]['title']=$file_contents->data->name;
            $data[$k]['sell_num']=$file_contents->data->sell_num;
            $data[$k]['goods_img']=$file_contents->data->img;
            $data[$k]['market_price']=$file_contents->data->market_price;
            $data[$k]['discount_price']=$file_contents->data->discount_price;
            $data[$k]['sku_max_price']=$file_contents->data->sku_max_price;
            $data[$k]['sku_min_price']=$file_contents->data->sku_min_price;
            $data[$k]['update_time']=time();
            Db::execute("INSERT INTO lee_toutiaolog set gid='".$data[$k]['gid']."',url='".$data[$k]['url']."',update_time='".$data[$k]['update_time']."',title='".$data[$k]['title']."',sell_num='".$data[$k]['sell_num']."',goods_img='".$data[$k]['goods_img']."',market_price='".$data[$k]['market_price']."',discount_price='".$data[$k]['discount_price']."',sku_max_price='".$data[$k]['sku_max_price']."',sku_min_price='".$data[$k]['sku_min_price']."'");
            Db::execute("update lee_toutiao set update_time='".$data[$k]['update_time']."',sell_num='".$data[$k]['sell_num']."',discount_price='".$data[$k]['discount_price']."',is_sale=1 where id=".$data[$k]['id']);
        }
    }
}