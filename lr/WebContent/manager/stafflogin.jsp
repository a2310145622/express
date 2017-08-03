<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.net.URLDecoder"%>
<%
	Cookie[] cookies = request.getCookies();
	String sid = null;
	String spwd = null;

	if (session.getAttribute("sid_in_session") == null) {
		if (cookies != null) {
			for (int i = 0; i < cookies.length; i++) {
				String id = cookies[i].getName();
				String pwd = cookies[i].getName();
				if ("sid".equals(id)) {
					//如果是中文，cookies需要解码
					sid = URLDecoder.decode(cookies[i].getValue(), "utf-8");
				} else if ("spwd".equals(pwd)) {
					spwd = cookies[i].getValue();
				}
			}
		}
		//当用户名和密码不为空时，自动登录
		if ((sid != null && !("".equals(sid))) && (spwd != null && !("".equals(spwd)))) {
			session.setAttribute("sid_in_session", sid);
			session.setAttribute("spwd_in_session", spwd);
			response.sendRedirect("stafflogin");//get请求
		}
	} else
		response.sendRedirect("staffhome");//get请求
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="zh-CN">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
<meta name="description" content="">
<meta name="author" content="">
<link rel="icon" href=".。/image/favicon.ico">

<title>请登录</title>

<!-- Bootstrap core CSS -->
<link href="../css/bootstrap.min.css" rel="stylesheet">

<!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
<link href="../css/ie10-viewport-bug-workaround.css" rel="stylesheet">

<!-- Custom styles for this template -->
<link href="../css/signin.css" rel="stylesheet">

<!-- Just for debugging purposes. Don't actually copy these 2 lines! -->
<!--[if lt IE 9]><script src="../../assets/js/ie8-responsive-file-warning.js"></script><![endif]-->
<script src="../js/ie-emulation-modes-warning.js"></script>

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
    String msg = (String)session.getAttribute("msg");
	if (msg !=null && msg.length() != 0) {
%>
<script type="text/javascript">
            alert("<%=msg%>");
</script>
<%
	}
	session.setAttribute("msg", "");
%>
<body>

	<div class="container">

		<form class="form-signin" action="stafflogin" method="post">
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
	<script src="../js/ie10-viewport-bug-workaround.js"></script>


</body>
</html>