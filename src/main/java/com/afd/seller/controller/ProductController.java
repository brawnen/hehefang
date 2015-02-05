package com.afd.seller.controller;

import java.io.PrintWriter;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.lang.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
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
import com.afd.common.util.PropertyUtils;
import com.afd.constants.product.ProductConstants;
import com.afd.model.product.Product;
import com.afd.model.product.Sku;
import com.afd.model.product.vo.BaseCategoryInfoVO;
import com.afd.model.product.vo.ProductConvertUtil;
import com.afd.model.product.vo.ProductVo;
import com.afd.param.product.ProductCondition;
import com.afd.seller.util.LoginUtils;
import com.afd.seller.util.LoginUtils.LoginInfo;
import com.afd.seller.util.YWHttpCilient;
import com.afd.service.product.ICategoryService;
import com.afd.service.product.IProductService;
import com.alibaba.fastjson.JSONObject;

/**
 * 
 *  商品管理控制器
 * @author hkM
 *
 */
@Controller
public class ProductController {
	private static final Logger logger = LoggerFactory
			.getLogger(LoginController.class);
	
	@Autowired
	IProductService productService;
	@Autowired
	ICategoryService categoryService;
	
	/**
	 * 
	 * @return 选择类目页面
	 */
	@RequestMapping(value = "/product/category")
	public String toSelectCategory(){
		
		return "/product/category";
	}
	
	/**
	 *  
	 * @return 发布商品页面
	 */
	@RequestMapping(value = "/product/publish")
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
	
	private void saveSku(ProductVo vo,LoginInfo loginInfo) {
		BigDecimal[] skuSalePrice = vo.getSkuSalePrice();
		BigDecimal[] skuMarketPrice = vo.getSkuMarketPrice();
		Integer[] skuStockBalance = vo.getSkuStockBalance();
		
		if(null != skuSalePrice && skuSalePrice.length > 0){
			 ArrayList<Sku> skus = new ArrayList<Sku>();
			for (int i = 0; i < skuSalePrice.length; i++) {
				Sku sku = new Sku();
				sku.setProdId(vo.getProdId());
				sku.setProdCode(vo.getProdCode());
				sku.setMarketPrice(skuMarketPrice[i]);
				sku.setSalePrice(skuSalePrice[i]);
				sku.setStockBalance(skuStockBalance[i]);
				
				if (null != vo.getSkuImgUrl() && vo.getSkuImgUrl().length > 0) {
					String skuImgUrl = vo.getSkuImgUrl()[i];
					if (null !=skuImgUrl && skuImgUrl.length() > 0) {
						sku.setSkuImgUrl(skuImgUrl);
					} 
				} 
				sku.setSkuSpecId(vo.getSkuSpecId()[i]);
				sku.setSkuSpecName(vo.getSkuSpecName()[i]);
				sku.setSkuStatus(ProductConstants.SKU_STATUS_NORMAL); 
				sku.setCreateDate(DateUtils.currentDate());
				sku.setCreateByName(loginInfo.getLoginName());
				sku.setLastUpdateDate(DateUtils.currentDate());
				sku.setUpdateByName(loginInfo.getLoginName());
				skus.add(sku);
			}
			productService.batchAddSkus(skus);
		}
	}
	
	/**
	 * 
	 *  Ajax调用：保存商品
	 * @return 成功|失败 
	 */
	@ResponseBody
	@RequestMapping(value = "/product/save")
	public Map<String,String> doSaveProduct(HttpServletRequest request,
			@ModelAttribute ProductVo vo){
		LoginInfo loginInfo = LoginUtils.getLoginInfo(request);
		Product product = ProductConvertUtil.voToProduct(vo,null);
		product.setSellerId(loginInfo.getSellerId());
		product.setBcId(27);
		product.setStatus(ProductConstants.PROD_STATUS_ON);
		product.setAuditStatus(ProductConstants.PROD_AUDIT_STATUS_WAIT);
		product.setImgUrl(vo.getImgUrl());
//		product.setBcCode(bcCode);
//		product.setProdCode("7654321");
		int prodId = productService.addProduct(product);
		
		vo.setProdId(prodId);
		saveSku(vo,loginInfo);	// 保存SKU
		
		boolean b = prodId > 0 ? true :false;
		return resultMsg(b,"");
	}

	/**
	 *  
	 * @return 修改商品
	 */
	@RequestMapping(value = "/product/modify")
	public String toModifyProduct(@RequestParam(value = "prodId", required = true) Integer prodId,
			HttpServletRequest request,ModelMap modelMap){
		Product product = this.productService.getProductById(prodId);
		modelMap.put("product",product);
		return "/product/publish";
	}
	
	/**
	 * Ajax调用：删除商品
	 * 
	 * @return
	 */
	@RequestMapping(value = "/product/delProd")
	@ResponseBody
	public Map<String, String> delProduct(
			@RequestParam(value = "prodId", required = true) Integer prodId,
			HttpServletRequest request) {
		String loginName = LoginUtils.getLoginInfo(request).getLoginName();
		boolean b = productService.delProduct(prodId,loginName);
		return resultMsg(b,"");
	}
	
