<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="zh-CN">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
<meta name="description" content="">
<meta name="author" content="">
<link rel="icon" href="../assets/image/favicon.ico">

<title>添加新的管理员账号</title>

<!-- Bootstrap core CSS -->
<link href="../assets/css/bootstrap.min.css" rel="stylesheet">

<!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
<link href="../assets/css/ie10-viewport-bug-workaround.css" rel="stylesheet">

<!-- Custom styles for this template -->
<link href="../assets/css/signin.css" rel="stylesheet">

<!-- Custom styles for this template -->
<link href="../assets/css/dashboard.css" rel="stylesheet">
<!-- Custom styles for this template -->
<link href="../assets/css/navbar-fixed-top.css" rel="stylesheet">

<!-- Just for debugging purposes. Don't actually copy these 2 lines! -->
<!--[if lt IE 9]><script src="../../assets/js/ie8-responsive-file-warning.js"></script><![endif]-->
<script src="../assets/js/ie-emulation-modes-warning.js"></script>

<script src="../assets/js/docs.min.js"></script>

<script src="../assets/js/holder.js"></script>

<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
<!--[if lt IE 9]>
      <script src="https://cdn.bootcss.com/html5shiv/3.7.3/html5shiv.min.js"></script>
      <script src="https://cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
<style type="text/css">
#maxthon-1eec22d4-0232-4212-8283-6f2ac8f967-iframe {
	display: block !important;
	position: absolute !important;
	visibility: visible !important;
	z-index: 2147483647 !important;
	border-style: none !important;
	opacity: 1 !important;
	margin: 0 !important;
	padding: 0 !important;
	box-shadow: 0 0 5px rgba(0, 0, 0, .3) !important;
	border: 1px solid #b3b3b3 !important
}
</style>
<script type="text/javascript">  
var pwd;
var cpwd;

function check(){
	var eid = document.getElementById("eid");
	if(eid.value.length!=8){
		alert("请输入8位运单号！");
		return false;
	}else
		return true;
}
function click1(){
	if(check())
		document.search.submit();
}

function check(sid) {
	
	$.ajax({ 
		type:"POST",//提交的类型 
		url:"doCheck",//提交地址 
		data:"sid="+sid,//参数 
		success:function(msg){ //回调方法 
		//alert("Data Saved:"+msg);//这里是方法内容，和上面的get方法一样
		warn = document.getElementById("warn");
		warn.innerHTML=msg;
		}
	});
	
// 	var xmlhttp;
// 	if (window.XMLHttpRequest)
// 	{
// 		//  IE7+, Firefox, Chrome, Opera, Safari 浏览器执行代码
// 		xmlhttp=new XMLHttpRequest();
// 	}
// 	else
// 	{
// 		// IE6, IE5 浏览器执行代码
// 		xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
// 	}
// 	xmlhttp.onreadystatechange=function()
// 	{
// 		warn = document.getElementById("warn");
// 		if (xmlhttp.readyState==4 && xmlhttp.status==200)
// 		{
// 				warn.innerHTML=xmlhttp.responseText;
// 		}
// 	}
// 	var post ="sid=" + sid;
// 	xmlhttp.open("POST","check",true);
// 	xmlhttp.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
// 	xmlhttp.send(post);
}

function validate() {  
    pwd = document.getElementById("inputspwd");
    cpwd = document.getElementById("confirmspwd");
    warning2 = document.getElementById("warning2");
//    window.location.href = 'www.baidu.com';
    if(pwd.value==cpwd.value)
    	warning2.innerHTML="<font color=green >两次输入密码相同</font>";
	else
		warning2.innerHTML="<font color=red >两次输入密码不相同</font>";
}

//function click1() {
//    window.location.href = "https://www.baidu.com";
//}
</script>
</head>
<%
	Cookie[] cookies = request.getCookies();
	String sid = null;
	
	if (session.getAttribute("sid_in_session") == null) {
		if (cookies != null) {
			for (Cookie c : cookies) {
				if ("sid".equals(c.getName())) {
					//如果是中文，cookies需要解码
					request.getRequestDispatcher("doLogin").forward(request, response);
				}
			}
		}
	}
	String msg = (String) session.getAttribute("msg");
	if (msg != null && msg.length() != 0) {
%>
<script type="text/javascript">
            alert("<%=msg%>");
</script>
<%
	}
	session.setAttribute("msg", "");
