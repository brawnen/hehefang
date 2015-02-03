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

import com.afd.common.util.RequestUtils;
import com.afd.model.seller.SellerApply;
import com.afd.model.seller.SellerAudit;
import com.afd.model.seller.SellerLogin;
import com.afd.seller.util.LoginUtils;
import com.afd.seller.util.LoginUtils.LoginInfo;
import com.afd.service.seller.ISellerApplyService;
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

	@Autowired
	ISellerApplyService applyService;

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
			return "forward:/apply/waitAudit";

		} else {
			return "forward:/apply/apply";
		}

	}

	@RequestMapping("/apply/apply")
	public String applyApply(HttpServletRequest request,
			HttpServletResponse response) {

		SellerApply apply = applyService.getSellerApplyByLoginId(LoginUtils
				.getLoginInfo(request).getSellerLoginId());

		if (apply != null) {
			request.setAttribute("data", apply);

			SellerAudit audit = applyService.getRecentAudit(apply.getAppId());
			if (audit != null)
				request.setAttribute("audit", audit);
		}

		return "/apply/apply";
	}

	@RequestMapping("/apply/submit")
	public String applySubmit(HttpServletRequest request,
			HttpServletResponse response, SellerApply apply) {

		apply.setSellerLoginId(LoginUtils.getLoginInfo(request)
				.getSellerLoginId());
		apply.setApplyIp(RequestUtils.getRemoteAddr(request));

		if (apply.getAppId() == null || apply.getAppId() == 0) {
			applyService.commitNewSellerApply(apply);

		} else {
			applyService.commitUpdatedSellerApply(apply);
		}

		return "redirect:/apply/entry?redy=1";
	}

	@RequestMapping("/apply/waitAudit")
	public String waitAudit(HttpServletRequest request,
			HttpServletResponse response) {

		request.setAttribute(
				"apply",
				applyService.getSellerApplyByLoginId(LoginUtils.getLoginInfo(
						request).getSellerLoginId()));

		return "/apply/waitAudit";
	}

}
