<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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

<!-- Custom styles for this template -->
<link href="./assets/css/jumbotron.css" rel="stylesheet">

<!-- Custom styles for this template -->
<link href="../assets/css/navbar-fixed-top.css" rel="stylesheet">

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
				<li class="active"><a href="index.jsp">主页</a></li>
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
	<!-- Main jumbotron for a primary marketing message or call to action -->
	<div class="jumbotron" style="background-color:#CCCCFF;width:100%;">
		<div class="container">
			<center>
				<h1>
					<font color="#337AB7">欢迎来到蜗牛速递</font>
				</h1>
				<p>蜗牛，为梦想而生</p>
				<p>再牛逼的梦想,也抵不住傻逼似的坚持！</p>
			</center>
		</div>
	</div>

	<div class="container-fluid">

		<div class="bs-example" data-example-id="simple-carousel">
			<div id="carousel-example-generic" class="carousel slide"
				data-ride="carousel">
				<ol class="carousel-indicators">
					<li data-target="#carousel-example-generic" data-slide-to="0"
						class="active"></li>
					<li data-target="#carousel-example-generic" data-slide-to="1"></li>
					<li data-target="#carousel-example-generic" data-slide-to="2"></li>
				</ol>
				<div class="carousel-inner" role="listbox">
					<div class="item active">
						<img src="./assets/image/1.jpg"
							data-src="holder.js/1600x500?random=yes&auto=yes&text=激情"
							alt="First slide">
						<div class="carousel-caption">
							<h1 style="text-align: center; font-size: 50px;">激情</h1>
							<p style="text-align: center; font-size: 20px;">激情是火，满怀激情的工作是“蜗牛”客服挫折与磨难的最大动力！</p>
						</div>
					</div>
					<div class="item">
						<img src="./assets/image/2.jpg"
							data-src="holder.js/1600x500?random=yes&auto=yes&text=速度"
							alt="Second slide">
						<div class="carousel-caption">
							<h1 style="text-align: center; font-size: 50px;">速度</h1>
							<p style="text-align: center; font-size: 20px;">速度是风，“蜗牛”对速度的渴望将超乎你的想象。</p>
						</div>
					</div>
					<div class="item">
						<img src="./assets/image/3.jpg"
							data-src="holder.js/1600x500?random=yes&auto=yes&text=力量"
							alt="Third slide">
						<div class="carousel-caption">
							<h1 style="text-align: center; font-size: 50px;">力量</h1>
							<p style="text-align: center; font-size: 20px;">力量是山，对力量的崇拜将使“蜗牛”竭尽全力的用真诚收寄每一份快递</p>
						</div>
					</div>
				</div>
				<a class="left carousel-control" href="#carousel-example-generic"
					role="button" data-slide="prev"> <span
					class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
					<span class="sr-only">Previous</span>
				</a> <a class="right carousel-control" href="#carousel-example-generic"
					role="button" data-slide="next"> <span
					class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
					<span class="sr-only">Next</span>
				</a>
			</div>
		</div>
	</div>

	<div class="container-fluid">
		<!-- Example row of columns -->
		<div class="row-fluid">
			<ul class="nav nav-tabs">
				<li class="active"><a data-toggle="tab" href="#a">实迅新闻</a></li>
				<li><a data-toggle="tab" href="#b">行业动向</a></li>
				<li><a data-toggle="tab" href="#c">通知公告</a></li>
			</ul>
			<div class="tab-content">
				<div class="tab-pane active" id="a">
					<div class="col-md-4">
						<h2></h2>
						<img src="./assets/image/4.jpg"
							data-src="holder.js/350x220?random=yes&auto=yes&text=抱歉图片暂时无法加载" />
						<h2>蜗牛速递今日正式成立</h2>
						<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;这只能够高速运动的蜗牛是一个邮差，它的任务可不简单，是在各个星球之间传送邮件。这款游戏玩起来更像是一个竞速类的游戏。游戏中，这只蜗牛将会遇到各种艰难险阻，有各种各样的障碍物，一不小心，装上这些障碍物蜗牛就会粉身碎骨；在它的快递路上，还有很多的敌人出现，蜗牛还必须要用武器来攻击它们。你可以给自己加血，也可以升级武器，武器最高可升级成火箭弹，这样就能打死一大群敌人了。游戏的画面还是相当不错，速度感非常强。</p>
						<p>
							<a class="btn btn-default" href="#" role="button">详情 &raquo;</a>
						</p>
					</div>
					<div class="col-md-4">
						<h2></h2>
						<img src="../assets/image/5.jpg"
							data-src="holder.js/350x220?random=yes&auto=yes&text=抱歉图片暂时无法加载" />
						<h2>中国国家主席习近平会见蜗牛董事长</h2>
						<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;习近平，男，汉族，1953年6月生，陕西富平人，1969年1月参加工作，1974年1月加入中国共产党，清华大学人文社会学院马克思主义理论与思想政治教育专业毕业，在职研究生学历，法学博士学位。现任中国共产党中央委员会总书记、中共中央军事委员会主席，中华人民共和国主席，中华人民共和国中央军事委员会主席，中央军民融合发展委员会主任。</p>
						<p>
							<a class="btn btn-default" href="#" role="button">详情 &raquo;</a>
						</p>
					</div>
					<div class="col-md-4">
						<h2></h2>
						<img src="../assets/image/6.jpg"
							data-src="holder.js/350x220?random=yes&auto=yes&text=抱歉图片暂时无法加载" />
						<h2>一百年润发刘德华成为蜗牛速递形象代言人</h2>
						<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;刘德华（Andy
							Lau），1961年9月27日出生于中国香港，华语演员、歌手及电影监制。20世纪九十年代获封香港乐坛“四大天王”之一。1985年凭借首张专辑《只知道此刻爱你》打响歌坛知名度，主要代表歌曲有《冰雨》、《爱你一万年》、《男人哭吧哭吧不是罪》等。1995年至2016年间，获得多次IFPI香港唱片销量大奖、
							十大中文金曲奖优秀流行歌手大奖等，被《2000吉尼斯世界纪录大全》评为“获奖最多的香港男歌手”。电影方面他获得3次香港电影金像奖最佳男主角和2次金马奖最佳男主角，至今参演超过140部电影，代表作《无间道》、《桃姐》、《失孤》、《王牌逗王牌》等。他还是天幕公司和映艺集团的创建者，作为投资人已参与制作了20多部华语电影。创立刘德华慈善基金会，被评为世界十大杰出青年。2016年连任中国残疾人福利基金会副理事长</p>
						<p>
							<a class="btn btn-default" href="#" role="button">详情 &raquo;</a>
						</p>
					</div>
				</div>

				<div class="tab-pane" id="b">
					<div class="col-md-4">
						<a href="http://oversea.huanqiu.com/article/2017-07/11055546.html"
							target="_blank">蚌埠折射出中国小城市楼市需求正迅速增长</a><br /> <a
							href="http://oversea.huanqiu.com/article/2017-07/11055547.html"
							target="_blank">狗伤人增多！中国将向不负责的狗主人宣战</a><br /> <a
							href="http://oversea.huanqiu.com/article/2017-07/11055549.html"
							target="_blank">拉拢奢侈品 中国电商将打造高大上快递服务</a><br /> <a
							href="http://oversea.huanqiu.com/article/2017-07/11056324.html"
							target="_blank">吸引外国人来华的原因太多了，我爱中国！</a><br />
						<p>
							<a class="btn btn-default" href="#" role="button">获取更多
								&raquo;</a>
						</p>
					</div>
					<div class="col-md-4">
						<a href="http://world.huanqiu.com/exclusive/2017-07/11055886.html"
							target="_blank">环环采访手记：桥梁奇迹，世界向中国行注目礼</a><br /> <a
							href="http://world.huanqiu.com/article/2017-07/11056806.html"
							target="_blank">领先世界！卫星和地面间实现量子通道，中国做到了</a><br /> <a
							href="http://world.huanqiu.com/exclusive/2017-07/11058255.html"
							target="_blank">委41.5%选民参加制宪大会选举投票 马杜罗宣布胜利</a><br /> <a
							href="http://world.huanqiu.com/exclusive/2017-07/11057799.html"
							target="_blank">担心俄罗斯以牙还牙？罗马尼亚外访不在莫斯科转机</a><br /> <a
							href="http://c.huanqiu.com/www/mil/milmovie/2017-07/11056661.html"
							target="_blank">中国阅兵倾倒了新西兰小伙</a><br /> <a
							href="http://mil.huanqiu.com/milmovie/2017-07/11053938.html"
							target="_blank">黑人兄弟如此感慨(视频)</a><br />
						<p>
							<a class="btn btn-default" href="#" role="button">获取更多
								&raquo;</a>
						</p>
					</div>
					<div class="col-md-4">
						<a href="http://world.huanqiu.com/exclusive/2017-07/11056136.html"
							target="_blank">中国拟开放5城市雇佣菲佣 月薪或高达1.3万元</a><br /> <a
							href="http://taiwan.huanqiu.com/article/2017-07/11058377.html"
							target="_blank">台6000万美元金援伯利兹2000万白送 被指有断交危机</a><br /> <a
							href="http://world.huanqiu.com/exclusive/2017-07/11056952.html"
							target="_blank">韩国土部：上半年中韩航线客运量同比减少近三成</a><br /> <a
							href="http://look.huanqiu.com" target="_blank">法发生森林大火致上万人撤离
							嫌犯为两名少年(视频)</a><br /> <a
							href="http://mil.huanqiu.com/observation/2017-07/11056468.html"
							target="_blank">专家：东风26导弹可打击4000公里内大型水面移动目标</a><br />
						<p>
							<a class="btn btn-default" href="#" role="button">获取更多
								&raquo;</a>
						</p>

					</div>
				</div>

				<div class="tab-pane" id="c">
					<div class="col-md-4">
						<h1 class="fz-20 b" style="margin-top: 15px;">
							<a style="color: #000"
								href="http://www.cankaoxiaoxi.com/world/20170731/2214725.shtml"
								title="美军方称用“萨德”成功拦截中程导弹" target="_blank">美军方称用“萨德”成功拦截中程导弹</a>
						</h1>
						<div class="ov clear lh-26" style="margin-right: -10px;">
							<!--有副标题一行两个-->
							<a
								href="http://www.cankaoxiaoxi.com/world/20170730/2214511.shtml"
								title="中方抗议美韩加快部署萨德" class="fz-14 cor333" target="_blank">中方抗议美韩加快部署"萨德"</a>
							<a
								href="http://www.cankaoxiaoxi.com/world/20170730/2214251.shtml"
								title="韩企忧“萨德”影响长期化" class="mar-r-10 fz-14 cor333"
								style="margin-left: 5px; padding-left: 8px; border-left: 1px solid #c9c9c9;"
								target="_blank">韩企忧“萨德”影响长期化</a>
							<div class="ov clear lh-26" style="margin-right: -10px;">
								<a
									href="http://www.cankaoxiaoxi.com/world/20170731/2214734.shtml"
									title="外媒：美再派轰炸机飞越朝鲜半岛 对朝射弹反应快于以往"
									class="mar-r-10 fz-14 cor333" target="_blank">外媒：美再派轰炸机飞越朝鲜半岛
									对朝射弹反应快于以往</a>
							</div>
							<p>
								<a href="#">获取更多</a>
							</p>
						</div>
					</div>
				</div>
			</div>
		</div>

	</div>
	<!-- /container -->

	<div class="container-fluid">
		<h3>
			<font style="font-weight: bold;">我们的产品</font>
		</h3>
		<div class="row-fluid">
			<div class="col-md-3">
				<h4>
					<font style="font-weight: bold;">新产品</font>
				</h4>
				<div class="accordion-inner">
					<a>报价服务</a>
				</div>
				<div class="accordion-inner">
					<a>代收货款</a>
				</div>
				<div class="accordion-inner">
					<a>港台件</a>
				</div>
				<div class="accordion-inner">
					<a>国际件</a>
				</div>
			</div>
			<div class="col-md-3">
				<h4>
					<font style="font-weight: bold;">时效产品</font>
				</h4>
				<div class="accordion-inner">
					<a>8小时同城区域当天件</a>
				</div>
				<div class="accordion-inner">
					<a>12小时凌晨次日达</a>
				</div>
				<div class="accordion-inner">
					<a>24小时次日达</a>
				</div>
				<div class="accordion-inner">
					<a>36小时隔日上午达</a>
				</div>
			</div>
			<div class="col-md-3">
				<h4>
					<font style="font-weight: bold;">增值服务</font>
				</h4>
				<div class="accordion-inner">
					<a>仓配一体服务</a>
				</div>
				<div class="accordion-inner">
					<a>到付件业务</a>
				</div>
				<div class="accordion-inner">
					<a>签证往返</a>
				</div>
				<div class="accordion-inner">
					<a>夜间服务</a>
				</div>
			</div>
			<div class="col-md-3">
				<h4>
					<font style="font-weight: bold;">其他快递</font>
				</h4>
				<div class="accordion-inner">
					<a href="http://www.ttkdex.com/" target="_blank">天天快递</a>
				</div>
				<div class="accordion-inner">
					<a href="http://www.yundaex.com/cn/index.php" target="_blank">韵达速递</a>
				</div>
				<div class="accordion-inner">
					<a href="http://www.yto.net.cn/gw/index/index.html" target="_blank">圆通快递</a>
				</div>
				<div class="accordion-inner">
					<a href="http://www.sf-express.com/cn/sc/" target="_blank">顺丰速运</a>
				</div>
				<div class="accordion-inner">
					<a href="http://www.zto.com/" target="_blank">中通快递</a>
				</div>
				<div class="accordion-inner">
					<a href="http://www.sto.cn/" target="_blank">申通快递</a>
				</div>
			</div>
		</div>
	</div>
	<!-- /container -->

	<div class="container-fluid">
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