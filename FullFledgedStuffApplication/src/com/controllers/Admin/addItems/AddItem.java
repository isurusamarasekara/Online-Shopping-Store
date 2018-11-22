package com.controllers.Admin.addItems;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.classes.Admin.addItem.Item;
import com.dao.Admin.addItem.AddItemDAO;

/**
 * Servlet implementation class AddItems
 */

public class AddItem extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String back = request.getParameter("back");

		if(back != null) {
			response.sendRedirect("AdminHome.jsp");
		} else {
			System.out.println("ds");
		}
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String selectCat = request.getParameter("selectCat");
		String insertDat = request.getParameter("insertDat");
		String reenter = request.getParameter("reenter");
		
		if(selectCat != null) {
			String category = request.getParameter("category");
			request.setAttribute("button01", "active");
			request.setAttribute("category", category);
			RequestDispatcher rd = request.getRequestDispatcher("AddItem.jsp");
			rd.forward(request, response);
		}		

		if(insertDat != null) {
			if(getDataFromForm(request,response)) {
				request.setAttribute("message", "Item was inserted Successfully");
				RequestDispatcher rd = request.getRequestDispatcher("AddItem.jsp");
				rd.forward(request, response);	
			}
			else {
				
			}
		}
		
		if(reenter != null) {
			request.setAttribute("button03", "active");
			RequestDispatcher rd = request.getRequestDispatcher("AddItem.jsp");
			rd.forward(request, response);
		}
	}
	
	protected boolean getDataFromForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String itemId = request.getParameter("itemId");
		int priorityLvl = Integer.parseInt(request.getParameter("priorityLvl"));
		String itemName = request.getParameter("itemName");
		String itemPicUrl = request.getParameter("itemPicUrl");
		String specifics = request.getParameter("description");
		String description = request.getParameter("description");
		double unitPrice = Double.parseDouble(request.getParameter("unitPrice"));
		int qtyAvailable = Integer.parseInt(request.getParameter("qtyAvailable"));
		String associates = request.getParameter("associates");
		String category = request.getParameter("category");		

		Item AddItem = new Item(itemId, priorityLvl, itemName, itemPicUrl, specifics, description, category, unitPrice, qtyAvailable, associates);
	
		if(category.equals("book")) {

			String author = request.getParameter("author");
			String genre = request.getParameter("genre");		
			String booktype = request.getParameter("booktype");
			
			AddItem.setAuthor(author);
			AddItem.setGenre(genre);
			AddItem.setBookType(booktype);
		}
		
		if(category.equals("fashion")) {

			String fashcol = request.getParameter("fashcol");
			String fashtype = request.getParameter("fashtype");	
			
			AddItem.setFashCol(fashcol);
			AddItem.setFashType(fashtype);
		}
		
		if(category.equals("stationary")) {

			String distributor = request.getParameter("distributor");
			String stattype = request.getParameter("stattype");		
			
			AddItem.setDistributor(distributor);
			AddItem.setStatType(stattype);
		}
		
		if(AddItemDAO.addItemWithChecking(AddItem)) {
			System.out.println("Item successfully added to the database!");
		return true;
		}
		
		else {
			System.out.println("dfgdfgdfg");
		return false;
		}	
	}
}
