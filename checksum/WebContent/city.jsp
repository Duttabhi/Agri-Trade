<%@page import="java.sql.*"%>
<%
String state=request.getParameter("count");  
 String buffer="<select name='city'><option value='-1'>Select</option>";  
 try{
 Class.forName("com.mysql.jdbc.Driver").newInstance();  
 Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/reg1","root","1234");  
 Statement stmt = con.createStatement();  
 ResultSet rs = stmt.executeQuery("Select * from city where stateid='"+state+"' ");  
   while(rs.next()){
   buffer=buffer+"<option value='"+rs.getString(2)+"'>"+rs.getString(3)+"</option>";  
   }  
 buffer=buffer+"</select>";  
 response.getWriter().println(buffer); 
 }
 catch(Exception e){
     System.out.println(e);
 }
 %>
