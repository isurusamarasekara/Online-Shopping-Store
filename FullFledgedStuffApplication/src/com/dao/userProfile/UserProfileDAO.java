package com.dao.userProfile;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.classes.login.LoggedUser;
import com.classes.userProfile.AllOrderData;
import com.classes.userProfile.UpdatingUser;

public class UserProfileDAO {
	private static String url = "jdbc:mysql://localhost:3306/full_fledged_stuff_application?autoReconnect=true&useSSL=false";
	private static String user = "isuruKarawalaya";
	private static String pass = "DBIsuru";
	private static String query01 = "SELECT itemId, orderId, quantity, orderTotal, DATE_FORMAT(DATE(orderDateTime), '%Y-%m-%d'), status FROM orders WHERE userId = ? AND DATEDIFF(CURDATE(), orderDateTime) <= 180 ORDER BY orderDateTime DESC;";
	private static String query02 = "SELECT itemId, itemName, itemPicUrl, specifics, description, category FROM items WHERE itemId IN (SELECT DISTINCT itemId FROM orders WHERE userId = ? AND DATEDIFF(CURDATE(), orderDateTime) <= 180 ORDER BY orderDateTime DESC);";
	//private static String query03 = "SELECT itemId, itemName, itemPicUrl, specifics, description, category FROM items WHERE itemId = ?;";
	private static String query03 = "UPDATE registered_user_details SET prefix=?, fName=?, lName=?, addLine1=?, addLine2=?, city=?, district=?, state_Province=?, zip=?, country=?, email=? WHERE userId=?;";
	private static String query04 = "SELECT password FROM registered_user_credentials WHERE userId=?;";
	private static String query05 = "UPDATE registered_user_credentials SET password=? WHERE userId=?";
	private static String query06 = "SELECT question01, answer01, question02, answer02 FROM registered_user_credentials WHERE userId=?;"; 
	private static String query07 = "UPDATE registered_user_credentials SET question01=?, answer01=?, question02=?, answer02=? WHERE userId=?;";
	private static String query08 = "DELETE FROM registered_user_details WHERE userId=?;";
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
	
	public AllOrderData getOrderDetails(int userId){
		Connection con = connect();
		PreparedStatement prst1 = null;
		PreparedStatement prst2 = null;

		AllOrderData AOD = new AllOrderData(userId);
		
		try {
			prst1 = con.prepareStatement(query01);
			prst1.setInt(1, userId);
			ResultSet rs1 = prst1.executeQuery();
			
			while(rs1.next()) {
				AOD.addOrderedItem(rs1.getString(1), rs1.getString(2), rs1.getInt(3), rs1.getDouble(4), rs1.getString(5), rs1.getString(6));
			}
			
			prst2 = con.prepareStatement(query02);
			prst2.setInt(1, userId);
			ResultSet rs2 = prst2.executeQuery();
			
			while(rs2.next()) {
				AOD.addItemSpecific(rs2.getString(1), rs2.getString(2), rs2.getString(3), rs2.getString(4), rs2.getString(5), rs2.getString(6));
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	return AOD;
	}
	
	public boolean updateUserDetails(LoggedUser LDUser, UpdatingUser UUser) {
		Connection con = connect();
		PreparedStatement prst3 = null;
		int count = 0;
		
		try {
			prst3 = con.prepareStatement(query03);
			
			prst3.setString(1, UUser.getPrefix());
			prst3.setString(2, UUser.getFname());
			prst3.setString(3, UUser.getLname());
			prst3.setString(4, UUser.getAddline1());
			prst3.setString(5, UUser.getAddline2());
			prst3.setString(6, UUser.getCity());
			prst3.setString(7, UUser.getDistrict());
			prst3.setString(8, UUser.getState_province());
			prst3.setInt(9, UUser.getZip());
			prst3.setString(10, UUser.getCountry());
			prst3.setString(11, UUser.getEmail());
			prst3.setInt(12, LDUser.getUserId());
			
			count = prst3.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		if(count == 0)
			return false;
		
		else if(count == 1)
			return true;
		
		else
			return false;
	}
	
	public boolean checkUsername(LoggedUser LDUser, String oldPassword) {
		Connection con = connect();
		PreparedStatement prst4 = null;
		
		try {
			prst4 = con.prepareStatement(query04);
			prst4.setInt(1, LDUser.getUserId());
			ResultSet rs = prst4.executeQuery();
			
			rs.next();
			if(rs.getString(1).equals(oldPassword))
				return true;
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	return false;
	}
	
	public boolean changeCredentials(LoggedUser LDUser, String newPassword) {
		Connection con = connect();
		PreparedStatement prst5 = null;
		int count = 0;
		
		try {
			prst5 = con.prepareStatement(query05);
			prst5.setString(1, newPassword);
			prst5.setInt(2, LDUser.getUserId());
			count = prst5.executeUpdate();
			
			if(count == 1)
				return true;
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	return false;
	}
	
	public UpdatingUser getEmergencyDetails(LoggedUser LDUser) {
		Connection con = connect();
		PreparedStatement prst6 = null;
		UpdatingUser UU = null;
		
		try {
			prst6 = con.prepareStatement(query06);
			prst6.setInt(1, LDUser.getUserId());
			ResultSet rs = prst6.executeQuery();
			
			if(rs.next()) {
				UU = new UpdatingUser(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4));
			}
			
			else
				UU = null;
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	return UU;
	}
	
	public boolean changeRecovery(LoggedUser LDUser, UpdatingUser UU) {
		Connection con = connect();
		PreparedStatement prst7 = null;
		int count = 0;
		
		try {
			prst7 = con.prepareStatement(query07);
			prst7.setString(1, UU.getQuestion01());
			prst7.setString(2, UU.getAnswer01());
			prst7.setString(3, UU.getQuestion02());
			prst7.setString(4, UU.getAnswer02());
			prst7.setInt(5,LDUser.getUserId());

			count = prst7.executeUpdate();
			
			if(count == 1) {
				return true;
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	return false;
	}
	
	public boolean deleteMe(LoggedUser LDUser) {
		Connection con = connect();
		PreparedStatement prst8 = null;
		int count = 0;
		
		try {
			prst8 = con.prepareStatement(query08);
			prst8.setInt(1, LDUser.getUserId());

			count = prst8.executeUpdate();
			
			if(count == 1) {
				return true;
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	return false;
	}
}
