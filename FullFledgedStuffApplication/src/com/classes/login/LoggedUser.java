package com.classes.login;

/**
 * @author Isuru Dananjaya Samarasekara (IT17395588) 
 */

public class LoggedUser {
	private String username;
	private int userId;
	private String firstName;
	private String lastName;
	private String validity;
	private String error;
	private String addLine1;
	private String addLine2;
	private String city;
	private String district;
	private String state_province;
	private int zip;
	private String country;
	private String email;
	private String prefix;
	private String day;
	private String month;
	private String year;
	/**
	 * 
	 * @param username
	 */
	public LoggedUser(String username) {
		this.setUsername(username);
	}

	public void loginSetHelp(String addLine1, String addLine2, String city, String district, String state_province, int zip, String country, String email) {
		this.setAddLine1(addLine1);
		this.setAddLine2(addLine2);
		this.setCity(city);
		this.setDistrict(district);
		this.setState_province(state_province);
		this.setZip(zip);
		this.setCountry(country);
		this.setEmail(email);
	}
	
	public void updateHelp(String prefix, String fname, String lname, String email, String day, String month, String year, String addline1, String addline2, String city, String district, String state_province, int zip, String country) {
		this.setPrefix(prefix);
		this.setFirstName(fname);
		this.setLastName(lname);
		this.setEmail(email);
		this.setDay(day);
		this.setMonth(month);
		this.setYear(year);
		this.setAddLine1(addline1);
		this.setAddLine2(addline2);
		this.setCity(city);
		this.setDistrict(district);
		this.setState_province(state_province);
		this.setZip(zip);
		this.setCountry(country);
	}
	
	/**
	 * @param username
	 */
	public void setUsername(String username) {
		this.username = username;
	}

	/**
	 * @param userId
	 */
	public void setUserId(int userId) {
		this.userId = userId;
	}
	
	/**
	 * @param firstName
	 */
	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	/**
	 * @param lastName
	 */
	public void setLastName(String lastName) {
		this.lastName = lastName;
	}
	
	/**
	 * @param validity
	 */
	public void setValidity(String validity) {
		this.validity = validity;
	}

	/**
	 * @param error
	 */
	public void setError(String error) {
		this.error = error;
	}
	
	public void setAddLine1(String addLine1) {
		this.addLine1 = addLine1;
	}

	public void setAddLine2(String addLine2) {
		this.addLine2 = addLine2;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public void setDistrict(String district) {
		this.district = district;
	}

	public void setState_province(String state_province) {
		this.state_province = state_province;
	}

	public void setZip(int zip) {
		this.zip = zip;
	}

	public void setCountry(String country) {
		this.country = country;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public void setPrefix(String prefix) {
		this.prefix = prefix;
	}

	public void setDay(String day) {
		this.day = day;
	}

	public void setMonth(String month) {
		this.month = month;
	}

	public void setYear(String year) {
		this.year = year;
	}

	/**
	 * @return
	 */
	public String getUsername() {
		return this.username;
	}
	
	/**
	 * @return
	 */
	public int getUserId() {
		return this.userId;
	}

	/**
	 * @return
	 */
	public String getFirstName() {
		return this.firstName;
	}

	/**
	 * @return
	 */
	public String getLastName() {
		return this.lastName;
	}
	
	/**
	 * @return
	 */
	public String getValidity() {
		return this.validity;
	}

	/**
	 * @return
	 */
	public String getError() {
		return this.error;
	}

	public String getAddLine1() {
		return this.addLine1;
	}

	public String getAddLine2() {
		return this.addLine2;
	}

	public String getCity() {
		return this.city;
	}

	public String getDistrict() {
		return this.district;
	}

	public String getState_province() {
		return this.state_province;
	}

	public int getZip() {
		return this.zip;
	}

	public String getCountry() {
		return this.country;
	}

	public String getEmail() {
		return this.email;
	}

	public String getPrefix() {
		return prefix;
	}

	public String getDay() {
		return day;
	}

	public String getMonth() {
		return month;
	}

	public String getYear() {
		return year;
	}
}
