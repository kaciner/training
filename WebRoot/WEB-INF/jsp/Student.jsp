 <%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="itheima" uri="http://itheima.com/common/"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() 
	                   + ":" + request.getServerPort() + path + "/";
%>
<!DOCTYPE HTML>
<html>
<head>
	<base href="<%=basePath%>">
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>用户界面</title>
	<link rel="shortcut icon" href="img/dorm.ico"/>
	<!-- 引入css样式文件 -->
	<!-- Bootstrap Core CSS -->
	<link href="<%=basePath%>css/bootstrap.min.css" rel="stylesheet" />
	<!-- MetisMenu CSS -->
	<link href="<%=basePath%>css/metisMenu.min.css" rel="stylesheet" />
	<!-- DataTables CSS -->
	<link href="<%=basePath%>css/dataTables.bootstrap.css" rel="stylesheet" />
	<!-- Student CSS -->
	<link href="<%=basePath%>css/sb-admin-2.css" rel="stylesheet" />
	<!-- Student Fonts -->
	<link href="<%=basePath%>css/font-awesome.min.css" rel="stylesheet" type="text/css" />
	<link href="<%=basePath%>css/boot-crm.css" rel="stylesheet" type="text/css" />
</head>
<body>
<div id="wrapper">
  <!-- 导航栏部分 -->
  <nav class="navbar navbar-default navbar-static-top" role="navigation"
		 style="margin-bottom: 0">
	<div class="navbar-header">
		<a class="navbar-brand" href="<%=basePath%>student"><strong>高校寝室管理系统</strong></a>
	</div>
	    <!-- 用户状态 -->
		<br class="dropdown">
			<a class="dropdown-toggle" data-toggle="dropdown" style="text-decoration:none"> 
				<img src="img/user.png" id="user"></img>
			</a>
			<a class="AdminSession" style="text-decoration:none">用户：${UserSession.name}</a>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<img src="img/logout.png" id="logout"></img>
			<a href = "${pageContext.request.contextPath}/logout">
				<i class = "logout"></i>退出登录
			</a>
		</br>
	<!-- 左侧显示列表部分 start-->
	<div class="navbar-default sidebar" role="navigation">
		<div class="sidebar-nav navbar-collapse">
			<ul class="nav" id="side-menu">
				<li class="sidebar-search">
					<div class="input-group custom-search-form">
						<input type="text" class="form-control" placeholder="查询内容">
						<span class="input-group-btn">
							<button class="btn btn-default" type="button">
								<i class="fa fa-search" style="padding: 3px 0 3px 0;"></i>
								 <img src="img/search.png" id="search">
							</button>
						</span>
					</div> 
				</li>
				<li>
				    <a href="${pageContext.request.contextPath}/room/list">
				       <img src="img/roomManage.png" id="roomManage"> 寝室情况
				    </a>
				</li>
				<li>
				    <a href="${pageContext.request.contextPath}/student"  class="active">
				        <img src="img/studentManage.png" id="studentManage">  学生情况
				    </a>
				</li>
				<li>
				    <a href="${pageContext.request.contextPath}/repair">
				      <img src="img/repairManage.png" id="repairManage"> 报修情况
				    </a>
				</li>
			</ul>
		</div>
	</div>
	
	<!-- 左侧显示列表部分 end--> 
  </nav>
    <!-- 学生列表查询部分  start-->
	<div id="page-wrapper">
		<div class="row">
			<div class="col-lg-12">
				<h1 class="page-header">学生情况</h1>
			</div>
			<!-- /.col-lg-12 -->
		</div>
		<!-- /.row -->
		<div class="panel panel-default">
			<div class="panel-body">
				<form class="form-inline" method="post" 
				      action="${pageContext.request.contextPath}/student">
					<div class="form-group">
						<label for="StudentId">学号</label> 
						<input type="text" class="form-control" id="Id" 
						                   value="${id}" name="id" />
					</div>
					<div class="form-group">
						<label for="StudentName">学生姓名</label> 
						<input type="text" class="form-control" id="name" 
						                   value="${name}" name="name"	 />
					</div>
					<button type="submit" class="btn btn-primary">查询</button>
				</form>
			</div>
		</div>
		<div class="row">
			<div class="col-lg-12">
				<div class="panel panel-default">
					<div class="panel-heading">学生信息列表</div>
					<!-- /.panel-heading -->
					<table class="table table-bordered table-striped">
						<thead>
							<tr>
								<th>学号</th>
								<th>学生姓名</th>
								<th>学生年级</th>
								<th>学生专业</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${page.rows}" var="row">
								<tr>
									<td>${row.id}</td>
									<td>${row.name}</td>
									<td>${row.grade}</td>
									<td>${row.major}</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
					<div class="col-md-12 text-right">
						<itheima:page url="${pageContext.request.contextPath }}/student" />
					</div>
					<!-- /.panel-body --> 
				</div>
				<!-- /.panel ->
			</div>
			<!-- /.col-lg-12 -->
		</div>
	</div>
	<!-- 学生列表查询部分  end-->
</div>
</body>
</html>