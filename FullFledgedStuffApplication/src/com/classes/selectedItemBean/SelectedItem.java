// REMOVING

package com.classes.selectedItemBean;

import java.io.Serializable;

public class SelectedItem implements Serializable{
	private String itemId;
	private String itemName;
	
	public String getItemId() {
		return itemId;
	}

	public void setItemId(String itemId) {
		this.itemId = itemId;
	}

	public String getItemName() {
		return itemName;
	}

	public void setItemName(String itemName) {
		this.itemName = itemName;
	}
	
	
	
}
