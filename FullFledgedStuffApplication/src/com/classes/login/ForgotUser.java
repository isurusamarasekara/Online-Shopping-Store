package com.classes.login;

/**
 * @author Isuru Dananjaya Samarasekara (IT17395588) 
 */

public class ForgotUser {
	private String username;
	private String email;
	private int userId;
	private String password;
	private String question01;
	private String answer01;
	private String question02;
	private String answer02;

	private boolean account;
	
	public ForgotUser(String username, String email) {
		this.setUsername(username);
		this.setEmail(email);
	}
	
	public void setUsername(String username) {
		this.username = username;
	}
	
	public void setEmail(String email) {
		this.email = email;
	}
	
	public void setUserId(int userId) {
		this.userId = userId;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public void setQuestion01(String question01) {
		this.question01 = question01;
	}

	public void setAnswer01(String answer01) {
		this.answer01 = answer01;
	}

	public void setQuestion02(String question02) {
		this.question02 = question02;
	}

	public void setAnswer02(String answer02) {
		this.answer02 = answer02;
	}

	public void setAccount(boolean account) {
		this.account = account;
	}

	public String getUsername() {
		return this.username;
	}
	
	public String getEmail() {
		return this.email;
	}

	public int getUserId() {
		return this.userId;
	}

	public String getPassword() {
		return this.password;
	}

	public String getQuestion01() {
		return this.question01;
	}

	public String getAnswer01() {
		return this.answer01;
	}

	public String getQuestion02() {
		return this.question02;
	}

	public String getAnswer02() {
		return this.answer02;
	}
	
	public boolean getAccount() {
		return this.account;
	}
}
