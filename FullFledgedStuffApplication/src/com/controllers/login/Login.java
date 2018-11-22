package com.controllers.login;

import java.io.IOException;
//import java.io.PrintWriter;
import java.lang.String;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.classes.login.LoggedAdmin;
import com.classes.login.LoggedUser;
import com.classes.login.LoggingUser;
import com.classes.login.pubGen;
import com.dao.login.LoginDAO;

/**
 * Servlet implementation class Login
 */
@WebServlet(description = "Login Credentials Verification")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 * 
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		
		LoggingUser luser = new LoggingUser(username, password);
		
		pubGen<LoggingUser, LoggedUser, LoggedAdmin> all = LoginDAO.checkUser(luser);
		
		//PrintWriter out = response.getWriter();

		if(all.getLUser().getLoggingValidity() == "User") {
			if(all.getLUser().getAction() == "UserF") {
				HttpSession session = request.getSession();
				session.setAttribute("Type", "USER");
				session.setAttribute("Username", all.getLduser().getUsername());
				session.setAttribute("greeting", "Welcome again " + all.getLduser().getFirstName() + " !");
				session.setAttribute("User", all.getLduser());

				response.sendRedirect("Homepage.jsp");
			}
			
			else if(all.getLUser().getAction() == "UserNF01") {
				request.setAttribute("message01", "For some reason, your credentials have been removed.");
				request.setAttribute("message02", "Please try to register again.");
				
				RequestDispatcher rd = request.getRequestDispatcher("Login.jsp");
				rd.forward(request, response);
			}
			
			else if(all.getLUser().getAction() == "UserNF02") {
				request.setAttribute("message01", "For some reason, your credentials needs to be removed.");
				request.setAttribute("message02", "You will not be able to login or register using the same details.\nSorry for the inconvenience caused.");
			}
		}
		
		else if(all.getLUser().getLoggingValidity() == "Admin") {
			if(all.getLUser().getAction() == "AdminF") {
				HttpSession session = request.getSession();
				session.setAttribute("Type", "ADMIN");
				session.setAttribute("Username", "Admin " + all.getLdadmin().getAdminUsername());
				session.setAttribute("greeting", "Welcome again, " + all.getLdadmin().getPrefixAdmin() + all.getLdadmin().getFnameAdmin() + " !");
				
//				response.sendRedirect("Homepage.jsp");
				
//				RequestDispatcher rd = request.getRequestDispatcher("AdminProf.jsp");
//				rd.forward(request, response);
				
				session.setAttribute("Admin", all.getLdadmin());
				response.sendRedirect("AdminHome.jsp");
			}
			
			else if(all.getLUser().getAction() == "AdminNF") {
				
			}
		}
		
		else if(all.getLUser().getLoggingValidity() == "NoBody") {
			request.setAttribute("message01", "Username or password is mismatching or wrong.");
			request.setAttribute("message02", "Please enter correct credentials or register if you are a new customer.");
			
			RequestDispatcher rd = request.getRequestDispatcher("Login.jsp");
			rd.forward(request, response);
			
		}
		
		/*if(luser.getValidity()) {
			System.out.println("User " + luser.getUsername() + " have successfully loged in.");
			
			HttpSession session = request.getSession();
			session.setAttribute("firstname", luser.getFirstName());
			
			response.sendRedirect("Welcome.jsp");
		}
		
		else {
			response.sendRedirect("Login.jsp");
		}*/
	}
}
