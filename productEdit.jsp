<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>产品列表</title>
<link rel="stylesheet" href="css/pure-min.css" type="text/css" />
<link rel="stylesheet" href="css/bootstrap-combined.min.css"
	type="text/css" />
<script src="js/jquery-1.11.1.js"></script>
</head>
<body>
	<div id="center" style="margin:0 auto; width: 990px;">
		<div id="logo" style="width: 170px; float: left;">
			<img src="img/shoemall.jpg" width="170px" height="60px">
		</div>
		<div style="height: 15px; width: 670px; float: left;"></div>
		<div id="denglu"
			style="height: 15px; font-size: 13px; width: 150px; float: left;">
			您好! [<a href="User?action=edit">账号设置</a>] [<a href="User?action=exit">注销</a>]
		</div>
		<ul class="nav nav-tabs">
			<li class="dropdown active"><a href="#" data-toggle="dropdown"
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
			<li class="dropdown"><a href="#" data-toggle="dropdown"
				class="dropdown-toggle">会员<b class="caret"></b></a>
				<ul class="dropdown-menu">
					<li><a href="#panel-20161" data-toggle="tab" onclick="location='Customer?action=list'">会员信息</a></li>
				</ul></li>
		</ul>
		<form class="pure-form pure-form-aligned" method="post"
			action="Product?action=save">
			<fieldset>
			<div style="width:50%;float:left;">
				<div class="pure-control-group">
					<label>产品名称</label> <input name="productName" type="text"
						value="${product.productName}" />
				</div>
				<div class="pure-control-group">
					<label>产品品牌</label> <input name="brand" type="text"
						value="${product.brand}" />
				</div>
				<div class="pure-control-group">
					<label>专柜价</label> <input name="originalPrice" type="text"
						value="${product.originalPrice }" />
				</div>
				<div class="pure-control-group">
					<label>折扣价</label> <input type="text" name="discount"
						value="${product.discount}"></input>
				</div>
				<div class="pure-control-group">
					<label>款式</label> <input name="style" type="text"
						value="${product.style }" />
				</div>
				<div class="pure-control-group">
					<label>适应季节</label> <input name="season" type="text"
						value="${product.season}" />
				</div>
				<div class="pure-control-group">
					<label>适应性别</label> <input name="gender" type="text"
						value="${product.gender}" />
				</div>
				<div class="pure-control-group">
					<label>图片展示地址</label> <input type="text" name="showPicture"
						value="${product.showPicture}"></input>
				</div>
				<div class="pure-control-group">
					<label>发布日期</label> <input name="date" type="text"
						value="${product.date}" />
				</div>
				</div>
				<div style="width:50%;float:left;">
				<div class="pure-control-group">
					<label>总库存</label> <input name="stock" type="text"
						value="${product.stock}" />
				</div>
				<div class="pure-control-group">
					<label>35码</label> <input name="size35" type="text"
						value="${product.size35 }" />
				</div>
				
				<div class="pure-control-group">
					<label>36码</label> <input name="size36" type="text"
						value="${product.size36 }" />
				</div>
				<div class="pure-control-group">
					<label>37码</label> <input name="size37" type="text"
						value="${product.size37 }" />
				</div>
				<div class="pure-control-group">
					<label>38码</label> <input name="size38" type="text"
						value="${product.size38 }" />
				</div>
				<div class="pure-control-group">
					<label>39码</label> <input name="size39" type="text"
						value="${product.size39 }" />
				</div>
				<div class="pure-control-group">
					<label>40码</label> <input name="size40" type="text"
						value="${product.size40 }" />
				</div>
				<div class="pure-control-group">
					<label>41码</label> <input name="size41" type="text"
						value="${product.size41 }" />
				</div>
				<div class="pure-control-group">
					<label>42码</label> <input name="size42" type="text"
						value="${product.size42 }" />
				</div>
				</div>
				<div class="pure-controls">
					<input type="hidden" name="productId" value="${product.productId }" />
					<input type="submit" id="submit" name="submit" class="pure-button pure-button-primary" value="保存"></input>
				</div>
			</fieldset>
		</form>
	</div>
	<script src="js/bootstrap-tab.js" type="text/javascript"></script>
	<script src="js/bootstrap-dropdown.js" type="text/javascript"></script>
</body>
</html>