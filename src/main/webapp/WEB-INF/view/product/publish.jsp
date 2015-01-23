<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/common/common.jsp"%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8" />
	<title>卖家|发布商品</title>
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
									<span class="categoryTxt">${pathName }</span><input type="button" class="btn btn-def" onclick="publish.modifyBc()" value="修改" />
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
							<c:if test="${!empty(bc.attrList)}">
								<c:forEach items="${bc.attrList}" var="attr">
								<div class="item-label">
									<c:choose>
										<c:when test="${attr.isRequire}">
											<label><em>*</em>${attr.attrName}：</label>
										</c:when>
										<c:otherwise>
											<label>${attr.attrName}：</label>
										</c:otherwise>
									</c:choose></div>
								<div class="item-cont">
									<div class="mod-attrChk">
										<c:choose>
											<c:when test="${attr.displayMode == 1 }">
												<select id="attrValue" name="attrValue" class="select">
													<option value=""></option>
													<c:forEach items="${attr.attrValueList }" var="attrV">
														<option value="${attrV.attrValueId }|${attrV.attrValue }|${attrV.isSubAttr ? 'true' : 'false'}">${attrV.attrValue }</option>
													</c:forEach>
												</select>
											</c:when>
											<c:otherwise>
												<ul>
												<c:forEach items="${attr.attrValueList }" var="attrV">
													<li><label><input type="checkbox" class="chk">${attrV.attrValue }</label></li>
												</c:forEach>
												</ul>
											</c:otherwise>
										</c:choose>
									</div>
								</div>
								</c:forEach>
							</c:if>	
							</div>
							<div class="form-item item-color">
								<c:if test="${!empty(bc.specList)}">
									<c:forEach items="${bc.specList}" var="spec">
									<div class="item-label"><label>${spec.specName }：</label></div>
									<div class="item-cont">
									<div class="mod-attrChk">
										<ul specId="${spec.specId}">
											<c:forEach items="${spec.specValueList }" var="specValue">
											<li>
												<input type="checkbox" class="chk" name="specValue" skuSpecName="${spec.specName}" skuSpecId="${spec.specId}" specValueId="${specValue.specValueId}" specOrder="${spec.displayOrder}" onchange="publish.generateSku(this)">
												<c:if test="${!empty(specValue.imgUrl)}">
													<img  name="colorIcon" colorName="${specValue.specValueName }"  src="${specValue.imgUrl }" alt="" class="colorBlock">
												</c:if>
												<label name="specValueTxt" >${specValue.specValueName }</label>
												<input type="text" class="txt" value="<c:out value='${specValue.specValueName}'/>">
											</li>
											</c:forEach>
										</ul>
									</div>
									</div>
									</c:forEach>
								</c:if>
							</div>
							<div class="form-item sku-attr">
								<div class="item-label"><label>SKU销售属性：</label></div>
 								<div class="item-cont" id="genSpec">
								</div> 
							</div>
					 	 	<div class="form-item">
								<div class="item-label"><label>SKU图片：</label></div>
								<div class="item-cont">
									<div class="uploadSKUImg">
										<div class="wrap">
											<span class="note warnColor">请使用白底图片，禁止出现拼接、水印、促销等信息；尺寸 800*800 px及以上，文件最大为500K</span>
											<ul id="skuImg">
										<%-- 		<li>
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
												</li> --%>
											</ul>
										</div>
									</div>
								</div>
							</div>
							<div class="form-item">
								<div class="item-label"><label><em>*</em>商品描述：</label></div>
								<div class="item-cont">
									<div class="editer">
										<textarea id="detail" name="detail" style="width: 800px; height: 400px;"></textarea>
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
<script type="text/javascript" src="${ctx}/js/kindeditor/kindeditor.js"></script>	
<script type="text/javascript" src="${ctx}/js/kindeditor/lang/zh_CN.js"></script>
<script type="text/javascript" src="${ctx}/js/publish.js"></script>	
<script type="text/javascript">
	$(function(){
		publish = new publish();
	});
</script>
</body>
</html>