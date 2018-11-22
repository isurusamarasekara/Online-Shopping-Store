<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.classes.login.LoggedAdmin, com.dao.Admin.removeItem.RemoveItemDAO, java.sql.ResultSet"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		
		<link href="CSS/bootstrap.css" rel="stylesheet"/>
		<link href="CSS/style.css" rel="stylesheet"/>
		<link href="assets/font-awesome/css/font-awesome.css" rel="stylesheet">
		<link rel="shortcut icon" href="assets/ico/favicon.ico">
	
		<% 	
			String button = (String) request.getAttribute("button");
			String button1 = (String) request.getAttribute("button1");
			String button2 = (String) request.getAttribute("button2");
			String button3 = (String) request.getAttribute("button3");
			String button4 = (String) request.getAttribute("button4");
			String button5 = (String) request.getAttribute("button5");
		
			LoggedAdmin Admin = (LoggedAdmin) session.getAttribute("Admin");
			String Username = (String) session.getAttribute("Username");
			
			if(Username == null)
				response.sendRedirect("Login.jsp");
		%>
		
		<title>Remove Item</title>
	</head>
	<%
		response.setHeader("Cache-control", "no-cache, no-store, must-revalidate");
	%>
	
			<div class="navbar navbar-inverse navbar-fixed-top">
				<div class="topNav">
					<div class="container">
						<div class="alignR">
							<div class="pull-left socialNw">
								<a href="#"><span class="icon-twitter"></span></a>
								<a href="#"><span class="icon-facebook"></span></a>
								<a href="#"><span class="icon-youtube"></span></a>
								<a href="#"><span class="icon-tumblr"></span></a>
							</div>
							
							<a class="active" href="Homepage.jsp"> <span class="icon-home"></span> Home</a> 
							
								<% if(Username == null) { %>
							<a href="Login.jsp"><span class="icon-user"></span> My Account</a>
								<% } else { %>
							<a href="addItemController?back=notNull"><span class="icon-user"></span> <%=Username %></a>
								<%}%>
							
							<a href="Register.jsp"><span class="icon-edit"></span> Register </a> 
							<a href="#"><span class="icon-envelope"></span> Contact us</a>
							<a href="#"><span class="icon-shopping-cart"></span> 0 Item(s) - <span class="badge badge-warning"> $000.00</span></a>
							
						<%if(Username != null && !Username.equals("")) {%>
							<ul class="nav pull-right">
								<li class="dropdown">
									<a data-toggle="dropdown" href="#"><span class="btn btn-inverse btn-mini" style="margin:0px; border:0px;" title="Take charge of the profile">Profile Settings<b class="caret"></b></span></a>
									<div class="dropdown-menu"  style="background-color:#f3e7e5;">
										<form class="form-horizontal loginFrm" action="UserProfileControllerPath" method="post">
										  <div class="control-group">
											<button type="submit" name="account" class="btn btn-warning btn-mini" style="width:100%" title="Go to account setting">Account Settings</button>
										  </div>
										  <div class="control-group">
											<button type="submit" name="privacy" class="btn btn-warning btn-mini"  style="width:100%;" title="Go to privacy setting">Privacy Setting</button>
										  </div>
										  <div class="control-group">
											<button type="submit" name="search" class="btn btn-warning btn-mini"  style="width:100%;" title="Search the database">Search Database</button>
										  </div>
										</form>
									</div>
								</li>
							</ul>
						<%} %>
						
						</div>
					</div>
				</div>
			</div>
			
			<div class="container">
				<div id="gototop"></div>
				<header id="header">
					<div class="row">
						<div class="span4">
							<h1>
							<a class="logo" href="Homepage.jsp"><span>Twitter Bootstrap ecommerce template</span> 
								<img src="assets/img/logo-bootstrap-shoping-cart.png" alt="bootstrap sexy shop">
							</a>
							</h1>
						</div>
						<div class="span4"></div>
						<div class="span4 alignR">
						<p><br> <strong> Support (24/7) :  07xx xxx xxx </strong><br><br></p>
						</div>
					</div>
				</header>
				
				<div class="navbar">
					<div class="navbar-inner">
						<div class="container">
							<a data-target=".nav-collapse" data-toggle="collapse" class="btn btn-navbar">
								<span class="icon-bar"></span>
								<span class="icon-bar"></span>
								<span class="icon-bar"></span>
							</a>
							<div class="nav-collapse">
								<ul class="nav">
									<li class="active"><a href="Homepage.jsp">Home	</a></li>
									<li class=""><a href="#">List View</a></li>
									<li class=""><a href="#">Products</a></li>
									<li class=""><a href="#">Three Column</a></li>
									<li class=""><a href="#">Four Column</a></li>
									<li class=""><a href="#">General Content</a></li>
								</ul>
				
								<form action="searchAndViewController" class="navbar-search pull-left">
									<input type="text" placeholder="Search" class="search-query span2" name="Search">
								</form>
				
								<ul class="nav pull-right">
									<li >
											<% if(Username == null) { %>
										<a href="Login.jsp"><b><span class="icon-lock"></span> Login</b></a>
										
											<% } else { %>
										<a href="logoutControllerPath"><b><span class="icon-lock"></span> Logout</b></a>
											<%}%>
											<b></b>
									</li>
								</ul>
							</div>
						</div>
					</div>
				</div>
	<!-- 
		Body Section 
	-->	
				<div class="row">
					<div class="span10">
					<ul class="breadcrumb">
						<li><a href="Homepage.jsp" style="text-decoration:none;"><%if(Username != null) {%> <%=Admin.getFnameAdmin()%> <%} %></a> <span class="divider">/</span></li>
						<li class="active">Add Items</li>
					</ul>
					<h3> Remove Items</h3>
					
						<pre><h4>Admin <%=Admin.getFnameAdmin() %>, Search and Delete.</h4></pre>
						<%if(request.getAttribute("message") != null) {%><pre><h4 align="center"><font color="red">${message}</font></h4></pre><%} %>
						
						<div class="well well">
							<div class="row-fluid">
									<div Class="span11">
										<div class="span4"></div>
										<form action="removeItemController" method="post">
											<div class="control-group a">
												<b>Item ID : </b> <input type="text" placeholder=" XXXX0000" name="itemId"/> <input type="submit" value="Delete" name="Delete" class="btn btn-danger"/>
											</div>
											<b>Search for an item : </b> 
											<input type="submit" value="Search By Name" name="NSearch" class="btn btn-primary"/> &nbsp;&nbsp;
											<input type="submit" value="Search By Category" name="CSearch" class="btn btn-primary"/> &nbsp;&nbsp;
											<input type="submit" value="Search By Category & Name" name="NCSearch" class="btn btn-primary"/>
										</form>
									</div>
							</div>
						</div>
	
					<%if(button != null) { %>
						<div class="well well">
							<div class="row-fluid">
									<div Class="span11">
										<div class="span4"></div>
										<form action="removeItemController" method="post">
											<div class="control-group a">
												<b>Name : </b> <input type="text" placeholder=" Item Name" name="name" required/> <input type="submit" value="Search" name="Search1" class="btn btn-primary"/>
											</div>
										</form>
									</div>
							</div>
						</div>
					<%} %>
					
					<%if(button1 != null) { %>
						<div class="well well">
							<div class="row-fluid">
									<div Class="span11">
										<div class="span4"></div>
										<form action="removeItemController" method="post">
											Category : <select name="category">
														<option value="art">Art</option>
														<option value="book">Book</option>
														<option value="electronics">Electronics</option>
														<option value="fashion">Fashion</option>
														<option value="home_garden">Home/Garden</option>
														<option value="motor">Motor</option>
														<option value="sport">Sport</option>
														<option value="stationary">Stationary</option>
														<option value="watches">Watches</option>
													  </select> &nbsp;&nbsp;
											<input type="submit" value="Search" name="Search2" class="btn btn-primary"/>
										</form>
									</div>
							</div>
						</div>
					<%} %>
					
					<%if(button2 != null) { %>
						<div class="well well">
							<div class="row-fluid">
									<div Class="span11">
										<div class="span4"></div>
										<form  action="removeItemController" method="post">
											Name : <input type="text" name="name" placeholder="Item Name"/><br>
											<div class="span3"></div>
											&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
											Category : <select name="category">
														<option value="art">Art</option>
														<option value="book">Book</option>
														<option value="electronics">Electronics</option>
														<option value="fashion">Fashion</option>
														<option value="home_garden">Home/Garden</option>
														<option value="motor">Motor</option>
														<option value="sport">Sport</option>
														<option value="stationary">Stationary</option>
														<option value="watches">Watches</option>
													  </select>
													  <br>
											<div class="span4"></div>
											&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
											<input type="submit" value="Search" name="Search3" class="btn btn-primary"/>
										</form>
									</div>
							</div>
						</div>
					<%} %>
					<%if(button3 != null || button4 != null || button5 != null) {%>
						<div class="well well">
							<div class="row-fluid">
								<%if(button3 != null) {
									String name = (String)request.getAttribute("name");
									
									ResultSet rst = RemoveItemDAO.searchItemName(name);
								%>
									<table>
										<tr>
											<th>Item ID</th>
											<th>Item Name</th>
											<th>Category</th>
										</tr>
										
										<% while( rst.next()) { %>
										
											<tr>
												<td><%=rst.getString(1) %></td>
												<td><%=rst.getString(2) %></td>
												<td><%=rst.getString(3) %></td>
											</tr>
										<%} %>
									</table>
								<%} %>
								
								<%if(button4 != null) { 
								
									String category = (String)request.getAttribute("category");
									
									ResultSet rst = RemoveItemDAO.searchItemCategory(category);
								%>
									<table>
										<tr>
											<th>Item ID</th>
											<th>Item Name</th>
											<th>Category</th>
										</tr>
										
										<% while( rst.next()) { %>
										
											<tr>
												<td><%=rst.getString(1) %></td>
												<td><%=rst.getString(2) %></td>
												<td><%=rst.getString(3) %></td>
											</tr>
										<%} %>
									</table>
								<%} %>
				
								<%if(button5 != null) { 
								
									String name = (String)request.getAttribute("name");
									String category = (String)request.getAttribute("category");
									
									ResultSet rst = RemoveItemDAO.searchItemNameCategory(name,category);
								%>
									<table>
										<tr>
											<th>Item ID</th>
											<th>Item Name</th>
											<th>Category</th>
										</tr>
										
										<% while( rst.next()) { %>
										
											<tr>
												<td><%=rst.getString(1) %></td>
												<td><%=rst.getString(2) %></td>
												<td><%=rst.getString(3) %></td>
											</tr>
										<%} %>
									</table>
								<%} %>
							</div>
						</div>
					<%} %>
	<!--
	Footer
	-->
	<footer class="footer">
	<div class="row-fluid">
	<div class="span2">
	<h5>Your Account</h5>
	<a href="#">YOUR ACCOUNT</a><br>
	<a href="#">PERSONAL INFORMATION</a><br>
	<a href="#">ADDRESSES</a><br>
	<a href="#">DISCOUNT</a><br>
	<a href="#">ORDER HISTORY</a><br>
	 </div>
	<div class="span2">
	<h5>Iinformation</h5>
	<a href="contact.html">CONTACT</a><br>
	<a href="#">SITEMAP</a><br>
	<a href="#">LEGAL NOTICE</a><br>
	<a href="#">TERMS AND CONDITIONS</a><br>
	<a href="#">ABOUT US</a><br>
	 </div>
	<div class="span2">
	<h5>Our Offer</h5>
	<a href="#">NEW PRODUCTS</a> <br>
	<a href="#">TOP SELLERS</a><br>
	<a href="#">SPECIALS</a><br>
	<a href="#">MANUFACTURERS</a><br>
	<a href="#">SUPPLIERS</a> <br/>
	 </div>
	 <div class="span6">
	<h5>The standard chunk of Lorem</h5>
	The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for
	 those interested. Sections 1.10.32 and 1.10.33 from "de Finibus Bonorum et 
	 Malorum" by Cicero are also reproduced in their exact original form, 
	accompanied by English versions from the 1914 translation by H. Rackham.
	 </div>
	 </div>
	</footer>
	</div>
	</div></div><!-- /container -->
	
	<div class="copyright">
		<div class="container">
			<span>Copyright &copy; 2013 bootstrap ecommerce shopping template</span>
		</div>
	</div>
	<a href="#" class="gotop"><i class="icon-double-angle-up"></i></a>
	    <!-- Placed at the end of the document so the pages load faster -->
	    <script src="assets/js/jquery.js"></script>
		<script src="assets/js/bootstrap.min.js"></script>
		<script src="assets/js/jquery.easing-1.3.min.js"></script>
	    <script src="assets/js/jquery.scrollTo-1.4.3.1-min.js"></script>
	    <script src="assets/js/shop.js"></script>
	  </body>
</html>