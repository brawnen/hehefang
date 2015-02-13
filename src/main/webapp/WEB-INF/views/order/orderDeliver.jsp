<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@include file="/common/common.jsp"%>
<html>
	<head>
		<title>订单跟踪-一网全城</title>
	</head>
	<body>
		<script>
			$(function() {
				$("input[name=query]").bind("click",function(){
					var orderId = $("input[name=orderId]").val();
					if(!orderId){
						tipsWindown("提示信息","issue:请输入订单号！","","1");
						$("input[name=orderId]").focus();
						return false;
					}
					
					if(!/^\d+$/.exec(orderId)){
						tipsWindown("提示信息","issue:请正确输入订单号！","","1");
						$("input[name=orderId]").select();
						return false;
					}
					$("#query").submit();
				});
				if(!!"${order}" && !!"${order.awbNo}"){
					$.getJSON(
							"${ctx}/order/getEmsTrace",
							{emsNo: "${order.awbNo}"},
	//						{emsNo: "1018101740908"},
							function(data){
								if(!!data){
									var json;
									if(!!data["traces"]) {
										json = data;
									} else {
										json = $.parseJSON(data);	
									}							
									var count = json["traces"].length;
									if(0 != count){
										var htmlText = "<tr>\n"
												+ "<td>物流跟踪：</td>\n"
												+ "<td>";
										for (var i=0; i<count; i++){
											htmlText += "<p>"
												+ json["traces"][i]["acceptTime"] 
												+ "&nbsp" + json["traces"][i]["acceptAddress"]
												+ "&nbsp" + json["traces"][i]["remark"]
												+ "</p>\n";
										}
										htmlText += "</td>\n" + "</tr>";
										$("div.logistics table tbody").append(htmlText);
										$("div.logistics table tbody tr:last td:last p:last").addClass("newest");
									}
								}
							}
						);
				}
			});
		</script>
		<!-- content -->
		<div id="content">
			<!-- crumbs -->
			<div class="crumbs">
				<ul>
					<li><a href="${ctx}/store/main">卖家中心</a>&gt;</li>
					<li><strong>订单跟踪</strong></li>
				</ul>
			</div>
			<!-- crumbs end -->
			<!-- mod-message -->
			<div class="mod-message mod-tracking">
				<div class="bd">
					<div class="meg"><i class="icon i-horn"></i>输入您店铺中已发货订单的订单号即可查询订单的物流信息
					</div>
				</div>
			</div>
			<!-- mod-message end -->
			<!-- logisticsInfo -->
			<div class="logisticsInfo orderTracking">
				<!-- mod-info -->
				<div class="mod-info">
					<div class="item track-item">
						<form id="query" action="${ctx}/order/queryOrderDeliver" method="post">
							<dl>
								<dt class="item-label"><label>订单编号：</label></dt>
								<dd class="item-cont"><input name="orderId" type="text" value="${order.orderId}" class="txt textA"></dd>
							</dl>
							<div class="searchBtn">
								<input type="button" name="query" class="btn btn-s" value="查&nbsp;&nbsp;询">
							</div>
						</form>
					</div><!-- item end -->
					<c:choose>
						<c:when test="${order != null && order.orderStatus=='5'}">
							<div class="track-hd">
								<h1>物流信息</h1>
							</div>
							<div class="item logistics">
								<table>
									<colgroup>
										<col width="62" />
										<col />
									</colgroup>
									<tbody>
										<tr>
											<td>配送方式：</td>
											<td>快递</td>
										</tr>
										<tr>
											<td>物流公司：</td>
											<td><c:out value="${order.logisticsName}" /></td>
										</tr>
										<tr>
											<td>运单号码：</td>
											<td><c:out value="${order.awbNo}" /></td>
										</tr>
									</tbody>
								</table>
							</div><!-- item end -->
						</c:when>
						<c:otherwise>
							<div class="track-hd">
								<h1>物流信息</h1>
							</div>
							<div class="item item-empty">
								<p>暂无物流信息</p>
							</div>
						</c:otherwise>
					</c:choose>
				</div>
				<!-- mod-info end -->
				<c:if test="${order != null && order.orderStatus=='5'}">
				<!-- hintBar -->
				<div class="hintBar order-hintBar"><i class="icon i-bulb"></i>以上信息由物流公司提供，如无跟踪信息或有疑问，请查询<a target="_blank" href="http://www.ems.com.cn">EMS官方网站</a>或联系其公示电话</div>
				<!-- hintBar end -->
				</c:if>
			</div>
			<!-- logisticsInfo end -->
		</div>
		<!-- content end -->
	</body>
</html>



