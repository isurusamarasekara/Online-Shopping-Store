<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.classes.categoryAndView.RetrievedItem"%>
    
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
		
		<title>Selected Product</title>
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
								<% if(session.getAttribute("Username") == null) { %>
							<a href="Login.jsp"><span class="icon-user"></span> My Account</a>
								<% } else {  %>
							<a href="UserProfileControllerPath"><span class="icon-user"></span> <%=Username %></a>
								<%}%>
						<a href="Register.jsp"><span class="icon-edit"></span> Free Register </a> 
						<a href="contact.html"><span class="icon-envelope"></span> Contact us</a>
						<a href="cart.html"><span class="icon-shopping-cart"></span> 0 Item(s) - <span class="badge badge-warning"> Rs. 000.00</span></a>
						
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
						<a class="logo" href="index.html"><span>Twitter Bootstrap ecommerce template</span> 
							<img src="assets/img/logo-bootstrap-shoping-cart.png" alt="bootstrap sexy shop">
						</a>
						</h1>
					</div>
					<div class="span4">
					</div>
					<div class="span4 alignR">
						<p><br> <strong> Support (24/7) :  077x xxx xxx</strong><br><br></p>
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
					  <li class="active"><a href="Hompage.jsp">Home	</a></li>
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
		   <ul class="breadcrumb">
		   <li><a href="index.html">Home</a> <span class="divider">/</span></li>
		   <li><a href="products.html">Products</a> <span class="divider">/</span></li>
		   <li class="active">Preview</li>
		   </ul>	
		<div class="well well-small">
		<div class="row-fluid">
				<div class="span5">
				<div id="myCarousel" class="carousel slide cntr">
		               <div class="carousel-inner">
		                 <div class="item active">
		                 <%RetrievedItem RI = (RetrievedItem) session.getAttribute("SelectedItem"); %>
		                  <a href="#"> <img src="<%=RI.getItemPicUrl()%>" alt="" style="width:100%"></a>
		                 </div>
		                 <div class="item">
		                    <a href="#"> <img src="assets/img/b.jpg" alt="" style="width:100%"></a>
		                 </div>
		                 <div class="item">
		                   <a href="#"> <img src="assets/img/e.jpg" alt="" style="width:100%"></a>
		                  </div>
		                </div>
		                <a class="left carousel-control" href="#myCarousel" data-slide="prev"></a>
		                <a class="right carousel-control" href="#myCarousel" data-slide="next"></a>
		            </div>
					</div>
					<div class="span7">
						<h3><%=RI.getItemName() %> <br> [<%=RI.getSpecifics() %>]</h3>
						<hr class="soft"/>
						
						<form class="form-horizontal qtyFrm" name="itemToCartAdding" action="shoppingCartController" method="post">
						  <div class="control-group">
						  	<p><font color="red">${message1}</font></p>
							<label class="control-label"><span>Quantity</span></label>
							<div class="controls">
							<input type="number" class="span6" placeholder="Qty." name="quantity" <%if(session.getAttribute("Username") == null) {%> disabled <%}%> required/>
							</div>
						  </div>
						
<!-- 						  <div class="control-group"> -->
<!-- 							<label class="control-label"><span>Color</span></label> -->
<!-- 							<div class="controls"> -->
<!-- 							  <select class="span11"> -->
<!-- 								  <option>Red</option> -->
<!-- 								  <option>Purple</option> -->
<!-- 								  <option>Pink</option> -->
<!-- 								  <option>Red</option> -->
<!-- 								</select> -->
<!-- 							</div> -->
<!-- 						  </div> -->
<!-- 						  <div class="control-group"> -->
<!-- 							<label class="control-label"><span>Materials</span></label> -->
<!-- 							<div class="controls"> -->
<!-- 							  <select class="span11"> -->
<!-- 								  <option>Material 1</option> -->
<!-- 								  <option>Material 2</option> -->
<!-- 								  <option>Material 3</option> -->
<!-- 								  <option>Material 4</option> -->
<!-- 								</select> -->
<!-- 							</div> -->
<!-- 						  </div> -->

						  <h4><%=RI.getQtyAvailable() %> items in stock</h4>
						  <p><%=RI.getDescription() %>
						  <p>
						 
