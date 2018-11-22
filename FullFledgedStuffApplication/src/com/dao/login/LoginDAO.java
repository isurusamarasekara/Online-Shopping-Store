package com.dao.login;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.classes.login.LoggedAdmin;
import com.classes.login.LoggedUser;
import com.classes.login.LoggingUser;
import com.classes.login.pubGen;

public class LoginDAO {
	private static String url = "jdbc:mysql://localhost:3306/full_fledged_stuff_application?autoReconnect=true&useSSL=false";
	private static String user = "isuruKarawalaya";
	private static String pass = "DBIsuru";
	private static String query1 = "SELECT * FROM registered_user_credentials WHERE username=? AND password=?;";
	private static String query2 = "SELECT * FROM registered_user_details WHERE userId=?;";
	private static String query3 = "DELETE FROM registered_user_credentials WHERE userId=?;";
	private static String query4 = "SELECT * FROM registered_admin_credentials WHERE adminUserName=? AND adminPassword=?;";
	private static String query5 = "SELECT * FROM registered_admin_details WHERE adminId=?;";

	/**
	 * 
	 * @return
	 */
	private static Connection connect() {
		Connection con = null;
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection(url, user, pass);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		if(con != null) {
			// Critical Point Marker
			System.out.println("Connected from connect() method!");
		}
		
		else {
			// Critical Point Marker
			System.out.println("Not Connected from connect() method!");
		}
		
	return con;
	}
	
