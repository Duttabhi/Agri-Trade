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
    <title>Add Product</title>
    <!-- Bootstrap Core CSS -->
    <link href="./../css/bootstrap.css" rel="stylesheet">
    <!-- Custom CSS -->
    <link href="./../css/shop-homepage.css" rel="stylesheet">
    <link href="./../css/farmer_market.css" rel="stylesheet">
    
    <style type="text/css">
    body { 
			background-image: url('./../img/10.jpg') ;
			background-position: center center;
			background-repeat:  no-repeat;
			background-attachment: fixed;
			background-size:  cover;
			background-color: #999;
  
}
    
    </style>
</head>
<% 
String custid=(String)session.getAttribute("custid");//vendor id
JDBCMySQLConnection dbcon = new JDBCMySQLConnection();
Connection con = null;
Statement st1 = null;
ResultSet rs1 = null;
String query1=null;
%>
<body>
<!-- Navigation -->
<%@ include file= "v_form_menu.jsp" %>
<form class="form-horizontal" method="post" action="../addnewproduct">
<div class="container">
<fieldset>

<!-- Form Name -->
<legend>ADD PRODUCT :</legend>
<div class="form-group " id="error" style="color:red; text-align:center;">
							</div>

<!-- Text input-->
<div class="form-group">
  <label class="col-md-4 control-label" for="product_id">PRODUCT ID *</label>  
  <div class="input-group col-md-4">
  <input id="product_id" name="product_id" placeholder="PRODUCT ID" class="form-control input-md" required type="text">
    
  </div>
</div>

<!-- Text input-->
<div class="form-group">
  <label class="col-md-4 control-label" for="product_name">PRODUCT NAME *</label>  
  <div class="input-group col-md-4">
  <input id="product_name" name="product_name" placeholder="PRODUCT NAME" class="form-control input-md" required type="text">
    
  </div>
</div>

<!-- Textarea -->
<div class="form-group">
  <label class="col-md-4 control-label" for="product_description">PRODUCT DESCRIPTION</label>
  <div class="input-group col-md-4">                     
    <textarea class="form-control" id="product_description" name="product_description"></textarea>
  </div>
</div>

<!-- Select Basic -->
<div class="form-group">
  <label class="col-md-4 control-label" for="product_categorie">PRODUCT CATEGORY *</label>
  <div class="input-group col-md-4">
    <select id="product_categorie" name="product_categorie" class="form-control" required >
    	<option>-- select category --</option>
    	<option value="fruit">Fruit</option>
      	<option value="veg">Vegetable</option>
      	<option value="dairy">Dairy</option>
    </select>
  </div>
</div>

<!-- Text input-->
<div class="form-group">
  <label class="col-md-4 control-label" for="quantity">AVAILABLE QUANTITY *</label>  
  <div class="input-group col-md-4">
  <input id="quantity" name="quantity" placeholder="AVAILABLE QUANTITY" class="form-control input-md" required type="text">
    
  </div>
</div>

<!-- Text input-->
<div class="form-group">
  <label class="col-md-4 control-label" for="unit_price">UNIT PRICE *</label>  
  <div class="input-group col-md-4">
    <div class="input-group-addon">&#x20B9;</div>
  <input id="unit_price" name="unit_price" placeholder="unit price" class="form-control input-md" required type="text">
  </div>
</div>

<!-- Select Basic -->
<div class="form-group">
  <label class="col-md-4 control-label" for="unit">UNIT *</label>
  <div class="input-group col-md-4">
    <select id="unit" name="unit" class="form-control">
    	<option value="kilo">Kilo</option>
      	<option value="dz">Dozen</option>
      	<option value="lt">Litre</option>
    </select>
  </div>
</div>

<!-- Text input-->
<div class="form-group">
  <label class="col-md-4 control-label" for="farmer">FARMER *</label>  
  <div class="input-group col-md-4">
  	<select id="farmer" name="farmer" class="form-control">
  		<%
  		con = dbcon.createConnection();
		query1 = "select Registration_ID, Registration_first_name, Registration_last_name from Registration where Registration_Type = 'F' ";
		st1 = con.createStatement();
		rs1=st1.executeQuery(query1);
		while (rs1.next()) {
			int fid = rs1.getInt("Registration_ID");
			String fname = rs1.getString("Registration_first_name");
			String lname = rs1.getString("Registration_last_name");
		%>
			<option value=<%=fid %> ><%=fname %> <%=lname %></option>
		<%	
		}
  		%>
  		
    </select>
  </div>
</div>

 <!-- File Button  
<div class="form-group">
  <label class="col-md-4 control-label" for="filebutton">PRODUCT IMAGE</label>
  <div class="input-group col-md-4">
    <input id="filebutton" name="filebutton" class="input-file" type="file">
  </div>
</div>-->

<!-- Button -->
<div class="form-group">
  <label class="col-md-4 control-label" for="singlebutton"></label>
  <div class="input-group col-md-4">
    <button id="singlebutton" name="singlebutton" class="btn btn-primary">ADD</button>
  </div>
  </div>

</fieldset>
</div>
</form>

<script type="text/javascript">
document.getElementById('product_id').onchange = function() {myFunction()};
function myFunction() {
	var pid = document.getElementById('product_id').value;
	var xmlhttp;
	if (window.XMLHttpRequest)
	  {// code for IE7+, Firefox, Chrome, Opera, Safari
	  xmlhttp=new XMLHttpRequest();
	  }
	else
	  {// code for IE6, IE5 
	  xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
	  };
	  xmlhttp.onreadystatechange=function()
		{
			if (xmlhttp.readyState==4 && xmlhttp.status==200)
			{
				var msg = xmlhttp.responseText;
				if (msg != "" || msg != null)
					document.getElementById("error").innerHTML = msg;
			}
		};	
		xmlhttp.open("GET", "checkpid.jsp?pid="+pid, true);
		xmlhttp.send();
}
</script>
</body>
</html>