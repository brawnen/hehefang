package com.afd.seller.controller;

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
import com.afd.constants.product.ProductConstants;
import com.afd.model.product.Product;
import com.afd.model.product.vo.BaseCategoryInfoVO;
import com.afd.model.product.vo.BaseCategoryInfoVO.Attr;
import com.afd.model.product.vo.BaseCategoryInfoVO.Spec;
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
	public String toSelectCategoryPage(){
		
		
		return "/product/category";
	}
	
	/**
	 *  
	 * @return 发布商品页面
	 */
	@RequestMapping(value = "/publish")
	public String toPublishPage(
			@RequestParam(value = "bcId", required = false) Integer bcId,
			HttpServletRequest request,ModelMap modelMap) {
		
		BaseCategoryInfoVO bc = this.categoryService.getBaseCategoryInfoByBcId(64);
		
		String pathName = bc.getPathName();
		if(StringUtils.isNotBlank(pathName)){ //商品品类
			pathName = pathName.trim().replace("|", "<em>&gt;</em>");
			modelMap.put("pathName", pathName +"<em>&gt;</em>" + bc.getBcName());
		}
//		List<Attr> attrList = bc.getAttrList(); // 属性
//		if(null != attrList && !attrList.isEmpty()){
//			for (Attr attr : attrList) {
//				if(ProductConstants.DISPLAY_MODE_SELECT.equals(attr.getDisplayMode())){//下拉框
//					
//					
//				}
//			}
//		}
//		
//		List<Spec> specList = bc.getSpecList(); // 规格
//		if(null != specList && !specList.isEmpty()){
//			
//		}
		
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
	public String doSaveProduct(){
		return null;
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
	public String toStockProductPage(
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
			@RequestParam(value = "sortField", defaultValue = "") String sortField,
			@RequestParam(value = "sortDirection", defaultValue = "") String sortDirection,
			HttpServletRequest request, Page<Product> page, ModelMap modelMap
			) {
		page.setPageSize(15);

		page = productService.searchAuditProductPage(productCondition, sortField, sortDirection, page);
		
		modelMap.addAttribute("sortField", sortField);
		modelMap.addAttribute("sortDirection", sortDirection);
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

		return "/product/online";
	}

}
