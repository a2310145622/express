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

<title>Fixed Top Navbar Example for Bootstrap</title>

<!-- Bootstrap core CSS -->
<link href="./css/bootstrap.min.css" rel="stylesheet">

<!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
<link href="./css/ie10-viewport-bug-workaround.css" rel="stylesheet">

<!-- Custom styles for this template -->
<link href="./css/navbar-fixed-top.css" rel="stylesheet">

<!-- Just for debugging purposes. Don't actually copy these 2 lines! -->
<!--[if lt IE 9]><script src="../../assets/js/ie8-responsive-file-warning.js"></script><![endif]-->
<script src="./js/ie-emulation-modes-warning.js"></script>

<script src="./js/docs.min.js"></script>

<script src="./js/holder.js"></script>

<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
<!--[if lt IE 9]>
      <script src="https://cdn.bootcss.com/html5shiv/3.7.3/html5shiv.min.js"></script>
      <script src="https://cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
    
 <script type="text/javascript">
var _bdhmProtocol = (("https:" == document.location.protocol) ? " https://" : " http://");
document.write(unescape("%3Cscript src='" + _bdhmProtocol + "hm.baidu.com/h.js%3Fbdb993b828cbe079a7fbc1a951f44726' type='text/javascript'%3E%3C/script%3E"));
</script>

<!-- 全局统计代码 -->
<script type="text/javascript">
var _bdhmProtocol = (("https:" == document.location.protocol) ? " https://" : " http://");
document.write(unescape("%3Cscript src='" + _bdhmProtocol + "hm.baidu.com/h.js%3F079fac161efc4b2a6f31e80064f14e82' type='text/javascript'%3E%3C/script%3E"));
</script>   
</head>

