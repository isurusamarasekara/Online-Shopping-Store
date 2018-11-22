package com.dao.singleton;

import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnection {
	private static String url = "jdbc:mysql://localhost:3306/full_fledged_stuff_application?autoReconnect=true&useSSL=false";
	private static String user = "isuruKarawalaya";
	private static String pass = "DBIsuru";
	
	private static Connection con = null;
	
	private static DBConnection connection;
	
	private DBConnection() {
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
	}
	
	public static Connection getConnection() {
		if(connection == null) {
			connection = new DBConnection();
		}
		
	return con;
	}
}
