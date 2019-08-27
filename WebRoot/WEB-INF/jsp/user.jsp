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
	<title>管理员界面</title>
	<link rel="shortcut icon" href="img/dorm.ico"/>
	<!-- 引入css样式文件 -->
	<!-- Bootstrap Core CSS -->
	<link href="<%=basePath%>css/bootstrap.min.css" rel="stylesheet" />
	<!-- MetisMenu CSS -->
	<link href="<%=basePath%>css/metisMenu.min.css" rel="stylesheet" />
	<!-- DataTables CSS -->
	<link href="<%=basePath%>css/dataTables.bootstrap.css" rel="stylesheet" />
	<!-- Room CSS -->
	<link href="<%=basePath%>css/sb-admin-2.css" rel="stylesheet" />
	<!-- Room Fonts -->
	<link href="<%=basePath%>css/font-awesome.min.css" rel="stylesheet" type="text/css" />
	<link href="<%=basePath%>css/boot-crm.css" rel="stylesheet" type="text/css" />
</head>
<body>
<div id="wrapper">
  <!-- 导航栏部分 -->
  <nav class="navbar navbar-default navbar-static-top" role="navigation"
		 style="margin-bottom: 0">
	<div class="navbar-header">
		<a class="navbar-brand" href="<%=basePath%>userManage"><strong>高校寝室管理系统</strong></a>
	</div>
	    <!-- 用户状态 -->
		<br class="dropdown">
			<a class="dropdown-toggle" data-toggle="dropdown" style="text-decoration:none"> 
				<img src="img/manager.png" id="user"></img>
			</a>
			<a class="AdminSession" style="text-decoration:none">管理员</a>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<img src="img/logout.png" id="logout"></img>
			<a href = "${pageContext.request.contextPath}/logout">
				<i class = "adminlogout"></i>退出登录
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
				    <a href="${pageContext.request.contextPath}/userManage"  class="active">
				       <img src="img/userManage.ico" id="userManage"> 用户管理
				    </a>
				</li>
				<li>
				    <a href="${pageContext.request.contextPath}/room/list2">
				       <img src="img/roomManage.png" id="roomManage"> 寝室管理
				    </a>
				</li>
				<li>
				    <a href="${pageContext.request.contextPath}/student2" >
				        <img src="img/studentManage.png" id="studentManage">  学生管理
				    </a>
				</li>
				<li>
				    <a href="${pageContext.request.contextPath}/repair2" >
				      <img src="img/repairManage.png" id="repairManage"> 报修管理
				    </a>
				</li>
			</ul>
		</div>
	</div>
	
	<!-- 左侧显示列表部分 end--> 
  </nav>
    <!-- 用户列表查询部分  start-->
	<div id="page-wrapper">
		<div class="row">
			<div class="col-lg-12">
				<h1 class="page-header">用户管理</h1>
			</div>
			<!-- /.col-lg-12 -->
		</div>
		<!-- /.row -->
		<div class="panel panel-default">
			<div class="panel-body">
				<form class="form-inline" method="post" 
				      action="${pageContext.request.contextPath}/userManage">
					<div class="form-group">
						<label for="name">用户名</label> 
						<input type="text" class="form-control" id="Name" 
						                   value="${name}" name="name" />
					</div>
					<button type="submit" class="btn btn-primary">查询</button>
				</form>
			</div>
		</div>
		           <br></br>
		           <!-- data-toggle和data-target是BootStrap的模拟框代码 -->
		<div class="row">
			<div class="col-lg-12">
				<div class="panel panel-default">
					<div class="panel-heading">用户列表</div>
					<!-- /.panel-heading -->
					<table class="table table-bordered table-striped">
						<thead>
							<tr>
								<th>用户名</th>
								<th>用户密码</th>
								<th></th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${page.rows}" var="row">
								<tr>
									<td>${row.name}</td>
									<td>${row.password}</td>
									<td>
						<a href="#" class="btn btn-primary btn-xs" data-toggle="modal" data-target="#userEditDialog"
										 onclick= "editUser(${row.name})">修改密码</a>
						<a href="#" class="btn btn-danger btn-xs" data-toggle="modal" onclick="deleteUser(${row.name})">删除用户</a>
									</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
					<div class="col-md-12 text-right">
						<itheima:page url="${pageContext.request.contextPath }/userManage" />
					</div>
					<!-- /.panel-body --> 
				</div>
				<!-- /.panel ->
			</div>
			<!-- /.col-lg-12 -->
		</div>
	</div>
	<!-- 寝室列表查询部分  end-->
</div>

<!-- 修改用户模态框 -->
<div class="modal fade" id="userEditDialog" tabindex="-1" role="dialog"
	aria-labelledby="myModalLabel">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<h4 class="modal-title" id="myModalLabel">修改密码</h4>
			</div>
			<div class="modal-body">
				<form class="form-horizontal" id="edit_user_form">
					<input type="hidden" id="edit_id" name="id"/>
					<div class="form-group">
						<label for="edit_name" class="col-sm-2 control-label">用户名</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="edit_name" placeholder="用户名" name="name"/>
						</div>
					</div>
					<div class="form-group">
						<label for="edit_password" class="col-sm-2 control-label">用户密码</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="edit_password" placeholder="用户密码" name="password" />
						</div>
					</div>
				</form>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
				<button type="button" class="btn btn-primary" onclick="updateUser()">保存修改</button>
			</div>
		</div>
	</div>
</div>

<!-- 引入js文件 -->
<!-- jQuery -->
<script src="<%=basePath%>js/jquery-1.11.3.min.js"></script>
<!-- Bootstrap Core JavaScript -->
<script src="<%=basePath%>js/bootstrap.min.js"></script>
<!-- Metis Menu Plugin JavaScript -->
<script src="<%=basePath%>js/metisMenu.min.js"></script>
<!-- DataTables JavaScript -->
<script src="<%=basePath%>js/jquery.dataTables.min.js"></script>
<script src="<%=basePath%>js/dataTables.bootstrap.min.js"></script>
<!-- Custom Theme JavaScript -->
<script src="<%=basePath%>js/sb-admin-2.js"></script>
<!-- 编写js代码 -->
<script type="text/javascript">
	// 通过name获取修改的用户信息
	function editUser(name) {
	    $.ajax({
	        type:"get",
	        url:"<%=basePath%>/userManage/findUserByName",
	        data:{"name":name},
	        success:function(data) {
	            $("#edit_name").val(data.name);
	            $("#edit_password").val(data.password);
	        }
	    });
	}
    // 执行修改密码操作
	function updateUser() {
		$.post("<%=basePath%>/userManage/updateUser",$("#edit_user_form").serialize(),function(data){
			if(data =="OK"){
				alert("用户密码修改成功！");
				window.location.reload();
			}else{
				alert("用户密码修改失败！");
				window.location.reload();
			}
		});
	}
	// 删除用户
	function deleteUser(name) {
	    if(confirm('确实要删除该用户吗?')) {
	$.post("<%=basePath%>/userManage/deleteUser",{"name":name},
	function(data){
	            if(data =="OK"){
	                alert("用户删除成功！");
	                window.location.reload();
	            }else{
	                alert("用户删除失败！");
	                window.location.reload();
	            }
	        });
	    }
	}
</script>
</body>
</html>