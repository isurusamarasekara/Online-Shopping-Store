package com.dao.searchBox;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBconnection {

	private static Connection connection;
		
	
	public static Connection ConnectDB() throws ClassNotFoundException, SQLException  {
	
		
		
		if (connection == null || connection.isClosed()) {

			Class.forName("com.mysql.jdbc.Driver");
			connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/full_fledged_stuff_application?autoReconnect=true&useSSL=false","isuruKarawalaya","DBIsuru");
		}
		return connection;
		
		
	}
	
	
}
