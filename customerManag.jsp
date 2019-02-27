<?xml version="1.0" encoding="UTF-8" ?>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>ShoeMall搜索</title>
<link rel="stylesheet" href="css/search.css" type="text/css" />
<link rel="stylesheet" href="lib/jquery.bxslider.css" type="text/css" />

<script src="js/jquery.min.js"></script>
<script src="lib/jquery.bxslider.js"></script>
<script src="js/rainbow.min.js"></script>
<script src="js/scripts.js"></script>
<script>
	function sort() {
		document.onload("Product?action=sortByDate&sortNo=5");
	}
</script>
</head>
<body onload="sort()">
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
			<c:if test="${ISLOGIN=='1'}">
				<div id="dingdan">
					<table class="pure-table pure-table-horizontal"
						style="text-align: center; background: #f2f7ff; width: 900px; margin-left: 50px; margin-bottom:30px;">
						<thead  style="background:#e8e8e8;font-size:1.2em;font-weight:bold;">
							<tr>
								<th>订单编号</th>
								<th>订单金额</th>
								<th>收货人</th>
								<th>支付方式</th>
								<th>支付状态</th>
								<th>配送状态</th>
								<th>下单日期</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="item" items="${requestScope.Orders}">
								<tr>
									<td>${item.orderNumber}</td>
									<td>${item.orderMoney}</td>
									<td>${item.consignee}</td>
									<td>${item.paymentWay}</td>
									<td>${item.paymentStatus}</td>
									<td>${item.deliveryState}</td>
									<td>${item.date}</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</c:if>
			<c:if test="${ISLOGIN!='1'}">
				<div
					style="margin-top: 30px; margin-left: 300px; margin-bottom: 40px; font-size: 2em; color: red; font-weight: bold;">
					<img width="120px" height="120px" src="img/warning.jpg">&nbsp;&nbsp;请先登陆再查看订单！
					
				</div>
			</c:if>
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
