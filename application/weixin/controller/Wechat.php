<?php
namespace app\weixin\controller;
use think\Controller;
class Wechat extends Controller
{
    //绑定接口时验证
    protected function valid(){
        $echostr=$_GET['echostr'];
        if($this->checksignature()){
            echo $echostr;
            exit;

        }
    }
    //绑定接口时的数据验证
    private function checkSignature()
    {
        $signature=$_GET["signature"];
        $timestamp=$_GET["timestamp"];
        $nonce=$_GET["nonce"];

        $tmpArr = array(TOKEN,$timestamp, $nonce);
        sort($tmpArr, SORT_STRING);
        $tmpStr = implode( $tmpArr );
        $tmpStr = sha1( $tmpStr );

        if( $tmpStr==$signature ){
            return true;
        }else{
            return false;
        }
    }
//    业务逻辑处理方法
    protected function responsemsg(){
        $poststr=$GLOBALS['HTTP_RAW_POST_DATA'];
        if(!empty($poststr)){
            $postobj=simplexml_load_string($poststr);
            $msgtype=$postobj->MsgType;
            switch ($msgtype){
                case "text":
                    $this->text_handle($postobj);
                    break;
                case "event":
                    $this->event_handle($postobj);
                    break;
                default:
                    $this->handle($postobj);
                    break;
            }

        }else{
            echo "";
            exit;
        }
    }
//    文本消息处理

    /**
     * @param $postobj 用户发送来的消息对象
     */
    private function text_handle($postobj){
        $keyword=$postobj->Content;
        $res=db('article')->alias('a')
            ->join('pics b','b.aid=a.id')
            ->where('a.title','like',"%".$keyword."%")
            ->field('a.title,a.remark,a.id,b.pic')
            ->group('a.id')
            ->limit(8)
            ->select();
        $num=count($res);
        if($res){
            $str="<item>
<Title><![CDATA[%s]]></Title>
<Description><![CDATA[%s]]></Description>
<PicUrl><![CDATA[%s]]></PicUrl>
<Url><![CDATA[%s]]></Url>
</item>";
            $list="";
            foreach ($res as $v){
               $title=$v['title'];
               $desc=$v['remark'];
               $pic=request()->domain()."/".$v['pic'];
               $url=url('weixin/wechat/show',['id'=>$v['id']],'',true);
               $str_tmp=sprintf($str,$title,$desc,$pic,$url);
               $list=$list.$str_tmp;
            }
            $this->newsmsg($postobj,$list,$num);
        }else{
//            $content="没有检索到相关的数据";
//            $this->textmsg($postobj,$content);
            $this->robot($postobj,$keyword);
        }


    }
//    事件消息处理
    private function event_handle($postobj){
        $event=$postobj->Event;
        if($event=="subscribe"){
//            欢迎语设置
            $content=$this->getweixin('welcome');
        }
        $this->textmsg($postobj,$content);
    }
//    默认处理方法
    private function handle($postobj){
        echo "";
        exit;
    }
//    文本消息回复

    /**
     * @param $postobj 接收消息对象
     * @param $content 回复文本的内容
     */
    private function textmsg($postobj,$content){
        $toUser=$postobj->FromUserName;
        $fromUser=$postobj->ToUserName;
        $time=time();
        $texttpl="<xml>
<ToUserName><![CDATA[%s]]></ToUserName>
<FromUserName><![CDATA[%s]]></FromUserName>
<CreateTime>%s</CreateTime>
<MsgType><![CDATA[text]]></MsgType>
<Content><![CDATA[%s]]></Content>
</xml>";
        $result=sprintf($texttpl,$toUser,$fromUser,$time,$content);
        echo $result;
    }

//    回复图文消息

    /**
     * @param $postobj 接收消息对象
     * @param $content 图文列表
     */
    private function newsmsg($postobj,$list,$num){
        $toUser=$postobj->FromUserName;
        $fromUser=$postobj->ToUserName;
        $time=time();
        $newstpl="<xml>
<ToUserName><![CDATA[%s]]></ToUserName>
<FromUserName><![CDATA[%s]]></FromUserName>
<CreateTime>%s</CreateTime>
<MsgType><![CDATA[news]]></MsgType>
<ArticleCount>%s</ArticleCount>
<Articles>
%s
</Articles>
</xml>";
    $result=sprintf($newstpl,$toUser,$fromUser,$time,$num,$list);
    echo $result;
    }

//    显示检索内容详情

    /**
     * @param $id 图文消息id
     * @return \think\response\View 渲染输入模板
     */
    public function show($id){
        $result=db('article')->where('id',$id)->field('title,remark,content')->find();
        $this->assign('article',$result);
        return view();
    }

    /**
     * 机器人
     * @param $postobj 用户消息对象
     * @param $keyword 用户发送消息（文本）
     */
    private function robot($postobj=null,$keyword=""){
        $url="http://www.tuling123.com/openapi/api";
        $apikey="81e307c9b66f4d3a95993f6e2eddf70f";
        $data=[
            'key'=>$apikey,
            'info'=>trim($keyword),
            'userid'=>$postobj->FromUserName
        ];
        $result=$this->http_post($url,$data);
        switch ($result['code']){
            case "100000":
                $this->textmsg($postobj,$result['text']);
                break;
            case "200000":
                $text="<a href='%s'>%s</a>";
                $text=sprintf($text,$result['url'],$result['text']);
                $this->textmsg($postobj,$text);
                break;
        }

    }

    /**
     * @param $url POST地址
     * @param $data 要提交的数据
     * @return mixed  返回结果
     */
    private function http_post($url,$data){
//        初始化curl
        $curl=curl_init();
        //设置post提交的url地址
        curl_setopt($curl, CURLOPT_URL, $url);//设置属性
        //将提交的数据转换为json格式
        $data=json_encode($data);
        //设置提交方式为post
        curl_setopt($curl, CURLOPT_POST, 1);//设置属性
        //设置提交的数据
        curl_setopt($curl, CURLOPT_POSTFIELDS, $data);//设置属性
        //设置提交数的格式为json
        curl_setopt($curl, CURLOPT_HEADER, 0);//设置属性
        curl_setopt($curl, CURLOPT_HTTPHEADER,
            array(
                'Content-Type: application/json; charset=utf-8',
                'Content-Length:' . strlen($data))
        );//设置属性
        //TRUE 将curl_exec()获取的信息以字符串返回，而不是直接输出。这里关键
        curl_setopt($curl, CURLOPT_RETURNTRANSFER, 1);//设置属性
        $res = curl_exec($curl);//执行并获取结果
        return json_decode($res,true);
    }

    /**
     * @param $field 字段名
     * @return mixed 返回对应的配置项
     */
    protected function getweixin($field){
        $config=db('config')->field('weixin')->find();
        $weixin=json_decode($config['weixin'],true);
        return $weixin[$field];
    }
}
?>