<!-- 						 <input type="hidden" name="itemId" value=""/> -->
<!-- 						 <input type="hidden" name="itemUnitPrice" value=""/> -->
<!-- 						 <input type="hidden"/> -->
						 <input type="hidden" name="procedure" value="add"/>
						  
						  <%if(session.getAttribute("Username") == null) {%>
						  	<a href="Login.jsp" class="btn btn-info">Login Before Buying</a>
						  <%} else {%>
						  	<button type="submit" class="shopBtn"><span class=" icon-shopping-cart"></span> Add to cart</button>
						  <%} %>
						</form>
					</div>
					</div>
						<hr class="softn clr"/>
		
		
		            <ul id="productDetail" class="nav nav-tabs">
		              <li class="active"><a href="#home" data-toggle="tab">Product Details</a></li>
		              <li class=""><a href="#profile" data-toggle="tab">Related Products </a></li>
		              <li class="dropdown">
		                <a href="#" class="dropdown-toggle" data-toggle="dropdown">Acceseries <b class="caret"></b></a>
		                <ul class="dropdown-menu">
		                  <li><a href="#cat1" data-toggle="tab">Category one</a></li>
		                  <li><a href="#cat2" data-toggle="tab">Category two</a></li>
		                </ul>
		              </li>
		            </ul>
		            <div id="myTabContent" class="tab-content tabWrapper">
		            <div class="tab-pane fade active in" id="home">
					  <h4>Product Information</h4>
		                <table class="table table-striped">
						<tbody>
						<tr class="techSpecRow"><td class="techSpecTD1">Color:</td><td class="techSpecTD2">Black</td></tr>
						<tr class="techSpecRow"><td class="techSpecTD1">Style:</td><td class="techSpecTD2">Apparel,Sports</td></tr>
						<tr class="techSpecRow"><td class="techSpecTD1">Season:</td><td class="techSpecTD2">spring/summer</td></tr>
						<tr class="techSpecRow"><td class="techSpecTD1">Usage:</td><td class="techSpecTD2">fitness</td></tr>
						<tr class="techSpecRow"><td class="techSpecTD1">Sport:</td><td class="techSpecTD2">122855031</td></tr>
						<tr class="techSpecRow"><td class="techSpecTD1">Brand:</td><td class="techSpecTD2">Shock Absorber</td></tr>
						</tbody>
						</table>
						<p>Raw denim you probably haven't heard of them jean shorts Austin. Nesciunt tofu stumptown aliqua, retro synth master cleanse. Mustache cliche tempor, williamsburg carles vegan helvetica. Reprehenderit butcher retro keffiyeh dreamcatcher synth. Cosby sweater eu banh mi, qui irure terry richardson ex squid. Aliquip placeat salvia cillum iphone. Seitan aliquip quis cardigan american apparel, butcher voluptate nisi qui.</p>
						<p>Raw denim you probably haven't heard of them jean shorts Austin. Nesciunt tofu stumptown aliqua, retro synth master cleanse. Mustache cliche tempor, williamsburg carles vegan helvetica. Reprehenderit butcher retro keffiyeh dreamcatcher synth. Cosby sweater eu banh mi, qui irure terry richardson ex squid. Aliquip placeat salvia cillum iphone. Seitan aliquip quis cardigan american apparel, butcher voluptate nisi qui.</p>
						<p>Raw denim you probably haven't heard of them jean shorts Austin. Nesciunt tofu stumptown aliqua, retro synth master cleanse. Mustache cliche tempor, williamsburg carles vegan helvetica. Reprehenderit butcher retro keffiyeh dreamcatcher synth. Cosby sweater eu banh mi, qui irure terry richardson ex squid. Aliquip placeat salvia cillum iphone. Seitan aliquip quis cardigan american apparel, butcher voluptate nisi qui.</p>
						<p>Raw denim you probably haven't heard of them jean shorts Austin. Nesciunt tofu stumptown aliqua, retro synth master cleanse. Mustache cliche tempor, williamsburg carles vegan helvetica. Reprehenderit butcher retro keffiyeh dreamcatcher synth. Cosby sweater eu banh mi, qui irure terry richardson ex squid. Aliquip placeat salvia cillum iphone. Seitan aliquip quis cardigan american apparel, butcher voluptate nisi qui.</p>
						<p>Raw denim you probably haven't heard of them jean shorts Austin. Nesciunt tofu stumptown aliqua, retro synth master cleanse. Mustache cliche tempor, williamsburg carles vegan helvetica. Reprehenderit butcher retro keffiyeh dreamcatcher synth. Cosby sweater eu banh mi, qui irure terry richardson ex squid. Aliquip placeat salvia cillum iphone. Seitan aliquip quis cardigan american apparel, butcher voluptate nisi qui.</p>
						<p>Raw denim you probably haven't heard of them jean shorts Austin. Nesciunt tofu stumptown aliqua, retro synth master cleanse. Mustache cliche tempor, williamsburg carles vegan helvetica. Reprehenderit butcher retro keffiyeh dreamcatcher synth. Cosby sweater eu banh mi, qui irure terry richardson ex squid. Aliquip placeat salvia cillum iphone. Seitan aliquip quis cardigan american apparel, butcher voluptate nisi qui.</p>
						<p>Raw denim you probably haven't heard of them jean shorts Austin. Nesciunt tofu stumptown aliqua, retro synth master cleanse. Mustache cliche tempor, williamsburg carles vegan helvetica. Reprehenderit butcher retro keffiyeh dreamcatcher synth. Cosby sweater eu banh mi, qui irure terry richardson ex squid. Aliquip placeat salvia cillum iphone. Seitan aliquip quis cardigan american apparel, butcher voluptate nisi qui.</p>
						<p>Raw denim you probably haven't heard of them jean shorts Austin. Nesciunt tofu stumptown aliqua, retro synth master cleanse. Mustache cliche tempor, williamsburg carles vegan helvetica. Reprehenderit butcher retro keffiyeh dreamcatcher synth. Cosby sweater eu banh mi, qui irure terry richardson ex squid. Aliquip placeat salvia cillum iphone. Seitan aliquip quis cardigan american apparel, butcher voluptate nisi qui.</p>
		
					</div>
					<div class="tab-pane fade" id="profile">
					<div class="row-fluid">	  
					<div class="span2">
						<img src="assets/img/d.jpg" alt="">
					</div>
					<div class="span6">
						<h5>Product Name </h5>
						<p>
						Nowadays the lingerie industry is one of the most successful business spheres.
						We always stay in touch with the latest fashion tendencies - 
						that is why our goods are so popular..
						</p>
					</div>
					<div class="span4 alignR">
					<form class="form-horizontal qtyFrm">
					<h3> $140.00</h3>
					<label class="checkbox">
						<input type="checkbox">  Adds product to compair
					</label><br>
					<div class="btn-group">
					  <a href="product_details.html" class="defaultBtn"><span class=" icon-shopping-cart"></span> Add to cart</a>
					  <a href="product_details.html" class="shopBtn">VIEW</a>
					 </div>
						</form>
					</div>
				</div>
					<hr class="soft">
					<div class="row-fluid">	  
					<div class="span2">
						<img src="assets/img/d.jpg" alt="">
					</div>
					<div class="span6">
						<h5>Product Name </h5>
						<p>
						Nowadays the lingerie industry is one of the most successful business spheres.
						We always stay in touch with the latest fashion tendencies - 
						that is why our goods are so popular..
						</p>
					</div>
					<div class="span4 alignR">
					<form class="form-horizontal qtyFrm">
					<h3> $140.00</h3>
					<label class="checkbox">
						<input type="checkbox">  Adds product to compair
					</label><br>
					<div class="btn-group">
					  <a href="product_details.html" class="defaultBtn"><span class=" icon-shopping-cart"></span> Add to cart</a>
					  <a href="product_details.html" class="shopBtn">VIEW</a>
					 </div>
						</form>
					</div>
			</div>
					<hr class="soft"/>
					<div class="row-fluid">	  
					<div class="span2">
						<img src="assets/img/d.jpg" alt="">
					</div>
					<div class="span6">
						<h5>Product Name </h5>
						<p>
						Nowadays the lingerie industry is one of the most successful business spheres.
						We always stay in touch with the latest fashion tendencies - 
						that is why our goods are so popular..
						</p>
					</div>
					<div class="span4 alignR">
					<form class="form-horizontal qtyFrm">
					<h3> $140.00</h3>
					<label class="checkbox">
						<input type="checkbox">  Adds product to compair
					</label><br>
					<div class="btn-group">
					  <a href="product_details.html" class="defaultBtn"><span class=" icon-shopping-cart"></span> Add to cart</a>
					  <a href="product_details.html" class="shopBtn">VIEW</a>
					 </div>
						</form>
					</div>
			</div>
					<hr class="soft"/>
					<div class="row-fluid">	  
							<div class="span2">
								<img src="assets/img/d.jpg" alt="">
							</div>
							<div class="span6">
								<h5>Product Name </h5>
								<p>
								Nowadays the lingerie industry is one of the most successful business spheres.
								We always stay in touch with the latest fashion tendencies - 
								that is why our goods are so popular..
								</p>
							</div>
							<div class="span4 alignR">
							<form class="form-horizontal qtyFrm">
							<h3> $140.00</h3>
							<label class="checkbox">
								<input type="checkbox">  Adds product to compair
							</label><br>
							<div class="btn-group">
							  <a href="product_details.html" class="defaultBtn"><span class=" icon-shopping-cart"></span> Add to cart</a>
							  <a href="product_details.html" class="shopBtn">VIEW</a>
							 </div>
								</form>
							</div>
					</div>
					<hr class="soften"/>
					<div class="row-fluid">	  
							<div class="span2">
								<img src="assets/img/d.jpg" alt="">
							</div>
							<div class="span6">
								<h5>Product Name </h5>
								<p>
								Nowadays the lingerie industry is one of the most successful business spheres.
								We always stay in touch with the latest fashion tendencies - 
								that is why our goods are so popular..
								</p>
							</div>
							<div class="span4 alignR">
							<form class="form-horizontal qtyFrm">
							<h3> $140.00</h3>
							<label class="checkbox">
								<input type="checkbox">  Adds product to compair
							</label><br>
							<div class="btn-group">
							  <a href="product_details.html" class="defaultBtn"><span class=" icon-shopping-cart"></span> Add to cart</a>
							  <a href="product_details.html" class="shopBtn">VIEW</a>
							 </div>
								</form>
							</div>
					</div>
					</div>
		              <div class="tab-pane fade" id="cat1">
		                <p>Etsy mixtape wayfarers, ethical wes anderson tofu before they sold out mcsweeney's organic lomo retro fanny pack lo-fi farm-to-table readymade. Messenger bag gentrify pitchfork tattooed craft beer, iphone skateboard locavore carles etsy salvia banksy hoodie helvetica. DIY synth PBR banksy irony. Leggings gentrify squid 8-bit cred pitchfork. Williamsburg banh mi whatever gluten-free, carles pitchfork biodiesel fixie etsy retro mlkshk vice blog. Scenester cred you probably haven't heard of them, vinyl craft beer blog stumptown. Pitchfork sustainable tofu synth chambray yr.</p>
		              <br>
		              <br>
					  <div class="row-fluid">	  
							<div class="span2">
								<img src="assets/img/b.jpg" alt="">
							</div>
							<div class="span6">
								<h5>Product Name </h5>
								<p>
								Nowadays the lingerie industry is one of the most successful business spheres.
								We always stay in touch with the latest fashion tendencies - 
								that is why our goods are so popular..
								</p>
							</div>
							<div class="span4 alignR">
							<form class="form-horizontal qtyFrm">
							<h3> $140.00</h3>
							<label class="checkbox">
								<input type="checkbox">  Adds product to compair
							</label><br>
							<div class="btn-group">
							  <a href="product_details.html" class="defaultBtn"><span class=" icon-shopping-cart"></span> Add to cart</a>
							  <a href="product_details.html" class="shopBtn">VIEW</a>
							 </div>
								</form>
							</div>
					</div>
					<hr class="soften"/>
					<div class="row-fluid">	  
							<div class="span2">
								<img src="assets/img/a.jpg" alt="">
							</div>
							<div class="span6">
								<h5>Product Name </h5>
								<p>
								Nowadays the lingerie industry is one of the most successful business spheres.
								We always stay in touch with the latest fashion tendencies - 
								that is why our goods are so popular..
								</p>
							</div>
							<div class="span4 alignR">
							<form class="form-horizontal qtyFrm">
							<h3> $140.00</h3>
							<label class="checkbox">
								<input type="checkbox">  Adds product to compair
							</label><br>
							<div class="btn-group">
							  <a href="product_details.html" class="defaultBtn"><span class=" icon-shopping-cart"></span> Add to cart</a>
							  <a href="product_details.html" class="shopBtn">VIEW</a>
							 </div>
								</form>
							</div>
					</div>
					<hr class="soften"/>
					  </div>
		              <div class="tab-pane fade" id="cat2">
		                
						<div class="row-fluid">	  
							<div class="span2">
								<img src="assets/img/d.jpg" alt="">
							</div>
							<div class="span6">
								<h5>Product Name </h5>
								<p>
								Nowadays the lingerie industry is one of the most successful business spheres.
								We always stay in touch with the latest fashion tendencies - 
								that is why our goods are so popular..
								</p>
							</div>
							<div class="span4 alignR">
							<form class="form-horizontal qtyFrm">
							<h3> $140.00</h3>
							<label class="checkbox">
								<input type="checkbox">  Adds product to compair
							</label><br>
							<div class="btn-group">
							  <a href="product_details.html" class="defaultBtn"><span class=" icon-shopping-cart"></span> Add to cart</a>
							  <a href="product_details.html" class="shopBtn">VIEW</a>
							 </div>
								</form>
							</div>
					</div>
					<hr class="soften"/>
					<div class="row-fluid">	  
							<div class="span2">
								<img src="assets/img/d.jpg" alt="">
							</div>
							<div class="span6">
								<h5>Product Name </h5>
								<p>
								Nowadays the lingerie industry is one of the most successful business spheres.
								We always stay in touch with the latest fashion tendencies - 
								that is why our goods are so popular..
								</p>
							</div>
							<div class="span4 alignR">
							<form class="form-horizontal qtyFrm">
							<h3> $140.00</h3>
							<label class="checkbox">
								<input type="checkbox">  Adds product to compair
							</label><br>
							<div class="btn-group">
							  <a href="product_details.html" class="defaultBtn"><span class=" icon-shopping-cart"></span> Add to cart</a>
							  <a href="product_details.html" class="shopBtn">VIEW</a>
							 </div>
								</form>
							</div>
					</div>
					<hr class="soften"/>
					<div class="row-fluid">	  
							<div class="span2">
								<img src="assets/img/d.jpg" alt="">
							</div>
							<div class="span6">
								<h5>Product Name </h5>
								<p>
								Nowadays the lingerie industry is one of the most successful business spheres.
								We always stay in touch with the latest fashion tendencies - 
								that is why our goods are so popular..
								</p>
							</div>
							<div class="span4 alignR">
							<form class="form-horizontal qtyFrm">
							<h3> $140.00</h3>
							<label class="checkbox">
								<input type="checkbox">  Adds product to compair
							</label><br>
							<div class="btn-group">
							  <a href="product_details.html" class="defaultBtn"><span class=" icon-shopping-cart"></span> Add to cart</a>
							  <a href="product_details.html" class="shopBtn">VIEW</a>
							 </div>
								</form>
							</div>
					</div>
					<hr class="soften"/>
					<div class="row-fluid">	  
							<div class="span2">
								<img src="assets/img/d.jpg" alt="">
							</div>
							<div class="span6">
								<h5>Product Name </h5>
								<p>
								Nowadays the lingerie industry is one of the most successful business spheres.
								We always stay in touch with the latest fashion tendencies - 
								that is why our goods are so popular..
								</p>
							</div>
							<div class="span4 alignR">
							<form class="form-horizontal qtyFrm">
							<h3> $140.00</h3>
							<label class="checkbox">
								<input type="checkbox">  Adds product to compair
							</label><br>
							<div class="btn-group">
							  <a href="product_details.html" class="defaultBtn"><span class=" icon-shopping-cart"></span> Add to cart</a>
							  <a href="product_details.html" class="shopBtn">VIEW</a>
							 </div>
								</form>
							</div>
					</div>
					<hr class="soften"/>
					
						</div>
		            </div>
		
		</div>
		</div>
		</div> <!-- Body wrapper -->
		
		
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
			<p class="pull-right">
				<a href="#"><img src="assets/img/maestro.png" alt="payment"></a>
				<a href="#"><img src="assets/img/mc.png" alt="payment"></a>
				<a href="#"><img src="assets/img/pp.png" alt="payment"></a>
				<a href="#"><img src="assets/img/visa.png" alt="payment"></a>
				<a href="#"><img src="assets/img/disc.png" alt="payment"></a>
			</p>
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