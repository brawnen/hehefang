/**
 * Copyright (c)2015-? by www.afd.com. All rights reserved.
 * 
 */
package com.afd.seller.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.afd.model.seller.SellerLogin;
import com.afd.seller.util.LoginUtils;
import com.afd.seller.util.LoginUtils.LoginInfo;
import com.afd.service.seller.ISellerLoginService;
import com.afd.service.seller.ISellerService;

/**
 * 
 * 
 * @author xuzunyuan
 * @date 2015年1月27日
 */
@Controller
public class ApplyController {
	@Autowired
	ISellerLoginService loginService;

	@Autowired
	ISellerService sellerService;

	@RequestMapping("/apply/entry")
	public String applyEntry(HttpServletRequest request,
			HttpServletResponse response) {
		LoginInfo loginInfo = LoginUtils.getLoginInfo(request);

		if (loginInfo.getSellerId() != 0) {
			return "redirect:/ws/summary?m=1001";
		}

		SellerLogin login = loginService.getLoginById(loginInfo
				.getSellerLoginId());

		if (login.getSellerId() != null && login.getSellerId() != 0) {
			// 重新注册登录信息
			loginInfo.setSellerId(login.getSellerId());
			loginInfo.setIsPaidDeposit(sellerService.getSellerById(
					login.getSellerId()).getIsPaidDeposit());

			LoginUtils.registerLoginInfo(request, response, loginInfo);

			return "redirect:/ws/summary?m=1001";
		}

		if (login.getSellerApplyId() != null && login.getSellerApplyId() != 0) {
			return "apply/waitAudit";

		} else {
			return "/apply/entry";
		}

	}
}
