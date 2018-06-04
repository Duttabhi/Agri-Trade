<%@page import="java.sql.*"%>
<%
String grade=request.getParameter("count");  
 String buffer=" <select name='subject' onChange='showTopic(this.value);'><option value='-1'>select</option> ";  
 try{
 	Class.forName("com.mysql.jdbc.Driver").newInstance();  
 	Connection connec = DriverManager.getConnection("jdbc:mysql://localhost:3306/school_resource_system","root","1234");  
 	Statement stmt = connec.createStatement();  
 	ResultSet reslt = stmt.executeQuery("Select subject_id,subject_name from subject where grade_id='"+grade+"' ");  
   while(reslt.next()){
   buffer=buffer+"<option value='"+reslt.getString(1)+"'>"+reslt.getString(2)+"</option>";  
   }  
 buffer=buffer+"</select>";  
 response.getWriter().println(buffer); 
 }
 catch(Exception e){
     System.out.println(e);
 }

 %>
