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
<title>欢迎来到蜗牛速递</title>
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
</head>
<body>
     <style> 
        .black_overlay{ 
            display: none; 
            position: absolute; 
            top: 0%; 
            left: 0%; 
            width: 100%; 
            height: 100%; 
            background-color: black; 
            z-index:1001; 
            -moz-opacity: 0.8; 
            opacity:.80; 
            filter: alpha(opacity=88); 
        } 
        .white_content { 
            display: none; 
            position: absolute; 
            top: 25%; 
            left: 25%; 
            width: 55%; 
            height: 55%; 
            padding: 20px; 
            border: 10px solid orange; 
            background-color: white; 
            z-index:1002; 
            overflow: auto; 
        } 
    </style> 
<div class="container-fluid" id="LG">
	<div class="row-fluid">
		<div class="span12">
			<div class="row-fluid">
				<div class="span6">
				</div>
				<div class="span6">
				</div>
			</div>
			<div class="navbar">
				<div>
					<div class="container-fluid">
						<div class="nav-collapse collapse navbar-responsive-collapse">
							<div style=float:right>
								<form class="form-search">
								<input class="input-medium search-query" type="text" />
								
									 <img src="./map/kuaididanhaochaxun.png" title="快递单号查询" onclick="click5()">
                                         <script>
                                         function click5(){
	                                  
                                            }
                                        </script>
								</form>
							</div>
							<ul class="nav">
								<li>
									<a class="btn btn-navbar" data-target=".navbar-responsive-collapse" data-toggle="collapse"></a> <a class="brand" href="#"><strong><em>蜗牛速递</em></strong></a>
								</li>
								<li class="active">
									<a href="#">主页</a>
								</li>
								<li><a href="./html/top.html/bangzhu.jsp" >投诉建议</a></li>
								<li class="dropdown">
									<a class="dropdown-toggle" data-toggle="dropdown" href="./html/top.html/bangzhu.">寄件须知</a>
									<ul class="dropdown-menu">
										<li>
											<a href="./html/top.html/bangzhu.jsp" >收费标准</a>
										</li>
										<li>
											<a href="./html/top.html/bangzhu.jsp" >禁运物品</a>
										</li>
										<li>
											<a href="./html/top.html/bangzhu.jsp" >海外寄件</a>
										</li>
									</ul>
								</li>
								<li class="dropdown">
									<a class="dropdown-toggle" data-toggle="dropdown" href="#">关于我们</a>
									<ul class="dropdown-menu">
										<li>
											<a href="./html/top.html/bangzhu.jsp" >企业简介</a>
										</li>
										<li>
											<a href="./html/top.html/bangzhu.jsp" >企业文化</a>
										</li>
										<li>
											<a href="./html/top.html/bangzhu.jsp" >蜗牛人物</a>
										</li>
									</ul>
								</li>
								<li><a href="manager/staffhome" >后台管理</a></li>
							</ul>
						</div>
						
					</div>
				</div>
				
			</div>
			<div class="carousel slide" id="carousel-503304">
				<ol class="carousel-indicators">
					<li data-slide-to="0" data-target="#carousel-503304">
					</li>
					<li class="active" data-slide-to="1" data-target="#carousel-503304">
					</li>
					<li data-slide-to="2" data-target="#carousel-503304">
					</li>
				</ol>
				<div class="carousel-inner">
					<div class="item">
						<img alt="" src="./map/1.jpg" />
						<div class="carousel-caption">
							<h4>
								力量
							</h4>
							<p>
								力量是山，对力量的崇拜将使“蜗牛”竭尽全力的用真诚收寄每一份快递
							</p>
						</div>
					</div>
					<div class="item active">
						<img alt="" src="./map/2.jpg" />
						<div class="carousel-caption">
							<h4>
								激情
							</h4>
							<p>
							    激情是火，满怀激情的工作是“蜗牛”客服挫折与磨难的最大动力！
							</p>
						</div>
					</div>
					<div class="item">
						<img alt="" src="./map/3.jpg" />
						<div class="carousel-caption">
							<h4>
								速度
							</h4>
							<p>
							速度是风，“蜗牛”对速度的渴望将超乎你的想象。
							</p>
						</div>
					</div>
				</div> <a class="left carousel-control" data-slide="prev" href="#carousel-503304">?</a> <a class="right carousel-control" data-slide="next" href="#carousel-503304">?</a>
			</div>
			<div class="hero-unit well">
				<h1>
					<a href="http://whttps://web.sogou.com/?12646">欢迎来到蜗牛速递</a>
				</h1><hr />
				<p>
					蜗牛，为梦想而生
				</p>
				<p>
					再牛逼的梦想,也抵不住傻逼似的坚持！
				</p>
			</div>
			<div class="row-fluid">
				<div class="span8">
					<div class="tabbable" id="tabs-77953">
						<ul class="nav nav-tabs">
							<li class="active">
								<a data-toggle="tab" href="#panel-205045">实迅新闻</a>
							</li>
							<li>
								<a data-toggle="tab" href="#panel-205000">行业动向</a>
							</li>
							<li>
								<a data-toggle="tab" href="#panel-396925">通知公告</a>
							</li>
						</ul>
						<div class="tab-content">
							<div class="tab-pane active" id="panel-205045">
								<ul class="thumbnails">
									<li class="span4">
										<div class="thumbnail">
											<img alt="300x200" src="./map/4.jpg" />
											<div class="caption">
												<h3>
													蜗牛速递今日正式成立
												</h3>
												<p>
													这只能够高速运动的蜗牛是一个邮差，它的任务可不简单，是在各个星球之间传送邮件。这款游戏玩起来更像是一个竞速类的游戏。 　　游戏中，这只蜗牛将会遇到各种艰难险阻，有各种各样的障碍物，一不小心，装上这些障碍物蜗牛就会粉身碎骨；在它的快递路上，还有很多的敌人出现，蜗牛还必须要用武器来攻击它们。你可以给自己加血，也可以升级武器，武器最高可升级成火箭弹，这样就能打死一大群敌人了。 　　游戏的画面还是相当不错，速度感非常强。
												</p>
												
											</div>
										</div>
									</li>
									<li class="span4">
										<div class="thumbnail" >
											<img alt="300x200" src="./map/8.jpg" />
											<div class="caption">
												<h3>
													中国国家主席习近平会见蜗牛董事长
												</h3>
												<p>
													习近平，男，汉族，1953年6月生，陕西富平人，1969年1月参加工作，1974年1月加入中国共产党，清华大学人文社会学院马克思主义理论与思想政治教育专业毕业，在职研究生学历，法学博士学位。现任中国共产党中央委员会总书记、中共中央军事委员会主席，中华人民共和国主席，中华人民共和国中央军事委员会主席，中央军民融合发展委员会主任。
												</p>
											</div>
										</div>
									</li>
									<li class="span4">
										<div class="thumbnail">
											<img alt="300x200" src="./map/5.jpg" />
											<div class="caption">
												<h3>
													一百年润发刘德华成为蜗牛速递形象代言人
												</h3>
												<p>
						                           刘德华（Andy Lau），1961年9月27日出生于中国香港，华语演员、歌手及电影监制。20世纪九十年代获封香港乐坛“四大天王”之一。1985年凭借首张专辑《只知道此刻爱你》打响歌坛知名度，主要代表歌曲有《冰雨》、《爱你一万年》、《男人哭吧哭吧不是罪》等。1995年至2016年间，获得多次IFPI香港唱片销量大奖、 十大中文金曲奖优秀流行歌手大奖等，被《2000吉尼斯世界纪录大全》评为“获奖最多的香港男歌手”。电影方面他获得3次香港电影金像奖最佳男主角和2次金马奖最佳男主角，至今参演超过140部电影，代表作《无间道》、《桃姐》、《失孤》、《王牌逗王牌》等。他还是天幕公司和映艺集团的创建者，作为投资人已参与制作了20多部华语电影。创立刘德华慈善基金会，被评为世界十大杰出青年。2016年连任中国残疾人福利基金会副理事长
												</p>
												
											</div>
										</div>
									</li>
								</ul>
								
							</div>
							<div class="tab-pane" id="panel-205000">
							
							<div class="container-fluid">
	                        <div class="row-fluid">

		<div class="span4">
			<li><a href="http://oversea.huanqiu.com/article/2017-07/11055546.html" target="_blank">蚌埠折射出中国小城市楼市需求正迅速增长</a></li>
			<li><a href="http://oversea.huanqiu.com/article/2017-07/11055547.html" target="_blank">狗伤人增多！中国将向不负责的狗主人宣战</a></li>
			<li><a href="http://oversea.huanqiu.com/article/2017-07/11055549.html" target="_blank">拉拢奢侈品 中国电商将打造高大上快递服务</a></li>
			<li><a href="http://oversea.huanqiu.com/article/2017-07/11056324.html" target="_blank">吸引外国人来华的原因太多了，我爱中国！</a></li>
			<p>>><a href="#">获取更多</a>
			<img src="./map/guanliyuancaozuo.png" title="仅限于管理员操作！" onclick="click1()">
 <script>
 function click1(){
	 
// 此处设置添加管理员操作代码

 }
 </script>
 </p>
		</div>
		<div class="span4">
