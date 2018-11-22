package com.classes.login;

/**
 * @author Isuru Dananjaya Samarasekara (IT17395588) 
 */

public class LoggedAdmin {
	private String adminId;
	private String adminUsername;
	private String fnameAdmin;
	private String prefixAdmin;
	
	/**
	 * @param adminId
	 * @param adminUsername
	 */
	public LoggedAdmin(String adminId, String adminUsername) {
		this.setAdminId(adminId);
		this.setAdminUserName(adminUsername);
	}
	
	/**
	 * @param adminId
	 */
	public void setAdminId(String adminId) {
		this.adminId = adminId;
	}
	
	/**
	 * @param adminUsername
	 */
	public void setAdminUserName(String adminUsername) {
		this.adminUsername = adminUsername;
	}
	
	/**
	 * @param fnameAdmin
	 */
	public void setFnameAdmin(String fnameAdmin) {
		this.fnameAdmin = fnameAdmin;
	}

	/**
	 * @param prefixAdmin
	 */
	public void setPrefixAdmin(String prefixAdmin) {
		this.prefixAdmin = prefixAdmin;
	}

	/**
	 * @return
	 */
	public String getAdminId() {
		return adminId;
	}
	
	/**
	 * @return
	 */
	public String getAdminUsername() {
		return adminUsername;
	}
	
	/**
	 * @return
	 */
	public String getFnameAdmin() {
		return fnameAdmin;
	}

	/**
	 * @return
	 */
	public String getPrefixAdmin() {
		return prefixAdmin;
	}
}
