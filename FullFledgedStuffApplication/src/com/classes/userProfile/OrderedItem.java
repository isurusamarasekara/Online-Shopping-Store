package com.classes.userProfile;

public class OrderedItem {
	private String itemId;
	private String orderId;
	private int quantity;
	private double itemOrderTotal;
	private String orderDate;
	private String status;
	
	public OrderedItem (String itemId, String orderId, int quantity, double itemOrderTotal, String orderDate, String status) {
		this.setItemId(itemId);
		this.setOrderId(orderId);
		this.setQuantity(quantity);
		this.setItemOrderTotal(itemOrderTotal);
		this.setOrderDate(orderDate);
		this.setStatus(status);
	}
	
	public void setItemId(String itemId) {
		this.itemId = itemId;
	}
	
	public void setOrderId(String orderId) {
		this.orderId = orderId;
	}
	
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	
	public void setItemOrderTotal(double itemOrderTotal) {
		this.itemOrderTotal = itemOrderTotal;
	}
	
	public void setOrderDate(String orderDate) {
		this.orderDate = orderDate;
	}
	
	public void setStatus(String status) {
		this.status = status;
	}

	public String getItemId() {
		return itemId;
	}

	public String getOrderId() {
		return orderId;
	}

	public int getQuantity() {
		return quantity;
	}

	public double getItemOrderTotal() {
		return itemOrderTotal;
	}

	public String getOrderDate() {
		return orderDate;
	}

	public String getStatus() {
		return status;
	}
}
