<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ taglib prefix="el" uri="/WEB-INF/eltag.tld"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>人员管理</title>
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
	
	<!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
	<script src="<%= path %>/js/bootstrap/js/bootstrap.min.js"></script>
	<!-- end -->
	<script src="<%=path %>/js/page.js"></script>
    <script src="<%=path %>/js/jquery/jquery-1.7.2.js"></script> 
	<script language="javascript" type="text/javascript" src="<%=path %>/js/WdatePicker.js"></script>
	<script src="<%= path %>/js/jquery/jquery.validate.js"></script>
	<script src="<%= path %>/js/jquery/jquery.metadata.js"></script>
  </head>
  
  <body>
  	<div class="panel panel-primary">
	    <div class="panel-heading">
	    	<h3 class="panel-title">BUG协同管理</h3>
	    </div>
	    <%@ include file="../common/header.jsp" %> 
	    
	    <div class="panel-body">
	   		<form  id="myform" class="form-inline" role="form" action="<%= path %>/user/user_manage.html"  method="post">
			  	<label for="lastname" class="control-label">手机号：</label>
			  	<input class="form-control" type="text" id="smobile" name="mobile" value="${sperson.mobile }"/>
           		<label for="lastname" class="control-label">名称：</label>
           		<input class="form-control" type="text" id="sname" name="userName" value="${sperson.userName }"/>
				<input type="submit" class="btn btn-default" value="搜索"/>
	   		</form>
	   	</div>
	   	<div class="panel-body">
	   		<button class="btn btn-default" data-toggle="modal" data-target="#addModal" data-backdrop="static" onclick="openAdd()">
			 	<span class="glyphicon glyphicon-plus"></span>新建用户
			</button>
	   		<!-- <a href="javascript:void(0);"  class="btn btn-default" onclick="">
	   			<span class="glyphicon glyphicon-plus"></span>新建用户
	   		</a> -->
	    </div>
	   	<div class="panel-body">
	   		<table class="table">
		    	<thead>
		        	<tr>
			            <th>手机号</th>
			  			<th>姓名</th>
			  			<th>类型</th>
			  			<th>状态</th>
			  			<th>最后登录</th>
			  			<th>创建时间</th>
			  			<th>操作</th>
			         </tr>
		      	</thead>
		      	<tbody>
		      		<c:forEach items="${users }" var="obj">
			  			<tr>
			  				<td>${obj.mobile }</td>
			  				<td>${obj.userName }</td>
			  				<td>
			  					<c:choose>
			       					<c:when test="${obj.type==0}">普通</c:when>
			       					<c:when test="${obj.type==1}">负责人</c:when>
			       					<c:when test="${obj.type==-1}">超级管理员</c:when>
			  					</c:choose>
			  				</td>
			  				<td>
			  					<c:choose>
			       					<c:when test="${obj.state==0}">禁用</c:when>
			       					<c:when test="${obj.state==1}">启用</c:when>
			  					</c:choose>
			  				</td>
			  				<td><c:if test="${obj.loginTime > 0}">${el:longToDetailTime(obj.loginTime) }</c:if></td>
			  				<td>${el:longToDetailTime(obj.createTime) }</td>
			  				<td>
				  				<button class="btn btn-default btn-sm" data-toggle="modal" data-target="#addModal" data-backdrop="static" onclick="openEdit('${obj.id}')">
								 	<span class="glyphicon glyphicon-ok"></span>修改
								</button>
			  					<c:if test="${obj.state == 0}">
	  								<button onclick="dealState('${obj.id}', 1)" class="btn btn-default btn-sm"> <span class="glyphicon glyphicon-align-justify"></span>启用</button>
			  					</c:if>
			  					<c:if test="${obj.state == 1}">
	  								<button onclick="dealState('${obj.id}', 0)" class="btn btn-default btn-sm"> <span class="glyphicon glyphicon-align-justify"></span>禁用</button>
			  					</c:if>
  								<button onclick="resetPassword('${obj.id}')" class="btn btn-default btn-sm"> <span class="glyphicon glyphicon-align-justify"></span>重置密码</button>
			  				</td>
			  			</tr>
			  		</c:forEach>
			  		<tr>
			   			<td colspan="10">
		   				 	<ul class="pagination" id="page2">
		   				 	</ul>
			   			</td>
			   		</tr>
		      	</tbody>
		   </table>
	   </div>
    </div>
    
   	<div class="modal fade" id="addModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" >
    	<div class="modal-dialog">
        	<div class="modal-content">
	        	<div class="modal-header">
		            <button type="button" class="close" data-dismiss="modal" aria-hidden="true"> &times; </button>
		            <h4 class="modal-title" id="titleLabel">
		              
		            </h4>
	        	</div>
            	<form class="form-horizontal" role="form" id="userform" method="post" action="">
		            <div class="modal-body">
	            		<input type="hidden" id="id" name="id" value=""/>
	            		<div class="form-group">
		            		<label for="lastname" class="col-sm-3 control-label">手机号：</label>
		            		<div class="col-sm-9">
		            			<input class="form-control" type="text" id="mobile" name="mobile" value=""/>
		            		</div>
		            	</div>
	            		<div class="form-group" id="divpasswd">
		            		<label for="lastname" class="col-sm-3 control-label">密码：</label>
		            		<div class="col-sm-9">
		            			<input class="form-control" type="text" id="password" name="password" value=""/>
		            		</div>
		            	</div>
	            		<div class="form-group" id="divrepasswd">
		            		<label for="lastname" class="col-sm-3 control-label">确认密码：</label>
		            		<div class="col-sm-9">
		            			<input class="form-control" type="text" id="repassword" name="repassword" value=""/>
		            		</div>
		            	</div>
	            		<div class="form-group">
		            		<label for="lastname" class="col-sm-3 control-label">姓名：</label>
		            		<div class="col-sm-9">
		            			<input class="form-control" type="text" id="userName" name="userName" value=""/>
		            		</div>
		            	</div>
	            		<div class="form-group">
		            		<label for="lastname" class="col-sm-3 control-label">类型：</label>
		            		<div class="col-sm-9">
		            			<select class="form-control" name="type" id="type">
							        <option value="0">普通</option>
							        <option value="1">负责人</option>
								</select>
		            		</div>
		            	</div>
		         	</div>
	         		<div class="modal-footer">
			            <button type="submit" class="btn btn-primary">
			               	提交更改
			            </button>
		           	</div>
	            </form>
	      	</div><!-- /.modal-content -->
		</div><!-- /.modal -->
	</div>
  </body>

