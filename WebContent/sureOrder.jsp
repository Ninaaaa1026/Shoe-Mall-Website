<?xml version="1.0" encoding="UTF-8" ?>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>确认订单</title>
<link rel="stylesheet" href="css/search.css" type="text/css" />
<link rel="stylesheet" href="lib/jquery.bxslider.css" type="text/css" />
<link rel="stylesheet" href="css/pure-min.css" type="text/css" />
<link rel="stylesheet" href="css/button_style.css" type="text/css" />

<script src="js/jquery.min.js"></script>
<script src="lib/jquery.bxslider.js"></script>
<script src="js/rainbow.min.js"></script>
<script src="js/scripts.js"></script>
<script>
	function sureOrder() {
		var consignee = document.orderForm.consignee.value;
		var p = document.orderForm.addressP.value;
		var c = document.orderForm.addressC.value;
		var t = document.orderForm.addressT.value;
		var d = document.orderForm.addressD.value
		var address = p + c + t + d;
		var telephone = document.orderForm.telephone.value;
		if (consignee == "" || consignee == null) {
			alert("Please input the consignee!");
			return;
		} else if (p == "" || p == null) {
			alert("Please input the province!");
			return;
		} else if (c == "" || p == null) {
			alert("Please input the city name!");
			return;
		} else if (t == "" || p == null) {
			alert("Please input the district!");
			return;
		} else if (d == "" || p == null) {
			alert("Please input the detailed address!");
			return;
		} else if (telephone == "" || telephone == null) {
			alert("Please input the telephone!");
			return;
		}
		var orderNumber = document.orderForm.orderNumber.value;
		var orderStatus = document.orderForm.orderStatus.value;
		var deliveryState = document.orderForm.deliveryState.value;
		var orderMoney = document.orderForm.orderMoney.value;
		var productWeight = document.orderForm.productWeight.value;
		var freight = document.orderForm.freight.value;
		var paymentWay = document.orderForm.paymentWay.value;
		var date = document.orderForm.date.value;
		var paymentStatus = document.orderForm.paymentStatus.value;
		var customerName = document.orderForm.customerName.value;
		var paidAmount = document.orderForm.paidAmount.value;
		var memo = document.orderForm.memo.value;
		location.href = "Order?action=add&consignee=" + consignee
				+ "&orderNumber=" + orderNumber + "&orderStatus=" + orderStatus
				+ "&deliveryState=" + deliveryState + "&orderMoney="
				+ orderMoney + "&productWeight=" + productWeight + "&freight="
				+ freight + "&paymentWay=" + paymentWay + "&date=" + date
				+ "&paymentStatus=" + paymentStatus + "&customerName="
				+ customerName + "&paidAmount=" + paidAmount + "&memo=" + memo
				+ "&address=" + address + "&telephone=" + telephone;
	}
