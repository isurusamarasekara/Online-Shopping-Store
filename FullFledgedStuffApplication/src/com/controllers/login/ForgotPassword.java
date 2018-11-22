package com.controllers.login;

import java.io.IOException;
//import java.sql.ResultSet;
//import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.classes.login.ForgotUser;
import com.dao.login.ForgotDAO;

/**
 * Servlet implementation class ForgotPassword
 */
@WebServlet(description = "Controller for when the user forgot his/ her password")
public class ForgotPassword extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.sendRedirect("ForgotPassword.jsp");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String account = request.getParameter("account");
		String specifics = request.getParameter("specifics");
		String reset = request.getParameter("reset");
//		ForgotUser FUserAccountVerified = null;
//		ForgotUser FUserSpecificsVerified = null;
		HttpSession session = request.getSession();
		request.setAttribute("AccountVerified", Boolean.FALSE);// true or (Boolean) true

		if (account != null) {
			ForgotUser FUser = new ForgotUser(request.getParameter("username"), request.getParameter("email"));
			
			FUser = ForgotDAO.getAccountDetailsAndSpecifics(FUser);
			
			if(FUser.getAccount()) {
				request.setAttribute("AccountVerified", Boolean.TRUE);// true or (Boolean) true
				session.setAttribute("FUser", FUser);
				/*request.setAttribute("usernameFill", FUser.getUsername());
				request.setAttribute("emailFill", FUser.getEmail());
				request.setAttribute("question01Fill", FUser.getQuestion01());
				request.setAttribute("question02Fill", FUser.getQuestion02());
				*/
				RequestDispatcher rd = request.getRequestDispatcher("ForgotPassword.jsp");
				rd.forward(request, response);
			}
		}
		
		else if (specifics != null) {
			String answer01 = request.getParameter("answer01");
			String answer02 = request.getParameter("answer02");
			if(answer01.equals( (String) ( (ForgotUser) session.getAttribute("FUser") ).getAnswer01())) {
				if(answer02.equals( (String) ( (ForgotUser) session.getAttribute("FUser") ).getAnswer02())) {
					request.setAttribute("AccountVerified", Boolean.TRUE);// true or (Boolean) true
					request.setAttribute("SpecificsVerified", Boolean.TRUE);// true or (Boolean) true
					/*request.setAttribute("usernameFill", FUserAccountVerified.getUsername());
					request.setAttribute("emailFill", FUserAccountVerified.getEmail());
					request.setAttribute("question01Fill", FUserAccountVerified.getQuestion01());
					request.setAttribute("question02Fill", FUserAccountVerified.getQuestion02());

					request.setAttribute("answer01Fill", FUserAccountVerified.getAnswer01());
					request.setAttribute("answer02Fill", FUserAccountVerified.getAnswer02());
					request.setAttribute("passwordFill", FUserAccountVerified.getPassword());
					*/
				}
			}
			RequestDispatcher rd = request.getRequestDispatcher("ForgotPassword.jsp");
			rd.forward(request, response);
		}

		else if (reset != null) {
			ForgotUser FUser = (ForgotUser) session.getAttribute("FUser");
			FUser.setPassword(request.getParameter("newPass"));

			if(ForgotDAO.changePassword(FUser)) {
				session.removeAttribute("FUser");
				session.invalidate();
				
				response.sendRedirect("Login.jsp");
			}
		}
	}
}
