package com.controllers.Admin.updateItem;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class UpdateItem
 */

public class UpdateItem extends HttpServlet {
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
		
		String itemID = request.getParameter("itemID");	
		String DSearch = request.getParameter("DSearch");
		String NSearch = request.getParameter("NSearch");
		String CSearch = request.getParameter("CSearch");
		String NCSearch = request.getParameter("NCSearch");
		String Search1 = request.getParameter("Search1");
		String Search2 = request.getParameter("Search2");
		String Search3 = request.getParameter("Search3");
		
		
		if(NSearch != null) {

			
			RequestDispatcher rd = request.getRequestDispatcher("RemoveItem.jsp");
			rd.forward(request, response);
		}

		if(CSearch != null) {

			request.setAttribute("button1", "active");
			RequestDispatcher rd = request.getRequestDispatcher("RemoveItem.jsp");
			rd.forward(request, response);
		}
		
		if(NCSearch != null) {

			request.setAttribute("button2", "active");
			RequestDispatcher rd = request.getRequestDispatcher("RemoveItem.jsp");
			rd.forward(request, response);
		}
		
		if(Search1 != null) {
			
			String name = request.getParameter("name");
			
			request.setAttribute("button3", "active");
			request.setAttribute("name", name);
			
			RequestDispatcher rd1 = request.getRequestDispatcher("RemoveItem.jsp");
			rd1.forward(request, response);	
		}
		
		if(Search2 != null) {
			
			String category = request.getParameter("category");
			
			request.setAttribute("button4", "active");
			request.setAttribute("category", category);
			
			RequestDispatcher rd1 = request.getRequestDispatcher("RemoveItem.jsp");
			rd1.forward(request, response);	
		}
		
		if(Search3 != null) {
			
			String name = request.getParameter("name");
			String category = request.getParameter("category");
			
			request.setAttribute("button5", "active");
			request.setAttribute("name", name);
			request.setAttribute("category", category);
			
			RequestDispatcher rd1 = request.getRequestDispatcher("RemoveItem.jsp");
			rd1.forward(request, response);	
		}
	}

}
