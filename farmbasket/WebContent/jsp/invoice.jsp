<%@ page import="farm.Customer" %>
<%@page import="databaseconnection.JDBCMySQLConnection"%>
<%@page import="java.sql.*"%>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Invoice</title>
<!-- Bootstrap Core CSS -->
    <link href="./../css/bootstrap.css" rel="stylesheet">
</head>
<body>
<%@ include file= "customer_menu.jsp" %>
<div class="container">
<a href="home.jsp" class="btn btn-warning"><i class="fa fa-angle-left"></i> Continue Shopping</a>
<%
String cst=(String)session.getAttribute("custid");
int custid = Integer.parseInt(cst);
String custname=(String)session.getAttribute("custname");
int orderid = Integer.parseInt(request.getParameter("oid"));

JDBCMySQLConnection dbcon = new JDBCMySQLConnection();
Connection con = null;
String address = null;
PreparedStatement stmt=null;
ResultSet rset=null;

try
{
con = dbcon.createConnection();
stmt = con.prepareStatement("Select * from Registration where Registration_ID = ?");
stmt.setInt(1,custid);
rset=stmt.executeQuery();
while(rset.next()){
	address = rset.getString("address");
}

}
catch (SQLException e) {
	e.printStackTrace();
}
PreparedStatement st = null, st1 = null, st2 = null;
ResultSet rs = null, rs1 = null, rs2 = null;
Double total = 0.00, un_price = 0.00;
int qty = 0;
String pid = null;
String orderdate= null;

try
{
con = dbcon.createConnection();
st = con.prepareStatement("select * from Order_Product where order_id = ?");
st.setInt(1,orderid);
rs=st.executeQuery();
while(rs.next()){
	orderdate = rs.getString("order_date");
	
	
%>
<div class="row">
        <div class="col-xs-12">
    		<div class="invoice-title">
    			<h2>Invoice</h2><h3 class="pull-right">Order # <%=orderid %>></h3>
    		</div>
    		<hr>
    		<div class="row">
    			<div class="col-xs-6">
    				<address>
    				<strong>Billed To:</strong><br>
    					<%=custname %><br>
    					<%=address %>
    				</address>
    			</div>
    			<!--  <div class="col-xs-6 text-right">
    				<address>
        			<strong>Shipped To:</strong><br>
    					Jane Smith<br>
    					1234 Main<br>
    					Apt. 4B<br>
    					Springfield, ST 54321
    				</address>
    			</div>-->
    		</div>
    		<div class="row">
    			<div class="col-xs-6">
    				<address>
    					<strong>Payment Method:</strong><br>
    					Cash On Delivery
    				</address>
    			</div>
    			<div class="col-xs-6 text-right">
    				<address>
    					<strong>Order Date:</strong><br>
    					<%=orderdate %>><br><br>
    				</address>
    			</div>
    		</div>
    	</div>
    </div>
    <div class="row">
    	<div class="col-md-12">
    		<div class="panel panel-default">
    			<div class="panel-heading">
    				<h3 class="panel-title"><strong>Order summary</strong></h3>
    			</div>
    			<div class="panel-body">
    				<div class="table-responsive">
    					<table class="table table-condensed">
    						<thead>
                                <tr>
        							<td><strong>Item</strong></td>
        							<td class="text-center"><strong>Price</strong></td>
        							<td class="text-center"><strong>Quantity</strong></td>
        							<td class="text-right"><strong>Totals</strong></td>
                                </tr>
    						</thead>
    						<tbody>
    						<% 
    						//fetching all products from cart
    						st1 = (PreparedStatement) con.prepareStatement("SELECT * from Order_Detail where Order_ID = ?");
    						st1.setInt(1,orderid);
    						rs1=st1.executeQuery();	
    						while (rs1.next()) {
    							qty = rs1.getInt("Order_Qty");
    							pid = rs1.getString("Product_ID");
    							un_price=rs1.getDouble("Order_Rate");
    							st2 = (PreparedStatement) con.prepareStatement("SELECT * from Product where Product_ID = ?");
    							st2.setString(1,pid);
    							rs2=st2.executeQuery();
    							while (rs2.next()) {
    								String pname= rs2.getString("Product_Name");
    								
    								total = un_price * qty;
    							%>
    								<!-- foreach ($order->lineItems as $line) or some such thing here -->
	    							<tr>
	    								<td><%=pname %></td>
	    								<td class="text-center"><%=un_price %></td>
	    								<td class="text-center"><%=qty %></td>
	    								<td class="text-right"><%=total %></td>
	    							</tr>
    							<%	
    							}
    						}
    						%>
    						</tbody>
    					</table>
    				</div>
    			</div>
    		</div>
    	</div>
    </div>
<%	
	
}
}
catch (SQLException e) {
	e.printStackTrace();
}
%>
</div>
</body>