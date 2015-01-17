<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/common/common.jsp"%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8" />
	<title>卖家|发布商品</title>
	<link rel="stylesheet" href="${ctx }/static/css/product.css" />
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
				<!-- issueProduct -->
				<div class="issueProduct">
					<form class="form" id="publishForm" action="${ctx}/product/save" >
						<fieldset>
							<div class="legend">填写商品信息</div>
							<div class="form-item">
								<div class="item-label"><label><em>*</em>商品类目：</label></div>
								<div class="item-cont">
									<span class="categoryTxt">靓丽女装<em>&gt;</em>应季女装<em>&gt;</em>羊绒衫</span><input type="button" class="btn btn-def" value="修改" />
								</div>
							</div>
							<div class="form-item">
								<div class="item-label"><label><em>*</em>商品标题：</label></div>
								<div class="item-cont"><input type="text" class="txt lg w-xl" id="title" name="title" onblur="publish.validateTitle()"><span class="note">还可输入<b>30</b>个字!</span></div>
							</div>
							<div class="form-item">
								<div class="item-label"><label>商品卖点：</label></div>
								<div class="item-cont"><input type="text" class="txt lg w-xl" id="subtitle" name="subtitle" ></div>
							</div>
							<div class="form-item">
								<div class="item-label"><label><em>*</em>货号：</label></div>
								<div class="item-cont"><input type="text" class="txt lg w-lg" id="artNo" name="artNo" ><span class="note">12-16位数字/字母</span></div>
							</div>
							<div class="form-item">
								<div class="item-label"><label><em>*</em>品牌：</label></div>
								<div class="item-cont">
									<select id="brand" name="brand" class="select">
										<option value="0">请选择品牌</option>
										<option value="1">361</option>
									</select>
								</div>
							</div>
							<div class="form-item">
								<div class="item-label"><label><em>*</em>产地：</label></div>
								<div class="item-cont"><input type="text" class="txt lg" id="origin" name="origin" ></div>
							</div>
							<div class="form-item">
								<div class="item-label"><label><em>*</em>材质：</label></div>
								<div class="item-cont"><input type="text" class="txt lg w-lg" id="material" name="material" ></div>
							</div>
							<div class="form-item">
								<div class="item-label"><label><em>*</em>款式：</label></div>
								<div class="item-cont">
									<div class="mod-attrChk">
										<ul>
											<li>
												<label><input type="checkbox" class="chk">
												露背</label>
											</li>
											<li>
												<label><input type="checkbox" class="chk">
												露背</label>
											</li>
											<li>
												<label><input type="checkbox" class="chk">
												露背</label>
											</li>
											<li>
												<label><input type="checkbox" class="chk">
												露背</label>
											</li>
											<li>
												<label><input type="checkbox" class="chk">
												露背</label>
											</li>
											<li>
												<label><input type="checkbox" class="chk">
												露背</label>
											</li>
											<li>
												<label><input type="checkbox" class="chk">
												露背</label>
											</li>
											<li>
												<label><input type="checkbox" class="chk">
												露背</label>
											</li>
											<li>
												<label><input type="checkbox" class="chk">
												露背</label>
											</li>
										</ul>
									</div>
								</div>
							</div>
							<div class="form-item item-color">
								<div class="item-label"><label>颜色：</label></div>
								<div class="item-cont">
									<div class="mod-attrChk">
										<ul>
											<li>
												<input type="checkbox" class="chk">
												<img src="${ctx }/static/img/temp/color1.jpg" alt="" class="colorBlock">
												<label class="hide">军绿色</label>
												<input type="text" class="txt show-iblock">
											</li>
											<li>
												<input type="checkbox" class="chk">
												<img src="${ctx }/static/img/temp/color1.jpg" alt="" class="colorBlock">
												<label class="">天蓝色</label>
												<input type="text" class="txt">
											</li>
											<li>
												<input type="checkbox" class="chk">
												<img src="${ctx }/static/img/temp/color1.jpg" alt="" class="colorBlock">
												<label class="">巧克力色</label>
												<input type="text" class="txt">
											</li>
											<li>
												<input type="checkbox" class="chk">
												<img src="${ctx }/static/img/temp/color1.jpg" alt="" class="colorBlock">
												<label class="">桔色</label>
												<input type="text" class="txt">
											</li>
											<li>
												<input type="checkbox" class="chk">
												<img src="${ctx }/static/img/temp/color1.jpg" alt="" class="colorBlock">
												<label class="">浅灰色</label>
												<input type="text" class="txt">
											</li>
											<li>
												<input type="checkbox" class="chk">
												<img src="${ctx }/static/img/temp/color1.jpg" alt="" class="colorBlock">
												<label class="">浅绿色</label>
												<input type="text" class="txt">
											</li>
											<li>
												<input type="checkbox" class="chk">
												<img src="${ctx }/static/img/temp/color1.jpg" alt="" class="colorBlock">
												<label class="">浅黄色</label>
												<input type="text" class="txt">
											</li>
											<li>
												<input type="checkbox" class="chk">
												<img src="${ctx }/static/img/temp/color1.jpg" alt="" class="colorBlock">
												<label class="">深卡其布色</label>
												<input type="text" class="txt">
											</li>
											<li>
												<input type="checkbox" class="chk">
												<img src="${ctx }/static/img/temp/color1.jpg" alt="" class="colorBlock">
												<label class="">深灰色</label>
												<input type="text" class="txt">
											</li>
											<li>
												<input type="checkbox" class="chk">
												<img src="${ctx }/static/img/temp/color1.jpg" alt="" class="colorBlock">
												<label class="">深紫色</label>
												<input type="text" class="txt">
											</li>
											<li>
												<input type="checkbox" class="chk">
												<img src="${ctx }/static/img/temp/color1.jpg" alt="" class="colorBlock">
												<label class="">深蓝色</label>
												<input type="text" class="txt">
											</li>
											<li>
												<input type="checkbox" class="chk">
												<img src="${ctx }/static/img/temp/color1.jpg" alt="" class="colorBlock">
												<label class="">白色</label>
												<input type="text" class="txt">
											</li>
											<li>
												<input type="checkbox" class="chk">
												<img src="${ctx }/static/img/temp/color1.jpg" alt="" class="colorBlock">
												<label class="">粉红色</label>
												<input type="text" class="txt">
											</li>
											<li>
												<input type="checkbox" class="chk">
												<img src="${ctx }/static/img/temp/color1.jpg" alt="" class="colorBlock">
												<label class="">紫罗兰</label>
												<input type="text" class="txt">
											</li>
											<li>
												<input type="checkbox" class="chk">
												<img src="${ctx }/static/img/temp/color1.jpg" alt="" class="colorBlock">
												<label class="">紫色</label>
												<input type="text" class="txt">
											</li>
											<li>
												<input type="checkbox" class="chk">
												<img src="${ctx }/static/img/temp/color1.jpg" alt="" class="colorBlock">
												<label class="">红色</label>
												<input type="text" class="txt">
											</li>
											<li>
												<input type="checkbox" class="chk">
												<img src="${ctx }/static/img/temp/color1.jpg" alt="" class="colorBlock">
												<label class="">绿色</label>
												<input type="text" class="txt">
											</li>
											<li>
												<input type="checkbox" class="chk">
												<img src="${ctx }/static/img/temp/color1.jpg" alt="" class="colorBlock">
												<label class="">花色</label>
												<input type="text" class="txt">
											</li>
											<li>
												<input type="checkbox" class="chk">
												<img src="${ctx }/static/img/temp/color1.jpg" alt="" class="colorBlock">
												<label class="">蓝色</label>
												<input type="text" class="txt">
											</li>
											<li>
												<input type="checkbox" class="chk">
												<img src="${ctx }/static/img/temp/color1.jpg" alt="" class="colorBlock">
												<label class="">褐色</label>
												<input type="text" class="txt">
											</li>
											<li>
												<input type="checkbox" class="chk">
												<img src="${ctx }/static/img/temp/color1.jpg" alt="" class="colorBlock">
												<label class="">透明色</label>
												<input type="text" class="txt">
											</li>
											<li>
												<input type="checkbox" class="chk">
												<img src="${ctx }/static/img/temp/color1.jpg" alt="" class="colorBlock">
												<label class="">酒红色</label>
												<input type="text" class="txt">
											</li>
											<li>
												<input type="checkbox" class="chk">
												<img src="${ctx }/static/img/temp/color1.jpg" alt="" class="colorBlock">
												<label class="">黄色</label>
												<input type="text" class="txt">
											</li>
											<li>
												<input type="checkbox" class="chk">
												<img src="${ctx }/static/img/temp/color1.jpg" alt="" class="colorBlock">
												<label class="">黑色</label>
												<input type="text" class="txt">
											</li>
										</ul>
									</div>
								</div>
							</div>
							<div class="form-item">
								<div class="item-label"><label>尺码：</label></div>
								<div class="item-cont">
									
									<div class="mod-attrChk">
										<ul>
											<li>
												<input type="checkbox" class="chk">
												<label class="hide">XXL</label>
												<input type="text" class="txt show-iblock">
											</li>
											<li>
												<input type="checkbox" class="chk">
												<label class="">XL</label>
												<input type="text" class="txt">
											</li>
											<li>
												<input type="checkbox" class="chk">
												<label class="">L</label>
												<input type="text" class="txt">
											</li>
										</ul>
									</div>
								</div>
							</div>
							<div class="form-item sku-attr">
								<div class="item-label"><label>SKU销售属性：</label></div>
								<div class="item-cont">
									<table class="table table-line">
										<colgroup>
											<col width="100" />
											<col width="100" />
											<col width="100" />
											<col width="100" />
											<col width="100" />
											<col width="" />
										</colgroup>
										<thead>
											<tr>
												<th>颜色</th>
												<th>尺码</th>
												<th>单价</th>
												<th>特卖价</th>
												<th>数量</th>
												<th>商家编码</th>
											</tr>
										</thead>
										<tbody>
											<tr>
												<td>红色</td>
												<td>XXL码</td>
												<td><input type="text" class="txt lg w-sm" /></td>
												<td><input type="text" class="txt lg w-sm" /></td>
												<td><input type="text" class="txt lg w-sm" /></td>
												<td><input type="text" class="txt lg" /></td>
											</tr>
											<tr>
												<td>红色</td>
												<td>XXL码</td>
												<td><input type="text" class="txt lg w-sm" /></td>
												<td><input type="text" class="txt lg w-sm" /></td>
												<td><input type="text" class="txt lg w-sm" /></td>
												<td><input type="text" class="txt lg" /></td>
											</tr>
											<tr>
												<td>红色</td>
												<td>XXL码</td>
												<td><input type="text" class="txt lg w-sm" /></td>
												<td><input type="text" class="txt lg w-sm" /></td>
												<td><input type="text" class="txt lg w-sm" /></td>
												<td><input type="text" class="txt lg" /></td>
											</tr>
										</tbody>
									</table>
								</div>
							</div>
							<div class="form-item">
								<div class="item-label"><label>SKU图片：</label></div>
								<div class="item-cont">
									<div class="uploadSKUImg">
										<div class="wrap">
											<span class="note warnColor">请使用白底图片，禁止出现拼接、水印、促销等信息；尺寸 800*800 px及以上，文件最大为500K</span>
											<ul>
												<li>
													<div class="mod-upload">
														<img src="${ctx }/static/img/upload_img.jpg" alt="" />
													</div>
													<p>颜色：雪纺点红</p>
													<div class="btnWrap"><input type="button" name="" id="" value="设为主图" class="btn btn-def" /></div>
												</li>
												<li>
													<div class="mod-upload">
														<img src="${ctx }/static/img/upload_img.jpg" alt="" />
													</div>
													<p>颜色：雪纺点红</p>
													<div class="btnWrap"><input type="button" name="" id="" value="设为主图" class="btn btn-def" /></div>
												</li>
												<li>
													<div class="mod-upload">
														<img src="${ctx }/static/img/asdsfd.jpg" alt="" class="loading" />
													</div>
													<p>颜色：雪纺点红</p>
													<div class="btnWrap"><input type="button" name="" id="" value="设为主图" class="btn btn-def" /></div>
												</li>
											</ul>
										</div>
									</div>
								</div>
							</div>
							<div class="form-item">
								<div class="item-label"><label><em>*</em>商品描述：</label></div>
								<div class="item-cont">
									<div class="editer">
										<img src="${ctx }/static/img/temp/editer1.jpg" alt="" width="750">
									</div>
								</div>
							</div>
							<div class="form-item">
								<div class="item-label"></div>
								<div class="item-cont">
									<input type="button" value="发 布" onclick="publish.saveProduct();" class="btn btn-primary lg p-lg">
									<input type="button" value="预 览" class="btn btn-bezelFree">
								</div>
							</div>
						</fieldset>
					</form>
				</div>
				<!-- issueProduct end  -->
			</div>
			<!-- main end -->
		</div>
		<!-- container end -->
	</div>
<script type="text/javascript" src="${ctx}/js/jquery-validate.min.js"></script>	
<script type="text/javascript" src="${ctx}/js/publish.js"></script>	
<script type="text/javascript">
	$(function(){
		publish = new publish();
		
	});
</script>
</body>
</html>