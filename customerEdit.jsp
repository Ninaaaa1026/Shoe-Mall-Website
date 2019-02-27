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
			action="Customer?action=save">
			<fieldset>
				<div class="pure-control-group">
					<label for="txtLoginName">用户名</label> <input id="txtLoginName"
						required name="loginName" type="text" placeholder="用户名"
						value="${Customer.loginName }" />
				</div>

				<div class="pure-control-group">
					<label for="txtPassword">密码</label> <input id="txtPassword"
						required name="password" type="text" placeholder="密码"
						value="${Customer.password }" />
				</div>

				<div class="pure-control-group">
					<label for="txtFullName">姓名</label> <input id="txtFullName"
						name="fullName" type="text" placeholder="姓名"
						value="${Customer.fullName }" />
				</div>

				<div class="pure-control-group">
					<label for="txtGender">性别</label> <input id="txtGender"
						name="gender" type="text" placeholder="性别"
						value="${Customer.gender }" />
				</div>
				<div class="pure-control-group">
					<label for="txtBirthDate">出生日期</label> <input id="txtBirthDate"
						name="birthDate" type="text" placeholder="出生日期"
						value="${Customer.birthDate }" />
				</div>
				<div class="pure-controls">
					<input type="hidden" name="UserId" value="${User.id }" />
					<input type="submit" class="pure-button pure-button-primary"value="保存"></input>
				</div>
			</fieldset>
		</form>
	</div>
	<script src="js/bootstrap-tab.js" type="text/javascript"></script>
	<script src="js/bootstrap-dropdown.js" type="text/javascript"></script>
</body>
</html>