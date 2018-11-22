package com.controllers.categoryAndView;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.lang.String;

import com.classes.categoryAndView.RetrievedItem;
import com.dao.categoryAndView.CategoryAndViewDAO;

/**
 * Servlet implementation class SearchAndView
 */
@WebServlet(description = "Searching and vewing items")
public class CategoryAndView extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String Search = request.getParameter("Search");
		String Category = request.getParameter("Category");
		
		if(Search != null)
			SearchAndDisplay(Search, request, response);
		
		else if(Category != null)
			CategoryAndDisplay(Category, request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void SearchAndDisplay(String Search, HttpServletRequest request, HttpServletResponse response) {
		System.out.println("Hey Hey hey");
		
	}
	
	protected void CategoryAndDisplay(String Category, HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		String category = null;
		HttpSession session = request.getSession();
		
		if(session.getAttribute("categoryItemList") != null)
			session.removeAttribute("categoryItemList");
		
		switch(Category) {
			case "Books" : category = "book";
				break;
			
			case "Stationary" : category = "stationary"; 
				break;

			case "Fashion" : category = "fashion";
				break;
				
			case "Watches" : category = "watches";
				break;
				
			case "Electronics" : category = "electronics";
				break;
				
			case "Art" : category = "art";
				break;
				
			case "Home" : category = "home_garden";
				break;
				
			case "Sport" : category = "sport";
				break;
				
			case "Motor" : category = "motor";
				break;
				
			case "Deals" : category = "deals";
				break;
				
			default : 	category = null;
						System.out.println("");
		}
		
		if(category == null) {
			System.out.println("Well, this is unprecidented, how can category be null and still anchored to this controller.");
		}
			
		else {
			CategoryAndViewDAO x = new CategoryAndViewDAO();
			ArrayList<RetrievedItem> categoryItemList = x.categoryRetrieve(category);
				request.setAttribute("Category", Category);

				session.setAttribute("categoryItemList", categoryItemList);
//				response.sendRedirect("ProductsView.jsp");
				getServletContext().getRequestDispatcher("/ProductsView.jsp").forward(request, response); 
				//rd.forward(request, response);
//			}
		}
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
