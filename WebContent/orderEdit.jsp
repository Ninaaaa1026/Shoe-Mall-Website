<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>用户编辑</title>
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
			<li class="dropdown"><a href="#" data-toggle="dropdown"
				class="dropdown-toggle">订单<b class="caret"></b></a>
				<ul class="dropdown-menu">
					<li><a href="#panel-20131" data-toggle="tab" onclick="location='Order?action=list'">订单列表</a></li>
					<li><a href="#panel-20132" data-toggle="tab"onclick="location='Product?action=saleList'">销售统计</a></li>
				</ul></li>
			<li class="dropdown active"><a href="#" data-toggle="dropdown"
				class="dropdown-toggle">会员<b class="caret"></b></a>
				<ul class="dropdown-menu">
					<li><a href="#panel-20161" data-toggle="tab" onclick="location='Customer?action=list'">会员信息</a></li>
				</ul></li>
		</ul>
		<form class="pure-form pure-form-aligned" method="post"
			action="Order?action=save">
			<fieldset>
			<div class="pure-control-group">
			<label for="txtOrderStatus">订单号</label>${Order.orderNumber }
			<input type="hidden" name="orderNumber" value="${Order.orderNumber }">
			</div>
			<div class="pure-control-group">
			<label for="txtOrderStatus">会员名</label>${Order.name }
			<input type="hidden" name="customerName" value="${Order.name }">
			</div>
			<div class="pure-control-group">
			<label for="txtOrderStatus">订单金额</label>${Order.orderMoney}
			<input type="hidden" name="orderMoney" value="${Order.orderMoney}">
			</div>
			<div class="pure-control-group">
			<label for="txtOrderStatus">商品重量</label>${Order.productWeight}
			<input type="hidden" name="productWeight" value="${Order.productWeight}">
			</div>
			<div class="pure-control-group">
			<label for="txtOrderStatus">运费</label>${Order.freight }
			<input type="hidden" name="freight" value="${Order.freight }">
			</div>
			<div class="pure-control-group">
			<label for="txtOrderStatus">支付方式</label>${Order.paymentWay }
			<input type="hidden" name="paymentWay" value="${Order.paymentWay }">
			</div>
			<div class="pure-control-group">
			<label for="txtOrderStatus">收货人</label>${Order.consignee }
			<input type="hidden" name="consignee" value="${Order.consignee }">
			</div>
			<div class="pure-control-group">
			<label for="txtOrderStatus">电话</label>${Order.telephone}
			<input type="hidden" name="telephone" value="${Order.telephone}">
			</div>
			<div class="pure-control-group">
			<label for="txtOrderStatus">地址</label>${Order.address }
			<input type="hidden"name="address" value="${Order.address }">
			</div>
			<div class="pure-control-group">
			<label for="txtOrderStatus">下单日期</label>${Order.date }
			<input type="hidden" name="date" value="${Order.date }">
			</div>
			
			<div class="pure-control-group">
			<label for="txtOrderStatus">已支付金额</label>${Order.paidAmount }
			<input type="hidden" name="paidAmount" value="${Order.paidAmount }">
			</div>
			<div class="pure-control-group">
			<label for="txtOrderStatus">备注</label>${Order.memo }
			<input type="hidden" name="memo" value="${Order.memo }">
			</div>
				<div class="pure-control-group">
					<label for="txtOrderStatus">订单状态</label>${Order.orderStatus}&nbsp;&nbsp;&nbsp;&nbsp;更改状态：
					<select id="txtOrderStatus" name="orderStatus"style="width:100px;">
					<option value="下单成功">下单成功</option>
					<option value="已发货">已发货</option>
					<option value="订单完成">订单完成</option>
					</select>
				</div>

				<div class="pure-control-group">
					<label for="txtPaymentStatus">支付状态</label>${Order.paymentStatus }&nbsp;&nbsp;&nbsp;&nbsp;更改状态：
					<select id="txtPaymentStatus" name="paymentStatus"style="width:100px;">
					<option value="未支付">未支付</option>
					<option value="已支付">已支付</option>
					</select>
				</div>

				<div class="pure-control-group">
					<label for="txtDeliveryState">配送状态</label> ${Order.deliveryState }&nbsp;&nbsp;&nbsp;&nbsp;更改状态：
					<select id="txtDeliveryState" name="deliveryState" style="width:100px;">
					<option value="未发货">未发货</option>
					<option value="已发货">已发货</option>
					<option value="配送途中">配送途中</option>
					<option value="订单完成">已收货</option>
					</select>
				</div>
				<div class="pure-controls">
					<input type="hidden" name="UserId" value="${User.id }" />
					<button type="submit" class="pure-button pure-button-primary">保存</button>
				</div>
			</fieldset>
		</form>
	</div>
	<script src="js/bootstrap-tab.js" type="text/javascript"></script>
	<script src="js/bootstrap-dropdown.js" type="text/javascript"></script>
</body>
</html>