<%@ page import="farm.Customer" %>
<%@page import="databaseconnection.JDBCMySQLConnection"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
String custid=(String)session.getAttribute("custid");
int crtid = Integer.parseInt(request.getParameter("cartid"));
int qty = Integer.parseInt(request.getParameter("qty"));
String pid = request.getParameter("pid");

JDBCMySQLConnection dbcon = new JDBCMySQLConnection();
Connection con = null;
PreparedStatement st=null,st1 = null;
ResultSet rs=null,rs1 = null;
int stock_avail = 0;
try
{
con = dbcon.createConnection();
st1 = con.prepareStatement("Select Total_Stock from Product where Product_ID = ?");
st1.setString(1,pid);
rs1=st1.executeQuery();
while(rs1.next()){
	stock_avail = rs1.getInt("Total_Stock");
}
if(stock_avail < qty){
	out.print("Stock not available");
}
else{
	System.out.println("in else loop");
	st = con.prepareStatement("UPDATE Cart SET p_qty = ? where cart_id = ?");
	st.setInt(1,qty);
	st.setInt(2,crtid);
	st.executeUpdate();
}

}
catch (SQLException e) {
	e.printStackTrace();
}finally{
	try {
		if(rs!=null)rs.close();
		if(st!=null)st.close();
		if(rs1!=null)rs1.close();
		if(st1!=null)st1.close();
		if(con!=null)dbcon.closeLocalConnection(con);
	} catch (SQLException e) {
		e.printStackTrace();
	}
	
}
%>