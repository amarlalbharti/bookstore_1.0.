package com.bookstore.controller;

import java.security.Principal;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bookstore.config.Validation;
import com.bookstore.domain.City;
import com.bookstore.domain.CustomerAddress;
import com.bookstore.domain.OrderNote;
import com.bookstore.domain.ProductOrder;
import com.bookstore.domain.Registration;
import com.bookstore.enums.PaymentStatus;
import com.bookstore.service.BasketService;
import com.bookstore.service.CityService;
import com.bookstore.service.CustomerAddressService;
import com.bookstore.service.OrderNoteService;
import com.bookstore.service.ProductOrderService;
import com.bookstore.service.ProductService;
import com.bookstore.service.RegistrationService;
import com.bookstore.util.ProductOrderUtils;
import com.bookstore.util.Util;

@Controller
public class AdminProductOrderController
{
	@Autowired
	private BasketService basketService;
	@Autowired
	private ProductService productService;
	@Autowired
	private RegistrationService registrationService;
	@Autowired
	private CustomerAddressService customerAddressService;
	@Autowired
	private ProductOrderService productOrderService;
	@Autowired
	private CityService cityService; 
	@Autowired
	private OrderNoteService orderNoteService; 
	
	
	private static final Logger LOGGER = Logger.getLogger(AdminProductOrderController.class);
	
