package com.afd.seller.controller;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.afd.common.mybatis.Page;
import com.afd.common.util.DateUtils;
import com.afd.constants.product.ProductConstants;
import com.afd.model.product.Product;
import com.afd.model.product.Sku;
import com.afd.model.product.vo.BaseCategoryInfoVO;
import com.afd.model.product.vo.ProductConvertUtil;
import com.afd.model.product.vo.ProductVo;
import com.afd.param.product.ProductCondition;
import com.afd.service.product.ICategoryService;
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
	@Autowired
	ICategoryService categoryService;
	
	/**
	 * 
	 * @return 选择类目页面
	 */
	@RequestMapping(value = "/category")
	public String toSelectCategory(){
		
		return "/product/category";
	}
	
	/**
	 *  
	 * @return 发布商品页面
	 */
	@RequestMapping(value = "/publish")
	public String toPublish(
			@RequestParam(value = "bcId", required = false) Integer bcId,
			HttpServletRequest request,ModelMap modelMap) {
		
		BaseCategoryInfoVO bc = this.categoryService.getBaseCategoryInfoByBcId(bcId);
		
		//1. 已选商品品类
		String pathName = bc.getPathName();
		if(StringUtils.isNotBlank(pathName)){ 
			pathName = pathName.trim().replace("|", "<em>&gt;</em>");
			modelMap.put("pathName", pathName +"<em>&gt;</em>" + bc.getBcName());
		}
		
		//2. 品牌

		modelMap.put("bc", bc);
		return "/product/publish";
	}
	
	/**
	 * 
	 *  Ajax调用：保存商品
	 * @return 成功|失败 
	 */
	@ResponseBody
	@RequestMapping(value = "/save")
	public String doSaveProduct(HttpServletRequest request,
			ProductVo vo){
		
		Product product = ProductConvertUtil.voToProduct(vo,null);

		product.setSellerId(765432);
		product.setBcId(27);
		product.setStatus(ProductConstants.PROD_AUDIT_NORMAL);
//		product.setBcCode(bcCode);
//		product.setProdCode("7654321");
		product.setCreateDate(DateUtils.currentDate());
		product.setLastUpdateDate(DateUtils.currentDate());
		int prodId = productService.addProduct(product);
		vo.setProdId(prodId);
		saveSku(vo);
		
//		for (int i = 0; i < 2; i++) {
//			Sku sku = new Sku();
//			sku.setProdId(prodId);
//			sku.setProdCode("7654321");
//			sku.setSalePrice(new BigDecimal(108));
//			sku.setMarketPrice(new BigDecimal(998));
//			sku.setStockBalance(100);
//			sku.setCreateDate(new Date());
//			
//			productService.addSku(sku);
//		}
		
		// 1. 卖家
		// 2. 品牌
		// 3.
		
		return null;
	}
	
	private void saveSku(ProductVo vo) {
		BigDecimal[] skuSalePrice = vo.getSkuSalePrice();
		BigDecimal[] skuMarketPrice = vo.getSkuMarketPrice();
		
		if(null != skuSalePrice && skuSalePrice.length > 0){
			 ArrayList<Sku> skus = new ArrayList<Sku>();
			for (int i = 0; i < skuSalePrice.length; i++) {
				Sku sku = new Sku();
				sku.setProdId(vo.getProdId());
				sku.setProdCode(vo.getProdCode());
				sku.setMarketPrice(skuMarketPrice[i]);
				sku.setSalePrice(skuSalePrice[i]);
//				sku.setSkuImgUrl(skuImgUrl);
				sku.setSkuSpecId(vo.getSkuSpecId()[i]);
				sku.setSkuSpecName(vo.getSkuSpecName()[i]);
				sku.setSkuStatus(ProductConstants.SKU_STATUS_NORMAL); 
				sku.setCreateDate(DateUtils.currentDate());
//				sku.setCreateByName(loginName);
				
				skus.add(sku);
				
			}
			productService.batchAddSkus(skus);
		}
	}

	/**
	 *  
	 * @return 修改商品
	 */
	@RequestMapping(value = "/modify")
	public String toModifyProduct(HttpServletRequest request){
		return "/product/modify";
	}
	
	/**
	 *  商品上架
	 * @return 成功：失败
	 */
	@RequestMapping(value = "/putaway")
	@ResponseBody
	public Map<String, String> putawayProd(
			@RequestParam(value = "prodId", required = true) Integer prodId,
			HttpServletRequest request) {
		boolean b = productService.putawayProduct(prodId);		

		return null;
	}
	
	/**
	 * 批量上架商品
	 * 
	 * @return 成功：失败
	 */
	@RequestMapping(value = "/batchPutaway", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, String> batchPutawayProd(
			@RequestParam(value = "ids", required = true) String ids,
			HttpServletRequest request) {
		List<Integer> idList = new ArrayList<Integer>();
		if (StringUtils.isNotBlank(ids)) {
			String[] prodIds = ids.split(",");
			for (String prodId : prodIds) {
				idList.add(Integer.parseInt(prodId));
			}
		}
		boolean b = productService.batchPutawayProduct(idList);
		return null;
	}
	
	/**
	 * Ajax调用：取消上架
	 * 
	 * @return
	 */
	@RequestMapping(value = "/cancelAudit")
	@ResponseBody
	public Map<String, String> cancelAuditProduct(
			@RequestParam(value = "prodId", required = true) Integer prodId,
			HttpServletRequest request) {
		boolean b = productService.cancelAuditProduct(prodId);
		return null;
	}
	
	/**
	 * Ajax调用：删除商品
	 * 
	 * @return
	 */
	@RequestMapping(value = "/delProd")
	@ResponseBody
	public Map<String, String> delProduct(
			@RequestParam(value = "prodId", required = true) Integer prodId) {
		Map<String, String> resultMap = new HashMap<String, String>();
		boolean b = productService.delProduct(prodId,null);
		
		return resultMap;
	}
	
	/**
	 * Ajax调用：批量删除商品
	 * 
	 * @return
	 */
	@RequestMapping(value = "/batchdelProd", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, String> batchdelProduct(
			@RequestParam(value = "ids", required = true) String ids) {
		List<Integer> idList = new ArrayList<Integer>();
		if (StringUtils.isNotBlank(ids)) {
			String[] prodIds = ids.split(",");
			for (String prodId : prodIds) {
				idList.add(Integer.parseInt(prodId));
			}
		}
		boolean b = productService.batchdelProduct(idList,null);
		return null;
	}
	
	/**
	 * 
	 * @return 库存商品列表
	 */
	@RequestMapping(value = "/stock")
	public String toStockProduct(
			@ModelAttribute ProductCondition productCondition,
			@RequestParam(value = "sortField", defaultValue = "") String sortField,
			@RequestParam(value = "sortDirection", defaultValue = "") String sortDirection,
			HttpServletRequest request, Page<Product> page, ModelMap modelMap
			) {
		page.setPageSize(15);

		page = productService.searchStockProductPage(productCondition, sortField, sortDirection, page);
		modelMap.addAttribute("sortField", sortField);
		modelMap.addAttribute("sortDirection", sortDirection);
		modelMap.addAttribute("page", page);
		return "/product/online";
	}
	
	/**
	 * 
	 * @return 待审核商品列表
	 */
	@RequestMapping(value = "/audit")
	public String toWaitAuditProductPage(
			@ModelAttribute ProductCondition productCondition,
			HttpServletRequest request, Page<Product> page, ModelMap modelMap
			) {
		page.setPageSize(15);

		page = productService.searchAuditProductPage(productCondition, null, null, page);
		
		modelMap.addAttribute("page", page);
		return "/product/audit";
	}
	
	/**
	 * 
	 * @return 在售商品列表
	 */
	@RequestMapping(value = "/online")
	public String toOnlineProductPage(
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
		List<Product> result = page.getResult();
		System.out.println(result.size());
		return "/product/online";
	}
	
}
