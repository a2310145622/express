<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="zh-CN">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
<meta name="description" content="">
<meta name="author" content="">
<link rel="icon" href="./assets/image/favicon.ico">

<title>欢迎来到蜗牛速递</title>

<!-- Bootstrap core CSS -->
<link href="./assets/css/bootstrap.min.css" rel="stylesheet">

<!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
<link href="./assets/css/ie10-viewport-bug-workaround.css"
	rel="stylesheet">

<link href="./assets/css/grid.css" rel="stylesheet">

<!-- Custom styles for this template -->
<link href="./assets/css/jumbotron.css" rel="stylesheet">

<!-- Just for debugging purposes. Don't actually copy these 2 lines! -->
<!--[if lt IE 9]><script src="../../assets/js/ie8-responsive-file-warning.js"></script><![endif]-->
<script src="./assets/js/ie-emulation-modes-warning.js"></script>

<script src="./assets/js/holder.js"></script>

<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
<!--[if lt IE 9]>
      <script src="https://cdn.bootcss.com/html5shiv/3.7.3/html5shiv.min.js"></script>
      <script src="https://cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

<%
	Cookie[] cookies = request.getCookies();
	String cid = null;

	if (session.getAttribute("cid_in_session") == null) {
		if (cookies != null) {
			for (Cookie c : cookies) {
				if ("cid".equals(c.getName())) {
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
<script type="text/javascript">
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
</script>
</head>

<body>

	<nav class="navbar navbar-default navbar-fixed-top">
	<div class="container-fluid">
		<div class="navbar-header">
		</div>
		<div class="navbar-header">
		    <img class="navbar-brand" src="assets/image/woniu.gif">
			<button type="button" class="navbar-toggle collapsed"
				data-toggle="collapse" data-target="#navbar" aria-expanded="false"
				aria-controls="navbar">
				<span class="sr-only">Toggle navigation</span> <span
					class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="#"><font style="font-weight: bold;">蜗牛速递</font></a>
		</div>
		<div id="navbar" class="collapse navbar-collapse">
			<ul class="nav navbar-nav">
				<li><a href="index.jsp">主页</a></li>
				<li><a href="add.jsp">在线下单</a></li>
				<li><a href="#about">投诉建议</a></li>
				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown" role="button" aria-haspopup="true"
					aria-expanded="false">寄件须知<span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="#">收费标准</a></li>
						<li><a href="#">禁运物品</a></li>
						<li><a href="#">海外寄件</a></li>
					</ul></li>
				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown" role="button" aria-haspopup="true"
					aria-expanded="false">关于我们<span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="#">企业简介</a></li>
						<li><a href="#">企业文化</a></li>
						<li><a href="#">蜗牛人物</a></li>
					</ul></li>
				<li><a href="manager/index.jsp">后台管理</a></li>
			</ul>
			<ul class="nav navbar-nav navbar-right">
				<%
					if (session.getAttribute("cid_in_session") != null) {
				%>
				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown" role="button" aria-haspopup="true"
					aria-expanded="false"><%=session.getAttribute("cid_in_session")%><span
						class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="settings">设置</a></li>
						<li><a href="Logout">退出</a></li>
					</ul></li>
				<%-- 				<li><a><%=session.getAttribute("sid_in_session")%></a></li> --%>
				<!-- 				<li class="active"><a href="deletecookie">退出 <span -->
				<!-- 						class="sr-only">(current)</span></a></li> -->
				<%
					} else {
				%>
				<li><a href="login.jsp">登录</a></li>
				<li><a href="register.jsp">注册</a></li>
				<%
					}
				%>
			</ul>
			<form class="navbar-form navbar-right" name="search" action="doSearch" method="get" onsubmit="return check()">
				<input id="eid" name="eid" type="text" class="form-control" placeholder="请输入8位运单号" maxlength="8">
				<img src="assets/image/kuaididanhaochaxun.png"style="width:30px;height:30px"
				     onclick="click1()">
			</form>
		</div>
	</div>
	</nav>
	
	<div class="container">

      <div class="page-header">
        <h1>提交结果</h1>
      </div>
      <center>
      <%if(session.getAttribute("addmsg")!=null&&session.getAttribute("addmsg")!=""){%>
		<h3><%=session.getAttribute("addmsg")%></h3>
		<%session.setAttribute("addmsg", "");}%>
		</center>
    </div> <!-- /container -->
    
	<div class="container-fluid">
		
		<footer>
		<p>&nbsp;</p>
		</footer>
	</div>
	<div class="container-fluid navbar-fixed-bottom" style="background:#FFF">
		<hr />
		<footer>
		<p>&copy; 2017 Company, Inc.</p>
		</footer>
	</div>
	<!-- /container -->

	<!-- Bootstrap core JavaScript
    ================================================== -->
	<!-- Placed at the end of the document so the pages load faster -->
	<script src="./assets/js/jquery.min.js"></script>
	<script>
		window.jQuery
				|| document
						.write('<script src="./js/jquery.min.js"><\/script>')
	</script>
	<script src="./assets/js/bootstrap.min.js"></script>
	<!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
	<script src="./assets/js/ie10-viewport-bug-workaround.js"></script>
</body>
</html>