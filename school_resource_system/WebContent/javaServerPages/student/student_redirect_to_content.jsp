<%@ include file="connection.jsp"%>
<%
String val=request.getParameter("val");
rs=stat.executeQuery("SELECT resources_type_id from resources where resources_id='" + val + "' ");
System.out.println("KKKKKKKKKKK");//A check statement
String resourceType="";
if(rs.next()){
	resourceType=rs.getString("resources_type_id");
	System.out.println(resourceType);
}

System.out.println("ooooooooooooooo");
if(resourceType.equals("1")){
	rs=stat.executeQuery("SELECT mindmapcontent,description from mindmap where resources_id='" + val + "' ");
	System.out.println("rrrrrrrrrrrrrrrrrr");
	out.println("<table>");
	String mlstr="";
	String mdstr="";
	while(rs.next()){
		mlstr=rs.getString("mindmapcontent");
		mdstr=rs.getString("description");
		System.out.println("qqqqqqqqqqqqqqqqqqqqqqqqq");	
	out.println("<tr><td><a href=" +mlstr+  " target='_blank'>" +mdstr+ "</a></td></tr>");
	}
	out.println("</table>");
}
System.out.println("jjjjjjjjjjjjjjj");



%>
