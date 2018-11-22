package com.dao.orderConfirmation;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.classes.login.LoggedUser;
import com.classes.orderConfirmation.Order;
import com.classes.shoppingcart.Cart;

public class OrderConfirmationDAO {
	private static String url = "jdbc:mysql://localhost:3306/full_fledged_stuff_application?autoReconnect=true&useSSL=false";
	private static String user = "isuruKarawalaya";
	private static String pass = "DBIsuru";
	private static String query01 = "SELECT orderId FROM orders ORDER BY orderId DESC LIMIT 1;";
	private static String query02 = "INSERT INTO orders(userId, itemId, orderId, quantity, orderTotal, addLine1, addLine2, city, district, state_province, zip, country) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?);";
	private static String query03 = "SELECT qtyAvailable FROM items WHERE itemId = ?;";
	private static String query04 = "UPDATE items SET qtyAvailable = ? WHERE itemId = ?;";
	private Connection connect() {
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
	
	public String[] processAll(Order order) {
		String info[] = storeOrder(order);
		String reply = info[0];
		int count4 = 0;
		String state = null;
		
		if(reply.equals("All")) {
			Connection con = connect();
			int qtyAvailable = 0; 
			int qtyRemaining = 0;
			int count3;
			
			for(int i = 0; i < order.getCart().getNumOfItems(); i++) {
				count3 = 0;
				PreparedStatement prst3 = null;
				PreparedStatement prst4 = null;
				try {
					prst3 =con.prepareStatement(query03);
					prst3.setString(1, order.getCart().getCartItem(i).getItemId());
					ResultSet rs2 = prst3.executeQuery();
					rs2.next();
					qtyAvailable = rs2.getInt(1);
					qtyRemaining = qtyAvailable - order.getCart().getCartItem(i).getQuantity();
					
					prst4 =con.prepareStatement(query04);
					prst4.setInt(1, qtyRemaining);
					prst4.setString(2, order.getCart().getCartItem(i).getItemId());
					count3 = prst4.executeUpdate();
					
					if(count3 != 1)
						break;
					
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				
				count4++;
			}
		if(count4 == order.getCart().getNumOfItems())
			state = "done";
		}
		
		
		String info1[] = new String[2];
		info1[0] = state;
		info1[1] = info[1];
	return info1;
	}
	
	public String[] storeOrder(Order order) {
		LoggedUser LD = order.getLD();
		Cart cart = order.getCart();
		String newOrderId = getOrderId();
		
		Connection con = connect();
		int count1 = 0;
		int count2 = 0;
		
		for(int i = 0; i < cart.getNumOfItems(); i++) {
			PreparedStatement prst2 = null;
			
			try {
				prst2 = con.prepareStatement(query02);
				prst2.setInt(1, LD.getUserId());
				prst2.setString(2, cart.getCartItem(i).getItemId());
				prst2.setString(3, newOrderId);
				prst2.setInt(4, cart.getCartItem(i).getQuantity());
				prst2.setDouble(5, cart.getCartItem(i).getSubTotalItem());
		
				if(order.getAddressType().equals("old")) {
					prst2.setString(6, LD.getAddLine1());
					prst2.setString(7, LD.getAddLine2());
					prst2.setString(8, LD.getCity());
					prst2.setString(9, LD.getDistrict());
					prst2.setString(10, LD.getState_province());
					prst2.setInt(11, LD.getZip());
					prst2.setString(12, LD.getCountry());
				}
			
				else if(order.getAddressType().equals("new")) {
					prst2.setString(6, order.getNewAddLine1());
					prst2.setString(7, order.getNewAddLine2());
					prst2.setString(8, order.getNewCity());
					prst2.setString(9, order.getNewDistrict());
					prst2.setString(10, order.getNewState_province());
					prst2.setInt(11, order.getNewZip());
					prst2.setString(12, order.getNewCountry());
				}
				
			count1 = prst2.executeUpdate();
			
			if(count1 > 0) {
				System.out.println("Values were inserted to the database (table - orders) successfully. " + count1 + " row/s affected.");
				count2++;
			} else if(count1 == 0) {
				System.out.println("Values were not inserted to the database (table - orders). " + count1 + " row/s affected.");
			}
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		System.out.println("All together " + count2 + " number of seperate item records were entered into the table 'orders' with the orderId of " + newOrderId + ".");
		System.out.println("There are " + cart.getNumOfItems() + " number of items in the cart.");
		
		String reply = null;
		if (cart.getNumOfItems() == count2)
			reply = "All";
		
		else if (cart.getNumOfItems() > count2)
			reply = "Some";
		
		else if (cart.getNumOfItems() < count2)
			reply = "More";
		
		String info[] = new String[2];
		info[0] = reply;
		info[1] = newOrderId;
	return info;
	}
	
	public String getOrderId() {
		Connection con = connect();
		PreparedStatement prst1 = null;
		String lastOrderId = null;
		String newOrderId = null;
		
		try {
			prst1 = con.prepareStatement(query01);
			ResultSet rs1 = prst1.executeQuery();
			
			if(rs1.next()) {
				lastOrderId = rs1.getString(1);
			} else {
				lastOrderId = null;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		if(lastOrderId != null && !lastOrderId.equals("")) {
			int orderInt = Integer.parseInt(lastOrderId.substring(4));
			orderInt++;
			String orderIntString = null;
			
			if(orderInt <= 9999) {
				if(orderInt > 0 && orderInt < 10)
					orderIntString = "000" + orderInt;
				
				else if(orderInt > 9 && orderInt < 100)
					orderIntString = "00" + orderInt;
				
				else if(orderInt > 99 && orderInt < 1000)
					orderIntString = "0" + orderInt;
				
				else if(orderInt > 999 && orderInt < 10000)
					orderIntString = Integer.toString(orderInt);
				
				newOrderId = lastOrderId.substring(0, 4).concat(orderIntString);
			} else {
				char subCat01 = lastOrderId.charAt(2);
				char subCat02 = lastOrderId.charAt(3);
				char newSubCat02;
				char newSubCat01;
				
				if(subCat02 != 'Z') {
					newSubCat01 = subCat01;
					newSubCat02 = (char) (subCat02 + 1);
				} else {
					newSubCat01= (char) (subCat01 + 1);
					newSubCat02 = 'A';
				}
				newOrderId = newSubCat01 + newSubCat02 + "0001";
			}
		} else {
			newOrderId = "ORAA0001";
		}
	return newOrderId;
	}
	
}
