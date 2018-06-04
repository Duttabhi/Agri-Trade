<%@ page import="farm.Customer" %>
<%@page import="databaseconnection.JDBCMySQLConnection"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
String custid=(String)session.getAttribute("custid");
String pid = request.getParameter("pid");
JDBCMySQLConnection dbcon = new JDBCMySQLConnection();
Connection con = null;
PreparedStatement st = null;
ResultSet rs = null;
try
{
con = dbcon.createConnection();
st = con.prepareStatement("INSERT INTO Cart (cid,pid,p_qty) VALUES (?,?,?)",Statement.RETURN_GENERATED_KEYS );
st.setString(1,custid);
st.setString(2,pid);
st.setInt(3,1);
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
out.print("Item added to cart");
%>