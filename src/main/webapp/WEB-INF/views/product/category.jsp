<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/common/common.jsp"%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8" />
	<title>卖家|发布商品-添加类目</title>
</head>
<body>
	<div class="wrapper product">
		<!-- container -->
		<div id="container">
			<!-- main -->
			<div id="main">
				<!-- mainCaption -->
				<div class="mainCaption">
					<h2>发布新商品</h2>
				</div>
				<!-- mainCaption end -->
				<!-- addCategory -->
				<div class="addCategory">
					<form class="form">
						<fieldset>
							<div class="legend">选择一个类目添加商品</div>
							<div class="formGroup categoryList">
								<div class="cl-item">
									<ul id="first_list">
										<li class="curr"><span>&gt;</span>靓丽女装</li>
										<li><span>&gt;</span>风尚男装</li>
										<li><span>&gt;</span>精品鞋包</li>
										<li><span>&gt;</span>时尚配饰</li>
										<li><span>&gt;</span>运动户外</li>
										<li><span>&gt;</span>女士秋装</li>
										<li><span>&gt;</span>女士秋装</li>
										<li><span>&gt;</span>女士秋装</li>
										<li><span>&gt;</span>女士秋装</li>
										<li><span>&gt;</span>女士秋装</li>
									</ul>
								</div>
								<div class="cl-item">
									<ul id="second_list">
										<li class="curr"><span>&gt;</span>靓丽女装</li>
										<li><span>&gt;</span>风尚男装</li>
										<li><span>&gt;</span>精品鞋包</li>
										<li><span>&gt;</span>时尚配饰</li>
										<li><span>&gt;</span>运动户外</li>
										<li><span>&gt;</span>女士秋装</li>
										<li><span>&gt;</span>女士秋装</li>
										<li><span>&gt;</span>女士秋装</li>
										<li><span>&gt;</span>女士秋装</li>
										<li><span>&gt;</span>女士秋装</li>
									</ul>
								</div>
								<div class="cl-item">
									<ul id="third_list">
										<li class="curr">靓丽女装</li>
										<li>风尚男装</li>
										<li>精品鞋包</li>
										<li>时尚配饰</li>
										<li>运动户外</li>
										<li>女士秋装</li>
										<li>女士秋装</li>
										<li>女士秋装</li>
										<li>女士秋装</li>
										<li>女士秋装</li>
									</ul>
								</div>
							</div>
							<div class="formGroup">
								<div class="mod-tips">
									<p><b>您当前选的类目是：</b>靓丽女装<span>&gt;</span>应季女装<span>&gt;</span>羊绒衫</p>
								</div>
							</div>
							<div class="btnWrap">
								<input type="button" id="publishBtn" value="我选好了，去发布商品" class="btn btn-primary lg p-lg" >
							</div>
						</fieldset>
					</form>
				</div>
				<!-- addCategory end  -->
			</div>
			<!-- main end -->
		</div>
		<!-- container end -->
	</div>
<script type="text/javascript" src="${ctx}/js/product.js"></script>	
<script type="text/javascript">
	$(function() {

		$(document).on("click", "#publishBtn", function() {
			window.location.href = "${ctx}/product/publish";
		});

	});
</script>	
</body>
</html>