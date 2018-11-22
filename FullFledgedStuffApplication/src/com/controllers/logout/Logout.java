package com.controllers.logout;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class Logout
 */
@WebServlet(description = "Controlling the logging out of an already logged in user")
public class Logout extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		session.removeAttribute("Username");
		
		if(session.getAttribute("cart") != null)
			session.removeAttribute("cart");
		
		session.invalidate();
		
			response.sendRedirect("Homepage.jsp");
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if(request.getAttribute("deletion") != null) {
			RequestDispatcher rd = request.getRequestDispatcher("Login.jsp");
			request.setAttribute("message01", request.getAttribute("message01"));
			request.setAttribute("message02", request.getAttribute("message02"));
			rd.forward(request, response);
		}
	}

}
