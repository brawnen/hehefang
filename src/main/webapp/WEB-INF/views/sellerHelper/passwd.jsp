<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/common/common.jsp"%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8" />
	<title>卖家|保证金</title>
</head>
<body>
	<link rel="stylesheet" href="${cssUrl}/css/helper.css" />
	<div class="wrapper wrap-helper">
		<!-- container -->
		<div id="container">
			<!-- main -->
			<div id="main">
				<!-- mainCaption -->
				<div class="mainCaption">
					<h2>我的密码</h2>
				</div>
				<!-- mainCaption end -->
				<div class="section">
					<!-- form -->
					<form class="form form-helper">
						<fieldset>
							<div class="form-item">
								<div class="item-label"><label><em>*</em>旧密码：</label></div>
								<div class="item-cont">
									<input type="text" class="txt lg w-lgl" />
								</div>
							</div>
							<div class="form-item">
								<div class="item-label"><label><em>*</em>新密码：</label></div>
								<div class="item-cont">
									<input type="text" class="txt lg w-lgl" /><span class="note errTxt">错误信息</span>
								</div>
							</div>
							<div class="form-item">
								<div class="item-label"><label><em>*</em>再次输入新密码：</label></div>
								<div class="item-cont">
									<input type="text" class="txt lg w-lgl" />
								</div>
							</div>
							<div class="form-item">
								<div class="item-cont">
									<input type="button" value="保 存" class="btn btn-primary lg p-xl">
								</div>
							</div>
						</fieldset>
					</form>
				<!-- form end -->
				</div>
			</div>
			<!-- main end -->
		</div>
		<!-- container end -->
	</div>
	<script type="text/javascript" src="${jsUrl}/popWindown.js?t=20150210"></script>
	<script type="text/javascript">

	$(function(){

	});
	

	</script>
</body>
</html>