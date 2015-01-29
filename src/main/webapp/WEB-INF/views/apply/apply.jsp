<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/common/common.jsp"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="Cache-Control" content="no-cache,must-revalidate">
<title>卖家申请-阿凡达</title>
</head>
<body>
	<link rel="stylesheet" href="${cssUrl}/css/join.css?t=20150129" />
	<link rel="stylesheet" href="${ctx}/uploadify/uploadify.css?t=20150129" />
	<script type="text/javascript">
		var ctx = '${ctx}';
		var imgUploadUrl = '${imgUploadUrl}';
		var imgGetUrl = '${my:random(imgGetUrl)}';
	</script>	
	<script type="text/javascript" src="${ctx}/uploadify/jquery.uploadify.min.js?t=20150129"></script>
	<script type="text/javascript" src="${jsUrl}/apply.js?t=20150129"></script>

	<div class="wrap">
				<!-- auditStep -->
				<div class="auditStep">
					<h2>商家入驻</h2>
					<ul class="mod-step">
						<li class="now">
							<i class="disc">1</i>
							<span class="strip"></span>
							<p class="text">提交申请</p>
						</li>
						<li class="">
							<i class="disc">2</i>
							<span class="strip"></span>
							<p class="text">入驻审核</p>
						</li>
						<li class="last">
							<i class="disc"></i>
							<span class="strip"></span>
							<p class="text">完成入驻</p>
						</li>
					</ul>
				</div>
				<!-- auditStep end -->
				<!-- joinAplly -->
				<div class="joinAplly">
					<form class="form form-join" method="post" action="applySubmit">
						<c:if test="${!empty(audit.auditOpinion)}">
						<div class="mod-tips">
							<dl>
								<dt class="imgIcon"><i class="icon i-danger"></i></dt>
								<dd>
									<p><c:out value="${(audit.auditOpinion)}"/></p>
								</dd>
							</dl>
						</div>
						</c:if>
						<fieldset>
							<div class="legend"><h3>企业信息<span>用于入驻资料的审核，请填写与公司营业执照一致的信息</span></h3></div>
							<div class="form-item">
								<div class="item-label"><label><em>*</em>公司名称：</label></div>
								<div class="item-cont">
									<input type="text" class="txt lg w-xl" autocomplete="off" maxlength="30"  id="coName" name="coName"
								 			value="${fn:escapeXml(data.coName)}" data-describedby="coName_msg" data-required="true" data-description="coName" data-pattern="\S">
									<div class="note errTxt" id="coName_msg"></div>
								</div>
							</div>
							<div class="form-item">
								<div class="item-label"><label><em>*</em>营业执照注册号：</label></div>
								<div class="item-cont">
									<input type="text" class="txt lg w-lgl" autocomplete="off" maxlength="50"  id="coBln" name="coBln"
								 			value="${fn:escapeXml(data.coBln)}" data-describedby="coBln_msg" data-required="true" data-description="coBln">
									<div class="note errTxt" id="coBln_msg"></div>
								</div>
							</div>
							<div class="form-item">
								<div class="item-label"><label><em>*</em>法人姓名：</label></div>
								<div class="item-cont">
									<input type="text" class="txt lg w-lg" autocomplete="off" maxlength="15"  id="lpName" name="lpName"
								 			value="${fn:escapeXml(data.lpName)}" data-describedby="lpName_msg" data-required="true" data-description="lpName">
									<div class="note errTxt" id="lpName_msg"></div>
								</div>
							</div>
							<div class="form-item">
								<div class="item-label"><label><em>*</em>注册资本：</label></div>
								<div class="item-cont">
									<input type="text" class="txt lg w-lg" autocomplete="off" maxlength="10"  id="registerCapital" name="registerCapital"
								 			value="${fn:escapeXml(data.registerCapital)}" data-describedby="registerCapital_msg" data-required="true" data-description="registerCapital"><span class="note">/ 万元</span>
									<div class="note errTxt" id="registerCapital_msg"></div>
								</div>
							</div>
							<div class="form-item">
								<div class="item-label"><label><em>*</em>经营范围：</label></div>
								<div class="item-cont">
									<textarea name="bizScope" id="bizScope" cols="60" rows="5" class="resize-none" placeholder="请填写营业执照上的经营范围" style="width: 420px;height: 80px"
										data-describedby="bizScope_msg" data-required="true" data-description="bizScope"><c:out value="${data.bizScope}"/></textarea>
									<div class="note errTxt" id="bizScope_msg"></div>
								</div>
							</div>
							<div class="form-item">
								<div class="item-label"><label><em>*</em>营业期限：</label></div>
								<div class="item-cont">
									<div class="txt-section">
										<input type="text" class="txt txt-date" onfocus="WdatePicker()" name="btStartDate" id="btStartDate"><i>到</i>
										<input type="text" class="txt txt-date"  onfocus="WdatePicker()"  name="btEndDate" id="btEndDate"></div><span class="note">长期有效的可不填结束日期</span>
									<div class="note errTxt" id="btDate_msg"></div>
								</div>
							</div>
							<div class="form-item">
								<div class="item-label"><label>营业执照所在地：</label></div>
								<div class="item-cont"><input type="text" class="txt lg w-lgl" id="btGeo" name="btGeo" maxlength="10"></div>
							</div>
							<div class="form-item">
								<div class="item-label"><label>旗下／代理品牌：</label></div>
								<div class="item-cont"><textarea name="coBrand" id="coBrand" cols="60" rows="5" class="resize-none" placeholder="请填写品牌名称，多个可用,分隔" style="width: 420px;height: 60px"></textarea></div>
							</div>
						</fieldset>
						<fieldset class="papersUpload">
							<div class="legend"><h3>资料上传<span>仅支持JPG／GIF／PNG格式的图片，大小不超过1M</span></h3></div>
							<table class="table table-line table-left">
								<colgroup>
									<col width="170" />
									<col width="500" />
									<col width="80" />
									<col width="380" />
								</colgroup>
								<tbody>
									<tr>
										<td class="table-right">
											<p><em class="textMark warnColor">*</em>营业执照副本扫描件：</p>
											<p class="lightColor">（需加盖公司公章）</p>
										</td>
										<td>
											<div class="mod-upload">
												<img src="${cssUrl}/img/upload_img.jpg" alt="" id="imgBtImg">
												<input type="hidden" id="btImg" name="btImg" value="${data.btImg}" data-required="true" data-describedby="btImg_msg" data-description="btImg">
												<div class="note errTxt" id="btImg_msg"></div>
												<a id="uploadBtImg">upload</a>
											</div>
										</td>
										<td class="table-right">
											<p>示例：</p>
										</td>
										<td>
											<div class="mod-UploadPreview">
												<div class="imgBox"><img src="${cssUrl}/img/temp/zhengjian.png" alt="" class=""></div>
											</div>
										</td>
									</tr>
									<tr>
										<td class="table-right">
											<p><em class="textMark warnColor">*</em>组织机构代码电子版：</p>
											<p class="lightColor">（需加盖公司公章）</p>
										</td>
										<td>
											<div class="mod-upload">
												<img src="${cssUrl}/img/upload_img.jpg" alt="">
											</div>
										</td>
										<td class="table-right">
											<p>示例：</p>
										</td>
										<td>
											<div class="mod-UploadPreview">
												<div class="imgBox"><img src="${cssUrl}/img/temp/zhengjian.png" alt="" class=""></div>
											</div>
										</td>
									</tr>
									<tr>
										<td class="table-right">
											<p><em class="textMark warnColor">*</em>税务登记证电子版：</p>
											<p class="lightColor">（需加盖公司公章）</p>
										</td>
										<td>
											<div class="mod-upload">
												<img src="${cssUrl}/img/upload_img.jpg" alt="">
											</div>
										</td>
										<td class="table-right">
											<p>示例：</p>
										</td>
										<td>
											<div class="mod-UploadPreview">
												<div class="imgBox"><img src="${cssUrl}/img/temp/zhengjian.png" alt="" class=""></div>
											</div>
										</td>
									</tr>
									<tr>
										<td class="table-right">
											<p><em class="textMark warnColor">*</em>银行开户许可证电子版：</p>
											<p class="lightColor">（需加盖公司公章）</p>
										</td>
										<td>
											<div class="mod-upload">
												<img src="${cssUrl}/img/upload_img.jpg" alt="">
											</div>
										</td>
										<td class="table-right">
											<p>示例：</p>
										</td>
										<td>
											<div class="mod-UploadPreview">
												<div class="imgBox"><img src="${cssUrl}/img/temp/zhengjian.png" alt="" class=""></div>
											</div>
										</td>
									</tr>
								</tbody>
							</table>
						</fieldset>
						<fieldset>
							<div class="legend"><h3>联系人信息<span>用于入驻过程中接收入驻通知，请务必正确填写。</span></h3></div>
							<div class="form-item">
								<div class="item-label"><label><em>*</em>联系人姓名：</label></div>
								<div class="item-cont"><input type="text" class="txt lg w-lg"></div>
							</div>
							<div class="form-item">
								<div class="item-label"><label><em>*</em>联系人手机号码：</label></div>
								<div class="item-cont"><input type="text" class="txt lg w-lgl"></div>
							</div>
							<div class="form-item">
								<div class="item-label"><label>联系人固定电话：</label></div>
								<div class="item-cont">
									<div class="txt-tel">
										<input type="text" class="txt lg telArea"><i>-</i><input type="text" class="txt lg telNum"><i>-</i><input type="text" class="txt lg telExt">
									</div>
								</div>
							</div>
							<div class="form-item">
								<div class="item-label"><label>传真号码：</label></div>
								<div class="item-cont">
									<div class="txt-tel">
										<input type="text" class="txt lg telArea"><i>-</i><input type="text" class="txt lg telNum"><i>-</i><input type="text" class="txt lg telExt">
									</div>
								</div>
							</div>
							<div class="form-item">
								<div class="item-label"><label><em>*</em>电子邮箱：</label></div>
								<div class="item-cont"><input type="text" class="txt lg w-lgl"></div>
							</div>
							<div class="form-item">
								<div class="item-label"><label class="hide">入驻协议：</label></div>
								<div class="item-cont"><label><input type="checkbox" class="chk" checked="checked" />我已阅读并同意<a href="#" target="_blank">《阿凡达商家入驻条款》</a></label></div>
							</div>
							<div class="form-item">
								<div class="item-label"><label class="hide">提交入驻申请：</label></div>
								<div class="item-cont"><input type="button" class="btn btn-primary xl p-xl" value="提交入驻申请" /></div>
							</div>
						</fieldset>
					</form>
				</div>
				<!-- joinAplly end -->
			</div>
	
</body>
</html>