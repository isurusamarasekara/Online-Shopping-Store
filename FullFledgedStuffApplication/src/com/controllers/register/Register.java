package com.controllers.register;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.lang.String;

import com.classes.register.RegisteringUser;
import com.dao.register.RegisterUserDetailsDAO;

/**
 * Servlet implementation class Register
 */
@WebServlet(description = "Registration Details Distribution and Check")
public class Register extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * 
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String prefix = request.getParameter("prefix");
		String fname = request.getParameter("fname");
		String lname = request.getParameter("lname");
		String email = request.getParameter("email");
		//int d = request.getParameter("day");
		//int month = request.getParameter("month");
		//String year = request.getParameter("year");
		String addline1 = request.getParameter("addline1");
		String addline2 = request.getParameter("addline2");
		String city = request.getParameter("city");
		String district = request.getParameter("district");
		String state_province = request.getParameter("state_province");
		int zip = Integer.parseInt(request.getParameter("zip"));
		String country = request.getParameter("country");
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String question01 = request.getParameter("question01");
		String answer01 = request.getParameter("answer01");
		String question02 = request.getParameter("question02");
		String answer02 = request.getParameter("answer02");
		
		PrintWriter out = response.getWriter();
		
		RegisteringUser RegisteringUsr = new RegisteringUser(prefix, fname, lname, addline1, addline2, city, district, state_province, zip, country, email, username, password, question01, answer01, question02, answer02);
		
//		request.setAttribute("RegisteringUsr", RegisteringUsr);
//		RequestDispatcher dispatcher = request.getRequestDispatcher("/registerValidationPath");
//		dispatcher.forward(request, response);
		
		String check = RegisterUserDetailsDAO.checkTables(RegisteringUsr).getError();
		
		if(check == null) {
			// Critical Point Markers
			System.out.println("*The same email as " + RegisteringUsr.getEmail() + " was not found in the database table - registered_user_details.");
			System.out.println("*The same username as " + RegisteringUsr.getUsername() + " was not found in the database table - registered_user_credentials.");
			System.out.println("*Entering Data Started.");
			
			if(RegisterUserDetailsDAO.registeringUserDetailsWithChecking(RegisteringUsr)) {
				// Critical Point Marker
				System.out.println("**Personal details and billing details of the new user " + fname + ", with the username of " + username + " ... ENTERED SUCCESSFULLY.");
				
				if(RegisterUserDetailsDAO.registeringUserCredentialsWithChecking(RegisteringUsr)) {
					// Critical Point Markers
					System.out.println("***Account details of the new user " + fname + ", with the username of " + username + " ... ENTERED SUCCESSFULLY.");
					System.out.println("***Done with all of the registering proccess. This is from the registerController.");
					System.out.println("***The new user will be directed to login page automatically");
					
					response.sendRedirect("Login.jsp");
				}
				
				else {
					System.out.println("****Account details of the new user who is attempting to register with the name of " + fname + ", and with the username of " + username + " ... WAS NOT ENTERED.");
					System.out.println("****Attempting to remove personal details and billing details of the new user " + fname + ", with the username of " + username + ".");

						if(RegisterUserDetailsDAO.removeFaultyUser(RegisteringUsr)) {
							// Critical Point Marker
							System.out.println("*****Removal of personal details and billing details Successfull.");
							
							response.sendRedirect("Register.jsp");
						}
						
						else
							out.println("******Technical Issue. Please refrain from registering until it is fixed.");
				}
						
			}
			
			else {
				// Critical Point Marker
				System.out.println("*******New user's personal and billing details were not entered to the database. Hence, nothing got inserted");
				
				response.sendRedirect("Register.jsp");
			}
		}
		
		else {
			// Critical Point Marker
			System.out.println("Similar Email or Username is found. Cannot register!");
			
			request.setAttribute("message", check);
			RequestDispatcher rd = request.getRequestDispatcher("Register.jsp");
			rd.forward(request, response);
		}
		
	}
}
