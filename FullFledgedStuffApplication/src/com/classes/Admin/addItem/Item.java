package com.classes.Admin.addItem;

public class Item {

	private String itemId;
	private int priorityLvl;
	private String itemName;
	private String itemPicUrl;
	private String specifics;
	private String description;
	private String category;
	private double unitPrice;
	private int qtyAvaiable;
	private String associates;
	
	//book
	private String author;
	private String genre;
	private String booktype;
	
	//fashion
	private String fashcol;
	private String fashtype;
	
	//stationary
	private String distributor;
	private String stattype;
		
	public Item(String itemId, int priorityLvl, String itemName, String itemPicUrl, String specifics, String description, String category, double unitPrice, int qtyAvailable, String associates) {
		
		this.setItemId(itemId);
		this.setPriorityLvl(priorityLvl);
		this.setItemName(itemName);
		this.setItemPicUrl(itemPicUrl);
		this.setSpecifics(specifics);
		this.setDescription(description);
		this.setCategory(category);
		this.setUnitPrice(unitPrice);
		this.setQtyAvaiable(qtyAvailable);
		this.setAssociates(associates);
	}

	public void RemItem(String itemId) {
		this.setItemId(itemId);
	}

	//setters
	
	public void setItemId(String itemId) {
		this.itemId = itemId;
	}

	public void setPriorityLvl(int priorityLvl) {
		this.priorityLvl = priorityLvl;
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

	public void setUnitPrice(double unitPrice) {
		this.unitPrice = unitPrice;
	}

	public void setQtyAvaiable(int qtyAvaiable) {
		this.qtyAvaiable = qtyAvaiable;
	}

	public void setAssociates(String associates) {
		this.associates = associates;
	}
	
	public void setAuthor(String author) {
		this.author = author;
	}
	
	public void setGenre(String genre) {
		this.genre = genre;
	}
	
	public void setBookType(String booktype) {
		this.booktype = booktype;
	}
	
	public void setFashCol(String fashcol) {
		this.fashcol = fashcol;
	}
	
	public void setFashType(String fashtype) {
		this.fashtype = fashtype;
	}
	
	public void setDistributor(String distributor) {
		this.distributor = distributor;
	}
	
	public void setStatType(String stattype) {
		this.stattype = stattype;
	}
	
	//getters
	
	public String getItemId() {
		return this.itemId;
	}

	public int getPriorityLvl() {
		return this.priorityLvl;
	}

	public String getItemName() {
		return this.itemName;
	}

	public String getItemPicUrl() {
		return this.itemPicUrl;
	}

	public String getSpecifics() {
		return this.specifics;
	}

	public String getDescription() {
		return this.description;
	}

	public String getCategory() {
		return this.category;
	}

	public double getUnitPrice() {
		return this.unitPrice;
	}

	public int getQtyAvaiable() {
		return this.qtyAvaiable;
	}

	public String getAssociates() {
		return this.associates;
	}
	
	public String getAuthor() {
		return this.author;
	}
	
	public String getGenre() {
		return this.genre;
	}
	
	public String getBookType() {
		return this.booktype;
	}
	
	public String getFashCol() {
		return this.fashcol;
	}
	
	public String getFashType() {
		return this.fashtype;
	}
	
	public String getDistributor() {
		return this.distributor;
	}
	
	public String getStatType() {
		return this.stattype;
	}
}

