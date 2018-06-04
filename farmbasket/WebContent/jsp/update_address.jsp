<%@ page import="farm.Customer" %>
<%@page import="databaseconnection.JDBCMySQLConnection"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
String cst=(String)session.getAttribute("custid");
int custid = Integer.parseInt(cst);

String addr = request.getParameter("addr");
JDBCMySQLConnection dbcon = new JDBCMySQLConnection();
Connection con = null;
PreparedStatement st = null;
ResultSet rs = null;
try
{
con = dbcon.createConnection();
st = con.prepareStatement("update Registration set address = ? where Registration_ID = ? " );
st.setString(1,addr);
st.setInt(2,custid);
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
%>