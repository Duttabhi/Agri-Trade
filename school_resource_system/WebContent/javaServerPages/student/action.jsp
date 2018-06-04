<%@page import="java.sql.*"%>

<%
String s=request.getParameter("id");
	if(s!="")
	{
		 try
		 {
			 Class.forName("com.mysql.jdbc.Driver").newInstance();  
			 Connection connec = DriverManager.getConnection("jdbc:mysql://localhost:3306/reg1","root","1234");  
			 Statement stmtnt = connec.createStatement();  
			 ResultSet reslt = stmtnt.executeQuery("Select link from topic where topicid='"+s+"' ");  
			 while(reslt.next())
			 {
				   String linkStr=reslt.getString(1);
				   response.sendRedirect("+s+");
			  }
		  }  
			 
			 catch(Exception e)
		     {
			     System.out.println(e);
		     }
	}	 
		
		
%>
