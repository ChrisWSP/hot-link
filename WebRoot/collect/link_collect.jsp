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
	    	<a href="javascript:void(0);" onclick="addCollect()" data-toggle="modal" data-target="#addCollect" data-backdrop="static"  class="btn btn-default">
	   			<span class="glyphicon glyphicon-plus"></span>新建收藏
			</a>
	    </div>
	    <div class="panel-body">
	   		<form  id="myform" class="form-inline" role="form" action="<%= path %>/collect/link_collect.html"  method="post">
		   		<label for="name">链接类型：</label>
			  	<select id="slevel" name="slevel"  class="form-control" onchange="getLinkTypes(this.value, 'spid')">
           			<option value="0" selected>全部</option>
           			<option value="1">一级目录</option>
           			<option value="2">二级目录</option>
	  			</select>
		   		<label for="name">链接类型：</label>
			  	<select id="spid" name="spid"  class="form-control">
			  		<option value="0">全部</option>
			  	</select>
			  	<label for="name">链接名称</label>
			  	<input id="sname" name="linkName" class="form-control" value=""/>
			  	<button type="submit" class="btn btn-primary btn-sm">搜索</button>
	   		</form>
	   	</div>
	   
	    <div class="panel-body">
	   		<table class="table">
		    	<thead>
		        	<tr>
			            <th>顺序</th>
			  			<th>链接名称</th>
			  			<th>分类</th>
			  			<th>地址URL</th>
			  			<th>创建时间</th>
			  			<th>备注</th>
			  			<th>操作</th>
			         </tr>
		      	</thead>
		      	<tbody>
		      		<c:forEach items="${objs }" var="obj">
			  			<tr>
			  				<td>${obj.sequence}</td>
			  				<td>${obj.linkName }</td>
			  				<td>${obj.typeName }</td>
			  				<td><a href="${obj.url }" target="blank">${obj.url }</a></td>
			  				<td>${el:longToDetailTime(obj.createTime) }</td>
			  				<td>${el: formarRemark(obj.remark)}</td>
			  				<td>
			  					<button onclick="editCollect('${obj.linkId}')" data-toggle="modal" data-target="#addCollect" data-backdrop="static" class="btn btn-default btn-sm"> <span class="glyphicon glyphicon-pencil"></span>修改</button>
			  				    <button onclick="deleteCollect('${obj.linkId}')"  class="btn btn-default btn-sm"> <span class="glyphicon glyphicon-delete"></span>删除</button>
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
 <div class="modal fade" id="addCollect" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" >
   	<div class="modal-dialog">
       	<div class="modal-content">
        	<div class="modal-header">
	            <button type="button" class="close" data-dismiss="modal" aria-hidden="true"> &times; </button>
	            <h4 class="modal-title" id="showHeader">
	              	添加链接
	            </h4>
        	</div>
           	<form class="form-horizontal" role="form" id="linkform" method="post" action="">
	            <input type="hidden" id="id" name="id" value=""/>
	            <div class="modal-body">	    
            		<div class="form-group">
	            		<label for="lastname" class="col-sm-3 control-label">名称：</label>
	            		<div class="col-sm-8">
	            			<input class="form-control" type="text" id="name" name="name" value=""/>
	            		</div>
	            	</div>
	            	<div class="form-group">
	            		<label for="lastname" class="col-sm-3 control-label">一级：</label>
	            		<div class="col-sm-8">
		            		<select id="level" name="slevel"  class="form-control" onchange="getLinkTypes(this.value, 'pid')">
				  			</select>
	            		</div>
	            	</div>
            		<div class="form-group">
	            		<label for="lastname" class="col-sm-3 control-label">二级目录：</label>
	            		<div class="col-sm-8">
		            		<select id="pid" name="pid"  class="form-control">
				  			</select>
	            		</div>
	            	</div>
            		<div class="form-group">
	            		<label for="lastname" class="col-sm-3 control-label">URL：</label>
	            		<div class="col-sm-8">
	            			<textarea id="url" name="url" class="form-control" rows="3"></textarea>
	            		</div>
	            	</div>
            		<div class="form-group">
	            		<label for="lastname" class="col-sm-3 control-label">顺序：</label>
	            		<div class="col-sm-8">
	            			<input class="form-control" type="text" id="sequence" name="sequence" value=""/>
	            		</div>
	            	</div>  
            		<div class="form-group">
	            		<label for="lastname" class="col-sm-3 control-label">备注：</label>
	            		<div class="col-sm-8">
            				<textarea id="remark" name="remark" class="form-control" rows="5"></textarea>
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
		getLinkTypes('', 'slevel');
		$("#slevel").val('${modelVO.slevel}');
		if('${modelVO.slevel}' != '' && '${modelVO.slevel}' != '0'){
			getLinkTypes('${modelVO.slevel}', 'spid');
		}
		
		$("#spid").val('${modelVO.spid}');
		$("#sname").val('${modelVO.linkName}');
		//顶部标签默认选中
		$("#li_link_collect").addClass('active');
	  	tj="&slevel=${modelVO.slevel}&spid=${modelVO.spid}&linkName=${modelVO.linkName}";
	  	showPage(${page.num},${page.pageNo},3,"<%=path%>/collect/link_collect.html",tj,${page.totle});
	});
	
	function addCollect(){
		$("#resetMsg").click();
		$("#showHeader").html("添加链接");
		getLinkTypes('', 'level');
	}
	function editCollect(id){
		$("#resetMsg").click();
		$("#showHeader").html("修改链接");
		$.ajax({  
	        url : '<%=path%>/collect/' + id + '/getCollectById.json',  
	        type : "post",
	        dataType : "json",  
	        success : function(data, status) {
				$("#id").val(id);
				$("#name").val(data.link.name);
				$("#url").val(data.link.url);
				$("#sequence").val(data.link.sequence);
				getLinkTypes('', 'level');
				if(data.link.ppid == '0'){
					$("#level").val(data.link.pid);				
				}else{
					$("#level").val(data.link.ppid);				
					getLinkTypes(data.link.ppid, 'pid');
					$("#pid").val(data.link.pid);				
				}
				$("#remark").val(data.link.remark);
				$("#pid").val(data.link.pid);
	        },
	        error: function(){
	       		alert("操作失败");
	        } 
	    });
		
	}
	
	function doSave(){
		if($("#level").val() == '' && $("#pid").val() == ''){
			alert("请至少选择一个目录");
			return;
		}
		$.ajax({  
	        url : '<%=path%>/collect/doSave.json',  
	        type : "post",
	        data : $("#linkform").serialize(),
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
	
	function deleteCollect(linkId){
 		if(confirm("确认删除该链接么？")){
			$.ajax({  
       			url : '<%=path%>/collect/'+linkId+'/doDelete.json ', 
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
	
	function getLinkTypes(pid, direct){
		$.ajax({
			url: '<%=path%>/collect/getLinkTypes.json?pid=' + pid,
			type: 'post',
			dataType: 'json',
			async: false,
			success: function(data, status){
				$("#" + direct).empty();
				$("#" + direct).append("<option value='0'>请选择</option>");
				if(data.linkTypes != null){
					for(var i=0; i<data.linkTypes.length; i++){
						$("#" + direct).append("<option value='" + data.linkTypes[i].id + "'>" + data.linkTypes[i].name + "</option>");
					}
				}
			}
		});
	}
</script>
</html>
