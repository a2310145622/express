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

function click2(EXPRESSID,CLIENTID,COLLECTCLIENTNAME,COLLECTPHONE,SENDADDRESS,
		SENDCLIENTNAME,SENDPHONE,HOMEADDRESS,REMARK,SIGNFOR,DELIVERYWAYID,CONNECTTIME){
	window.location.href="expressmodify.jsp?EXPRESSID="+EXPRESSID+"&CLIENTID="+CLIENTID
	+"&COLLECTCLIENTNAME="+COLLECTCLIENTNAME+"&COLLECTPHONE="+COLLECTPHONE+"&SENDADDRESS="
	+SENDADDRESS+"&SENDCLIENTNAME="+SENDCLIENTNAME+"&SENDPHONE="+SENDPHONE+
	"&HOMEADDRESS="+HOMEADDRESS+"&REMARK="+REMARK+"&SIGNFOR="+SIGNFOR
	+"&DELIVERYWAYID="+DELIVERYWAYID+"&CONNECTTIME="+CONNECTTIME; 
}

function click3(EXPRESSID){
	window.location.href="expressUpdate?EXPRESSID="+EXPRESSID; 
}
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
				    <li class="active"><a href="queryExpressList">快递单信息列表<span class="sr-only">(current)</span></a></li>
					<li><a href="queryClientList">客户信息列表</a></li>
					<li><a href="queryStaffList">管理员信息列表</a></li>
					<li><a href="add.jsp">添加新的管理员账号</a></li>
				</ul>
			</div>
			<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
	          <h1 class="page-header">快递单管理</h1>
	
	          <h2 class="sub-header">数据列表</h2>
	          <div class="table-responsive">
	            <table class="table table-striped table-hover">
	              <thead>
	                <tr>
	                  <th class="active">运单号</th>
	                  <th class="success">用户账号</th>
	                  <th class="warning">收件人姓名</th>
	                  <th class="danger">收件人电话</th>
	                  <th class="active">收货地址</th>
	                  <th class="success">寄件人姓名</th>
	                  <th class="warning">寄件人电话</th>
	                  <th class="danger">寄件人地址</th>
	                  <th class="active">备注</th>
	                  <th class="success">签收货状态</th>
	                  <th class="warning">货运方式</th>
	                  <th class="danger">接单时间</th>
	                  <th class="active">操作</th>
					</tr>
	              </thead>
	              <tbody>
	                <c:forEach items="${requestScope.expresses.result}" var="e">
							<tr>
								<td class="active">${e.EXPRESSID}</td>
								<td class="success">${e.CLIENTID}</td>
								<td class="warning">${e.COLLECTCLIENTNAME}</td>
								<td class="danger">${e.COLLECTPHONE}</td>
								<td class="active">${e.SENDADDRESS}</td>
								<td class="success">${e.SENDCLIENTNAME}</td>
								<td class="warning">${e.SENDPHONE}</td>
								<td class="danger">${e.HOMEADDRESS}</td>
								<td class="active">${e.REMARK}</td>
								<td class="success">${e.SIGNFOR}</td>
								<td class="warning">${e.DELIVERYWAYID}</td>
								<td class="danger" width="9%">${e.CONNECTTIME}</td>
								<td class="active" width="11%"><a href="javascript:void(0)"
									onclick="click2('${e.EXPRESSID}','${e.CLIENTID}','${e.COLLECTCLIENTNAME}'
									,'${e.COLLECTPHONE}','${e.SENDADDRESS}','${e.SENDCLIENTNAME}'
									,'${e.SENDPHONE}','${e.HOMEADDRESS}','${e.REMARK}'
									,'${e.SIGNFOR}','${e.DELIVERYWAYID}','${e.CONNECTTIME}')">修改</a>
								<a href="javascript:void(0)"
									onclick="click3('${e.EXPRESSID}')">更新</a>
								<a href="#">删除</a></td>
							</tr>
						</c:forEach>
	              </tbody>
	              <tfoot>
						<tr>
							<td colspan="4"><span> 当前第 ${expresses.currentPage} 页 /
									总共 ${expresses.totalPages} 页 </span> <c:if test="${expresses.currentPage>1}">
									<a href="queryExpressList?currPage=1">首页</a>
									<a href="queryExpressList?currPage=${expresses.currentPage-1}">上一页</a>
								</c:if> <c:choose>
									<c:when test="${expresses.currentPage<expresses.totalPages}">
										<a href="queryExpressList?currPage=${expresses.currentPage+1}">下一页</a>
										<a href="queryExpressList?currPage=${expresses.totalPages}">尾页</a>
									</c:when>
								</c:choose></td>
						</tr>
					</tfoot>
	            </table>
	          </div>
	        </div>
		</div>
	</div>


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
	<!-- 	<!-- /container -->

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