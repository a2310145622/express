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
<link rel="icon" href="./image/favicon.ico">

<title>注册</title>

<!-- Bootstrap core CSS -->
<link href="./css/bootstrap.min.css" rel="stylesheet">

<!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
<link href="./css/ie10-viewport-bug-workaround.css" rel="stylesheet">

<!-- Custom styles for this template -->
<link href="./css/signin.css" rel="stylesheet">

<!-- Just for debugging purposes. Don't actually copy these 2 lines! -->
<!--[if lt IE 9]><script src="../../assets/js/ie8-responsive-file-warning.js"></script><![endif]-->
<script src="./js/ie-emulation-modes-warning.js"></script>

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
<script type="text/javascript">  
var pwd;
var cpwd;
function validate() {  
    pwd = document.getElementById("inputPassword");
    cpwd = document.getElementById("confirmPassword");
    warning = document.getElementById("warning2");
//    window.location.href = 'www.baidu.com';
    if(pwd.value==cpwd.value)
    	warning.innerHTML="<font color=green >两次输入密码相同</font>";
	else
		warning.innerHTML="<font color=red >两次输入密码不相同</font>";
}


function check(uname) {
	var xmlhttp;
	if (window.XMLHttpRequest)
	{
		//  IE7+, Firefox, Chrome, Opera, Safari 浏览器执行代码
		xmlhttp=new XMLHttpRequest();
	}
	else
	{
		// IE6, IE5 浏览器执行代码
		xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
	}
	xmlhttp.onreadystatechange=function()
	{
		if (xmlhttp.readyState==4 && xmlhttp.status==200)
		{
			document.getElementById("warning1").innerHTML=xmlhttp.responseText;
		}
	}
	var post ="uname=" + uname;
	xmlhttp.open("POST","check",true);
	xmlhttp.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
	xmlhttp.send(post);
}

//function click1() {
//    window.location.href = "https://www.baidu.com";
//}
</script>  

<body>

<!-- <img src="./image/favicon.ico" onclick="click1()"> -->
	<div class="container">

		<form class="form-signin" action="register" method="post">
			<h2 class="form-signin-heading">注册</h2>
			<label for="inputuserid" class="sr-only">user id</label> 
			<input type="text" id="inputuserid" name="userid" class="form-control"
				placeholder="用户id" autofocus="">
			<label for="inputuname" class="sr-only">user name</label>
			<input type="text" id="inputuname" name="uname" class="form-control"
				placeholder="用户名" required="" autofocus="" onchange="check(this.value)">
			<span id="warning1"></span>
			<label for="inputPassword" class="sr-only">Password</label>
			<input type="password" id="inputPassword" name="pwd" class="form-control"
				placeholder="输入密码" required="" onchange="validate()">
			<label for="confirmPassword" class="sr-only">Password</label>
			<input type="password" id="confirmPassword" name="cpwd" class="form-control"
				placeholder="确认密码" required="" onchange="validate()">
			<span id="warning2"></span>
			<label for="inputage" class="sr-only">age</label>
			<input type="text" id="inputage" name="age" class="form-control"
				placeholder="年龄" autofocus="">
			<button class="btn btn-lg btn-primary btn-block" type="submit">注册</button>
		</form>

	</div>
	<!-- /container -->


	<!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
	<script src="./js/ie10-viewport-bug-workaround.js"></script>


</body>
</html>