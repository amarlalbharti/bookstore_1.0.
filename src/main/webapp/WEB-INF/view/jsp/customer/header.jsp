<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!doctype html>
<html>
  <head>
  <meta charset="utf-8">
  <meta class="viewport" name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">

  <!-- Favicon -->
  <!-- Font -->
  <link rel='stylesheet' href='http://fonts.googleapis.com/css?family=Arimo:400,700,400italic,700italic'>

  <!-- Plagins CSS -->
  <link rel="stylesheet" href="${pageContext.request.contextPath}/theme/css/bootstrap.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/theme/css/font-awesome.min.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/theme/css/jslider.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/theme/css/settings.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/theme/css/jquery.fancybox.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/theme/css/animate.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/theme/css/video-js.min.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/theme/css/morris.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/theme/css/royalslider.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/theme/css/layerslider.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/theme/css/ladda.min.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/theme/css/datepicker.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/theme/css/jquery.scrollbar.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/theme/css/select2.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/theme/css/select2-bootstrap.css">
  
  <!-- Theme CSS -->
  <link rel="stylesheet" href="${pageContext.request.contextPath}/theme/css/style.css">
  
  <!-- Custom CSS -->
  <link rel="stylesheet" href="${pageContext.request.contextPath}/theme/css/pages.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/theme/css/shop-8-pages-customizer.css">

  <!-- IE Styles-->
  <link rel='stylesheet' href="${pageContext.request.contextPath}/theme/css/ie.css">
  
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/alertify.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/alertify.default.css"/> 
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/alertify.default.css"/> 

 <!-- jQuery 2.2.0 -->
<script src="${pageContext.request.contextPath}/js/jQuery-2.2.0.min.js"></script>
<script src="${pageContext.request.contextPath}/js/alertify.js"></script>

<script src="${pageContext.request.contextPath}/js/bookstore.js"></script>
  
  <script>
		function getLogOut(){
			if (XMLHttpRequest)
			{
				x=new XMLHttpRequest();
			}
			else
			{
				x=new ActiveXObject("Microsoft.XMLHTTP");
			}
		     x.onreadystatechange=function()
			{
		    	 if(x.readyState==4 && x.status==200)
					{
		    		 var res = x.responseText;
		    		 window.location.href="${pageContext.request.contextPath}/j_spring_security_logout";
		    		}
			}
			x.open("GET", "${pageContext.request.contextPath}/insertLogOut",true);
			x.send();
			return true;
		}
</script>
  <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
		<link rel='stylesheet' href="${pageContext.request.contextPath}/theme/css/ie/ie8.css">
  <![endif]-->
</head>
<body class="boxed fixed-header hidden-top cm-shop-7">
<div class="page-box">
<div class="page-box-content">

<div id="top-box">
  <div class="top-box-wrapper">
	<div class="container">
	  <div class="row">
		<div class="col-xs-9 col-sm-5">
		  
		</div>
		
		<div class="col-xs-3 col-sm-7">
		  <div class="navbar navbar-inverse top-navbar top-navbar-right" role="navigation">
			<button type="button" class="navbar-toggle btn-navbar collapsed" data-toggle="collapse" data-target=".top-navbar .navbar-collapse">
			  <span class="icon-bar"></span>
			  <span class="icon-bar"></span>
			  <span class="icon-bar"></span>
			</button>
  
			<nav class="collapse collapsing navbar-collapse">
			  <ul class="nav navbar-nav navbar-right top-header">
				<%
					if(request.getUserPrincipal() != null){
						%>
							<li><a href="${pageContext.request.contextPath}/customer/profile"> <spring:message code="label.page.header.myaccount" /></a></li>
							<li><a href="${pageContext.request.contextPath}/user/wishlist"><i class="fa fa-heart"></i> <spring:message code="label.page.header.mywishlist" /></a></li>
							<li><a href="${pageContext.request.contextPath}/customer/cart"><spring:message code="label.page.header.mycart" /> <span class="count">0</span></a></li>
							<li><a href="${pageContext.request.contextPath}/customer/checkout"><spring:message code="label.page.header.checkout" /></a></li>
							<li ><a href="javascript:void(0);" onclick="getLogOut();"><i class="fa fa-sign-out"></i> <spring:message code="label.page.header.logout" /></a></li>
						<%
					}else{
						%>
							<li><a href="${pageContext.request.contextPath}/login"><spring:message code="label.page.header.myaccount" /></a></li>
							<li><a href="${pageContext.request.contextPath}/login"><i class="fa fa-heart"></i> <spring:message code="label.page.header.mywishlist" /></a></li>
							<li><a href="${pageContext.request.contextPath}/login"><spring:message code="label.page.header.mycart" /> <span class="count">0</span></a></li>
							<li><a href="${pageContext.request.contextPath}/login"><spring:message code="label.page.header.checkout" /></a></li>
							<li><a href="${pageContext.request.contextPath}/login"><spring:message code="label.page.header.login" /> <i class="fa fa-lock after"></i></a></li>
						<%
					}
				%>
				
			  </ul>
			</nav>
		  </div>
		</div>
	  </div>
	</div>
  </div>
