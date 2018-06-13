<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page import="com.bookstore.config.ProjectConfig"%>
<%@page import="com.bookstore.domain.Product"%>
<%@page import="org.springframework.util.StringUtils"%>
<%@page import="com.bookstore.util.DateUtils"%>
<%@page import="java.text.DateFormat"%>
<%@page import="com.bookstore.domain.Category"%>
<%@page import="java.util.List"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>aa</title>

</head>
<body>
	

  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header clearfix" >
      <h1 class="pull-left"><spring:message code="label.admin.leftmenu.orders" /></h1>
    </section>

    <!-- Main content -->
    <section class="content" style="min-height: 530px;">
      
      <!-- Main row -->
      <div class="row">
        <div class="col-md-12">
          <!-- Horizontal Form -->
          <div class="box box-info orders">
            <div class="box-body" id="orders_list">
				<div class="row">
					<div class="col-sm-6">
						<div class="dataTables_length" id="example1_length">
							<label>Show 
							<select name="orders_rpp" id="orders_rpp" aria-controls="example1" class="form-control input-sm">
								<option value="10">10</option>
								<option value="25">25</option>
								<option value="50">50</option>
								<option value="100">100</option>
								</select>
								entries
							</label>
						</div>
					</div>
					<div class="col-sm-6">
						<button id="refresh_orders_table" class="btn btn-sm  pull-right"><i class="fa fa-refresh"></i> Reload</button>
					</div>
				</div>
				<table class="table table-bordered table-striped text-center" id="orders_table">
				   <thead>
					   <tr class="bg-primary">
					     <th><input type="checkbox" ></th>
					     <th><spring:message code="label.product.order.header.order"/></th>
					     <th><spring:message code="label.product.order.header.orderstatus"/></th>
					     <th><spring:message code="label.product.order.header.paymentstatus"/></th>
					     <th ><spring:message code="label.product.order.header.customer"/></th>
					     <th><spring:message code="label.product.order.header.store"/></th>
					     <th><spring:message code="label.product.order.header.created"/></th>
					     <th><spring:message code="label.product.order.header.ordertotal"/></th>
					     <th><spring:message code="label.product.order.header.view"/></th>
					   </tr>
				   </thead>
				   <tbody>
                  
                  </tbody>
			   </table>
			   <div class="row order_pagi">
			   	<div class="col-sm-5">
			   		<div class="dataTables_info" id="order_paginate_label" role="status" aria-live="polite"></div>
				</div>
				<div class="col-sm-7">
					<div class="dataTables_paginate paging_simple_numbers">
						<ul class="pagination">
							<li class="paginate_button previous disabled">
	  							<a href="javascript:void(0);" aria-controls="example2" data-dt-idx="1" tabindex="0"><spring:message code="label.datatable.pagination.previous"/></a>
							</li>
							<li class="paginate_button active ">
								<a href="#" aria-controls="example2" data-dt-idx="1" tabindex="0" class="curr_page">1</a>
							</li>
 							<li class="paginate_button next disabled" >
								<a href="javascript:void(0);" aria-controls="example2" data-dt-idx="1" tabindex="0"><spring:message code="label.datatable.pagination.next"/></a>
							</li>
						</ul>
					</div>
				</div>
			</div>
            </div>
            <div class="overlay">
              <i class="fa fa-refresh fa-spin"></i>
            </div>
          </div>
        </div>
        
      </div>
      <!-- /.row (main row) -->

    </section>
    <!-- /.content -->
  </div>

<script type="text/javascript">
 $(document).ready(function(){
	 
	 $.getProductOrdersList();
	 
	
	$(document).on("change","#products_rpp",function() {
		var rpp = $("#products_rpp").val();
// 		getproductslist(1, rpp);
	});
	
	
	
	
	function getproductslist(pn, rpp){
		$.ajax({
			type : "GET",
			url : "${pageContext.request.contextPath}/admin/products/list/"+pn,
			data : {"rpp":rpp},
			success : function(response) {
				 $("#products_list").html(response);
			}
		});
	}
});
</script>
  
</body>
</html>