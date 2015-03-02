package com.afd.seller.controller;


import java.io.IOException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.http.HttpEntity;
import org.apache.http.HttpResponse;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClientBuilder;
import org.apache.http.util.EntityUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.ServletRequestDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.afd.common.mybatis.Page;
import com.afd.constants.order.OrderConstants;
import com.afd.model.order.LogisticsCompany;
import com.afd.model.order.Order;
import com.afd.model.order.OrderItem;
import com.afd.model.product.BrandShow;
import com.afd.param.order.OrderCondition;
import com.afd.seller.util.LoginUtils;
import com.afd.service.order.IOrderService;
import com.afd.service.product.IBrandShowService;

@Controller
@RequestMapping("/order")
public class OrderController {
	
	@InitBinder  
    protected void initBinder(HttpServletRequest request,  
        ServletRequestDataBinder binder) throws Exception {  
        DateFormat df = new SimpleDateFormat("yyyy-MM-dd");  
        CustomDateEditor editor = new CustomDateEditor(df, true);  
        binder.registerCustomEditor(Date.class, editor);  
    }
	
	@Autowired
	private IOrderService orderService;
	@Autowired
	private IBrandShowService brandShowService;

	@RequestMapping(value="/queryOrder")
	public String queryOrder(@ModelAttribute OrderCondition orderCondition, HttpServletRequest request, Page<Order> page, ModelMap modelMap){
		page.setPageSize(10);
		
		//卖家id
		Integer sellerId = LoginUtils.getLoginInfo(request).getSellerId();
		orderCondition.setSellerId(sellerId);
		
		page = this.orderService.getOrdersByOrderConditon(orderCondition, page);
		modelMap.addAttribute("page", page);
		
		List<BrandShow> brandShows = this.brandShowService.getOnlinedBrandShowsOfSeller(sellerId);
		modelMap.addAttribute("brandShows", brandShows);
		
		return "order/queryOrder";
	}
	
	@RequestMapping(value="/sendOrder")
	public String sendOrderList(@ModelAttribute OrderCondition orderCondition, HttpServletRequest request, Page<Order> page, ModelMap modelMap){
		page.setPageSize(10);
		//要发货的订单
		orderCondition.setOrderStatus(OrderConstants.ORDER_STATUS_WAITDELIVERED);
		
		//卖家id
		Integer sellerId = LoginUtils.getLoginInfo(request).getSellerId();
		orderCondition.setSellerId(sellerId);
		
		page = this.orderService.getOrdersByOrderConditon(orderCondition, page);
		modelMap.addAttribute("page", page);
		
		List<BrandShow> brandShows = this.brandShowService.getOnlinedBrandShowsOfSeller(sellerId);
		modelMap.addAttribute("brandShows", brandShows);
		
		return "order/sendOrder";
	}
	
	@RequestMapping(value="/getLogiComs", method=RequestMethod.POST)
	@ResponseBody
	public List<LogisticsCompany> getLogiCompanys(@RequestParam(value = "showId") int brandShowId){
		return this.brandShowService.getLogisticsCompanyListOfBrandShow(brandShowId);
	}
	
	@RequestMapping(value="/send", method=RequestMethod.POST)
	@ResponseBody
	public int sendOrder(@RequestParam(value = "orId") Long orderId, 
			@RequestParam(value = "logiId") int logiId, 
			@RequestParam(value = "logiName") String logiName, 
			@RequestParam(value = "awbNo") String awbNo, HttpServletRequest request){
		
		Order order = new Order();
		order.setOrderId(orderId);
		order.setOrderStatus(OrderConstants.ORDER_STATUS_DELIVERED);
		order.setLogisticsCompa(logiId+0L);
		order.setLogisticsName(logiName);
		order.setAwbNo(awbNo);
		
		Date date = new Date();
		order.setSendTime(date);
		order.setLastUpdateDate(date);
		order.setLastUpdateByName(LoginUtils.getLoginInfo(request).getLoginName());
		
		return this.orderService.updateOrder2Sended(order);
	}
	
