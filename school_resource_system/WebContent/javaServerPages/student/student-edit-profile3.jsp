<%@ include file="connection.jsp"%>

<%

String fnm=request.getParameter("fnm");
String lnm=request.getParameter("lnm");
String eml=request.getParameter("email");
String unm=request.getParameter("unm");


String qry="UPDATE user set first_name='" + fnm + "' , last_name='" + lnm + "' , email= '"+ eml +"', user_name='"+ unm +"' ";

stat.executeUpdate(qry);
out.println("Updated successfully...");

session.invalidate();
%>
<meta http-equiv=refresh content="2;URL=login1.jsp" />
</head>

