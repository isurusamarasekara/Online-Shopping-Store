package com.controllers.orderConfirmation;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.classes.login.LoggedUser;
import com.classes.orderConfirmation.Order;
import com.classes.shoppingcart.Cart;
import com.dao.orderConfirmation.OrderConfirmationDAO;;

/**
 * Servlet implementation class OrderConfirmation
 */
@WebServlet(description = "Procedure control after the shipping address and the order is confirmed")
public class OrderConfirmation extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		
//		PrintWriter out = response.getWriter();
		
		String address = request.getParameter("address");
		if(address != null && !address.equals("")) {
			Cart cart = (Cart) session.getAttribute("cart");
			LoggedUser LD =  (LoggedUser) session.getAttribute("User");
			Order order = new Order(LD, cart, address);
			OrderConfirmationDAO orderDAO = new OrderConfirmationDAO(); 
			String info1[] = new String[2];
			
			if(address.equals("old")) {
	//			out.println("You selected old");
				info1 = orderDAO.processAll(order);
				
			} else if(address.equals("new")) {
	//			out.println("You selected new");
				String 	newAddLine1 = request.getParameter("newAddLine1");
				String newAddLine2 = request.getParameter("newAddLine2");
				String newCity = request.getParameter("newCity");
				String newDistrict = request.getParameter("newDistrict");
				String newState_province = request.getParameter("newState_province");
				int newZip = Integer.parseInt(request.getParameter("newZip"));
				String newCountry = request.getParameter("newCountry");
				
				order.setNewAddressHelp(newAddLine1, newAddLine2, newCity, newDistrict, newState_province, newZip, newCountry);
				
				info1 = orderDAO.processAll(order);
			}
			
			if(info1[0].equals("done")) {
				PrintWriter out = response.getWriter();
				out.println("All done, reffer orderId " + info1[1] + " for status.");
			}
		}
	}
}
