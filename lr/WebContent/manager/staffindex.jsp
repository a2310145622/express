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
<link href="../css/bootstrap.min.css" rel="stylesheet">

<!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
<link href="../css/ie10-viewport-bug-workaround.css" rel="stylesheet">

<!-- Custom styles for this template -->
<link href="../css/navbar-fixed-top.css" rel="stylesheet">

<!-- Just for debugging purposes. Don't actually copy these 2 lines! -->
<!--[if lt IE 9]><script src="../../assets/js/ie8-responsive-file-warning.js"></script><![endif]-->
<script src="../js/ie-emulation-modes-warning.js"></script>

<script src="../js/docs.min.js"></script>

<script src="../js/holder.js"></script>

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
<%
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
	<div class="container">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed"
				data-toggle="collapse" data-target="#navbar" aria-expanded="false"
				aria-controls="navbar">
				<span class="sr-only">Toggle navigation</span> <span
					class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="#">后台管理</a>
		</div>
		<div id="navbar" class="navbar-collapse collapse">
			<ul class="nav navbar-nav">
				<li><a href="../main.jsp">返回前台</a></li>
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
				<li><a href="staffregister.jsp">加入新的管理员账号</a></li>
				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown" role="button" aria-haspopup="true"
					aria-expanded="false"><%=session.getAttribute("sid_in_session")%><span
						class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="#">设置</a></li>
						<li><a href="logout">退出</a></li>
					</ul></li>
				<%-- 				<li><a><%=session.getAttribute("sid_in_session")%></a></li> --%>
				<!-- 				<li class="active"><a href="deletecookie">退出 <span -->
				<!-- 						class="sr-only">(current)</span></a></li> -->
				<%
					} else {
				%>
				<li><a href="stafflogin.jsp">登录</a></li>
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
	<div class="container">

		<!-- Main component for a primary marketing message or call to action -->
		<div class="jumbotron">
			<h1><font color=red>请使用管理员账号登陆!</font></h1>
		</div>

	</div>
	<!-- /container -->
				<%
					} else {
				%>
	<%
		List<Map<String, Object>> stafflist = (List<Map<String, Object>>) request.getAttribute("stafflist");
	%>
	<div class="container">
		<div class="jumbotron">
		<h2>管理员数据列表</h2>
			<table class="table table-hover">
				<thead>
					<tr>
						<th class="active">账号</th>
						<th class="success">姓名</th>
						<th class="warning">编号</th>
						<th class="danger">电话</th>
						<th class="active">密码</th>
						<th class="success">备注</th>
						<th class="danger">操作</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${requestScope.stafflist}" var="s">
						<tr>
							<td class="active">${s.STAFFID}</td>
							<td class="success">${s.STAFFNAME}</td>
							<td class="warning">${s.STAFFNUMBER}</td>
							<td class="danger">${s.LINKPHONE}</td>
							<td class="active">${s.STAFFPASSWORD}</td>
							<td class="success">${s.REMARK}</td>
							<td class="danger"><a href="#">详情</a></td>
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
		<h2>用户数据列表</h2>
			<table class="table table-hover">
				<thead>
					<tr>
						<th class="active">账号</th>
						<th class="success">姓名</th>
						<th class="warning">电话</th>
						<th class="danger">密码</th>
						<th class="active">邮箱</th>
						<th class="danger">操作</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${requestScope.clientlist}" var="c">
						<tr>
							<td class="active">${c.CLIENTID}</td>
							<td class="success">${c.CLIENTNAME}</td>
							<td class="warning">${c.LINKPHONE}</td>
							<td class="danger">${c.CLIENTPASSWORD}</td>
							<td class="active">${c.CLIENTEMAIL}</td>
							<td class="danger"><a href="#">详情</a></td>
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
	

<!-- 	<div class="container"> -->
<!-- 		<div class="jumbotron"> -->
<!-- 			<table class="table table-hover"> -->
<!-- 				<thead> -->
<!-- 					<tr> -->
<!-- 						<th class="active">账户</th> -->
<!-- 						<th class="success">姓名</th> -->
<!-- 						<th class="warning">编号</th> -->
<!-- 						<th class="danger">电话</th> -->
<!-- 						<th class="active">密码</th> -->
<!-- 						<th class="success">备注</th> -->
<!-- 						<th class="danger">操作</th> -->
<!-- 					</tr> -->
<!-- 				</thead> -->
<!-- 				<tbody> -->
<%-- 					<c:forEach items="${requestScope.staffs.result}" var="s"> --%>
<!-- 						<tr> -->
<%-- 							<td class="active">${s.STAFFID}</td> --%>
<%-- 							<td class="success">${s.STAFFNAME}</td> --%>
<%-- 							<td class="warning">${s.STAFFNUMBER}</td> --%>
<%-- 							<td class="danger">${s.LINKPHONE}</td> --%>
<%-- 							<td class="active">${s.STAFFPASSWORD}</td> --%>
<%-- 							<td class="success">${s.REMARK}</td> --%>
<!-- 							<td class="danger"><a href="#">详情</a></td> -->
<!-- 						</tr> -->
<%-- 					</c:forEach> --%>
<!-- 				</tbody> -->
<!-- 				<tfoot> -->
<!-- 					<tr> -->
<%-- 						<td colspan="4"><span> 当前第 ${staffs.currentPage} 页 / --%>
<%-- 								总共 ${staffs.totalPages} 页 </span> <c:if test="${staffs.currentPage>1}"> --%>
<!-- 								<a href="queryStaffList?currPage=1">首页</a> -->
<%-- 								<a href="queryStaffList?currPage=${staffs.currentPage-1}">上一页</a> --%>
<%-- 							</c:if> <c:choose> --%>
<%-- 								<c:when test="${staffs.currentPage<staffs.totalPages}"> --%>
<%-- 									<a href="queryStaffList?currPage=${staffs.currentPage+1}">下一页</a> --%>
<%-- 									<a href="queryStaffList?currPage=${staffs.totalPages}">尾页</a> --%>
<%-- 								</c:when> --%>
<%-- 							</c:choose></td> --%>
<!-- 					</tr> -->
<!-- 				</tfoot> -->
<!-- 			</table> -->
<!-- 		</div> -->

<!-- 	</div> -->
<!-- 	<!-- /container --> -->

	<%
					}
				%>
	<!-- Bootstrap core JavaScript
    ================================================== -->
	<!-- Placed at the end of the document so the pages load faster -->
	<script src="../js/jquery.min.js"></script>
	<script>
		window.jQuery
				|| document
						.write('<script src="./js/vendor/jquery.min.js"><\/script>')
	</script>
	<script src="../js/bootstrap.min.js"></script>
	<!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
	<script src="../js/ie10-viewport-bug-workaround.js"></script>
</body>
</html>