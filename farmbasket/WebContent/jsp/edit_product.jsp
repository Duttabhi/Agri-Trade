<%@ page import="farm.Customer" %>
<%@page import="databaseconnection.JDBCMySQLConnection"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html lang="en">
<head>
    <title>Edit Product</title>
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
String pid = request.getParameter("pid");
JDBCMySQLConnection dbcon = new JDBCMySQLConnection();
Connection con = null;
Statement st1 = null;
ResultSet rs1 = null;
String query1=null;
String pname=null;
con = dbcon.createConnection();
query1 = "select * from Product where Product_ID = '"+pid+"'";
st1 = con.createStatement();
rs1=st1.executeQuery(query1);
while (rs1.next()) {

%>
<body>
<!-- Navigation -->
<%@ include file= "v_form_menu.jsp" %>
<form class="form-horizontal" method="post" action="../editproduct">
<div class="container">
<fieldset>

<!-- Form Name -->
<legend>PRODUCT DETAILS :</legend>

<!-- Text input-->
<div class="form-group">
  <label class="col-md-4 control-label" for="product_id">PRODUCT ID</label>  
  <div class="col-md-4">
     <input id="product_id" name="product_id" placeholder="PRODUCT ID" class="form-control input-md" required type="text" value="<%=pid %>">
     
  </div>
</div>

<!-- Text input-->
<div class="form-group">
  <label class="col-md-4 control-label" for="product_name">PRODUCT NAME</label>  
  <div class="col-md-4">
	<input id="product_name" name="product_name" placeholder="PRODUCT NAME" class="form-control input-md" required type="text" value="<%=rs1.getString("Product_Name") %>">  
  </div>
</div>

<!-- Textarea -->
<div class="form-group">
  <label class="col-md-4 control-label" for="product_description">PRODUCT DESCRIPTION</label>
  <div class="col-md-4">                     
    <textarea class="form-control" id="product_description" name="product_description"><%=rs1.getString("Product_Desc") %></textarea>
  </div>
</div>

<div class="form-group ">
    <label class="col-md-4 control-label">AVAILABLE QUANTITY</label>
    <div class="col-md-4">
      <label class="form-control-static"><%=rs1.getString("Total_Stock") %></label>
    </div>
  </div>

<!-- Text input-->
<div class="form-group">
  <label class="col-md-4 control-label" for="quantity">ADD QUANTITY</label>  
  <div class="col-md-4">
  <input id="quantity" name="quantity" class="form-control input-md" value="0" type="text">
    
  </div>
</div>

<!-- Text input-->
<div class="form-group">
  <label class="col-md-4 control-label" for="unit_price">UNIT PRICE</label>  
  <div class="col-md-4">
  <input id="unit_price" name="unit_price" placeholder="unit price" class="form-control input-md" required type="text" value= <%=rs1.getString("Unit_Price") %>>
  </div>
  <label class=" control-label" >per <%=rs1.getString("Unit") %></label>
  
</div>

 <!-- File Button 
<div class="form-group">
  <label class="col-md-4 control-label" for="filebutton">PRODUCT IMAGE</label>
  <div class="col-md-4">
    <input id="filebutton" name="filebutton" class="input-file" type="file">
  </div>
</div>--> 

<!-- Button -->
<div class="form-group">
  <label class="col-md-4 control-label" for="singlebutton"></label>
  <div class="col-md-4">
    <button id="singlebutton" name="singlebutton" class="btn btn-primary">Update</button>
  </div>
  </div>

</fieldset>
</div>
</form>
</body>
<%} %>
</html>