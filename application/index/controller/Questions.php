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
use App\Models\Comment;
use App\Models\CommentsReply;
class Questions extends Common
{
    //内容列表
    public function index(){
        //获取产品介绍列表信息
        $res=db('questions')
            ->alias('q')
            ->JOIN('manager m','m.id=q.uid','left')
            ->JOIN('manager n','n.id=q.rid','left')
            ->field('q.*,m.account questioner,n.account answerer')
            ->order('add_time','desc')
            ->paginate(12,false);
        $this->assign('list',$res);
        return view('questions_list');
    }

    //内容添加
    public function add(){
        if(request()->isPost()){
            $data=input('post.');
            $data['add_time']=  time();
            $data['uid']=$this->user_id;
            //后端数据验证
            $validate=validate('Questions');
            if(!$validate->check($data)){
                $this->error($validate->getError());
            }

            $result=model('Questions')->allowField(true)->save($data);
            Lang::set('Content addition success','内容添加成功','zh-cn');
            Lang::set('Content addition failure','内容添加失败','zh-cn');
            if(!$result){
                $this->error(lang('Content addition failure'));
            }
            $this->success(lang('Content addition success'),url('index'));
            return;
        }
        return view('questions_add');
    }
    //问题回答
    public function reply($id){
        $res=db('questions')
            ->alias('q')
            ->JOIN('manager m','m.id=q.uid','left')
            ->JOIN('manager n','n.id=q.rid','left')
            ->where('q.qid',$id)
            ->field('q.*,m.account questioner,n.account answerer')
            ->find();
        if(request()->isPost()){
            $data=input('post.');
            $data['topic_id']=  $id;
            $data['from_uid']=  $this->user_id;
            $data['nickname']=  $this->user_name;
            $data['thumb_img']=  '空';
            $data['status']=  1;
            $data['create_time']=  time();
            //后端数据验证
            $validate=validate('Reply');
            if(!$validate->check($data)){
                $this->error($validate->getError());
            }

            $result=model('Comments')->allowField(true)->save($data);
            Lang::set('Content addition success','回答成功','zh-cn');
            Lang::set('Content addition failure','回答失败','zh-cn');
            if(!$result){
                $this->error(lang('Content addition failure'));
            }

            //更新评论次数
            $old_reply_num=db('questions')
                ->where('qid',$id)
                ->field('qid,reply_num')
                ->find();
            $q_data = [
                'is_reply'  =>1,
                'reply_num' => $old_reply_num['reply_num']+1
            ];
            $result = model('Questions')->allowField(true)->save($q_data,['qid' => $id]);
            if(!$result){
                $this->error('评论次数更新失败');
            }
            $this->success('回答主题成功',url('show',['id'=>$id]));
            return;
        }
        $this->assign('show_data',$res);
        return view('questions_reply');
    }





    //回复第一次评论
    public function com_reply($id='',$reply_id=''){

        if($reply_id){
            $from_table = 'comments_reply';
            $id=$reply_id;
            $comment_id = 'comment_id';
            $nickname = 'answerer';
        }else{
            $from_table = 'comments';
            $comment_id = 'topic_id';
            $nickname = 'nickname';
        }
        $res=db($from_table)
            ->alias('c')
            ->JOIN('manager m','m.id=c.from_uid','left')
            ->where('c.id',$id)
            ->field('c.*,m.account answerer')
            ->find();
        if(request()->isPost()){

            $data=input('post.');


            if($reply_id){
                $data['comment_id']=  $res['comment_id'];
                $data['reply_type']=  2;//'1为回复评论，2为回复别人的回复',
                $data['reply_id']=  $res['id'];//'回复目标id，reply_type为1时，是comment_id，reply_type为2时为回复表的id',
            }else{
                $data['comment_id']=  $res['topic_id'];
                $data['reply_type']=  1;//'1为回复评论，2为回复别人的回复',
                $data['reply_id']=  $id;//'回复目标id，reply_type为1时，是comment_id，reply_type为2时为回复表的id',
            }
            $data['comment_id']=  $res[$comment_id];
            $data['to_uid']=  $res['from_uid'];
            $data['from_uid']=  $this->user_id;
            $data['from_nickname']=  $this->user_name;
            $data['from_thumb_img']=  '空';
            $data['to_nickname']=  $res[$nickname];

            $data['is_author']= 0;//'0为普通回复，1为后台管理员回复',

            $data['create_time']=  time();
            //后端数据验证
            $validate=validate('Reply');
            if(!$validate->check($data)){
                $this->error($validate->getError());
            }
            $result=model('CommentsReply')->allowField(true)->save($data);

//            Lang::set('Content addition success','回答成功','zh-cn');
//            Lang::set('Content addition failure','回答失败','zh-cn');
            if(!$result){
                $this->error(lang('Content addition failure','回复失败'));
            }

            if($reply_id){
                //插入回复表表 回复次数 +1
                $r_data['reply_num']=  $res['reply_num']+1;//'回复目标id，reply_type为1时，是comment_id，reply_type为2时为回复表的id',
                $result= model('Comments_reply')->allowField(true)->save($r_data,['id' => $reply_id]);
                if(!$result){
                    $this->error('被回复次数更新失败');
                }
            }
            //插入问题表 回复次数 +1
            $old_reply_num=db('questions')
                ->where('qid',$res[$comment_id])
                ->field('qid,reply_num')
                ->find();
            $q_data = [
                'is_reply'  =>1,
                'reply_num' => $old_reply_num['reply_num']+1
            ];
            $result=model('Questions')->allowField(true)->save($q_data,['qid' => $res[$comment_id]]);
            if(!$result){
                $this->error('主题回复次数更新失败');
            }
            //插入评论表 回复次数 +1
            $old_com_reply_num=db('comments')
                ->where('id',$id)
                ->field('id,reply_num')
                ->find();
            $c_data = [
                'reply_num' => $old_com_reply_num['reply_num']+1
            ];
            $result=model('Comments')->allowField(true)->save($c_data,['id' => $id]);
            if(!$result){
                $this->error('评论回复次数更新失败');
            }
            $this->success('回答问题成功',url('show',['id'=>$res[$comment_id]]));
            return;
        }
        $this->assign('show_data',$res);
        return view('comments_reply');
    }



