package com.classes.orderConfirmation;

import com.classes.login.LoggedUser;
import com.classes.shoppingcart.Cart;

public class Order {
	private LoggedUser LD;
	private Cart cart;
	private String addressType;
	private String newAddLine1;
	private String newAddLine2;
	private String newCity;
	private String newDistrict;
	private String newState_province;
	private int newZip;
	private String newCountry;
	
	public Order(LoggedUser LD, Cart cart, String addressType) {
		this.setLD(LD);
		this.setCart(cart);
		this.setAddressType(addressType);
	}
	
	public void setNewAddressHelp(String newAddLine1, String newAddLine2, String newCity, String newDistrict, String newState_province, int newZip, String newCountry) {
		this.setNewAddLine1(newAddLine1);
		this.setNewAddLine2(newAddLine2);
		this.setNewCity(newCity);
		this.setNewDistrict(newDistrict);
		this.setNewState_province(newState_province);
		this.setNewZip(newZip);
		this.setNewCountry(newCountry);
	}
	
	public void setLD(LoggedUser LD) {
		this.LD = LD;
	}
	
	public void setCart(Cart cart) {
		this.cart = cart;
	}
	
	public void setAddressType(String addressType) {
		this.addressType = addressType;
	}

	public void setNewAddLine1(String newAddLine1) {
		this.newAddLine1 = newAddLine1;
	}
	
	public void setNewAddLine2(String newAddLine2) {
		this.newAddLine2 = newAddLine2;
	}
	
	public void setNewCity(String newCity) {
		this.newCity = newCity;
	}
	
	public void setNewDistrict(String newDistrict) {
		this.newDistrict = newDistrict;
	}
	
	public void setNewState_province(String newState_province) {
		this.newState_province = newState_province;
	}
	
	public void setNewZip(int newZip) {
		this.newZip = newZip;
	}
	
	public void setNewCountry(String newCountry) {
		this.newCountry = newCountry;
	}

	public LoggedUser getLD() {
		return this.LD;
	}

	public Cart getCart() {
		return this.cart;
	}

	public String getAddressType() {
		return addressType;
	}

	public String getNewAddLine1() {
		return this.newAddLine1;
	}

	public String getNewAddLine2() {
		return this.newAddLine2;
	}

	public String getNewCity() {
		return this.newCity;
	}

	public String getNewDistrict() {
		return this.newDistrict;
	}

	public String getNewState_province() {
		return this.newState_province;
	}

	public int getNewZip() {
		return this.newZip;
	}

	public String getNewCountry() {
		return this.newCountry;
	}
}
