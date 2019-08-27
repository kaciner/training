<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>注册页面</title>
	
	<link rel="stylesheet" type="text/css" href="css/register.css">
	
	<script type="text/javascript">
	
	function showSecondPage(){
	
	document.getElementById("secondPage").style.display = "block";
	document.getElementById("firstPage").style.display = "none";
	document.getElementById("li2").style.borderBottom = "solid 2px #c40000";
	document.getElementById("li2").style.color = "black";
	document.getElementById("i2").style.background = "url(img/ico-circle0.png) no-repeat 0 0";
	document.getElementById("li1").style.borderBottom = "none";
	document.getElementById("li1").style.color = "#999";
	document.getElementById("i1").style.background = "url(img/ico-circle2.png) no-repeat 0 0";
	}
	
	</script>

</head>
  
  <body>
   <div class="center">
		<div class="top">
			<ol>
				<li id="li1">
					<i id="i1">1</i>填写用户名
				</li>
				<li id="li2">
					<i id="i2">2</i>填写密码
				</li>
				<li id="li3">
					<i id="i3">3</i>确认注册
				</li>
			</ol>
			<div class="content">
			
				<form action="${pageContext.request.contextPath}/register" method="post">
				
					<div id="firstPage">
					
					<br/><br/>
						用户名&nbsp;		
						<input type="text" id="name" name="name" class="txtbox">
						<br/>
						${msg}
						<br/>
						<input type="button" value="下一步" class="btn" onclick="showSecondPage()"/>
					</div>
					<div id="secondPage">
						<br/><br/>
						输入密码 &nbsp;
						<input type="password" id="password" name="password" class="txtbox">
						<br/>
						<input type="submit" value="注  册" class="btn"/>
					
					</div>

				</form>

			</div>
		
		</div>
		
	</div>
  </body>
</html>