    //内容查看
    public function show($id){
        $res=db('questions')
            ->alias('q')
            ->JOIN('manager m','m.id=q.uid','left')
            ->where('q.qid',$id)
            ->field('q.*,m.account questioner')
            ->find();

        $comment=db('comments')
            ->alias('c')
            ->JOIN('manager m','m.id=c.from_uid','left')
            ->where('c.topic_id',$id)
            ->field('c.*,m.account answerer')
            ->order('c.create_time','desc')
            ->paginate(4,false)
            ->each(function($item, $key){
                $like_id = db('like')
                    ->where(['com_id'=>$item['id'],'uid'=>$this->user_id])
                    ->field('id')
                    ->find();
                if($like_id['id']){
                    $item['is_like']='1';
                }else{
                    $item['is_like']='';
                }
                $reply=db('comments_reply')
                    ->alias('c')
                    ->JOIN('manager m','m.id=c.from_uid','left')
                    ->JOIN('manager n','n.id=c.to_uid','left')
                    ->where(['c.reply_type'=>1,'c.reply_id'=>$item['id']])
                    ->field('c.*,m.account from_user,n.account to_user')
                    ->order('c.create_time','desc')
                    ->select();
                foreach ($reply as $k=>$v){
                    $like= db('like')
                        ->where(['reply_id'=>$v['id'],'uid'=>$this->user_id])
                        ->field('id')
                        ->find();
                    if($like['id']){
                        $reply[$k]['is_like']='1';
                    }else{
                        $reply[$k]['is_like']='';
                    }
                    $reply_coments = $this->get_reply($v['comment_id'],$v['id']);
                    $reply[$k]['reply_coments'] = $reply_coments;

                }
                $item['com_reply']=$reply;
                return $item;
            });

        $this->assign('show_data',$res);
        $this->assign('comment',$comment);
        $this->assign('floor',count($comment));
        return view('questions_show');
    }



    //无限极循环 取出回复信息
    public function get_reply($comment_id,$from_id){
        $reply=db('comments_reply')
            ->alias('c')
            ->JOIN('manager m','m.id=c.from_uid','left')
            ->JOIN('manager n','n.id=c.to_uid','left')
            ->where(['c.reply_type'=>2,'c.reply_id'=>$from_id,'c.comment_id'=>$comment_id])
            ->field('c.*,m.account from_user,n.account to_user')
            ->order('c.create_time','desc')
            ->select();
        $html='';
        if(!empty($reply)){
            foreach ($reply as $k=>$v){
                $like= db('like')
                    ->where(['reply_id'=>$v['id'],'uid'=>$this->user_id])
                    ->field('id')
                    ->find();
                if($like['id']){
                    $reply[$k]['is_like']='1';
                    $like_style = 'color:red';
                }else{
                    $reply[$k]['is_like']='';
                    $like_style = '';
                }
                $html .="<tr>";
                $html .="<td></td> ";
                $html .="<td>评论回复：".$v['from_user']."回复".$v['to_user']."</td>";
                $html .="<td>".$v['content']."</td>";
                $html .="<td>".date('Y/m/d H:i:s',$v['create_time'])."</td>";
                $html .="<td>".$v['reply_num']."</td>";
                $html .="<td>";
                $html .="<a href='/index/questions/com_reply/reply_id/".$v['id'].".html' class='layui-btn layui-btn-mini'><i class='layui-icon'>&#xe642;</i>评论</a>";
                $html .="<i class='layui-icon layui-icon-praise' id='reply_praise-".$v['id']."'' style='".$like_style."' onclick='reply_like(".$v['id'].")'>&#xe6c6;<span id='reply_like_".$v['id']."'>".$v['like_num']."</span></i>";
                $html .="</td>";
                $html .="</tr>";

                $html .= $this->get_reply($v['comment_id'],$v['id']);

            }
        }
        return $html ? $html : $html ;
    }



