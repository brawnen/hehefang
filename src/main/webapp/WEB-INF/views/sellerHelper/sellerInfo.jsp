<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/common/common.jsp"%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8" />
	<title>卖家|基本信息</title>
</head>
<body>
	<link rel="stylesheet" href="${cssUrl}/css/helper.css" />
	<div class="wrapper wrap-helper">
		<!-- container -->
		<div id="container">
			<div id="main">
				<!-- mainCaption -->
				<div class="mainCaption">
					<h2>基本信息</h2>
				</div>
				<!-- mainCaption end -->
				<div class="section">
					<!-- form -->
					<form class="form form-helper">
						<fieldset>
							<div class="legend"><h3>商家信息</h3></div>
							<div class="form-item">
								<div class="item-label"><label>公司名称：</label></div>
								<div class="item-cont">
									<span>浙江永康电子商务有限公司</span>
								</div>
							</div>
							<div class="form-item">
								<div class="item-label"><label>营业执照注册号：</label></div>
								<div class="item-cont">
									<span>1863567210343113</span>
								</div>
							</div>
							<div class="form-item">
								<div class="item-label"><label>法人姓名：</label></div>
								<div class="item-cont">
									<span>徐无主</span>
								</div>
							</div>
							<div class="form-item">
								<div class="item-label"><label>注册资本：</label></div>
								<div class="item-cont">
									<span>50,000 / 万元</span>
								</div>
							</div>
							<div class="form-item">
								<div class="item-label"><label>经营范围：</label></div>
								<div class="item-cont">
									<span>一般经营项目：销售花卉，服装，鞋帽，首饰，针纺织品，文具用品等</span>
								</div>
							</div>
							<div class="form-item">
								<div class="item-label"><label>营业期限：</label></div>
								<div class="item-cont">
									<span>2013-10-12 至 2017-12-31</span>
								</div>
							</div>
							<div class="form-item">
								<div class="item-label"><label>营业执照所在地：</label></div>
								<div class="item-cont">
									<span>浙江省</span>
								</div>
							</div>
							<div class="form-item">
								<div class="item-label"><label>入驻时间：</label></div>
								<div class="item-cont">
									<span>2014-05-15 12:39:23</span>
								</div>
							</div>
						</fieldset>
						<fieldset>
							<div class="legend"><h3>联系人信息</h3></div>
							<div class="form-item">
								<div class="item-label"><label>联系人姓名：</label></div>
								<div class="item-cont">
									<span>洪大</span>
								</div>
							</div>
							<div class="form-item">
								<div class="item-label"><label>联系人手机号码：</label></div>
								<div class="item-cont">
									<span>13646637489</span>
								</div>
							</div>
							<div class="form-item">
								<div class="item-label"><label>联系人固写电话：</label></div>
								<div class="item-cont">
								</div>
							</div>
							<div class="form-item">
								<div class="item-label"><label>传真号码：</label></div>
								<div class="item-cont">
								</div>
							</div>
							<div class="form-item">
								<div class="item-label"><label>电子邮箱：</label></div>
								<div class="item-cont">
									<span>shyiyp@ankang.com</span>
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
	function checkFromData(){
		var ret = true;
		
		var payeeName = $('input[name=payeeName]'),bankAcctNo = $('input[name=bankAcctNo]'),branchName = $('input[name=branchName]'),branchAddress = $('input[name=branchAddress]');
	
		if(!payeeName.val()){
			payeeName.siblings().eq(1).text('收款单位全称不能为空！');
			ret = false;
		}else{
			payeeName.siblings().eq(1).text('');	
		}
		
		if(!bankAcctNo.val()){
			bankAcctNo.next().text('收款账号不能为空！');
			ret = false;
		}else{
			bankAcctNo.next().text('');
		}
		
		if(!branchName.val()){
			branchName.next().text('收款账户开户行不能为空！');
			ret = false;
		}else{
			branchName.next().text('');
		}
		
		if(!branchAddress.val()){
			branchAddress.siblings().eq(1).text('开户行所在地不能为空！');
			ret = false;
		}else{
			branchAddress.siblings().eq(1).text('');
		}
		
		return ret;
	}
	
	$(function(){
		$('#savePayee').bind('click',function(){
			if (!checkFromData()) {
				return false;
			}else{
				$.ajax({
					url : "${ctx }/helper/savePayee",
					data : $('#payeeForm').serialize(),
					type : "post",
					cache : false,
					async : false,
					success : function(data) {
						if (data > 0) {
							popWindown("修改成功","submit:收款银行账户资料修改成功！","","1");
						}else {
							popWindown("保存失败","issue:网络连接异常，请联系网络管理员！","","1");
							return;
						}
					}
				});
			}
		});
		
	});
	

	</script>
</body>
</html>