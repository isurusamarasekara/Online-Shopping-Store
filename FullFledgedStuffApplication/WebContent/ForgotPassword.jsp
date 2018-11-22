<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.classes.login.ForgotUser"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		
		<title>Forgot Password Page</title>
		
		<link href="CSS/bootstrap.css" rel="stylesheet"/>
		<link href="CSS/style.css" rel="stylesheet"/>
		<link href="assets/font-awesome/css/font-awesome.css" rel="stylesheet">
		<link rel="shortcut icon" href="assets/ico/favicon.ico">
		
		<%	ForgotUser FUser = (ForgotUser)session.getAttribute("FUser");
			boolean AccountVerified;
			boolean SpecificsVerified;
			
			if(request.getAttribute("AccountVerified") == null){
				AccountVerified = false;
			}
			else {
				AccountVerified = (Boolean)request.getAttribute("AccountVerified");
			}
			
			if(request.getAttribute("SpecificsVerified") == null){
				SpecificsVerified = false;
			}
			else {
				SpecificsVerified = (Boolean)request.getAttribute("SpecificsVerified");
			}
			
			response.setHeader("Cache-control", "no-cache, no-store, must-revalidate");

		%>
	</head>
	
	<body>
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
						<a href="Login.jsp"><span class="icon-user"></span> My Account</a> 
						<a href="Register.jsp"><span class="icon-edit"></span> Register </a> 
						<a href="contact.html"><span class="icon-envelope"></span> Contact us</a>
						<a href="cart.html"><span class="icon-shopping-cart"></span> 0 Item(s) - <span class="badge badge-warning"> $000.00</span></a>
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
						<a class="logo" href="Homepage.html">
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
								<li class=""><a href="Homepage.html">Home</a></li>
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
								<li class="active disable">
									<a href="Login.jsp"><b><span class="icon-lock"></span> Login </b></a>
								</li>
							</ul>
						</div>
					</div>
				</div>
			</div>
			
			<div class="row">
				<div class="span10">
					<ul class="breadcrumb">
						<li><a href="Homepage.jsp" style="text-decoration:none;">Home</a> <span class="divider">/</span></li>
						<li><a href="Login.jsp" style="text-decoration:none;">Login</a> <span class="divider">/</span></li>
						<li class="active">Forgot the Password</li>
					</ul>
					<pre><h4>Don't worry, we got your back. Fill the below forms with the correct details.</h4></pre>
					<hr class="soft"/>
					
					<div class="well">
						<form class="form-horizontal" action="forgotPasswordControllerPath" method="post" name="accountForm">
							<h3 align="center">Enter Your Account Details</h3>
							<table align="center">
								<tr>
									<td><font color="red">${message01}</font></td>
								</tr>
								<tr>
									<td><font color="red">${message02}</font></td>
								</tr>
							</table>
							<br>
							<div class="control-group a">
								<label class="control-label">Username <sup>*</sup></label>
								<div class="controls">
								  <input type="text" name="username" <%if(AccountVerified != true) {%>placeholder=" Username" required/> <%} else {%>value=${FUser.getUsername()} disabled/><%}%>
								</div>
							</div>
							<div class="control-group a">
								<label class="control-label">Email <sup>*</sup></label>
								<div class="controls">
								  <input type="text" name="email" <%if(AccountVerified != true) {%>placeholder=" example@example.com" required/> <%} else {%>value=${FUser.getEmail()} disabled/><%}%>
								</div>
						 	 </div>
							<div class="control-group">
								<div class="controls">
									<input type="submit" name="account" value="Submit Account" class="btn btn-primary" <%if(AccountVerified != true) {%> > <%} else {%> disabled/><%}%>
								</div>
							</div>
						</form>
					</div>

<% if(AccountVerified == true) {%>
					<div class="well">
						<form class="form-horizontal" action="forgotPasswordControllerPath" method="post" name="specificsForm">
							<h3 align="center">Fill the Specifics,<br> So That We Can Help You Retrieve Your Account</h3>
							<table align="center">
								<tr>
									<td><font color="red">${message01}</font></td>
								</tr>
								<tr>
									<td><font color="red">${message02}</font></td>
								</tr>
							</table>
							<br>
							<div class="control-group a">
								<label class="control-label">Question 01 </label>
								<div class="controls">
								  <input type="text" style="width:400px;" <%if(FUser.getQuestion01() == null) {%> value="Question 01 ?" <%} else {%> value="${FUser.getQuestion01()}" <% }%> disabled/>
								</div>
							</div>
							<div class="control-group a">
								<label class="control-label">Answer </label>
								<div class="controls">
								  <input name="answer01" <%if(SpecificsVerified != true) {%>type="text" placeholder="type your answer here" required/> <%} else { %> type="password" value="${FUser.getAnswer01()}" disabled/> <%}%>
								</div>
							</div>
							<div class="control-group a">
								<label class="control-label">Question 02 </label>
								<div class="controls">
								  <input type="text" style="width:400px;" <%if(FUser.getQuestion02() == null) {%> value="Question 02 ?" <%} else {%> value="${FUser.getQuestion02()}" <%}%> disabled/>
								</div>
							</div>
							<div class="control-group a">
								<label class="control-label">Answer </label>
								<div class="controls">
								  <input name="answer02" <%if(SpecificsVerified != true) {%>type="text" placeholder="type your answer here" required/> <%} else { %> type="password" value="${FUser.getAnswer02()}" disabled/> <%}%>
								</div>
							</div>
							<div class="control-group">
								<div class="controls">
									<input type="submit" name="specifics" value="Submit Answers" class="btn btn-primary" <%if(SpecificsVerified != true) {%> > <%} else {%> disabled/><%}%>
								</div>
							</div>
						</form>
					</div>
					
<%if(SpecificsVerified == true) {%>
					<div class="well">
						<form class="form-horizontal" action="forgotPasswordControllerPath" method="post" name="resetForm">
							<h3 align="center">Ok, You have Successfully Proven Yourself,<br> Let's renew the passsword</h3>
							<table align="center">
								<tr>
									<td><font color="red">${message01}</font></td>
								</tr>
								<tr>
									<td><font color="red">${message02}</font></td>
								</tr>
							</table>
							<br>
							<div class="control-group a">
								<label class="control-label">Old Password </label>
								<div class="controls">
								  <input disabled <%if(SpecificsVerified != true) {%> type="text" value="Old Password" /> <%} else {%> type="password" value="YouCan'tHackMeBruh" /> <%}%>
								</div>
							</div>
							<div class="control-group a">
								<label class="control-label">New Password <sup>*</sup></label>
								<div class="controls">
								  <input type="password" name="newPass" required>
								</div>
						 	 </div>
						 	 <div class="control-group a">
								<label class="control-label">Confirm New Password <sup>*</sup></label>
								<div class="controls">
								  <input type="password" name="conNewPass" required>
								</div>
						 	 </div>
							<div class="control-group">
								<div class="controls">
									<input type="submit" name="reset" value="Submit Reset" class="btn btn-primary">
								</div>
							</div>
						</form>
					</div>
<%}
}%>
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