	@RequestMapping(value="/orderDetail")
	public String orderDetail(@RequestParam Long orderId, HttpServletRequest request, ModelMap modelMap){
		Order order = this.orderService.getOrderById(orderId);
		List<OrderItem> orderItems = null;
		
		if(order != null){
			orderItems = this.orderService.getOrderItemsByOrderId(order.getOrderId().intValue());
			if(orderItems != null){
				order.setOrderItems(orderItems);
			}
		}
		
		modelMap.addAttribute("order", order);
		
		return "order/orderDetail";
	}
	
//	@RequestMapping(value="/orderSendDetail")
//	public String orderSendDetail(Long orderId,HttpServletRequest request,ModelMap modelMap){
//		//返回页面
//		String rtnView = "";
//		//店铺id
//		Long storeId = LoginUtils.getLoginInfo(request).getStoreId();
//		Order order = this.orderService.getOrderByIdAndStoreId(orderId, storeId);
//		modelMap.addAttribute("order", order);
//		if(OrderConstants.ORDER_STATUS_WAITDELIVERED.equals(order.getOrderStatus())){
//			List<Logistics> logistics = this.logisticsService.getAllLogistics(1l);
//			List<StoreShipAddress> ssAddrs = this.ssaService.getAllStoreShipAddr(storeId);
//			modelMap.addAttribute("logisticses", logistics);
//			modelMap.addAttribute("ssAddrs", ssAddrs);
//			modelMap.addAttribute("orderStatus", request.getParameter("orderStatus"));
//			rtnView = "order/orderSendDetail";
//		}else{
//			rtnView = "order/orderDetail";
//		}
//		
//		return rtnView;
//	}
//	
//	@RequestMapping("/queryOrderDeliver")
//	public String queryOrderDeviler(Long orderId,HttpServletRequest request,ModelMap modelMap){
//		if(orderId != null && orderId > 0){
//			Long storeId = LoginUtils.getLoginInfo(request).getStoreId();
//			Order order = this.orderService.getOrderByIdAndStoreId(orderId, storeId);
//			modelMap.addAttribute("order", order);
//		}
//		
//		return "order/orderDeliver";
//	}
//	
//	@RequestMapping(value="/send")
//	public ResponseEntity<Map<String,Integer>> send(HttpServletRequest request) {
//		//订单号
//		String orderId = request.getParameter("orderId");
//		//物流公司Id
//		String logisticsId = request.getParameter("logisticsId");
//		//运单号
//		String awbNo = request.getParameter("awbNo");
//		//卖家发货地址id
//		String ssaId = request.getParameter("ssAddrId");
//		Long storeId = LoginUtils.getLoginInfo(request).getStoreId();
//		Map<String,Integer> map = new HashMap<String, Integer>();
//		int success = this.orderService.sendOrder(Long.parseLong(orderId),Long.parseLong(logisticsId),awbNo,Long.parseLong(ssaId),storeId);
//		map.put("success", success);
//		
//		return new ResponseEntity<Map<String,Integer>>(map,HttpStatus.OK);
//	}
	
	@RequestMapping("/getEmsTrace")
	public ResponseEntity<String> getEmsTrace(String emsNo){
		if(null == emsNo || 0 == emsNo.length()){
			return new ResponseEntity<String>("", HttpStatus.OK);
		}
		String url = "http://211.156.193.140:8000/cotrackapi/api/track/mail/" + emsNo;
		HttpClientBuilder httpClientBuilder = HttpClientBuilder.create();
		CloseableHttpClient closeableHttpClient = httpClientBuilder.build(); 

		HttpGet request = new HttpGet(url);
		request.setHeader("authenticate", "JILINGTONGTAI0725");
		request.setHeader("version", "ems_track_cn_1.0");
		try {
			HttpResponse response = closeableHttpClient.execute(request);
			HttpEntity entity = response.getEntity();
			if (200 != response.getStatusLine().getStatusCode()) {
				return new ResponseEntity<String>("", HttpStatus.OK);
			}
			if (null == entity) {
				return new ResponseEntity<String>("", HttpStatus.OK);
			}
			String data = new String(EntityUtils.toString(entity).getBytes("iso-8859-1"), "utf-8");
			return new ResponseEntity<String>(data, HttpStatus.OK);
		} catch (ClientProtocolException e) {
			return new ResponseEntity<String>("", HttpStatus.OK);
		} catch (IOException e) {
			return new ResponseEntity<String>("", HttpStatus.OK);
		} finally {  
			try {
				closeableHttpClient.close();  
			} catch (IOException e) {  
				return new ResponseEntity<String>("", HttpStatus.OK);
			}
		}
	}
	 
}
