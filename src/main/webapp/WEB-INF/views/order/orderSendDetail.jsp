<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@include file="/common/common.jsp"%>
<html>
	<head>
		<title>订单管理-一网全城</title>
	</head>
	<body>
		<script>
			$(function(){
				$(document).on("click","input[name=send]",function(){
					var logisticsId =  $("input[name=logistics]:checked").attr("id");
					var ssAddrId =  $("input[name=fetchAddr]:checked").attr("ssAddrId");
					if(!ssAddrId || ssAddrId <=0){
						tipsWindown("提示信息","issue:请选择发货地址！","","1");
						return false;
					}
					if(!logisticsId || logisticsId <=0){
						tipsWindown("提示信息","issue:请选择物流公司！","","1");
						return false;
					}
					var awbNo = $("input[name=awbNo]").val();
					var orderId = $("div.deliverMeg").attr("orderId");
// 					if(!awbNo){
// 						alert("请填写运单号！");
// 						return false;
// 					}
					tipsWindown("发货确认","warning:• 点击'确认'，您的订单将自动转到EMS快递公司进行统一派送，<br />&nbsp;&nbsp;请您提前备好货品，等待上门取货服务！<br /> • 点击‘取消’，取消本次发货操作，并返回待发货订单列表页！","","1");

				});
				$(document).on("click","#submitBtn",function(){
					var logisticsId =  $("input[name=logistics]:checked").attr("id");
					var ssAddrId =  $("input[name=fetchAddr]:checked").attr("ssAddrId");
					var awbNo = $("input[name=awbNo]").val();
					var orderId = $("div.deliverMeg").attr("orderId");
					$.post(
						"${ctx}/order/send",
						{orderId:orderId,logisticsId:logisticsId,ssAddrId:ssAddrId,awbNo:awbNo},
						function(json){
							if(json.success == 1){
								var orderStatus = $("input[name=orderStatus]").val();
								location.href = "${ctx}/order/queryOrder?orderStatus="+orderStatus+"&writable=true";
							}
						}
					);
				});
				$(document).on("click","a[name=setDefault]",function(){
					var ssAddrId = $(this).siblings("input.rdo").attr("ssAddrId");
					$.post(
						"${ctx}/order/chooseDefault",
						{ssAddrId:ssAddrId},
						function(data){location.reload();}
					);	
				});
			});
		</script>
		<div id="content">
			<!-- crumbs -->
			<div class="crumbs">
				<ul>
					<li><a href="${ctx}/store/main">卖家中心</a>&gt;</li>
					<li><strong>订单发货</strong></li>
				</ul>
			</div>
			<!-- crumbs end -->
			<!-- deliverOption -->
			<div class="deliverOption">
				<input type="hidden" name="orderStatus" value="${orderStatus}" />
				<c:if test="${order !=null }">
				<h3>确认买家收货信息</h3>
				<div class="deliverMeg" orderId="${order.orderId}">
					<p>买家收货信息：
						<c:out value="${order.rProvince}"></c:out>
						<c:out value="${order.rCity}"></c:out>
						<c:out value="${order.rCounty}"></c:out>
						<c:out value="${order.rTown}"></c:out>
						<c:out value="${order.rAddr}"></c:out>
						（<c:out value="${order.rZipcode}"></c:out>）
						<span>
							<c:out value="${order.rName}"></c:out>&nbsp;
							<c:choose>
								<c:when test="${order.rMobile != '' }">
									${order.rMobile}
								</c:when>
								<c:otherwise>
									${order.rPhone}
								</c:otherwise>
							</c:choose>
						</span>
					</p>
				</div>
				<!--table-->
				<table class="table tableB">
					<colgroup>
						<col width="30">
						<col width="338">
						<col width="140">
						<col width="140">
						<col width="376">
					</colgroup>
					<thead>
						<tr>
							<td colspan="5" class="o-select">
								<p>买家：<a><c:out value="${order.userName}"></c:out></a></p><span>订单编号：${order.orderId}</span><span>订单提交时间：<fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${order.createdDate}"/></span>
							</td>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${order.orderItems}" var="orderItem" varStatus="status">
							<tr>
								<td class="o-select"></td>
								<td>
									<dl class="o-goodsName">
										<dt>
											<a target="_blank" href="${prodSnapUrl}${orderItem.orderItemId}/">
												<img src="${imgDownPrefix}${orderItem.skuId%count}${imgDownSuffix}${orderItem.skuImgUrl}&op=s1_w80_h80_e1-c3_w80_h80" />
											</a>
										</dt>
										<dd>
											<p class="o-discript"><a target="_blank" href="${prodSnapUrl}${orderItem.orderItemId}/"><c:out value="${orderItem.prodTitle}" /></a></p>
											<p class="o-property">
												<c:forEach items="${orderItem.specNames}" var="specName">
													<span><c:out value="${specName.key}" />:<c:out value="${specName.value}" /></span>
												</c:forEach>
											</p>
										</dd>
									</dl>
								</td>
								<td><b><fmt:formatNumber pattern="0.00" value="${orderItem.transPrice}" /></b></td>
								<td>${orderItem.num}</td>
								<c:if test="${status.count == 1}">
									<td rowspan="${fn:length(order.orderItems)}" class="bL o-descrip">
										<ul>
											<li>订单金额：<span><b><fmt:formatNumber pattern="￥0.00" value="${order.orderFee}" /></b></span></li>
											<li>配送方式：<span>快递</span></li>
											<li>买家留言：<span><c:out value="${order.userRemark}"></c:out></span></li>
										</ul>
									</td>
								</c:if>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				<!--table end-->
				<form id="sendForm" action="${ctx}/order/send" method="post">
				<h3>确认发货信息<a href="${ctx}/order/storeShipAddr">管理发货地址</a></h3>
				<div class="mod-message">
					<div class="bd">
						<div class="meg"><i class="icon i-horn"></i>如果您的发货地址有变更，请及时修改，以免延误物流发货。
						</div>
					</div>
				</div>
				<div  class="deliverMeg clamMeg">
					<ul>
						<c:forEach items="${ssAddrs}" var="ssAddr">
							<c:choose>
								<c:when test="${ssAddr.isDefault == '1'}">
									<li class="on">
								</c:when>
								<c:otherwise>
									<li>
								</c:otherwise>
							</c:choose>
								<p>
									<c:choose>
										<c:when test="${ssAddr.isDefault == '1'}">
											<a>默认地址</a>
										</c:when>
										<c:otherwise>
											<a name="setDefault" href="javascript:;">设为默认</a>
										</c:otherwise>
									</c:choose>
									<input type="radio" ssAddrId="${ssAddr.sSAId}" name="fetchAddr" class="rdo" <c:if test="${ssAddr.isDefault == '1'}" >checked="checked"</c:if> />物流取货地址：
									<c:out value="${ssAddr.provinceName}${ssAddr.cityName}${ssAddr.districtName}${ssAddr.townName}"></c:out>
									<c:out value="${ssAddr.addr}" />（<c:out value="${ssAddr.zipCode}" />）
									<span><c:out value="${ssAddr.linker}" />&nbsp; <c:choose>
												<c:when test="${ssAddr.mobile != null}">
													${ssAddr.mobile}
												</c:when>
												<c:otherwise>
													${ssAddr.tel}
												</c:otherwise>
											</c:choose>
									</span>
								</p>
							</li>
						</c:forEach>
					</ul>
				</div>
				<h3 class="checkCompty">选择物流公司</h3>
				<dl class="defaultCom">
					<dt>默认物流公司：</dt>
					<dd>
						<div  class="deliverMeg">
							<c:forEach items="${logisticses}" var="logistics">
								<span class="item">
									<input name="logistics" id="${logistics.logisticsCompId}" <c:if test="${logistics.logisticsCompName == '一网全城EMS快递'}">checked="checked"</c:if> class="rdo" type="radio">
									<label for="${logistics.logisticsCompId}"><c:out value="${logistics.logisticsCompName}"></c:out></label>
								</span>
							</c:forEach>
						</div>
						<p><input type="button" name="send" class="btnB" value="发货"></p>
					</dd>
				</dl>
				</form>
			</c:if>
			</div>
			<!-- deliverOption end -->
		</div>
		<!-- content end -->
	</body>
</html>
					
