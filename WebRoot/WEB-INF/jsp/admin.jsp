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
		<a class="navbar-brand" href="<%=basePath%>room/list2"><strong>高校寝室管理系统</strong></a>
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
				    <a href="${pageContext.request.contextPath}/room/list2" class="active">
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
    <!-- 寝室列表查询部分  start-->
	<div id="page-wrapper">
		<div class="row">
			<div class="col-lg-12">
				<h1 class="page-header">寝室管理</h1>
			</div>
			<!-- /.col-lg-12 -->
		</div>
		<!-- /.row -->
		<div class="panel panel-default">
			<div class="panel-body">
				<form class="form-inline" method="post" 
				      action="${pageContext.request.contextPath}/room/list2">
					<div class="form-group">
						<label for="roomName">寝室楼层</label> 
						<input type="text" class="form-control" id="Build" 
						                   value="${build}" name="build" />
					</div>
					<div class="form-group">
						<label for="roomFrom">寝室号码</label> 
						<input type="text" class="form-control" id="Number" 
						                   value="${number}" name="number" />
					</div>
					<button type="submit" class="btn btn-primary">查询</button>
				</form>
			</div>
		</div>
		<a href="#" class="btn btn-primary" data-toggle="modal" 
		           data-target="#newRoomDialog" onclick="clearRoom()">新增</a>  
		           <br></br>
		           <!-- data-toggle和data-target是BootStrap的模拟框代码 -->
		<div class="row">
			<div class="col-lg-12">
				<div class="panel panel-default">
					<div class="panel-heading">寝室信息列表</div>
					<!-- /.panel-heading -->
					<table class="table table-bordered table-striped">
						<thead>
							<tr>
								<th>寝室编号</th>
								<th>寝室楼层</th>
								<th>寝室号码</th>
								<th>寝室学生性别</th>
								<th>寝室状态</th>
								<th></th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${page.rows}" var="row">
								<tr>
									<td>${row.id}</td>
									<td>${row.build}</td>
									<td>${row.number}</td>
									<td>${row.sex}</td>
									<td>${row.status}</td>
									<td>
						<a href="#" class="btn btn-primary btn-xs" data-toggle="modal" data-target="#roomEditDialog"
										 onclick= "editRoom(${row.id})">修改</a>
						<a href="#" class="btn btn-danger btn-xs" data-toggle="modal" onclick="deleteRoom(${row.id})">删除</a>
						<a href="#" class="btn btn-primary btn-xs" data-toggle="modal" data-target="#studentDialog" 
						onclick="selectStudent(${row.id})">查看学生信息</a>
						<a href="#" class="btn btn-primary btn-xs" data-toggle="modal" data-target="#repairDialog" 
						onclick="selectRepair(${row.id})">查看报修信息</a>
									</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
					<div class="col-md-12 text-right">
						<itheima:page url="${pageContext.request.contextPath }/room/list2" />
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

<!-- 创建寝室模态框 -->
<div class="modal fade" id="newRoomDialog" tabindex="-1" role="dialog"
	aria-labelledby="myModalLabel">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<h4 class="modal-title" id="myModalLabel">新增寝室信息</h4>
			</div>
			<div class="modal-body">
				<form class="form-horizontal" id="new_room_form">
					<div class="form-group">
						<label for="new_Build" class="col-sm-2 control-label">
						    寝室楼号
						</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="new_Build" placeholder="寝室楼号" name="build" />
						</div>
					</div>
					<div class="form-group">
						<label for="new_Number" class="col-sm-2 control-label">寝室号码</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="new_Number" placeholder="寝室号码" name="Number" />
						</div>
					</div>
					<div class="form-group">
						<label for="new_Sex" class="col-sm-2 control-label">学生性别</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="new_Sex" placeholder="学生性别" name="Sex" />
						</div>
					</div>
					<div class="form-group">
						<label for="new_Status" class="col-sm-2 control-label">寝室状态</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="new_Status" placeholder="寝室状态" name="Status" />
						</div>
					</div>
				</form>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
				<button type="button" class="btn btn-primary" onclick="addRoom()">新增寝室</button> 
			</div>
		</div>
	</div>
</div>

<!-- 修改寝室模态框 -->
<div class="modal fade" id="roomEditDialog" tabindex="-1" role="dialog"
	aria-labelledby="myModalLabel">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<h4 class="modal-title" id="myModalLabel">修改寝室信息</h4>
			</div>
			<div class="modal-body">
				<form class="form-horizontal" id="edit_room_form">
					<input type="hidden" id="edit_id" name="id"/>
					<div class="form-group">
						<label for="edit_build" class="col-sm-2 control-label">寝室楼号</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="edit_build" placeholder="寝室楼号" name="build" />
						</div>
					</div>
					<div class="form-group">
						<label for="edit_number" class="col-sm-2 control-label">寝室号码</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="edit_number" placeholder="寝室号码" name="number" />
						</div>
					</div>
					<div class="form-group">
						<label for="edit_sex" class="col-sm-2 control-label">学生性别</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="edit_sex" placeholder="学生性别" name="sex" />
						</div>
					</div>
					<div class="form-group">
						<label for="edit_status" class="col-sm-2 control-label">寝室状态</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="edit_status" placeholder="寝室状态" name="edit_status" />
						</div>
					</div>
				</form>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
				<button type="button" class="btn btn-primary" onclick="updateRoom()">保存修改</button>
			</div>
		</div>
	</div>
