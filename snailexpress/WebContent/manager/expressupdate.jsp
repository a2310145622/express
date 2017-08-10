<%@page import="java.util.List"%>
<%@page import="java.util.Map"%>
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
<link rel="icon" href="../image/favicon.ico">

<title>蜗牛快递后台管理</title>

<!-- Bootstrap core CSS -->
<link href="../assets/css/bootstrap.min.css" rel="stylesheet">

<!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
<link href="../assets/css/ie10-viewport-bug-workaround.css"
	rel="stylesheet">

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
	session.setAttribute("EXPRESSID",request.getAttribute("EXPRESSID"));
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
				<li><a href="add.jsp">添加新的管理员账号</a></li>
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
	<%
		List<Map<String, Object>> stafflist = (List<Map<String, Object>>) request.getAttribute("stafflist");
	%>
	<div class="container-fluid">
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
					<li><a href="add.jsp">添加新的管理员账号</a></li>
				</ul>
			</div>
			<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
	          <h1 class="page-header">快递运输管理</h1>
	          <h3 class="sub-header">运单号<%=request.getAttribute("EXPRESSID")%>的运输信息</h3>
		      <div class="table-responsive">
				<table class="table table-striped">
					<thead>
		                <tr>
		                  <th class="active">扫描时间</th>
		                  <th class="success">跟踪记录</th>
	<!-- 	                  <th class="warning">操作</th> -->
						</tr>
		              </thead>
		              <tbody>
		                <c:forEach items="${requestScope.EXPRESS}" var="e">
								<tr>
									<td class="active" width="16%">${e.EXPRESSTIME}</td>
									<td class="success">${e.EXPRESSDETAILS}</td>
	<!-- 								<td class="warning" width="15%"><a href="#">详情</a></td> -->
								</tr>
							</c:forEach>
		              </tbody>
				</table>
			  </div>
	          
	          <form class="form-horizontal" role="form" action="doExpressUpdate" method="post">
			  	  <fieldset>
			  		<div id="legend" class="">
			  			<legend class="">更新运输信息</legend>
			  		</div>
			  		<div class="form-group">
			    		<div class="col-sm-12">
			    			<textarea class="form-control" rows="4" id="inputeremark"
			    			name="edetails" placeholder="快递运输的站点信息"></textarea>
			    		</div>
			    		
			  		</div>
			      </fieldset>
			      <button class="btn btn-lg btn-primary btn-block center-block"
			              type="submit" style="width:20%">更新运输信息</button>
			 </form>
	       </div>
		</div>
	</div>

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