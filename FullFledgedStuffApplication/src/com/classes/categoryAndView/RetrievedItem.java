package com.classes.categoryAndView;

public class RetrievedItem {
	private String itemId;
	private String itemName;
	private String itemPicUrl;
	private String specifics;
	private String description;
	private String category;
	private double unitPrice;
	private int qtyAvailable;
	private String associates;
	
// book related special attributes
	private String author;
	private String genre;
	
// stationary related special attributes
	private String distributor;
	
// fashion related special attributes

// watches related special attributes

// electronics related special attributes

// art related special attributes

// home_garden related special attributes

// sport related special attributes

// motor related special attributes

// deals related special attributes

	
	
	public RetrievedItem() {}
	
	public RetrievedItem(String itemId, String itemName, String itemPicUrl, String specifics, String description, String category, double unitPrice, int qtyAvailable, String associates) {
		this.setItemId(itemId);
		this.setItemName(itemName);
		this.setItemPicUrl(itemPicUrl);
		this.setSpecifics(specifics);
		this.setDescription(description);
		this.setCategory(category);
		this.setUnitPrice(unitPrice);
		this.setQtyAvailable(qtyAvailable);
		this.setAssociates(associates);
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
	
	public void setUnitPrice(double unitPrice) {
		this.unitPrice = unitPrice;
	}
	
	public void setQtyAvailable(int qtyAvailable) {
		this.qtyAvailable = qtyAvailable;
	}
	
	public void setAssociates(String associates) {
		this.associates = associates;
	}

	public String getItemId() {
		return this.itemId;
	}

	public String getItemName() {
		return this.itemName;
	}

	public String getItemPicUrl() {
		return itemPicUrl;
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

	public int getQtyAvailable() {
		return this.qtyAvailable;
	}

	public String getAssociates() {
		return this.associates;
	}

// book related special attributes setters and getters
	public void bookHelp(String author, String genre) {
		this.setAuthor(author);
		this.setGenre(genre);
	}
	
	public void setAuthor(String author) {
		this.author = author;
	}

	public void setGenre(String genre) {
		this.genre = genre;
	}
	
	public String getAuthor() {
		return author;
	}

	public String getGenre() {
		return genre;
	}

// stationary related special attributes setters and getters
	public void stationaryHelp(String distributor) {
		this.setDistributor(distributor);
	}
	
	public void setDistributor(String distributor) {
		this.distributor = distributor;
	}

	public String getDistributor() {
		return distributor;
	}
	
// fashion related special attributes setters and getters
	public void fashionHelp(String distributor) {
		this.setDistributor(distributor);
	}
	
// watches related special attributes setters and getters
	public void watchesHelp(String xx) {
	}
	
// electronics related special attributes setters and getters
	public void electronicsHelp(String xx) {
	}
	
// art related special attributes setters and getters
	public void artHelp(String xx) {
	}
	
// home_garden related special attributes setters and getters
	public void home_gardenHelp(String xx) {
	}
	
// sport related special attributes setters and getters
	public void sportHelp(String xx) {
	}
	
// motor related special attributes setters and getters
	public void motorHelp(String xx) {
	}
	
// deals related special attributes setters and getters
	public void dealsHelp(String xx) {
	}

}