<body>

	<!-- Fixed navbar -->
	<nav class="navbar navbar-default navbar-fixed-top">
	<div class="container">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed"
				data-toggle="collapse" data-target="#navbar" aria-expanded="false"
				aria-controls="navbar">
				<span class="sr-only">Toggle navigation</span> <span
					class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="#">Project name</a>
		</div>
		<div id="navbar" class="navbar-collapse collapse">
			<ul class="nav navbar-nav">
				<li class="active"><a href="#">Home</a></li>
				<li><a href="#about">About</a></li>
				<li><a href="#contact">Contact</a></li>
				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown" role="button" aria-haspopup="true"
					aria-expanded="false">Dropdown <span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="#">Action</a></li>
						<li><a href="#">Another action</a></li>
						<li><a href="#">Something else here</a></li>
						<li role="separator" class="divider"></li>
						<li class="dropdown-header">Nav header</li>
						<li><a href="#">Separated link</a></li>
						<li><a href="#">One more separated link</a></li>
					</ul></li>
			</ul>
			<ul class="nav navbar-nav navbar-right">
				<%
					if (session.getAttribute("uname_in_session") != null) {
				%>
				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown" role="button" aria-haspopup="true"
					aria-expanded="false"><%=session.getAttribute("uname_in_session")%><span
						class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="#">设置</a></li>
						<li><a href="deletecookie">退出</a></li>
					</ul></li>
				<%-- 				<li><a><%=session.getAttribute("uname_in_session")%></a></li> --%>
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
		</div>
		<!--/.nav-collapse -->
	</div>
	</nav>

	<div class="container">

		<!-- Main component for a primary marketing message or call to action -->
		<div class="jumbotron">
			<h1>Navbar example</h1>
			<p>This example is a quick exercise to illustrate how the
				default, static and fixed to top navbar work. It includes the
				responsive CSS and HTML, so it also adapts to your viewport and
				device.</p>
			<p>To see the difference between static and fixed top navbars,
				just scroll.</p>
			<p>
				<a class="btn btn-lg btn-primary"
					href="http://v3.bootcss.com/components/#navbar" role="button">View
					navbar docs &raquo;</a>
			</p>
		</div>

	</div>
	<!-- /container -->
	<div class="container">
        
<div class="bs-example" data-example-id="simple-carousel">
    <div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
      <ol class="carousel-indicators">
        <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
        <li data-target="#carousel-example-generic" data-slide-to="1"></li>
        <li data-target="#carousel-example-generic" data-slide-to="2"></li>
      </ol>
      <div class="carousel-inner" role="listbox">
        <div class="item active">
          <img data-src="holder.js/1200x500?fg=FF0000&auto=yes&#777:#555&text=First slide" alt="First slide">
          <div class="carousel-caption">图片 1</div>
        </div>
        <div class="item">
          <img data-src="holder.js/1200x500?random=yes&outline=no&auto=yes&#666:#444&text=second slide" alt="Second slide">
          <div class="carousel-caption">图片2</div>
        </div>
        <div class="item">
          <img data-src="holder.js/1200x500?random=yes&outline=yes&auto=yes&#555:#333&text=Third slide" alt="Third slide">
          <div class="carousel-caption">图片 3</div>
        </div>
      </div>
      <a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
        <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
        <span class="sr-only">Previous</span>
      </a>
      <a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
        <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
        <span class="sr-only">Next</span>
      </a>
    </div>
  </div>
  </div>
	<%
		List<Map<String, Object>> users = (List<Map<String, Object>>) request.getAttribute("userList");
	%>
	<div class="container">
		<div class="jumbotron">
			<table class="table table-hover">
				<thead>
					<tr>
						<td class="active">UNAME</td>
						<td class="success">PWD</td>
						<td class="warning">AGE</td>
						<td class="danger">操作</a></td>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${requestScope.userList}" var="e">
						<tr>
							<td class="active">${e.UNAME}</td>
							<td class="success">${e.PWD}</td>
							<td class="warning">${e.AGE}</td>
							<td class="danger"><a href="index.html">详情</a></td>
						</tr>
					</c:forEach>
<%-- 					<%for (int i = 0; i < users.size(); i++) {%> --%>
<!-- 					<tr> -->
<%-- 						<td class="active"><a href="index.html"><%=users.get(i).get("UNAME")%></a></td> --%>
<%-- 						<td class="success"><%=users.get(i).get("PWD")%></td> --%>
<%-- 						<td class="warning"><%=users.get(i).get("AGE")%></td> --%>
<!-- 					</tr> -->
<%-- 					<%}%> --%>
				</tbody>
			</table>
		</div>

	</div>
	<!-- /container -->

	<div class="container">
		<div class="jumbotron">
			<table class="table table-hover">
				<thead>
					<tr>
						<th class="active">UNAME</th>
						<th class="success">PWD</th>
						<th class="warning">AGE</th>
						<th class="danger">操作</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${requestScope.emps.result}" var="e">
						<tr>
							<td class="active">${e.UNAME}</td>
							<td class="success">${e.PWD}</td>
							<td class="warning">${e.AGE}</td>
							<td class="danger"><a href="index.html">详情</a><a >修改</a></td>
						</tr>
					</c:forEach>
				</tbody>
				<tfoot>
					<tr>
						<td colspan="4"><span> 当前第 ${emps.currentPage} 页 / 总共
								${emps.totalPages} 页 </span> 
								<c:if test="${emps.currentPage>1}">
								<a href="queryEmpList?currPage=1">首页</a>
								<a href="queryEmpList?currPage=${emps.currentPage-1}">上一页</a>
								</c:if>
								<c:choose>
								<c:when test="${emps.currentPage<emps.totalPages}">
								<a href="queryEmpList?currPage=${emps.currentPage+1}">下一页</a>
								<a href="queryEmpList?currPage=${emps.totalPages}">尾页</a>
								</c:when>
								</c:choose>
						</td>
					</tr>
				</tfoot>
			</table>
		</div>

	</div>
	<!-- /container -->

	<!-- Bootstrap core JavaScript
    ================================================== -->
	<!-- Placed at the end of the document so the pages load faster -->
	<script src="./js/jquery.min.js"></script>
	<script>
		window.jQuery
				|| document
						.write('<script src="./js/vendor/jquery.min.js"><\/script>')
	</script>
	<script src="./js/bootstrap.min.js"></script>
	<!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
	<script src="./js/ie10-viewport-bug-workaround.js"></script>
</body>
</html>