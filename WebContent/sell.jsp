<?xml version="1.0" encoding="UTF-8" ?>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="JavaBean.Product;" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>ShoeMall搜索</title>
<link rel="stylesheet" href="css/sell.css" type="text/css" />
<link rel="stylesheet" href="lib/jquery.bxslider.css" type="text/css" />
<link rel="stylesheet" href="css/pure-min.css" type="text/css" />

<script src="js/jquery.min.js"></script>
<script src="lib/jquery.bxslider.js"></script>
<script src="js/rainbow.min.js"></script>
<script src="js/scripts.js"></script>
<script>
	var shoeSize=0;
	function size(s) {
		shoeSize=s;
		var span1 = document.getElementById("size" + s);
		span1.style.border = "2px solid red";
		var i=35;
		for(;i<s;i++){
			var span2 = document.getElementById("size" + i);
			span2.style.border = "1px solid grey";
		}
		i++;
		for(;i>s&&i<=42;i++){
			var span2 = document.getElementById("size" + i);
			span2.style.border = "1px solid grey";
		}
	}
	function plus() {
		var i = parseInt(document.getElementById("productCount").value);
		i=i+1;
		document.getElementById("productCount").value = i;
	}
	
	function minus() {
		var i = parseInt(document.getElementById("productCount").value);
		if (i > 1)
			i=i-1;
		else
			i = 1;
		document.getElementById("productCount").value = i;
	}
	function addCart(){ 
	 	var isLogin="<%=session.getAttribute("ISLOGIN")%>"; 
		var LoginName="<%=session.getAttribute("LoginName")%>";
		var productId=document.cartList.productId.value;
		var productName=document.cartList.productName.value;
		if(shoeSize==0)
			{
			alert("Please choose the shoe's size first!");
			return;
			}
		var brand=document.cartList.brand.value;
		var price=document.cartList.price.value;
		var count=document.cartList.count.value;
		var picture=document.cartList.showp.value;
		if (isLogin == "1") {
			window.self.location="Cart?action=add&loginName="+LoginName+"&productId="+productId+"&productName="+productName+"&brand="+brand+"&price="+price+"&size="+shoeSize+"&count="+count+"&showPicture="+picture;
		} else {
			alert("请先登录！");
			window.location.href="customerLogin.html";
		}
	}
	function buy(){ 
	 	var isLogin="<%=session.getAttribute("ISLOGIN")%>"; 
		var LoginName="<%=session.getAttribute("LoginName")%>";
		var productId=document.cartList.productId.value;
		var productName=document.cartList.productName.value;
		if(shoeSize==0)
		{
		alert("Please choose the shoe's size first!");
		return;
		}
		var brand=document.cartList.brand.value;
		var price=document.cartList.price.value;
		var count=document.cartList.count.value;
		var picture=document.cartList.showp.value;
		if (isLogin == "1") {
			location.href="Order?action=sureOrder&loginName="+LoginName+"&productId="+productId+"&productName="+productName+"&brand="+brand+"&price="+price+"&size="+shoeSize+"&count="+count+"&showPicture="+picture;
		} else {
			alert("请先登录！");
			location.href="customerLogin.html";
		}
	}
	function show(a){
		if(a==1||a==2||a==3||a==4)
		document.getElementById("showp").src="img/sellx"+a+".jpg";
	}
</script>

