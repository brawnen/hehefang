<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="/common/common.jsp"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="Cache-Control" content="no-cache,must-revalidate">
<link rel="stylesheet" href="${cssUrl}/css/allstyle.min.css" />
<link rel="stylesheet" href="${cssUrl}/css/register.css" />
<title>商家登录-阿凡达</title>
</head>

<body id="regsignin">
	<div class="wrapper">
		<!-- header -->
		<div id="header">
			<div class="wrap">
				<!-- logo -->
				<div id="logo">
					<div class="logo"><a href="#" title="logo"><img src="${cssUrl}/img/logo.png" alt="logo" /></a></div>
					<h1>商家中心</h1>
				</div>
				<!-- logo end -->
			</div>
		</div>
		<!-- header end -->
		<!-- container -->
		<div id="container">
			<!-- login -->
			<div class="wrap wrap-login">
				<div class="signinForm clearfix">
					<div class="pic"><img src="${cssUrl}/img/login_pic.jpg" alt="" /></div>
					<form class="form">
						<h2>卖家登录</h2>
						<dl class="form-item item-user">
							<dt class="item-label"><label>卖家账号：</label></dt>
							<dd class="item-cont">
								<input type="text" placeholder="用户名" class="txt lg" />
								<div class="note errTxt">错误提示文字</div>
							</dd>
						</dl>
						<dl class="form-item item-pw">
							<dt class="item-label"><label>登录密码：</label></dt>
							<dd class="item-cont">
								<input type="password" class="txt lg" />
							</dd>
						</dl>
						<dl class="form-item item-save">
							<dd class="item-cont"><a href="#" class="forgetPW">忘记密码？</a></dd>
						</dl>
						<dl class="form-item item-checkCode hide">
							<dt class="item-label"><label>验证码：</label></dt>
							<dd class="item-cont"><input type="text" class="txt" name="saveName" id="saveName" /><img src="${cssUrl}/img/temp/checkCode.jpg" alt="换一张" title="换一张" /><a href="#">换一张</a></dd>
						</dl>
						<dl class="form-item">
							<dd class="item-cont"><input type="button" class="btn btn-primary loginBtn" value="登&nbsp;&nbsp;&nbsp;录" /></dd>
						</dl>
						<dl class="form-item item-join">
							<dd class="item-cont">还没有阿凡达商家账号？<a href="#">立即注册</a></dd>
						</dl>
					</form>
				</div>
			</div>
			<!-- login end -->
		</div>
		<!-- container end -->
		
		<jsp:include page="/common/footer.jsp"/>
	</div>
</body>
</html>