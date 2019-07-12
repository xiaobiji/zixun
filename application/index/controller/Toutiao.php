<?php
/**
 * Created by PhpStorm.
 * User: yifeng
 * Date: 2017/11/2
 * Time: 22:22
 */
namespace app\index\controller;
use think\Lang;
use Think\Db;
use app\index\model\Toutiaolog;
class Toutiao extends Common
{
    //内容列表
    public function index($cid=null){
        //获取产品介绍列表信息
        $res=db('toutiao')
            ->order(['add_time'=>'desc'])
            ->paginate(12,false)
            ->each(function($item, $key){
                $item['market_price']=substr($item['market_price'], 0,-2).'.'.substr($item['market_price'], -2);
                $item['discount_price']=substr($item['discount_price'], 0,-2).'.'.substr($item['market_price'], -2);
                $item['sku_max_price']=substr($item['sku_max_price'], 0,-2).'.'.substr($item['market_price'], -2);
                $item['sku_min_price']=substr($item['sku_min_price'], 0,-2).'.'.substr($item['market_price'], -2);
                return $item;
            });

        $this->assign('list',$res);

        return $this->fetch();
    }

    //内容列表
    public function show($id){
        $r=db('toutiao')
            ->where('id',$id)
            ->field('id,gid,url')
            ->find();
        //获取产品介绍列表信息
        $res=db('toutiaolog')
            ->where(['gid'=>$r['gid']])
            ->order(['update_time'=>'desc'])
            ->paginate(12,false);
        $this->assign('list',$res);
        return $this->fetch();
    }
    //内容添加
    public function add(){
        if(request()->isPost()){
            $data=input('post.');
            if(isset($data['url']) && !empty($data['url'])){
                $urlarr = preg_split("/[\n\r]+/", $data['url'], -1, PREG_SPLIT_NO_EMPTY);
                $nodata='';
                $havedata='';
                foreach ($urlarr as $k=>$v){
                    $data = array();
                    preg_match('/id=(\d+)/',$v,$gid);
                    if(!empty($gid)) {
                        $file_contents = file_get_contents('https://ec.snssdk.com/product/lubanajaxstaticitem?id=' . $gid[1]);
                        $file_contents = json_decode($file_contents);

                        $data['url'] = $v;
                        $data['gid'] = $gid[1];
                        $result = Db::query('select id from lee_toutiao where gid = '.$data['gid']);
                        if($result){
                            $havedata.=$v. '</br>';
                            continue;
                        }
                        if(isset($file_contents->data->name)){
                            $data['title'] = $file_contents->data->name;
                            $data['sell_num'] = $file_contents->data->sell_num;
                            $data['goods_img'] = $file_contents->data->img;
                            $data['market_price'] = $file_contents->data->market_price;
                            $data['discount_price'] = $file_contents->data->discount_price;
                            $data['sku_max_price'] = $file_contents->data->sku_max_price;
                            $data['sku_min_price'] = $file_contents->data->sku_min_price;
                            $data['shop_name'] = $file_contents->data->shop_name;
                            $data['company_name'] = $file_contents->data->company_name;
                            $data['add_time'] = time();
                            $data['update_time'] = time();
                            Db::execute('insert into lee_toutiao (url,gid,title,sell_num,goods_img,market_price,discount_price,sku_max_price,sku_min_price,shop_name, company_name ,add_time,update_time) values ("'.$data['url'].'","'.$data['gid'].'","'.$data['title'].'","'.$data['sell_num'].'","'.$data['goods_img'].'","'.$data['market_price'].'","'.$data['discount_price'].'","'.$data['sku_max_price'].'","'.$data['sku_min_price'].'","'.$data['shop_name'].'","'.$data['company_name'].'","'.$data['add_time'].'","'.$data['update_time'].'")');

                            Db::execute('insert into lee_toutiaolog (url,gid,title,sell_num,goods_img,market_price,discount_price,sku_max_price,sku_min_price,shop_name, company_name ,add_time,update_time) values ("'.$data['url'].'","'.$data['gid'].'","'.$data['title'].'","'.$data['sell_num'].'","'.$data['goods_img'].'","'.$data['market_price'].'","'.$data['discount_price'].'","'.$data['sku_max_price'].'","'.$data['sku_min_price'].'","'.$data['shop_name'].'","'.$data['company_name'].'","'.$data['add_time'].'","'.$data['update_time'].'")');
                        }else{

                           $nodata .=$v . '</br>';
                        }
                    }
                }

                if($havedata){
                    echo $havedata .'</br>已存在,其余链接查询成功</br></br></br></br>';
                }
                if($nodata){
                    echo $nodata .'</br>查询不到数据,其余链接查询成功</br></br></br></br>';
                }
                if(!$havedata && !$nodata){
                    $this->success('查询成功');
                }
                exit;
            }else{
                $this->error('请输入要查询产品链接');
            }

            /**
             * 原来单条数据添加开始 开始

            if(!empty($data['url']) && !empty($data['gid'])){
                preg_match('/id=(\d+)/',$data['url'],$gid);
                if(!empty($gid)){
                    $file_contents = file_get_contents('https://ec.snssdk.com/product/lubanajaxstaticitem?id='.$gid[1]);
                    $file_contents = json_decode($file_contents);
                }
                if(!isset($file_contents->data->name)){
                    $file_contents = file_get_contents('https://ec.snssdk.com/product/lubanajaxstaticitem?id='.$data['gid']);
                    $file_contents = json_decode($file_contents);
                    if(!isset($file_contents->data->name)) {
                        $this->error('查询不到数据，请更换商品url或者商品id');
                    }
                }
            }elseif(!empty($data['url']) && empty($data['gid'])){
                preg_match('/id=(\d+)/',$data['url'],$gid);
                if(!empty($gid)){
                    $data['gid'] = $gid[1];
                    $file_contents = file_get_contents('https://ec.snssdk.com/product/lubanajaxstaticitem?id='.$gid[1]);
                    $file_contents = json_decode($file_contents);
                }
                if(!isset($file_contents->data->name)) {
                    $this->error('查询不到数据，建议尝试填写商品id查询');
                }
            }elseif (empty($data['url']) && !empty($data['gid'])){
                $data['url'] = 'https://haohuo.jinritemai.com/views/product/item?id='.$data['gid'];
                $file_contents = file_get_contents('https://ec.snssdk.com/product/lubanajaxstaticitem?id='.$data['gid']);
                $file_contents = json_decode($file_contents);
                if(!isset($file_contents->data->name)) {
                    $this->error('查询不到数据，建议尝试填写url查询');
                }
            }elseif (empty($data['url']) && empty($data['gid'])){
                $this->error('请输入查询数据');
            }
            if(!isset($file_contents->data->name)){
                $this->error('商品已下架或者查询不到数据');
            }
            $data['title']=$file_contents->data->name;
            $data['sell_num']=$file_contents->data->sell_num;
            $data['goods_img']=$file_contents->data->img;
            $data['market_price']=$file_contents->data->market_price;
            $data['discount_price']=$file_contents->data->discount_price;
            $data['sku_max_price']=$file_contents->data->sku_max_price;
            $data['sku_min_price']=$file_contents->data->sku_min_price;
            $data['shop_name']=$file_contents->data->shop_name;
            $data['company_name']=$file_contents->data->company_name;
            $data['add_time']=time();
            $data['update_time']=time();

            $result=model('Toutiao')->allowField(true)->save($data);
            model('Toutiaolog')->allowField(true)->save($data);
            Lang::set('Content addition success','商品查询成功','zh-cn');
            Lang::set('Content addition failure','商品添加失败','zh-cn');
            if(!$result){
                $this->error(lang('Content addition failure'));
            }
            $this->success(lang('Content addition success'));
            return;

            * 原来单条数据添加查询  结束
            */
        }
        return $this->fetch();
    }
    //内容编辑
    public function edit($id){
        //获取文章信息
        //关联查询
        $res=db('toutiao')
            ->where('id',$id)
            ->field('id,gid,url')
            ->find();

        if(request()->isPost()){
            $data=input('post.');
            if(!empty($data['url']) && !empty($data['gid'])){
                preg_match('/id=(\d+)/',$data['url'],$gid);
                if(!empty($gid)){
                    $file_contents = file_get_contents('https://ec.snssdk.com/product/lubanajaxstaticitem?id='.$gid[1]);
                    $file_contents = json_decode($file_contents);
                }
                if(!isset($file_contents->data->name)){
                    $file_contents = file_get_contents('https://ec.snssdk.com/product/lubanajaxstaticitem?id='.$data['gid']);
                    $file_contents = json_decode($file_contents);
                    if(!isset($file_contents->data->name)) {
                        $this->error('查询不到数据，请更换商品url或者商品id');
                    }
                }
            }elseif(!empty($data['url']) && empty($data['gid'])){
                preg_match('/id=(\d+)/',$data['url'],$gid);
                $data['gid'] = $gid[1];
                $file_contents = file_get_contents('https://ec.snssdk.com/product/lubanajaxstaticitem?id='.$gid[1]);
                $file_contents = json_decode($file_contents);
                if(!isset($file_contents->data->name)) {
                    $this->error('查询不到数据，建议尝试填写商品id查询');
                }
            }elseif (empty($data['url']) && !empty($data['gid'])){
                $data['url'] = 'https://haohuo.jinritemai.com/views/product/item?id='.$data['gid'];
                $file_contents = file_get_contents('https://ec.snssdk.com/product/lubanajaxstaticitem?id='.$data['gid']);
                $file_contents = json_decode($file_contents);
                if(!isset($file_contents->data->name)) {
                    $this->error('查询不到数据，建议尝试填写url查询');
                }
            }elseif (empty($data['url']) && empty($data['gid'])){
                $this->error('请输入查询数据');
            }
            if(!isset($file_contents->data->name)){
                $this->error('商品已下架或者查询不到数据');
            }
            $data['title']=$file_contents->data->name;
            $data['sell_num']=$file_contents->data->sell_num;
            $data['goods_img']=$file_contents->data->img;
            $data['market_price']=$file_contents->data->market_price;
            $data['discount_price']=$file_contents->data->discount_price;
            $data['sku_max_price']=$file_contents->data->sku_max_price;
            $data['sku_min_price']=$file_contents->data->sku_min_price;
            $data['shop_name']=$file_contents->data->shop_name;
            $data['company_name']=$file_contents->data->company_name;
            $data['add_time']=time();
            $data['update_time']=time();

            //更新内容信息
            model('Toutiao')->allowField(true)->save($data,['id' => $id]);
            model('Toutiaolog')->allowField(true)->save($data,['id' => $id]);
            $this->success("更新成功",'index');
        }

//        $res['keyword']=explode(",",$res['keyword']);
        $this->assign('edit_data',$res);
        return $this->fetch();
    }