%>
<body>
    
    <!-- Fixed navbar -->
	<nav class="navbar navbar-default navbar-fixed-top">
	<div class="container-fluid">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed"
				data-toggle="collapse" data-target="#navbar" aria-expanded="false"
				aria-controls="navbar">
				<span class="sr-only">Toggle navigation</span> <span
					class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="index.jsp"><font style="font-weight: bold;">后台管理</font></a>
		</div>
		<div id="navbar" class="navbar-collapse collapse">
			<ul class="nav navbar-nav">
				<li><a href="../index.jsp">返回前台</a></li>
				<!-- 				<li><a href="#about">About</a></li> -->
				<!-- 				<li><a href="#contact">Contact</a></li> -->
				<!-- 				<li class="dropdown"><a href="#" class="dropdown-toggle" -->
				<!-- 					data-toggle="dropdown" role="button" aria-haspopup="true" -->
				<!-- 					aria-expanded="false">Dropdown <span class="caret"></span></a> -->
				<!-- 					<ul class="dropdown-menu"> -->
				<!-- 						<li><a href="#">Action</a></li> -->
				<!-- 						<li><a href="#">Another action</a></li> -->
				<!-- 						<li><a href="#">Something else here</a></li> -->
				<!-- 						<li role="separator" class="divider"></li> -->
				<!-- 						<li class="dropdown-header">Nav header</li> -->
				<!-- 						<li><a href="#">Separated link</a></li> -->
				<!-- 						<li><a href="#">One more separated link</a></li> -->
				<!-- 					</ul></li> -->
			</ul>
			<ul class="nav navbar-nav navbar-right">
				<%
					if (session.getAttribute("sid_in_session") != null) {
				%>
				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown" role="button" aria-haspopup="true"
					aria-expanded="false"><%=session.getAttribute("sid_in_session")%><span
						class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="Logout">退出</a></li>
					</ul></li>
				<%-- 				<li><a><%=session.getAttribute("sid_in_session")%></a></li> --%>
				<!-- 				<li class="active"><a href="deletecookie">退出 <span -->
				<!-- 						class="sr-only">(current)</span></a></li> -->
				<%
					} else {
				%>
				<li><a href="login.jsp">登录</a></li>
				<%
					}
				%>
			</ul>
			<%if (session.getAttribute("sid_in_session") != null) {%>
			<form class="navbar-form navbar-right" name="search" action="doESearch" method="get" onsubmit="return check()">
				<input id="eid" name="eid" type="text" class="form-control" placeholder="请输入8位运单号" maxlength="8">
				<img src="../assets/image/kuaididanhaochaxun.png"style="width:30px;height:30px"
				     onclick="click1()">
			</form>
			<%}%>
		</div>
		<!--/.nav-collapse -->
	</div>
	</nav>
	<%
		if (session.getAttribute("sid_in_session") == null) {
	%>
	<!-- Main component for a primary marketing message or call to action -->
	<div class="jumbotron">
		<div class="container">

			<h1>
				<font color=red>请使用管理员账号登陆!</font>
			</h1>
		</div>

	</div>
	<!-- /container -->
	<%
		} else {
	%>

	<!-- <img src="./image/favicon.ico" onclick="click1()"> -->
	<div class="container">
	  <div class="row">
		<div class="col-sm-3 col-md-2 sidebar">
				<ul class="nav nav-sidebar">
					<li><a href="index.jsp">概览</a></li>
					<li><a href="settings">设置</a></li>
				</ul>
				<ul class="nav nav-sidebar">
					<li><a href="queryExpressList">快递单信息列表</a></li>
					<li><a href="queryClientList">客户信息列表</a></li>
					<li><a href="queryStaffList">管理员信息列表</a></li>
					<li class="active"><a href="">添加新的管理员账号<span class="sr-only">(current)</span></a></li>
				</ul>
		</div>
		<div id="navbar" class="navbar-collapse collapse">
		<form class="form-signin" action="doRegister" method="post">
			<h2 class="form-signin-heading">添加新的管理员账号</h2>
			<label for="inputsid" class="sr-only">账号</label>
			<input type="text" id="inputsid" name="sid" class="form-control"
                   placeholder="账号" required="" autofocus="" onchange="check(this.value)">
            <span id="warn"></span>
            <label for="inputspwd" class="sr-only">输入密码</label>
			<input type="password" id="inputspwd" name="spwd" class="form-control"
                   placeholder="输入密码" required="" onchange="validate()">
            <label for="confirmspwd" class="sr-only">确认密码</label>
            <input type="password" id="confirmspwd" name="cspwd" class="form-control"
                   placeholder="确认密码" required="" onchange="validate()">
            <span id="warning2"></span>
            <label for="inputsname" class="sr-only">姓名</label>
            <input type="text" id="inputsname" name="sname" class="form-control"
                   placeholder="姓名" required="">
            <label for="inputsnumber" class="sr-only">编号</label>
            <input type="text" id="inputsnumber" name="snumber" class="form-control"
                   placeholder="编号" required="">
            <label for="inputslphone" class="sr-only">电话</label>
			<input type="text" id="inputslphone" name="slphone" class="form-control"
			       placeholder="电话">
			<label for="inputsremark" class="sr-only">备注</label>
			<input type="text" id="inputsremark" name="sremark" class="form-control"
			       placeholder="备注">
			<button class="btn btn-lg btn-primary btn-block" type="submit">添加</button>
		</form>
		</div>
	  </div>
	</div>
	<!-- /container -->
	
	<%
		}
	%>
	<!-- Bootstrap core JavaScript
    ================================================== -->
	<!-- Placed at the end of the document so the pages load faster -->
	<script src="../assets/js/jquery.min.js"></script>
	<script>
		window.jQuery
				|| document
						.write('<script src="js/vendor/jquery.min.js"><\/script>')
	</script>
	<script src="../assets/js/bootstrap.min.js"></script>
	<!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
	<script src="../assets/js/ie10-viewport-bug-workaround.js"></script>


</body>
</html>