<li class="first"><a href="http://world.huanqiu.com/exclusive/2017-07/11055886.html" target="_blank">环环采访手记：桥梁奇迹，世界向中国行注目礼</a></li>
<li><a href="http://world.huanqiu.com/article/2017-07/11056806.html" target="_blank">领先世界！卫星和地面间实现量子通道，中国做到了</a></li>
<li><a href="http://world.huanqiu.com/exclusive/2017-07/11058255.html" target="_blank">委41.5%选民参加制宪大会选举投票 马杜罗宣布胜利</a></li>
<li><a href="http://world.huanqiu.com/exclusive/2017-07/11057799.html" target="_blank">担心俄罗斯以牙还牙？罗马尼亚外访不在莫斯科转机</a></li>
<li><a href="http://c.huanqiu.com/www/mil/milmovie/2017-07/11056661.html" target="_blank">中国阅兵倾倒了新西兰小伙</a> <a href="http://mil.huanqiu.com/milmovie/2017-07/11053938.html" target="_blank">黑人兄弟如此感慨(视频)</a></li>
<p>>><a href="#">获取更多</a>
<img src="./map/guanliyuancaozuo.png" title="仅限于管理员操作！" onclick="click1()">
 <script>
 function click2(){
//      onclick响应做判断是否为用户和管理员操作，若为管理员则进入管理员后台界面。
 }
 </script>
