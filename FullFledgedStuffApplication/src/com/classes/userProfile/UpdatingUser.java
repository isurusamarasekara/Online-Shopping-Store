package com.classes.userProfile;

public class UpdatingUser {
	private String prefix;
	private String fname;
	private String lname;
	private String email;
	private String day;
	private String month;
	private String year;
	private String addline1;
	private String addline2;
	private String city;
	private String district;
	private String state_province;
	private int zip;
	private String country;
	
	private String question01;
	private String question02;
	private String answer01;
	private String answer02;

	public UpdatingUser(String question01, String answer01, String question02, String answer02) {
		this.setQuestion01(question01);
		this.setAnswer01(answer01);
		this.setQuestion02(question02);
		this.setAnswer02(answer02);
	}
	
	public UpdatingUser(String prefix, String fname, String lname, String email, String day, String month, String year, String addline1, String addline2, String city, String district, String state_province, int zip, String country) {
		this.setPrefix(prefix);
		this.setFname(fname);
		this.setLname(lname);
		this.setEmail(email);
		this.setDay(day);
		this.setMonth(month);
		this.setYear(year);
		this.setAddline1(addline1);
		this.setAddline2(addline2);
		this.setCity(city);
		this.setDistrict(district);
		this.setState_province(state_province);
		this.setZip(zip);
		this.setCountry(country);
	}

	public void setPrefix(String prefix) {
		this.prefix = prefix;
	}
	
	public void setFname(String fname) {
		this.fname = fname;
	}
	
	public void setLname(String lname) {
		this.lname = lname;
	}
	
	public void setEmail(String email) {
		this.email = email;
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
	
	public void setAddline1(String addline1) {
		this.addline1 = addline1;
	}
	
	public void setAddline2(String addline2) {
		this.addline2 = addline2;
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
	
	public String getPrefix() {
		return prefix;
	}
	
	public String getFname() {
		return fname;
	}
	
	public String getLname() {
		return lname;
	}
	
	public String getEmail() {
		return email;
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
	
	public String getAddline1() {
		return addline1;
	}
	
	public String getAddline2() {
		return addline2;
	}
	
	public String getCity() {
		return city;
	}
	
	public String getDistrict() {
		return district;
	}
	
	public String getState_province() {
		return state_province;
	}
	
	public int getZip() {
		return zip;
	}
	
	public String getCountry() {
		return country;
	}

	public String getQuestion01() {
		return question01;
	}

	public void setQuestion01(String question01) {
		this.question01 = question01;
	}

	public String getQuestion02() {
		return question02;
	}

	public void setQuestion02(String question02) {
		this.question02 = question02;
	}

	public String getAnswer01() {
		return answer01;
	}

	public void setAnswer01(String answer01) {
		this.answer01 = answer01;
	}

	public String getAnswer02() {
		return answer02;
	}

	public void setAnswer02(String answer02) {
		this.answer02 = answer02;
	}
}
