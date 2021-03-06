package com.bookstore.service;

import com.bookstore.domain.OrderNote;
import com.bookstore.domain.ProductOrder;
import com.bookstore.domain.Registration;

public interface OrderNoteService
{
	public int addOrderNode(OrderNote orderNote);
	
	public Boolean updateOrderNode(OrderNote orderNote);
	
	public Boolean addNoteOnChangeActivity(ProductOrder order, int oldStatus, String comment, Registration reg);
	
}
