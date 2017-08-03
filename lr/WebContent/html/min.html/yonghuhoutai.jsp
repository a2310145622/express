<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.net.URLDecoder"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="zh-CN">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<script type="text/javascript" src="http://www.francescomalagrino.com/BootstrapPageGenerator/3/js/jquery-2.0.0.min.js"></script>
<script type="text/javascript" src="http://www.francescomalagrino.com/BootstrapPageGenerator/3/js/jquery-ui"></script>
<link href="http://www.francescomalagrino.com/BootstrapPageGenerator/3/css/bootstrap-combined.min.css" rel="stylesheet" media="screen">
<script type="text/javascript" src="http://www.francescomalagrino.com/BootstrapPageGenerator/3/js/bootstrap.min.js"></script>
</head>
<body>
<script language="javascript"> 
function div_none(theclass){ 
var allPageTags = new Array(); 
var allPageTags = document.getElementsByTagName("div"); 
for (i=0; i<allPageTags.length;i++){ 
if(allPageTags[i].className == theclass){ 
var obj = allPageTags[i]; 
if(obj.style.display == "none"){ 
obj.style.display = ""; 
  
}else{ 
obj.style.display = "none"; 
} 
} 
} 
} 
</script> 

<div class="container-fluid">
	<div class="row-fluid" >
		<div class="span12" >
		<div border:2px solid;border-radius:25px>
		<div style="background-image:url('../../map/9.jpg');background-size:100%; height: 400px; width: 100%" ;></div>
<!-- 插入容器图片 -->
		</div>
		</p>
	</div>
	<div class="row-fluid" >
	
	<div >
<!-- 	设置下部分的背景图片 -->
	










		<div class="col-xs-6 span3" >
		<p border:2px solid;border-radius:30px>
		
		<div class="accordion" id="accordion-501368">
<div class="accordion-group">
<div class="accordion-heading"><a class="accordion-toggle" contenteditable="true" data-parent="#accordion-501368" data-toggle="collapse" href="#accordion-element-53782">用户管理 </a></div>

<div class="accordion-body in" id="accordion-element-53782" style="height: auto;">
<div class="accordion-inner" contenteditable="true"><a name="b1" onClick="div_none('b1');" class=title><font color="black">密码修改</font></a></div>

<div class="accordion-inner" contenteditable="true"><a name="b2" onClick="div_none('b2');" class=titlt><font color="black">密保设置</font></a></div>

<div class="accordion-inner" contenteditable="true"><a name='b3' onClick="div_none('b3');" class=title><font color="black">个人信息查看</font></div>
</div>
</div>

<div class="accordion-group">
<div class="accordion-heading"><a class="accordion-toggle" contenteditable="true" data-parent="#accordion-501367" data-toggle="collapse" href="#accordion-element-53781">物流管理 </a></div>

<div class="accordion-body in" id="accordion-element-53781" style="height: auto;">
<div class="accordion-inner" contenteditable="true"><a name="b4" onClick="div_none('b4');" class=title><font color="black">物流动态查询</font></a></div>

<div class="accordion-inner" contenteditable="true"><a name="b5" onClick="div_none('b5');" class=title><font color="black">历史物流信息</font></a></div>

<div class="accordion-inner" contenteditable="true"><a name="b6" onClick="div_none('b6');" class=title><font color="black">查看待收货</font></a></div>

<div class="accordion-inner" contenteditable="true"><a name="b7" onClick="div_none('b7');" class=title><font color="black">查看已收货</font></a></div>
</div>
</div>

</div>
		
		
</p>
		</div>
		<div class="col-xs-6 span9">
		<p border:2px solid;border-radius:30px>
		
		<div style="display:none;" class="b1">
		此操作进行密码修改
<!-- 		隐藏界面，在后台进行用户密码修改操作（我没有写代码，） -->
		</div>
		
		<div style="display:none;" class="b2">
		此操作进行密保设置
<!-- 		隐藏界面，在后台进行密保设置操作 -->
		</div>
		
		<div style="display:none;" class="b3">
		此操作进行个人信息查看
<!--     隐藏界面，在后台进行个人信息查询操作 -->
		</div>
		
		<div style="display:none;" class="b4">
		此操作进行物流动态查询
<!--     隐藏界面，在后台进行物流动态查询操作 -->
		</div>
		
		<div style="display:none;" class="b5">
		此操作进行历史信息查询
<!--     隐藏界面，在后台进行物流动态查询操作 -->
		</div>
		
		<div style="display:none;" class="b6">
		此操作进行查看待收货操作
<!--     隐藏界面，在后台进行查看待收货操作 -->
		</div>
		
		<div style="display:none;" class="b7">
		此操作进行查看已收货操作
<!--     隐藏界面，在后台进行查看已收货操作 -->
		</div>
		
		</p>

		</div>
		</div>
	</div>
</div>
</div>
</body>
</html>