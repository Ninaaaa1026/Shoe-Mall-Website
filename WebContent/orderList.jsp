<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>订单列表</title>
<link rel="stylesheet" href="css/pure-min.css" type="text/css" />
<link rel="stylesheet" href="css/bootstrap-combined.min.css"
	type="text/css" />
<script src="js/jquery-1.11.1.js"></script>
</head>
<body>
	<div id="center" style="margin: 0 auto; width: 990px;">
		<div id="logo" style="width: 170px; float: left;">
			<img src="img/shoemall.jpg" width="170px" height="60px">
		</div>
		<div style="height: 15px; width: 670px; float: left;"></div>
		<div id="denglu"
			style="height: 15px; font-size: 13px; width: 150px; float: left;">
			您好! [<a href="User?action=edit">账号设置</a>] [<a href="User?action=exit">注销</a>]
		</div>
		<ul class="nav nav-tabs">
			<li class="dropdown"><a href="#" data-toggle="dropdown"
				class="dropdown-toggle">商品 <b class="caret"></b>
			</a>
				<ul class="dropdown-menu">
					<li><a data-toggle="tab" href="#panel-9980711" onclick="location='Product?action=list'">商品详情</a></li>
					<li><a data-toggle="tab" href="#panel-9980712" onclick="location='Product?action=listStock'">存货详情</a></li>
				</ul></li>
			<li class="dropdown  active"><a href="#" data-toggle="dropdown"
				class="dropdown-toggle">订单<b class="caret"></b></a>
				<ul class="dropdown-menu">
					<li><a href="#panel-20131" data-toggle="tab" onclick="location='Order?action=list'">订单列表</a></li>
					<li><a href="#panel-20132" data-toggle="tab"onclick="location='Product?action=saleList'">销售统计</a></li>
				</ul></li>
			<li class="dropdown"><a href="#" data-toggle="dropdown"
				class="dropdown-toggle">会员<b class="caret"></b></a>
				<ul class="dropdown-menu">
					<li><a href="#panel-20161" data-toggle="tab" onclick="location='Customer?action=list'">会员信息</a></li>
				</ul></li>
		</ul>

		<div class="tab-content">
		<div class="tabbable tabs-left"style="width:130px;float:left;">
				<ul class="nav nav-tabs"style="width:130px;">
					<li>
						<a href="productAdd.html" target="_self">添加产品</a>
					</li>
					<li>
						<a href="Product?action=list">刷新</a>
					</li>
				</ul>
			</div>
			<div class="tab-pane fade active in" id="panel-20131"
				style="width: 860px; float: left;">
				<table class="pure-table pure-table-horizontal"
					style="width: 100%; float: left;">
					<thead>
						<tr>
							<th>订单编号</th>
							<th>订单金额</th>
							<th>会员</th>
							<th>收货人</th>
							<th>支付方式</th>
							<th>订单状态</th>
							<th>支付状态</th>
							<th>配送状态</th>
							<th>创建日期</th>
							<th colspan="2">操作</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="item" items="${requestScope.Orders}">
							<tr>
								<td>${item.orderNumber}</td>
								<td>${item.orderMoney}</td>
								<td>${item.name}</td>
								<td>${item.consignee}</td>
								<td>${item.paymentWay}</td>
								<td>${item.orderStatus}</td>
								<td>${item.paymentStatus}</td>
								<td>${item.deliveryState}</td>
								<td>${item.date}</td>
								<td>
									<form action="Order?action=edit" method="post">
										<input type="submit" value="Edit"
											class="pure-button pure-button-primary" /> <input
											type="hidden" name="orderNo" value="${item.orderNumber }" />
									</form>
								</td>
								<td>
									<form action="Order?action=del" method="post">
										<input type="submit" value="Delete"
											class="pure-button pure-button-primary" /> <input
											type="hidden" name="orderNo" value="${item.orderNumber}" />
									</form>
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</div>
	<script src="js/bootstrap-tab.js" type="text/javascript"></script>
	<script src="js/bootstrap-dropdown.js" type="text/javascript"></script>
</body>
</html>