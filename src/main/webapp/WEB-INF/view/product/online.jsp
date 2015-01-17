<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/common/common.jsp"%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8" />
	<title>卖家|在售商品</title>
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
					<h2>我的商品</h2>
				</div>
				<!-- mainCaption end -->
				<!-- screening -->
				<div class="screening">
					<form class="form form-inline">
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
									<input type="text" class="txt w-lg" />
									<input type="button" class="btn btn-def" value="查&nbsp;&nbsp;询">
								</div>
							</div>
						</div>
						<div class="searchBtn"><a href="#" class="btn btn-def">发布新商品</a></div>
					</form>
				</div>
				<!-- screening end -->
				<!-- table -->
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
						<tr>
							<td>
								<div class="pro-img">
									<img src="${ctx }/static/img/temp/pro_img.jpg" alt="" />
								</div>
							</td>
							<td>GELKJ656</td>
							<td><p>沃格贝斯 2013秋装新款棉毛夹背心款棉毛夹背心款棉毛夹</p></td>
							<td>好孩子好孩子</td>
							<td>GELKJ6564S5FAFSF</td>
							<td>睡衣/睡裤/睡裙/睡衣套装</td>
							<td>¥198.00~198.00</td>
							<td>¥98.00~98.00</td>
							<td>2013/11/02 12:09</td>
							<td class="td-operate"><p><a href="#">修改</a>|<a href="#">删除</a></p></td>
						</tr>
						<tr>
							<td>
								<div class="pro-img">
									<img src="${ctx }/static/img/temp/pro_img.jpg" alt="" />
								</div>
							</td>
							<td>GELKJ656</td>
							<td><p>沃格贝斯 2013秋装新款棉毛夹背心款棉毛夹背心款棉毛夹</p></td>
							<td>好孩子好孩子</td>
							<td>GELKJ6564S5FAFSF</td>
							<td>睡衣/睡裤/睡裙/睡衣套装</td>
							<td>¥198.00~198.00</td>
							<td>¥98.00~98.00</td>
							<td>2013/11/02 12:09</td>
							<td class="td-operate"><p><a href="#">修改</a>|<a href="#">删除</a></p></td>
						</tr>
						<tr>
							<td>
								<div class="pro-img">
									<img src="${ctx }/static/img/temp/pro_img.jpg" alt="" />
								</div>
							</td>
							<td>GELKJ656</td>
							<td><p>沃格贝斯 2013秋装新款棉毛夹背心款棉毛夹背心款棉毛夹</p></td>
							<td>好孩子好孩子</td>
							<td>GELKJ6564S5FAFSF</td>
							<td>睡衣/睡裤/睡裙/睡衣套装</td>
							<td>¥198.00~198.00</td>
							<td>¥98.00~98.00</td>
							<td>2013/11/02 12:09</td>
							<td class="td-operate"><p><a href="#">修改</a>|<a href="#">删除</a></p></td>
						</tr>
						<tr>
							<td>
								<div class="pro-img">
									<img src="${ctx }/static/img/temp/pro_img.jpg" alt="" />
								</div>
							</td>
							<td>GELKJ656</td>
							<td><p>沃格贝斯 2013秋装新款棉毛夹背心款棉毛夹背心款棉毛夹</p></td>
							<td>好孩子好孩子</td>
							<td>GELKJ6564S5FAFSF</td>
							<td>睡衣/睡裤/睡裙/睡衣套装</td>
							<td>¥198.00~198.00</td>
							<td>¥98.00~98.00</td>
							<td>2013/11/02 12:09</td>
							<td class="td-operate"><p><a href="#">修改</a>|<a href="#">删除</a></p></td>
						</tr>
						<tr>
							<td>
								<div class="pro-img">
									<img src="${ctx }/static/img/temp/pro_img.jpg" alt="" />
								</div>
							</td>
							<td>GELKJ656</td>
							<td><p>沃格贝斯 2013秋装新款棉毛夹背心款棉毛夹背心款棉毛夹</p></td>
							<td>好孩子好孩子</td>
							<td>GELKJ6564S5FAFSF</td>
							<td>睡衣/睡裤/睡裙/睡衣套装</td>
							<td>¥198.00~198.00</td>
							<td>¥98.00~98.00</td>
							<td>2013/11/02 12:09</td>
							<td class="td-operate"><p><a href="#">修改</a>|<a href="#">删除</a></p></td>
						</tr>
						<tr>
							<td>
								<div class="pro-img">
									<img src="${ctx }/static/img/temp/pro_img.jpg" alt="" />
								</div>
							</td>
							<td>GELKJ656</td>
							<td><p>沃格贝斯 2013秋装新款棉毛夹背心款棉毛夹背心款棉毛夹</p></td>
							<td>好孩子好孩子</td>
							<td>GELKJ6564S5FAFSF</td>
							<td>睡衣/睡裤/睡裙/睡衣套装</td>
							<td>¥198.00~198.00</td>
							<td>¥98.00~98.00</td>
							<td>2013/11/02 12:09</td>
							<td class="td-operate"><p><a href="#">修改</a>|<a href="#">删除</a></p></td>
						</tr>
						<tr>
							<td>
								<div class="pro-img">
									<img src="${ctx }/static/img/temp/pro_img.jpg" alt="" />
								</div>
							</td>
							<td>GELKJ656</td>
							<td><p>沃格贝斯 2013秋装新款棉毛夹背心款棉毛夹背心款棉毛夹</p></td>
							<td>好孩子好孩子</td>
							<td>GELKJ6564S5FAFSF</td>
							<td>睡衣/睡裤/睡裙/睡衣套装</td>
							<td>¥198.00~198.00</td>
							<td>¥98.00~98.00</td>
							<td>2013/11/02 12:09</td>
							<td class="td-operate"><p><a href="#">修改</a>|<a href="#">删除</a></p></td>
						</tr>
						<tr>
							<td>
								<div class="pro-img">
									<img src="${ctx }/static/img/temp/pro_img.jpg" alt="" />
								</div>
							</td>
							<td>GELKJ656</td>
							<td><p>沃格贝斯 2013秋装新款棉毛夹背心款棉毛夹背心款棉毛夹</p></td>
							<td>好孩子好孩子</td>
							<td>GELKJ6564S5FAFSF</td>
							<td>睡衣/睡裤/睡裙/睡衣套装</td>
							<td>¥198.00~198.00</td>
							<td>¥98.00~98.00</td>
							<td>2013/11/02 12:09</td>
							<td class="td-operate"><p><a href="#">修改</a>|<a href="#">删除</a></p></td>
						</tr>
						<tr>
							<td>
								<div class="pro-img">
									<img src="${ctx }/static/img/temp/pro_img.jpg" alt="" />
								</div>
							</td>
							<td>GELKJ656</td>
							<td><p>沃格贝斯 2013秋装新款棉毛夹背心款棉毛夹背心款棉毛夹</p></td>
							<td>好孩子好孩子</td>
							<td>GELKJ6564S5FAFSF</td>
							<td>睡衣/睡裤/睡裙/睡衣套装</td>
							<td>¥198.00~198.00</td>
							<td>¥98.00~98.00</td>
							<td>2013/11/02 12:09</td>
							<td class="td-operate"><p><a href="#">修改</a>|<a href="#">删除</a></p></td>
						</tr>
						<tr>
							<td>
								<div class="pro-img">
									<img src="${ctx }/static/img/temp/pro_img.jpg" alt="" />
								</div>
							</td>
							<td>GELKJ656</td>
							<td><p>沃格贝斯 2013秋装新款棉毛夹背心款棉毛夹背心款棉毛夹</p></td>
							<td>好孩子好孩子</td>
							<td>GELKJ6564S5FAFSF</td>
							<td>睡衣/睡裤/睡裙/睡衣套装</td>
							<td>¥198.00~198.00</td>
							<td>¥98.00~98.00</td>
							<td>2013/11/02 12:09</td>
							<td class="td-operate"><p><a href="#">修改</a>|<a href="#">删除</a></p></td>
						</tr>
					</tbody>
				</table>
				<!-- table edn -->
				<!-- paging -->
				<div class="paging">
					<div class="pagingWrap">
						<div class="pagAll">共<span>4</span>条记录</div>
						<div class="pageup disabled"><a href="javascript:;"><i class="icon"></i>&nbsp;上一页</a></div>
						<ul>
							<li><span class="on">1</span></li>
							<li><a href="">2</a></li>
							<li><a href="">3</a></li>
							<li><a href="">4</a></li>
							<li><b>...</b></li>
							<li><a href="">100</a></li>
						</ul>
						<div class="pagedown"><a href="">下一页&nbsp;<i class="icon"></i></a></div>
						<div class="goto"><span>到第</span><input type="text" value="1"><span>页</span><button class="btn btn-def">确定</button></div>
					</div>
				</div>
				<!-- paging end -->
			</div>
			<!-- main end -->
		</div>
		<!-- container end -->
	</div>
</body>
</html>