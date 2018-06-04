<%@page import="java.sql.*"%>
<%
String subject=request.getParameter("count");  
 
 try{
 Class.forName("com.mysql.jdbc.Driver").newInstance();  
 Connection connec = DriverManager.getConnection("jdbc:mysql://localhost:3306/school_resource_system","root","1234");  
 Statement stmt = connec.createStatement();  
 ResultSet reslt = stmt.executeQuery("Select topic_id,topic_name from topics where subject_id='"+subject+"' ");
 
 String buffer="<select name='topic' onChange='showResource(this.value)' ><option value='-1'>select</option>";  
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
