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
		<a class="navbar-brand" href="<%=basePath%>repair"><strong>高校寝室管理系统</strong></a>
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
				    <a href="${pageContext.request.contextPath}/room/list" >
				       <img src="img/roomManage.png" id="roomManage"> 寝室情况
				    </a>
				</li>
				<li>
				    <a href="${pageContext.request.contextPath}/student" >
				        <img src="img/studentManage.png" id="studentManage">  学生情况
				    </a>
				</li>
				<li>
				     <a href="${pageContext.request.contextPath}/repair" class="active">
				      <img src="img/repairManage.png" id="repairManage"> 报修情况
				    </a>
				</li>
			</ul>
		</div>
	</div>
	
	<!-- 左侧显示列表部分 end--> 
  </nav>
    <!-- 报修列表查询部分  start-->
	<div id="page-wrapper">
		<div class="row">
			<div class="col-lg-12">
				<h1 class="page-header">报修情况</h1>
			</div>
			<!-- /.col-lg-12 -->
		</div>
		<!-- /.row -->
		<div class="panel panel-default">
			<div class="panel-body">
				<form class="form-inline" method="post" 
				      action="${pageContext.request.contextPath}/repair">
					<div class="form-group">
						<label for="roomName">寝室编号</label> 
						<input type="text" class="form-control" id="roomid" 
						                   value="${roomid}" name="roomid" />
					</div>
					<button type="submit" class="btn btn-primary">查询</button>
				</form>
			</div>
		</div>
		<div class="row">
			<div class="col-lg-12">
				<div class="panel panel-default">
					<div class="panel-heading">报修信息列表</div>
					<!-- /.panel-heading -->
					<table class="table table-bordered table-striped">
						<thead>
							<tr>
								<th>报修寝室编号</th>
								<th>报修信息</th>
								<th>报修时间</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${page.rows}" var="row">
								<tr>
									<td>${row.roomid}</td>
									<td>${row.description}</td>
									<td>${row.date}</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
					<div class="col-md-12 text-right">
						<itheima:page url="${pageContext.request.contextPath}/repair" />
					</div>
					<!-- /.panel-body --> 
				</div>
				<!-- /.panel ->
			</div>
			<!-- /.col-lg-12 -->
		</div>
	</div>
	<!-- 报修列表查询部分  end-->
</div>

<!-- 创建报修模态框 -->
<div class="modal fade" id="newRepairDialog" tabindex="-1" role="dialog"
	aria-labelledby="myModalLabel">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<h4 class="modal-title" id="myModalLabel">新增报修信息</h4>
			</div>
			<div class="modal-body">
				<form class="form-horizontal" id="new_repair_form">
					<div class="form-group">
						<label for="new_Room" class="col-sm-2 control-label">
						    报修寝室
						</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="new_Room" placeholder="寝室编号" name="Room" />
						</div>
					</div>
					<div class="form-group">
						<label for="new_Description" class="col-sm-2 control-label">报修信息</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="new_Description" placeholder="报修信息" name="Description" />
						</div>
					</div>
					<div class="form-group">
						<label for="new_Date" class="col-sm-2 control-label">报修时间</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="new_Date" placeholder="报修时间" name="Date" />
						</div>
					</div>
				</form>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
				<button type="button" class="btn btn-primary" onclick="addRepair()">新增报修信息</button> 
			</div>
		</div>
	</div>
</div>

<!-- 修改报修模态框 -->
<div class="modal fade" id="repairEditDialog" tabindex="-1" role="dialog"
	aria-labelledby="myModalLabel">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<h4 class="modal-title" id="myModalLabel">修改报修信息</h4>
			</div>
			<div class="modal-body">
				<form class="form-horizontal" id="edit_repair_form">
					<input type="hidden" id="edit_id" name="id"/>
					<div class="form-group">
						<label for="edit_Room" class="col-sm-2 control-label">
						    报修寝室编号
						</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="edit_Room" placeholder="寝室编号" name="Room" />
						</div>
					</div>
					<div class="form-group">
						<label for="edit_Description" class="col-sm-2 control-label">报修信息</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="edit_Description" placeholder="报修信息" name="Description" />
						</div>
					</div>
					<div class="form-group">
						<label for="edit_Date" class="col-sm-2 control-label">报修时间</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="edit_Date" placeholder="报修时间" name="Date" />
						</div>
					</div>
				</form>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
				<button type="button" class="btn btn-primary" onclick="updateRepair()">保存修改</button>
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
//清空新建报修窗口中的数据
	function clearRepair() {
	    $("#new_Room").val("");
	    $("#new_Description").val("")
	    $("#new_Date").val("")
	}
	// 新增报修
	function addRepair() {
	$.post("<%=basePath%>/repair/add",
	$("#new_repair_form").serialize(),function(data){
	        if(data =="OK"){
	            alert("报修信息增加成功！");
	            window.location.reload();
	        }else{
	            alert("报修信息增加失败！");
	            window.location.reload();
	        }
	    });
	}
	// 通过寝室id获取修改的报修信息
	function editRepair(roomid) {
	    $.ajax({
	        type:"get",
	        url:"<%=basePath%>/repair/findRepairByRoomid",
	        data:{"roomid":roomid},
	        success:function(data) {
	            $("#edit_Room").val(data.roomid);
	            $("#edit_Description").val(data.description);
	            $("#edit_Date").val(data.date)
	        }
	    });
	}
    // 执行修改报修信息操作
	function updateRepair() {
		$.post("<%=basePath%>/repair/updateRepair",$("#edit_repair_form").serialize(),function(data){
			if(data =="OK"){
				alert("报修信息更新成功！");
				window.location.reload();
			}else{
				alert("报修信息更新失败！");
				window.location.reload();
			}
		});
	}
	// 删除报修信息
	function deleteRepair(roomid) {
	    if(confirm('确实要删除该报修信息吗?')) {
	$.post("<%=basePath%>/repair/deleteRepair",{"roomid":roomid},
	function(data){
	            if(data =="OK"){
	                alert("报修信息删除成功！");
	                window.location.reload();
	            }else{
	                alert("报修信息删除失败！");
	                window.location.reload();
	            }
	        });
	    }
	}  
</script>   
</body> 
</html>