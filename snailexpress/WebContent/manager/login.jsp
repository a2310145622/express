<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.net.URLDecoder"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="zh-CN">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
<meta name="description" content="">
<meta name="author" content="">
<link rel="icon" href="../image/favicon.ico">

<title>请登录</title>

<!-- Bootstrap core CSS -->
<link href="../assets/css/bootstrap.min.css" rel="stylesheet">

<!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
<link href="../assets/css/ie10-viewport-bug-workaround.css" rel="stylesheet">

<!-- Custom styles for this template -->
<link href="../assets/css/signin.css" rel="stylesheet">

<!-- Just for debugging purposes. Don't actually copy these 2 lines! -->
<!--[if lt IE 9]><script src="../../assets/js/ie8-responsive-file-warning.js"></script><![endif]-->
<script src="../assets/js/ie-emulation-modes-warning.js"></script>

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
</head>
<%
	Cookie[] cookies = request.getCookies();
	String sid = null;

	if (session.getAttribute("sid_in_session") == null) {
		if (cookies != null) {
			for (Cookie c:cookies) {
				if ("sid".equals(c.getName())) {
					//如果是中文，cookies需要解码
					request.getRequestDispatcher("doLogin").forward(request, response);
				}
			}
		}
	} else
		response.sendRedirect("index.jsp");//get请求
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
		</div>
		<!--/.nav-collapse -->
	</div>
	</nav>
	<div class="container">

		<form class="form-signin" action="doLogin" method="post">
			<h2 class="form-signin-heading">请登录</h2>
			<label for="inputstid" class="sr-only">账号</label>
			<input type="text" id="inputstid" name="sid" class="form-control"
				   placeholder="账号" required="" autofocus="">
			<label for="inputspwd" class="sr-only">密码</label>
			<input type="password" id="inputspwd" name="spwd" class="form-control"
				   placeholder="密码" required="">
			<div class="checkbox">
				<label> <input type="checkbox" name="rme" value="rme">记住我
				</label>
			</div>
			<button class="btn btn-lg btn-primary btn-block" type="submit">登录</button>
		</form>

	</div>
	<!-- /container -->


	<!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
	<script src="../assets/js/ie10-viewport-bug-workaround.js"></script>


</body>
</html>