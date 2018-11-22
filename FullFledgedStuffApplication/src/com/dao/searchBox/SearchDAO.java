package com.dao.searchBox;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.dao.searchBox.DBconnection;

public class SearchDAO {
	private static Connection connection;
	public static ResultSet Search(String name,String category) {
		ResultSet rst = null;
		try {
			connection = DBconnection.ConnectDB();
			PreparedStatement pst = connection.prepareStatement("Select * from items Where itemName like ? and category like ?");
			pst.setString(1,"%"+name+"%");
			pst.setString(2,"%"+category+"%");
			
			rst = pst.executeQuery();

			return rst;
			
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
	return rst;
	}
}
