package com.dao.register;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import com.classes.register.RegisteringUser;

public class RegisterUserDetailsDAO {
	private static String url = "jdbc:mysql://localhost:3306/full_fledged_stuff_application?autoReconnect=true&useSSL=false";
	private static String user = "isuruKarawalaya";
	private static String pass = "DBIsuru";
	private static String query1 = "INSERT INTO registered_user_details(userId, prefix, fName, lName, addLine1, addLine2, city, district, state_Province, zip, country, email) VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?);";
	private static String query2 = "INSERT INTO registered_user_credentials(userId, username, password, question01, answer01, question02, answer02) VALUES(?, ?, ?, ?, ?, ?, ?);";
	private static String query1_1 = "SELECT userId FROM registered_user_credentials ORDER BY userId DESC LIMIT 1;";
	private static String query3 = "DELETE FROM registered_user_details WHERE userId=?;";
	private static String query0_1 = "SELECT * FROM registered_user_details WHERE email=?;";
	private static String query0_2 = "SELECT * FROM registered_user_credentials WHERE username=?;";
	
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
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		if(con != null) {
			// Critical Point Marker
			System.out.println("Connected!");
		}
		
		else {
			// Critical Point Marker
			System.out.println("Not Connected!");
		}
		
	return con;
	}

	/**
	 * 
	 * @param RUser
	 * @return
	 */
	public static RegisteringUser checkTables(RegisteringUser RUser) {
		Connection con0 = connect();
		PreparedStatement prst0_1 = null;
		PreparedStatement prst0_2 = null;
		ResultSet rs0 = null;
		
		try {
			prst0_1 = con0.prepareStatement(query0_1);
			
			prst0_1.setString(1, RUser.getEmail());
			rs0 = prst0_1.executeQuery();
			
			if(rs0.next()) {
				RUser.setError("You already have an account.");
			return RUser;
			}
			
			else {
				prst0_2 = con0.prepareStatement(query0_2);
				
				prst0_2.setString(1, RUser.getUsername());
				rs0 = prst0_2.executeQuery();
				
				if(rs0.next()) {
					RUser.setError("Your entered username is not valid. Choose another.");
				return RUser;	
				}
				
				else 
					return RUser;
			}
		
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
				if (prst0_1 != null) {
					try {
						prst0_1.close();
						// Critical Point Marker
						System.out.println("PreparedStatement0_1 closed!");
					} catch (SQLException e) {
					
					}
				}
				
				if (prst0_2 != null) {
					try {
						prst0_2.close();
						// Critical Point Marker
						System.out.println("PreparedStatement0_2 closed!");
					} catch (SQLException e) {
						
					}
				}
				
				if (con0 != null) {
					try {
						con0.close();
						// Critical Point Marker
						System.out.println("Connection0 closed!");
					} catch(SQLException e) {
					
					}
				}
		}
		return RUser;
	}
	
	/**
	 * 
	 * @param RUser
	 * @return
	 */
	public static boolean registeringUserDetailsWithChecking(RegisteringUser RUser) {
		Connection con1 = connect();
		PreparedStatement prst1 = null;
		int count1 = 0;
		int userId = getLastUserId() + 1;
		
		RegisteringUser.setUserId(userId);
		
		try {
			prst1 = con1.prepareStatement(query1);
			
			prst1.setInt(1, RUser.getUserId());
			prst1.setString(2, RUser.getPrefix());
			prst1.setString(3, RUser.getFname());
			prst1.setString(4, RUser.getLname());
			prst1.setString(5, RUser.getAddline1());
			prst1.setString(6, RUser.getAddline2());
			prst1.setString(7, RUser.getCity());
			prst1.setString(8, RUser.getDistrict());
			prst1.setString(9, RUser.getState_Province());
			prst1.setInt(10, RUser.getZip());
			prst1.setString(11, RUser.getCountry());
			prst1.setString(12, RUser.getEmail());
			
			count1 = prst1.executeUpdate();
		
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
				if (prst1 != null) {
					try {
						prst1.close();
						// Critical Point Marker
						System.out.println("PreparedStatement1 closed!");
					} catch (SQLException e) {
					
					}
				}
				
				if (con1 != null) {
					try {
						con1.close();
						// Critical Point Marker
						System.out.println("Connection1 closed!");
					} catch(SQLException e) {
					
					}
				}
		}
	
		if(count1 != 0)	{
			// Critical Point Marker
			System.out.println("Values were inserted to the database (table - registered_user_details) successfully. " + count1 + " row/s affected.");
		return true;
		}
		
		else {
			// Critical Point Marker
			System.out.println("Values were not inserted to the database (table - registered_user_details). " + count1 + " row/s affected.");
		return false;
		}
	}
	
	/**
	 * 
	 * @param RUser
	 * @return
	 */
	public static boolean registeringUserCredentialsWithChecking(RegisteringUser RUser) {
		Connection con2 = connect();
		PreparedStatement prst2 = null;
		int count2 = 0;
		
		try {
			prst2 = con2.prepareStatement(query2);
			
			prst2.setInt(1, RUser.getUserId());
			prst2.setString(2, RUser.getUsername());
			prst2.setString(3, RUser.getPassword());
			prst2.setString(4, RUser.getQuestion01());
			prst2.setString(5, RUser.getAnswer01());
			prst2.setString(6, RUser.getQuestion02());
			prst2.setString(7, RUser.getAnswer02());
			
			count2 = prst2.executeUpdate();
		
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
				if (prst2 != null) {
					try {
						prst2.close();
						// Critical Point Marker
						System.out.println("PreparedStatement2 closed!");
					} catch (SQLException e) {
					
					}
				}
				
				if (con2 != null) {
					try {
						con2.close();
						// Critical Point Marker
						System.out.println("Connection2 closed!");
					} catch(SQLException e) {
					
					}
				}
		}
		
		if(count2 != 0)	{
			// Critical Point Marker
			System.out.println("Values were inserted to the database (table - registered_user_credentials) successfully. " + count2 + " row/s affected.");
		return true;
		}
		
		else {
			// Critical Point Marker
			System.out.println("Values were not inserted to the database (table - registered_user_credentials). " + count2 + " row/s affected.");
		return false;
		}
	}
	
	/**
	 * 
	 * @return
	 */
	private static int getLastUserId() {
		Connection con3 = connect();
		Statement st3 = null;
		ResultSet rs3 = null;
		
		try {
			st3 = con3.createStatement();
			rs3 = st3.executeQuery(query1_1);
			
			if(rs3.next())
				return rs3.getInt(1);
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			if (st3 != null) {
				try {
					st3.close();
					// Critical Point Marker
					System.out.println("Statement3 closed!");
				} catch (SQLException e) {
				
				}
			}
			
			if (con3 != null) {
				try {
					con3.close();
					// Critical Point Marker
					System.out.println("Connection3 closed!");
				} catch(SQLException e) {
				
				}
			}
	}
		
		return 0;
	}
	
	public static boolean removeFaultyUser(RegisteringUser RUser) {
		Connection con4 = connect();
		PreparedStatement prst4 = null;
		int count4 = 0;
		
		try {
			prst4 = con4.prepareStatement(query3);
			
			prst4.setInt(1, RUser.getUserId());
			
			count4 = prst4.executeUpdate();
		
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
				if (prst4 != null) {
					try {
						prst4.close();
						// Critical Point Marker
						System.out.println("PreparedStatement4 closed!");
					} catch (SQLException e) {
					
					}
				}
				
				if (con4 != null) {
					try {
						con4.close();
						// Critical Point Marker
						System.out.println("Connection4 closed!");
					} catch(SQLException e) {
					
					}
				}
		}
		
		if(count4 != 0)	{
			// Critical Point Marker
			System.out.println("Values were deleted from the database (table - registered_user_details, where userid is : " + RUser.getUserId() + ") successfully. " + count4 + " row/s affected.");
		return true;
		}
		
		else {
			// Critical Point Marker
			System.out.println("Values were not deleted from the database (table - registered_user_details, where userid is :" + RUser.getUserId() + "). " + count4 + " row/s affected.");
		return false;
		}
	}
}
