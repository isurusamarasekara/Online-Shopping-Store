<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.classes.login.LoggedUser, com.classes.userProfile.AllOrderData, java.text.DecimalFormat"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		
		<link href="CSS/bootstrap.css" rel="stylesheet"/>
		<link href="CSS/style.css" rel="stylesheet"/>
		<link href="assets/font-awesome/css/font-awesome.css" rel="stylesheet">
		<link rel="shortcut icon" href="assets/ico/favicon.ico">
		<%	String Username = (String) session.getAttribute("Username");
			LoggedUser User = (LoggedUser) session.getAttribute("User");
			AllOrderData AOD = (AllOrderData) request.getAttribute("AOD");
			DecimalFormat df = new DecimalFormat("#.00");
		%>
		<title>	<% if(Username != null) {%> <%=User.getFirstName() %> <% }%>
		</title>
	</head>
	<body>
		<div class="container">
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
							
							<a href="Homepage.jsp"> <span class="icon-home"></span> Home</a> 
							
								<% if(Username == null) { %>
							<a href="Login.jsp"><span class="icon-user"></span> My Account</a>
								<%} else { %>
							<a class="active"><span class="icon-user"></span> <%=Username %></a>
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
									<li ><a href="Homepage.jsp">Home	</a></li>
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
				<div class="row"></div>
					<div class="span11">
					<%	if(AOD != null) {
							for(int i = 0; i< AOD.getOrderedItemListSize(); i++) { 
					%>
						<div class="well well-small">
							<div class="row-fluid">	  
								<div class="span2">
									<img src="<%=AOD.getItemSpecific(i).getItemPicUrl() %>" alt="">
								</div>
								<div class="span6">
									<h4><%=AOD.getItemSpecific(i).getItemName() %> [<%=AOD.getItemSpecific(i).getSpecifics() %>]</h4>
									<p>	<%=AOD.getItemSpecific(i).getDescription() %></p>
								</div>
								<div class="span4 alignR">
									<h5 align="left">Sub Total on Order 													:<span class="badge badge-warning"> Rs. <%=df.format(AOD.getOrderedItem(i).getItemOrderTotal()) %></span></h5><br>
									<h5 align="left">Order Id(Ref)      &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp	:<span class="badge badge-info"> <%=AOD.getOrderedItem(i).getOrderId() %></span></h5>
									<h5 align="left">Ordered Quantity   &nbsp&nbsp&nbsp										:<span class="badge badge-success"> <%=AOD.getOrderedItem(i).getQuantity() %></span></h5>
									<h5 align="left">Date Ordered       &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp	:<span class="badge badge-inverse"> <%=AOD.getOrderedItem(i).getOrderDate() %></span></h5>
									<h5 align="left">Shipping Status    &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp						:<span class="badge badge-important"> <%=AOD.getOrderedItem(i).getStatus() %></span></h5>
								</div>
							</div>
						</div>
					<%		}
						}
					%>
						
		<!--
		Featured Products
		-->
			<div class="well well-small">
			  <h3><a class="btn btn-mini pull-right" href="products.html" title="View more">VIew More<span class="icon-plus"></span></a> Featured Products  </h3>
			  <hr class="soften"/>
			  <div class="row-fluid">
			  <ul class="thumbnails">
				<li class="span4">
				  <div class="thumbnail">
					<a class="zoomTool" href="product_details.html" title="add to cart"><span class="icon-search"></span> QUICK VIEW</a>
					<a  href="product_details.html"><img src="assets/img/d.jpg" alt=""></a>
					<div class="caption">
					  <h5>Manicure & Pedicure</h5>
					  <h4>
						  <a class="defaultBtn" href="product_details.html" title="Click to view"><span class="icon-zoom-in"></span></a>
						  <a class="shopBtn" href="#" title="add to cart"><span class="icon-plus"></span></a>
						  <span class="pull-right">$22.00</span>
					  </h4>
					</div>
				  </div>
				</li>
				<li class="span4">
				  <div class="thumbnail">
					<a class="zoomTool" href="product_details.html" title="add to cart"><span class="icon-search"></span> QUICK VIEW</a>
					<a  href="product_details.html"><img src="assets/img/e.jpg" alt=""></a>
					<div class="caption">
					  <h5>Manicure & Pedicure</h5>
					  <h4>
						  <a class="defaultBtn" href="product_details.html" title="Click to view"><span class="icon-zoom-in"></span></a>
						  <a class="shopBtn" href="#" title="add to cart"><span class="icon-plus"></span></a>
						  <span class="pull-right">$22.00</span>
					  </h4>
					</div>
				  </div>
				</li>
				<li class="span4">
				  <div class="thumbnail">
					<a class="zoomTool" href="product_details.html" title="add to cart"><span class="icon-search"></span> QUICK VIEW</a>
					<a  href="product_details.html"><img src="assets/img/f.jpg" alt=""/></a>
					<div class="caption">
					  <h5>Manicure & Pedicure</h5>
					  <h4>
						  <a class="defaultBtn" href="product_details.html" title="Click to view"><span class="icon-zoom-in"></span></a>
						  <a class="shopBtn" href="#" title="add to cart"><span class="icon-plus"></span></a>
						  <span class="pull-right">$22.00</span>
					  </h4>
					</div>
				  </div>
				</li>
			  </ul>	
		</div>
		</div>
		
		<div class="well well-small">
		<a class="btn btn-mini pull-right" href="#">View more <span class="icon-plus"></span></a>
		Popular Products 
		</div>
		<hr>
		<div class="well well-small">
		<a class="btn btn-mini pull-right" href="#">View more <span class="icon-plus"></span></a>
		Best selling Products 
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