    //内容编辑
    public function stopcheck($id){
        //获取文章信息
        //关联查询
        $data=db('toutiao')
            ->where('id',$id)
            ->field('is_check')
            ->find();
        $status ='更改成功';
        if($data['is_check']==1){
            model('Toutiao')->allowField(true)->save(['is_check'=>0],['id' => $id]);
            $status='已经开始监测';
        }else{
            model('Toutiao')->allowField(true)->save(['is_check'=>1],['id' => $id]);
            $status='已经停止监测';
        }
        $this->success($status);
    }


    //内容编辑
    public function check($id){
        //获取文章信息
        //关联查询
        $data=db('toutiao')
            ->where('id',$id)
            ->field('gid,url')
            ->find();
        if(!empty($data['url']) && !empty($data['gid'])){
            preg_match('/id=(\d+)/',$data['url'],$gid);
            if(!empty($gid)){
                $file_contents = file_get_contents('https://ec.snssdk.com/product/lubanajaxstaticitem?id='.$gid[1]);
                $file_contents = json_decode($file_contents);

            }
            if(!isset($file_contents->data->name)){
                $file_contents = file_get_contents('https://ec.snssdk.com/product/lubanajaxstaticitem?id='.$data['gid']);
                $file_contents = json_decode($file_contents);
                if(!isset($file_contents->data->name)) {
                    model('Toutiao')->allowField(true)->save(['is_sale'=>0],['id' => $id]);
                    $this->error('查询不到数据，请更换商品url或者商品id');
                }
            }
        }elseif(!empty($data['url']) && empty($data['gid'])){
            preg_match('/id=(\d+)/',$data['url'],$gid);
            $data['gid'] = $gid[1];
            $file_contents = file_get_contents('https://ec.snssdk.com/product/lubanajaxstaticitem?id='.$gid[1]);
            $file_contents = json_decode($file_contents);
            if(!isset($file_contents->data->name)) {
                model('Toutiao')->allowField(true)->save(['is_sale'=>0],['id' => $id]);
                $this->error('查询不到数据，建议尝试填写商品id查询');
            }
        }elseif (empty($data['url']) && !empty($data['gid'])){
            $data['url'] = 'https://haohuo.jinritemai.com/views/product/item?id='.$data['gid'];
            $file_contents = file_get_contents('https://ec.snssdk.com/product/lubanajaxstaticitem?id='.$data['gid']);
            $file_contents = json_decode($file_contents);
            if(!isset($file_contents->data->name)) {
                model('Toutiao')->allowField(true)->save(['is_sale'=>0],['id' => $id]);
                $this->error('查询不到数据，建议尝试填写url查询');
            }
        }elseif (empty($data['url']) && empty($data['gid'])){
            $this->error('请输入查询数据');
        }
        if(!isset($file_contents->data->name)){
            model('Toutiao')->allowField(true)->save(['is_sale'=>0],['id' => $id]);
            $this->error('商品已下架或者查询不到数据');
        }
        $data['title']=$file_contents->data->name;
        $data['sell_num']=$file_contents->data->sell_num;
        $data['goods_img']=$file_contents->data->img;
        $data['market_price']=$file_contents->data->market_price;
        $data['discount_price']=$file_contents->data->discount_price;
        $data['sku_max_price']=$file_contents->data->sku_max_price;
        $data['sku_min_price']=$file_contents->data->sku_min_price;
        $data['shop_name']=$file_contents->data->shop_name;
        $data['company_name']=$file_contents->data->company_name;
        $data['update_time']=time();
        //更新内容信息
        $result=model('Toutiaolog')->allowField(true)->save($data);
        if($result){
            model('Toutiao')->allowField(true)->save(['is_sale'=>1,'sell_num'=>$data['sell_num'],'discount_price'=>$data['discount_price'],'is_check'=>1,'update_time'=>$data['update_time'],'shop_name'=>$data['shop_name'],'company_name'=>$data['company_name']],['id' => $id]);
            $this->success("查询成功",'index');
        }else{
            $this->success("查询失败",'index');
        }

    }


