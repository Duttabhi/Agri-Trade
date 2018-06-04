<%@ include file="connection.jsp"%>
<form method=get action=student-reset-password3.jsp>
<p>&nbsp</p>
<p>&nbsp</p>
<p>&nbsp</p>
<center>
<%
String email=request.getParameter("email");

rs=stat.executeQuery("Select password from user where email='" + email + "' ");
if(rs.next())
{
	out.println("You have registered account...");
%>
<a href=login1.jsp>Re-login</a>
<p>&nbsp</p>
<p>Want to enter new password? <input type=password placeholder='New password.' name=new-pass></p>
<button type=submit>Submit</button>
<p>&nbsp</p>
&copy;Abhishek-2017	
<% 	

}
else
{
	out.println("No entry in the database!!");
	session.invalidate();
%>
	<head>
	<meta http-equiv=refresh content="3;URL=login1.jsp" />
	</head>
<%	
}
%>	

