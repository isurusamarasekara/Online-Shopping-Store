package com.controllers.productView;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.classes.categoryAndView.RetrievedItem;

/**
 * Servlet implementation class ProductView
 */
@WebServlet(description = "Controlling the displaying of a single product when chosen.")
public class ProductView extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		int i = Integer.parseInt(request.getParameter("listNumber"));
		
		ArrayList<RetrievedItem> categoryItemList = (ArrayList<RetrievedItem>) session.getAttribute("categoryItemList");
		RetrievedItem RI = categoryItemList.get(i);
		
		System.out.println(RI.getItemName());
		
		if (session.getAttribute("SelectedItem") != null) {
			session.removeAttribute("SelectedItem");
			session.setAttribute("SelectedItem", RI);
		}
		
		else
			session.setAttribute("SelectedItem", RI);
		
		response.sendRedirect("Product.jsp");
		
	}

}
