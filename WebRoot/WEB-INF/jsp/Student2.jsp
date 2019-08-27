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
		<a class="navbar-brand" href="${pageContext.request.contextPath}/student2"><strong>高校寝室管理系统</strong></a>
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
				    <a href="${pageContext.request.contextPath}/userManage" >
				       <img src="img/userManage.ico" id="userManage"> 用户管理
				    </a>
				</li>
				<li>
				    <a href="${pageContext.request.contextPath}/room/list2" >
				       <img src="img/roomManage.png" id="roomManage"> 寝室管理
				    </a>
				</li>
				<li>
				    <a href="${pageContext.request.contextPath}/student2" class="active">
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
    <!-- 学生列表查询部分  start-->
	<div id="page-wrapper">
		<div class="row">
			<div class="col-lg-12">
				<h1 class="page-header">学生管理</h1>
			</div>
			<!-- /.col-lg-12 -->
		</div>
		<!-- /.row -->
		<div class="panel panel-default">
			<div class="panel-body">
				<form class="form-inline" method="post" 
				      action="${pageContext.request.contextPath }/student2">
					<div class="form-group">
						<label for="roomName">学号</label> 
						<input type="text" class="form-control" id="Id" 
						                   value="${id}" name="id" />
					</div>
					<div class="form-group">
						<label for="roomFrom">学生姓名</label> 
						<input type="text" class="form-control" id="name" 
						                   value="${name}" name="name"	 />
					</div>
					<button type="submit" class="btn btn-primary">查询</button>
				</form>
			</div>
		</div>
		<a href="#" class="btn btn-primary" data-toggle="modal" 
		           data-target="#newStudentDialog" onclick="clearStudent()">新增</a>
		          <br></br>
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
								<th>学生寝室编号</th>
								<th></th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${page.rows}" var="row">
								<tr>
									<td>${row.id}</td>
									<td>${row.name}</td>
									<td>${row.grade}</td>
									<td>${row.major}</td>
									<td>${row.roomid}</td>
									<td>
										<a href="#" class="btn btn-primary btn-xs" data-toggle="modal" data-target="#studentEditDialog"
										 onclick= "editStudent(${row.id})">修改</a>
						<a href="#" class="btn btn-danger btn-xs" data-toggle="modal" onclick="deleteStudent(${row.id})">删除</a>
									</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
					<div class="col-md-12 text-right">
						<itheima:page url="${pageContext.request.contextPath }}/student2" />
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

<!-- 创建学生模态框 -->
<div class="modal fade" id="newStudentDialog" tabindex="-1" role="dialog"
	aria-labelledby="myModalLabel">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<h4 class="modal-title" id="myModalLabel">新增学生信息</h4>
			</div>
			<div class="modal-body">
				<form class="form-horizontal" id="new_student_form">
					<div class="form-group">
						<label for="new_Id" class="col-sm-2 control-label">
						    学号
						</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="new_Id" placeholder="学号" name="id" />
						</div>
					</div>
					<div class="form-group">
						<label for="new_Name" class="col-sm-2 control-label">学生姓名</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="new_Name" placeholder="学生姓名" name="name" />
						</div>
					</div>
					<div class="form-group">
						<label for="new_Grade" class="col-sm-2 control-label">学生年级</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="new_Grade" placeholder="学生年级" name="grade" />
						</div>
					</div>
					<div class="form-group">
						<label for="new_Major" class="col-sm-2 control-label">学生专业</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="new_Major" placeholder="学生专业" name="major" />
						</div>
					</div>
					<div class="form-group">
						<label for="new_Roomid" class="col-sm-2 control-label">寝室编号</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="new_Roomid" placeholder="寝室编号" name="roomid" />
						</div>
					</div>
				</form>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
				<button type="button" class="btn btn-primary" onclick="addStudent()">新增学生</button> 
			</div>
		</div>
	</div>
</div>

<!-- 修改学生模态框 -->
<div class="modal fade" id="studentEditDialog" tabindex="-1" role="dialog"
	aria-labelledby="myModalLabel">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<h4 class="modal-title" id="myModalLabel">修改学生信息</h4>
			</div>
			<div class="modal-body">
				<form class="form-horizontal" id="edit_student_form">
					<div class="form-group">
						<label for="edit_id" class="col-sm-2 control-label">学号</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="edit_id" placeholder="学号" name="id" readonly/>
						</div>
					</div>
					<div class="form-group">
						<label for="edit_name" class="col-sm-2 control-label">学生姓名</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="edit_name" placeholder="学生姓名" name="name" />
						</div>
					</div>
					<div class="form-group">
						<label for="edit_grade" class="col-sm-2 control-label">学生年级</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="edit_grade" placeholder="学生年级" name="grade" />
						</div>
					</div>
					<div class="form-group">
						<label for="edit_major" class="col-sm-2 control-label">学生专业</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="edit_major" placeholder="学生专业" name="major" />
						</div>
					</div>
					<div class="form-group">
						<label for="edit_roomid" class="col-sm-2 control-label">寝室编号</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="edit_roomid" placeholder="寝室编号" name="roomid" />
						</div>
					</div>
				</form>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
				<button type="button" class="btn btn-primary" onclick="updateStudent()">保存修改</button>
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
//清空新建学生窗口中的数据
	function clearStudent() {
	    $("#new_Id").val("");
	    $("#new_Name").val("")
	    $("#new_Grade").val("")
	    $("#new_Major").val("")
	    $("#new_Roomid").val("")
	}
	// 新增学生
	function addStudent() {
	$.post("<%=basePath%>/student2/add",
	$("#new_student_form").serialize(),function(data){
	        if(data =="OK"){
	            alert("学生增加成功！");
	            window.location.reload();
	        }else{
	            alert("学生增加失败！");
	            window.location.reload();
	        }
	    });
	}
	// 通过id获取修改的学生信息
	function editStudent(id) {
	    $.ajax({
	        type:"get",
	        url:"<%=basePath%>/student2/findStudentById",
	        data:{"id":id},
	        success:function(data) {
	            $("#edit_id").val(data.id);
	            $("#edit_name").val(data.name);
	            $("#edit_grade").val(data.grade)
	            $("#edit_major").val(data.major)
	            $("#edit_roomid").val(data.roomid)
	        }
	    });
	}
    // 执行修改学生操作
	function updateStudent() {
		$.post("<%=basePath%>/student2/updatestudent",$("#edit_student_form").serialize(),function(data){
			if(data =="OK"){
				alert("学生信息更新成功！");
				window.location.reload();
			}else{
				alert("学生信息更新失败！");
				window.location.reload();
			}
		});
	}
	// 删除学生
	function deleteStudent(id) {
	    if(confirm('确实要删除该学生吗?')) {
	$.post("<%=basePath%>/student2/deletestudent",{"id":id},
	function(data){
	            if(data =="OK"){
	                alert("学生删除成功！");
	                window.location.reload();
	            }else{
	                alert("学生删除失败！");
	                window.location.reload();
	            }
	        });
	    }
	}
</script>
</body>
</html>