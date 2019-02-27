<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>ShoeMall首页</title>
<link rel="stylesheet" href="css/shoemall.css" type="text/css" />
<link rel="stylesheet" href="lib/jquery.bxslider.css" type="text/css" />

<script src="js/jquery.min.js"></script>
<script src="lib/jquery.bxslider.js"></script>
<script src="js/rainbow.min.js"></script>
<script src="js/scripts.js"></script>

<script type="text/javascript" charset="utf-8">
	function flx() {
		var table1 = document.getElementById("lx");
		table1.style.display = "block";
		document.getElementById("blx").style.background = "#F7F7F7";
		var table2 = document.getElementById("ss");
		table2.style.display = "none";
		document.getElementById("bss").style.background = "none";
		var table3 = document.getElementById("yd");
		table3.style.display = "none";
		document.getElementById("byd").style.background = "none";
		var elem = document.createElement("table");
		document.ElementById("lx").parentNode.appendChild(elem);
	}
	function fss() {
		var table1 = document.getElementById("lx");
		table1.style.display = "none";
		document.getElementById("blx").style.background = "none";
		var table2 = document.getElementById("ss");
		table2.style.display = "block";
		document.getElementById("bss").style.background = "#F7F7F7";
		var table3 = document.getElementById("yd");
		table3.style.display = "none";
		document.getElementById("byd").style.background = "none";
		var elem = document.createElement("table");
		document.ElementById("ss").parentNode.appendChild(elem);
		
	}
	function fyd() {
		var table1 = document.getElementById("lx");
		table1.style.display = "none";
		document.getElementById("blx").style.background = "none";
		var table2 = document.getElementById("ss");
		table2.style.display = "none";
		document.getElementById("bss").style.background = "none";
		var table3 = document.getElementById("yd");
		table3.style.display = "block";
		document.getElementById("byd").style.background = "#F7F7F7";
		var elem = document.createElement("table");
		document.ElementById("yd").parentNode.appendChild(elem);
	}
	function frlx() {
		var table1 = document.getElementById("rlx");
		table1.style.display = "block";
		document.getElementById("plx").style.background = "#F7F7F7";
		var table2 = document.getElementById("rss");
		table2.style.display = "none";
		document.getElementById("pss").style.background = "none";
		var table3 = document.getElementById("ryd");
		table3.style.display = "none";
		document.getElementById("pyd").style.background = "none";
		var elem = document.createElement("table");
		document.ElementById("rlx").parentNode.appendChild(elem);
	}
	function frss() {
		var table1 = document.getElementById("rlx");
		table1.style.display = "none";
		document.getElementById("plx").style.background = "none";
		var table2 = document.getElementById("rss");
		table2.style.display = "block";
		document.getElementById("pss").style.background = "#F7F7F7";
		var table3 = document.getElementById("ryd");
		table3.style.display = "none";
		document.getElementById("pyd").style.background = "none";
		var elem = document.createElement("table");
		document.ElementById("rss").parentNode.appendChild(elem);
	}
	function fryd() {
		var table1 = document.getElementById("rlx");
		table1.style.display = "none";
		document.getElementById("plx").style.background = "none";
		var table2 = document.getElementById("rss");
		table2.style.display = "none";
		document.getElementById("pss").style.background = "none";
		var table3 = document.getElementById("ryd");
		table3.style.display = "block";
		document.getElementById("pyd").style.background = "#F7F7F7";
		var elem = document.createElement("table");
		document.ElementById("ryd").parentNode.appendChild(elem);
	}
	function sort() {
		if (window.name == "" || window.name == null) {
			window.name = "enter";
			window.location.href = 'Product?action=sortByDate';
		} else {
			window.name = "";
		}
	}
