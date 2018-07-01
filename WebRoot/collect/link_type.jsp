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
    
    <title>收藏链接管理</title>
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
	<script src="<%=path %>/js/WdatePicker.js"></script>
  </head>
 <body>
 	 <div class="panel panel-primary">
	   <div class="panel-heading">
	      <h3 class="panel-title">HOT COLLECT</h3>
	   </div>
	   
        <%@ include file="../common/header.jsp" %> 

	    <div class="panel-body">
	    	<a href="javascript:void(0);" onclick="addType()" data-toggle="modal" data-target="#addType" data-backdrop="static"  class="btn btn-default">
	   			<span class="glyphicon glyphicon-plus"></span>新建分类
			</a>
	    </div>
	    <div class="panel-body">
	   		<table class="table">
		    	<thead>
		        	<tr>
			  			<th>分类名称</th>
			  			<th>父节点</th>
			  			<th>级别</th>
			  			<th>操作</th>
			         </tr>
		      	</thead>
		      	<tbody>
		      		<c:forEach items="${objs }" var="obj">
			  			<tr>
			  				<td>${obj.name}</td>
			  				<td>
			  					<c:if test="${obj.pname == null}">无</c:if>
			  					<c:if test="${obj.pname != null}">${obj.pname}</c:if>
			  				</td>
			  				<td>
			  					<c:if test="${obj.level == 1}">一级目录</c:if>
			  					<c:if test="${obj.level == 2}">二级目录</c:if>
			  				</td>
			  				<td>
			  					<button onclick="editType('${obj.id}')" data-toggle="modal" data-target="#addType" data-backdrop="static" class="btn btn-default btn-sm"> <span class="glyphicon glyphicon-pencil"></span>修改</button>
			  				    <button onclick="delLinkType('${obj.id}')"  class="btn btn-default btn-sm"> <span class="glyphicon glyphicon-delete"></span>删除</button>
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
  </body>
 <div class="modal fade" id="addType" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" >
   	<div class="modal-dialog">
       	<div class="modal-content">
        	<div class="modal-header">
	            <button type="button" class="close" data-dismiss="modal" aria-hidden="true"> &times; </button>
	            <h4 class="modal-title" id="showHeader">
	              	添加链接
	            </h4>
        	</div>
           	<form class="form-horizontal" role="form" id="typeform" method="post" action="">
	            <input type="hidden" id="id" name="id" value=""/>
	            <div class="modal-body">	    
            		<div class="form-group">
	            		<label for="lastname" class="col-sm-3 control-label">名称：</label>
	            		<div class="col-sm-8">
	            			<input class="form-control" type="text" id="name" name="name" value=""/>
	            		</div>
	            	</div>
            		<div class="form-group">
	            		<label for="lastname" class="col-sm-3 control-label">级别：</label>
	            		<div class="col-sm-8">
	            			<select class="form-control" id="level" name="level" onchange="getLinkTypes('level', 'pid')">
	            				<option value="1">一级目录</option>
	            				<option value="2">二级目录</option>
	            			</select>
	            		</div>
	            	</div>
	            	<div class="form-group" id="pidDiv">
	            		<label for="lastname" class="col-sm-3 control-label">分类：</label>
	            		<div class="col-sm-8">
		            		<select id="pid" name="pid"  class="form-control">
				  			</select>
	            		</div>
	            	</div>  
	         	</div>
         		<div class="modal-footer">
		            <button type="button" class="btn btn-primary" onclick="doSave()">
		               	提交更改
		            </button>
		            <input type="reset" id="resetMsg" style="display: none;"/>
	           	</div>
            </form>     
      	</div><!-- /.modal-content -->
	</div><!-- /.modal -->
</div>  
<script type="text/javascript">
	$(function(){
		//顶部标签默认选中
		$("#li_link_type").addClass('active');
	  	showPage(${page.num}, ${page.pageNo}, 3, "<%=path%>/collect/link_type.html", '', ${page.totle});
	});
	
	function addType(){
		$("#resetMsg").click();
		$("#showHeader").html("添加分类");
		getLinkTypes('level', 'pid');
		$("#pidDiv").hide();
	}
	
	function editType(id){
		$("#resetMsg").click();
		$("#showHeader").html("修改分类");
		$.ajax({  
	        url : '<%=path%>/collect/' + id + '/getlinkTypeById.json',  
	        type : "post",
	        dataType : "json",  
	        success : function(data, status) { 
				$("#id").val(id);
				$("#name").val(data.linkType.name);
				$("#level").val(data.linkType.level);
				if(data.linkType.level == 2){
					$("#pidDiv").show();
					getLinkTypes('level', 'pid');
					$("#pid").val(data.linkType.pid);
				}else{
					$("#pidDiv").hide();
				}
	        },
	        error: function(){
	       		alert("操作失败");
	        } 
	    });
		
	}
	
	function doSave(){
		$.ajax({  
	        url : '<%=path%>/collect/saveLinkType.json',  
	        type : "post",
	        data : $("#typeform").serialize(),
	        dataType : "json",  
	        success : function(data, status) { 
        		alert(data.message);
				window.location.reload();
	        },
	        error: function(){
	       		alert("操作失败");
	        } 
	    });
	}
	
	function delLinkType(linkId){
 		if(confirm("确认删除该分类么？")){
			$.ajax({  
       			url : '<%=path%>/collect/'+linkId+'/delLinkType.json ', 
		        type : "POST",
		        dataType : "json",  
		        success : function(data, status) { 
	        		alert("删除成功！");
					window.location.reload();
		        },
		        error: function(){
		       		alert("操作失败");		
		        } 
	    	});
   		}
	}
	
	function getLinkTypes(direct, pid){
		var level = $("#" + direct).val();
		if(level == '2'){
			$("#pidDiv").show();
			$.ajax({
				url: '<%=path%>/collect/getLinkTypes.json?pid=',
				type: 'post',
				dataType: 'json',
				async: false,
				success: function(data, status){
					$("#" + pid).empty();
					$("#" + pid).append("<option value='0'>请选择</option>");
					if(data.linkTypes != null){
						for(var i=0; i<data.linkTypes.length; i++){
							$("#" + pid).append("<option value='" + data.linkTypes[i].id + "'>" + data.linkTypes[i].name + "</option>");
						}
					}
				}
			});
		}else{
			$("#pidDiv").hide();
		}
	}
</script>
</html>
