<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
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
		<title>Register Page</title>
	</head>
	
	<body>
		<%
			response.setHeader("Cache-control", "no-cache, no-store, must-revalidate");
		%>
		<div class="navbar navbar-inverse navbar-fixed-top" >
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
								<% } else { %>
							<a href="UserProfileControllerPath"><span class="icon-user"></span> <%=Username %></a>
								<%}%>
						<a class="active" href="Register.jsp"><span class="icon-edit"></span> Register </a> 
						<a href="contact.html"><span class="icon-envelope"></span> Contact us</a>
						<a href="cart.html"><span class="icon-shopping-cart"></span> 0 Item(s) - <span class="badge badge-warning"> $000.00</span></a>
						
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
	
		<div class="container" >
			<div id="gototop" > </div>
			<header id="header">
				<div class="row">
					<div class="span4">
						<h1>
						<a class="logo" href="Homepage.jsp">
							<img src="assets/img/logo-bootstrap-shoping-cart.png">
						</a>
						</h1>
					</div>
					<div class="span4"> </div>
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
								<li class=""><a href="Homepage.jsp">Home</a></li>
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
				<div class="span10">
					<ul class="breadcrumb">
						<li><a href="Homepage.jsp" style="text-decoration:none;">Home</a> <span class="divider">/</span></li>
						<li class="active">Registration</li>
					</ul>
					<h3> Registration</h3>	
					<hr class="soft"/>
					
					<div class="well">
						<form class="form-horizontal" action="registerControllerPath" method="post" name="registration">
							<h2 align="center"><font color="red">${message}</font></h2>
							<h3>Your Personal Details</h3>
							<div class="control-group a">
								<label class="control-label">Title <sup>*</sup></label>
								<div class="controls">
									<input list="prefixes" class="span1" name="prefix" placeholder="Title" required <%if(session.getAttribute("Username") == null) { %> /> <%} else {%> disabled /> <%} %>
										<datalist id="prefixes">
											<option value="Mr.">
											<option value="Mrs.">
											<option value="Miss">
											<option value="Ms">
										</datalist>
								</div>
							</div>
							<div class="control-group a">
								<label class="control-label" for="inputFname">First name <sup>*</sup></label>
								<div class="controls">
								  <input type="text" id="inputFname" placeholder="First Name" name="fname" required <%if(session.getAttribute("Username") == null) { %> /> <%} else {%> disabled /> <%} %>
								</div>
							</div>
							<div class="control-group a">
								<label class="control-label" for="inputLname">Last name <sup>*</sup></label>
								<div class="controls">
								  <input type="text" id="inputLname" placeholder="Last Name"  name="lname" required <%if(session.getAttribute("Username") == null) { %> /> <%} else {%> disabled /> <%} %>
								</div>
							</div>
							<div class="control-group a">
								<label class="control-label" for="inputEmail">Email <sup>*</sup></label>
								<div class="controls">
								  <input type="text" placeholder="example@example.com" name="email" required <%if(session.getAttribute("Username") == null) { %> /> <%} else {%> disabled /> <%} %>
								</div>
							</div>	  
		
							<div class="control-group a">
								<label class="control-label">Date of Birth <sup>*</sup></label>
								<div class="controls">
									<input list="day" class="span1" placeholder="Day" name="day" required <%if(session.getAttribute("Username") == null) { %> /> <%} else {%> disabled /> <%} %>
										<datalist id="day">
												<option value="1">
												<option value="2">
												<option value="3">
												<option value="4">
												<option value="5">
												<option value="6">
												<option value="7">
												<option value="8">
												<option value="9">
												<option value="10">
												<option value="11">
												<option value="12">
												<option value="13">
												<option value="14">
												<option value="15">
												<option value="16">
												<option value="17">
												<option value="18">
												<option value="19">
												<option value="20">
												<option value="21">
												<option value="22">
												<option value="23">
												<option value="24">
												<option value="25">
												<option value="26">
												<option value="27">
												<option value="28">
												<option value="29">
												<option value="30">
												<option value="31">
										</datalist>
				
									<input list="month" class="span1" placeholder="Month" name="month" required <%if(session.getAttribute("Username") == null) { %> /> <%} else {%> disabled /> <%} %>
										<datalist id="month">
												<option value="1">
												<option value="2">
												<option value="3">
												<option value="4">
												<option value="5">
												<option value="6">
												<option value="7">
												<option value="8">
												<option value="9">
												<option value="10">
												<option value="11">
												<option value="12">
										</datalist>
				
									<input list="year" class="span1" placeholder="Year" name="year" required <%if(session.getAttribute("Username") == null) { %> /> <%} else {%> disabled /> <%} %>
										<datalist id="year">
												<option value="1950">
												<option value="1951">
												<option value="1952">
												<option value="1953">
												<option value="1954">
												<option value="1955">
												<option value="1956">
												<option value="1957">
												<option value="1958">
												<option value="1959">
												<option value="1960">
												<option value="1961">
												<option value="1962">
												<option value="1963">
												<option value="1964">
												<option value="1965">
												<option value="1966">
												<option value="1967">
												<option value="1968">
												<option value="1969">
												<option value="1970">
												<option value="1971">
												<option value="1972">
												<option value="1973">
												<option value="1974">
												<option value="1975">
												<option value="1976">
												<option value="1977">
												<option value="1978">
												<option value="1979">
												<option value="1980">
												<option value="1981">
												<option value="1982">
												<option value="1983">
												<option value="1984">
												<option value="1985">
												<option value="1986">
												<option value="1987">
												<option value="1988">
												<option value="1989">
												<option value="1990">
												<option value="1991">
												<option value="1992">
												<option value="1993">
												<option value="1994">
												<option value="1995">
												<option value="1996">
												<option value="1997">
												<option value="1998">
												<option value="1999">
												<option value="2000">
												<option value="2001">
												<option value="2002">
												<option value="2003">
												<option value="2004">
										</datalist>
								</div>
							</div>
							
							
							<br>
							<h3>Your Billing Details</h3>
							<div class="control-group a">
								<label class="control-label">Street Address <sup>*</sup></label>
								<div class="controls">
								  <input type="text" placeholder=" Street Adress" name="addline1" required <%if(session.getAttribute("Username") == null) { %> /> <%} else {%> disabled /> <%} %>
								</div>
							</div>
							
							<div class="control-group a">
								<label class="control-label">Street Address Line 2 </label>
								<div class="controls">
								  <input type="text" placeholder=" Street Address Line 2/ optional" name="addline2" <%if(session.getAttribute("Username") == null) { %> /> <%} else {%> disabled /> <%} %>
								</div>
							</div>
							
							 <div class="control-group a">
								<label class="control-label">City <sup>*</sup></label>
								<div class="controls">
								  <input type="text" placeholder=" City" name="city" required <%if(session.getAttribute("Username") == null) { %> /> <%} else {%> disabled /> <%} %>
								</div>
							</div>
							
							 <div class="control-group a">
								<label class="control-label">District </label>
								<div class="controls">
								  <input type="text" placeholder=" District" name="district" <%if(session.getAttribute("Username") == null) { %> /> <%} else {%> disabled /> <%} %>
								</div>
							</div>
							 <div class="control-group a">
								<label class="control-label">State/Province <sup>*</sup></label>
								<div class="controls">
								  <input type="text" placeholder=" State/Province" name="state_province" required <%if(session.getAttribute("Username") == null) { %> /> <%} else {%> disabled /> <%} %>
								</div>
							</div>
							
							 <div class="control-group a">
								<label class="control-label">ZIP <sup>*</sup></label>
								<div class="controls">
								  <input type="text" placeholder=" ZIP" name="zip" required <%if(session.getAttribute("Username") == null) { %> /> <%} else {%> disabled /> <%} %>
								</div>
							</div>
							
							 <div class="control-group a">
								<label class="control-label">Country <sup>*</sup></label>
								<div class="controls">
								  <input type="text" placeholder=" Country" name="country" required <%if(session.getAttribute("Username") == null) { %> /> <%} else {%> disabled /> <%} %>
								</div>
							</div>
							
							
							<br>
							<h3>Your Account Details</h3>
							<div class="control-group a">
								<label class="control-label">Username <sup>*</sup></label>
								<div class="controls">
								  <input type="text" placeholder=" Username" name="username" required <%if(session.getAttribute("Username") == null) { %> /> <%} else {%> disabled /> <%} %>
								</div>
							</div>
							<div class="control-group a">
							<label class="control-label">Password <sup>*</sup></label>
							<div class="controls">
							  <input type="password" placeholder="Password" name="password" required <%if(session.getAttribute("Username") == null) { %> /> <%} else {%> disabled /> <%} %>
							</div>
						  </div>
							<div class="control-group a">
								<label class="control-label">Confirm Password <sup>*</sup></label>
								<div class="controls">
								  <input type="password" placeholder=" Confirm Password" name="confirmpassword" required <%if(session.getAttribute("Username") == null) { %> /> <%} else {%> disabled /> <%} %>
								</div>
							</div>
							
							<br>
							<h3>Emergency Recovery Details</h3>
							<div class="control-group a">
								<label class="control-label">Re-enter Email <sup>*</sup></label>
								<div class="controls">
								  <input type="text" placeholder=" example@example.com" name="reemail" required <%if(session.getAttribute("Username") == null) { %> /> <%} else {%> disabled /> <%} %>
								</div>
							</div>
							
							<div class="control-group a">
								<label class="control-label">Question 01 <sup>*</sup></label>
								<div class="controls">
								  <input type="text" placeholder="What is my favourite food ?" name="question01" required <%if(session.getAttribute("Username") == null) { %> /> <%} else {%> disabled /> <%} %>
								</div>
						  	</div>
						  	
							<div class="control-group a">
								<label class="control-label">Answer 01 <sup>*</sup></label>
								<div class="controls">
								  <input type="text" placeholder="Burger" name="answer01" required <%if(session.getAttribute("Username") == null) { %> /> <%} else {%> disabled /> <%} %>
								</div>
						  	</div>
							<div class="control-group a">
								<label class="control-label">Question 02 <sup>*</sup></label>
								<div class="controls">
								  <input type="text" placeholder="Who is my favourite teacher ?" name="question02" required <%if(session.getAttribute("Username") == null) { %> /> <%} else {%> disabled /> <%} %>
								</div>
							</div>
							<div class="control-group a">
								<label class="control-label">Answer 02 <sup>*</sup></label>
								<div class="controls">
								  <input type="text" placeholder="Mrs.Buttons" name="answer02" required <%if(session.getAttribute("Username") == null) { %> /> <%} else {%> disabled /> <%} %>
								</div>
							</div>
						<div class="control-group">
							<div class="controls">
								<input type="submit" name="submitAccount" value="Register" class="btn btn-primary" <%if(session.getAttribute("Username") == null) { %> /> <%} else {%> disabled /> <%} %>
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
						<h5>Information</h5>
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
