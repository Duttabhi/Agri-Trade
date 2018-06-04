<%@ page import="farm.Customer" %>
<%@page import="databaseconnection.JDBCMySQLConnection"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
String custid=(String)session.getAttribute("custid");
int orderid = Integer.parseInt(request.getParameter("orderid"));
String status = request.getParameter("status");
String new_status = null;
JDBCMySQLConnection dbcon = new JDBCMySQLConnection();
Connection con = null;
PreparedStatement st = null;
ResultSet rs = null;

if (status.equals("order placed")){
	new_status = "shipped";
}
else{
	new_status = "delivered";
}

try
{
con = dbcon.createConnection();
st = con.prepareStatement("Delete from Order_Detail where Order_ID = ?");
st.setInt(1,orderid);
st.executeUpdate();

st = con.prepareStatement("Delete from Order_Product where order_id = ?");
st.setInt(1,orderid);
st.executeUpdate();
}
catch (SQLException e) {
	e.printStackTrace();
}finally{
	try {
		if(rs!=null)rs.close();
		if(st!=null)st.close();
		if(con!=null)dbcon.closeLocalConnection(con);
	} catch (SQLException e) {
		e.printStackTrace();
	}
	
}
out.print("Order cancelled !");
%>