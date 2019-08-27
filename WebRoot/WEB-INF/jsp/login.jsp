<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>登录界面</title>
	<link rel="shortcut icon" href="img/dorm.ico"/>
    <link rel="stylesheet" type="text/css" href="css/login.css" charset="utf-8"/>
    <script type="text/javascript">
    
    
    function switchFrame(){
          
           var f1 = document.getElementById("frame1");
           var f2 = document.getElementById("frame2");
          if(f1.style.display == "block"){ 
           f1.style.display = "none";
           f2.style.display = "block";
           }else{
           f1.style.display = "block";
           f2.style.display = "none";
            }
    }
    
    </script>
  </head>
  
  <body>
  
  <div class="center">
  
    <a href="index.jsp"><img src="img/logo.png" id="imglogo"></img></a>  
    
    <img src="img/tou.png" id="tou"></img>
    <img src="img/hand.png" id="hand1"></img>
    <img src="img/hand.png" id="hand2"></img>
    <div class="bgdiv">
     <div class="frame" id="frame1">
    
       <a onclick="switchFrame()"><img src="img/login-tab.png" id="imgTab"></img></a>
         
         <label id="txtlogin">用户登录</label>
         <form action="user" method="post" >
         
          <div class="inputDiv">
         
               <img src="img/username.png" id="imgU"></img>
               <input type="text" name="name" class="inputTxt" placeholder="用户名"/>
               
            </div>
            
            <div class="inputDiv">
              <img src="img/pwd.png" id="imgP"></img>
              <input type="password" name="password" class="inputTxt" placeholder="密码"/>
            </div>
    <div style="font-family:微软雅黑;font-size:14px;color:red;">
    &nbsp;&nbsp;&nbsp;&nbsp;${msg}
    <br/>
    <input type="submit" id="inputBtn" value="登 录" "/>
    
    </div>
    
         
         </form>
            
    
    
    
    <div style="position:relative;left:110px;top:15px;">
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="${pageContext.request.contextPath}/showregister">立即注册</a>
    </div>
    
    
    
    
     </div>
     <div class="frame" id="frame2">
    
       <a onclick="switchFrame()"><img src="img/login-tab.png" id="imgTab"></img></a>
         
         <label id="txtlogin">管理员登录</label>
         
          <form action="admin" method="post">
         
          <div class="inputDiv">
         
               <img src="img/username.png" id="imgU"></img>
               <input type="text" name="adminname" class="inputTxt" placeholder="管理员名"/>
               
            </div>
            
            <div class="inputDiv">
              <img src="img/pwd.png" id="imgP"></img>
              <input type="password" name="adminpassword" class="inputTxt" placeholder="密码"/>
            </div>
    <div style="font-family:微软雅黑;font-size:14px;color:red;">
    &nbsp;&nbsp;&nbsp;&nbsp;${msg}
    <br/>
    <input type="submit" id="inputBtn" value="登 录" "/>
    
    </div>
         
         </form>
    
    
            <div style="position:relative;left:110px;top:15px;">
            </div>
     </div>
    
    
    </div>
    
    </div>
    
  </body>
</html>
