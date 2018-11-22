package com.classes.login;

/**
 * @author Isuru Dananjaya Samarasekara (IT17395588) 
 */

public class pubGen<T1, T2, T3>{
	T1 LUser;
	T2 lduser;
	T3 ldadmin;
	
	/**
	 * @param LUser
	 * @param lduser
	 * @param ldadmin
	 */
	public pubGen(T1 LUser, T2 lduser, T3 ldadmin) {
		this.setLUser(LUser);
		this.setLduser(lduser);
		this.setLdadmin(ldadmin);
	}
	
	/**
	 * @param LUser
	 */
	public void setLUser(T1 LUser) {
		this.LUser = LUser;
	}

	/**
	 * @param lduser
	 */
	public void setLduser(T2 lduser) {
		this.lduser = lduser;
	}

	/**
	 * @param ldadmin
	 */
	public void setLdadmin(T3 ldadmin) {
		this.ldadmin = ldadmin;
	}
	
	/**
	 * @return
	 */
	public T1 getLUser() {
		return this.LUser;
	}

	/**
	 * @return
	 */
	public T2 getLduser() {
		return this.lduser;
	}

	/**
	 * @return
	 */
	public T3 getLdadmin() {
		return this.ldadmin;
	}
}
