<%@ page import="farm.Customer" %>
<%@page import="databaseconnection.JDBCMySQLConnection"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
String custid=(String)session.getAttribute("custid");
String crtid = request.getParameter("cartid");
int cartid = Integer.parseInt(crtid);
JDBCMySQLConnection dbcon = new JDBCMySQLConnection();
Connection con = null;
PreparedStatement st = null;
ResultSet rs = null;
try
{
con = dbcon.createConnection();
st = con.prepareStatement("DELETE from Cart where cart_id = ?" );
st.setInt(1,cartid);
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
out.print("Item removed from cart");
%>