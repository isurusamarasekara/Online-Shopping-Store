package com.classes.shoppingcart;

import java.util.ArrayList;

public class Cart {
	private double subTotalCart;
	private ArrayList<CartItem> ShoppingCartItems = new ArrayList<>();
	
	public void addToCart(String itemId, String itemName, String specifics01, String specifics02, String category, String picture, double unitPrice, int quantity) {
		CartItem CI = new CartItem(itemId, itemName, specifics01, specifics02, category, picture, unitPrice, quantity);
		ShoppingCartItems.add(CI);
		this.calculatesubTotalCart();
	}
	
	public void updateOnCart(int itemNoOnShoppingCart, int quantity) {
//		ShoppingCartItems.get(itemNoOnShoppingCart - 1).setQuantity(quantity);
//		ShoppingCartItems.get(itemNoOnShoppingCart - 1).
		CartItem CI = (CartItem) ShoppingCartItems.get(itemNoOnShoppingCart);
		CI.updateHelp(quantity);
		this.calculatesubTotalCart();
	}
	
	public void removeFromCart(int itemPosition) {
		ShoppingCartItems.remove(itemPosition);
		this.calculatesubTotalCart();
	}
	
	private void calculatesubTotalCart() {
		double subTotalCart = 0.0;
		
		for(CartItem ci : ShoppingCartItems) {
			subTotalCart += ci.getSubTotalItem();
		}
		
		this.setSubTotalCart(subTotalCart);
	}
	
	public void setSubTotalCart(double subTotalCart) {
		this.subTotalCart = subTotalCart;
	}

	public double getSubTotalCart() {
		return this.subTotalCart;
	}

	public int getNumOfItems() {
		return this.ShoppingCartItems.size();
	}
	
	public CartItem getCartItem(int number) {
		CartItem cartItem = ShoppingCartItems.get(number);
	return cartItem;
	}
}
