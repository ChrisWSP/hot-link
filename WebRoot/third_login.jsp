<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
%>
<!DOCTYPE html>
<html>
  <head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0 ,user-scalable=no">
<title>正在登录</title>

<style type="text/css">
#BgDiv1{background-color:#000; position:absolute; z-index:9999;  display:none;left:0px; top:0px; width:100%; height:100%;opacity: 0.6; filter: alpha(opacity=60);}
.DialogDiv{position:absolute;z-index:99999;}/*配送公告*/
.U-user-login-btn{ display:block; border:none; background:url(images/bg_mb_btn1_1.png) repeat-x; font-size:1em; color:#efefef; line-height:49px; cursor:pointer; height:53px; font-weight:bold;
border-radius:3px;
-webkit-border-radius: 3px;
-moz-border-radius: 3px;
 width:100%; box-shadow: 0 1px 4px #cbcacf, 0 0 40px #cbcacf ;}
.U-user-login-btn:hover, .U-user-login-btn:active{ display:block; border:none; background:url(images/bg_mb_btn1_1_h.png) repeat-x; font-size:1em; color:#efefef; line-height:49px; cursor:pointer; height:53px; font-weight:bold;
border-radius:3px;
-webkit-border-radius: 3px;
-moz-border-radius: 3px;
 width:100%; box-shadow: 0 1px 4px #cbcacf, 0 0 40px #cbcacf ;}
.U-user-login-btn2{ display:block; border:none;background:url(images/bg_mb_btn1_1_h.png) repeat-x;   font-size:1em; color:#efefef; line-height:49px; cursor:pointer; font-weight:bold;
border-radius:3px;
-webkit-border-radius: 3px;
-moz-border-radius: 3px;
 width:100%; box-shadow: 0 1px 4px #cbcacf, 0 0 40px #cbcacf ;height:53px;}
.U-guodu-box { padding:5px 15px;  background:#3c3c3f; filter:alpha(opacity=90); -moz-opacity:0.9; -khtml-opacity: 0.9; opacity: 0.9;  min-heigh:200px; border-radius:10px;}
.U-guodu-box div{ color:#fff; line-height:20px; font-size:12px; margin:0px auto; height:100%; padding-top:10%; padding-bottom:10%;}

</style>
<script src="<%=path %>/js/jquery-1.7.2.js" type="text/javascript"></SCRIPT>
<script type="text/javascript">
$(function(){
	$("#BgDiv1").css({ display: "block", height: $(document).height() });
	var yscroll = document.documentElement.scrollTop;
	var screenx=$(window).width();
	var screeny=$(window).height();
  $(".DialogDiv").css("display", "block");
	 $(".DialogDiv").css("top",yscroll+"px");
	 var DialogDiv_width=$(".DialogDiv").width();
	 var DialogDiv_height=$(".DialogDiv").height();
	  $(".DialogDiv").css("left",(screenx/2-DialogDiv_width/2)+"px");
	 $(".DialogDiv").css("top",(screeny/2-DialogDiv_height/2)+"px");
	 $("body").css("overflow","hidden");

});
</script>
  </head>
  
  <body>
   <div id="BgDiv1"></div>
<div class="U-login-con">

            	<div class="DialogDiv"  style="display:none; ">
                    <div class="U-guodu-box">
                    <div>
                    <table width="100%" cellpadding="0" cellspacing="0" border="0" >
                        <tr><td  align="center"><img src="images/loading.gif"></td></tr>
                        <tr><td  valign="middle" align="center" id="contehttext">登录中，请稍后！</td></tr>
                    </table>
                    </div>
            	</div>
     		</div>
          <div class="cl"></div>
</div>   
  </body>
<script>
function GetQueryString(name) {
     var reg = new RegExp("(^|&)"+ name +"=([^&]*)(&|$)");
     var r = window.location.search.substr(1).match(reg);
     if(r!=null)
    	 return  unescape(r[2]); 
     return null;
}
    var token= GetQueryString("token");
    var backurl= GetQueryString("backurl");
    var type= GetQueryString("type");
    var code= GetQueryString("code");
    var state= GetQueryString("state");
    var devices= GetQueryString("devices");
    var area= GetQueryString("area");
    if(Number(type)==1||type==null){
    	if(backurl==null){
    		backurl="";
    	}
		//$.getJSON("<%=path %>/happ_tlogin?token="+token+"&backurl="+backurl+"&code="+code+"&state="+state+"&devices="+devices,
	$.getJSON("<%=path %>/happ_tlogin?token="+token+"&backurl="+backurl+"&code="+code+"&devices="+devices+"&area="+area, function(data) {
		//alert(data.state);
		if(Number(devices)==36){
			window.location.href=backurl;
		}
		
		
		/* alert(parent.location.href);
		alert(window.location.href);
		alert(window.document.referrer);
		alert(window.parent.opener.location.href); */
	
		
		if(data.state>0){
			document.getElementById("contehttext").innerHTML="登录成功正在跳转";
		}else{
			document.getElementById("contehttext").innerHTML="登录失败正在跳转";
			window.history.go(-2); 
		}
		if(data.state==5){
			window.history.go(-2); 
		}else{
				var myreferrer=window.document.referrer;
				if(devices==1){
				window.history.go(-2); 
				}else{
					if(myreferrer.indexOf("open.weixin.qq.com")>0){
					//alert(2);
						window.history.go(-2); 
		            }else{
					//alert(1);
		          		window.history.go(-1); 
		            }
				}
		}
		/*
	
   		//alert("data.gourl=="+data.gourl);
		//alert(data.gourl);
		if (typeof(data.gourl) == "undefined") {
		
		window.location.href="/wwwtest/index.html?toke="+token;
		//window.open("/www/index.html?toke="+token);
		}else{
		
		window.location.href=data.gourl;
		//window.open(data.gourl);
		}
		*/
		});
    }
</script>
</html>
