package com.bookstore.service;

import java.util.List;

import com.bookstore.domain.ProductOrder;
import com.bookstore.enums.OrderStatus;

public interface ProductOrderService
{
	public int addProductOrder(ProductOrder productOrder);

	public boolean updateProductOrder(ProductOrder productOrder);
	
	public ProductOrder getProductOrder(int productOrderId);
	
	public ProductOrder getProductOrder(int productOrderId, int rid);
	
	public List<ProductOrder> getProductOrderByCustomer(int rid);
	
	public Long countProductOrdersByStatus(OrderStatus status);
}
