package com.classes.userProfile;

public class ItemSpecific {
	private String itemId;
	private String itemName;
	private String itemPicUrl;
	private String specifics;
	private String description;
	private String category;
	
	public ItemSpecific(String itemId, String itemName, String itemPicUrl, String specifics, String description, String category) {
		this.setItemId(itemId);
		this.setItemName(itemName);
		this.setItemPicUrl(itemPicUrl);
		this.setSpecifics(specifics);
		this.setDescription(description);
		this.setCategory(category);
	}
	
	public void setItemId(String itemId) {
		this.itemId = itemId;
	}
	
	public void setItemName(String itemName) {
		this.itemName = itemName;
	}
	
	public void setItemPicUrl(String itemPicUrl) {
		this.itemPicUrl = itemPicUrl;
	}
	
	public void setSpecifics(String specifics) {
		this.specifics = specifics;
	}
	
	public void setDescription(String description) {
		this.description = description;
	}
	
	public void setCategory(String category) {
		this.category = category;
	}

	public String getItemId() {
		return itemId;
	}

	public String getItemName() {
		return itemName;
	}

	public String getItemPicUrl() {
		return itemPicUrl;
	}

	public String getSpecifics() {
		return specifics;
	}

	public String getDescription() {
		return description;
	}

	public String getCategory() {
		return category;
	}
}