	@RequestMapping(value = "admin/sales/orders", method = RequestMethod.GET)
	public String getCustomerOrders(ModelMap map, HttpServletRequest request, Principal principal)
	{
		
		return "productOrders";
	}
	
	
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "admin/sales/orders/list", method = RequestMethod.GET)
	public @ResponseBody String getSalesOrderList(ModelMap map, HttpServletRequest request, HttpServletResponse response, Principal principal)
	{
		JSONObject json = new JSONObject();
		try {
			if(principal != null){
				int pn = request.getParameter("pn") != null && Validation.isNumeric(request.getParameter("pn")) ? Util.getNumericPositive(request.getParameter("pn")) : 1;
				int rpp = request.getParameter("rpp") != null && Validation.isNumeric(request.getParameter("rpp")) ? Util.getNumericPositive(request.getParameter("rpp")) : 10;
				json.put("product_orders", this.productOrderService.getProductOrdersJsonArray((pn-1)*rpp, rpp));
				long totalOrders = this.productOrderService.countProductOrdersByStatus();
				json.put("total_orders", totalOrders);
				json.put("pn", pn);
				json.put("rpp", rpp);
				int pages = 1;
				if(totalOrders % rpp > 0) {
					pages = ((int)totalOrders / rpp) + 1;
				} else {
					pages = ((int)totalOrders / rpp);
				}
				json.put("total_pages", pages);
			}else{
				response.setStatus(HttpStatus.UNAUTHORIZED.value());
				return json.toJSONString();
			}
			
		}catch (Exception e) {
			LOGGER.error("Error in add custoemr address", e);
			json.put("status", "failed");
			json.put("msg", "Oops something wrong !");
		}
		return json.toJSONString();
	}
	
	
	@RequestMapping(value = "admin/order/{transaction_id}", method = RequestMethod.GET)
	public String viewCustomerOrder(@PathVariable(value="transaction_id" ) String transaction_id, ModelMap map, HttpServletRequest request, HttpServletResponse response, Principal principal)
	{
		try {
			if(Validation.isNumeric(transaction_id)) {
				Long transactionId  = Util.getLong(transaction_id);
				if(transactionId > 0) {
					ProductOrder order = this.productOrderService.getProductOrderByTransationId(transactionId);
					map.addAttribute("productOrder", order);
				}
			}
			
		}catch (Exception e) {
			LOGGER.error("Error in add custoemr address", e);
		}
		return "viewProductOrder";
	}
	
	
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "admin/order/update/status/{transaction_id}", method = RequestMethod.POST)
	public @ResponseBody String changeShippingStatus(@PathVariable(value="transaction_id" ) String transaction_id, ModelMap map, HttpServletRequest request, HttpServletResponse response, Principal principal)
	{
		JSONObject json = new JSONObject();
		try {
			if(principal != null){
				Registration reg = this.registrationService.getRegistrationByUserid(principal.getName());
				String shippingStatus = request.getParameter("shipping_status");
				if(Validation.isNumeric(transaction_id) && ProductOrderUtils.getValidShippingStatus(shippingStatus) >= 0) {
					Long transactionId  = Util.getLong(transaction_id);
					if(transactionId > 0) {
						ProductOrder order = this.productOrderService.getProductOrderByTransationId(transactionId);
						int oldStatus = order.getOrderStatus();
						order.setOrderStatus(ProductOrderUtils.getValidShippingStatus(shippingStatus));
						order.setModifyDate(new Date());
						boolean flag = this.productOrderService.updateProductOrder(order);
						if(flag) {
							this.orderNoteService.addNoteOnChangeActivity(order, oldStatus, null, reg);
							json.put("status", "success");
							json.put("msg", "Order Status has been changed successfully !");
						}
					}
				}else {
					json.put("status", "failed");
					json.put("msg", "Invalid order status !");
				}
			}else{
				response.setStatus(HttpStatus.UNAUTHORIZED.value());
				return json.toJSONString();
			}
			
		}catch (Exception e) {
			LOGGER.error("Error in add custoemr address", e);
			json.put("status", "failed");
			json.put("msg", "Oops something wrong !");
		}
		return json.toJSONString();
	}
	
	@RequestMapping(value = "admin/order/markpaid/{transaction_id}", method = RequestMethod.GET)
	public String orderMarkPaid(@PathVariable(value="transaction_id" ) String transaction_id, ModelMap map, HttpServletRequest request, HttpServletResponse response, Principal principal)
	{
		try {
			Registration reg = this.registrationService.getRegistrationByUserid(principal.getName());
			if(Validation.isNumeric(transaction_id) && reg != null) {
				Long transactionId  = Util.getLong(transaction_id);
				if(transactionId > 0) {
					ProductOrder order = this.productOrderService.getProductOrderByTransationId(transactionId);
					order.setModifyDate(new Date());
					order.setPaymentStatus(PaymentStatus.PAID.ordinal());
					boolean flag = this.productOrderService.updateProductOrder(order);
					if(flag) {
						OrderNote note = new OrderNote();
						note.setRegistration(reg);
						note.setCreateDate(new Date());
						note.setProductOrder(order);
						note.setShowToCustomer(Boolean.FALSE);
						note.setNote("Payment is marked as PAID.");
						this.orderNoteService.addOrderNode(note);
					}
				}
			}
			
		}catch (Exception e) {
			LOGGER.error("Error in add custoemr address", e);
		}
		return "redirect:/admin/order/"+transaction_id;
	}
	
	@RequestMapping(value = "admin/order/payment/refund/{transaction_id}", method = RequestMethod.GET)
	public String orderMarkAsRefund(@PathVariable(value="transaction_id" ) String transaction_id, ModelMap map, HttpServletRequest request, HttpServletResponse response, Principal principal)
	{
		try {
			Registration reg = this.registrationService.getRegistrationByUserid(principal.getName());
			if(Validation.isNumeric(transaction_id) && reg != null) {
				Long transactionId  = Util.getLong(transaction_id);
				if(transactionId > 0) {
					ProductOrder order = this.productOrderService.getProductOrderByTransationId(transactionId);
					order.setModifyDate(new Date());
					order.setPaymentStatus(PaymentStatus.REFUNDED.ordinal());
					boolean flag = this.productOrderService.updateProductOrder(order);
					if(flag) {
						OrderNote note = new OrderNote();
						note.setRegistration(reg);
						note.setCreateDate(new Date());
						note.setProductOrder(order);
						note.setShowToCustomer(Boolean.FALSE);
						note.setNote("Payment is marked as REFUNDED.");
						this.orderNoteService.addOrderNode(note);
					}
				}
			}
			
		}catch (Exception e) {
			LOGGER.error("Error in add custoemr address", e);
		}
		return "redirect:/admin/order/"+transaction_id;
	}
}
