 package com.controllers.register;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.classes.register.RegisteringUser;

/**
 * Servlet implementation class RegisterValidation
 */
@WebServlet(description = "Registration Details Distribution and Check")
public class RegisterValidation extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		RegisteringUser RegisteringUsr = (RegisteringUser) request.getAttribute("RegisteringUsr");
		
			if(chkPrefix(RegisteringUsr.getPrefix(), request, response)) {
				
			}
	}
	
	private boolean EmptyIndeed(String string) {
		if(string == null || string.equals("") || string.trim() == "")
			return true;
		
		return false;
	}

	private boolean chkPrefix(String prefix, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if(EmptyIndeed(prefix)) {
			request.setAttribute("messagePrefix", "Prefix cannot be empty!");
			
			RequestDispatcher rd = request.getRequestDispatcher("Register.jsp");
			rd.forward(request, response);
		}
		
		
		
		return true;	
	}
}
