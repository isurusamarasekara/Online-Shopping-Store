package com.classes.shoppingcart;

public class CartItem {
	private String itemId = null;
	private String itemName = null;
	private String specifics01 = null;
	private String specifics02 = null;
	private String category = null;
	private String picture = null;
	private double unitPrice = 0.0;
	private int quantity = 0;
	private double subTotalItem = 0.0;
	
	public CartItem(String itemId, String itemName, String specifics01, String specifics02, String category, String picture, double unitPrice,  int quantity) {
		this.setItemId(itemId);
		this.setItemName(itemName);
		this.setSpecifics01(specifics01);
		this.setSpecifics02(specifics02);
		this.setCategory(category);
		this.setPicture(picture);
		this.setUnitPrice(unitPrice);
		this.setQuantity(quantity);
		this.setSubTotalItem();
	}
	
	public void updateHelp(int quantity) {
		this.setQuantity(quantity);
		this.setSubTotalItem();
	}
	
	public void setItemId(String itemId) {
		this.itemId = itemId;
	}
	
	public void setItemName(String itemName) {
		this.itemName = itemName;
	}
	
	public void setSpecifics01(String specifics01) {
		this.specifics01 = specifics01;
	}
	
	public void setSpecifics02(String specifics02) {
		this.specifics02 = specifics02;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public void setPicture(String picture) {
		this.picture = picture;
	}

	public void setUnitPrice(double unitPrice) {
		this.unitPrice = unitPrice;
	}
	
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	
	public void setSubTotalItem(double subTotalItem) {
		this.subTotalItem = subTotalItem;
	}

	public void setSubTotalItem() {
		this.setSubTotalItem(this.getUnitPrice() * this.getQuantity());
	}
	
	public String getItemId() {
		return this.itemId;
	}
	
	public String getItemName() {
		return this.itemName;
	}
	
	public String getSpecifics01() {
		return specifics01;
	}

	public String getSpecifics02() {
		return specifics02;
	}
	
	public String getCategory() {
		return category;
	}

	public String getPicture() {
		return picture;
	}

	public double getUnitPrice() {
		return this.unitPrice;
	}
	
	public int getQuantity() {
		return this.quantity;
	}
	
	public double getSubTotalItem() {
		return this.subTotalItem;
	}
}