</head>
<body>
	<%
	String id=request.getAttribute("ProductId").toString();
	session.setAttribute("formerUrl","Product?action=sell&productId="+id);
	%>
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
			<div style="width: 980px; float: left; clear: both;">
				<div id="picture">
					<div>
						<img id="showp"wight="450px" height="280px" src="img/${Product.showPicture}">
					</div>
					<div style="wight: 450px; height: 100px;">
						<table>
							<tr>
								<td><img src="img/sellx1.jpg" width="80px" height="60px" onclick="show(1);"></td>
								<td><img src="img/sellx2.jpg" width="80px" height="60px" onclick="show(2);"></td>
								<td><img src="img/sellx3.jpg" width="80px" height="60px" onclick="show(3);"></td>
								<td><img src="img/sellx4.jpg" width="80px" height="60px" onclick="show(4);"></td>
							</tr>
						</table>
					</div>
				</div>
				<div id="imfor">
					<form name="cartList" method="post" action="Order?action=sell" height="100%">
					<input type="hidden"name="showp" value="${Product.showPicture}"/>
						<div style="font-size: 1.5em; font-weight: bold;" height="20%">
							<input name="productName" type="hidden"
								value="${Product.productName}" />${Product.productName}</div>
						<div height="40%"
							style="background: #f2f7ff; width: 310px; margin-left: 10px; padding-top: 5px;">
							<div>
								促销价：<span
									style="font-size: 1.4em; color: red; font-weight: bold;"><input
									name="price" type="hidden" value="${Product.discount}" />${Product.discount}</span>
							</div>
							<div style="padding-bottom: 20px;">
								价格：<span style="text-decoration: line-through;">${Product.originalPrice}</span>
							</div>
						</div>
						<div height="10%" style="float: left;">鞋码：</div>
						<div height="10%" style="float: left; margin-bottom: 10px;">
							<c:if test="${Product.size35>0}">
								<span id="size35"
									style="display: block; width: 15px; height: 15px; border: 1px solid grey; float: left; margin: 5px;"
									onclick="size(35);">35</span>
							</c:if>
							<c:if test="${Product.size36>0}">
								<span id="size36"
									style="display: block; width: 15px; height: 15px; border: 1px solid grey; float: left; margin: 5px;"
									onclick="size(36);">36</span>
							</c:if>
							<c:if test="${Product.size37>0}">
								<span id="size37"
									style="display: block; width: 15px; height: 15px; border: 1px solid grey; float: left; margin: 5px;"
									onclick="size(37);">37</span>
							</c:if>
							<c:if test="${Product.size38>0}">
								<span id="size38"
									style="display: block; width: 15px; height: 15px; border: 1px solid grey; float: left; margin: 5px;"
									onclick="size(38);">38</span>
							</c:if>
							<c:if test="${Product.size39>0}">
								<span id="size39"
									style="display: block; width: 15px; height: 15px; border: 1px solid grey; float: left; margin: 5px;"
									onclick="size(39);">39</span>
							</c:if>
							<c:if test="${Product.size40>0}">
								<span id="size40"
									style="display: block; width: 15px; height: 15px; border: 1px solid grey; float: left; margin: 5px;"
									onclick="size(40);">40</span>
							</c:if>
							<c:if test="${Product.size41>0}">
								<span id="size41"
									style="display: block; width: 15px; height: 15px; border: 1px solid grey; float: left; margin: 5px;"
									onclick="size(41);">41</span>
							</c:if>
							<c:if test="${Product.size42>0}">
								<span id="size42"
									style="display: block; width: 15px; height: 15px; border: 1px solid grey; float: left; margin: 5px;"
									onclick="size(42);">42</span>
							</c:if>
						</div>
						<div height="10%" style="clear: both;">
							数量：<input style="width: 20px;" type="button" value="-"
								onclick="minus();" /> <input id="productCount" name="count"
								style="width: 20px;" type="text" value="1" /> <input
								style="width: 20px;" type="button" value="+" onclick="plus();" />总库存
							<span id="stock">${Product.stock}</span>件
						</div>
						<div height="20%">
								<input name="productId" type="hidden"
								value="${Product.productId}" /> <input name="brand"
								type="hidden" value="${Product.brand}" /> <input type="button"
								value="加入购物车" class="pure-button pure-button-primary"
								onclick="addCart();"></input> <input type="button"
								value="立即 购买" onclick="buy();" class="pure-button pure-button-primary"></input>
						</div>
					</form>
				</div>
			</div>
			<div id="detail">
				<div class="bangdan">
					<table>
						<tr>
							<td><h3>
									<a>精品女鞋</a>
								</h3></td>
							<td></td>
							<td></td>
						</tr>
						<tr>
							<td><a
								href="Product?action=styleAndGender&gender=女&style=长筒靴">长筒靴</a></td>
							<td><a
								href="Product?action=styleAndGender&gender=女&style=中筒靴">中筒靴</a></td>
							<td><a
								href="Product?action=styleAndGender&gender=女&style=雪地靴">雪地靴</a></td>
						</tr>
						<tr>
							<td><a
								href="Product?action=styleAndGender&gender=女&style=马丁靴">马丁靴</a></td>
							<td><a
								href="Product?action=styleAndGender&gender=女&style=单鞋">单鞋</a></td>
							<td><a
								href="Product?action=styleAndGender&gender=女&style=流苏靴">流苏靴</a></td>
						</tr>
						<tr>
							<td><a
								href="Product?action=styleAndGender&gender=女&style=皮鞋">皮鞋</a></td>
							<td><a
								href="Product?action=styleAndGender&gender=女&style=豆豆鞋">豆豆鞋</a></td>
							<td><a
								href="Product?action=styleAndGender&gender=女&style=凉鞋">凉鞋</a></td>
						</tr>
						<tr>
							<td><a
								href="Product?action=styleAndGender&gender=女&style=短靴">短靴</a></td>
							<td></td>
							<td></td>
						</tr>
						<tr>
							<td><h3>
									<a>流行男鞋</a>
								</h3></td>
							<td></td>
							<td></td>
						</tr>
						<tr>
							<td><a
								href="Product?action=styleAndGender&gender=男&style=靴子">靴子</a></td>
							<td><a
								href="Product?action=styleAndGender&gender=男&style=皮鞋">皮鞋</a></td>
							<td><a
								href="Product?action=styleAndGender&gender=男&style=豆豆鞋">豆豆鞋</a></td>
						</tr>
						<tr>
							<td><a
								href="Product?action=styleAndGender&gender=男&style=单鞋">单鞋</a></td>
							<td><a
								href="Product?action=styleAndGender&gender=男&style=凉鞋">凉鞋</a></td>
							<td></td>
						</tr>
						<tr>
							<td><h3>名品馆</h3></td>
							<td></td>
							<td></td>
						</tr>
						<tr>
							<td><a href="Product?action=searchBrand&brand=UGG">UGG</a></td>
							<td><a href="Product?action=searchBrand&brand=天美意">Teenmix</a></td>
							<td><a href="Product?action=searchBrand&brand=百丽">百丽</a></td>
						</tr>
						<tr>
							<td><a href="Product?action=searchBrand&brand=crocs">crocs</a></td>
							<td><a href="Product?action=searchBrand&brand=星期六">星期六</a></td>
							<td><a href="Product?action=searchBrand&brand=热风">热风</a></td>
						</tr>
						<tr>
							<td><a href="Product?action=searchBrand&brand=骆驼">骆驼</a></td>
							<td><a href="Product?action=searchBrand&brand=卓诗尼">卓诗尼</a></td>
							<td><a href="Product?action=searchBrand&brand=百思图">百思图</a></td>
						</tr>
						<tr>
							<td><a href="Product?action=searchBrand&brand=耐克">耐克</a></td>
							<td><a href="Product?action=searchBrand&brand=adidas">阿迪达斯</a></td>
							<td><a href="Product?action=searchBrand&brand=NewBalance">新百伦NB</a></td>
						</tr>
					</table>
					<h3>新款热销榜</h3>
					<c:forEach var="item" items="${SortByDate}"
						varStatus="len" begin="0" end="9">
						<table>
							<tr>
							<td><span>${len.count}</span><a href="Product?action=sell&productId=${item.productId}"><img style="width:50px;height:50px;" src="img/${item.showPicture}"/></a></td>
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
				<div class="zhanshi">
					<div style="background: #f2f7ff; width: 710px; margin-bottom: 5px;">
						产品参数：
						<table>
							<tr>
								<td>品牌：${Product.brand}</td>
								<td>货号：${Product.productId}</td>
								<td>款式：${Product.style}</td>
								<td>适应季节：${Product.season}</td>
								<td>性别：${Product.gender}</td>
							</tr>
						</table>
					</div>
					<div>
						<img src="img/sell1.jpg" width="710px" height="450px"><img
							src="img/sell2.jpg" width="710px" height="980px"><img
							src="img/sell3.jpg" width="710px" height="900px"><img
							src="img/sell4.jpg" width="710px" height="900px">
					</div>
				</div>
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
				<img src="img/108_40_zZOKnl.gif" id="picture1"><img
					src="img/112_40_WvArIl.png"><img src="img/plice.png"><img
					src="img/112_40_WvArIl.png">
			</div>
		</div>
	</div>
</body>
</html>
