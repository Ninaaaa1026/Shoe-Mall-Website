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
	if(window.name==""||window.name==null){
		window.name="enter";
		window.self.location= 'Product?action=sortByDate2';
	}
	else
		{
		window.name="";
		}			
}
</script>
</head>
<body>
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
				<div class="bangdan">
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
			</div>
			<div id="center">
				<div class="searchmenu">
					<table>
						<tr>
							<td>首页〉</td>
							<td></td>
							<td></td>
						</tr>
					</table>
				</div>
				<div class="shaixuan">
					<table>
						<tr>
							<td>筛选商品</td>
						</tr>
						<tr>
							<td>款式</td>
						<td><a href="Product?action=searchStyle&style=短靴">短靴</a></td>
						<td><a href="Product?action=searchStyle&style=长筒靴">长筒靴</a></td>
						<td><a href="Product?action=searchStyle&style=中筒靴">中筒靴</a></td>
						<td><a href="Product?action=searchStyle&style=雪地靴">雪地靴</a></td>
						<td><a href="Product?action=searchStyle&style=马丁靴">马丁靴</a></td>
						</tr>
						<tr>						
						<td></td>
						<td><a href="Product?action=searchStyle&style=单鞋">单鞋</a></td>
						<td><a href="Product?action=searchStyle&style=流苏靴">流苏靴</a></td>
						<td><a href="Product?action=searchStyle&style=皮鞋">皮鞋</a></td>
						<td><a href="Product?action=searchStyle&style=豆豆鞋">豆豆鞋</a></td>
						<td><a href="Product?action=searchStyle&style=凉鞋">凉鞋</a></td>
						</tr>
						<tr>
							<td>品牌</td>
						<td><a href="Product?action=searchBrand&brand=UGG">UGG</a></td>
						<td><a href="Product?action=searchBrand&brand=天美意">Teenmix</a></td>
						<td><a href="Product?action=searchBrand&brand=百丽">百丽 </a></td>
						<td><a href="Product?action=searchBrand&brand=crocs">crocs</a></td>
						<td><a href="Product?action=searchBrand&brand=星期六">星期六 </a></td>
						</tr>
						<tr>						
						<td></td>
						<td><a href="Product?action=searchBrand&brand=热风">热风 </a></td>
						<td><a href="Product?action=searchBrand&brand=骆驼">骆驼</a></td>
						<td><a href="Product?action=searchBrand&brand=卓诗尼">卓诗尼</a></td>
						<td><a href="Product?action=searchBrand&brand=adidas">阿迪达斯 </a></td>
						<td><a href="Product?action=searchBrand&brand=NewBalance">新百伦NB</a></td>
						</tr>
						<tr>
							<td>季节</td>
							<td><a href="Product?action=searchSeason&season=四季">四季</a></td>
							<td><a href="Product?action=searchSeason&season=夏">夏</a></td>
							<td><a href="Product?action=searchSeason&season=秋">秋</a></td>
							<td><a href="Product?action=searchSeason&season=冬">冬</a></td>
							<td><a href="Product?action=searchSeason&season=秋冬">秋冬</a></td>
						</tr>
						<tr>
							<td>性别</td>
							<td><a href="Product?action=searchGender&gender=男">男款</a></td>
							<td><a href="Product?action=searchGender&gender=女">女款</a></td>
							<td></td>
							<td></td>
							<td></td>
						</tr>
						<tr>
							<td>年份</td>
							<td><a href="Product?action=searchDate&date=2011">2011年</a></td>
							<td><a href="Product?action=searchDate&date=2012">2012年</a></td>
							<td><a href="Product?action=searchDate&date=2013">2013年</a></td>
							<td><a href="Product?action=searchDate&date=2014">2014年</a></td>							
							<td></td>
						</tr>
					</table>
				</div>
				<div class="buju">
					<form>
						<table>
							<tr>
								<td>布局</td>
							</tr>
							<tr>
								<td><select name="" size="">
										<option value="1">价格升序
										<option value="2">价格降序
										<option value="3">销量降序
										<option value="4">日期降序</select></td>
							</tr>
							<tr>
								<td>只查看：<input name="chakan"type="radio" class="radio">热销</input><input name="chakan"
									type="radio" class="radio">最新</input></td>
							</tr>
						</table>
					</form>
				</div>
				<c:if test="${requestScope.Products.size()>0}">
					<c:forEach var="i" begin="0"
						end="${requestScope.Products.size()-1}" step="4">
						<table class="tuijian" cellspacing="0" cellpadding="0">
							<tr>
								<td><a href="Product?action=sell&productId=${Products.get(i).productId}"><img src="img/${Products.get(i).showPicture}"></img></a></td>
								<c:if test="${i<=requestScope.Products.size()-2}">
									<td><a href="Product?action=sell&productId=${Products.get(i+1).productId}"><img src="img/${Products.get(i+1).showPicture}"></img></a></td>
									<c:if test="${i<=requestScope.Products.size()-3}">
										<td><a href="Product?action=sell&productId=${Products.get(i+2).productId}"><img src="img/${Products.get(i+2).showPicture}"></img></a></td>
										<c:if test="${i<=requestScope.Products.size()-4}">
											<td><a href="Product?action=sell&productId=${Products.get(i+3).productId}"><img src="img/${Products.get(i+3).showPicture}"></img></a></td>
										</c:if>
									</c:if>
								</c:if>
							</tr>
							<tr>
								<td>${Products.get(i).originalPrice}</td>
								<c:if test="${i<=requestScope.Products.size()-2}">
									<td>${Products.get(i+1).originalPrice}</td>
									<c:if test="${i<=requestScope.Products.size()-3}">
										<td>${Products.get(i+2).originalPrice}</td>
										<c:if test="${i<=requestScope.Products.size()-4}">
											<td>${Products.get(i+3).originalPrice}</td>
										</c:if>
									</c:if>
								</c:if>
							</tr>
							<tr>
								<td>${Products.get(i).discount}</td>
								<c:if test="${i<=requestScope.Products.size()-2}">
									<td>${Products.get(i+1).discount}</td>
									<c:if test="${i<=requestScope.Products.size()-3}">
										<td>${Products.get(i+2).discount}</td>
										<c:if test="${i<=requestScope.Products.size()-4}">
											<td>${Products.get(i+3).discount}</td>
										</c:if>
									</c:if>
								</c:if>
							</tr>
						</table>
					</c:forEach>
				</c:if>
				<c:if test="${requestScope.Products.size()==0}">
					<div style="margin-left: 10px;height:30px;padding-top:15px;">查找不到搜索的产品！</div>
				</c:if>
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
