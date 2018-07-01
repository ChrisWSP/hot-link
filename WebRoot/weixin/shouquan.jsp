<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="el" uri="/WEB-INF/eltag.tld"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>收藏展示</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<!-- 引入bootstrap -->
	<link rel="stylesheet" href="<%= path %>/css/style.css">
	<!-- 新 Bootstrap 核心 CSS 文件 -->
	<link rel="stylesheet" href="<%= path %>/js/bootstrap/css/bootstrap.min.css">
	
	<!-- 可选的Bootstrap主题文件（一般不用引入） -->
	<link rel="stylesheet" href="<%= path %>/js/bootstrap/css/bootstrap-theme.min.css">
	
	<!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
	<script src="<%= path %>/js/jquery/jquery-1.11.3.min.js"></script>
	
	<script type="text/javascript" src="<%=path %>/js/bootstrap/js/jquery-ui.js"></script>
	<link href="<%=path %>/js/bootstrap/css/bootstrap-combined.min.css" rel="stylesheet" media="screen">
	<!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
	<script src="<%= path %>/js/bootstrap/js/bootstrap.min.js"></script>
	<!-- end -->
	<script src="<%=path %>/js/page.js"></script>
	<script src="<%=path %>/js/jquery/jquery-1.7.2.js"></script> 
	<script src="<%=path %>/js/WdatePicker.js"></script>
  </head>
 <body>
 	<button id="shouquan" onclick="shouquan()" class="btn btn-primary btn-lg btn-block" type="button" style="height: 200px;"><font size="15">微信授权</font></button>
 </body>
 <script type="text/javascript">
 	function shouquan(){
 		var appid = "wxa090acc678b18722";
 		var redirect_url = "http%3a%2f%2f192.168.10.110%3a8080%2fhot%2fwechat%2findex";
 		window.location.href = "https://open.weixin.qq.com/connect/oauth2/authorize?appid=" + appid + "&redirect_uri=" + redirect_url + "&response_type=code&scope=snsapi_base&state=123#wechat_redirect";
 	}
 </script>
</html>
