package com.afd.seller.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.afd.model.seller.Seller;
import com.afd.seller.util.LoginUtils;
import com.afd.service.seller.ISellerService;

@Controller
public class SellerHelperController {
	
	@Autowired
	ISellerService sellerService;

	/**
	 * 收款银行账户
	 * @return
	 */
	@RequestMapping(value="helper/payee")
	public String toPayeeAccount(HttpServletRequest request,ModelMap modelMap){
		int sellerId = LoginUtils.getLoginInfo(request).getSellerId();
		
		Seller seller = sellerService.getSellerById(sellerId);
		if(null != seller){
			modelMap.put("s",seller);
		}
		return "sellerHelper/payeeAccount";
	}

	@RequestMapping(value="helper/savePayee")
	@ResponseBody
	public int savePayeeAccount(HttpServletRequest request,@ModelAttribute Seller seller){
		int sellerId = LoginUtils.getLoginInfo(request).getSellerId();
		seller.setSellerId(sellerId);
		return sellerService.updateSeller(seller);
	}
}
