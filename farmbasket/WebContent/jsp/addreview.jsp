<%@ page import="farm.Customer" %>
<%@page import="databaseconnection.JDBCMySQLConnection"%>
<%@page import="java.sql.*"%>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
String custid=(String)session.getAttribute("custid");
String pid = request.getParameter("pid");
String review = request.getParameter("review");
System.out.println(review);
Calendar cal = Calendar.getInstance();
String rtime = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(cal.getTime());

JDBCMySQLConnection dbcon = new JDBCMySQLConnection();
Connection con = null;
PreparedStatement st = null;
int rs = 0;
try
{
con = dbcon.createConnection();
st = con.prepareStatement("INSERT INTO Reviews (regid,pid,review,date) VALUES (?,?,?,?)",Statement.RETURN_GENERATED_KEYS );
st.setString(1,custid);
st.setString(2,pid);
st.setString(3,review);
st.setString(4,rtime);
rs = st.executeUpdate();
if (rs != 0){
	out.print("Thank you for your valuable feedback.");
}
else{
	out.print("Something went wrong kindly add your review again.");
}
}
catch (SQLException e) {
	e.printStackTrace();
	out.print("Something went wrong kindly add your review again.");
}finally{
	try {
		if(st!=null)st.close();
		if(con!=null)dbcon.closeLocalConnection(con);
	} catch (SQLException e) {
		e.printStackTrace();
	}
	
}
%>