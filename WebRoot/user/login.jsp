<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
	<title>Login</title>
	   
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<link href="<%=path %>/css/style_login.css" rel='stylesheet' type='text/css' />
	<script src="<%=path %>/js/jquery/jquery-1.7.2.js"></script> 
	<script src="<%= path %>/js/jquery/jquery.validate.js"></script>
	<script src="<%= path %>/js/jquery/jquery.metadata.js"></script>
	
	<link href="<%=path %>/js/jquery/skins/simple.css" rel="stylesheet" /> 
	<script src="<%=path %>/js/jquery/artDialog.min.js"></script>
	<script>
		$(document).ready(function(c) {
			$('.close').on('click', function(c){
				$('.login-form').fadeOut('slow', function(c){
			  		$('.login-form').remove();
				});
			});	  
		});
	</script>
	<!--SIGN UP-->
</head>
<body>
 	<h1>HOT COLLECT</h1>
	<div class="login-form">
	<div class="close"> </div>
		<div class="head-info">
			<label class="lbl-1"> </label>
			<label class="lbl-2"> </label>
			<label class="lbl-3"> </label>
		</div>
		<div class="clear"> </div>
		<div class="avtar">
			<img src="<%=path %>/images/avtar.png" />
		</div>
		<form  action="#" id="loginform" method="post">
			<input class="text" type="text" name="mobile" id="mobile" value=""/>
			<div class="">
				<input type="password" name="password" id="password" value="" />
			</div>
			<div class="signin">
				<input type="submit" value="Login" >
			</div>
		</form>
	</div>
 	<div class="copy-rights">
	</div>
</body>
<script type="text/javascript">
	$(function(){
    	$("#loginform").validate({
	        submitHandler:function(form){
	        	login();
	        }    
	    });
	}); 
	
	//登录
	function login(){
		if($("#mobile").val() == ''){
			alert("用户名不能为空");
			return false;
		}
		if($("#password").val() == ''){
			alert("密码不能为空");
			return false;
		}
		$.ajax({  
	        url : "<%=path %>/user/login.json",  
	        type : "POST",
	        data: $('#loginform').serialize(),
	        dataType : "json",  
	        success : function(data) { 
	        	if(data.state == 1){
	        		if(data.utype == -1){
		        		window.location.href="<%=path%>/user/user_manage.html";
	        		}else{
	        			window.location.href = "<%=path%>/collect/link_collect.html";
	        		}
	        	}else{
	        		alert(data.message);
	        	}
	        },
	        error: function(){
	       		alert("操作失败");
	        } 
	    });
	}
	
</script> 
</html>