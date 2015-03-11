/**
 * Copyright (c)2013-2014 by www.yiwang.com. All rights reserved.
 * 
 */
package com.afd.seller.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.afd.constants.product.ProductConstants.BrandShow$Status;
import com.afd.model.seller.Seller;
import com.afd.seller.util.LoginUtils;
import com.afd.seller.util.LoginUtils.LoginInfo;
import com.afd.service.order.IOrderService;
import com.afd.service.order.IRetOrderService;
import com.afd.service.product.IBrandShowService;
import com.afd.service.product.IProductService;
import com.afd.service.seller.ISellerService;

/**
 * 卖家主工作台
 * 
 * @author xuzunyuan
 * @date 2014年1月7日
 */
@Controller
public class WsController {
	@Autowired
	ISellerService sellerService;

	@Autowired
	IProductService productService;

	@Autowired
	IOrderService orderService;

	@Autowired
	IRetOrderService retOrderService;

	@Autowired
	IBrandShowService brandShowService;

	@RequestMapping("/ws/summary")
	public String wsSummary(HttpServletRequest request,
			HttpServletResponse response) {

		LoginInfo loginInfo = LoginUtils.getLoginInfo(request);

		// 卖家信息
		Seller seller = sellerService.getSellerById(loginInfo.getSellerId());
		request.setAttribute("seller", seller);

		// 商品数量
		request.setAttribute("productCount", productService
				.getValidProductCountOfSeller(loginInfo.getSellerId()));

		// 待处理订单数量
		request.setAttribute("toBeProcessOrderCount", orderService
				.getToBeProcessOrderCountOfSeller(loginInfo.getSellerId()));

		// 待处理退货单数量
		request.setAttribute("toBeProcessRetOrderCount", retOrderService
				.getToBeProcessRetOrderCountOfSeller(loginInfo.getSellerId()));

		// 专场数量
		request.setAttribute(
				"auditingBrandShowCount",
				brandShowService.getBrandShowCountOfSellerByStatus(
						loginInfo.getSellerId(), BrandShow$Status.WAIT_AUDIT));

		request.setAttribute(
				"rejectedBrandShowCount",
				brandShowService.getBrandShowCountOfSellerByStatus(
						loginInfo.getSellerId(), BrandShow$Status.REJECTED));

		request.setAttribute(
				"onlineBrandShowCount",
				brandShowService.getBrandShowCountOfSellerByStatus(
						loginInfo.getSellerId(), BrandShow$Status.ONLINE));

		return "/ws/summary";
	}
}