<!--  点击按钮， 判断是否为管理员，若是管理员，进入管理员后台进行操作， 实现行业动向更新  -->
 </p> 
		</div>
		
		<div class="span4">
<li class="first"><a href="http://world.huanqiu.com/exclusive/2017-07/11056136.html" target="_blank">中国拟开放5城市雇佣菲佣 月薪或高达1.3万元</a></li>
<li><a href="http://taiwan.huanqiu.com/article/2017-07/11058377.html" target="_blank">台6000万美元金援伯利兹2000万白送 被指有断交危机</a></li>
<li><a href="http://world.huanqiu.com/exclusive/2017-07/11056952.html" target="_blank">韩国土部：上半年中韩航线客运量同比减少近三成</a></li>
<li><a href="http://look.huanqiu.com" target="_blank">法发生森林大火致上万人撤离 嫌犯为两名少年(视频)</a></li>
<li><a href="http://mil.huanqiu.com/observation/2017-07/11056468.html" target="_blank">专家：东风26导弹可打击4000公里内大型水面移动目标</a></li>
<p>>><a href="#">获取更多</a> 

 <img src="./map/guanliyuancaozuo.png" title="仅限于管理员操作！" onclick="click3()">
 <script>
 function click3(){
//      onclick响应做判断是否为用户和管理员操作，若为管理员则进入管理员后台界面。
 }
 </script>

