<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/common/common.jsp"%>
<%@taglib prefix="decorator" uri="http://www.opensymphony.com/sitemesh/decorator"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>     
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="Cache-Control" content="no-cache,must-revalidate">
<meta http-equiv="X-UA-Compatible" content="IE=EmulateIE8" />
<link rel="stylesheet" type="text/css" href="${ctx }/static/css/allstyle.min.css"/>
<script type="text/javascript" src="${ctx}/js/jquery-1.10.2.min.js?t=201501171056"></script>
<script type="text/javascript" src="${ctx}/js/check-util.js?t=201501171056"></script>
<title><decorator:title default="卖家中心-一网全城"/></title>
</head>
<body>
	<div class="wrapper">
		<!-- header -->
		<div id="header">
			<div class="wrap">
				<!-- logo -->
				<div id="logo">
					<div class="logo"><a href="#" title="logo"><img src="${ctx }/static/img/logo.png" alt="logo" /></a></div>
					<h1>商家中心</h1>
				</div>
				<!-- logo end -->
				<!-- site -->
				<div id="site">
					<ul class="item">
						<li>|</li>
						<li class="msg">
							<div class="hd"><i class="icon"></i><a href="#">消息</a><em>2</em></div>
						</li>
						<li>|</li>
						<li>
							<div class="hd"><a href="#">帮助中心</a></div>
						</li>
					</ul>
				</div>
				<!-- site end -->
				<!-- signin -->
				<div id="signin">
					<p><span>您好,醉逍遥</span><span><a href="#" class="exit">退出</a><!--<a href="#">登录</a>/<a href="#">注册</a>--></span></p>
				</div>
				<!-- signin end -->
			</div>
		</div>
		<!-- header end -->
		<!-- mainNav -->
		<div id="mainNav">
			<div class="wrap">
				<ul>
					<li class="nav-01"><a href="#"><i class="icon"></i>商家助手</a></li>
					<li class="nav-02 curr"><a href="#"><i class="icon"></i>商品管理</a></li>
					<li class="nav-03"><a href="#"><i class="icon"></i>品牌特卖</a></li>
					<li class="nav-04"><a href="#"><i class="icon"></i>交易管理</a></li>
				</ul>
			</div>
		</div>
		<!-- mainNav end -->
		<!-- container -->
		<div id="container">
			<div class="wrap">
				<!-- aside -->
				<div id="aside">
					<div id="asideNav">
						<ul>
							<li class="curr"><a href="${ctx }/product/category"><i class="icon"></i>发布新商品</a></li>
							<li><a href="${ctx }/product/online"><i class="icon"></i>在售商品管理</a></li>
							<li><a href="${ctx }/product/online"><i class="icon"></i>审核中商品</a></li>
							<li><a href="${ctx }/product/online"><i class="icon"></i>品牌管理</a></li>
						</ul>
					</div>
				</div>
				<!-- aside end -->
		<div id="content">
			<decorator:body/>				
		</div>			
			<!-- content end -->
		</div>
		<!-- main end -->
		<!-- footer -->
		<jsp:include page="/common/footer.jsp"/>
		<!-- footer end -->
	</div>
</body>
</html>
