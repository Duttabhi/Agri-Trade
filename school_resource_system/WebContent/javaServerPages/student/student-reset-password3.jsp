<%@ include file="connection.jsp"%>

<%String pass=request.getParameter("new-pass");
String qry="UPDATE user set password='" + pass + "'";
stat.executeUpdate(qry);
out.println("Updated successfully...");

session.invalidate();
%>
<meta http-equiv=refresh content="2;URL=login1.jsp" />
</head>