<script type="text/javascript">
	$(function(){
	  	tj="&mobile=${sperson.mobile}&name=${sperson.userName}";
	  	showPage(${page.num},${page.pageNo},3,"<%=path %>/user/user_manage.html",tj,${page.totle});
		$("#userform").validate({
	    	rules: {
	    		mobile: {
	                required: true,
	                maxlength: 11
	            },
	            password: {
	                required: true
	            },
	            repassword: {
	                required: true
	            },
	          	userName: {
	                required: true
	            },
	            depId: {
	                required: true
	            },
	            type: {
	                required: true
	            }
         	},
         	messages: {
         		mobile: {
	                required: "<font color='red'>名称不能为空</font>",
	                maxlength: jQuery.format("<font color='red'>名称不能多于11位</font>")
	            },
	            password: {
	                required: "<font color='red'>密码不能为空</font>"
	            },
	            repassword: {
	                required: "<font color='red'>确认密码不能为空</font>"
	            },
	            userName: {
	                required: "<font color='red'>姓名不能为空</font>"
	            },
	            depId: {
	                required: "<font color='red'>部门不能为空</font>"
	            },
	            type: {
	                required: "<font color='red'>类型不能为空</font>"
	            }
      		},
	        submitHandler:function(form){
	        	if($("#password").val() != $("#repassword").val()){
	        		alert("密码输入不一致");
	        		return false;
	        	}
	        	if($("#id").val() == '0'){
	        		//验证手机号
		        	var myreg = /^(((13[0-9]{1})|(15[0-9]{1})|(18[0-9]{1}))+\d{8})$/; 
					if(!myreg.test($("#mobile").val())){ 
					    alert('请输入有效的手机号码！'); 
					    return false; 
					} 
	        		$.ajax({
		    			url : "<%=path%>/user/validateMobile.json?mobile=" + $("#mobile").val(),
		    			type : 'post',
		    			dataType : 'json',
		    			success : function(data) {
		    				if(data.state == 1){
					        	editUser();
		    				}else{
		    					alert(data.message);
		    					return false;
		    				}
		    			}
		    		});
	        	}else{
		        	editUser();
	        	}
        	}
	    });
	});
	
	
	function openAdd(){
		$("#titleLabel").html("添加用户");
		$("#divpasswd").show();
		$("#divrepasswd").show();
		$("#mobile").removeAttr("disabled");
		$("#id").val('0');
		$("#mobile").val('');
		$("#password").val('');
		$("#repassword").val('');
		$("#userName").val('');
		$("#type").val('');
	}
	
	function openEdit(userId){
		$("#titleLabel").html("修改用户");
		$("#divpasswd").hide();
		$("#divrepasswd").hide();
		$.ajax({  
	        url : '<%=path%>/user/' + userId + '/getPersonnelById.json',  
	        type : "POST",
	        dataType : "json",  
	        success : function(data, status) { 
	        	if(data != null){
					$("#id").val(data.id);
					$("#mobile").val(data.mobile);
					$("#password").val(data.password);
					$("#repassword").val(data.password);
					$("#userName").val(data.userName);
					$("#type").val(data.type);
					$("#mobile").attr("disabled","disabled");
	        	}
	        },
	        error: function(){
	       		alert("操作失败");
	        } 
		});
	}
	
	function editUser(userId){
		$.ajax({  
	        url : '<%=path%>/user/doEditUser.json',  
	        type : "POST",
	        dataType : "json",  
	        data: $("#userform").serialize(),
	        success : function(data, status) { 
	        	if(data.state == 1){
	        		alert(data.message);
	        		window.location.reload();
	        	}else{
		        	alert(data.message);
	        	}
	        },
	        error: function(){
	       		alert("操作失败");
	        } 
		});
	}
	
	function dealState(perId, state){
		$.ajax({  
	        url : '<%=path%>/user/' + perId + '/dealState.json?state=' + state,  
	        type : "POST",
	        dataType : "json",  
	        success : function(data, status) { 
	        	if(data.state == 1){
					alert(data.message);
					window.location.reload();
				}else{
					alert(data.message);
				}
	        },
	        error: function(){
	       		alert("操作失败");
	        } 
	    });
	}
	
	function resetPassword(perId){
		var r=confirm("确认重置密码么？");
		if (r==true) {
			$.ajax({  
		        url : '<%=path%>/user/' + perId + '/resetPassword.json',  
		        type : "POST",
		        dataType : "json",  
		        success : function(data, status) { 
		        	if(data.state == 1){
						alert("密码重置成功");
						window.location.reload();
					}else{
						alert(data.message);
					}
		        },
		        error: function(){
		       		alert("操作失败");
		        } 
		    });
		}
	}
</script>
</html>