</div>

<!-- 查看学生模态框 -->
<div class="modal fade" id="studentDialog" tabindex="-1" role="dialog"
	aria-labelledby="myModalLabel">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<h4 class="modal-title" id="myModalLabel">学生信息</h4>
			</div>
			<div class="modal-body">
				<form class="form-horizontal" id="new_room_form">
					<div class="form-group">
						<label for="student_id" class="col-sm-2 control-label">学号</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="student_id"  name="id" readonly/>
						</div>
					</div>
					<div class="form-group">
						<label for="student_name" class="col-sm-2 control-label">学生姓名</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="student_name" name="name" readonly/>
						</div>
					</div>
					<div class="form-group">
						<label for="student_grade" class="col-sm-2 control-label">学生年级</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="student_grade"  name="grade" readonly />
						</div>
					</div>
					<div class="form-group">
						<label for="student_major" class="col-sm-2 control-label">学生专业</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="student_major"  name="major" readonly />
						</div>
					</div>
				</form>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
			</div>
		</div>
	</div>
</div>


<!-- 查看报修模态框 -->
<div class="modal fade" id="repairDialog" tabindex="-1" role="dialog"
	aria-labelledby="myModalLabel">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<h4 class="modal-title" id="myModalLabel">学生信息</h4>
			</div>
			<div class="modal-body">
				<form class="form-horizontal" id="new_room_form">
					<div class="form-group">
						<label for="repair_description" class="col-sm-2 control-label">报修信息</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="repair_description"  name="description" readonly/>
						</div>
					</div>
					<div class="form-group">
						<label for="repair_date" class="col-sm-2 control-label">日期</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="repair_date" name="date" readonly/>
						</div>
					</div>
				</form>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
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
//清空新建寝室窗口中的数据
	function clearRoom() {
	    $("#new_Build").val("");
	    $("#new_Number").val("")
	    $("#new_Sex").val("")
	    $("#new_Status").val("")
	}
	// 新增寝室
	function addRoom() {
	$.post("<%=basePath%>/room/add",
	$("#new_room_form").serialize(),function(data){
	        if(data =="OK"){
	            alert("寝室增加成功！");
	            window.location.reload();
	        }else{
	            alert("寝室增加失败！");
	            window.location.reload();
	        }
	    });
	}
	// 通过id获取修改的寝室信息
	function editRoom(id) {
	    $.ajax({
	        type:"get",
	        url:"<%=basePath%>/room/findRoomById",
	        data:{"id":id},
	        success:function(data) {
	            $("#edit_id").val(data.id);
	            $("#edit_build").val(data.build);
	            $("#edit_number").val(data.number)
	            $("#edit_sex").val(data.sex)
	            $("#edit_status").val(data.status)
	        }
	    });
	}
    // 执行修改寝室操作
	function updateRoom() {
		$.post("<%=basePath%>/room/updateRoom",$("#edit_room_form").serialize(),function(data){
			if(data =="OK"){
				alert("寝室信息更新成功！");
				window.location.reload();
			}else{
				alert("寝室信息更新失败！");
				window.location.reload();
			}
		});
	}
	// 删除寝室
	function deleteRoom(id) {
	    if(confirm('确实要删除该寝室吗?')) {
	$.post("<%=basePath%>/room/deleteRoom",{"id":id},
	function(data){
	            if(data =="OK"){
	                alert("寝室删除成功！");
	                window.location.reload();
	            }else{
	                alert("寝室删除失败！");
	                window.location.reload();
	            }
	        });
	    }
	}
	
	//查看学生信息
	function selectStudent(id) {
	    $.ajax({
	        type:"get",
	        url:"<%=basePath%>/room/selectStudent",
	        data:{"id":id},
	        success:function(data) {
	            $("#student_id").val(data.id);
	            $("#student_name").val(data.name);
	            $("#student_grade").val(data.grade)
	            $("#student_major").val(data.major)
	        }
	    });
	}
	
	//查看报修信息
	function selectRepair(id) {
	    $.ajax({
	        type:"get",
	        url:"<%=basePath%>/room/selectRepair",
	        data:{"id":id},
	        success:function(data) {
	            $("#repair_description").val(data.description);
	            $("#repair_date").val(data.date)
	        }
	    });
	}
</script>
</body>
</html>