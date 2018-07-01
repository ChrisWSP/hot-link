<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	String spath = request.getContextPath();
%>
<div class="panel-body">
	<div class="panel-body">
		<div class="row">
			<div class="col-md-6"></div>
	   		<div class="col-md-6 col-right">
	   			<label>当前用户：
	   				<a href="javascript:void(0);" onclick="openEditPasswd()" data-toggle="modal" data-target="#editPassWDModal" data-backdrop="static">
	   					${sessionScope.user.userName }
	   				</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	   			</label>
				<a href="<%=spath%>/user/login.jsp"  class="btn btn-default">
	 				<span class="glyphicon glyphicon-arrow-left"></span>退出
	 			</a>
			</div>
		</div>
	</div>
	<!--  class="active"  -->
	<c:if test="${sessionScope.user.type != -1 }">
		<ul class="nav nav-tabs">
		   <li id="li_link_collect"><a href="<%=spath %>/collect/link_collect.html">收藏链接管理</a></li>
		   <li id="li_link_type"><a href="<%=spath %>/collect/link_type.html">链接分类管理</a></li>
		   <li id="li_link_images"><a href="<%=spath %>/collect/link_images.html">图片管理</a></li>
		</ul>
	</c:if>
</div>

<div class="modal fade" id="editPassWDModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" >
   	<div class="modal-dialog">
       	<div class="modal-content">
        	<div class="modal-header">
	            <button type="button" class="close" data-dismiss="modal" aria-hidden="true"> &times; </button>
	            <h4 class="modal-title">
	              	修改资料
	            </h4>
        	</div>
           	<form class="form-horizontal" role="form" id="userform1" method="post" action="">
	            <div class="modal-body">	    
            		<div class="form-group">
	            		<label for="lastname" class="col-sm-3 control-label">手机号：</label>
	            		<div class="col-sm-9">
	            			<input class="form-control" type="text" id="mobileE" value=""/>
	            		</div>
	            	</div>
            		<div class="form-group">
	            		<label for="lastname" class="col-sm-3 control-label">名称：</label>
	            		<div class="col-sm-9">
	            			<input class="form-control" type="text" id="nameE" name="userName" value=""/>
	            		</div>
	            	</div>
            		<div class="form-group">
	            		<label for="lastname" class="col-sm-3 control-label">密码：</label>
	            		<div class="col-sm-9">
	            			<input class="form-control" type="text" id="passwordE" name="password" value=""/>
	            		</div>
	            	</div>
            		<div class="form-group">
	            		<label for="lastname" class="col-sm-3 control-label">确认密码：</label>
	            		<div class="col-sm-9">
	            			<input class="form-control" type="text" id="repasswordE" name="repassword" value=""/>
	            		</div>
	            	</div>  
	         	</div>
         		<div class="modal-footer">
		            <button type="button" class="btn btn-primary" onclick="editPasswd()">
		               	提交更改
		            </button>
	           	</div>
            </form>     
      	</div><!-- /.modal-content -->
	</div><!-- /.modal -->
</div>   
<script type="text/javascript">
	function openEditPasswd(){
		$("#mobileE").val('${sessionScope.user.mobile}');
		$("#nameE").val('${sessionScope.user.userName}');
		$("#passwordE").val('');
		$("#repasswordE").val('');
		$("#mobileE").attr("disabled","disabled");
	} 
	function editPasswd(){
		if($("#nameE").val() == ''){
			alert("名称不能为空");
			return false;
		}
		if($("#passwordE").val() == ''){
			alert("密码不能为空");
			return false;
		}
		if($("#passwordE").val() != $("#repasswordE").val()){
			alert("两次密码输入不一致");
			return false;
		}
		$.ajax({  
	        url : "<%=spath%>/user/user_edit.json", 
	        type : "POST",
	        dataType : "json",  
	        data: $("#userform1").serialize(),
	        success : function(data, status) { 
	        	if(data.state == 1){
	        		alert("密码修改成功");
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
</script>