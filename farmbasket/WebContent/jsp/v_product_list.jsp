<%@ page import="farm.Customer" %>
<%@page import="databaseconnection.JDBCMySQLConnection"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
   <title>Products List</title>
   <script src="./../js/jquery.js"></script>
   <script src="./../js/bootstrap.min.js"></script>
   
    <link href="./../css/bootstrap.css" rel="stylesheet">
    <link href="./../css/cart.css" rel="stylesheet">
</head>
<% 
String custid=(String)session.getAttribute("custid");
JDBCMySQLConnection dbcon = new JDBCMySQLConnection();
Connection con = null;
Statement st1,st2, st3 = null;
ResultSet rs1,rs2, rs3 = null;
String query1, query2, query3=null;
Double total= 0.00;
%>
<body>
<%@ include file= "v_form_menu.jsp" %>
<div class="container">

<ul id = "myTab" class = "nav nav-tabs">
   <li class = "active">
      <a href = "#veg" data-toggle = "tab">
         Vegetables
      </a>
   </li>
   <li><a href = "#fruit" data-toggle = "tab">Fruits</a></li>
   <li><a href = "#dairy" data-toggle = "tab">Dairy Products</a></li>
</ul>

<div id = "myTabContent" class = "tab-content">
   <div class = "tab-pane fade in active" id = "veg">
      <h4>Vegetable List</h4>
      <hr>
      <div class="row">
        <div class="col-sm-12 col-md-10 col-md-offset-1">
            <table class="table table-hover">
                <thead>
                    <tr>
                        <th>Product ID</th>
                        <th>Product Name</th>
                    </tr>
                </thead>
                <tbody>
					<%
					con = dbcon.createConnection();
					query1 = "select * from Product where product_type = 'veg'";
					st1 = con.createStatement();
					rs1=st1.executeQuery(query1);
					while (rs1.next()) {
						String pid = rs1.getString("Product_ID");
						String pname = rs1.getString("Product_Name");
						
					%>	
					<tr>
						<td><a href="#">Product Id = <%=pid %></a></td>
						<td><%=pname %></td>	
						 <td class="col-sm-1 col-md-1">
	                        <a href="edit_product.jsp?pid=<%=pid %>" class="btn btn-warning">Edit</a>
	                     </td>		
					</tr>
					
					</tbody>
					<%		
					}
					%>
					
            </table>
        </div>
    </div>
   </div>
   
   <div class = "tab-pane fade" id = "fruit">
      <h4>Fruit List :</h4>
      <hr>
      <div class="row">
        <div class="col-sm-12 col-md-10 col-md-offset-1">
            <table class="table table-hover">
                <thead>
                    <tr>
                        <th>Product ID</th>
                        <th>Product Name</th>
                    </tr>
                </thead>
                <tbody>
					<%
					con = dbcon.createConnection();
					query1 = "select * from Product where product_type = 'fruit'";
					st1 = con.createStatement();
					rs1=st1.executeQuery(query1);
					while (rs1.next()) {
						String pid = rs1.getString("Product_ID");
						String pname = rs1.getString("Product_Name");
						
					%>	
					<tr>
						<td><a href="#">Product Id = <%=pid %></a></td>
						<td><%=pname %></td>	
						 <td class="col-sm-1 col-md-1">
	                        <a href="edit_product.jsp?pid=<%=pid %>" class="btn btn-warning">Edit</a>
	                     </td>		
					</tr>
					
					</tbody>
					<%		
					}
					%>
					
            </table>
        </div>
    </div>
      
   </div>
   
   <div class = "tab-pane fade" id = "dairy">
      <h4>Dairy Product list :</h4>
      <hr>
      <div class="row">
        <div class="col-sm-12 col-md-10 col-md-offset-1">
            <table class="table table-hover">
                <thead>
                    <tr>
                        <th>Product ID</th>
                        <th>Product Name</th>
                    </tr>
                </thead>
                <tbody>
					<%
					con = dbcon.createConnection();
					query1 = "select * from Product where product_type = 'dairy'";
					st1 = con.createStatement();
					rs1=st1.executeQuery(query1);
					while (rs1.next()) {
						String pid = rs1.getString("Product_ID");
						String pname = rs1.getString("Product_Name");
						
					%>	
					<tr>
						<td><a href="#">Product Id = <%=pid %></a></td>
						<td><%=pname %></td>	
						 <td class="col-sm-1 col-md-1">
	                        <a href="edit_product.jsp?pid=<%=pid %>" class="btn btn-warning">Edit</a>
	                     </td>		
					</tr>
					
					</tbody>
					<%		
					}
					%>
					
            </table>
        </div>
    </div>
      
   </div>
</div>
</div>

<script type="text/javascript">
function change_status(orderid,status){
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
				alert("success" +msg);
				location.reload(); 
			}
		};	
		xmlhttp.open("GET", "change_order_status.jsp", true);
		xmlhttp.send();
}
</script>
</body>
</html>