</p>
		</div>
	                 </div>
                        </div>
							</div>
							<div class="tab-pane" id="panel-396925">
       <h1 class="fz-20 b" style="margin-top:15px;" ><a style="color:#000" href="http://www.cankaoxiaoxi.com/world/20170731/2214725.shtml" title="美军方称用“萨德”成功拦截中程导弹" target="_blank">美军方称用“萨德”成功拦截中程导弹</a>
        </h1>
         
       <div class="ov clear lh-26" style="margin-right:-10px; "> 
                    <!--有副标题一行两个-->
            <a href="http://www.cankaoxiaoxi.com/world/20170730/2214511.shtml" title="中方抗议美韩加快部署"萨德"" class="fz-14 cor333"  target="_blank">中方抗议美韩加快部署"萨德"</a>
            <a href="http://www.cankaoxiaoxi.com/world/20170730/2214251.shtml" title="韩企忧“萨德”影响长期化" class="mar-r-10 fz-14 cor333" style="margin-left:5px; padding-left:8px; border-left:1px solid #c9c9c9;" target="_blank">韩企忧“萨德”影响长期化</a>
            <div class="ov clear lh-26" style="margin-right:-10px; "> 
                     <a href="http://www.cankaoxiaoxi.com/world/20170731/2214734.shtml" title="外媒：美再派轰炸机飞越朝鲜半岛 对朝射弹反应快于以往" class="mar-r-10 fz-14 cor333" target="_blank">外媒：美再派轰炸机飞越朝鲜半岛 对朝射弹反应快于以往</a>
                          </div>
             <p>>><a href="#">获取更多</a> 

              <img src="./map/guanliyuancaozuo.png" title="仅限于管理员操作！" onclick="click4()">
              
          <script>
               function click4(){
// 	           onclick响应做判断是否为用户和管理员操作，若为管理员则进入管理员后台界面。
               }
              </script>

          </p>
             </div>
							</div>
						</div>
					</div>
					<div class="media">
						<a class="pull-left" href="#"><img class="media-object" src="img/a_002.jpg" alt='' /></a>
						<div class="media-body">
						</div>
					</div>
				</div>
				<div class="span4">
				<%
					if (session.getAttribute("cid_in_session") != null) {
				%>
				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown" role="button" aria-haspopup="true"
					aria-expanded="false"><%=session.getAttribute("cid_in_session")%><span
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
					<form class="form-horizontal"  action="login" method="post">
						<div id="container" >
							<div class="control-group">
								<label class="control-label" for="inputEmail">账号</label>
								<div class="controls">
									<input type="text" id="inputcid" name="cid" class="form-control"
				   placeholder="账号" required="">
								</div>
							</div>
							<div class="control-group">
								<label class="control-label" for="inputPassword">密码</label>
								<div class="controls">
									<input type="password" id="inputcpwd" name="cpwd" class="form-control"
				   placeholder="密码" required="">
								</div>
							</div>
							<div class="control-group">
								<div class="controls" aliegn=＂center＂>
									<label class="checkbox"><input type="checkbox" name="rme" value="rme">记住我 
									<button class="btn" type="submit">登陆</button>
									 <a href="register.jsp">点我注册</a>
<!-- 									 用户登陆注册 -->
								</div>
							</div>
						</div>
					</form>
					<%
					}
				%>
				</div>
			</div>
			<div class="row-fluid">
				<div class="span12">
					<h3>
						我们的产品
					</h3>
					<div class="row-fluid">
						<div class="col-xs-3 span3">
							<div class="accordion" id="accordion-250251">
								<div class="accordion-group">
									<div class="accordion-heading">
										<a class="accordion-toggle" data-parent="#accordion-250251" data-toggle="collapse" href="#accordion-element-206166">新产品</a>
									</div>
									<div class="accordion-body in" id="accordion-element-206166">
										<div class="accordion-inner">
										<font color="#AEEEEE">
											报价服务
										</font>
										</div>
										<div class="accordion-inner">
										<font color="#AEEEEE">
											代收货款
										</font>
										</div>
										<div class="accordion-inner">
										<font color="#AEEEEE">
											港台件
										</font>
										</div>
										<div class="accordion-inner">
										<font color="#AEEEEE">
											国际件
										</font>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="col-xs-3 span3">
							<div class="accordion" id="accordion-799782">
								<div class="accordion-group">
									<div class="accordion-heading">
										<a class="accordion-toggle" data-parent="#accordion-799782" data-toggle="collapse" href="#accordion-element-739275">时效产品</a>
									</div>
									<div class="accordion-body in" id="accordion-element-739275">
										<div class="accordion-inner">
										<font color="#AEEEEE">
											8小时同城区域当天件
											</font>
										</div>
										<div class="accordion-inner">
										<font color="#AEEEEE">
											12小时凌晨次日达
											</font>
										</div>
										<div class="accordion-inner">
										<font color="#AEEEEE">
											24小时次日达
											</font>
										</div>
										<div class="accordion-inner">
										<font color="#AEEEEE">
											36小时隔日上午达
										</font>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="col-xs-3 span3">
							<div class="accordion" id="accordion-886379">
								<div class="accordion-group">
									<div class="accordion-heading">
										<a class="accordion-toggle" data-parent="#accordion-886379" data-toggle="collapse" href="#accordion-element-603461">增值服务</a>
									</div>
									<div class="accordion-body in" id="accordion-element-603461">
										<div class="accordion-inner">
										<font color="#AEEEEE">
											仓配一体服务
										</font>
										</div>
										<div class="accordion-inner">
										<font color="#AEEEEE">
											到付件业务
											</font>
										</div>
										<div class="accordion-inner">
										<font color="#AEEEEE">
											签证往返
											</font>
										</div>
										<div class="accordion-inner">
										<font color="#AEEEEE">
											夜间服务
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="col-xs-3 span3">
							<div class="accordion" id="accordion-84925">
								<div class="accordion-group">
									<div class="accordion-heading">
										<a class="accordion-toggle" data-parent="#accordion-84925" data-toggle="collapse" href="#accordion-element-7616">其他快递</a>
									</div>
									<div class="accordion-body in" id="accordion-element-7616">
										<div class="accordion-inner">
										<a href="http://www.ttkdex.com/"><font color="#AEEEEE">
											天天快递
											</font>
										</a>
										</div>
										<div class="accordion-inner">
										<a href="http://www.yundaex.com/cn/index.php">
										<font color="#AEEEEE">
											韵达速递
											</font>
										</a>
										</div>
										<div class="accordion-inner">
										<a href="http://www.yto.net.cn/gw/index/index.html">
										<font color="#AEEEEE">
											圆通快递
											</font>
										</a>
										</div>
										<div class="accordion-inner">
										<a href="http://www.sf-express.com/cn/sc/">
										<font color="#AEEEEE">
											顺丰速运
											</font>
										</a>
										</div>
										<div class="accordion-inner">
										<a href="http://www.zto.com/">
										<font color="#AEEEEE">
											中通快递
											</font>
										</a>
										</div>
										<div class="accordion-inner">
										<a href="http://www.sto.cn/">
											<font color="#AEEEEE">
											申通快递
											</font>
									    <a>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
</body>
</html>