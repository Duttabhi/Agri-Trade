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
<% 
String cst=(String)session.getAttribute("custid");
int custid = Integer.parseInt(cst);
String custname=(String)session.getAttribute("custname");

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




Calendar cal = Calendar.getInstance();
String ordertime = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(cal.getTime());

PreparedStatement st = null, st1 = null, st2 = null, st3 = null, st4 = null, st5=null;
ResultSet rs = null, rs1 = null, rs2 = null, rs3 = null, rs4 = null,rs5=null;
int orderid = 0, qty = 0;
Double total = 0.00, un_price = 0.00;
String pid = null;
try
{
con = dbcon.createConnection();
st = con.prepareStatement("INSERT INTO Order_Product (cid, order_date, order_status) VALUES (?,?,?)",Statement.RETURN_GENERATED_KEYS);
st.setInt(1,custid);
st.setString(2,ordertime);
String order = "order placed";
st.setString(3,order);
st.executeUpdate();
rs=st.getGeneratedKeys();
if(rs.next()){
	orderid = rs.getInt(1);
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
    					<%=ordertime %>><br><br>
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
    						st1 = (PreparedStatement) con.prepareStatement("SELECT * from Cart where cid = ?");
    						st1.setInt(1,custid);
    						rs1=st1.executeQuery();	
    						while (rs1.next()) {
    							int cartid = rs1.getInt("cart_id");
    							qty = rs1.getInt("p_qty");
    							pid = rs1.getString("pid");
    							st2 = (PreparedStatement) con.prepareStatement("SELECT * from Product where Product_ID = ?");
    							st2.setString(1,pid);
    							rs2=st2.executeQuery();
    							while (rs2.next()) {
    								String pname= rs2.getString("Product_Name");
    								un_price=rs2.getDouble("Unit_Price");
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
    							//update (decrease) product qty
    							int current_stock = rs2.getInt("Total_Stock");
    							int new_stock = current_stock - qty;
    							st5 = con.prepareStatement("update Product set Total_Stock = ? where Product_ID=?");
    							st5.setInt(1,new_stock);
    							st5.setString(2,pid);
    							st5.executeUpdate();
    							
    							}
    							st3 = con.prepareStatement("INSERT INTO Order_Detail (Order_ID,Product_ID,Order_Rate,Order_Qty) VALUES (?,?,?,?)",Statement.RETURN_GENERATED_KEYS );
    							st3.setInt(1,orderid);
    							st3.setString(2,pid);
    							st3.setDouble(3,un_price);
    							st3.setInt(4,qty);
    							st3.executeUpdate();
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
else {
	throw new RuntimeException("PIB, can't find most recent insert we just entered");
}
//delete entries from cart
st4 = con.prepareStatement("DELETE from Cart where cid = ?");
st4.setInt(1,custid);
st4.executeUpdate();	

}
catch (SQLException e) {
	e.printStackTrace();
}
finally{
	try {
		if(rs!=null)rs.close();
		if(st!=null)st.close();
		if(rs1!=null)rs1.close();
		if(st1!=null)st1.close();
		if(rs2!=null)rs2.close();
		if(st2!=null)st2.close();
		if(rs3!=null)rs3.close();
		if(st3!=null)st3.close();
		if(rs4!=null)rs4.close();
		if(st4!=null)st4.close();
		if(con!=null)dbcon.closeLocalConnection(con);
	} catch (SQLException e) {
		e.printStackTrace();
	}
	
}
%>
</div>
</body>