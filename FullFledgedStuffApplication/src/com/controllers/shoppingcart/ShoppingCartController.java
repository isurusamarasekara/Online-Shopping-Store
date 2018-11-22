package com.controllers.shoppingcart;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.classes.categoryAndView.RetrievedItem;
import com.classes.shoppingcart.Cart;

/**
 * Servlet implementation class shoppingCartController
 */
@WebServlet(description = "Managing the shopping cart related functions")
public class ShoppingCartController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String procedure = request.getParameter("procedure");
		
		if(procedure != null && !procedure.equals("")) {
			if(procedure.equals("add"))
				addShoppingcart(request, response);
			
			else if(procedure.equals("update"))
				updateShoppingCart(request, response);
			
			else if(procedure.equals("remove"))
				removeShoppingCart(request, response);
		}
		
		else {
			
		}

	}
	
	protected void addShoppingcart(HttpServletRequest request, HttpServletResponse response) {
		int quantity = Integer.parseInt(request.getParameter("quantity"));
		
		HttpSession session = request.getSession();
		RetrievedItem RI = (RetrievedItem) session.getAttribute("SelectedItem");
		
		if(quantity > RI.getQtyAvailable()) {
			request.setAttribute("message1", "Requested quantity is not available, only " + RI.getQtyAvailable() + " available.");
			
			RequestDispatcher rd = request.getRequestDispatcher("Product.jsp");
				try {
					rd.forward(request, response);
				} catch (ServletException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
		}
		
		else {
			Cart cart = null;
			cart = (Cart) session.getAttribute("cart");
			
			if(cart == null) {
				cart = new Cart();
				session.setAttribute("cart", cart);
			}
			
			switch (RI.getCategory()) {
				case "book" : cart.addToCart(RI.getItemId(), RI.getItemName(), RI.getSpecifics(), RI.getAuthor(), RI.getCategory(), RI.getItemPicUrl(),  RI.getUnitPrice(), quantity);
					break;
			}
			
			try {
				response.sendRedirect("ShoppingCart.jsp");
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}
	
	protected void updateShoppingCart(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		
		Cart cart = null;
		cart = (Cart) session.getAttribute("cart");
		
		int itemPosition = Integer.parseInt(request.getParameter("itemPosition"));
		int quantity = Integer.parseInt(request.getParameter("quantity"));
		
		if(cart.getCartItem(itemPosition).getQuantity() == quantity) {
			request.setAttribute("message2", "Updation was Unsuccessful!");
			request.setAttribute("message3", "Quantity must be changed to update!");
			request.setAttribute("itemPosition02", itemPosition);
		}
		
		else {
			cart.updateOnCart(itemPosition, quantity);
		}
		
			RequestDispatcher rd = request.getRequestDispatcher("ShoppingCart.jsp");
			try {
				rd.forward(request, response);
			} catch (ServletException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
	}
	
	protected void removeShoppingCart(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();

		Cart cart = null;
		cart = (Cart) session.getAttribute("cart");
		
		int itemPosition = Integer.parseInt(request.getParameter("itemPosition"));
		
		cart.removeFromCart(itemPosition);
		
		RequestDispatcher rd = request.getRequestDispatcher("ShoppingCart.jsp");
		try {
			rd.forward(request, response);
		} catch (ServletException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
