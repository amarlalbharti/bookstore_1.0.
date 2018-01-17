<%@page import="com.bookstore.domain.Product"%>
<%@page import="com.bookstore.domain.Category"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
  <head>
  <meta charset="utf-8">
  <meta class="viewport" name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
</head>
<body>
	<%
	  	Product product = (Product)request.getAttribute("product");
	  	if(product != null){
	  		String productImage = product.getProductUrl() != null ? product.getProductUrl() : "";
	  		%>
	  			<div id="main" class="page">
				  <header class="page-header">
				    <div class="container">
				      <h1 class="title"><%= product.getProductName()%></h1>
				    </div>	
				  </header>
				  
				  <div class="container">
				    <div class="row">
				      <article class="content product-page col-sm-12 col-md-12">
						<div class="row">
						  <div class="col-sm-5 col-md-5">
							<div class="image-box">
							  <span class="sale top"></span>
							  <div class="general-img">
								<img class="replace-2x" alt="" src="<%= productImage%>" data-zoom-image="<%= productImage%>" width="700" height="700">
							  </div><!-- .general-img -->
							  
							  <div class="thumblist-box load">
								<a href="#" class="prev">
								  <svg x="0" y="0" width="9px" height="16px" viewBox="0 0 9 16" enable-background="new 0 0 9 16" xml:space="preserve">
									<polygon fill-rule="evenodd" clip-rule="evenodd" fill="#fcfcfc" points="8,15.999 9,14.999 2,8 9,1.001 8,0.001 0,8 "></polygon>
								  </svg>
								</a>
								<a href="#" class="next">
								  <svg x="0" y="0" width="9px" height="16px" viewBox="0 0 9 16" enable-background="new 0 0 9 16" xml:space="preserve">
									<polygon fill-rule="evenodd" clip-rule="evenodd" fill="#fcfcfc" points="1,0.001 0,1.001 7,8 0,14.999 1,15.999 9,8 "></polygon>
								  </svg>
								</a>
								
								<div id="thumblist" class="thumblist">
								  <a href="#" data-image="<%= productImage%>" data-zoom-image="<%= productImage%>">
									<img class="replace-2x" alt="" src="<%= productImage%>" width="700" height="700">
								  </a>
								  <a class="active" href="#" data-image="<%= productImage%>" data-zoom-image="<%= productImage%>">
									<img class="replace-2x" alt="" src="content/img/single-2.jpg">
								  </a>
								  <a href="#" data-image="<%= productImage%>" data-zoom-image="<%= productImage%>">
									<img class="replace-2x" alt="" src="content/img/single-3.jpg" width="700" height="700">
								  </a>
								  <a href="#" data-image="<%= productImage%>" data-zoom-image="<%= productImage%>">
									<img class="replace-2x" alt="" src="<%= productImage%>" width="700" height="700">
								  </a>
								  <a href="#" data-image="<%= productImage%>" data-zoom-image="<%= productImage%>">
									<img class="replace-2x" alt="" src="<%= productImage%>" width="700" height="700">
								  </a>
								  <a href="#" data-image="<%= productImage%>" data-zoom-image="<%= productImage%>">
									<img class="replace-2x" alt="" src="<%= productImage%>" width="700" height="700">
								  </a>
								</div><!-- #thumblist -->
							  </div><!-- .thumblist -->
							</div>
						  </div>
						  
						  <div class="col-sm-7 col-md-7">
							<div class="reviews-box">
							  <div class="rating-box">
								<div style="width: 80%" class="rating">
								  <svg x="0" y="0" width="73px" height="12px" viewBox="0 0 73 12" enable-background="new 0 0 73 12" xml:space="preserve">
									  <polygon fill-rule="evenodd" clip-rule="evenodd" fill="#1e1e1e" points="6.5,0 8,5 13,5 9,7.7 10,12 6.5,9.2 3,12 4,7.7 0,5 5,5"></polygon>
									  <polygon fill-rule="evenodd" clip-rule="evenodd" fill="#1e1e1e" points="66.5,0 68,5 73,5 69,7.7 70,12 66.5,9.2 63,12 64,7.7 60,5 65,5 "></polygon>
									  <polygon fill-rule="evenodd" clip-rule="evenodd" fill="#1e1e1e" points="21.5,0 23,5 28,5 24,7.7 25,12 21.5,9.2 18,12 19,7.7 15,5 20,5 "></polygon>
									  <polygon fill-rule="evenodd" clip-rule="evenodd" fill="#1e1e1e" points="51.5,0 53,5 58,5 54,7.7 55,12 51.5,9.2 48,12 49,7.7 45,5 50,5 "></polygon>
									  <polygon fill-rule="evenodd" clip-rule="evenodd" fill="#1e1e1e" points="36.5,0 38,5 43,5 39,7.7 40,12 36.5,9.2 33,12 34,7.7 30,5 35,5 "></polygon>
								  </svg>
								</div>
							  </div>
							  <span>5 review(s)</span>
							  <span class="separator">|</span>
							  <a href="#reviews" class="add-review">Add your review</a>
							</div>
							
							<div class="description">
							  <%= product.getShortDesc()%>
							</div>
							
							<div class="price-box">
							  <span class="price-old"><%= product.getProductMRP()%></span> 
							  <span class="price"><%= product.getProductPrice()%></span>
							</div>
							
							<form class="form-inline add-cart-form">
							  <button class="btn add-cart btn-default btn-lg">Add to Cart</button>
							  <div class="number">
								<label>Quantity:</label>
								<input type="text" value="1" class="form-control">
								<div class="regulator">
								  <a href="#" class="number-up"><i class="fa fa-angle-up"></i></a>
								  <a href="#" class="number-down"><i class="fa fa-angle-down"></i></a>
								</div>
							  </div>
							</form>
							
							<div class="actions">
							  <a href="#" class="add-wishlist">
								<svg x="0" y="0" width="16px" height="16px" viewBox="0 0 16 16" enable-background="new 0 0 16 16" xml:space="preserve">
								<path fill="#1e1e1e" d="M11.335,0C10.026,0,8.848,0.541,8,1.407C7.153,0.541,5.975,0,4.667,0C2.088,0,0,2.09,0,4.667C0,12,8,16,8,16
								  s8-4,8-11.333C16.001,2.09,13.913,0,11.335,0z M8,13.684C6.134,12.49,2,9.321,2,4.667C2,3.196,3.197,2,4.667,2C6,2,8,4,8,4
								  s2-2,3.334-2c1.47,0,2.666,1.196,2.666,2.667C14.001,9.321,9.867,12.49,8,13.684z"></path>
								</svg>
							  </a>
							  <a href="#" class="add-compare">
								<svg x="0" y="0" width="16px" height="16px" viewBox="0 0 16 16" enable-background="new 0 0 16 16" xml:space="preserve">
								  <path fill="#1e1e1e" d="M16,3.063L13,0v2H1C0.447,2,0,2.447,0,3s0.447,1,1,1h12v2L16,3.063z"></path>
								  <path fill="#1e1e1e" d="M16,13.063L13,10v2H1c-0.553,0-1,0.447-1,1s0.447,1,1,1h12v2L16,13.063z"></path>
								  <path fill="#1e1e1e" d="M15,7H3V5L0,7.938L3,11V9h12c0.553,0,1-0.447,1-1S15.553,7,15,7z"></path>
								</svg>
							  </a>
							</div><!-- .actions -->
						  </div>
						</div>
						
						<div class="product-tab">
						  <ul class="nav nav-tabs">
							<li class="active"><a href="#description">Description</a></li>
							<li><a href="#reviews">Reviews</a></li>
							<li><a href="#custom-tab">Custom Tab</a></li>
						  </ul><!-- .nav-tabs -->	
						  <div class="tab-content">
							<div class="tab-pane active" id="description">
							  <p>Suspendisse at placerat turpis. Duis luctus erat vel magna pharetra aliquet. Maecenas tincidunt feugiat ultricies. Phasellus et dui risus. Vestibulum adipiscing, eros quis lobortis dictum. Etiam mollis volutpat odio, id euismod justo gravida a. Aliquam erat volutpat. Phasellus faucibus venenatis lorem, vitae commodo elit pretium et. Duis rhoncus lobortis congue. Vestibulum et purus dui, vel porta lectus. Sed vulputate pulvinar adipiscing.</p>
							  <ul>
								<li>She was walking to the mall.</li>
								<li>Ted might eat the cake.</li>
								<li>You must go right now.</li>
								<li>Words were spoken.</li>
								<li>The teacher is writing a report.</li>
							  </ul>
							  <p>Here are some verb phrase examples where the verb phrase is the predicate of a sentence. In this case, the verb phrase consists of the main verb plus any auxiliary, or helping, verbs. Nulla nec velit. Mauris pulvinar erat non massa. Suspendisse tortor turpis, porta nec, tempus vitae, iaculis semper, pede.</p>
							  <ol>
								<li>Shipping &amp; Delivery.</li>
								<li>Privacy &amp; Security.</li>
								<li>Returns &amp; Replacements.</li>
								<li>Payment, Pricing &amp; Promotions.</li>
								<li>Viewing Orders.</li>
							  </ol>
							  <div>Next are some verb phrase examples of verb phrases where the phrase has a single function which means it can act like an adverb or an adjective. The phrase would include the verb and any modifiers, complements, or objects. Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Morbi luctus. Duis lobortis.  Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur nec posuere odio. Proin vel ultrices erat.</div>
							</div>
							<div class="tab-pane" id="reviews">
							  <h3 class="title">Reviews</h3>
							  <ul class="commentlist">
								<li>
								  <div class="meta">
									<span>Mike Example</span>, 
									<span class="time">03.11.2013, 10:45:</span>
								  </div>
								  <div class="evaluation-box">
									<div class="evaluation">
									  <span>Quality</span>
									  <div class="rating-box">
										<div style="width: 60%" class="rating">
										  <svg x="0" y="0" width="73px" height="12px" viewBox="0 0 73 12" enable-background="new 0 0 73 12" xml:space="preserve">
											  <polygon fill-rule="evenodd" clip-rule="evenodd" fill="#1e1e1e" points="6.5,0 8,5 13,5 9,7.7 10,12 6.5,9.2 3,12 4,7.7 0,5 5,5"></polygon>
											  <polygon fill-rule="evenodd" clip-rule="evenodd" fill="#1e1e1e" points="66.5,0 68,5 73,5 69,7.7 70,12 66.5,9.2 63,12 64,7.7 60,5 65,5 "></polygon>
											  <polygon fill-rule="evenodd" clip-rule="evenodd" fill="#1e1e1e" points="21.5,0 23,5 28,5 24,7.7 25,12 21.5,9.2 18,12 19,7.7 15,5 20,5 "></polygon>
											  <polygon fill-rule="evenodd" clip-rule="evenodd" fill="#1e1e1e" points="51.5,0 53,5 58,5 54,7.7 55,12 51.5,9.2 48,12 49,7.7 45,5 50,5 "></polygon>
											  <polygon fill-rule="evenodd" clip-rule="evenodd" fill="#1e1e1e" points="36.5,0 38,5 43,5 39,7.7 40,12 36.5,9.2 33,12 34,7.7 30,5 35,5 "></polygon>
										  </svg>
										</div>
									  </div>
									</div>
									<div class="evaluation">
									  <span>Price</span>
									  <div class="rating-box">
										<div style="width: 80%" class="rating">
										  <svg x="0" y="0" width="73px" height="12px" viewBox="0 0 73 12" enable-background="new 0 0 73 12" xml:space="preserve">
											  <polygon fill-rule="evenodd" clip-rule="evenodd" fill="#1e1e1e" points="6.5,0 8,5 13,5 9,7.7 10,12 6.5,9.2 3,12 4,7.7 0,5 5,5"></polygon>
											  <polygon fill-rule="evenodd" clip-rule="evenodd" fill="#1e1e1e" points="66.5,0 68,5 73,5 69,7.7 70,12 66.5,9.2 63,12 64,7.7 60,5 65,5 "></polygon>
											  <polygon fill-rule="evenodd" clip-rule="evenodd" fill="#1e1e1e" points="21.5,0 23,5 28,5 24,7.7 25,12 21.5,9.2 18,12 19,7.7 15,5 20,5 "></polygon>
											  <polygon fill-rule="evenodd" clip-rule="evenodd" fill="#1e1e1e" points="51.5,0 53,5 58,5 54,7.7 55,12 51.5,9.2 48,12 49,7.7 45,5 50,5 "></polygon>
											  <polygon fill-rule="evenodd" clip-rule="evenodd" fill="#1e1e1e" points="36.5,0 38,5 43,5 39,7.7 40,12 36.5,9.2 33,12 34,7.7 30,5 35,5 "></polygon>
										  </svg>
										</div>
									  </div>
									</div>
								  </div>
								  <p>
									Suspendisse at placerat turpis. Duis luctus erat vel magna pharetra aliquet. Maecenas tincidunt feugiat ultricies. Phasellus et dui risus. Vestibulum adipiscing, eros quis lobortis dictum.  It enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.
								  </p>
								</li>
								<li>
								  <div class="meta">
									<span>Mike Example</span>, 
									<span class="time">03.11.2013, 10:45:</span>
								  </div>
								  <div class="evaluation-box">
									<div class="evaluation">
									  <span>Quality</span>
									  <div class="rating-box">
										<div style="width: 100%" class="rating">
										  <svg x="0" y="0" width="73px" height="12px" viewBox="0 0 73 12" enable-background="new 0 0 73 12" xml:space="preserve">
											  <polygon fill-rule="evenodd" clip-rule="evenodd" fill="#1e1e1e" points="6.5,0 8,5 13,5 9,7.7 10,12 6.5,9.2 3,12 4,7.7 0,5 5,5"></polygon>
											  <polygon fill-rule="evenodd" clip-rule="evenodd" fill="#1e1e1e" points="66.5,0 68,5 73,5 69,7.7 70,12 66.5,9.2 63,12 64,7.7 60,5 65,5 "></polygon>
											  <polygon fill-rule="evenodd" clip-rule="evenodd" fill="#1e1e1e" points="21.5,0 23,5 28,5 24,7.7 25,12 21.5,9.2 18,12 19,7.7 15,5 20,5 "></polygon>
											  <polygon fill-rule="evenodd" clip-rule="evenodd" fill="#1e1e1e" points="51.5,0 53,5 58,5 54,7.7 55,12 51.5,9.2 48,12 49,7.7 45,5 50,5 "></polygon>
											  <polygon fill-rule="evenodd" clip-rule="evenodd" fill="#1e1e1e" points="36.5,0 38,5 43,5 39,7.7 40,12 36.5,9.2 33,12 34,7.7 30,5 35,5 "></polygon>
										  </svg>
										</div>
									  </div>
									</div>
									<div class="evaluation">
									  <span>Price</span>
									  <div class="rating-box">
										<div style="width: 80%" class="rating">
										  <svg x="0" y="0" width="73px" height="12px" viewBox="0 0 73 12" enable-background="new 0 0 73 12" xml:space="preserve">
											  <polygon fill-rule="evenodd" clip-rule="evenodd" fill="#1e1e1e" points="6.5,0 8,5 13,5 9,7.7 10,12 6.5,9.2 3,12 4,7.7 0,5 5,5"></polygon>
											  <polygon fill-rule="evenodd" clip-rule="evenodd" fill="#1e1e1e" points="66.5,0 68,5 73,5 69,7.7 70,12 66.5,9.2 63,12 64,7.7 60,5 65,5 "></polygon>
											  <polygon fill-rule="evenodd" clip-rule="evenodd" fill="#1e1e1e" points="21.5,0 23,5 28,5 24,7.7 25,12 21.5,9.2 18,12 19,7.7 15,5 20,5 "></polygon>
											  <polygon fill-rule="evenodd" clip-rule="evenodd" fill="#1e1e1e" points="51.5,0 53,5 58,5 54,7.7 55,12 51.5,9.2 48,12 49,7.7 45,5 50,5 "></polygon>
											  <polygon fill-rule="evenodd" clip-rule="evenodd" fill="#1e1e1e" points="36.5,0 38,5 43,5 39,7.7 40,12 36.5,9.2 33,12 34,7.7 30,5 35,5 "></polygon>
										  </svg>
										</div>
									  </div>
									</div>
								  </div>
								  <p>
									Etiam mollis volutpat odio, id euismod justo gravida a. Aliquam erat volutpat. Phasellus faucibus venenatis lorem, vitae commodo elit pretium et. Duis rhoncus lobortis congue. Vestibulum et purus dui, vel porta lectus. Sed vulputate pulvinar adipiscing. It enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. 
								  </p>
								</li>
							  </ul><!-- .commentlist -->
							  
							  <h3 class="title">Write Your Own Review</h3>
							  <form class="comments-form">
								<div class="evaluation-box">
								  <div class="evaluation">
									<div class="pull-left">Quality <span class="required">*</span></div>
									<div class="add-rating">
									  <label class="radio"><input type="radio" name="radio"><span class="number">1</span></label>
									  <label class="radio"><input type="radio" name="radio"><span class="number">2</span></label>
									  <label class="radio"><input type="radio" name="radio"><span class="number">3</span></label>
									  <label class="radio"><input type="radio" name="radio"><span class="number">4</span></label>
									  <label class="radio"><input type="radio" name="radio"><span class="number">5</span></label>
									</div>
								  </div>
								  <div class="evaluation">
									<div class="pull-left">Price <span class="required">*</span></div>
									<div class="add-rating">
									  <label class="radio"><input type="radio" name="radio2"><span class="number">1</span></label>
									  <label class="radio"><input type="radio" name="radio2"><span class="number">2</span></label>
									  <label class="radio"><input type="radio" name="radio2"><span class="number">3</span></label>
									  <label class="radio"><input type="radio" name="radio2"><span class="number">4</span></label>
									  <label class="radio"><input type="radio" name="radio2"><span class="number">5</span></label>
									</div>
								  </div>
								</div>
								<div class="row">
								  <div class="col-sm-5 col-md-5">
									<label>Nickname: <span class="required">*</span></label>
									<input class="form-control" type="text">
									<label>Summary of Your Review: <span class="required">*</span></label>
									<input class="form-control" type="text">
								  </div>
								  <div class="col-sm-7 col-md-7">
									<label>Review: <span class="required">*</span></label>
									<textarea class="form-control"></textarea>
									<i>Note: HTML is not translated!</i>
								  </div>
								  <div class="col-sm-12 col-md-12">
									<button class="btn btn-default">Submit</button>
								  </div>
								</div>
							  </form><!-- .comments-form -->
							</div><!-- #reviews -->
							<div class="tab-pane" id="custom-tab">
							  <h3>Custom Tab</h3>
							</div>
						  </div><!-- .tab-content -->
						</div>
						  
						<div class="clearfix"></div>
						  
						<div class="recommended-product carousel-box load overflow" data-autoplay-disable="true">
						  <div class="title-box no-margin">
							<a class="next" href="#">
							  <svg x="0" y="0" width="9px" height="16px" viewBox="0 0 9 16" enable-background="new 0 0 9 16" xml:space="preserve">
								<polygon fill-rule="evenodd" clip-rule="evenodd" fill="#fcfcfc" points="1,0.001 0,1.001 7,8 0,14.999 1,15.999 9,8 "></polygon>
							  </svg>
							</a>
							<a class="prev" href="#">
							  <svg x="0" y="0" width="9px" height="16px" viewBox="0 0 9 16" enable-background="new 0 0 9 16" xml:space="preserve">
								<polygon fill-rule="evenodd" clip-rule="evenodd" fill="#fcfcfc" points="8,15.999 9,14.999 2,8 9,1.001 8,0.001 0,8 "></polygon>
							  </svg>
							</a>
							<h2 class="title">Related Product</h2>
						  </div>
						  
						  <div class="clearfix"></div>
						  
						  <div class="row">
							<div class="carousel products">
							  <div class="col-sm-3 col-md-3 product rotation">
								<div class="default">
								  <a href="shop-product-view.html" class="product-image">
									<img class="replace-2x" src="content/img/product-1.jpg" alt="" title="" width="270" height="270">
								  </a>
								  <div class="product-description">
									<div class="vertical">
									  <h3 class="product-name">
									<a href="shop-product-view.html">Sony Led TV KDL-46HX853</a>
									  </h3>
									  <div class="price">$1, 449.00</div>	
									</div>
								  </div>
								</div>
								
								<div class="product-hover">
								  <h3 class="product-name">
									<a href="shop-product-view.html">Sony Led TV KDL-46HX853</a>
								  </h3>
								  <div class="price">$1, 449.00</div>
								  <a href="shop-product-view.html" class="product-image">
									<img class="replace-2x" src="content/img/product-1.jpg" alt="" title="" width="70" height="70">
								  </a>
								  <ul>
									<li>117 cm / 46"LCD TV</li>
									<li>Full HD 3D &amp; 2D</li>
									<li>Sony Internet TV</li>
									<li>Dynamic Edge LED</li>
									<li>1X-Reality PRO</li>
								  </ul>
								  <div class="actions">
									<a href="shop-product-view.html" class="add-cart">
									  <svg x="0" y="0" width="16px" height="16px" viewBox="0 0 16 16" enable-background="new 0 0 16 16" xml:space="preserve">
										<g>
										  <path fill="#1e1e1e" d="M15.001,4h-0.57l-3.707-3.707c-0.391-0.391-1.023-0.391-1.414,0c-0.391,0.391-0.391,1.023,0,1.414L11.603,4
											H4.43l2.293-2.293c0.391-0.391,0.391-1.023,0-1.414s-1.023-0.391-1.414,0L1.602,4H1C0.448,4,0,4.448,0,5s0.448,1,1,1
											c0,2.69,0,7.23,0,8c0,1.104,0.896,2,2,2h10c1.104,0,2-0.896,2-2c0-0.77,0-5.31,0-8c0.553,0,1-0.448,1-1S15.554,4,15.001,4z
											M13.001,14H3V6h10V14z"></path>
										  <path fill="#1e1e1e" d="M11.001,13c0.553,0,1-0.447,1-1V8c0-0.553-0.447-1-1-1s-1,0.447-1,1v4C10.001,12.553,10.448,13,11.001,13z"></path>
										  <path fill="#1e1e1e" d="M8,13c0.553,0,1-0.447,1-1V8c0-0.553-0.448-1-1-1S7,7.447,7,8v4C7,12.553,7.448,13,8,13z"></path>
										  <path fill="#1e1e1e" d="M5,13c0.553,0,1-0.447,1-1V8c0-0.553-0.447-1-1-1S4,7.447,4,8v4C4,12.553,4.448,13,5,13z"></path>
										</g>
									  </svg>
									</a>
									<a href="#" class="add-wishlist">
									  <svg x="0" y="0" width="16px" height="16px" viewBox="0 0 16 16" enable-background="new 0 0 16 16" xml:space="preserve">
									  <path fill="#1e1e1e" d="M11.335,0C10.026,0,8.848,0.541,8,1.407C7.153,0.541,5.975,0,4.667,0C2.088,0,0,2.09,0,4.667C0,12,8,16,8,16
										s8-4,8-11.333C16.001,2.09,13.913,0,11.335,0z M8,13.684C6.134,12.49,2,9.321,2,4.667C2,3.196,3.197,2,4.667,2C6,2,8,4,8,4
										s2-2,3.334-2c1.47,0,2.666,1.196,2.666,2.667C14.001,9.321,9.867,12.49,8,13.684z"></path>
									  </svg>
									</a>
									<a href="#" class="add-compare">
									  <svg x="0" y="0" width="16px" height="16px" viewBox="0 0 16 16" enable-background="new 0 0 16 16" xml:space="preserve">
										<path fill="#1e1e1e" d="M16,3.063L13,0v2H1C0.447,2,0,2.447,0,3s0.447,1,1,1h12v2L16,3.063z"></path>
										<path fill="#1e1e1e" d="M16,13.063L13,10v2H1c-0.553,0-1,0.447-1,1s0.447,1,1,1h12v2L16,13.063z"></path>
										<path fill="#1e1e1e" d="M15,7H3V5L0,7.938L3,11V9h12c0.553,0,1-0.447,1-1S15.553,7,15,7z"></path>
									  </svg>
									</a>
								  </div><!-- .actions -->
								</div><!-- .product-hover -->
							  </div><!-- .product -->
							  
							  <div class="col-sm-3 col-md-3 product rotation">
								<div class="default">
								  <a href="shop-product-view.html" class="product-image">
									<img class="replace-2x" src="content/img/product-2.jpg" alt="" title="" width="270" height="270">
								  </a>
								  <div class="product-description">
									<div class="vertical">
									  <h3 class="product-name">
									<a href="shop-product-view.html">Sony 3D TV KD3-46H853</a>
									  </h3>
									  <div class="price">$1, 449.00</div>	
									</div>
								  </div>
								</div>
								<div class="product-hover">
								  <h3 class="product-name">
									<a href="shop-product-view.html">Sony 3D TV KD3-46H853</a>
								  </h3>
								  <div class="price">$1, 449.00</div>
								  <a href="shop-product-view.html" class="product-image">
									<img class="replace-2x" src="content/img/product-2.jpg" alt="" title="" width="70" height="70">
								  </a>
								  <ul>
									<li>117 cm / 46"LCD TV</li>
									<li>Full HD 3D &amp; 2D</li>
									<li>Sony Internet TV</li>
									<li>Dynamic Edge LED</li>
									<li>1X-Reality PRO</li>
								  </ul>
								  <div class="actions">
									<a href="shop-product-view.html" class="add-cart">
									  <svg x="0" y="0" width="16px" height="16px" viewBox="0 0 16 16" enable-background="new 0 0 16 16" xml:space="preserve">
										<g>
										  <path fill="#1e1e1e" d="M15.001,4h-0.57l-3.707-3.707c-0.391-0.391-1.023-0.391-1.414,0c-0.391,0.391-0.391,1.023,0,1.414L11.603,4
											H4.43l2.293-2.293c0.391-0.391,0.391-1.023,0-1.414s-1.023-0.391-1.414,0L1.602,4H1C0.448,4,0,4.448,0,5s0.448,1,1,1
											c0,2.69,0,7.23,0,8c0,1.104,0.896,2,2,2h10c1.104,0,2-0.896,2-2c0-0.77,0-5.31,0-8c0.553,0,1-0.448,1-1S15.554,4,15.001,4z
											M13.001,14H3V6h10V14z"></path>
										  <path fill="#1e1e1e" d="M11.001,13c0.553,0,1-0.447,1-1V8c0-0.553-0.447-1-1-1s-1,0.447-1,1v4C10.001,12.553,10.448,13,11.001,13z"></path>
										  <path fill="#1e1e1e" d="M8,13c0.553,0,1-0.447,1-1V8c0-0.553-0.448-1-1-1S7,7.447,7,8v4C7,12.553,7.448,13,8,13z"></path>
										  <path fill="#1e1e1e" d="M5,13c0.553,0,1-0.447,1-1V8c0-0.553-0.447-1-1-1S4,7.447,4,8v4C4,12.553,4.448,13,5,13z"></path>
										</g>
									  </svg>
									</a>
									<a href="#" class="add-wishlist">
									  <svg x="0" y="0" width="16px" height="16px" viewBox="0 0 16 16" enable-background="new 0 0 16 16" xml:space="preserve">
									  <path fill="#1e1e1e" d="M11.335,0C10.026,0,8.848,0.541,8,1.407C7.153,0.541,5.975,0,4.667,0C2.088,0,0,2.09,0,4.667C0,12,8,16,8,16
										s8-4,8-11.333C16.001,2.09,13.913,0,11.335,0z M8,13.684C6.134,12.49,2,9.321,2,4.667C2,3.196,3.197,2,4.667,2C6,2,8,4,8,4
										s2-2,3.334-2c1.47,0,2.666,1.196,2.666,2.667C14.001,9.321,9.867,12.49,8,13.684z"></path>
									  </svg>
									</a>
									<a href="#" class="add-compare">
									  <svg x="0" y="0" width="16px" height="16px" viewBox="0 0 16 16" enable-background="new 0 0 16 16" xml:space="preserve">
										<path fill="#1e1e1e" d="M16,3.063L13,0v2H1C0.447,2,0,2.447,0,3s0.447,1,1,1h12v2L16,3.063z"></path>
										<path fill="#1e1e1e" d="M16,13.063L13,10v2H1c-0.553,0-1,0.447-1,1s0.447,1,1,1h12v2L16,13.063z"></path>
										<path fill="#1e1e1e" d="M15,7H3V5L0,7.938L3,11V9h12c0.553,0,1-0.447,1-1S15.553,7,15,7z"></path>
									  </svg>
									</a>
								  </div><!-- .actions -->
								</div><!-- .product-hover -->
							  </div><!-- .product -->
							  
							  <div class="col-sm-3 col-md-3 product rotation">
								<div class="default">
								  <a href="shop-product-view.html" class="product-image">
									<img class="replace-2x" src="content/img/product-3.jpg" alt="" title="" width="270" height="270">
								  </a>
								  <div class="product-description">
									<div class="vertical">
									  <h3 class="product-name">
									<a href="shop-product-view.html">Projector VPL-VW95ES</a>
									  </h3>
									  <div class="price">$1, 449.00</div>	
									</div>
								  </div>
								</div>
								
								<div class="product-hover">
								  <h3 class="product-name">
									<a href="shop-product-view.html">Projector VPL-VW95ES</a>
								  </h3>
								  <div class="price">$1, 449.00</div>
								  <a href="shop-product-view.html" class="product-image">
									<img class="replace-2x" src="content/img/product-3.jpg" alt="" title="" width="70" height="70">
								  </a>
								  <ul>
									<li>117 cm / 46"LCD TV</li>
									<li>Full HD 3D &amp; 2D</li>
									<li>Sony Internet TV</li>
									<li>Dynamic Edge LED</li>
									<li>1X-Reality PRO</li>
								  </ul>
								  <div class="actions">
									<a href="shop-product-view.html" class="add-cart">
									  <svg x="0" y="0" width="16px" height="16px" viewBox="0 0 16 16" enable-background="new 0 0 16 16" xml:space="preserve">
										<g>
										  <path fill="#1e1e1e" d="M15.001,4h-0.57l-3.707-3.707c-0.391-0.391-1.023-0.391-1.414,0c-0.391,0.391-0.391,1.023,0,1.414L11.603,4
											H4.43l2.293-2.293c0.391-0.391,0.391-1.023,0-1.414s-1.023-0.391-1.414,0L1.602,4H1C0.448,4,0,4.448,0,5s0.448,1,1,1
											c0,2.69,0,7.23,0,8c0,1.104,0.896,2,2,2h10c1.104,0,2-0.896,2-2c0-0.77,0-5.31,0-8c0.553,0,1-0.448,1-1S15.554,4,15.001,4z
											M13.001,14H3V6h10V14z"></path>
										  <path fill="#1e1e1e" d="M11.001,13c0.553,0,1-0.447,1-1V8c0-0.553-0.447-1-1-1s-1,0.447-1,1v4C10.001,12.553,10.448,13,11.001,13z"></path>
										  <path fill="#1e1e1e" d="M8,13c0.553,0,1-0.447,1-1V8c0-0.553-0.448-1-1-1S7,7.447,7,8v4C7,12.553,7.448,13,8,13z"></path>
										  <path fill="#1e1e1e" d="M5,13c0.553,0,1-0.447,1-1V8c0-0.553-0.447-1-1-1S4,7.447,4,8v4C4,12.553,4.448,13,5,13z"></path>
										</g>
									  </svg>
									</a>
									<a href="#" class="add-wishlist">
									  <svg x="0" y="0" width="16px" height="16px" viewBox="0 0 16 16" enable-background="new 0 0 16 16" xml:space="preserve">
									  <path fill="#1e1e1e" d="M11.335,0C10.026,0,8.848,0.541,8,1.407C7.153,0.541,5.975,0,4.667,0C2.088,0,0,2.09,0,4.667C0,12,8,16,8,16
										s8-4,8-11.333C16.001,2.09,13.913,0,11.335,0z M8,13.684C6.134,12.49,2,9.321,2,4.667C2,3.196,3.197,2,4.667,2C6,2,8,4,8,4
										s2-2,3.334-2c1.47,0,2.666,1.196,2.666,2.667C14.001,9.321,9.867,12.49,8,13.684z"></path>
									  </svg>
									</a>
									<a href="#" class="add-compare">
									  <svg x="0" y="0" width="16px" height="16px" viewBox="0 0 16 16" enable-background="new 0 0 16 16" xml:space="preserve">
										<path fill="#1e1e1e" d="M16,3.063L13,0v2H1C0.447,2,0,2.447,0,3s0.447,1,1,1h12v2L16,3.063z"></path>
										<path fill="#1e1e1e" d="M16,13.063L13,10v2H1c-0.553,0-1,0.447-1,1s0.447,1,1,1h12v2L16,13.063z"></path>
										<path fill="#1e1e1e" d="M15,7H3V5L0,7.938L3,11V9h12c0.553,0,1-0.447,1-1S15.553,7,15,7z"></path>
									  </svg>
									</a>
								  </div><!-- .actions -->
								</div><!-- .product-hover -->
							  </div><!-- .product -->
							  
							  <div class="col-sm-3 col-md-3 product rotation">
								<div class="default">
								  <a href="shop-product-view.html" class="product-image">
									<img class="replace-2x" src="content/img/product-4.jpg" alt="" title="" width="270" height="270">
								  </a>
								  <div class="product-description">
									<div class="vertical">
									  <h3 class="product-name">
									<a href="shop-product-view.html">XA700 Wireless speaker</a>
									  </h3>
									  <div class="price">$1, 449.00</div>	
									</div>
								  </div>
								</div>
								
								<div class="product-hover">
								  <h3 class="product-name">
									<a href="shop-product-view.html">XA700 Wireless speaker</a>
								  </h3>
								  <div class="price">$1, 449.00</div>
								  <a href="shop-product-view.html" class="product-image">
									<img class="replace-2x" src="content/img/product-4.jpg" alt="" title="" width="70" height="70">
								  </a>
								  <ul>
									<li>117 cm / 46"LCD TV</li>
									<li>Full HD 3D &amp; 2D</li>
									<li>Sony Internet TV</li>
									<li>Dynamic Edge LED</li>
									<li>1X-Reality PRO</li>
								  </ul>
								  <div class="actions">
									<a href="shop-product-view.html" class="add-cart">
									  <svg x="0" y="0" width="16px" height="16px" viewBox="0 0 16 16" enable-background="new 0 0 16 16" xml:space="preserve">
										<g>
										  <path fill="#1e1e1e" d="M15.001,4h-0.57l-3.707-3.707c-0.391-0.391-1.023-0.391-1.414,0c-0.391,0.391-0.391,1.023,0,1.414L11.603,4
											H4.43l2.293-2.293c0.391-0.391,0.391-1.023,0-1.414s-1.023-0.391-1.414,0L1.602,4H1C0.448,4,0,4.448,0,5s0.448,1,1,1
											c0,2.69,0,7.23,0,8c0,1.104,0.896,2,2,2h10c1.104,0,2-0.896,2-2c0-0.77,0-5.31,0-8c0.553,0,1-0.448,1-1S15.554,4,15.001,4z
											M13.001,14H3V6h10V14z"></path>
										  <path fill="#1e1e1e" d="M11.001,13c0.553,0,1-0.447,1-1V8c0-0.553-0.447-1-1-1s-1,0.447-1,1v4C10.001,12.553,10.448,13,11.001,13z"></path>
										  <path fill="#1e1e1e" d="M8,13c0.553,0,1-0.447,1-1V8c0-0.553-0.448-1-1-1S7,7.447,7,8v4C7,12.553,7.448,13,8,13z"></path>
										  <path fill="#1e1e1e" d="M5,13c0.553,0,1-0.447,1-1V8c0-0.553-0.447-1-1-1S4,7.447,4,8v4C4,12.553,4.448,13,5,13z"></path>
										</g>
									  </svg>
									</a>
									<a href="#" class="add-wishlist">
									  <svg x="0" y="0" width="16px" height="16px" viewBox="0 0 16 16" enable-background="new 0 0 16 16" xml:space="preserve">
									  <path fill="#1e1e1e" d="M11.335,0C10.026,0,8.848,0.541,8,1.407C7.153,0.541,5.975,0,4.667,0C2.088,0,0,2.09,0,4.667C0,12,8,16,8,16
										s8-4,8-11.333C16.001,2.09,13.913,0,11.335,0z M8,13.684C6.134,12.49,2,9.321,2,4.667C2,3.196,3.197,2,4.667,2C6,2,8,4,8,4
										s2-2,3.334-2c1.47,0,2.666,1.196,2.666,2.667C14.001,9.321,9.867,12.49,8,13.684z"></path>
									  </svg>
									</a>
									<a href="#" class="add-compare">
									  <svg x="0" y="0" width="16px" height="16px" viewBox="0 0 16 16" enable-background="new 0 0 16 16" xml:space="preserve">
										<path fill="#1e1e1e" d="M16,3.063L13,0v2H1C0.447,2,0,2.447,0,3s0.447,1,1,1h12v2L16,3.063z"></path>
										<path fill="#1e1e1e" d="M16,13.063L13,10v2H1c-0.553,0-1,0.447-1,1s0.447,1,1,1h12v2L16,13.063z"></path>
										<path fill="#1e1e1e" d="M15,7H3V5L0,7.938L3,11V9h12c0.553,0,1-0.447,1-1S15.553,7,15,7z"></path>
									  </svg>
									</a>
								  </div><!-- .actions -->
								</div><!-- .product-hover -->
							  </div><!-- .product -->
							  
							  <div class="col-sm-3 col-md-3 product rotation">
								<div class="default">
								  <a href="shop-product-view.html" class="product-image">
									<img class="replace-2x" src="content/img/product-5.jpg" alt="" title="" width="270" height="270">
								  </a>
								  <div class="product-description">
									<div class="vertical">
									  <h3 class="product-name">
									<a href="shop-product-view.html"> 800 Series Diamond</a>
									  </h3>
									  <div class="price">$1, 449.00</div>	
									</div>
								  </div>
								</div>
								<div class="product-hover">
								  <h3 class="product-name">
									<a href="shop-product-view.html"> 800 Series Diamond</a>
								  </h3>
								  <div class="price">$1, 449.00</div>
								  <a href="shop-product-view.html" class="product-image">
									<img class="replace-2x" src="content/img/product-5.jpg" alt="" title="" width="70" height="70">
								  </a>
								  <ul>
									<li>117 cm / 46"LCD TV</li>
									<li>Full HD 3D &amp; 2D</li>
									<li>Sony Internet TV</li>
									<li>Dynamic Edge LED</li>
									<li>1X-Reality PRO</li>
								  </ul>
								  <div class="actions">
									<a href="shop-product-view.html" class="add-cart">
									  <svg x="0" y="0" width="16px" height="16px" viewBox="0 0 16 16" enable-background="new 0 0 16 16" xml:space="preserve">
										<g>
										  <path fill="#1e1e1e" d="M15.001,4h-0.57l-3.707-3.707c-0.391-0.391-1.023-0.391-1.414,0c-0.391,0.391-0.391,1.023,0,1.414L11.603,4
											H4.43l2.293-2.293c0.391-0.391,0.391-1.023,0-1.414s-1.023-0.391-1.414,0L1.602,4H1C0.448,4,0,4.448,0,5s0.448,1,1,1
											c0,2.69,0,7.23,0,8c0,1.104,0.896,2,2,2h10c1.104,0,2-0.896,2-2c0-0.77,0-5.31,0-8c0.553,0,1-0.448,1-1S15.554,4,15.001,4z
											M13.001,14H3V6h10V14z"></path>
										  <path fill="#1e1e1e" d="M11.001,13c0.553,0,1-0.447,1-1V8c0-0.553-0.447-1-1-1s-1,0.447-1,1v4C10.001,12.553,10.448,13,11.001,13z"></path>
										  <path fill="#1e1e1e" d="M8,13c0.553,0,1-0.447,1-1V8c0-0.553-0.448-1-1-1S7,7.447,7,8v4C7,12.553,7.448,13,8,13z"></path>
										  <path fill="#1e1e1e" d="M5,13c0.553,0,1-0.447,1-1V8c0-0.553-0.447-1-1-1S4,7.447,4,8v4C4,12.553,4.448,13,5,13z"></path>
										</g>
									  </svg>
									</a>
									<a href="#" class="add-wishlist">
									  <svg x="0" y="0" width="16px" height="16px" viewBox="0 0 16 16" enable-background="new 0 0 16 16" xml:space="preserve">
									  <path fill="#1e1e1e" d="M11.335,0C10.026,0,8.848,0.541,8,1.407C7.153,0.541,5.975,0,4.667,0C2.088,0,0,2.09,0,4.667C0,12,8,16,8,16
										s8-4,8-11.333C16.001,2.09,13.913,0,11.335,0z M8,13.684C6.134,12.49,2,9.321,2,4.667C2,3.196,3.197,2,4.667,2C6,2,8,4,8,4
										s2-2,3.334-2c1.47,0,2.666,1.196,2.666,2.667C14.001,9.321,9.867,12.49,8,13.684z"></path>
									  </svg>
									</a>
									<a href="#" class="add-compare">
									  <svg x="0" y="0" width="16px" height="16px" viewBox="0 0 16 16" enable-background="new 0 0 16 16" xml:space="preserve">
										<path fill="#1e1e1e" d="M16,3.063L13,0v2H1C0.447,2,0,2.447,0,3s0.447,1,1,1h12v2L16,3.063z"></path>
										<path fill="#1e1e1e" d="M16,13.063L13,10v2H1c-0.553,0-1,0.447-1,1s0.447,1,1,1h12v2L16,13.063z"></path>
										<path fill="#1e1e1e" d="M15,7H3V5L0,7.938L3,11V9h12c0.553,0,1-0.447,1-1S15.553,7,15,7z"></path>
									  </svg>
									</a>
								  </div><!-- .actions -->
								</div><!-- .product-hover -->
							  </div><!-- .product -->
							  
							  <div class="col-sm-3 col-md-3 product rotation">
								<div class="default">
								  <a href="shop-product-view.html" class="product-image">
									<img class="replace-2x" src="content/img/product-6.jpg" alt="" title="" width="270" height="270">
								  </a>
								  <div class="product-description">
									<div class="vertical">
									  <h3 class="product-name">
									<a href="shop-product-view.html">AirPlay Hi-Fi system</a>
									  </h3>
									  <div class="price">$1, 449.00</div>	
									</div>
								  </div>
								</div>
								
								<div class="product-hover">
								  <h3 class="product-name">
									<a href="shop-product-view.html">AirPlay Hi-Fi system</a>
								  </h3>
								  <div class="price">$1, 449.00</div>
								  <a href="shop-product-view.html" class="product-image">
									<img class="replace-2x" src="content/img/product-6.jpg" alt="" title="" width="70" height="70">
								  </a>
								  <ul>
									<li>117 cm / 46"LCD TV</li>
									<li>Full HD 3D &amp; 2D</li>
									<li>Sony Internet TV</li>
									<li>Dynamic Edge LED</li>
									<li>1X-Reality PRO</li>
								  </ul>
								  <div class="actions">
									<a href="shop-product-view.html" class="add-cart">
									  <svg x="0" y="0" width="16px" height="16px" viewBox="0 0 16 16" enable-background="new 0 0 16 16" xml:space="preserve">
										<g>
										  <path fill="#1e1e1e" d="M15.001,4h-0.57l-3.707-3.707c-0.391-0.391-1.023-0.391-1.414,0c-0.391,0.391-0.391,1.023,0,1.414L11.603,4
											H4.43l2.293-2.293c0.391-0.391,0.391-1.023,0-1.414s-1.023-0.391-1.414,0L1.602,4H1C0.448,4,0,4.448,0,5s0.448,1,1,1
											c0,2.69,0,7.23,0,8c0,1.104,0.896,2,2,2h10c1.104,0,2-0.896,2-2c0-0.77,0-5.31,0-8c0.553,0,1-0.448,1-1S15.554,4,15.001,4z
											M13.001,14H3V6h10V14z"></path>
										  <path fill="#1e1e1e" d="M11.001,13c0.553,0,1-0.447,1-1V8c0-0.553-0.447-1-1-1s-1,0.447-1,1v4C10.001,12.553,10.448,13,11.001,13z"></path>
										  <path fill="#1e1e1e" d="M8,13c0.553,0,1-0.447,1-1V8c0-0.553-0.448-1-1-1S7,7.447,7,8v4C7,12.553,7.448,13,8,13z"></path>
										  <path fill="#1e1e1e" d="M5,13c0.553,0,1-0.447,1-1V8c0-0.553-0.447-1-1-1S4,7.447,4,8v4C4,12.553,4.448,13,5,13z"></path>
										</g>
									  </svg>
									</a>
									<a href="#" class="add-wishlist">
									  <svg x="0" y="0" width="16px" height="16px" viewBox="0 0 16 16" enable-background="new 0 0 16 16" xml:space="preserve">
									  <path fill="#1e1e1e" d="M11.335,0C10.026,0,8.848,0.541,8,1.407C7.153,0.541,5.975,0,4.667,0C2.088,0,0,2.09,0,4.667C0,12,8,16,8,16
										s8-4,8-11.333C16.001,2.09,13.913,0,11.335,0z M8,13.684C6.134,12.49,2,9.321,2,4.667C2,3.196,3.197,2,4.667,2C6,2,8,4,8,4
										s2-2,3.334-2c1.47,0,2.666,1.196,2.666,2.667C14.001,9.321,9.867,12.49,8,13.684z"></path>
									  </svg>
									</a>
									<a href="#" class="add-compare">
									  <svg x="0" y="0" width="16px" height="16px" viewBox="0 0 16 16" enable-background="new 0 0 16 16" xml:space="preserve">
										<path fill="#1e1e1e" d="M16,3.063L13,0v2H1C0.447,2,0,2.447,0,3s0.447,1,1,1h12v2L16,3.063z"></path>
										<path fill="#1e1e1e" d="M16,13.063L13,10v2H1c-0.553,0-1,0.447-1,1s0.447,1,1,1h12v2L16,13.063z"></path>
										<path fill="#1e1e1e" d="M15,7H3V5L0,7.938L3,11V9h12c0.553,0,1-0.447,1-1S15.553,7,15,7z"></path>
									  </svg>
									</a>
								  </div><!-- .actions -->
								</div><!-- .product-hover -->
							  </div><!-- .product -->
							  
							  <div class="col-sm-3 col-md-3 product rotation">
								<div class="default">
								  <a href="shop-product-view.html" class="product-image">
									<img class="replace-2x" src="content/img/product-7.jpg" alt="" title="" width="270" height="270">
								  </a>
								  <div class="product-description">
									<div class="vertical">
									  <h3 class="product-name">
									<a href="shop-product-view.html">Sony Xperia Z</a>
									  </h3>
									  <div class="price">$1, 449.00</div>	
									</div>
								  </div>
								</div>
								
								<div class="product-hover">
								  <h3 class="product-name">
									<a href="shop-product-view.html">Sony Xperia Z</a>
								  </h3>
								  <div class="price">$1, 449.00</div>
								  <a href="shop-product-view.html" class="product-image">
									<img class="replace-2x" src="content/img/product-7.jpg" alt="" title="" width="70" height="70">
								  </a>
								  <ul>
									<li>117 cm / 46"LCD TV</li>
									<li>Full HD 3D &amp; 2D</li>
									<li>Sony Internet TV</li>
									<li>Dynamic Edge LED</li>
									<li>1X-Reality PRO</li>
								  </ul>
								  <div class="actions">
									<a href="shop-product-view.html" class="add-cart">
									  <svg x="0" y="0" width="16px" height="16px" viewBox="0 0 16 16" enable-background="new 0 0 16 16" xml:space="preserve">
										<g>
										  <path fill="#1e1e1e" d="M15.001,4h-0.57l-3.707-3.707c-0.391-0.391-1.023-0.391-1.414,0c-0.391,0.391-0.391,1.023,0,1.414L11.603,4
											H4.43l2.293-2.293c0.391-0.391,0.391-1.023,0-1.414s-1.023-0.391-1.414,0L1.602,4H1C0.448,4,0,4.448,0,5s0.448,1,1,1
											c0,2.69,0,7.23,0,8c0,1.104,0.896,2,2,2h10c1.104,0,2-0.896,2-2c0-0.77,0-5.31,0-8c0.553,0,1-0.448,1-1S15.554,4,15.001,4z
											M13.001,14H3V6h10V14z"></path>
										  <path fill="#1e1e1e" d="M11.001,13c0.553,0,1-0.447,1-1V8c0-0.553-0.447-1-1-1s-1,0.447-1,1v4C10.001,12.553,10.448,13,11.001,13z"></path>
										  <path fill="#1e1e1e" d="M8,13c0.553,0,1-0.447,1-1V8c0-0.553-0.448-1-1-1S7,7.447,7,8v4C7,12.553,7.448,13,8,13z"></path>
										  <path fill="#1e1e1e" d="M5,13c0.553,0,1-0.447,1-1V8c0-0.553-0.447-1-1-1S4,7.447,4,8v4C4,12.553,4.448,13,5,13z"></path>
										</g>
									  </svg>
									</a>
									<a href="#" class="add-wishlist">
									  <svg x="0" y="0" width="16px" height="16px" viewBox="0 0 16 16" enable-background="new 0 0 16 16" xml:space="preserve">
									  <path fill="#1e1e1e" d="M11.335,0C10.026,0,8.848,0.541,8,1.407C7.153,0.541,5.975,0,4.667,0C2.088,0,0,2.09,0,4.667C0,12,8,16,8,16
										s8-4,8-11.333C16.001,2.09,13.913,0,11.335,0z M8,13.684C6.134,12.49,2,9.321,2,4.667C2,3.196,3.197,2,4.667,2C6,2,8,4,8,4
										s2-2,3.334-2c1.47,0,2.666,1.196,2.666,2.667C14.001,9.321,9.867,12.49,8,13.684z"></path>
									  </svg>
									</a>
									<a href="#" class="add-compare">
									  <svg x="0" y="0" width="16px" height="16px" viewBox="0 0 16 16" enable-background="new 0 0 16 16" xml:space="preserve">
										<path fill="#1e1e1e" d="M16,3.063L13,0v2H1C0.447,2,0,2.447,0,3s0.447,1,1,1h12v2L16,3.063z"></path>
										<path fill="#1e1e1e" d="M16,13.063L13,10v2H1c-0.553,0-1,0.447-1,1s0.447,1,1,1h12v2L16,13.063z"></path>
										<path fill="#1e1e1e" d="M15,7H3V5L0,7.938L3,11V9h12c0.553,0,1-0.447,1-1S15.553,7,15,7z"></path>
									  </svg>
									</a>
								  </div><!-- .actions -->
								</div><!-- .product-hover -->
							  </div><!-- .product -->
							  
							  <div class="col-sm-3 col-md-3 product rotation">
								<div class="default">
								  <a href="shop-product-view.html" class="product-image">
									<img class="replace-2x" src="content/img/product-8.jpg" alt="" title="" width="270" height="270">
								  </a>
								  <div class="product-description">
									<div class="vertical">
									  <h3 class="product-name">
									<a href="shop-product-view.html">Xperia miro</a>
									  </h3>
									  <div class="price">$1, 449.00</div>	
									</div>
								  </div>
								</div>
								
								<div class="product-hover">
								  <h3 class="product-name">
									<a href="shop-product-view.html">Xperia miro</a>
								  </h3>
								  <div class="price">$1, 449.00</div>
								  <a href="shop-product-view.html" class="product-image">
									<img class="replace-2x" src="content/img/product-8.jpg" alt="" title="" width="70" height="70">
								  </a>
								  <ul>
									<li>117 cm / 46"LCD TV</li>
									<li>Full HD 3D &amp; 2D</li>
									<li>Sony Internet TV</li>
									<li>Dynamic Edge LED</li>
									<li>1X-Reality PRO</li>
								  </ul>
								  <div class="actions">
									<a href="shop-product-view.html" class="add-cart">
									  <svg x="0" y="0" width="16px" height="16px" viewBox="0 0 16 16" enable-background="new 0 0 16 16" xml:space="preserve">
										<g>
										  <path fill="#1e1e1e" d="M15.001,4h-0.57l-3.707-3.707c-0.391-0.391-1.023-0.391-1.414,0c-0.391,0.391-0.391,1.023,0,1.414L11.603,4
											H4.43l2.293-2.293c0.391-0.391,0.391-1.023,0-1.414s-1.023-0.391-1.414,0L1.602,4H1C0.448,4,0,4.448,0,5s0.448,1,1,1
											c0,2.69,0,7.23,0,8c0,1.104,0.896,2,2,2h10c1.104,0,2-0.896,2-2c0-0.77,0-5.31,0-8c0.553,0,1-0.448,1-1S15.554,4,15.001,4z
											M13.001,14H3V6h10V14z"></path>
										  <path fill="#1e1e1e" d="M11.001,13c0.553,0,1-0.447,1-1V8c0-0.553-0.447-1-1-1s-1,0.447-1,1v4C10.001,12.553,10.448,13,11.001,13z"></path>
										  <path fill="#1e1e1e" d="M8,13c0.553,0,1-0.447,1-1V8c0-0.553-0.448-1-1-1S7,7.447,7,8v4C7,12.553,7.448,13,8,13z"></path>
										  <path fill="#1e1e1e" d="M5,13c0.553,0,1-0.447,1-1V8c0-0.553-0.447-1-1-1S4,7.447,4,8v4C4,12.553,4.448,13,5,13z"></path>
										</g>
									  </svg>
									</a>
									<a href="#" class="add-wishlist">
									  <svg x="0" y="0" width="16px" height="16px" viewBox="0 0 16 16" enable-background="new 0 0 16 16" xml:space="preserve">
									  <path fill="#1e1e1e" d="M11.335,0C10.026,0,8.848,0.541,8,1.407C7.153,0.541,5.975,0,4.667,0C2.088,0,0,2.09,0,4.667C0,12,8,16,8,16
										s8-4,8-11.333C16.001,2.09,13.913,0,11.335,0z M8,13.684C6.134,12.49,2,9.321,2,4.667C2,3.196,3.197,2,4.667,2C6,2,8,4,8,4
										s2-2,3.334-2c1.47,0,2.666,1.196,2.666,2.667C14.001,9.321,9.867,12.49,8,13.684z"></path>
									  </svg>
									</a>
									<a href="#" class="add-compare">
									  <svg x="0" y="0" width="16px" height="16px" viewBox="0 0 16 16" enable-background="new 0 0 16 16" xml:space="preserve">
										<path fill="#1e1e1e" d="M16,3.063L13,0v2H1C0.447,2,0,2.447,0,3s0.447,1,1,1h12v2L16,3.063z"></path>
										<path fill="#1e1e1e" d="M16,13.063L13,10v2H1c-0.553,0-1,0.447-1,1s0.447,1,1,1h12v2L16,13.063z"></path>
										<path fill="#1e1e1e" d="M15,7H3V5L0,7.938L3,11V9h12c0.553,0,1-0.447,1-1S15.553,7,15,7z"></path>
									  </svg>
									</a>
								  </div><!-- .actions -->
								</div><!-- .product-hover -->
							  </div><!-- .product -->
							</div>
						  </div>
						</div><!-- .recommended-product -->
				      </article><!-- .content -->
				    </div>
				  </div>
				</div><!-- #main -->
					  			
	  		<%
	  	}
	  	
	  	%>


</div><!-- .page-box-content -->
</div><!-- .page-box -->

</body>
</html>