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
// 	for(j=i+1;j<allPageTags.length;j++){
// 		var obj2=allPageTags[j];
// 		obj2.style.display="none";
// 	}
// 	for(i=k-1;k>=0;k--){
// 		var obj3=allPageTags[k];
// 		obj3.style.display="none";
// 	}
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
		<div style="background-image:url('../../map/9.jpg');background-size:100%; height: 360px; width: 100%" ;></div>
<!-- 插入容器图片 -->
		</div>
		</p>
	</div>
	<div class="row-fluid" >
	
	<div>
<!-- 	设置下部分的背景图片 -->
	









		<div class="col-xs-6 span3" >
		<p border:2px solid;border-radius:30px>
<div class="list-group-item" ><a name="a1" onClick="div_none('a1');" class="title" id="d1" >投诉建议</a></div>

<div class="list-group" contenteditable="true"><a class="list-group-item active" href="#">寄件须知</a></div>

<div class="list-group-item"><a name="a2" onClick="div_none('a2');" class="title">收费标准</a></div>

<div class="list-group-item"><a name="a3" onClick="div_none('a3');" class="title">禁运物品</a></div>

<div class="list-group-item"><a name="a4" onClick="div_none('a4');" class="title">海外寄件</a></div>


<!-- 调用javascript函数，具体函数在函数开头 -->
<div class="list-group" contenteditable="true"><a class="list-group-item active" href="#">关于我们</a></div>

<div class="list-group-item"><a name="a5" onClick="div_none('a5');" class="title">企业简介</a></div>

<div class="list-group-item"><a name="a6" onClick="div_none('a6');" class="title">企业文化</a></div>

<div class="list-group-item"><a name="a7" onClick="div_none('a7');" class="title">蜗牛人物</a></div>
</p>
		</div>
		<div class="col-xs-6 span9">
		<p border:2px solid;border-radius:30px>
		<script>
		function click(){
			
		}
		</script>
		
		
		<div style="" class="a1" id=r1>
<!-- 		隐藏div -->
		<form action="sava_book.php" method="post">
<center>
<p style="padding-right:600px">用户名<input name="username" style="height:30px" type="text"></p>
</center>

<center>
<p>留言板<textarea name="content" style="width:800px;height:400px"></textarea></p>
</center>


<center style="padding-left:100px">
         <img src="../../map/queren.png" title="提交" onclick="click4()">
             <script>
               function click4(){
            	  
// 	            进行数据库操作
               }
              </script> 
              <img src="../../map/fanhui.png" title="返回" onclick="javascript:history.back(-1);" > <!--        按钮功能：留言取消并返回历史上一页 --></center>

<p>&nbsp;</p>
</form>
</div>
<!-- 第一个div，投诉建议 -->