</script>
</head>
<body onload="sort();">
<%session.setAttribute("formerUrl","shoemall.jsp");%>
	<script language="JavaScript" src="lib/jquery.bxslider.js"></script>
	<div id="wrapper">
		<div id="header">
			<div id="shoucang">
				<div id="shoujd">收藏ShoeMall</div>
				<div id="denglu">
					<c:if test="${ISLOGIN!='1'}">
					您好，欢迎来到ShoeMall！
					[<a href="customerLogin.html">登录</a>]|[<a href="register.html">免费注册</a>]
						</c:if>
					<c:if test="${ISLOGIN=='1'}">
							欢迎您！${LoginName}|[<a
							href="Order?action=searchName&name=${LoginName}">我的订单</a>]
							|[<a href="Customer?action=exit">退出登录</a>]
						</c:if>
					|[ <a>网站导航</a>]| [<a href="login.html">后台管理</a>]
				</div>
			</div>
			<div id="search">
				<div id="logo">
					<img src="img/shoemall.jpg" width="270px" height="60px">
				</div>
				<div id="searchform">
					<form action="Product?action=searchName" method="post">
						<input type="text" class="text" name="productName"><input
							type="submit" value="搜索" class="button">
						<div id="advancesearch">
							<a>高级搜索</a>
						</div>
					</form>
					<div id="hotwords">
						热门搜索：<a href="Product?action=searchStyle&style=雪地靴">雪地靴</a>、<a
							href="Product?action=searchStyle&style=马丁靴">马丁靴</a>、<a
							href="Product?action=searchStyle&style=单鞋">单鞋</a>
					</div>
				</div>
				<div id="account">
					<div id="myjd">
						<a href="Sales?action=sales&customerName=${LoginName}">我的
							ShoeMall</a>
					</div>
					<div id="settleup">
						<a href="Cart?action=searchName&customerName=${LoginName}">去购物车结算</a>
					</div>
				</div>
			</div>
		</div>
		<div id="navbar">
			<div id="totalnavbar">
				<div id="totalproducts">
					<h2>全部商品分类</h2>
				</div>
				<div>
					<h2>
						<a href="shoemall.jsp">首页</a>
					</h2>
				</div>
				<div>
					<h2>
						<a href="Product?action=searchGender&gender=女">女馆</a>
					</h2>
				</div>
				<div>
					<h2>
						<a href="Product?action=searchGender&gender=男">男馆</a>
					</h2>
				</div>
				<div>
					<h2>
						<a href="Product?action=searchStyle&style=运动">运动馆</a>
					</h2>
				</div>
				<div>
					<h2>
						<a>闪购</a>
					</h2>
				</div>
			</div>
		</div>
		<div id="content">
			<div id="center">
				<div id="left">
					<div id="sortlist">
						<div class="menu">
							<div>
								<h3>
									<a>精品女鞋</a>
								</h3>
								<div>
									<a href="Product?action=styleAndGender&gender=女&style=短靴">短靴</a>
									<a href="Product?action=styleAndGender&gender=女&style=长筒靴">长筒靴</a>
									<a href="Product?action=styleAndGender&gender=女&style=中筒靴">中筒靴</a>
									<a href="Product?action=styleAndGender&gender=女&style=雪地靴">雪地靴</a>
									<a href="Product?action=styleAndGender&gender=女&style=马丁靴">马丁靴</a>
									<a href="Product?action=styleAndGender&gender=女&style=单鞋">单鞋</a>
									<a href="Product?action=styleAndGender&gender=女&style=流苏靴">流苏靴</a>
									<a href="Product?action=styleAndGender&gender=女&style=皮鞋">皮鞋</a>
									<a href="Product?action=styleAndGender&gender=女&style=豆豆鞋">豆豆鞋</a>
									<a href="Product?action=styleAndGender&gender=女&style=凉鞋">凉鞋</a>
								</div>
							</div>
							<div>
								<h3>
									<a>流行男鞋</a>
								</h3>
								<div>
									<a href="Product?action=styleAndGender&gender=男&style=靴子">靴子</a>
									<a href="Product?action=styleAndGender&gender=男&style=皮鞋">皮鞋</a>
									<a href="Product?action=styleAndGender&gender=男&style=豆豆鞋">豆豆鞋</a>
									<a href="Product?action=styleAndGender&gender=男&style=单鞋">单鞋</a>
									<a href="Product?action=styleAndGender&gender=男&style=凉鞋">凉鞋</a>
								</div>
							</div>
							<div>
								<h3>
									<a>名品馆</a>
								</h3>
								<div>
									<a href="Product?action=searchBrand&brand=UGG">UGG</a> <a
										href="Product?action=searchBrand&brand=天美意">Teenmix</a> <a
										href="Product?action=searchBrand&brand=百丽">百丽</a> <a
										href="Product?action=searchBrand&brand=crocs">crocs</a> <a
										href="Product?action=searchBrand&brand=星期六">星期六</a> <a
										href="Product?action=searchBrand&brand=热风">热风</a> <a
										href="Product?action=searchBrand&brand=骆驼">骆驼</a> <a
										href="Product?action=searchBrand&brand=卓诗尼">卓诗尼</a> <a
										href="Product?action=searchBrand&brand=百思图">百思图</a> <a
										href="Product?action=searchBrand&brand=耐克">耐克</a> <a
										href="Product?action=searchBrand&brand=adidas">阿迪达斯</a> <a
										href="Product?action=searchBrand&brand=NewBalance">新百伦NB</a>
								</div>
							</div>
						</div>
					</div>
					<div>
						<img src="img/index_right.jpg" width="197px" height="50px">
					</div>
				</div>
				<script type="text/javascript">
					$(document).ready(function() {

						$('.bxslider').bxSlider({
							auto : true,
							autoControls : true
						});
					});
				</script>
				<div class="slider">
					<ul class="bxslider">
						<li><img src="img/shou1.jpg" width="590px" height="250px" /></li>
						<li><img src="img/shou2.jpg" width="596px" height="250px" /></li>
						<li><img src="img/shou3.jpg" width="590px" height="250px" /></li>
						<li><img src="img/shou4.jpg" width="590px" height="250px" /></li>
						<li><img src="img/shou5.jpg" width="590px" height="250px" /></li>
					</ul>
				</div>
				<div class="item">
					<h2>热门分类</h2>
				</div>
				<table class="tuijian" cellspacing="0" cellpadding="0" width="360px">
					<tbody>
						<tr>
							<td><a href="Product?action=searchStyle&style=马丁靴"><img
									src="img/divid (1).jpg" width="200px"></a></td>
							<td><a href="Product?action=searchStyle&style=平底鞋"><img
									src="img/divid (2).jpg" width="200px"></a></td>
							<td><a href="Product?action=searchStyle&style=短靴"><img
									src="img/divid (3).jpg" width="200px"></a></td>
							<td><a href="Product?action=searchStyle&style=粗跟鞋"><img
									src="img/divid (7).jpg" width="200px"></a></td>
						</tr>
						<tr>
							<td><a href="Product?action=searchStyle&style=高跟鞋"><img
									src="img/divid (4).jpg" width="200px"></a></td>
							<td><a href="Product?action=searchStyle&style=粗跟靴"><img
									src="img/divid (5).jpg" width="200px"></a></td>
							<td><a href="Product?action=searchStyle&style=豆豆鞋"><img
									src="img/divid (6).jpg" width="200px"></a></td>
							<td><a href="Product?action=searchStyle&style=单鞋"><img
									src="img/divid (8).jpg" width="200px"></a></td>
						</tr>
					</tbody>
				</table>
				<div class="item">
					<h2>热门品牌</h2>
				</div>
				<table class="tuijian" cellspacing="0" cellpadding="0">
					<tbody>
						<tr>
							<td><a href="Product?action=searchBrand&brand=ecco"><img
									src="img/brand (1).jpg" width="112px"></a></td>
							<td><a href="Product?action=searchBrand&brand=骆驼"><img
									src="img/brand (2).jpg" width="112px"></a></td>
							<td><a href="Product?action=searchBrand&brand=木林森"><img
									src="img/brand (3).jpg" width="112px"></a></td>
							<td><a href="Product?action=searchBrand&brand=naturalizer"><img
									src="img/brand (7).jpg" width="112px"></a></td>
							<td><a href="Product?action=searchBrand&brand=seteveMadden"><img
									src="img/brand (4).jpg" width="112px"></a></td>
							<td><a href="Product?action=searchBrand&brand=yellowEarth"><img
									src="img/brand (5).jpg" width="112px"></a></td>
							<td><a href="Product?action=searchBrand&brand=nineWest"><img
									src="img/brand (6).jpg" width="112px"></a></td>
						</tr>
					</tbody>
				</table>
			</div>
			<div id="right">
				<div>
					<h3>ShoeMall资讯</h3>
					•精品凉鞋，满150减50<br /> •精品拖鞋满150立减50！<br /> •精品女单鞋199-100！<br />
					•精品皮鞋满199-100<br />
				</div>
				<div>
					<h3>品牌推荐</h3>
					<span class="tupian" width="75px"><img
						src="img/brandRecommend.gif" width="74px"></span> <span class="jieshao"
						width="80px" style="font-size:1.1em;font-weight:bold;"> <br /><br />crocs<br /> 卡骆驰<br /><br /></span>
					<span>crocs（卡骆驰）是一家总部位于美国科罗拉多州的鞋履设计、生产及零售商，
					以crocs品牌于市场上推出男装、女装及童装的舒适鞋款。
					创立于2002年，crocs鞋子最初的产品市场定位是帆船运动和户外运动者，
					后来因为它穿着舒适而受到不同消费者的青睐。</span>
				</div>
				<div class="bangdan">
					<h3>热门推荐</h3>
					<c:forEach var="item" items="${SortByDate}" varStatus="len"
						begin="0" end="1">
						<table>
							<tr>
							<td><a href="Product?action=sell&productId=${item.productId}"><img style="width:50px;height:50px;" src="img/${item.showPicture}"/></a></td>
							</tr>
							<tr>
								<td><a href="Product?action=sell&productId=${item.productId}">${item.productName}</a></td>
							</tr>
							<tr>
								<td>销售价：${item.discount}</td>
							</tr>
							<tr>
								<td>销量：${item.sales}</td>
							</tr>
						</table>
					</c:forEach>
				</div>
			</div>
			<div>
				<img src="img/index_top.jpg" width="990px" style="margin-top: 8px;">
			</div>
			<div class="item1">
				<h2>最新商品</h2>
				<div id="bss" onmouseover="fss()" style="background: none;">
					<a>女鞋</a>
				</div>
				<div id="blx" onmouseover="flx()" style="background: none;">
					<a>流行男鞋</a>
				</div>
				<div id="byd" onmouseover="fyd()" style="background: none;">
					<a>舒适运动</a>
				</div>
			</div>
			<table id="ss" class="tuijian" cellspacing="0" cellpadding="0"
				width="980px" style="display: block;">
				<tbody>
						<tr>
							<td><a
								href="Product?action=sell&productId=${ProductsNewG.get(0).productId}"><img
									src="img/${ProductsNewG.get(0).showPicture}"></img></a></td>
							<td><a
								href="Product?action=sell&productId=${ProductsNewG.get(1).productId}"><img
									src="img/${ProductsNewG.get(1).showPicture}"></img></a></td>
							<td><a
								href="Product?action=sell&productId=${ProductsNewG.get(2).productId}"><img
									src="img/${ProductsNewG.get(2).showPicture}"></img></a></td>
							<td><a
								href="Product?action=sell&productId=${ProductsNewG.get(3).productId}"><img
									src="img/${ProductsNewG.get(3).showPicture}"></img></a></td>
							<td><a
								href="Product?action=sell&productId=${ProductsNewG.get(4).productId}"><img
									src="img/${ProductsNewG.get(4).showPicture}"></img></a></td>
							<td><a
								href="Product?action=sell&productId=${ProductsNewG.get(5).productId}"><img
									src="img/${ProductsNewG.get(5).showPicture}"></img></a></td>
						</tr>
						<tr>
							<td>${ProductsNewG.get(0).originalPrice}</td>
							<td>${ProductsNewG.get(1).originalPrice}</td>
							<td>${ProductsNewG.get(2).originalPrice}</td>
							<td>${ProductsNewG.get(3).originalPrice}</td>
							<td>${ProductsNewG.get(4).originalPrice}</td>
							<td>${ProductsNewG.get(5).originalPrice}</td>
						</tr>
						<tr>
							<td>${ProductsNewG.get(0).discount}</td>
							<td>${ProductsNewG.get(1).discount}</td>
							<td>${ProductsNewG.get(2).discount}</td>
							<td>${ProductsNewG.get(3).discount}</td>
							<td>${ProductsNewG.get(4).discount}</td>
							<td>${ProductsNewG.get(5).discount}</td>
						</tr>
				</tbody>
			</table>
			<table id="lx" class="tuijian" cellspacing="0" cellpadding="0"
				width="980px" style="display: none;">
				<tbody>
						<tr>
							<td><a
								href="Product?action=sell&productId=${ProductsNewN.get(0).productId}"><img
									src="img/${ProductsNewN.get(0).showPicture}"></img></a></td>
							<td><a
								href="Product?action=sell&productId=${ProductsNewN.get(1).productId}"><img
									src="img/${ProductsNewN.get(1).showPicture}"></img></a></td>
							<td><a
								href="Product?action=sell&productId=${ProductsNewN.get(2).productId}"><img
									src="img/${ProductsNewN.get(2).showPicture}"></img></a></td>
							<td><a
								href="Product?action=sell&productId=${ProductsNewN.get(3).productId}"><img
									src="img/${ProductsNewN.get(3).showPicture}"></img></a></td>
							<td><a
								href="Product?action=sell&productId=${ProductsNewN.get(4).productId}"><img
									src="img/${ProductsNewN.get(4).showPicture}"></img></a></td>
							<td><a
								href="Product?action=sell&productId=${ProductsNewN.get(5).productId}"><img
									src="img/${ProductsNewN.get(5).showPicture}"></img></a></td>
						</tr>
						<tr>
							<td>${ProductsNewN.get(0).originalPrice}</td>
							<td>${ProductsNewN.get(1).originalPrice}</td>
							<td>${ProductsNewN.get(2).originalPrice}</td>
							<td>${ProductsNewN.get(3).originalPrice}</td>
							<td>${ProductsNewN.get(4).originalPrice}</td>
							<td>${ProductsNewN.get(5).originalPrice}</td>
						</tr>
						<tr>
							<td>${ProductsNewN.get(0).discount}</td>
							<td>${ProductsNewN.get(1).discount}</td>
							<td>${ProductsNewN.get(2).discount}</td>
							<td>${ProductsNewN.get(3).discount}</td>
							<td>${ProductsNewN.get(4).discount}</td>
							<td>${ProductsNewN.get(5).discount}</td>
						</tr>
				</tbody>
			</table>
			<table id="yd" class="tuijian" cellspacing="0" cellpadding="0"
				width="980px" style="display: none;">
				<tbody>
						<tr>
							<td><a
								href="Product?action=sell&productId=${ProductsNewS.get(0).productId}"><img
									src="img/${ProductsNewS.get(0).showPicture}"></img></a></td>
							<td><a
								href="Product?action=sell&productId=${ProductsNewS.get(1).productId}"><img
									src="img/${ProductsNewS.get(1).showPicture}"></img></a></td>
							<td><a
								href="Product?action=sell&productId=${ProductsNewS.get(2).productId}"><img
									src="img/${ProductsNewS.get(2).showPicture}"></img></a></td>
							<td><a
								href="Product?action=sell&productId=${ProductsNewS.get(3).productId}"><img
									src="img/${ProductsNewS.get(3).showPicture}"></img></a></td>
							<td><a
								href="Product?action=sell&productId=${ProductsNewS.get(4).productId}"><img
									src="img/${ProductsNewS.get(4).showPicture}"></img></a></td>
							<td><a
								href="Product?action=sell&productId=${ProductsNewS.get(5).productId}"><img
									src="img/${ProductsNewS.get(5).showPicture}"></img></a></td>
						</tr>
						<tr>
							<td>${ProductsNewS.get(0).originalPrice}</td>
							<td>${ProductsNewS.get(1).originalPrice}</td>
							<td>${ProductsNewS.get(2).originalPrice}</td>
							<td>${ProductsNewS.get(3).originalPrice}</td>
							<td>${ProductsNewS.get(4).originalPrice}</td>
							<td>${ProductsNewS.get(5).originalPrice}</td>
						</tr>
						<tr>
							<td>${ProductsNewS.get(0).discount}</td>
							<td>${ProductsNewS.get(1).discount}</td>
							<td>${ProductsNewS.get(2).discount}</td>
							<td>${ProductsNewS.get(3).discount}</td>
							<td>${ProductsNewS.get(4).discount}</td>
							<td>${ProductsNewS.get(5).discount}</td>
						</tr>
				</tbody>
			</table>				
			<div class="item1">
				<h2>热门商品</h2>
				<div id="pss" onmouseover="frss()" style="background: none;">
					<a>时尚女鞋</a>
				</div>
				<div id="plx" onmouseover="frlx()" style="background: none;">
					<a>流行男鞋</a>
				</div>
				<div id="pyd" onmouseover="fryd()" style="background: none;">
					<a>舒适运动</a>
				</div>
			</div>
			<table id="rss" class="tuijian" cellspacing="0" cellpadding="0"
				width="980px" style="display: block;">
				<tbody>
						<tr>
							<td><a
								href="Product?action=sell&productId=${ProductsG.get(0).productId}"><img
									src="img/${ProductsG.get(0).showPicture}"></img></a></td>
							<td><a
								href="Product?action=sell&productId=${ProductsG.get(1).productId}"><img
									src="img/${ProductsG.get(1).showPicture}"></img></a></td>
							<td><a
								href="Product?action=sell&productId=${ProductsG.get(2).productId}"><img
									src="img/${ProductsG.get(2).showPicture}"></img></a></td>
							<td><a
								href="Product?action=sell&productId=${ProductsG.get(3).productId}"><img
									src="img/${ProductsG.get(3).showPicture}"></img></a></td>
							<td><a
								href="Product?action=sell&productId=${ProductsG.get(4).productId}"><img
									src="img/${ProductsG.get(4).showPicture}"></img></a></td>
							<td><a
								href="Product?action=sell&productId=${ProductsG.get(5).productId}"><img
									src="img/${ProductsG.get(5).showPicture}"></img></a></td>
						</tr>
						<tr>
							<td>${ProductsG.get(0).originalPrice}</td>
							<td>${ProductsG.get(1).originalPrice}</td>
							<td>${ProductsG.get(2).originalPrice}</td>
							<td>${ProductsG.get(3).originalPrice}</td>
							<td>${ProductsG.get(4).originalPrice}</td>
							<td>${ProductsG.get(5).originalPrice}</td>
						</tr>
						<tr>
							<td>${ProductsG.get(0).discount}</td>
							<td>${ProductsG.get(1).discount}</td>
							<td>${ProductsG.get(2).discount}</td>
							<td>${ProductsG.get(3).discount}</td>
							<td>${ProductsG.get(4).discount}</td>
							<td>${ProductsG.get(5).discount}</td>
						</tr>
				</tbody>
			</table>
			<table id="rlx" class="tuijian" cellspacing="0" cellpadding="0"
				width="980px" style="display: none;">
				<tbody>
					<tbody>
						<tr>
							<td><a
								href="Product?action=sell&productId=${ProductsN.get(0).productId}"><img
									src="img/${ProductsN.get(0).showPicture}"></img></a></td>
							<td><a
								href="Product?action=sell&productId=${ProductsN.get(1).productId}"><img
									src="img/${ProductsN.get(1).showPicture}"></img></a></td>
							<td><a
								href="Product?action=sell&productId=${ProductsN.get(2).productId}"><img
									src="img/${ProductsN.get(2).showPicture}"></img></a></td>
							<td><a
								href="Product?action=sell&productId=${ProductsN.get(3).productId}"><img
									src="img/${ProductsN.get(3).showPicture}"></img></a></td>
							<td><a
								href="Product?action=sell&productId=${ProductsN.get(4).productId}"><img
									src="img/${ProductsN.get(4).showPicture}"></img></a></td>
							<td><a
								href="Product?action=sell&productId=${ProductsN.get(5).productId}"><img
									src="img/${ProductsN.get(5).showPicture}"></img></a></td>
						</tr>
						<tr>
							<td>${ProductsN.get(0).originalPrice}</td>
							<td>${ProductsN.get(1).originalPrice}</td>
							<td>${ProductsN.get(2).originalPrice}</td>
							<td>${ProductsN.get(3).originalPrice}</td>
							<td>${ProductsN.get(4).originalPrice}</td>
							<td>${ProductsN.get(5).originalPrice}</td>
						</tr>
						<tr>
							<td>${ProductsN.get(0).discount}</td>
							<td>${ProductsN.get(1).discount}</td>
							<td>${ProductsN.get(2).discount}</td>
							<td>${ProductsN.get(3).discount}</td>
							<td>${ProductsN.get(4).discount}</td>
							<td>${ProductsN.get(5).discount}</td>
						</tr>
				</tbody>
			</table>
			<table id="ryd" class="tuijian" cellspacing="0" cellpadding="0"
				width="980px" style="display: none;">
				<tbody>
					<tbody>
						<tr>
							<td><a
								href="Product?action=sell&productId=${ProductsS.get(0).productId}"><img
									src="img/${ProductsS.get(0).showPicture}"></img></a></td>
							<td><a
								href="Product?action=sell&productId=${ProductsS.get(1).productId}"><img
									src="img/${ProductsS.get(1).showPicture}"></img></a></td>
							<td><a
								href="Product?action=sell&productId=${ProductsS.get(2).productId}"><img
									src="img/${ProductsS.get(2).showPicture}"></img></a></td>
							<td><a
								href="Product?action=sell&productId=${ProductsS.get(3).productId}"><img
									src="img/${ProductsS.get(3).showPicture}"></img></a></td>
							<td><a
								href="Product?action=sell&productId=${ProductsS.get(4).productId}"><img
									src="img/${ProductsS.get(4).showPicture}"></img></a></td>
							<td><a
								href="Product?action=sell&productId=${ProductsS.get(5).productId}"><img
									src="img/${ProductsS.get(5).showPicture}"></img></a></td>
						</tr>
						<tr>
							<td>${ProductsS.get(0).originalPrice}</td>
							<td>${ProductsS.get(1).originalPrice}</td>
							<td>${ProductsS.get(2).originalPrice}</td>
							<td>${ProductsS.get(3).originalPrice}</td>
							<td>${ProductsS.get(4).originalPrice}</td>
							<td>${ProductsS.get(5).originalPrice}</td>
						</tr>
						<tr>
							<td>${ProductsS.get(0).discount}</td>
							<td>${ProductsS.get(1).discount}</td>
							<td>${ProductsS.get(2).discount}</td>
							<td>${ProductsS.get(3).discount}</td>
							<td>${ProductsS.get(4).discount}</td>
							<td>${ProductsS.get(5).discount}</td>
						</tr>
				</tbody>
			</table>
		</div>
		<div id="liulan">
			<div id="liulan1" width="400px">
				<h2>最近浏览</h2>
				<br />
				<h4>您还未在ShoeMall留下足迹</h4>
				在您的购物旅程中，您可以随时通过这里查看您之前的浏览记录，以便快捷返回您曾经感兴趣的页面。
			</div>
			<div id="liulan2" width="600px">
				<table class="tuijian" cellspacing="0" cellpadding="0" width="600px">
					<thead>
						<h2>根据浏览猜你喜欢</h2>
					</thead>
					<tbody>
						<tr>
							<td><a
								href="Product?action=sell&productId=${ProductsS.get(0).productId}"><img width="150px"
									src="img/${ProductsS.get(0).showPicture}"></img></a></td>
							<td><a
								href="Product?action=sell&productId=${ProductsN.get(4).productId}"><img width="150px"
									src="img/${ProductsN.get(4).showPicture}"></img></a></td>
							<td><a
								href="Product?action=sell&productId=${ProductsNewG.get(5).productId}"><img width="150px"
									src="img/${ProductsNewG.get(5).showPicture}"></img></a></td>
							<td><a
								href="Product?action=sell&productId=${ProductsNewS.get(3).productId}"><img width="150px"
									src="img/${ProductsNewS.get(3).showPicture}"></img></a></td>
						</tr>
						<tr>
							<td>${ProductsS.get(0).originalPrice}</td>
							<td>${ProductsN.get(4).originalPrice}</td>
							<td>${ProductsNewG.get(5).originalPrice}</td>
							<td>${ProductsNewS.get(3).originalPrice}</td>
						</tr>
						<tr>
							<td>${ProductsS.get(0).discount}</td>
							<td>${ProductsN.get(4).discount}</td>
							<td>${ProductsNewG.get(5).discount}</td>
							<td>${ProductsNewS.get(3).discount}</td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
		<div id="footer">
			<div id="helpfooter">
				<table cellspacing="0" cellpadding="0" width="989px">
					<thead>
						<tr>
							<th><a>购物指南</a></th>
							<th><a>配送方式</a></th>
							<th><a>支付方式</a></th>
							<th><a>售后服务</a></th>
							<th><a>特色服务</a></th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td><a>购物流程</a></td>
							<td><a>上门自提</a></td>
							<td><a>货到付款</a></td>
							<td><a>售后政策</a></td>
							<td><a>延保服务</a></td>
						</tr>
						<tr>
							<td><a>会员介绍</a></td>
							<td><a>211限时达</a></td>
							<td><a>在线支付</a></td>
							<td><a>价格保护</a></td>
							<td><a>ShoeMall卡</a></td>
						</tr>
						<tr>
							<td><a>团购机票</a></td>
							<td><a>配送服务查询</a></td>
							<td><a>分期付款</a></td>
							<td><a>退款说明</a></td>
							<td><a>节能补贴</a></td>
						</tr>
						<tr>
							<td><a>常见问题</a></td>
							<td><a>配送费收取标准</a></td>
							<td><a>邮局汇款</a></td>
							<td><a>返修/退换货</a></td>
							<td></td>
						</tr>
						<tr>
							<td><a>大家电</a></td>
							<td><a>海外配送</a></td>
							<td><a>公司转账</a></td>
							<td><a>取消订单</a></td>
							<td></td>
						</tr>
						<tr>
							<td><a>联系客服</a></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
						</tr>
					</tbody>
				</table>
			</div>
			<div id="webfooter">
				<div id="webfooter1">关于我们|联系我们|人才招聘|商家入驻|广告服务|友情链接|销售联盟</div>
				<div id="webfooter2">
					北京市公安局朝阳分局备案编号110105014669 | 京ICP证070359号 |
					互联网药品信息服务资格证编号(京)-非经营性-2011-0034<br /> 音像制品经营许可证苏宿批005号 |
					出版物经营许可证编号新出发(苏)批字第N-012号 | 互联网出版许可证编号新出网证(京)字150号<br />
					网络文化经营许可证京网文[2011]0168-061号 Copyright 2004-2014 ShoeMall.com 版权所有<br />
					Showmall旗下网站：360TOP 迷你挑 English Site
				</div>
				<img src="img/108_40_zZOKnl.gif" id="picture1"> <img
					src="img/112_40_WvArIl.png"> <img src="img/plice.png">
				<img src="img/112_40_WvArIl.png">
			</div>
		</div>
	</div>
</body>
</html>
