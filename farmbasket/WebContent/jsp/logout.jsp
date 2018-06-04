<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%
session.invalidate();
System.out.println("User is Logged out.");
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta http-equiv="Refresh" content="2;url=./../index.html">
<title>Insert title here</title>
</head>
<body>
<h2 style="color:GREEN; text-align:center;">
You have successfully logged out.<br> Thank you
</h2>
</body>
</html>