	/**
	 * 
	 * @param LUser
	 * @return
	 */
	public static pubGen<LoggingUser, LoggedUser, LoggedAdmin> checkUser(LoggingUser LUser) {
		Connection con = connect();
		PreparedStatement prst1 = null;		
		PreparedStatement prst2 = null;
		PreparedStatement prst3 = null;
		PreparedStatement prst4 = null;
		PreparedStatement prst5 = null;
		int count;
		LoggedUser lduser = null;
		LoggedAdmin ldadmin = null;

		try {
			// Critical Point Marker
			System.out.println("Attempting to see if there is an user with the username of " + LUser.getUsername() + " and the provided password.(In the registered_user_credentials table).");
			
			prst1 = con.prepareStatement(query1);
			prst1.setString(1, LUser.getUsername());
			prst1.setString(2, LUser.getPassword());
			
			// Critical Point Marker
			System.out.println("The filled query1 is : " + prst1);
			
			ResultSet rs1 = prst1.executeQuery();

			if(rs1.next()) {
				// Critical Point Markers
				System.out.println("A record found on table - registered_user_credentials that matches both the username with the password.");
				
				// Critical Point Marker
				System.out.println("Creating and Filling the LoggedUser object with username and userId.");
				lduser = new LoggedUser(rs1.getString(2));
				lduser.setUserId(rs1.getInt(1));
				
				// Critical Point Marker
				System.out.println("Attempting to see if the user with the retrieved userId of " + lduser.getUserId() + " is in the registered_user_details table.");

				prst2 = con.prepareStatement(query2);
				prst2.setInt(1, lduser.getUserId());
				
				// Critical Point Marker
				System.out.println("The filled query2 is : " + prst2);
				
				ResultSet rs2 = prst2.executeQuery();
				
				if(rs2.next()) {
					// Critical Point Marker
					System.out.println("A record found on registered_user_details that matches the the retrieved userId of " + lduser.getUserId() + ".");
					
					// Critical Point Marker
					System.out.println("Filling the LoggedUser object with prefix, firstname, lastname and the shipping address of the user.");
					lduser.setPrefix(rs2.getString(2));
					lduser.setFirstName(rs2.getString(3));
					lduser.setLastName(rs2.getString(4));
					lduser.loginSetHelp(rs2.getString(6), rs2.getString(7), rs2.getString(8), rs2.getString(9), rs2.getString(10), rs2.getInt(11), rs2.getString(12), rs2.getString(13));
					//lduser.setValidity("USERLVL01");
					
					// Critical Point Marker
					System.out.println("Filling the LoggingUser object with validity and action for user.");
					LUser.setLoggingValidity("User");
					LUser.setAction("UserF"); //User Found
				}
				else {
					// Critical Point Marker
					System.out.println("ODD ??? No record found on registered_user_details that matches the userId retreived from the credentials.");
					
					// Critical Point Marker
					System.out.println("Attempting to remove the faulty user who has the userId " + lduser.getUserId() + ", which is retrieved from the registered_user_credentials table, but oddly so, not in the registered_user_details table");
					prst3 = con.prepareStatement(query3);
					prst3.setInt(1, lduser.getUserId());
					
					// Critical Point Marker
					System.out.println("The filled query3 is : " + prst3);
					
					count = prst3.executeUpdate();
					
					// Critical Point Marker
					System.out.println("There is no LoggedUser.");
					lduser = null;
					
					if(count != 0) {
						// Critical Point Marker
						System.out.println("Faulty user is removed successfully from the registered_user_credentials.");
						
						// Critical Point Marker
						System.out.println("Filling the LoggingUser object with validity and action for user.");
						LUser.setLoggingValidity("User");
						LUser.setAction("UserNF01");	//Not Found On The Details Table, Removed Successfully From Credentials Table
					}
					
					else {
						// Critical Point Marker
						System.out.println("Faulty user is not removed from the registered_user_credentials table");
						
						// Critical Point Marker
						System.out.println("Filling the LoggingUser object with validity and action for user.");
						LUser.setLoggingValidity("User");
						LUser.setAction("UserNF02");	//Not found on the Details Table, Not removed from the credentials table either
					}
				}
			}
			else {
				// Critical Point Marker
				System.out.println("No record found on table - registered_user_credentials that matches both the username with the password.");
				
				// Critical Point Marker
				System.out.println("Attempting to see if there is an admin with the username of " + LUser.getUsername() + " and the provided password.(In the registered_admin_credentials table).");
				prst4 = con.prepareStatement(query4);
				prst4.setString(1, LUser.getUsername());
				prst4.setString(2, LUser.getPassword());
				
				// Critical Point Marker
				System.out.println("The filled query4 is : " + prst4);
				
				ResultSet rs4 = prst4.executeQuery();
				
				if(rs4.next()) {
					// Critical Point Marker
					System.out.println("A record found on table - registered_admin_credentials that matches both the username with the password.");
					
					// Critical Point Marker
					System.out.println("Creating and Filling the LoggedAdmin object with adminId and adminUsername.");
					ldadmin = new LoggedAdmin(rs4.getString(1), rs4.getString(2));
					
					// Critical Point Marker
					System.out.println("Attempting to see if the admin with the retrieved adminId of " + ldadmin.getAdminId() + " is in the registered_admin_details table.");
					prst5 = con.prepareStatement(query5);
					prst5.setString(1, ldadmin.getAdminId());
					
					// Critical Point Marker
					System.out.println("The filled query5 is : " + prst5);
					
					ResultSet rs5 = prst5.executeQuery();
					
					if(rs5.next()) {
						// Critical Point Marker
						System.out.println("A record found on table - registered_admin_details that matches the retrieved adminId of " + ldadmin.getAdminId() + ".");
						
						// Critical Point Marker
						System.out.println("Filling the LoggedAdmin object with title and firstname.");						
						ldadmin.setPrefixAdmin(rs5.getString(2));
						ldadmin.setFnameAdmin(rs5.getString(3));
						
						// Critical Point Marker
						System.out.println("Filling the LoggingUser object with validity and action for admin.");
						LUser.setLoggingValidity("Admin");
						LUser.setAction("AdminF"); //Admin Found
					}
					
					else {
						System.out.println("ODD ??? No record found on registered_admin_details that matches the adminId retreived from the credentials.");
						System.out.println("Another admin should be contacted to fix this issue.");
						
						// Critical Point Marker
						System.out.println("There is no LoggedAdmin.");
						ldadmin = null;
						
						// Critical Point Marker
						System.out.println("Filling the LoggingUser object with validity and action for admin.");
						LUser.setLoggingValidity("Admin");
						LUser.setAction("AdminNF"); //Admin Not Found
					}
				}
				
				else {
					// Critical Point Marker
					System.out.println("There was no user nor an admin with matching username of " + LUser.getUsername() + " and the provided password in any of the credentials tables.");
					
					// Critical Point Marker
					System.out.println("Filling the LoggingUser object with validity and action for Nobody.");					
					LUser.setLoggingValidity("NoBody");
					LUser.setAction("NoEntry");
				}
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if (prst1 != null) {
				try {
					prst1.close();
					// Critical Point Marker
					System.out.println("PreparedStatement1 closed!");
				} catch (SQLException e) {
				
				}
			}
			
			if (prst2 != null) {
				try {
					prst2.close();
					// Critical Point Marker
					System.out.println("PreparedStatement2 closed!");
				} catch (SQLException e) {
				
				}
			}
			
			if (prst3 != null) {
				try {
					prst3.close();
					// Critical Point Marker
					System.out.println("PreparedStatement3 closed!");
				} catch (SQLException e) {
				
				}
			}
			
			if (prst4 != null) {
				try {
					prst4.close();
					// Critical Point Marker
					System.out.println("PreparedStatement4 closed!");
				} catch (SQLException e) {
				
				}
			}
			
			if (prst5 != null) {
				try {
					prst5.close();
					// Critical Point Marker
					System.out.println("PreparedStatement5 closed!");
				} catch (SQLException e) {
				
				}
			}
			
			if (con != null) {
				try {
					con.close();
					// Critical Point Marker
					System.out.println("Connection closed!");
				} catch(SQLException e) {
				
				}
			}
		}
		
		pubGen<LoggingUser, LoggedUser, LoggedAdmin>  all = new pubGen<> (LUser, lduser, ldadmin);
		
	return all;
	}
}

