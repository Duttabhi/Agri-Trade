<%@page import="java.sql.*"%>
<%
String topic=request.getParameter("count");  
 String buffer="<select name='resource'><option value='-1'>select</option>";  
 try{
 Class.forName("com.mysql.jdbc.Driver").newInstance();  
 Connection connec = DriverManager.getConnection("jdbc:mysql://localhost:3306/school_resource_system","root","1234");  
 Statement stmt = connec.createStatement();  
 ResultSet reslt = stmt.executeQuery("select resources.resources_id,resources_type_name from resources INNER JOIN resources_type ON resources.resources_type_id=resources_type.resources_type_id where resources.topic_id='"+ topic +"' ");

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

