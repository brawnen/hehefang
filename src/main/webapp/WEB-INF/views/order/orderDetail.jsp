<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@include file="/common/common.jsp"%>
<html>
	<head>
		<title>订单管理-afd</title>
	</head>
	<body>
		<!-- mainCaption -->
		<div class="mainCaption mc-mb">
			<h2>我的订单</h2>
		</div>
		<!-- mainCaption end -->
		<!-- message -->
		<div class="mod-message">
			<div class="hd">
				<h3 class="title">当前订单状态：<span class="successColor"><c:out value="${order.strOrderStatus}" /></span></h3>
			</div>
			<div class="bd">
				<div class="msg-text"><i class="icon i-horn"></i><b>系统提醒</b>：交易已成功后，如买家提出售后要求，请积极与买家协商，做好售后服务。</div>
			</div>
		</div>
		<!-- message end -->
		<!-- orderInfo -->
		<div class="mod-orderInfo">
			<div class="item">
				<table class="table table-left noborder">
					<caption>订单信息</caption>
					<colgroup>
						<col width="300">
						<col width="300">
						<col>
					</colgroup>
					<tbody>
						<tr>
							<td>订单编号：${orderCondition.orderCode}</td>
							<td>付款方式：<c:out value="${order.strPayMode}" /></td>
							<td>订单来源：<c:out value="${order.strOrderSource}" /></td>
						</tr>
						<tr>
							<td>下单时间：<fmt:formatDate value="${order.createdDate}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
							<td>付款时间：<fmt:formatDate value="${order.payDate}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
							<td>发货时间：<fmt:formatDate value="${order.sendTime}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
						</tr>
					</tbody>
				</table>
			</div><!-- item end -->
			<div class="item">
				<table class="table table-left noborder">
					<caption>买家信息</caption>
					<colgroup>
						<col>
					</colgroup>
					<tbody>
						<tr>
							<td>收货地址：<c:out value="${order.rProvince}"/> <c:out value="${order.rCity}"/> <c:out value="${order.rCounty}"/> <c:out value="${order.rTown}"/> <c:out value="${order.rAddr}"/>，    收件人：<c:out value="${order.rName}" />，     手机：${order.rMobile}</td> 
						</tr>
					</tbody>
				</table>
			</div><!-- item end -->
		</div>
		<!-- orderInfo end -->
		<!-- table -->
		<table class="table table-line table-order">
			<colgroup>
				<col width="86">
				<col width="300">
				<col width="150">
				<col width="127">
				<col width="113">
				<col width="130">
				<col width="119">
			</colgroup>
			<thead>
				<tr>
					<td colspan="2">商品</td>
					<td>商品编码</td>
					<td>单价</td>
					<td>数量</td>
					<td>优惠</td>
					<td>状态</td>
				</tr>
			</thead>
			<tbody>
				<c:if test="${not empty order.orderItems}">
					<c:forEach items="${order.orderItems}" var="orderItem">
						<tr>
							<td>
								<div class="order-img">
									<img src="${my:random(imgGetUrl)}${orderItem.prodImg}&op=s1_w40_h40_e1-c3_w40_h40" alt="" />
								</div>
							</td>
							<td class="o-product">
								<p><a href="#" target="_blank"><c:out value="${orderItem.prodTitle}" /></a></p>
								<p class="lightColor">
									<c:forEach items="${orderItem.specNames}" var="spec">
										<span><c:out value="${spec.key}" /> : <c:out value="${spec.value}" /></span>
									</c:forEach>
								</p>
							</td>
							<td><c:out value="${orderItem.prodCode}" /></td>
							<td>
								<p>&yen;<fmt:formatNumber value="${orderItem.salePrice}" pattern="0.00" /></p>
							</td>
							<td>${orderItem.number}</td>
							<td><p>&yen;<fmt:formatNumber value="${orderItem.transPrice}" pattern="0.00" /></p></td>
							<td>
								<p><c:out value="${order.strOrderStatus}" /></p>
							</td>
						</tr>
					</c:forEach>
				</c:if>
			</tbody>
			<tfoot>
				<tr>
					<td colspan="7" class="o-total">订单总额：<strong>&yen;<fmt:formatNumber value="${order.orderFee}" pattern="0.00" /></strong></td>
				</tr>
			</tfoot>
		</table>
		<!-- table edn -->
		<!-- orderInfo -->
		<!-- <div class="mod-orderInfo">
			<div class="item">
				<table class="table table-left noborder">
					<caption>物流信息</caption>
					<colgroup>
						<col width="300">
						<col width="300">
						<col>
					</colgroup>
					<tbody>
						<tr>
							<td>配送方式 ：EMS速递</td>
							<td>运单号码：1500102087387</td>
							<td></td>
						</tr>
					</tbody>
				</table>
			</div>item end
			<div class="item">
				<ul class="deliverInfoList">
					<li>2014-12-03 21:10 上海市|到件|到上海市【浦东分拨中心】</li>
					<li>2014-12-03 21:13 上海市|发件|上海市【浦东分拨中心】，正发往【上海分拨中心】</li>
					<li>2014-12-04 01:15 上海市|到件|到上海市【上海分拨中心】</li>
					<li>2014-12-04 01:18 上海市|发件|上海市【上海分拨中心】，正发往【太原分拨中心】</li>
					<li>2014-12-05 11:15 太原市|到件|到太原市【太原分拨中心】</li>
					<li class="now">2014-12-06 17:06 大同市|签收|大同市【大同云冈路分部】，林子 已签收</li>
				</ul>
			</div>item end
		</div> -->
		<!-- orderInfo end -->
	</body>
</html>



