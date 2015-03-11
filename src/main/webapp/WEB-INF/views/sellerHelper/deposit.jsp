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
					<h2>保证金</h2>
				</div>
				<!-- mainCaption end -->
				<div id="deposit">
					<div class="mod-tips">
						<dl>
							<dt class="imgIcon"><i class="icon i-danger"></i></dt>
							<dd>
								<h4>您公司保证金未缴纳 ！</h4>
								<p>您公司保证金审核未通过，因此暂时不能申请或管理“品牌专场”功能，请尽快完成缴费。</p>
							</dd>
						</dl>
					</div>
					<h3>如何缴纳保证金？</h3>
					<div class="textInfo">
						<p>目前我们接受线下打款的方式来缴纳保证金，你可以根据以下信息进行汇款，我们会在收到款后两个工作日内审核入账。</p>
						<div class="bankInfo">
							<p><strong>开户名：</strong>北京阿凡达科技有限公司</p>
							<p><strong>开户银行：</strong>招商银行股份有限公司北京中关村支行</p>
							<p><strong>银行账号：</strong>23716 8172 7271 7272 212</p>
						</div>
						<div class="note"><em class="textMark warnColor">*</em>保证金不接受个人帐号汇款！请务必使用企业对公帐号汇款，汇款备注为 “ <b>阿凡达保证金</b> ” ，以便核查。</div>
						<div class="note"><em class="textMark warnColor">*</em>阿凡达仅提供如上唯一的保证金收款账号，请勿相信其他任何个人或组织以任何方式提供的银行账号。</div>
					</div>
					<h3><a href="#" target="_blank">保证金收费标准</a></h3>
					<h3><a href="#" target="_blank">保证金管理规则</a></h3>
				</div>
			</div>
			<!-- main end -->
		</div>
		<!-- container end -->
	</div>
</body>
</html>