</script>
</head>
<body>
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
			<div class="shop_map"
				style="margin-left: 350px; font-size: 1.5em; font-weight: bold;">
				<span class="white">查看购物车</span>&nbsp;&nbsp; <span
					class="sure_order" style="background-color: #F60; color: white;">确认订单信息</span>
				&nbsp;&nbsp;<span class="succes_order">成功提交订单</span>
			</div>
			<div
				style="padding: 10px; margin-left: 100px; width: 790px; margin-bottom: 20px; margin-top: 20px; border: 2px solid #f2f7ff;">
				<form name="orderForm" action="Order?action=add" method="post">
					<div>
						<strong>订单信息</strong>
					</div>
					<div>
						<dl>
							<dt>收货人信息</dt>
							<dd>
								<ul>
									<li>收&nbsp;货&nbsp;人：&nbsp;<input type="text"
										name="consignee"></input></li>
									<br />
									<li>地&nbsp;&nbsp;&nbsp;&nbsp;址：&nbsp;&nbsp;&nbsp; <input
										style="width: 50px;" type="text" id="addressP" name="addressP">省</input>
										<input style="width: 50px;" type="text" id="addressC"
										name="addressC">市</input> <input style="width: 50px;"
										type="text" id="addressT" name="addressT">县/区</input> <input
										style="width: 250px;" type="text" id="addressD"
										name="addressD"></input></li>
									<br />
									<input type="hidden" id="address" name="address" value=""></input>
									<li>手机号码：<input type="text" MaxLength="11"
										name="telephone"></input></li>
								</ul>
							</dd>
						</dl>
						<dl>
							<dt>支付及配送方式</dt>
							<dd>
								<ul>
									<li>支付方式： <select name="paymentWay">
											<option value="在线支付">在线支付</option>
											<option value="货到付款">货到付款</option>
									</select>
									</li>
									<br />
									<li>配送方式： 快递运送 ，运费20元</li>
									<br />
									<li><input type="hidden" id="date" name="date" /> <input
										type="hidden" name="orderNumber" id="orderNumber" /> <script>
											var myDate = new Date();
											var month = parseInt(myDate
													.getMonth().toString()) + 1;
											var getDate = parseInt(myDate
													.getDate().toString());
											var date = myDate.getFullYear()
													.toString()
													+ "/"
													+ month
													+ "/"
													+ getDate;
											var id =
										<%=session.getAttribute("LoginId")%>
											var orderNumber = myDate.getTime()
													.toString()
													+ id;
											document.getElementById("date").value = date;
											document
													.getElementById("orderNumber").value = orderNumber;
										</script>配送时间：<script>
											document.write(date);
										</script></li>
								</ul>
							</dd>
						</dl>
						<span class="i-mt">商品清单</span>
						<div class="p-list" width="700px"
							style="padding: 10px; background: #f2f7ff; margin-top: 20px;">
							<table cellpadding="0" cellspacing="0" width="100%">
								<tbody style="text-align: center;">
									<tr>
										<th width="11%">商品编号</th>
										<th width="46%">商品名称</th>
										<th width="10%">商品价格</th>
										<th width="12%">商品数量</th>
										<th width="11%">鞋码</th>
									</tr>
									<c:forEach var="item" items="${requestScope.Carts}">
										<tr>
											<td><a
												href="Product?action=sell&productId=${item.productId}">${item.productId }</a></td>
											<td><a
												href="Product?action=sell&productId=${item.productId}">${item.productName }</a></td>
											<td><span class="ftx04"><input id="price"
													type="hidden" value="${item.price}" />${item.price}</span></td>
											<td><input id="productCount" name="productCount"
												type="hidden" value="${item.count}" /> ${item.count}</td>
											<td>${item.size}</td>
										</tr>
									</c:forEach>
								</tbody>
								<TFOOT>
									<tr>
										<td colspan="2" style="padding: 10px; align: right;">重要提醒
											<textarea name="memo" rows="1" cols="20"></textarea>
											选填，可告诉卖家您的特殊要求
										</td>
										<td></td>
										<td></td>
										<td><input type="button" value="修改" class="button1 blue"
											onclick="location.href='Cart?action=searchName&customerName=${LoginName}'"></td>
									</tr>
								</TFOOT>
							</table>
						</div>
						<div class="total">
							<ul>
								<li style="text-align: right;"><span>总商品金额：</span>${Total}</li>
								<li style="text-align: right;"><span>+ 运费：</span>20.0 <input
									type="hidden" id="freight" name="freight" value="20" /> <input
									type="hidden" id="orderMoney" name="orderMoney"
									value="${Total+20}" /></li>
							</ul>
							<div style="font-size: 1.2em; text-align: right;">
								应付总额：<span style="font-size: 1.4em; color: red;"><b>${Total+20}
								</b></span>
							</div>
						</div>
					</div>
					<input type="hidden" name="orderStatus" value="下单成功" /> <input
						type="hidden" name="deliveryState" value="未发货" /> <input
						type="hidden" name="productWeight" value="0" /> <input
						type="hidden" name="paymentStatus" value="未支付" /> <input
						type="hidden" name="customerName" value="${LoginName}" /> <input
						type="hidden" name="paidAmount" value="0" /> <input type="button"
						value="确定下单" class="pure-button pure-button-primary"
						onclick="sureOrder();" />
				</form>
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
	</div>
</body>
</html>
