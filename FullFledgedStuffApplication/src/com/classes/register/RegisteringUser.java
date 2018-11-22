package com.classes.register;

/**
 * @author Isuru Dananjaya Samarasekara (IT17395588) 
 */

public class RegisteringUser {
	private String prefix;
	private String fname;
	private String lname;
	private String addline1;
	private String addline2;
	private String city;
	private String district;
	private String state_province;
	private int zip;
	private String country;
	private String email;
	private String username;
	private String password;
	private static int userId = 0;
	private String Error;
	private String question01;
	private String answer01;
	private String question02;
	private String answer02;
	
//	private static int min = 1;
	
	public RegisteringUser(String prefix, String fname, String lname, String addline1, String addline2, String city, String district, String state_province, int zip, String country, String email, String username, String password, String question01, String answer01, String question02, String answer02) {
		this.setPrefix(prefix);
		this.setFname(fname);
		this.setLname(lname);
		this.setAddline1(addline1);
		this.setAddline2(addline2);
		this.setCity(city);
		this.setDistrict(district);
		this.setState_Province(state_province);
		this.setZip(zip);
		this.setCountry(country);
		this.setEmail(email);
		this.setUsername(username);
		this.setPassword(password);
		this.setQuestion01(question01);
		this.setAnswer01(answer01);
		this.setQuestion02(question02);
		this.setAnswer02(answer02);
//		this.setUserId();
	}

	/**
	 * @param prefix the prefix to set
	 */
	public void setPrefix(String prefix) {
		this.prefix = prefix;
	}

	/**
	 * @param fname the fname to set
	 */
	public void setFname(String fname) {
		this.fname = fname;
	}

	/**
	 * @param lname the lname to set
	 */
	public void setLname(String lname) {
		this.lname = lname;
	}

	/**
	 * @param addline1 the addline1 to set
	 */
	public void setAddline1(String addline1) {
		this.addline1 = addline1;
	}

	/**
	 * @param addline2 the addline2 to set
	 */
	public void setAddline2(String addline2) {
		this.addline2 = addline2;
	}

	/**
	 * @param city the city to set
	 */
	public void setCity(String city) {
		this.city = city;
	}

	/**
	 * 
	 * @param district
	 */
	public void setDistrict(String district) {
		this.district = district;
	}
	
	/**
	 * @param state the state to set
	 */
	public void setState_Province(String state_province) {
		this.state_province = state_province;
	}

	/**
	 * 
	 * @param zip
	 */
	public void setZip(int zip) {
		this.zip = zip;
	}
	
	/**
	 * 
	 * @param country
	 */
	public void setCountry(String country) {
		this.country = country;
	}
	
	/**
	 * @param email the email to set
	 */
	public void setEmail(String email) {
		this.email = email;
	}

	/**
	 * @param username the username to set
	 */
	public void setUsername(String username) {
		this.username = username;
	}

	/**
	 * @param password the password to set
	 */
	public void setPassword(String password) {
		this.password = password;
	}
	
	/**
	 * 
	 * @param userId
	 */
	public static void setUserId(int userId) {
		RegisteringUser.userId = userId;
	}
	
	/**
	 * 
	 * @param Error
	 */
	public void setError(String Error) {
		this.Error = Error;
	}
	
	/**
	 * 
	 * @param question01
	 */
	public void setQuestion01(String question01) {
		this.question01 = question01;
	}	
	
	/**
	 * 
	 * @param answer01
	 */
	public void setAnswer01(String answer01) {
		this.answer01 = answer01;
	}
	
	/**
	 * 
	 * @param question02
	 */
	public void setQuestion02(String question02) {
		this.question02 = question02;
	}
	/**
	 * 
	 * @param answer02
	 */
	
	public void setAnswer02(String answer02) {
		this.answer02 = answer02;
	}
	
	/**
	 * @return the prefix
	 */
	public String getPrefix() {
		return this.prefix;
	}

	/**
	 * @return the fname
	 */
	public String getFname() {
		return this.fname;
	}

	/**
	 * @return the lname
	 */
	public String getLname() {
		return this.lname;
	}

	/**
	 * @return the addline1
	 */
	public String getAddline1() {
		return this.addline1;
	}

	/**
	 * @return the addline2
	 */
	public String getAddline2() {
		return this.addline2;
	}

	/**
	 * @return the city
	 */
	public String getCity() {
		return this.city;
	}

	public String getDistrict() {
		return this.district;
	}
	
	/**
	 * @return the state
	 */
	public String getState_Province() {
		return this.state_province;
	}

	/**
	 * 
	 * @return
	 */
	public int getZip() {
		return this.zip;
	}
	
	/**
	 * 
	 * @return
	 */
	public String getCountry() {
		return this.country;
	}
	
	/**
	 * @return the email
	 */
	public String getEmail() {
		return this.email;
	}

	/**
	 * @return the username
	 */
	public String getUsername() {
		return this.username;
	}

	/**
	 * @return the password
	 */
	public String getPassword() {
		return this.password;
	}
	
	/**
	 * 
	 * @return
	 */
	public int getUserId() {
		return RegisteringUser.userId;
	}
	
	/**
	 * 
	 * @return
	 */
	public String getError() {
		return this.Error;
	}

	/**
	 * 
	 * @return
	 */
	public String getQuestion01() {
		return question01;
	}

	/**
	 * 
	 * @return
	 */
	public String getAnswer01() {
		return answer01;
	}

	/**
	 * 
	 * @return
	 */
	public String getQuestion02() {
		return question02;
	}

	/**
	 * 
	 * @return
	 */
	public String getAnswer02() {
		return answer02;
	}
	
	
//	private int getThisUsersId() {
//		return min++;
//	}
	
}
