<?php
/**
 * Created by PhpStorm.
 * User: yifeng
 * Date: 2017/11/3
 * Time: 20:54
 */

namespace app\index\validate;


use think\Validate;

class Article extends Validate
{
    protected $rule =   [
        'title'  => 'require',
        'views'   =>'require|number|checkviews:0',
        '__token__'  =>  'require|token',
    ];

    protected $message  =   [
        'title.require' => '{%Title cannot be empty}',
        'views.require' =>'浏览次数不能为空',
        'views.number' =>'浏览次数必须是数字',
        'views.checkviews' =>'浏览次数必须大于等于0',
        '__token__.require'=>"非法提交",
        '__token__.token'=>"请不要重复提交表单",
    ];
    /**
     * @param $value 要验证字段的值
     * @param $rule  验证规则传来的值
     * @return bool  true:验证通过  ，false/字符串：验证不通过
     */
    //自定义验证规则
    protected function checkviews($value,$rule){
        if($value>=$rule){
            return true;
        }
        return false;
    }
}