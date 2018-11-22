package com.controllers.userProfile;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.classes.login.LoggedUser;
import com.classes.userProfile.AllOrderData;
import com.classes.userProfile.UpdatingUser;
import com.dao.userProfile.UserProfileDAO;

/**
 * Servlet implementation class UserProfile
 */
@WebServlet(description = "Displaying user profile and related data")
public class UserProfile extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		LoggedUser LDUser = (LoggedUser) session.getAttribute("User");
		String Username = (String) session.getAttribute("Username");
		
		if(Username != null && !Username.equals("")) {
			UserProfileDAO UPD = new UserProfileDAO();
			
			AllOrderData AOD = UPD.getOrderDetails(LDUser.getUserId());
			
			request.setAttribute("AOD", AOD);
			
			RequestDispatcher rd = request.getRequestDispatcher("UserProfile.jsp");
			rd.forward(request, response);
		}
		
		else {
			System.out.println("HAHAHAHAHAHAHAHA");
		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String account = request.getParameter("account");
		String updateAccount = request.getParameter("updateAccount");
		
		String privacy = request.getParameter("privacy");
		String changeCredentials = request.getParameter("changeCredentials");
		String changeSecurity = request.getParameter("changeSecurity");
		String deleteAccount = request.getParameter("deleteAccount");
		
		String submitCredentials = request.getParameter("submitCredentials");
		String submitRecovery = request.getParameter("submitRecovery");
		String submitDelete = request.getParameter("submitDelete");
		
		String search = request.getParameter("search");
		
		if(account != null)
			response.sendRedirect("AccountSettings.jsp");
		
		else if(privacy != null)
			response.sendRedirect("PrivacySettings.jsp");
		
		else if(search != null)
			searchDatabase(request, response);
		
		else if(updateAccount != null)
			updateAccountDetails(request, response);
		
		else if(changeCredentials != null || changeSecurity != null || deleteAccount != null)
			privacySettings(request, response);
		
		else if(submitCredentials != null)
			changeCredentials(request, response);
		
		else if(submitRecovery != null)
			changeRecovery(request, response);
		
		else if(submitDelete != null)
			deleteMe(request, response);
	}
	
	protected void privacySettings(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher rd = request.getRequestDispatcher("PrivacySettings.jsp");
		String changeCredentials = request.getParameter("changeCredentials");
		String changeSecurity = request.getParameter("changeSecurity");
		String deleteAccount = request.getParameter("deleteAccount");
		
		if(changeCredentials != null) {
			request.setAttribute("credentials", "yes");
			rd.forward(request, response);
		} else if(changeSecurity != null) {
			HttpSession session = request.getSession();
			LoggedUser LDUser = (LoggedUser) session.getAttribute("User");
			
			UserProfileDAO UPD = new UserProfileDAO();

			UpdatingUser UU = UPD.getEmergencyDetails(LDUser);

			if(UU != null) {
				session.setAttribute("UU", UU);
			}
			
			request.setAttribute("security", "yes");
			rd.forward(request, response);
		} else if(deleteAccount != null) {
			request.setAttribute("deletion", "yes");
			rd.forward(request, response);
		}
	}
	
	protected void searchDatabase(HttpServletRequest request, HttpServletResponse response) {
		
	}
	
	protected void updateAccountDetails(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String prefix = request.getParameter("prefix");
		String fname = request.getParameter("fname");
		String lname = request.getParameter("lname");
		String email = request.getParameter("email");
		String day = request.getParameter("day");
		String month = request.getParameter("month");
		String year = request.getParameter("year");
		String addline1 = request.getParameter("addline1");
		String addline2 = request.getParameter("addline2");
		String city = request.getParameter("city");
		String district = request.getParameter("district");
		String state_province = request.getParameter("state_province");
		int zip = Integer.parseInt(request.getParameter("zip"));
		String country = request.getParameter("country");
		
		UpdatingUser UUser = new UpdatingUser(prefix, fname, lname, email, day, month, year, addline1, addline2, city, district, state_province, zip, country);
		
		HttpSession session = request.getSession();
		LoggedUser LDUser = (LoggedUser) session.getAttribute("User");
		
		UserProfileDAO UPD = new UserProfileDAO(); 
		boolean enterStatus = UPD.updateUserDetails(LDUser, UUser);
		
		if(enterStatus == true) {
			LDUser.updateHelp(prefix, fname, lname, email, day, month, year, addline1, addline2, city, district, state_province, zip, country);
			session.removeAttribute("User");
			session.setAttribute("User", LDUser);
			
			request.setAttribute("message01", "You have successfully updated your account details.");
			
			RequestDispatcher rd = request.getRequestDispatcher("AccountSettings.jsp");
			rd.forward(request, response);
		}
		
		else {
			
		}
	}
	
	protected void changeCredentials(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		LoggedUser LDUser = (LoggedUser) session.getAttribute("User");
		
		String username = request.getParameter("username");
		
		if(LDUser.getUsername().equals(username)) {
			String oldPassword = request.getParameter("oldPassword");
			UserProfileDAO UPD = new UserProfileDAO();
			
			String newPassword = request.getParameter("newPassword");
			String conNewPassword = request.getParameter("conNewPassword");
			
			if(newPassword.equals(conNewPassword)) {
				
				if(UPD.checkUsername(LDUser, oldPassword)) {
					
					if(UPD.changeCredentials(LDUser, newPassword)) {
						request.setAttribute("message01", "You have successfully changed your password");
						request.setAttribute("message02", "Please Log In again to verify");
						
						RequestDispatcher rd = request.getRequestDispatcher("Login.jsp");
						rd.forward(request, response);
					}
				}	
			}
		}
		
		else {
			
		}
	}
	
	protected void changeRecovery(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();

		String question01 = request.getParameter("question01");
		String answer01 = request.getParameter("answer01");
		String question02 = request.getParameter("question02");
		String answer02 = request.getParameter("answer02");
		
		UpdatingUser UU = new UpdatingUser(question01, answer01, question02, answer02);
		LoggedUser LDUser = (LoggedUser) session.getAttribute("User");
		UserProfileDAO UPD = new UserProfileDAO();
		
		if(UPD.changeRecovery(LDUser, UU)) {
			session.removeAttribute("UU");
			session.setAttribute("UU", UU);
	
			request.setAttribute("security", "yes");
			request.setAttribute("message01", "You have successfully updated your recovery details.");
			
			RequestDispatcher rd = request.getRequestDispatcher("PrivacySettings.jsp");
			rd.forward(request, response);
		}
		else {
			
		}
	}
	
	protected void deleteMe(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		LoggedUser LDUser = (LoggedUser) session.getAttribute("User");
		UserProfileDAO UPD = new UserProfileDAO();
		
		if(UPD.deleteMe(LDUser)) {
			request.setAttribute("deletion", "yes");
			request.setAttribute("message01", "Your account has been successfully deleted.");
			request.setAttribute("message02", "We are sorry about your departure.");
			
			RequestDispatcher rd = request.getRequestDispatcher("logoutControllerPath");
			rd.forward(request, response);
		}
	}
}
