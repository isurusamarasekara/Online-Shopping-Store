package com.dao.login;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.classes.login.ForgotUser;

/**+
 * 
 * @author Isuru Dananjaya Samarasekara (IT17395588)
 *
 */
public class ForgotDAO {
	private static String url = "jdbc:mysql://localhost:3306/full_fledged_stuff_application?autoReconnect=true&useSSL=false";
	private static String user = "isuruKarawalaya";
	private static String pass = "DBIsuru";
	private static String query01 = "SELECT c.userId, password, question01, answer01, question02, answer02 FROM registered_user_credentials c LEFT OUTER JOIN registered_user_details d ON c.userId=d.userId WHERE username=? AND email=?;";
	private static String query02 = "UPDATE registered_user_credentials SET password=? WHERE userId=?;";
	
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
		
		if(con != null)
			System.out.println("Connected from connect() method!");
		
		else
			System.out.println("Not Connected from connect() method!");
		
	return con;
	}
	
	/**
	 * 
	 */
	public static ForgotUser getAccountDetailsAndSpecifics(ForgotUser FUser) {
		Connection con = connect();
		ResultSet rs1 = null;
		PreparedStatement prst1 = null;
		
		try {
			prst1 = con.prepareStatement(query01);
			
			prst1.setString(1, FUser.getUsername());
			prst1.setString(2, FUser.getEmail());

			System.out.println("The filled query01 is : " + prst1);
			
			rs1 = prst1.executeQuery();
			
			if(rs1.next()) {
				FUser.setUserId(rs1.getInt(1));
				FUser.setPassword(rs1.getString(2));
				FUser.setQuestion01(rs1.getString(3));
				FUser.setAnswer01(rs1.getString(4));
				FUser.setQuestion02(rs1.getString(5));
				FUser.setAnswer02(rs1.getString(6));
				FUser.setAccount(true);
				
			}
			
			else {
				FUser.setUserId(0);
				FUser.setPassword(null);
				FUser.setQuestion01(null);
				FUser.setAnswer01(null);
				FUser.setQuestion02(null);
				FUser.setAnswer01(null);
				FUser.setAccount(false);
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			if (prst1 != null) {
				try {
					prst1.close();
					System.out.println("PreparedStatement1 closed!");
				} catch (SQLException e) {
				
				}
			}
			
			if (con != null) {
				try {
					con.close();
					System.out.println("Connection closed!");
				} catch(SQLException e) {
				
				}
			}
		}
	return FUser;
	}
	
	/**
	 * 
	 * @return
	 */
	public static boolean changePassword(ForgotUser FUser) {
		Connection con = connect();
		int count = 0;
		PreparedStatement prst2 = null;
		
		try {
			prst2 = con.prepareStatement(query02);
			
			prst2.setString(1, FUser.getPassword());
			prst2.setInt(2, FUser.getUserId());
			
			count = prst2.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			if (prst2 != null) {
				try {
					prst2.close();
					System.out.println("PreparedStatement2 closed!");
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			
			if (con != null) {
				try {
					con.close();
					System.out.println("Connection closed!");
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
		
		if(count == 0) {
			return false;
		}
		
		else
			return true;
	}
}