	/**
	 * Ajax调用：批量删除商品
	 * 
	 * @return
	 */
	@RequestMapping(value = "/product/batchdelProd", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, String> batchdelProduct(
			@RequestParam(value = "ids", required = true) String ids,
			HttpServletRequest request) {
		String loginName = LoginUtils.getLoginInfo(request).getLoginName();
		List<Integer> idList = new ArrayList<Integer>();
		if (StringUtils.isNotBlank(ids)) {
			String[] prodIds = ids.split(",");
			for (String prodId : prodIds) {
				idList.add(Integer.parseInt(prodId));
			}
		}
		boolean b = productService.batchdelProduct(idList,loginName);
		return resultMsg(b,"");
	}
	
	/**
	 * 
	 * @return 在售商品列表
	 */
	@RequestMapping(value = "/product/online")
	public String toOnlineProductPage(
			@ModelAttribute ProductCondition productCondition,
			@RequestParam(value = "sortField", defaultValue = "") String sortField,
			@RequestParam(value = "sortDirection", defaultValue = "") String sortDirection,
			HttpServletRequest request, Page<Product> page, ModelMap modelMap
			) {
		page.setPageSize(2);
		LoginInfo loginInfo = LoginUtils.getLoginInfo(request);
		productCondition.setSellerId(loginInfo.getSellerId());
		page = productService.searchOnlineProductPage(productCondition, sortField, sortDirection, page);
		modelMap.addAttribute("sortField", sortField);
		modelMap.addAttribute("sortDirection", sortDirection);
		modelMap.addAttribute("page", page);
		return "/product/online";
	}
	
	/**
	 * 
	 * @return 审核驳回商品列表
	 */
	@RequestMapping(value = "/product/audit")
	public String toWaitAuditProductPage(
			@ModelAttribute ProductCondition productCondition,
			HttpServletRequest request, Page<Product> page, ModelMap modelMap
			) {
		page.setPageSize(15);
		LoginInfo loginInfo = LoginUtils.getLoginInfo(request);
		productCondition.setSellerId(loginInfo.getSellerId());
		page = productService.searchAuditProductPage(productCondition, null, null, page);
		modelMap.addAttribute("page", page);
		return "/product/audit";
	}
	
	@SuppressWarnings("unchecked")
	@RequestMapping(method = RequestMethod.POST, value = "/image/saveImg")
	public void uploadProductImg(HttpServletRequest request,
			HttpServletResponse response) {
		String opt = request.getParameter("opt");
		// 定义允许上传的文件扩展名
		HashMap<String, String> extMap = new HashMap<String, String>();
		extMap.put("image", "gif,jpg,jpeg,png,bmp");

		// 最大文件大小
		long maxSize = 512000;
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter pw = null;
		try {
			pw = response.getWriter();

			if (!ServletFileUpload.isMultipartContent(request)) {
				pw.println(errorMsg("请选择文件。"));
			}

			FileItemFactory factory = new DiskFileItemFactory();
			ServletFileUpload upload = new ServletFileUpload(factory);
			upload.setHeaderEncoding("UTF-8");
			List<FileItem> items = upload.parseRequest(request);
			Iterator<FileItem> itr = items.iterator();

			while (itr.hasNext()) {
				FileItem item = itr.next();
				String fileName = item.getName();
				long fileSize = item.getSize();
				List<String> urls = null;

				if (fileName != null) {
					if (fileSize > maxSize) {// 检查文件大小
						pw.print(errorMsg("上传文件大小超过限制。"));
						return;
					}

					String fileExt = fileName.substring(
							fileName.lastIndexOf(".") + 1).toLowerCase(); // 检查扩展名

					if (!Arrays.<String> asList(extMap.get("image").split(","))
							.contains(fileExt)) {
						pw.print(errorMsg("上传文件扩展名是不允许的扩展名。\n只允许"
								+ extMap.get("image") + "格式。"));
						return;
					}

					if (!item.isFormField() && fileName != null) {// 执行上传
						urls = YWHttpCilient.uploadFileService(
								item.getInputStream(), fileName, opt);
						StringBuilder fullUrl = new StringBuilder();

						for (String url : urls) {
							fullUrl.append(((String[])PropertyUtils.getProperty("imgGetUrl"))[0]+"?rid=" + url + ",");
						}

						pw.print(getRight(fullUrl.substring(0,
								fullUrl.length() - 1)));
					}
				}
			}
		} catch (Exception e) {
			logger.info("上传文件失败！", e);
			pw.println(errorMsg("上传文件失败。"));
			return;
		} finally {
			pw.close();
		}
	}
	
	private String errorMsg(String message) {
		JSONObject obj = new JSONObject();
		obj.put("error", 1);
		obj.put("message", message);
		return obj.toJSONString();
	}
	
	private String getRight(String message) {
		JSONObject obj = new JSONObject();
		obj.put("error", 0);
		obj.put("url", message);
		return obj.toJSONString();
	}
	
	private Map<String,String> resultMsg(boolean b,String message) {
		HashMap<String, String> resultMap = new HashMap<String,String>();
		if (b) {// 成功
			resultMap.put("success", "1");
			resultMap.put("msg", message);
		} else {// 失败
			resultMap.put("error", "0");
			resultMap.put("msg", message);
		}
		return resultMap;
	}
}