</div><!-- #top-box -->

<header class="header">
  <div class="header-wrapper">
	<div class="container">
	  <div class="row">
		<div class="col-xs-6 col-md-2 col-lg-3 logo-box">
		  <div class="logo">
			<a href="${pageContext.request.contextPath}/index">
			  <img src="${pageContext.request.contextPath}/images/logo.jpg" class="logo-img" alt="">
			  <input type="hidden" id="root_path" value="${pageContext.request.contextPath}">
			</a>
		  </div>
		</div><!-- .logo-box -->
		
		<div class="col-xs-6 col-md-10 col-lg-9 right-box">
		  <div class="right-box-wrapper">
			<div class="header-icons">
			  <div class="search-header hidden-600">
				<a href="#">
				  <svg x="0" y="0" width="16px" height="16px" viewBox="0 0 16 16" enable-background="new 0 0 16 16" xml:space="preserve">
					<path d="M12.001,10l-0.5,0.5l-0.79-0.79c0.806-1.021,1.29-2.308,1.29-3.71c0-3.313-2.687-6-6-6C2.687,0,0,2.687,0,6
					s2.687,6,6,6c1.402,0,2.688-0.484,3.71-1.29l0.79,0.79l-0.5,0.5l4,4l2-2L12.001,10z M6,10c-2.206,0-4-1.794-4-4s1.794-4,4-4
					s4,1.794,4,4S8.206,10,6,10z"></path>
					<image src="img/png-icons/search-icon.png" alt="" width="16" height="16" style="vertical-align: top;">
				  </svg>
				</a>
			  </div><!-- .search-header
			  
			  --><div class="phone-header hidden-600">
				<a href="#">
				  <svg x="0" y="0" width="16px" height="16px" viewBox="0 0 16 16" enable-background="new 0 0 16 16" xml:space="preserve">
					<path d="M11.001,0H5C3.896,0,3,0.896,3,2c0,0.273,0,11.727,0,12c0,1.104,0.896,2,2,2h6c1.104,0,2-0.896,2-2
					c0-0.273,0-11.727,0-12C13.001,0.896,12.105,0,11.001,0z M8,15c-0.552,0-1-0.447-1-1s0.448-1,1-1s1,0.447,1,1S8.553,15,8,15z
					M11.001,12H5V2h6V12z"></path>
					<image src="img/png-icons/phone-icon.png" alt="" width="16" height="16" style="vertical-align: top;">
				  </svg>
				</a>
			  </div>
			  <div class="btn-group cart-header " id="customer_cart_header">
				<a href="#" class="dropdown-toggle" data-toggle="dropdown">
				  <div class="icon">
					<svg x="0" y="0" width="16px" height="16px" viewBox="0 0 16 16" enable-background="new 0 0 16 16" xml:space="preserve">
					  <g>
						<path d="M15.001,4h-0.57l-3.707-3.707c-0.391-0.391-1.023-0.391-1.414,0c-0.391,0.391-0.391,1.023,0,1.414L11.603,4
						H4.43l2.293-2.293c0.391-0.391,0.391-1.023,0-1.414s-1.023-0.391-1.414,0L1.602,4H1C0.448,4,0,4.448,0,5s0.448,1,1,1
						c0,2.69,0,7.23,0,8c0,1.104,0.896,2,2,2h10c1.104,0,2-0.896,2-2c0-0.77,0-5.31,0-8c0.553,0,1-0.448,1-1S15.554,4,15.001,4z
						M13.001,14H3V6h10V14z"></path>
						<path d="M11.001,13c0.553,0,1-0.447,1-1V8c0-0.553-0.447-1-1-1s-1,0.447-1,1v4C10.001,12.553,10.448,13,11.001,13z"></path>
						<path d="M8,13c0.553,0,1-0.447,1-1V8c0-0.553-0.448-1-1-1S7,7.447,7,8v4C7,12.553,7.448,13,8,13z"></path>
						<path d="M5,13c0.553,0,1-0.447,1-1V8c0-0.553-0.447-1-1-1S4,7.447,4,8v4C4,12.553,4.448,13,5,13z"></path>
					 </g>
					</svg>
				  </div>
				  Cart <i class="fa fa-inr" aria-hidden="true"></i> 0</span>
				</a>
				<div class="dropdown-menu" >
				  <strong>No Items Available in cart.</strong>
				</div>
			  </div><!-- .cart-header -->
			</div><!-- .header-icons -->
			
			<div class="primary">
			  <div class="navbar navbar-default" role="navigation">
				<button type="button" class="navbar-toggle btn-navbar collapsed" data-toggle="collapse" data-target=".primary .navbar-collapse">
				  <span class="text"><spring:message code="label.page.header.menu" /></span>
				  <span class="icon-bar"></span>
				  <span class="icon-bar"></span>
				  <span class="icon-bar"></span>
				</button>
	  
				<nav class="collapse collapsing navbar-collapse">
				  <ul class="nav navbar-nav navbar-center">
					<li class="parent">
					  <a href="index.html"><spring:message code="label.page.header.home" /></a>
					  <ul class="sub">
						<li><a href="index.html">Creative</a></li>
						<li><a href="home-2.html">Paralax</a></li>
						
					  </ul>
					</li>
					<li class="parent">
					  <a href="shop.html">Shop</a>
					  <ul class="sub">
						<li><a href="shop-cart.html">Shopping Cart</a></li>
						<li><a href="shop-checkout.html">Proceed to Checkout</a></li>
						<li><a href="shop-confirmation.html">Confirmation Page</a></li>
						<li><a href="shop-compare.html">Compare Products</a></li>
						<li><a href="shop-login.html">Login / Register</a></li>
						<li><a href="shop-forgot.html">Password Recovery</a></li>
					  </ul>
					</li>
					<li class="item-danger item-bg text-danger">
					  <a href="#" target="_blank">Buy Now!</a>
					</li>
				  </ul>
				</nav>
			  </div>
			</div><!-- .primary -->
		  </div>
		</div>
		
		<div class="phone-active col-sm-9 col-md-9">
		  <a href="#" class="close"><span><spring:message code="label.page.header.close" /></span>×</a>
		  <span class="title"><span><spring:message code="label.page.header.classus" /></span> <strong>+1 (777) 123 45 67</strong>
		</div>
		<div class="search-active col-sm-9 col-md-9">
		  <a href="#" class="close"><span><span><spring:message code="label.page.header.close" /></span>×</a>
		  <form name="search-form" class="search-form">
			<input class="search-string form-control" type="search" placeholder="Search here" name="search-string">
			<button class="search-submit">
			  <svg x="0" y="0" width="16px" height="16px" viewBox="0 0 16 16" enable-background="new 0 0 16 16" xml:space="preserve">
				<path fill="#231F20" d="M12.001,10l-0.5,0.5l-0.79-0.79c0.806-1.021,1.29-2.308,1.29-3.71c0-3.313-2.687-6-6-6C2.687,0,0,2.687,0,6
				s2.687,6,6,6c1.402,0,2.688-0.484,3.71-1.29l0.79,0.79l-0.5,0.5l4,4l2-2L12.001,10z M6,10c-2.206,0-4-1.794-4-4s1.794-4,4-4
				s4,1.794,4,4S8.206,10,6,10z"></path>
				<image src="img/png-icons/search-icon.png" alt="" width="16" height="16" style="vertical-align: top;">
			  </svg>
			</button>
		  </form>
		</div>
	  </div><!--.row -->
	</div>
  </div><!-- .header-wrapper -->
</header><!-- .header -->
<script type="text/javascript">
$(document).ready(function(){
	<%
		if(request.getUserPrincipal() != null){
			%>
			$.getCustomerCartHeader();
			<%	
		}
	%>
}); 
</script>