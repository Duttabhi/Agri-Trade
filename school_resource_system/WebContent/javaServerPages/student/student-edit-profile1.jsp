<%@include file = "connection.jsp"%>
<%
String uid=request.getParameter("uid");
Integer id=Integer.parseInt(uid);
rs=stat.executeQuery("Select * from user where userid = " + id + " ");

if(rs.next())
{
	String s1=rs.getString("first_name");
	String s2=rs.getString("last_name");
	String s3=rs.getString("email");
	String s4=rs.getString("user_name");
%>
	
<meta http-equiv=refresh content="2;URL=student-edit-profile2.jsp?fnm=<%=s1%>&lnm=<%=s2%>&eml=<%=s3%>&usr=<%=s4%>" />

<%
}	
%>

