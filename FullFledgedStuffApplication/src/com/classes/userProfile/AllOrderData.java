package com.classes.userProfile;

import java.util.ArrayList;


public class AllOrderData {
	private int userId;
	private ArrayList<OrderedItem> OIArray = new ArrayList<>();
	private ArrayList<ItemSpecific> ISArray = new ArrayList<>();
	
	public AllOrderData(int userId) {
		this.setUserId(userId);
	}
	
	public void setUserId(int userId) {
		this.userId = userId;
	}	
	
	public int getUserId() {
		return this.userId;
	}

	public void addOrderedItem(String itemId, String orderId, int quantity, double itemOrderTotal, String orderDate, String status) {
		OrderedItem OI = new OrderedItem(itemId, orderId, quantity, itemOrderTotal, orderDate, status);
		OIArray.add(OI);
	}
	
	public void addItemSpecific(String itemId, String itemName, String itemPicUrl, String specifics, String description, String category) {
		ItemSpecific IS = new ItemSpecific(itemId, itemName, itemPicUrl, specifics, description, category);
		ISArray.add(IS);
	}
	
	public OrderedItem getOrderedItem(int number) {
		OrderedItem OI = OIArray.get(number);
		
//		for(ItemSpecific IS : ISArray)
//			System.out.println(IS.getItemId());
		
	return OI;
	}
	
	public ItemSpecific getItemSpecific(int number) {
		String itemId = getOrderedItem(number).getItemId();
		
		int i = 0;
		for(; i < ISArray.size(); i++) {
			if(ISArray.get(i).getItemId().equals(itemId))
				break;
		}
		
		ItemSpecific IS = ISArray.get(i);
	return IS;
	}
	
	public int getOrderedItemListSize() {
		return OIArray.size();
	}
}
