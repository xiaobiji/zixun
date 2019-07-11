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
class Introduction extends Common
{
    //内容列表
    public function index($cid=null){
        if($cid){
            $map=['a.cid'=>$cid];
        }else{
            $map=[];
        }
        //获取产品介绍列表信息
        $res=db('introduction')
            ->alias('i')
            ->JOIN('manager m','m.id=i.uid','left')
            ->field('i.*,m.account author')
            ->order(['add_time'=>'desc'])
            ->paginate(12,false);
        $this->assign('list',$res);
        return view('introduction_list');
    }
    //内容添加
    public function add(){
        if(request()->isPost()){
            $data=input('post.');
            $data['add_time']=time();
//            if(isset($data['istop'])){
//                $data['toptime']=time();
//            }
            $data['uid']=$this->user_id;
            //后端数据验证
            $validate=validate('Introduction');
            if(!$validate->check($data)){
                $this->error($validate->getError(),'introduction/add');
            }
            //清除__token__字段
            //unset($data['__token__']);
            //unset($data['pic']);
            //unset($data['imgfile']);
            $result=model('Introduction')->allowField(true)->save($data);
            Lang::set('Content addition success','内容添加成功','zh-cn');
            Lang::set('Content addition failure','内容添加失败','zh-cn');
            if(!$result){
                $this->error(lang('Content addition failure'));
            }
            $this->success(lang('Content addition success'));
            return;
        }
        return view('introduction_add');
    }

    //内容查看
    public function show($id){

        $res=db('introduction')
            ->alias('i')
            ->join('pics b','b.aid=i.iid')
            ->JOIN('manager m','m.id=i.uid','left')
            ->where('i.iid',$id)
            ->field('i.*,GROUP_CONCAT(b.pic) as pic,m.account author')
            ->find();
        $res['pic']=explode(",",$res['pic']);
        $file=[];
        foreach ($res['pic'] as $k=>$v){
            if(!empty($v)){
                if(!$this->isimgs($v)){
                    $url = 'http://'.$_SERVER['SERVER_NAME'] .'\\public'.'\\'.$v;;
                    array_push($file,$url);
                    unset($res['pic'][$k]);
                }
            }
        }
        $res['file'] = $file;
        $this->assign('show_data',$res);
        return view('introduction_show');
    }

    //内容编辑
    public function edit($id){
        //获取文章信息
        //关联查询
        $res=db('introduction')->alias('i')
            ->join('pics b','b.aid=i.iid')
            ->where('i.iid',$id)
            ->field('i.*,GROUP_CONCAT(b.pic) as pic')
            ->find();
        if($res['uid']!==$this->user_id){
            $this->error('您不是此文章作者，无法编辑');
        }
        if(request()->isPost()){
            $data=input('post.');
            if($res['uid']!==$this->user_id){
                $this->error('您不是此文章作者，无法编辑');
            }
            $data['add_time']=time();
            //后端数据验证
            $validate=validate('Introduction');
            if(!$validate->check($data)){
                $this->error($validate->getError());
            }
            //更新内容信息
            model('Introduction')->allowField(true)->save($data,['iid' => $id]);
            $this->success("更新成功",'index');
        }
        $file=[];
        $res['pic'] = explode(',',$res['pic']);
        foreach ($res['pic'] as $k=>$v){
            if(!empty($v)){
                if(!$this->isimgs($v)){
                    array_push($file,$v);
                    unset($res['pic'][$k]);
                }
            }
        }
        $res['file'] = $file;
//        $res['keyword']=explode(",",$res['keyword']);
        $this->assign('edit_data',$res);
        return view('introduction_edit');
    }


    public function search($keywords=null){
        if(request()->isPost()) {
            $search_data = input('post.')['keywords'];
            $where['iname']= ['like', '%'.$search_data.'%'];
            $where['content']= ['like', '%'.$search_data.'%'];
        }
        if(!empty($keywords)){
            $where['iname']= ['like', '%'.$keywords.'%'];
            $where['content']= ['like', '%'.$keywords.'%'];
        }
        $res = Db::name('introduction')
            ->alias('i')
            ->JOIN('manager m','m.id=i.uid','left')
            ->whereOr($where)
            ->field('i.*,m.account author')
            ->select();
        $count = count($res);
        $list = Db::name('introduction')
            ->alias('i')
            ->JOIN('manager m','m.id=i.uid','left')
            ->whereOr($where)
            ->field('i.*,m.account author')
            ->order(['add_time'=>'desc'])
            ->paginate(12,$count,['query'=>['keywords'=>$keywords]])
            ->each(function($item, $key){
                $item['add_time']=date("Y/m/d H:i:s",$item['add_time']);
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




    //置顶
    public function istop(){
        if(request()->isAjax()){
            $data=input('post.');
            $value=[];
            $value['id']=$data['id'];
            $value['toptime']=time();
            $articleModel=model('Article');
            if($data['istop']==="true"){
                $value['istop']=1;
                if($articleModel::update($value)){
                    return json(['code'=>1,'msg'=>"置顶成功"]);
                }
                return json(['code'=>0,'msg'=>"操作失败"]);
            }else{
                $value['istop']=0;
                if($articleModel::update($value)){
                    return json(['code'=>1,'msg'=>"取消置顶成功"]);
                }
                return json(['code'=>0,'msg'=>"操作失败"]);
            }

        }
    }
    //图片列表
    public function pics($aid){
        $res=db('pics')->where('aid',$aid)->order('sort Desc,id Desc')->select();
        $this->assign('pics',$res);
        return view('article_pic');
    }
    //删除单张图片

    /**
     * @param string $id 图片Id
     */
    public function delpic($id){
        $res=db('pics')->where('id',$id)->find();
        if($res){
            $pic=$res['pic'];
            $result=db('pics')->delete($id);
            if($result){
                $file=ROOT_PATH ."public/".$pic;
                if(file_exists($file)){
                    if(unlink($file)){
                        $this->success('删除成功');
                    }else{
                        $this->error('删除失败');
                    }
                }
            }
        }

    }
    //图片排序
    public function picsort(){
        if(request()->isAjax()){
            $data=input('post.');
            $result=db('pics')->update($data);
            if($result){
                return json(['code'=>1,'msg'=>"排序成功"]);
            }
            return json(['code'=>0,'msg'=>"排序失败"]);
        }
    }


    //删除内容
    public function del($id){
        $introduction = model('Introduction');
        if($introduction::destroy($id)){//删除成功
            //删除图片内容
            $this->success("删除成功");
        }
        //删除失败
        $this->error("删除失败");
    }
    //批量删除
    public function delall(){
        if(request()->isPost()){
            $data=input('post.');
            //清除干扰项
//        if(isset($data['istop'])){
//            unset($data['istop']);
//        }
//            if(isset($data['cid'])){
//                unset($data['cid']);
//            }

            if(empty($data['id'])){
                $this->error("请选择要删除的内容");
            }
            $article = model('Introduction');
            $ids=implode(',', $data['id']);
            $result=$article::destroy($ids);
            if($result){//删除成功
                //删除图片内容
                $this->success("删除成功");
            }
            //删除失败
            $this->error("删除失败");
        }
    }


    //批量删除
    public function show_pdf($file,$date,$name){
        $pdf = $file.'\\'.$date.'\\'.$name;
        if($pdf){
            $url = $_SERVER['SERVER_NAME'] .'\\public'.'\\'.$pdf;
            $this->assign('url',$url);
        }
        return view('introduction_pdf');
    }

}