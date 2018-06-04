<%@ page import="farm.Customer" %>
<%@page import="databaseconnection.JDBCMySQLConnection"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
   <title>Orders</title>
   <script src="./../js/jquery.js"></script>
   <script src="./../js/bootstrap.min.js"></script>
   
    <link href="./../css/bootstrap.css" rel="stylesheet">
    <link href="./../css/cart.css" rel="stylesheet">
    <style type="text/css">
    body { 
			background-image: url('./../img/myorder.jpg') ;
			background-position: center center;
			background-repeat:  no-repeat;
			background-attachment: fixed;
			background-size:  cover;
			background-color: #999;
  
}
    
    </style>
    
</head>
<% 
String cst=(String)session.getAttribute("custid");
int custid = Integer.parseInt(cst);
JDBCMySQLConnection dbcon = new JDBCMySQLConnection();
Connection con = null;
Statement st1,st2, st3 = null;
ResultSet rs1,rs2, rs3 = null;
String query1, query2, query3=null;
Double total= 0.00;
%>
<body>
<%@ include file= "customer_menu.jsp" %>
<div class="container">
<a href="home.jsp" class="btn btn-warning"><i class="fa fa-angle-left"></i> Continue Shopping</a>
<hr>
      <div class="row">
        <div class="col-sm-12 col-md-10 col-md-offset-1">
            <table class="table table-hover">
                <thead>
                    <tr>
                        <th>Product</th>
                        <th>Quantity</th>
                        <th class="text-center">Price</th>
                        <th class="text-center">Total</th>
                        <th> Order Status</th>
                    </tr>
                </thead>
                <tbody>
					<%
					con = dbcon.createConnection();
					query1 = "select * from Order_Product where cid ="+custid+" order by order_date desc";
					st1 = con.createStatement();
					rs1=st1.executeQuery(query1);
					while (rs1.next()) {
						int orderid = rs1.getInt("order_id");
						String order_status= rs1.getString("order_status");
						
					%>	
					<tr class="warning">
						<td><h4 class="media-heading"><a href="invoice.jsp?oid=<%=orderid%>">Order ID = <%=orderid %></a></h4></td>
						<td></td>
						<td></td>
						<td></td>
						<td>
						<%
						if(order_status.equals("order placed")){
						%>
						<button type="button" class="btn btn-danger" onclick="cancel_order('<%=orderid %>','<%=order_status%>')">
	                    <span class="fa fa-trash-o"></span> Cancel Order
	                    </button>
						<%} %></td>	
					</tr>
					<%
						query2 = "select * from Order_Detail where Order_ID = "+orderid;
						st2 = con.createStatement();
						rs2=st2.executeQuery(query2);
						while (rs2.next()) {
							total = (double)(rs2.getInt("Order_Qty") * rs2.getInt("Order_Rate"));
							
							
							String pid = rs2.getString("Product_ID");
							query3 = "select * from Product where Product_ID = '"+pid +"'";
							st3 = con.createStatement();
							rs3=st3.executeQuery(query3);
							while (rs3.next()) {
								String pname= rs3.getString("Product_Name");
							
							
					%>	
						<tr class="success">
	                        <td class="col-sm-2 col-md-2"><%=rs2.getString("Product_ID") %> <%=pname %></td>
	                        <td class="col-sm-1 col-md-1 text-center"><strong><%=rs2.getInt("Order_Qty")%></strong> 
	                        </td>
	                        <td class="col-sm-1 col-md-1 text-center"><strong><%=rs2.getInt("Order_Rate") %></strong>/ <%=rs3.getString("Unit") %></td>
	                        <td class="col-sm-1 col-md-1 text-center"><strong><%=total %></strong></td>
	                        <td class="col-sm-1 col-md-1 text-center"><strong><%=order_status  %></strong></td>
                    </tr>
					</tbody>
					<%		}
						}
					}
					%>
					
            </table>
        </div>
    </div>
</div>

<script type="text/javascript">
function cancel_order(orderid,status){
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
		xmlhttp.open("GET", "cancel_order.jsp?orderid="+orderid+"&status="+status, true);
		xmlhttp.send();
}
</script>
</body>
</html>
