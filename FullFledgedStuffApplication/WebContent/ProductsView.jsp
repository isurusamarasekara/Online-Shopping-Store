<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import=" java.util.ArrayList, com.classes.categoryAndView.RetrievedItem, java.text.DecimalFormat"%>
    
<jsp:useBean id="item" scope="request" class="com.classes.selectedItemBean.SelectedItem" />
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		
		<link href="CSS/bootstrap.css" rel="stylesheet"/>
		<link href="CSS/style.css" rel="stylesheet"/>
		<link href="assets/font-awesome/css/font-awesome.css" rel="stylesheet">
		<link rel="shortcut icon" href="assets/ico/favicon.ico">

		<%	String Username = (String) session.getAttribute("Username");
		%>
		
		<title>Insert title here</title>
	</head>
	<body>
		<!-- 
			Upper Header Section 
		-->
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
							
								<% if(Username == null) { 	%>
							<a href="Login.jsp"><span class="icon-user"></span> My Account</a>
								<% } else { %>
							<a href="UserProfileControllerPath"><span class="icon-user"></span> <%=Username %></a>
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
		
		<!--
		Lower Header Section 
		-->
			<div class="container">
				<div id="gototop"></div>
				<header id="header">
					<div class="row">
						<div class="span4">
							<h1>
							<a class="logo" href="index.html"><span>Twitter Bootstrap ecommerce template</span> 
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
									<li ><a href="Homepage.jsp">Home	</a></li>
									<li class=""><a href="#">List View</a></li>
									<li class="active"><a>
														<%	String Category = (String) request.getAttribute("Category");
															if (Category == null) {%>
														Products
														<%} else {%>
														${Category}
														<%}%>
														</a></li>
									<li class=""><a href="#">Three Column</a></li>
									<li class=""><a href="#">Four Column</a></li>
									<li class=""><a href="#">General Content</a></li>
								</ul>
				
								<form action="searchAndViewController" class="navbar-search pull-left">
									<input type="text" placeholder="Search" class="search-query span2" name="Search">
								</form>
				
								<ul class="nav pull-right">
									<li >
											<%  if(Username == null) { %>
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
				
				<div class="span11">
					<ul class="breadcrumb">
						<li><a href="#" style="text-decoration:none;">Products</a>
							<%if(Category != null) {%>	<span class="divider">/</span></li>
														<li class="active">${Category}</li>
							<%}%>
					</ul>
				</div>
		<!-- 
		Body Section 
		-->
				<div class="row">
					<div id="sidebar" class="span3">
						<div class="well well-small">
							<ul class="nav nav-list">
								<li><a href="categoryAndViewController?Category=Books">Books</a></li>
								<li><a href="categoryAndViewController?Category=Stationary">Stationary</a></li>
								<li><a href="categoryAndViewController?Category=Fashion">Fashion</a></li>
								<li><a href="categoryAndViewController?Category=Watches">Watches</a></li>
								<li><a href="categoryAndViewController?Category=Electronics">Electronics</a></li>
								<li><a href="categoryAndViewController?Category=Art">Collectibles & Art</a></li>
								<li><a href="categoryAndViewController?Category=Home">Home & Garden</a></li>
								<li><a href="categoryAndViewController?Category=Sport">Sporting Goods</a></li>
								<li><a href="categoryAndViewController?Category=Motor">Motors</a></li>
								<li><a href="categoryAndViewController?Category=Deals">Daily Deals</a></li>
								<li style="border:0"> &nbsp;</li>
								<li> <a class="totalInCart" href="cart.html"><strong>Total Amount  <span class="badge badge-warning pull-right" style="line-height:18px;">$448.42</span></strong></a></li>
							</ul>
						</div>
		
					  <div class="well well-small alert alert-warning cntr">
						  <h2>50% Discount</h2>
						  <p> 
							 only valid for online order. <br><br><a class="defaultBtn" href="#">Click here </a>
						  </p>
					  </div>
					  <div class="well well-small" ><a href="#"><img src="assets/img/paypal.jpg" alt="payment method paypal"></a></div>
					
					<a class="shopBtn btn-block" href="#">Upcoming products <br><small>Click to view</small></a>
					<br>
					<br>
					<ul class="nav nav-list promowrapper">
					<li>
					  <div class="thumbnail">
						<a class="zoomTool" href="product_details.html" title="add to cart"><span class="icon-search"></span> QUICK VIEW</a>
						<img src="assets/img/bootstrap-ecommerce-templates.png" alt="bootstrap ecommerce templates">
						<div class="caption">
						  <h4><a class="defaultBtn" href="product_details.html">VIEW</a> <span class="pull-right">$22.00</span></h4>
						</div>
					  </div>
					</li>
					<li style="border:0"> &nbsp;</li>
					<li>
					  <div class="thumbnail">
						<a class="zoomTool" href="product_details.html" title="add to cart"><span class="icon-search"></span> QUICK VIEW</a>
						<img src="assets/img/shopping-cart-template.png" alt="shopping cart template">
						<div class="caption">
						  <h4><a class="defaultBtn" href="product_details.html">VIEW</a> <span class="pull-right">$22.00</span></h4>
						</div>
					  </div>
					</li>
					<li style="border:0"> &nbsp;</li>
					<li>
					  <div class="thumbnail">
						<a class="zoomTool" href="product_details.html" title="add to cart"><span class="icon-search"></span> QUICK VIEW</a>
						<img src="assets/img/bootstrap-template.png" alt="bootstrap template">
						<div class="caption">
						  <h4><a class="defaultBtn" href="product_details.html">VIEW</a> <span class="pull-right">$22.00</span></h4>
						</div>
					  </div>
					</li>
				  </ul>
		
			</div>
			<div class="span9">
		<!--
		New Products
		-->
			<div class="well well-small">
			
			<%	ArrayList<RetrievedItem> categoryItemList = (ArrayList<RetrievedItem>) session.getAttribute("categoryItemList");
				if(categoryItemList == null) {%>
				
			<h3>Sorry ! There are No Products Currently Available in '${Category}' Category.</h3>
			
			<%} else {
					if(session.getAttribute("selectedItem") != null)
						session.removeAttribute("selectedItem");
					
					session.setAttribute("selectedItem", categoryItemList);
					int size = categoryItemList.size();
					int i = 0;
					int n;
					DecimalFormat df = new DecimalFormat("#.00");
			%>
				<h3>${Category} </h3>
				
					<% 	for(int j = 1; j <= (int)Math.ceil(size/3.0); j++) { n = 0; if(j > 1) i++;%>
						<div class="row-fluid">
						<ul class="thumbnails">
						<%	for( ; i < size; i++) { n++;%>
								<li class="span4">
								  <div class="thumbnail">
									<a href="product_details.html" class="overlay"></a>
									
<!-- 									<button type="submit" class="zoomTool" title="view the product" name="view"><span class="icon-search"></span>View</button> -->
									
<%-- 									<input type="hidden" name="what" value="${i}" /> --%>
									
									<img src="<%=categoryItemList.get(i).getItemPicUrl()%>"/>
									<div class="caption cntr">
										<p><b><%=categoryItemList.get(i).getItemName()%></b></p>
										<%if(Category.equals("Books")) {%>
											<p><i>by <%=categoryItemList.get(i).getAuthor() %></i></p></br>
										<%} else if (Category.equals("Stationary")) {%>
											<p><i>Distributor : <%=categoryItemList.get(i).getDistributor() %></i></p></br>
										<%} else if (Category.equals("Fashion")) {%>
											<p><i><%=categoryItemList.get(i).getSpecifics() %></i></p></br>
										<%} else if (Category.equals("Watches")) {%>
											<p><i><%=categoryItemList.get(i).getSpecifics() %></i></p></br>
										<%} else if (Category.equals("Electronics")) {%>
											<p><i><%=categoryItemList.get(i).getSpecifics() %></i></p></br>
										<%} else if (Category.equals("Art")) {%>
											<p><i><%=categoryItemList.get(i).getSpecifics() %></i></p></br>
										<%} else if (Category.equals("Home")) {%>
											<p><i><%=categoryItemList.get(i).getSpecifics() %></i></p></br>
										<%} else if (Category.equals("Sport")) {%>
											<p><i><%=categoryItemList.get(i).getSpecifics() %></i></p></br>
										<%} else if (Category.equals("Motor")) {%>
											<p><i><%=categoryItemList.get(i).getSpecifics() %></i></p></br>
										<%} else if (Category.equals("Deals")) {%>
											<p><i><%=categoryItemList.get(i).getSpecifics() %></i></p></br>
										<%} %>
										<p><strong> Rs.<%=df.format(categoryItemList.get(i).getUnitPrice())%></strong></p>
									<form action="ProductViewControllerPath" method="post">
										<h4>
											<button type="submit" class="shopBtn" name="view">View</button>
										</h4>
										<input type="hidden" name="listNumber" value="<%=i%>"/>
									</form>
										<br class="clr">
									</div>
								  </div>
								</li>

						<%	if(n == 3) break;}%>
						</ul>
						</div>
					<%} %>
			<%} %>
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