<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
 <script src="http://sdk.talkingdata.com/app/h5/v1?appid=B49DE68CA22CB992D36F714FC1168B6E&vn=hotlink&vc=1.0.1"></script> 
 	<div class="container-fluid">
	<div class="row-fluid">
		<div class="span12">
			<div class="row-fluid" style="display: ;">
				<div class="span12">
					<div class="carousel slide" id="carousel-247472">
						<div class="carousel-inner">
							<%-- <c:forEach items="${images }" var="image" varStatus="sta">
								<c:if test="${image.url!=null && image.url!='' }">
									<div class="item" class="item<c:if test='${sta.index==2}'> active</c:if>">
										<img alt="" src="<%=path %>/${image.url}"  style="height: 250px; width: 100%"/>
										<div class="carousel-caption">
											<h4>
												${image.title}
											</h4>
											<p>
												${image.info}
											</p>
										</div>
									</div>
								</c:if>
							</c:forEach> --%>
							<div class="item">
								<img alt="" src="<%=path %>/images/banner/1.jpg" style="height: 250px; width: 100%"/>
								<div class="carousel-caption">
									<h4>
										棒球
									</h4>
									<p>
										棒球运动是一种以棒打球为主要特点，集体性、对抗性很强的球类运动项目，在美国、日本尤为盛行。
									</p>
								</div>
							</div>
							<div class="item">
								<img alt="" src="<%=path %>/images/banner/2.jpg"  style="height: 250px; width: 100%"/>
								<div class="carousel-caption">
									<h4>
										冲浪
									</h4>
									<p>
										冲浪是以海浪为动力，利用自身的高超技巧和平衡能力，搏击海浪的一项运动。运动员站立在冲浪板上，或利用腹板、跪板、充气的橡皮垫、划艇、皮艇等驾驭海浪的一项水上运动。
									</p>
								</div>
							</div>
							<div class="item active">
								<img alt="" src="<%=path %>/images/banner/3.jpg" style="height: 250px; width: 100%" />
								<div class="carousel-caption">
									<h4>
										自行车
									</h4>
									<p>
										以自行车为工具比赛骑行速度的体育运动。1896年第一届奥林匹克运动会上被列为正式比赛项目。环法赛为最著名的世界自行车锦标赛。
									</p>
								</div>
							</div>
						</div> 
						<a class="left carousel-control" data-slide="prev" href="#carousel-247472">‹</a> 
						<a class="right carousel-control" data-slide="next" href="#carousel-247472">›</a>
					</div>
				</div>
			</div>
			<div class="row-fluid">
				<div class="span2">
					<div class="accordion" id="directory">
						<c:forEach items="${ptypes }" var="ptype">
							<div class="accordion-group">
								<div class="accordion-heading" <c:if test="${pid == ptype.id }">style="color:blue;"</c:if>>
									<a id="dir_parent_${ptype.id }" class="accordion-toggle btn-lg" data-toggle="collapse" data-parent="#directory" href="javascript:void(0);" onclick="typeClick('${ptype.id }', '')">
										<span class="glyphicon glyphicon-folder-open"></span>&nbsp;&nbsp;${ptype.name }
									</a>
								</div>
								<c:if test="${pid == ptype.id}">
									<div id="dir_son_${ptype.id }" class="accordion-body in">
										<div class="accordion-inner">
											<ul class="nav nav-list" contenteditable="true">
												<c:forEach items="${stypes}" var="stype">
													<li <c:if test="${sid == stype.id }">class="active"</c:if>>
														<a href="javascript:void(0);" onclick="typeClick('${stype.pid}', '${stype.id}')" style="color:#191970;cursor:pointer;">
															<span class="glyphicon glyphicon-file"></span>&nbsp;&nbsp;${stype.name }
														</a>
													</li>
												</c:forEach>
											</ul>
										</div>
									</div>
								</c:if>
							</div> 
						</c:forEach>
					</div>
				</div>
				<div class="span10">
					<ul class="breadcrumb">
						<li <c:if test="${sname == ''}">class="active"</c:if>>
							<a href="javascript:void(0);" onclick="typeClick('${pid}', '')">${pname }</a>
						</li>
						<li>
							<c:if test="${sname != ''}">
								${sname }<span class="divider">/</span>
							</c:if>
						</li>
					</ul>
					<div class="panel panel-default">
						<div class="panel-heading">
							<h3 class="panel-title">
								面板标题
							</h3>
						</div>
						<div class="panel-body">
							<table class="table">
						    	<thead>
						        	<tr>
						            	<th>目录链接</th>
							        </tr>
						      	</thead>
						      	<tbody>
						      		<c:if test="${sid == '' }">
						      			<c:forEach items="${stypes }" var="st">
								  			<tr>
								  				<td>
													<span class="glyphicon glyphicon-file"></span><a id="link_${st.id }" class="accordion-toggle btn-lg" href="javascript:void(0);" onclick="typeClick('${st.pid}', '${st.id}')">${st.name } </a>
												</td>
								  			</tr>
							  			</c:forEach>
						      		</c:if>
						      		<c:forEach items="${slinks }" var="link">
							  			<tr>
							  				<td>
												<span class="glyphicon glyphicon-hand-up"></span><a id="link_${link.id }" class="accordion-toggle btn-lg" href="${link.url }" target="black" title="${link.remark}">${link.name } </a>
											</td>
							  			</tr>
						  			</c:forEach>
						      	</tbody>
						   </table>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
 </body>
 <script type="text/javascript">
 	function typeClick(pid, sid){
 		window.location.href = "<%=path%>/collect/show_collect.html?pid=" + pid + "&sid=" + sid;
 	}
 	
 </script>
</html>
