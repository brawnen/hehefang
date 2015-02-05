<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/common/common.jsp"%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8" />
	<title>卖家|在售商品</title>
</head>
<body>
	<link rel="stylesheet" href="${cssUrl}/css/product.css" />
	<div class="wrapper product">
		<!-- container -->
		<div id="container">
			<!-- main -->
			<div id="main">
				<!-- mainCaption -->
				<div class="mainCaption">
					<h2>我的商品</h2>
				</div>
				<!-- mainCaption end -->
				<!-- screening -->
				<div class="screening">
					<form class="form form-inline" id="queryForm" method="post">
						<legend></legend>
						<div class="formGroup">
							<div class="form-item">
								<div class="item-label">
									<label>品牌：</label>
								</div>
								<div class="item-cont">
									<select name="" id="" class="select">
										<option value="1">好孩子好孩子</option>
										<option value="2">361</option>
									</select>
								</div>
							</div>
							<div class="form-item">
								<div class="item-label">
									<label>商品名称：</label>
								</div>
								<div class="item-cont">
									<input type="text" name="title" class="txt w-lg" />
									<input type="submit" class="btn btn-def" value="查&nbsp;&nbsp;询">
								</div>
							</div>
						</div>
						<div class="searchBtn"><a href="${ctx }/product/category" class="btn btn-def">发布新商品</a></div>
					</form>
				</div>
				<!-- screening end -->
				<!-- table -->
				<c:choose>
					<c:when test="${not empty requestScope.page.result}">		
					<table class="table table-line table-left table-product">
						<colgroup>
							<col width="70">
							<col width="80">
							<col width="205">
							<col width="90">
							<col width="130">
							<col width="100">
							<col width="80">
							<col width="80">
							<col width="86">
							<col width="100">
						</colgroup>
						<thead>
							<tr>
								<td>商品图片</td>
								<td>商品ID</td>
								<td>商品名称</td>
								<td>品牌</td>
								<td>货号</td>
								<td>类目</td>
								<td>原价</td>
								<td>特卖价格</td>
								<td>录入时间</td>
								<td>操作</td>
							</tr>
						</thead>
						<tbody class="interleave-even">
							<c:forEach items="${requestScope.page.result}" var="p">
								<tr>
									<td>
										<div class="pro-img">
											<img src="${p.imgUrl}" alt="" />
										</div>
									</td>
									<td>${p.prodCode }</td>
									<td><p>${p.title }</p></td>
									<td>${p.brandName }</td>
									<td>${p.artNo }</td>
									<td>睡衣/睡裤/睡裙/睡衣套装</td>
									<td>${p.salePrice }</td>
									<td>${p.marketPrice }</td>
									<td>${p.createDate }</td>
									<td class="td-operate"><p><a href="javascript:;">修改</a>|<a href="javascript:;">删除</a></p></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
					<!-- table edn -->
					</c:when>
					<c:otherwise>
						<div class="mod-tips fruitless">没有找到符合条件的商品！</div>
						<div class="mod-tips fruitless">您还没有发布过商品？现在就 <a href="#">发布商品</a></div>
					</c:otherwise>
				</c:choose>
				
				<c:if test="${fn:length(page.result) > 0}">
					<pg:page name="onlinePage" page="${page}" formId="queryForm"></pg:page>
				</c:if>
				
			</div>
			<!-- main end -->
		</div>
		<!-- container end -->
	</div>
	<script type="text/javascript" src="${jsUrl}/product.js"></script>	
</body>
</html>