package com.dao.Admin.updateItem;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.classes.Admin.addItem.Item;
;

public class UpdateItemDAO {

	private static String url = "jdbc:mysql://localhost:3306/full_fledged_stuff_application?autoReconnect=true&useSSL=false";
	private static String user = "isuruKarawalaya";
	private static String pass = "DBIsuru";
	private static String query_1 = "UPDATE items SET itemName=? WHERE itemId=?";
	
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
	
	public static Item searchItemID(String ItemID) {
		
		String query_2 = "SELECT * FROM items WHERE itemId = ?";
		Connection Con = connect();
		PreparedStatement ps = null;
		try {
			ps = Con.prepareStatement(query_2);
			
			ps.setString(1, ItemID);

			ResultSet rs = ps.executeQuery();

			rs.next();
				
			String id = rs.getString(1);
			int prio = rs.getInt(2);
			String name = rs.getString(3);
			String url = rs.getString(4);
			String specs = rs.getString(5);
			String desc = rs.getString(6);
			String cat = rs.getString(7);
			double price = rs.getDouble(8);
			int qty = rs.getInt(9);
			String asso = rs.getString(10);
			
			Item item = new Item(id, prio, name, url, specs, desc, cat, price, qty, asso);
			
			if(cat.equals("book")) {
				
				String query_22 = "SELECT * FROM book WHERE itemId LIKE ?";
				ps = Con.prepareStatement(query_22);
				ResultSet rss = ps.executeQuery();
				
				rss.next();
				
				item.setAuthor(rss.getString(2));
				item.setGenre(rss.getString(3));
				item.setBookType(rss.getString(4));
			}
			
			if(cat.equals("fashion")) {
				
				String query_222 = "SELECT * FROM fashion WHERE itemId LIKE ?";
				ps = Con.prepareStatement(query_222);
				ResultSet rss = ps.executeQuery();
				
				rss.next();
				
				item.setFashCol(rss.getString(2));
				item.setGenre(rss.getString(3));
			}
			
			if(cat.equals("stationary")) {
				
				String query_2222 = "SELECT * FROM stationary WHERE itemId LIKE ?";
				ps = Con.prepareStatement(query_2222);
				ResultSet rss = ps.executeQuery();
				
				rss.next();
				
				item.setDistributor(rss.getString(2));
				item.setStatType(rss.getString(3));
			}
			
			return item;
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		

		return null;
	}
	
	public static ResultSet searchBook(String ItemID) {
		
		String query_3 = "SELECT * FROM book WHERE itemId LIKE ?";
		Connection Con = connect();
		PreparedStatement ps = null;
		try {
			 ps = Con.prepareStatement(query_3);
			
			ps.setString(1, "%"+ItemID+"%");
			
			return ps.executeQuery();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return null;
	}
	
	public static ResultSet searchFashion(String ItemID) {
		
		String query_4 = "SELECT * FROM fashion WHERE itemId LIKE ?";
		Connection Con = connect();
		PreparedStatement ps = null;
		try {
			 ps = Con.prepareStatement(query_4);
			
			ps.setString(1, "%"+ItemID+"%");
			
			return ps.executeQuery();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return null;
	}
	
	public static ResultSet searchStationary(String ItemID) {
		
		String query_5 = "SELECT * FROM stationary WHERE itemId LIKE ?";
		Connection Con = connect();
		PreparedStatement ps = null;
		try {
			 ps = Con.prepareStatement(query_5);
			
			ps.setString(1, "%"+ItemID+"%");

			return ps.executeQuery();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return null;
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