    //喜欢点赞
    public function like(){
        if(request()->isPost()){
            $id=input('post.')['id'];
            if(input('post.')['reply']){
                $seach_id = 'reply_id';
                $seach_table = 'comments_reply';
                $seach_moble = 'Comments_reply';
            }else{
                $seach_id = 'com_id';
                $seach_table = 'comments';
                $seach_moble = 'Comments';
            }

            $like_id = db('like')
                ->where($seach_id,$id)
                ->field('id')
                ->find();
            if($like_id['id']){
                return $this->json(302,[],'您已经点赞了');
            }
            $like_num=db($seach_table)
                ->where('id',$id)
                ->field('id,like_num')
                ->find();
            $data = [
                'like_num' => $like_num['like_num']+1
            ];
            $like_data = [
                'uid' => $this->user_id,
                $seach_id => $id
            ];
            $result = model($seach_moble)->allowField(true)->save($data,['id' => $id]);
            $like_result = model('Like')->allowField(true)->save($like_data);
            if(!$like_result){
                return $this->json(302,[],'记录点赞数据失败');
            }
            if(!$result){
                return $this->json(303,[],'点赞失败，数据异常');
            }
            if($result && $like_result){
                return $this->json(201,$data,'点赞成功');
            }else{
                return $this->json(301,[],'点赞失败');
            }
        }
    }


    public function search($keywords=null){
        if(request()->isPost()) {
            $search_data = input('post.')['keywords'];
            $where['remark']= ['like', '%'.$search_data.'%'];
            $where['title']= ['like', '%'.$search_data.'%'];
        }
//            $keywords = $keywords['keywords'];
        if(!empty($keywords)){
            $where['remark']= ['like', '%'.$keywords.'%'];
            $where['title']= ['like', '%'.$keywords.'%'];
        }
        $res = Db::name('questions')
            ->alias('q')
            ->JOIN('manager m','m.id=q.uid','left')
            ->JOIN('manager n','n.id=q.rid','left')
            ->whereOr($where)
            ->field('q.*,m.account questioner,n.account answerer')
            ->select();
        $count = count($res);
        $list = Db::name('questions')
            ->alias('q')
            ->JOIN('manager m','m.id=q.uid','left')
            ->JOIN('manager n','n.id=q.rid','left')
            ->whereOr($where)
            ->field('q.*,m.account questioner,n.account answerer')
            ->order(['add_time'=>'desc'])
            ->paginate(12,$count,['query'=>['keywords'=>$keywords]])
            ->each(function($item, $key){
                $item['add_time']=date("Y/m/d H:i:s",$item['add_time']);
                if($item['is_reply']==1){
                    $item['is_reply']='是';
                }else{
                    $item['is_reply']='否';
                }
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

    //内容编辑
    public function edit($id){
        //获取问题信息
        //关联查询
        $res=db('questions')
            ->alias('q')
            ->JOIN('manager m','m.id=q.uid','left')
            ->where('q.qid',$id)
            ->field('q.*,m.account questioner')
            ->find();
        if( $res['uid']!== $this->user_id){
            $this->error('您不能编辑此信息');
            exit;
        }
        if($res['is_reply'] == 1){
            $this->error('此问题已经有人回答，无法编辑');
            exit;
        }
        if(request()->isPost()){
            $data=input('post.');
            $data['add_time']=  time();
            //后端数据验证
            $validate=validate('Questions');
            if(!$validate->check($data)){
                $this->error($validate->getError());
            }
            //更新内容信息
            $result=model('Questions')->allowField(true)->save($data,['qid' => $id]);
            if(!$result){
                $this->success("更新成功",url('edit',['id'=>$id]));
            }
            $this->success("更新成功",'index');
        }
        $this->assign('edit_data',$res);
        return view('questions_edit');
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
    //删除内容
    public function del($id){

        $res=db('questions')
            ->where('qid',$id)
            ->field('qid,uid')
            ->find();
        if( $res['uid']!== $this->user_id){
            $this->error('您不能删除此信息');
            exit;
        }
        $article = model('Questions');
        if($article::destroy($id)){//删除成功
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
            foreach($data['id'] as $k=>$v){
                $res=db('questions')
                    ->where('qid',$v)
                    ->field('qid,uid,title')
                    ->find();
                if( $res['uid']!== $this->user_id){
                    $this->error('您不能删除['.$res['title'].']');
                    exit;
                }
            }
            $questions = model('Questions');
            $ids=implode(',', $data['id']);
            $result=$questions::destroy($ids);
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