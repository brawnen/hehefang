<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/common/common.jsp"%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8" />
	<title>卖家|开票信息</title>
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
					<h2>开票信息</h2>
				</div>
				<!-- mainCaption end -->
				<div class="section">
					<!-- form -->
					<form class="form form-helper">
						<div class="mod-tips">
							<dl>
								<dt class="imgIcon"><i class="icon i-dangerSM"></i></dt>
								<dd>
									<p>开票信息请勿必准确，以免影响发票的办理；请有疑问，请与阿凡达客服联系，咨询电话：xxx-xxxxxxxx</p>
								</dd>
							</dl>
						</div>
						<fieldset>
							<div class="legend"><h3>开票信息</h3></div>
							<div class="form-item">
								<div class="item-label"><label><em>*</em>单位全称：</label></div>
								<div class="item-cont">
									<span>浙江永康电子商务有限公司</span>
								</div>
							</div>
							<div class="form-item">
								<div class="item-label"><label><em>*</em>公司税号：</label></div>
								<div class="item-cont">
									<input type="text" class="txt lg w-lgl" />
									<div class="note errTxt">错误信息</div>
								</div>
							</div>
							<div class="form-item">
								<div class="item-label"><label><em>*</em>公司注册地址：</label></div>
								<div class="item-cont">
									<input type="text" class="txt lg w-xl" />
								</div>
							</div>
							<div class="form-item">
								<div class="item-label"><label><em>*</em>公司注册电话：</label></div>
								<div class="item-cont">
									<div class="txt-tel">
										<input type="text" class="txt lg telArea"><i>-</i><input type="text" class="txt lg telNum"><i>-</i><input type="text" class="txt lg telExt">
									</div>
								</div>
							</div>
							<div class="form-item">
								<div class="item-label"><label><em>*</em>开户行：</label></div>
								<div class="item-cont">
									<input type="text" class="txt lg w-lgl" />
								</div>
							</div>
							<div class="form-item">
								<div class="item-label"><label><em>*</em>银行账号：</label></div>
								<div class="item-cont">
									<input type="text" class="txt lg w-lgl" />
								</div>
							</div>
							<div class="form-item">
								<div class="item-label"><label><em>*</em>发票类型：</label></div>
								<div class="item-cont">
									<select name="" id="" class="select">
										<option value="1">一般纳税人</option>
										<option value="2">小规模纳税人</option>
									</select>
								</div>
							</div>
							<div class="form-item">
								<div class="item-label">
									<label><em>*</em>税务登记证：</label>
									<p class="lightColor">（需加盖公司公章）</p>
								</div>
								<div class="item-cont">
									<div class="mod-upload">
										<img src="img/upload_img.jpg" alt="">
									</div>
								</div>
							</div>
							<div class="form-item">
								<div class="item-label">
									<label><em>*</em>一般纳税人资质证明：</label>
									<p class="lightColor">（需加盖公司公章）</p>
								</div>
								<div class="item-cont">
									<div class="mod-upload">
										<img src="img/upload_img.jpg" alt="">
									</div>
								</div>
							</div>
						</fieldset>
						<fieldset>
							<div class="legend"><h3>收票人信息</h3></div>
							<div class="form-item">
								<div class="item-label"><label><em>*</em>收件人姓名：</label></div>
								<div class="item-cont">
									<input type="text" class="txt lg w-lgl" />
								</div>
							</div>
							<div class="form-item">
								<div class="item-label"><label><em>*</em>收件人电话：</label></div>
								<div class="item-cont">
									<input type="text" class="txt lg w-lgl" />
								</div>
							</div>
							<div class="form-item">
								<div class="item-label"><label><em>*</em>收件地址：</label></div>
								<div class="item-cont">
									<input type="text" class="txt lg w-xl" />
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