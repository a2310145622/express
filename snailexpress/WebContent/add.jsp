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
<link rel="icon" href="./image/favicon.ico">

<title>欢迎来到蜗牛速递</title>

<!-- Bootstrap core CSS -->
<link href="./assets/css/bootstrap.min.css" rel="stylesheet">

<!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
<link href="./assets/css/ie10-viewport-bug-workaround.css" rel="stylesheet">

<!-- Custom styles for this template -->
<link href="./assets/css/jumbotron.css" rel="stylesheet">

<!-- Just for debugging purposes. Don't actually copy these 2 lines! -->
<!--[if lt IE 9]><script src="../../assets/js/ie8-responsive-file-warning.js"></script><![endif]-->
<script src="./assets/js/ie-emulation-modes-warning.js"></script>

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
<%
	Cookie[] cookies = request.getCookies();
	String cid = null;

	if (session.getAttribute("cid_in_session") == null) {
		if (cookies != null) {
			for(Cookie c:cookies){
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
				<li class="active"><a href="add.jsp">在线下单</a></li>
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
        	<h1>在线下单</h1>
      	</div>
	  	<form class="form-horizontal" role="form" action="doAdd" method="post">
	  	  <fieldset>
	  		<div id="legend" class="">
	  			<legend class="">收件人信息</legend>
	  		</div>
	  		<div class="form-group">
	    		<label for="inputeccname" class="col-sm-1 control-label">
	    			<font color="red">*</font>姓名</label>
	    		<div class="col-sm-4">
	      			<input type="text" class="form-control" id="inputeccname" name="eccname" 
	      			        required="" placeholder="请输入收件人姓名" maxlength="20">
	    		</div>
	  		</div>
	  		<div class="form-group">
	    		<label for="inputecphone" class="col-sm-1 control-label">
	    			<font color="red">*</font>电话</label>
	    		<div class="col-sm-4">
	      			<input type="text" class="form-control" id="inputecphone" name="ecphone"
	      			        required="" placeholder="请输入收件人电话" maxlength="20">
	    		</div>
	  		</div>
	  		<div class="form-group">
	    		<label for="inputesaddress" class="col-sm-1 control-label">
	    			<font color="red">*</font>收货地址</label>
	    		<div class="col-sm-6">
	      			<input type="text" class="form-control" id="inputesaddress" name="esaddress"
	      			        required="" placeholder="请输入收件人收货地址">
	    		</div>
	  		</div>
	  		<div class="form-group">
	    		<label for="inputeremark" class="col-sm-1 control-label">备注</label>
	    		<div class="col-sm-6">
	    			<textarea class="form-control" rows="4" id="inputeremark"
	    			name="eremark" placeholder="易碎品、液体、贵重物品等特别说明"></textarea>
	    		</div>
	    		
	  		</div>
	      </fieldset>
	      <fieldset>
	  		<div id="legend" class="">
	  			<legend class="">寄件人信息</legend>
	  		</div>
	  		<div class="form-group">
	    		<label for="inputescname" class="col-sm-1 control-label">
	    			<font color="red">*</font>姓名</label>
	    		<div class="col-sm-4">
	      			<input type="text" class="form-control" id="inputescname" name="escname" 
	      			        required="" placeholder="请输入寄件人姓名" maxlength="20">
	    		</div>
	  		</div>
	  		<div class="form-group">
	    		<label for="inputesphone" class="col-sm-1 control-label">
	    			<font color="red">*</font>电话</label>
	    		<div class="col-sm-4">
	      			<input type="text" class="form-control" id="inputesphone" name="esphone"
	      			        required="" placeholder="请输入寄件人电话" maxlength="20">
	    		</div>
	  		</div>
	  		<div class="form-group">
	    		<label for="inputehaddress" class="col-sm-1 control-label">
	    			<font color="red">*</font>上门地址</label>
	    		<div class="col-sm-6">
	      			<input type="text" class="form-control" id="inputehaddress" name="ehaddress"
	      			        required="" placeholder="请输入寄件人上门地址">
	    		</div>
	  		</div>
	      </fieldset>
	      	<button class="btn btn-lg btn-primary btn-block center-block"
	      	        type="submit" style="width:20%">提交订单</button>
	  	</form>
	</div>
	<!-- /container -->
	
	
	<div class="container-fluid">
		<hr />
		<footer>
		<p>&copy; 2017 Company, Inc.</p>
		</footer>
	</div>
	<!-- /container -->

	<!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
	<script src="./assets/js/ie10-viewport-bug-workaround.js"></script>


</body>
</html>