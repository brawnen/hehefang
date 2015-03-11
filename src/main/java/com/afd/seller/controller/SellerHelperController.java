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
import com.afd.service.seller.ISellerLoginService;
import com.afd.service.seller.ISellerService;

@Controller
public class SellerHelperController {
	
	@Autowired
	ISellerService sellerService;
	@Autowired
	ISellerLoginService sellerLoginService;

	
	/**
	 *  基本信息
	 * @return
	 */
	@RequestMapping(value="helper/sellerInfo")
	public String toSellerInfo(HttpServletRequest request,ModelMap modelMap){
		int sellerId = LoginUtils.getLoginInfo(request).getSellerId();
		
		Seller seller = sellerService.getSellerById(sellerId);
		if(null != seller){
			modelMap.put("s",seller);
		}
		return "sellerHelper/sellerInfo";
	}
	
	/**
	 *  保证金
	 * @return
	 */
	@RequestMapping(value="helper/deposit")
	public String toDeposit(HttpServletRequest request,ModelMap modelMap){
		int sellerId = LoginUtils.getLoginInfo(request).getSellerId();
		
		Seller seller = sellerService.getSellerById(sellerId);
		if(null != seller){
			modelMap.put("s",seller);
		}
		return "sellerHelper/deposit";
	}
	
	/**
	 *  开票信息
	 * @return
	 */
	@RequestMapping(value="helper/receipt")
	public String toReceipt(HttpServletRequest request,ModelMap modelMap){
		int sellerId = LoginUtils.getLoginInfo(request).getSellerId();
		
		Seller seller = sellerService.getSellerById(sellerId);
		if(null != seller){
			modelMap.put("s",seller);
		}
		return "sellerHelper/receipt";
	}
	
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

	/**
	 *  ajax调用：保存收款银行账户
	 * @return
	 */
	@RequestMapping(value="helper/savePayee")
	@ResponseBody
	public int savePayeeAccount(HttpServletRequest request,@ModelAttribute Seller seller){
		int sellerId = LoginUtils.getLoginInfo(request).getSellerId();
		seller.setSellerId(sellerId);
		return sellerService.updateSeller(seller);
	}

	/**
	 * 修改密码
	 * @return
	 */
	@RequestMapping(value="helper/setPasswd")
	public String toSetPwd(HttpServletRequest request,ModelMap modelMap){
		int sellerId = LoginUtils.getLoginInfo(request).getSellerId();
		
		Seller seller = sellerService.getSellerById(sellerId);
		if(null != seller){
			modelMap.put("s",seller);
		}
		return "sellerHelper/passwd";
	}

	/**
	 *  ajax调用：修改密码
	 * @return
	 */
	@RequestMapping(value="helper/savePasswd")
	@ResponseBody
	public int savePasswd(HttpServletRequest request,@ModelAttribute Seller seller){
		int loginId = LoginUtils.getLoginInfo(request).getSellerLoginId();
		String newPassword = request.getParameter("");
		sellerLoginService.changePassword(loginId, newPassword);
		return sellerService.updateSeller(seller);
	}
	
}