    //内容编辑
    public function allCheck(){
        //获取文章信息
        //关联查询
        $data=db('toutiao')
            ->field('id,gid,url')
            ->where('is_check',1)
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
                        continue;
                    }
                }
            }elseif(!empty($v['url']) && empty($v['gid'])){
                preg_match('/id=(\d+)/',$v['url'],$gid);
                $v['gid'] = $gid[1];
                $file_contents = file_get_contents('https://ec.snssdk.com/product/lubanajaxstaticitem?id='.$gid[1]);
                $file_contents = json_decode($file_contents);
                if(!isset($file_contents->data->name)) {

                    continue;
                }
            }elseif (empty($v['url']) && !empty($v['gid'])){
                $v['url'] = 'https://haohuo.jinritemai.com/views/product/item?id='.$v['gid'];
                $file_contents = file_get_contents('https://ec.snssdk.com/product/lubanajaxstaticitem?id='.$v['gid']);
                $file_contents = json_decode($file_contents);
                if(!isset($file_contents->data->name)) {

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
            $data[$k]['shop_name']=$file_contents->data->shop_name;
            $data[$k]['company_name']=$file_contents->data->company_name;
            $data[$k]['update_time']=time();
            Db::execute("INSERT INTO lee_toutiaolog set update_time='".$data[$k]['update_time']."',title='".$data[$k]['title']."',sell_num='".$data[$k]['sell_num']."',goods_img='".$data[$k]['goods_img']."',market_price='".$data[$k]['market_price']."',discount_price='".$data[$k]['discount_price']."',shop_name='".$data[$k]['shop_name']."',company_name='".$data[$k]['company_name']."',sku_max_price='".$data[$k]['sku_max_price']."',sku_min_price='".$data[$k]['sku_min_price']."'");
            Db::execute("update lee_toutiao set update_time='".$data[$k]['update_time']."',title='".$data[$k]['title']."',sell_num='".$data[$k]['sell_num']."',goods_img='".$data[$k]['goods_img']."',market_price='".$data[$k]['market_price']."',discount_price='".$data[$k]['discount_price']."',shop_name='".$data[$k]['shop_name']."',company_name='".$data[$k]['company_name']."',sku_max_price='".$data[$k]['sku_max_price']."',sku_min_price='".$data[$k]['sku_min_price']."' where id=".$data[$k]['id']);
        }
        $this->success("查询成功");
    }


    public function search($keywords=null){
        if(request()->isPost()) {
            $search_data = input('post.')['keywords'];
            $where['title']= ['like', '%'.$search_data.'%'];
            $where['gid']= ['like', '%'.$search_data.'%'];
            $where['url']= ['like', '%'.$search_data.'%'];
        }
        if(!empty($keywords)){
            $where['title']= ['like', '%'.$keywords.'%'];
            $where['gid']= ['like', '%'.$keywords.'%'];
            $where['url']= ['like', '%'.$keywords.'%'];
        }
        $res = Db::name('toutiao')
            ->whereOr($where)
            ->select();
        $count = count($res);


        $list = Db::name('toutiao')
            ->whereOr($where)
            ->order(['update_time'=>'desc'])
            ->paginate(12,$count,['query'=>['keywords'=>$keywords]])
            ->each(function($item, $key){
                $item['add_time']=date("Y/m/d H:i:s",$item['add_time']);
                $item['update_time']=date("Y/m/d H:i:s",$item['update_time']);
                return $item;
            });
        //渲染分页按钮
        $page = $list->render();
        //转换为数据
        $list = $list->toArray()['data'];

        if(request()->isAjax()) {
            $data = $list; //这一段是将数据赋值给一个数组，这个数组用于ajax请求返回给前端
            $data['page'] = $page; //这个是分页的按钮
            $data['status'] = 1; //状态码
            return json($data); //返回json格式的数据
        }
        $this->assign('data',$list);
        $this->assign('page',$page);
        return $this->fetch();
    }

    public function searchlog($keywords=null){
        if(request()->isPost()) {
            $search_data = input('post.')['keywords'];
            $where['title']= ['like', '%'.$search_data.'%'];
            $where['gid']= ['like', '%'.$search_data.'%'];
            $where['url']= ['like', '%'.$search_data.'%'];
        }
        if(!empty($keywords)){
            $where['title']= ['like', '%'.$keywords.'%'];
            $where['gid']= ['like', '%'.$keywords.'%'];
            $where['url']= ['like', '%'.$keywords.'%'];
        }
        $res = Db::name('toutiaolog')
            ->whereOr($where)
            ->select();
        $count = count($res);


        $list = Db::name('toutiaolog')
            ->whereOr($where)
            ->order(['update_time'=>'desc'])
            ->paginate(12,$count,['query'=>['keywords'=>$keywords]])
            ->each(function($item, $key){
                $item['add_time']=date("Y/m/d H:i:s",$item['add_time']);
                $item['update_time']=date("Y/m/d H:i:s",$item['update_time']);
                return $item;
            });
        //渲染分页按钮
        $page = $list->render();
        //转换为数据
        $list = $list->toArray()['data'];

        if(request()->isAjax()) {
            $data = $list; //这一段是将数据赋值给一个数组，这个数组用于ajax请求返回给前端
            $data['page'] = $page; //这个是分页的按钮
            $data['status'] = 1; //状态码
            return json($data); //返回json格式的数据
        }
        $this->assign('data',$list);
        $this->assign('page',$page);
        return $this->fetch();
    }


    //删除内容
    public function del($id){
        $res = db('toutiao')->where('id',$id)->delete();
        if($res){
            $this->success("删除成功");
        }else{
            //删除失败
            $this->error("删除失败");
        }
    }

    //删除内容
    public function dellog($id){
        $res = db('toutiaolog')->where('id',$id)->delete();
        if($res){
            $this->success("删除成功");
        }else{
            //删除失败
            $this->error("删除失败");
        }
    }
    //批量删除
    public function delall(){
        if(request()->isPost()){
            $data=input('post.');
            if(empty($data['id'])){
                $this->error("请选择要删除的内容");
            }
//            p($data['id']);
//            $ids=implode(',', $data['id']);
            foreach ($data['id'] as $k=>$v){
                $result = Db::execute('delete from lee_toutiao where id ='.$v);
                if(!$result){
                    //删除失败
                    $this->error("删除id为".$v."失败");
                }
            }
            $this->success("删除成功");
        }
    }

    //批量删除
    public function dellogall(){
        if(request()->isPost()){
            $data=input('post.');
            if(empty($data['id'])){
                $this->error("请选择要删除的内容");
            }
//            p($data['id']);
//            $ids=implode(',', $data['id']);
            foreach ($data['id'] as $k=>$v){
                $res = db('toutiaolog')->where('id',$v)->delete();
                if(!$res){
                    //删除失败
                    $this->error("删除id为".$v."失败");
                }
            }
            $this->success("删除成功");
        }
    }

}