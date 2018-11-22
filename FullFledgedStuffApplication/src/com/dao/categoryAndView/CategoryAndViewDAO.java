package com.dao.categoryAndView;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import com.classes.categoryAndView.RetrievedItem;

public class CategoryAndViewDAO {
	private static String url = "jdbc:mysql://localhost:3306/full_fledged_stuff_application?autoReconnect=true&useSSL=false";
	private static String user = "isuruKarawalaya";
	private static String pass = "DBIsuru";
	
	
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
	
	public ArrayList<RetrievedItem> categoryRetrieve(String category) {
		String query_category = "SELECT * FROM items i LEFT OUTER JOIN " + category + " x ON i.itemId = x." + category + "Id WHERE i.category='" + category + "' ORDER BY priorityLvl;";

		Connection con = connect();
		Statement st_category = null;
		int count = 0;
		ArrayList<RetrievedItem> categoryItemList = new ArrayList<> ();
		int q = 0;
		ResultSet rs_category = null;
		
		try {
			st_category = con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
			
			rs_category = st_category.executeQuery(query_category);
			
			if(!rs_category.next()) {
				categoryItemList = null;
			}
			
			else {
				rs_category.beforeFirst();

				while(rs_category.next()) {
					count = count + 1;
				}
				
				rs_category.beforeFirst();
					
					while(rs_category.next()) {
						q++;
						
						if(q > 21)
							break;
						
						RetrievedItem RI = new RetrievedItem(rs_category.getString(1), rs_category.getString(3), rs_category.getString(4), rs_category.getString(5), rs_category.getString(6), rs_category.getString(7), rs_category.getDouble(8),  rs_category.getInt(9),  rs_category.getString(10));
						
						if(category == "book") {
							RI.bookHelp(rs_category.getString(12), rs_category.getString(13));
						}
						
						else if(category == "stationary") {
							RI.stationaryHelp(rs_category.getString(12));
						}
							
						else if(category == "fashion") {
							RI.fashionHelp(rs_category.getString(12));
						}
						
						else if(category == "watches") {
							RI.watchesHelp(rs_category.getString(12));
						}
						
						else if(category == "electronics") {
							RI.electronicsHelp(rs_category.getString(12));
						}
						
						else if(category == "art") {
							RI.artHelp(rs_category.getString(12));
						}
						
						else if(category == "home_garden") {
							RI.home_gardenHelp(rs_category.getString(12));
						}
						
						else if(category == "sport") {
							RI.sportHelp(rs_category.getString(12));
						}
						
						else if(category == "motor") {
							RI.motorHelp(rs_category.getString(12));
						}
						
						else if(category == "deals") {
							RI.dealsHelp(rs_category.getString(12));
						}
						categoryItemList.add(RI);
					}
			}
		} catch (SQLException e) {
			e.printStackTrace();
			
		} finally {
			if (rs_category != null) {
				try {
					rs_category.close();
					// Critical Point Marker
					System.out.println("Statement closed!");
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
		
	return categoryItemList;
	}
}
