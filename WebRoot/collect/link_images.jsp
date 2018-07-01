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
	<script src="<%=path %>/js/jquery/ajaxfileupload.js"></script>
	<link href="<%=path %>/js/jquery/skins/simple.css" rel="stylesheet" /> 
	<script src="<%=path %>/js/jquery/artDialog.min.js"></script>
  </head>
 <body>
 	 <div class="panel panel-primary">
	   <div class="panel-heading">
	      <h3 class="panel-title">HOT COLLECT</h3>
	   </div>
	   
        <%@ include file="../common/header.jsp" %> 

	    <div class="panel-body">
	    	<a href="javascript:void(0);" onclick="addImage()" data-toggle="modal" data-target="#addImage" data-backdrop="static"  class="btn btn-default">
	   			<span class="glyphicon glyphicon-plus"></span>新建图片
			</a>
	    </div>
	    <div class="panel-body">
	   		<table class="table">
		    	<thead>
		        	<tr>
			  			<th>标题</th>
			  			<th>类型</th>
			  			<th>简介</th>
			  			<th>预览</th>
			  			<th>备注</th>
			  			<th>操作</th>
			         </tr>
		      	</thead>
		      	<tbody>
		      		<c:forEach items="${objs }" var="obj">
			  			<tr>
			  				<td>${obj.title}</td>
			  				<td>
			  					<c:if test="${obj.type == 1}">顶部</c:if>
			  					<c:if test="${obj.type == 2}">底部</c:if>
			  				</td>
			  				<td>
			  					${obj.info}
			  				</td>
			  				<td>
			  					<c:if test="${obj.url!=null && obj.url!='' }">
			  						<a href="javascript:void(0);" onclick="imgPreview('${obj.url}', '<%=path %>')">
			  							<img title="${obj.title}" src="<%=path %>${obj.url}" width="100px">
			  						</a>
			  					</c:if>
			  				</td>
			  				<td>
			  					${obj.remark}
			  				</td>
			  				<td>
			  					<button onclick="editImage('${obj.id}')" data-toggle="modal" data-target="#addImage" data-backdrop="static" class="btn btn-default btn-sm"> <span class="glyphicon glyphicon-pencil"></span>修改</button>
			  				    <button onclick="deleteImage('${obj.id}')"  class="btn btn-default btn-sm"> <span class="glyphicon glyphicon-delete"></span>删除</button>
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
 <div class="modal fade" id="addImage" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" >
   	<div class="modal-dialog">
       	<div class="modal-content">
        	<div class="modal-header">
	            <button type="button" class="close" data-dismiss="modal" aria-hidden="true"> &times; </button>
	            <h4 class="modal-title" id="showHeader">
	              	添加图片
	            </h4>
        	</div>
           	<form class="form-horizontal" role="form" id="imageform" method="post" action="">
	            <input type="hidden" id="id" name="id" value=""/>
	            <div class="modal-body">	    
            		<div class="form-group">
	            		<label for="lastname" class="col-sm-3 control-label">标题：</label>
	            		<div class="col-sm-8">
	            			<input class="form-control" type="text" id="title" name="title" value=""/>
	            		</div>
	            	</div>
            		<div class="form-group">
	            		<label for="lastname" class="col-sm-3 control-label">类型：</label>
	            		<div class="col-sm-8">
	            			<select class="form-control" id="type" name="type">
	            				<option value="1">顶部</option>
	            				<option value="2">底部</option>
	            			</select>
	            		</div>
	            	</div>
	            	<div class="form-group">
	            		<label for="lastname" class="col-sm-3 control-label">图片：</label>
	            		<div class="col-sm-8">
	            			<input type="hidden" name="url" id="url" value=""/>
	            			<input id="fileUpload" type="file" style="display: none;"/>
	            			<button type="button" onclick="fileUploadClick();" class="btn btn-default btn-xs"><span class='glyphicon glyphicon-open'></span>选择附件</button><span id="imgspan"></span>
	            		</div>
	            	</div>
	            	
	            	<div class="form-group">
	            		<label for="lastname" class="col-sm-3 control-label">简介：</label>
	            		<div class="col-sm-8">
	            			<textarea id="info" name="info" class="form-control" rows="3"></textarea>
	            		</div>
	            	</div>
	            	<div class="form-group">
	            		<label for="lastname" class="col-sm-3 control-label">备注：</label>
	            		<div class="col-sm-8">
	            			<textarea id="remark" name="remark" class="form-control" rows="4"></textarea>
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
		$("#li_link_images").addClass('active');
		$("#imgspan").html('');
	  	$("#url").val('');
	  	$("#fileUpload").live("change", function(){
	  		upload('fileUpload');
	  	});
	  	showPage(${page.num}, ${page.pageNo}, 3, "<%=path%>/collect/link_images.html", '', ${page.totle});
	});
	
	function addImage(){
		$("#imgspan").html('');
		$("#resetMsg").click();
		$("#showHeader").html("添加图片");
	}
	
	function editImage(id){
		$("#imgspan").html('');
		$("#resetMsg").click();
		$("#showHeader").html("修改图片");
		$.ajax({  
	        url : '<%=path%>/collect/getLinkImageById.json?id=' + id,  
	        type : "post",
	        dataType : "json",  
	        success : function(data, status) { 
				$("#id").val(id);
				$("#title").val(data.linkImage.title);
				$("#type").val(data.linkImage.type);
				if(typeof(data.linkImage.url) != 'undefined' && data.linkImage.url != null && data.linkImage.url != ''){
					$("#url").val(data.linkImage.url);
					$("#imgspan").html("<img src='<%=path%>/"+data.linkImage.url+"' width='100px'>");
				}
				$("#info").val(data.linkImage.info);
				$("#remark").val(data.linkImage.remark);
	        },
	        error: function(){
	       		alert("操作失败");
	        } 
	    });
		
	}
	
	function doSave(){
		$.ajax({  
	        url : '<%=path%>/collect/saveLinkImage.json',  
	        type : "post",
	        data : $("#imageform").serialize(),
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
	
	function deleteImage(id){
		alert(id);
 		if(confirm("确认删除该图片么？")){
			$.ajax({  
       			url : '<%=path%>/collect/deleteImage.json?id=' + id, 
		        type : "POST",
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
	}
	
	function fileUploadClick(){
		$("#fileUpload").click();
	}
	
	//上传图片
	function upload(uploadFile){
		$.ajaxFileUpload({
	    	url:'<%=path%>/fileUpload/upload-1.json',
	      	secureuri:false,
	      	type: 'post',
	      	fileElementId:uploadFile,
	      	dataType:'json',
	      	success: function (map, status) {
	      		if(map.status == 1){
	          		$("#imgspan").html("<img src='<%=path%>/"+map.filePath+"' width='100px'>");
	          		$("#url").val(map.filePath);
          		}else{
          			alert(map.result);
          		}
	      	},
	        error: function (data, status, e) {
	            alert("【服务器异常，请联系管理员!!!】"+e);
	        }
	  	});
	}
	
	function imgPreview(url, path){
		var html = "<img src='"+path + url+"' width='100%' onerror='this.src=\""+path+"/images/errorimg.jpg\"'>";
		dialog =art.dialog({
		    content: html,
		    lock: true,
		    resize: true,
		    left: '25%',
		    top: '20%',
	    	outsideCancleable: true,
	    	padding: '0px 0px'
		});
	}
</script>
</html>
