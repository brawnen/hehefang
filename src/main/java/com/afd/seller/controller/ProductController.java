package com.afd.seller.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.afd.common.mybatis.Page;
import com.afd.model.product.Product;
import com.afd.param.product.ProductCondition;
import com.afd.service.product.IProductService;

/**
 * 
 *  商品管理控制器
 * @author hkM
 *
 */
@Controller
@RequestMapping("/product")
public class ProductController {

	@Autowired
	IProductService productService;
	
	@RequestMapping(value = "/online")
	public String toOnlinePage(
			@ModelAttribute ProductCondition productCondition,
			@RequestParam(value = "sortField", defaultValue = "") String sortField,
			@RequestParam(value = "sortDirection", defaultValue = "") String sortDirection,
			HttpServletRequest request, Page<Product> page, ModelMap modelMap
			) {
		page.setPageSize(15);

		page = productService.searchOnlineProduct(productCondition, sortField, sortDirection, page);
		
		modelMap.addAttribute("sortField", sortField);
		modelMap.addAttribute("sortDirection", sortDirection);
		modelMap.addAttribute("page", page);

		return "/product/online";
	}

	
}
