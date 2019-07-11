/************城市**************/
$(document).ready(function() {
    $(".selBox").click(function() {
        $(".optionbox").slideToggle(300)
    });
    $(".optionbox ins").click(function() {
        $(".optionbox").slideUp(300)
    });
    $(document).hover(function(n) {
        var t = $(n.target);
        $(".selectBox").is(":visible") && t.attr("class") != "optionbox" && !t.parent(".optionbox").length && $(".optionbox").slideUp(300)
    });
    $(".optionbox span").click(function() {
        var n = $(this).text();
        $(".optionbox").slideUp(300);
        $(".selTxt span").text(n);
        $("#selValue").val(n)
    })
});
/************滚动**************/
var speed=20;
	var roll=document.getElementById("roll");
	var roll1=document.getElementById("roll1");
	var roll2=document.getElementById("roll2");
	roll2.innerHTML=roll1.innerHTML;
	function marquee(){
		if(roll.scrollLeft<=0){
			roll.scrollLeft+=roll2.offsetWidth;}
			else{
				roll.scrollLeft--;
			}
		}
	var mymar=setInterval(marquee,speed);
	roll.onmouseover=function(){clearInterval(mymar)};
	roll.onmouseout=function(){mymar=setInterval(marquee,speed)};

/************城市**************/
 /*var cli=document.getElementById("textbox");
 var opt=document.getElementById("optionbox");
 var clo=document.getElementById("ico-city");
 var flag=true;
 cli.onclick=function (){
 	if(flag){
 		flag=false;
 		opt.style.display="block";
 		opt.style.height="36px";
 	}
 	else{
 		flag=true;
 		opt.style.display="none";
 		opt.style.height="0px";
 	};
 	setTimeout("optionbox()", 5000);
 };
 clo.onclick=function (){flag=true;opt.style.display="none";}*/

/************团购**************/

    $(document).ready(function()
        {
            var $hd = $('.hd li');
            var $bd = $('.infolist');
                        
            $hd.mouseover(function(){
                var $this = $(this);
                var $t = $this.index();
                $hd.removeClass();
                $this.addClass('on');
                $bd.css('display','none');
                $bd.eq($t).css('display','block');
            })
        });