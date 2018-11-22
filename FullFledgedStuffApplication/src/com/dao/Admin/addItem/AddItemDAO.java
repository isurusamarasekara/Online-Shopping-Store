package com.dao.Admin.addItem;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.classes.Admin.addItem.Item;


public class AddItemDAO {
	
	private static String url = "jdbc:mysql://localhost:3306/full_fledged_stuff_application?autoReconnect=true&useSSL=false";
	private static String user = "isuruKarawalaya";
	private static String pass = "DBIsuru";
	private static String query_1 = "INSERT INTO items (itemId,priorityLvl,itemName,itemPicUrl,specifics,description,category,unitPrice,qtyAvailable,associates) VALUES ( ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
	private static String query_2 = "INSERT INTO art (artId) VALUES (?)";
	private static String query_3 = "INSERT INTO book (bookID,author,genre,type) VALUES (?,?,?,?)";
	private static String query_4 = "INSERT INTO electronics (electronicsId) VALUES (?)";
	private static String query_5 = "INSERT INTO fashion (fashionId,type) VALUES (?,?)";
	private static String query_6 = "INSERT INTO home_garden (home_gardenId) VALUES (?)";
	private static String query_7 = "INSERT INTO motor (motorId) VALUES (?)";
	private static String query_8 = "INSERT INTO sport (sportId) VALUES (?)";
	private static String query_9 = "INSERT INTO stationary (stationaryId,distributor,type) VALUES (?,?,?)";
	private static String query_10 = "INSERT INTO watches (watchesId) VALUES (?)";
	
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
	
	public static boolean addItemWithChecking(Item AddItem) {
		Connection Con = connect();
		
		PreparedStatement prepState = null;
		PreparedStatement prepState1 = null;
		
		int count = 0;
		int count1 = 0;
		
		try {
			prepState = Con.prepareStatement(query_1);
			
			prepState.setString(1, AddItem.getItemId());
			prepState.setInt(2, AddItem.getPriorityLvl());
			prepState.setString(3, AddItem.getItemName());
			prepState.setString(4, AddItem.getItemPicUrl());
			prepState.setString(5, AddItem.getSpecifics());
			prepState.setString(6, AddItem.getDescription());
			prepState.setString(7, AddItem.getCategory());
			prepState.setDouble(8, AddItem.getUnitPrice());			
			prepState.setInt(9, AddItem.getQtyAvaiable());
			prepState.setString(10, AddItem.getAssociates());
			
			count = prepState.executeUpdate();
			
			if(AddItem.getCategory().equals("art")) {
				
				prepState = Con.prepareStatement(query_2);
				prepState.setString(1, AddItem.getItemId());
				count1 = prepState.executeUpdate();
		
				if(count1 != 0) {
					System.out.println("Values were inserted to the art table");
					return true;
				}
				
				else {
					System.out.println("Values were not inserted to the art table");
					return false;	
				}
			}
			
			if(AddItem.getCategory().equals("book")) {
				
				prepState = Con.prepareStatement(query_3);
				prepState.setString(1, AddItem.getItemId());
				prepState.setString(2, AddItem.getAuthor());
				prepState.setString(3, AddItem.getGenre());
				prepState.setString(4, AddItem.getBookType());
				count1 = prepState.executeUpdate();
		
				if(count1 != 0) {
					System.out.println("Values were inserted to the book table");
					return true;
				}
				
				else {
					System.out.println("Values were not inserted to the book table");
					return false;	
				}
			}
			
			if(AddItem.getCategory().equals("electronics")) {
				
				prepState = Con.prepareStatement(query_4);
				prepState.setString(1, AddItem.getItemId());
				count1 = prepState.executeUpdate();
		
				if(count1 != 0) {
					System.out.println("Values were inserted to the electronics table");
					return true;
				}
				
				else {
					System.out.println("Values were not inserted to the electronics table");
					return false;	
				}
			}
			
			if(AddItem.getCategory().equals("fashion")) {
				
				prepState = Con.prepareStatement(query_5);
				prepState.setString(1, AddItem.getItemId());
				prepState.setString(2, AddItem.getFashType());
				count1 = prepState.executeUpdate();
		
				if(count1 != 0) {
					System.out.println("Values were inserted to the fashion table");
					return true;
				}
				
				else {
					System.out.println("Values were not inserted to the fashion table");
					return false;	
				}
			}
			
			if(AddItem.getCategory().equals("home_garden")) {
				
				prepState = Con.prepareStatement(query_6);
				prepState.setString(1, AddItem.getItemId());
				count1 = prepState.executeUpdate();
		
				if(count1 != 0) {
					System.out.println("Values were inserted to the home_garden table");
					return true;
				}
				
				else {
					System.out.println("Values were not inserted to the home_garden table");
					return false;	
				}
			}
			
			if(AddItem.getCategory().equals("motor")) {
				
				prepState = Con.prepareStatement(query_7);
				prepState.setString(1, AddItem.getItemId());
				count1 = prepState.executeUpdate();
		
				if(count1 != 0) {
					System.out.println("Values were inserted to the motor table");
					return true;
				}
				
				else {
					System.out.println("Values were not inserted to the motor table");
					return false;	
				}
			}
			
			if(AddItem.getCategory().equals("sport")) {
				
				prepState = Con.prepareStatement(query_8);
				prepState.setString(1, AddItem.getItemId());
				count1 = prepState.executeUpdate();
		
				if(count1 != 0) {
					System.out.println("Values were inserted to the sport table");
					return true;
				}
				
				else {
					System.out.println("Values were not inserted to the sport table");
					return false;	
				}
			}
			
			if(AddItem.getCategory().equals("stationary")) {
				
				prepState = Con.prepareStatement(query_9);
				prepState.setString(1, AddItem.getItemId());
				prepState.setString(2, AddItem.getDistributor());
				prepState.setString(3, AddItem.getStatType());
				count1 = prepState.executeUpdate();
		
				if(count1 != 0) {
					System.out.println("Values were inserted to the stationary table");
					return true;
				}
				
				else {
					System.out.println("Values were not inserted to the stationary table");
					return false;	
				}
			}
			
			if(AddItem.getCategory().equals("watches")) {
				
				prepState = Con.prepareStatement(query_10);
				prepState.setString(1, AddItem.getItemId());
				count1 = prepState.executeUpdate();
		
				if(count1 != 0) {
					System.out.println("Values were inserted to the watches table");
					return true;
				}
				
				else {
					System.out.println("Values were not inserted to the watches table");
					return false;	
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
			
		} finally {
			if (prepState != null) {
				try {
					prepState.close();
					System.out.println("PrepState1 closed!");
					
				} catch (SQLException e) {
					e.printStackTrace();
					
				}
			}

			if (count != 0) {
				try {
					Con.close();
					System.out.println("Connection closed!");
					
				} catch (SQLException e) {
					e.printStackTrace();
					
				}
			}
		}
		
		if(count != 0) {
			System.out.println("Values were inserted to the table");
			return true;
		}
		
		else {
			System.out.println("Values were not inserted to the table");
			return false;	
		}		
	}
}
