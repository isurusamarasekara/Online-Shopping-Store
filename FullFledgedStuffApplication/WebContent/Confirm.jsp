<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.classes.shoppingcart.Cart, com.classes.shoppingcart.CartItem, java.text.DecimalFormat, com.classes.login.LoggedUser"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
			
			<title>Confirmation</title>
			
			<link href="CSS/bootstrap.css" rel="stylesheet"/>
			<link href="CSS/style.css" rel="stylesheet"/>
			<link href="assets/font-awesome/css/font-awesome.css" rel="stylesheet">
			<link rel="shortcut icon" href="assets/ico/favicon.ico">
			
			<%	Cart cart = (Cart) session.getAttribute("cart");
		    	int noOfItems = cart.getNumOfItems();
		    	DecimalFormat decimal = new DecimalFormat("#.00");
		    	String Username = (String) session.getAttribute("Username");
		    %>
	</head>
	<body>
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
							<a href="logoutControllerPath"><span class="icon-user"></span> <%=Username %></a>
								<%}%>
						<a href="Register.jsp"><span class="icon-edit"></span> Free Register </a> 
						<a href="contact.html"><span class="icon-envelope"></span> Contact us</a>
						<a class="active" href="cart.html"><span class="icon-shopping-cart"></span> <%=noOfItems%> Item(s) - <span class="badge badge-warning"> Rs.<%=cart.getSubTotalCart()%></span></a>
						
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
		
		<!--
		Lower Header Section 
		-->
		<div class="container">
		<div id="gototop"> </div>
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
			<p><br> <strong> Support (24/7) :  077x xxx xxx </strong><br><br></p>
			<span class="btn btn-mini btn-warning">[ <%=noOfItems %> ] <span class="icon-shopping-cart"></span></span>
			</div>
		</div>
		</header>
		
		<!--
		Navigation Bar Section 
		-->
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
					  <li class=""><a href="Homepage.jsp">Home	</a></li>
					  <li class=""><a href="list-view.html">List View</a></li>
					  <li class=""><a href="grid-view.html">Grid View</a></li>
					  <li class=""><a href="three-col.html">Three Column</a></li>
					  <li class=""><a href="four-col.html">Four Column</a></li>
					  <li class=""><a href="general.html">General Content</a></li>
					</ul>
					<form action="#" class="navbar-search pull-left">
					  <input type="text" placeholder="Search" class="search-query span2">
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
				<div class="span12">
				    <ul class="breadcrumb">
						<li><a href="Homepage.jsp">Home</a> <span class="divider">/</span></li>
						<li><a href="ShoppingCart.jsp">Check Out</a> <span class="divider">/</span></li>
						<li class="active">Confirm</li>
				    </ul>
						<div class="well well-small">
						<%for (int i = 0; i < noOfItems; i++) { CartItem CI = cart.getCartItem(i);%>
							<div class="row-fluid">	  
								<div class="span2">
									<img src="<%=CI.getPicture()%>" alt="">
								</div>
								<div class="span6">
									<h4><p><%=CI.getItemName()%> [<%=CI.getSpecifics01()%>] <%=CI.getSpecifics02()%></p></h4>
									<p>
										<table>
											<tr>
												<td><b>Product Category : </b></td>
												<td><b><font color="blue"><%=CI.getCategory() %> </font></b></td>
											</tr>
											<tr>
												<td><b>Unit Price (Rs.) : </b></td>
												<td><b><font color="blue"><%=decimal.format(CI.getUnitPrice()) %> </font></b></td>
											</tr>
											<tr>
												<td><b>Quantity Ordered : </b></td>
												<td><b><font color="blue"><%=CI.getQuantity()%> </font></b></td>
											</tr>
										</table>
									</p>
								</div>
								<div class="span4 alignR">
								<form class="form-horizontal qtyFrm">
								<h4>Total Item Price</h4>
								<h4> Rs.<%=decimal.format(CI.getSubTotalItem())%></h4>
								<div class="btn-group">
								  <a href="product_details.html" class="shopBtn">VIEW</a>
								 </div>
									</form>
								</div>
							</div>
							<hr class="soften">
						<%} %>
						<div class="row-fluid">
							<div class="span4">
								<h4>Sub Total on Cart : </h4>
							</div>
							<div class="span8 alignR">
								<h4>Rs.<%=decimal.format(cart.getSubTotalCart()) %></h4>
							</div>
						</div>
					</div>

					<div class="well">
						<%LoggedUser LD =  (LoggedUser) session.getAttribute("User");%>
						<form class="form-horizontal" action="OrderConfirmationController" method="post" name="shippment01">
							<h3>You can use your registered billing address. </h3>
							<div class="control-group a">
								<label class="control-label">Registered Address</label>
								<div class="span7">
									<address>
										<%=LD.getAddLine1()%><br>
										<%if(!LD.getAddLine2().equals("") && LD.getAddLine2() != null) { %> <%=LD.getAddLine2()%><br> <%}%>
										<%=LD.getCity()%><br>
										<%if(!LD.getDistrict().equals("") && LD.getDistrict() != null) { %> <%=LD.getDistrict()%><br> <%}%>
										<%=LD.getState_province()%><br>
										<%=LD.getZip()%><br>
										<%=LD.getCountry()%>
									</address>
								</div>
							</div>
							<input type="hidden" name="address" value="old"/>
							<div class="control-group">
								<div class="controls">
									<input type="submit" name="submitAccount" value="Use the existing address" class="btn btn-primary" <%if(session.getAttribute("Username") == null) { %> disabled /> <%} else {%> /> <%} %>
								</div>
							</div>
						</form>
					</div>
					<div class="well">
						<form class="form-horizontal" action="OrderConfirmationController" method="post" name="shippment02">
							<h3>Otherwise, You can use a different billing address. </h3>
							
							<div class="control-group a">
								<label class="control-label">Street Address <sup>*</sup></label>
								<div class="controls">
								  <input type="text" placeholder=" Street Adress" name="newAddLine1" required <%if(session.getAttribute("Username") == null) { %> disabled /> <%} else {%> /> <%} %>
								</div>
							</div>
							
							<div class="control-group a">
								<label class="control-label">Street Address Line 2 </label>
								<div class="controls">
								  <input type="text" placeholder=" Street Address Line 2/ optional" name="newAddLine2" <%if(session.getAttribute("Username") == null) { %> disabled /> <%} else {%> /> <%} %>
								</div>
							</div>
							
							 <div class="control-group a">
								<label class="control-label">City <sup>*</sup></label>
								<div class="controls">
								  <input type="text" placeholder=" City" name="newCity" required <%if(session.getAttribute("Username") == null) { %> disabled /> <%} else {%> /> <%} %>
								</div>
							</div>
							
							 <div class="control-group a">
								<label class="control-label">District </label>
								<div class="controls">
								  <input type="text" placeholder=" District/ optional" name="newDistrict" <%if(session.getAttribute("Username") == null) { %> disabled /> <%} else {%> /> <%} %>
								</div>
							</div>
							 <div class="control-group a">
								<label class="control-label">State/Province <sup>*</sup></label>
								<div class="controls">
								  <input type="text" placeholder=" State/Province" name="newState_province" required <%if(session.getAttribute("Username") == null) { %> disabled /> <%} else {%> /> <%} %>
								</div>
							</div>
							
							 <div class="control-group a">
								<label class="control-label">ZIP <sup>*</sup></label>
								<div class="controls">
								  <input type="text" placeholder=" ZIP" name="newZip" required <%if(session.getAttribute("Username") == null) { %> disabled /> <%} else {%> /> <%} %>
								</div>
							</div>
							
							 <div class="control-group a">
								<label class="control-label">Country <sup>*</sup></label>
								<div class="controls">
								  <input type="text" placeholder=" Country" name="newCountry" required <%if(session.getAttribute("Username") == null) { %> disabled /> <%} else {%> /> <%} %>
								</div>
							</div>
							<input type="hidden" name="address" value="new"/>
							<div class="control-group">
								<div class="controls">
									<input type="submit" name="submitAccount" value="Use a new address" class="btn btn-primary" <%if(session.getAttribute("Username") == null) { %> disabled /> <%} else {%> /> <%} %>
								</div>
							</div>
						</form>
					</div>
			    </div>
		    </div>
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
		</div><!-- /container -->
		
		<div class="copyright">
		<div class="container">
			<span>Copyright &copy; 2013<br> bootstrap ecommerce shopping template</span>
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

	</body>
</html>