/**
 * Copyright (c)2013-2014 by www.yiwang.com. All rights reserved.
 * 
 */
package com.afd.seller.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * 卖家主工作台
 * 
 * @author xuzunyuan
 * @date 2014年1月7日
 */
@Controller
public class WsController {
	@RequestMapping("/")
	public String ws(HttpServletRequest request, HttpServletResponse response) {
		// LoginInfo login = LoginUtils.getLoginInfo(request);

		return "ws/main";
	}
}
