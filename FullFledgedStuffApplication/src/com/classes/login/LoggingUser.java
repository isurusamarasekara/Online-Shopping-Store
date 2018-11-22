package com.classes.login;

/**
 * @author Isuru Dananjaya Samarasekara (IT17395588) 
 */

public class LoggingUser {
	private String username;
	private String password;
	private String loggingValidity;
	private String action;
	
	/**
	 * @param username	-username given at the 'login' form in Login.jsp transfered through controllers.login.Login
	 * @param password  -password given at the 'login' form in Login.jsp transfered through controllers.login.Login
	 */
	public LoggingUser(String username, String password) {
		this.setUsername(username);
		this.setPassword(password);
	}

	/**
	 * @param username
	 */
	public void setUsername(String username) {
		this.username = username;
	}

	/**
	 * @param password
	 */
	public void setPassword(String password) {
		this.password = password;
	}

	/**
	 * @param loggingValidity
	 */
	public void setLoggingValidity(String loggingValidity) {
		this.loggingValidity = loggingValidity;
	}
	
	/**
	 * @param action
	 */
	public void setAction(String action) {
		this.action = action;
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
	public String getPassword() {
		return this.password;
	}
	
	/**
	 * @return
	 */
	public String getLoggingValidity() {
		return this.loggingValidity;
	}
	
	/**
	 * @return
	 */
	public String getAction() {
		return action;
	}
}
