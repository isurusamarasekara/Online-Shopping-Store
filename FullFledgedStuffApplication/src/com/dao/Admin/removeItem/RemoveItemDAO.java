package com.dao.Admin.removeItem;

import java.sql.Connection;
import java.util.*;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import java.sql.*;

public class RemoveItemDAO {

	private static String url = "jdbc:mysql://localhost:3306/full_fledged_stuff_application?autoReconnect=true&useSSL=false";
	private static String user = "isuruKarawalaya";
	private static String pass = "DBIsuru";
	private static String query_1 = "DELETE FROM items WHERE itemId=?";

	private static Connection connect() {
		Connection con = null;
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection(url,user,pass);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();		
		}
		
		if(con != null)
			System.out.println("Connected!");
		
		else
			System.out.println("Not Connected!");
		
		return con;
	} 
	
	public static boolean removeItemDirectly(String ItemID) {
		Connection Con = connect();
		PreparedStatement prepState = null;
		
		int count = 0;
		
		try {
			prepState = Con.prepareStatement(query_1);
			
			prepState.setString(1, ItemID);
			System.out.println(ItemID);
			System.out.println(prepState);
			count = prepState.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			
			if(prepState != null) {
				try {
					prepState.close();
					System.out.println("PrepState closed!");
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			
			if(count != 0) {
				try {
					Con.close();
					System.out.println("Connection closed!");
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
		
		if(count != 0) {
			System.out.println("Values were deleted from the table");
			return true;
		}
		
		else {
			System.out.println("Values were not deleted from the table");
			return false;	
		}		
	}
	
	public static ResultSet searchItemName(String ItemName) {
		
		String query_2 = "SELECT itemId, itemName, category FROM items WHERE itemName LIKE ?";
		Connection Con = connect();
		PreparedStatement ps = null;
		try {
			 ps = Con.prepareStatement(query_2);
			
			ps.setString(1, "%"+ItemName+"%");
			
			return ps.executeQuery();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return null;
	}
	
	public static ResultSet searchItemCategory(String category) {
		
		String query_3 = "SELECT itemId, itemName, category FROM items WHERE category LIKE ?";
		Connection Con = connect();
		PreparedStatement ps = null;
		try {
			 ps = Con.prepareStatement(query_3);
			
			ps.setString(1, "%"+category+"%");
			
			return ps.executeQuery();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
				
		return null;
	}
	
	public static ResultSet searchItemNameCategory(String ItemName, String category) {
		
		String query_4 = "SELECT itemId, itemName, category FROM items WHERE itemName LIKE ? AND category LIKE ?";
		Connection Con = connect();
		PreparedStatement ps = null;
		try {
			 ps = Con.prepareStatement(query_4);
			
			ps.setString(1, "%"+ItemName+"%");
			ps.setString(2, "%"+category+"%");
			
			return ps.executeQuery();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
				
		return null;
	}
}