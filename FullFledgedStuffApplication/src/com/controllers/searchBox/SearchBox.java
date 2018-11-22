package com.controllers.searchBox;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.classes.searchBox.Search;

/**
 * Servlet implementation class SearchBox
 */

public class SearchBox extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SearchBox() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Search search = new Search();
		search.setSearch(request.getParameter("search"));
		search.setCategory(request.getParameter("category"));
		
		HttpSession session = request.getSession();
		request.setAttribute("search",search.getSearch());
		request.setAttribute("Category",search.getCategory());
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("SearchView.jsp");
		dispatcher.forward(request, response);
	}

}
