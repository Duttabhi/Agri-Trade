<%@ page import="farm.Customer" %>
<%@page import="databaseconnection.JDBCMySQLConnection"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Add Farmer</title>
    <!-- Bootstrap Core CSS -->
    <link href="./../css/bootstrap.css" rel="stylesheet">
    <!-- Custom CSS -->
    <link href="./../css/shop-homepage.css" rel="stylesheet">
    <link href="./../css/farmer_market.css" rel="stylesheet">
    <!-- jQuery -->
    <script src="./../js/jquery.js"></script>

    <!-- Bootstrap Core JavaScript -->
    
    
</head>
<% 
String custid=(String)session.getAttribute("custid");//vendor id
%>
<body>
<!-- Navigation -->
<%@ include file= "v_form_menu.jsp" %>
<form class="form-horizontal" method="post" action="../addnewfarmer">
<div class="container">
<fieldset>
<!-- Form Name -->
<legend>ADD FARMER :</legend>

<!-- Text input-->
<div class="form-group">
  <label class="col-md-4 control-label" for="farmer_fname">FARMER FIRST NAME  *</label>  
  <div class="col-md-4">
  <input id="farmer_fname" name="farmer_fname" placeholder="First Name" class="form-control input-md" required type="text">
  </div>
</div>

<!-- Text input-->
<div class="form-group">
  <label class="col-md-4 control-label" for="farmer_lname">FARMER LAST NAME</label>  
  <div class="col-md-4">
  <input id="farmer_lname" name="farmer_lname" placeholder="Last Name" class="form-control input-md"  type="text">
  </div>
</div>

<!-- Text input-->
<div class="form-group">
  <label class="col-md-4 control-label" for="farmer_email">FARMER EMAIL ID  *</label>  
  <div class="col-md-4">
  <input id="farmer_email" name="farmer_email" placeholder= "Email Id" class="form-control input-md" required type="text" >
  </div>
</div>

<!-- Text input-->
<div class="form-group">
  <label class="col-md-4 control-label" for="farmer_phone" >FARMER PHONE NUMBER  *</label>  
  <div class="col-md-4" id= "staticParent">
  <input id="farmer_phone" name="farmer_phone" placeholder="Phone Number" class="form-control input-md"  required type="text"  maxlength="10">
    
  </div>
</div>

<!-- Textarea -->
<div class="form-group">
	<label class="col-md-4 control-label" for="customer_address">ADDRESS</label>
	<div class="col-md-4">                     
		<textarea class="form-control" id="farmer_address" name="customer_address"></textarea>
	</div>
</div>

<!-- Button -->
<div class="form-group">
  <label class="col-md-4 control-label" for="singlebutton"></label>
  <div class="col-md-4">
    <button id="singlebutton" name="singlebutton" class="btn btn-primary">ADD</button>
  </div>
  </div>

</fieldset>
</div>
</form>


<script type="text/javascript">
$(function() {
	  $('#staticParent').on('keydown', '#farmer_phone', function(e){-1!==$.inArray(e.keyCode,[46,8,9,27,13,110,190])||/65|67|86|88/.test(e.keyCode)&&(!0===e.ctrlKey||!0===e.metaKey)||35<=e.keyCode&&40>=e.keyCode||(e.shiftKey||48>e.keyCode||57<e.keyCode)&&(96>e.keyCode||105<e.keyCode)&&e.preventDefault()});
})


$('#farmer_email').change(function() {
   //do stuff
	var email = document.getElementById('farmer_email');
    var filter = /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;

    if (!filter.test(email.value)) {
    alert('Please provide a valid email address');
    email.focus;
    return false;
    }
});

</script>

</body>