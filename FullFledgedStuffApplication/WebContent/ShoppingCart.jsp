<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.classes.shoppingcart.Cart, com.classes.shoppingcart.CartItem, java.text.DecimalFormat"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		
		<link href="CSS/bootstrap.css" rel="stylesheet"/>
		<link href="CSS/style.css" rel="stylesheet"/>
		<link href="assets/font-awesome/css/font-awesome.css" rel="stylesheet">
		<link rel="shortcut icon" href="assets/ico/favicon.ico">
		
			<%	Cart cart = (Cart) session.getAttribute("cart");
		    	int noOfItems = cart.getNumOfItems();
		    	DecimalFormat decimal = new DecimalFormat("#.00");
				String Username = (String) session.getAttribute("Username");
		    %>
		    
		<title>Shopping Cart</title>
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
								<% } else {  %>
							<a href="#"><span class="icon-user"></span> <%=Username %></a>
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
				<li class="active">Check Out</li>
		    </ul>
		    
			<div class="well well-small">
				<h2>Check Out <small class="pull-right"><font color="blue">
				<%if(noOfItems == 1) {%>
					1 Item is
				<%} else {%>
					<%=noOfItems %> Items are
				<%} %>
				 in the cart </font></small></h2>
			<hr class="soften"/>	
		
			<table class="table table-bordered table-condensed">
		              <thead>
		                <tr>
		                  <th>Product</th>
		                  <th>Description</th>
						  <th>	Ref. </th>
		                  <th>Availability</th>
		                  <th>Unit price (Rs.)</th>
		                  <th>Qty </th>
		                  <th>Total (Rs.)</th>
						</tr>
		              </thead>
		              <tbody>
		              <%for(int i = 0; i < noOfItems; i++) { CartItem CI = cart.getCartItem(i);%>
			                <tr>
			                  <td><img width="100" src="<%=CI.getPicture()%>" alt=""></td>
			                  <td><%=CI.getItemName()%><br><%=CI.getSpecifics01()%><br><br><%=CI.getSpecifics02()%></td>
			                  <td> - </td>
			                  <td><span class="shopBtn"><span class="icon-ok"></span></span> </td>
			                  <td><%=decimal.format(CI.getUnitPrice())%></td>
			                  <td>
							<form action="shoppingCartController" method="post">
								<input class="span1" style="max-width:34px" id="appendedInputButtons" size="16" type="text" name="quantity" value="<%=CI.getQuantity()%>"/>
							  	<div class="input-append">
							  		<input type="hidden" name="itemPosition" value="<%=i%>"/>
									<button class="btn btn-mini" type="submit" name="procedure" value="update">update</button>
									<button class="btn btn-mini btn-danger" type="submit" name="procedure" value="remove">remove</button>
							  	</div>
							  	<%if(request.getAttribute("message2") != null && i == (int) request.getAttribute("itemPosition02")) {%>
							  		<br><font color="red"><%=request.getAttribute("message2")%></font>
							  		<br><font color="red"><%=request.getAttribute("message3")%></font>
							  	<%} %>
							 </form>
							</td>
			                  <td><%=decimal.format(CI.getSubTotalItem())%></td>
			                </tr>
						<%}%>
			                <tr>
			                  <td colspan="6" class="alignR"><b>Total products:	</b></td>
			                  <%if(cart.getSubTotalCart() == 0.0) {%>
			                  	<td><b>0.00</b></td>
			                  <%} else {%>
			                  	<td><b><%=decimal.format(cart.getSubTotalCart()) %></b></td>
			                  <%} %>
		                	</tr>
						</tbody>
		            </table><br/>
				
				
		            <table class="table table-bordered">
					<tbody>
						 <tr>
		                  <td> 
						<form class="form-inline">
						  <label style="min-width:159px"> VOUCHERS Code: </label> 
						<input type="text" class="input-medium" placeholder="CODE">
						<button type="submit" class="shopBtn"> ADD</button>
						</form>
						</td>
		                </tr>
						
					</tbody>
						</table>
					<table class="table table-bordered">
					<tbody>
		                <tr><td>ESTIMATE YOUR SHIPPING & TAXES</td></tr>
		                 <tr> 
						 <td>
							<form class="form-horizontal">
							  <div class="control-group">
								<label class="span2 control-label" for="inputEmail">Country</label>
								<div class="controls">
								  <input type="text" placeholder="Country">
								</div>
							  </div>
							  <div class="control-group">
								<label class="span2 control-label" for="inputPassword">Post Code/ Zipcode</label>
								<div class="controls">
								  <input type="password" placeholder="Password">
								</div>
							  </div>
							  <div class="control-group">
								<div class="controls">
								  <button type="submit" class="shopBtn">Click to check the price</button>
								</div>
							  </div>
							</form> 
						  </td>
						  </tr>
		              </tbody>
		            </table>		
			<a href="Homepage.jsp" class="shopBtn btn-large"><span class="icon-arrow-left"></span> Continue Shopping </a>
			<a href="Confirm.jsp" class="shopBtn btn-large pull-right">Confirm <span class="icon-arrow-right"></span></a>
		
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