<div style="display:none;" class="a2">
<!-- 		隐藏div -->
	<h4 class="text-center">
				<strong>蜗牛快递收费标准</strong>
			</h4>
			<p>
				 <span>体积重量是一种反映包裹密度的计算方式。低密度的包裹，比较其实际重量，占用的空间通常较大。计算出来的体积重量，会与其实际重量比较，取较重者为计费重量，用以计算运费。</span><span>根据市场惯例，体积重量(kg)的计算方法为:长度(cm)x宽度(cm)x高度(cm)÷6,000(计算方法都是按地区及市场惯例决定, 当中可能各有差异。</span>
			</p>
			<p>
				<strong>备注：</strong>
			</p>
			<p>
				1、此价格供参考。详情请致电大陆客户服务热线 95338。
			</p>
			<p>
				2、对于约定由收件人(或第三方)付费(含运费及增值服务费)的快件，在快件签收之前，可提出对费用付款方式变更为寄方付。对于需要更改付款方式的快件，寄件人除需要支付运费外，每票需另外支付更改付款方式服务费。(收费标准)
			</p>
			<p>
				3、如收派件地址为香港非工商地区或香港偏远地区，上门收派每票另收港币$30，附加费可与运费绑定(寄付或到付)，收派件时效需加1个工作天。
			</p>
			<p>
				4、台湾部分地区收派时效需加1工作天，可按此查阅详情。
			</p>
			<p>
				5、以上由香港、澳门及台湾寄件至中港澳台之运费包含燃油附加费，请按此了解更多燃油附加费的资料。
			</p>
			<p>
				6、以上运费未包含海外进口可能发生的清关附加费用，请按此了解更多关于进口清关附加费的相关资料。
			</p>
</div>
 
 
   
<div style="display:none;" class="a3">
<h4 class="text-center">
				<strong>蜗牛快递禁运物品清单</strong>
			</h4>
			<p>
				<span>一、中国海关禁限进出口物品</span>
			</p>
			<p>
				<span>1、各种武器、仿真武器、弹药及爆炸物品；</span><br /><span>2、伪造的货币及伪造的有价证券；</span><br /><span>3、对中国政治、经济、文化、道德有害的印刷品、胶卷、照片、唱片、影片、录音带、录像带、激光视盘、计算机存储介质及其它物品；</span><br /><span>4、各种烈性毒药；</span><br /><span>5、鸦片、吗啡、海洛因、大麻以及其它能使人成瘾的麻醉品、精神药物；</span><br /><span>6、带有危险性病菌、害虫及其它有害生物的动物、植物及其产品；</span><br /><span>7、有碍人畜健康的、来自疫区的以及其它能传播疾病的食品、药品或其它物品。</span>
			</p>
			<p>
				<span>二、快递禁运物品有哪些</span>
			</p>
			<p>
				<span>1、难以估算价值的有价证券及易丢失的贵重物品，如：提货单、核销单、护照、配额证、许可证、执照、私人证件、汇票、发票、本国或外国货币（现金）、金银饰物、人造首饰、手机。</span><br /><span>2、易燃易爆、腐蚀性、毒性、强酸碱性和放射性的各种危险品，如：火柴、雷管、火药、爆竹、汽油、柴油、煤油、酒精（液体和固体）、硫酸、盐酸、硝酸、有机溶剂、农药及其它列入化学工业出版社出版的“化学危险品实用手册”中的化工产品。</span><br /><span>3、各类烈性毒药、麻醉药物和精神物品，如：砒霜、鸦片、吗啡、可卡因、海洛英、大麻等。</span><br /><span>4、国家法令禁止流通或寄运的物品，如：文物、武器、弹药、仿真武器等。</span><br /><span>5、含有反动、淫秽或有伤风化内容的报刊书籍、图片、宣传品、音像制品，激光视盘（VCD、DVD、LD）、计算机磁盘及光盘等。</span><br /><span>6、妨碍公共卫生的，如尸骨（包括已焚的尸骨）、未经硝制的兽皮、未经药制的兽骨等。</span><br /><span>7、动物、植物以及它们的标本。</span><br /><span>8、难以辨认成分的白色粉末。</span><br /><span>9、私人信函等。</span>
			</p>
			<p>
				<span>三、航空禁运物品有哪些</span>
			</p>
			<p>
				<span>1、威胁航空飞行安全的物品，指在航空运输中，可能明显地危害人身健康、安全或对财产造成损害的物品或物质。</span><br /><span>主要有以下几类：</span><br /> <span>A、爆炸品：如烟花爆竹、起爆引信等；</span><br /> <span>B、气体：如压缩气体、干冰、灭火器、蓄气筒(无排放装置，不能再充气的)、救生器(可自动膨胀的)等；</span><br /> <span>C、易燃液体：如油漆、汽油、酒精类、机油、樟脑油、发动机起动液、松节油、天拿水、胶水、香水等；</span><br /> <span>D、易燃固体：自燃物质，遇水释放易燃气体的物质，如活性碳、钛粉、椰肉干、蓖麻制品、橡胶碎屑、安全火柴(盒擦的或片擦的)、干燥的白磷、干燥的黄磷、镁粉等；</span><br /> <span>E、氧化剂和有机过氧化物：如高锰酸钾；</span><br /> <span>F、毒性和传染性物品：如农药、锂电池、催泪弹等；</span><br /> <span>G、放射性物质；</span><br /> <span>H、腐蚀品：如蓄电池、碱性的电池液。</span><br /> <span>I、未加消磁防护包装的磁铁、磁钢等含强磁的制品。</span><br /><span>2、任何药品。</span><br /><span>3、其它航空禁运品，如：粉末状物品 (不论何种颜色) 、液体（不论使用何种包装）、外包装有危险标志的货品、没有国家音像出版社证明的音像制品（含CD、VCD）、刀具、榴莲、带气火机、涉及“武器”和“枪支”概念的任何货品（含玩具）等。</span>
			</p>
			<p>
				<span>四、EMS禁止寄递的物品有哪些</span>
			</p>
			<p>
				<span>1、国家法律法规禁止流通或者寄递的物品；</span><br /><span>2、爆炸性、易燃性、腐蚀性、放射性和毒性等危险物品；</span><br /><span>3、反动报刊、书籍、窗口或者淫秽物品；</span><br /><span>4、各种货币；</span><br /><span>5、妨害公共卫生的物品；</span><br /><span>6、容易腐烂的物品；</span><br /><span>7、活的动物（包装能确保寄递和工作人员安全的蜜蜂、蚕、水蛭除外）；</span><br /><span>8、包装不妥，可能危害人身安全、污染或损毁其它邮件设备的物品；</span><br /><span>9、其它不适合邮递条件的物品。</span>
			</p>
</div>


<div style="display:none;" class="a4">
	<h4 class="text-center">
				<strong>蜗牛速递海外寄件</strong>
			</h4>
			<p>
				<strong>业务介绍</strong>
			</p>
			<p>
				蜗牛速递已在香港、台湾、韩国、日本、东南亚、欧美、中东、北美洲、非洲等许多国家和城市运作国际快件业务
			</p>
			<p>
				<strong>韩国件</strong>
			</p>
			<p>
				<strong>服务介绍</strong>
			</p>
			<p>
				2014年圆通开通了上海至韩国的快件服务，2015年3月10日圆通开通了上海浦东至韩国仁川的首条航线，再次扩大中国至韩国的快件业务。
			</p>
			<p>
				<strong>服务时效</strong>
			</p>
			<p>
				1.快件体积限制：尺寸限度单边≤100cm，三边之和≤160cm。<br /> 2.快件重量限制：单件重量≤25kg。<br /> 3.单票30kg以上或者申报金额100美金以上的，将自动转为正式清关,，如产生韩国正式清关手续费,税金和附加税单独列出来，需另行缴纳。
			</p>
			<p>
				<strong>资费标准</strong>
			</p>
			<p>
				包裹价格：首重82元+续重22元<br /> 大货价格：<br /> 21 ~ 30 35元/公斤<br /> 31 ~ 70 34元/公斤<br /> 71 ~ 300 33元/公斤<br /> 300 以上 32元/公斤<br /> 注：参考国际航空运输协会(IATA)的规定，对于体积大、重量轻的货物，我们将根据体积重量和实际重量中较重的一种收费。您可以利用下列公式计算体积重量:体积重量(公斤)=长(厘米)X宽(厘米)X高(厘米)/6000。
			</p>
			<p>
				<strong>业务咨询电话</strong>
			</p>
			<p>
				021-69777777-6995，13917329163
			</p>
			<p>
				<strong>业务咨询邮箱</strong>
			</p>
			<div class="right-box">
				<div class="box-bd product-bd">
					<p>
						0309182@yto.net.cn
					</p>
</div>
</div>
</div>

<div style="display:none;" class="a5">
            	<h4 class="text-center">
				<strong>蜗牛速递海外寄件</strong>
			</h4>

</div>
<div style="display:none;" class="a6">
            	<h4 class="text-center">
				<strong>蜗牛速递海外寄件</strong>
			</h4>
</div>
<div style="display:none;" class="a7">
            	<h4 class="text-center">
				<strong>蜗牛速递海外寄件</strong>
			</h4>
</div>


		</div>
		</div>
	</div>
</div>
</div>
</body>
</html>