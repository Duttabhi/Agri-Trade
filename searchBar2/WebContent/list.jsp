<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.*"%>
 
   <%
   try{
     String s[]=null;
 
     Class.forName("com.mysql.jdbc.Driver");
     Connection con =DriverManager.getConnection("jdbc:mysql://localhost:3306/reg1","root","1234");
     Statement st=con.createStatement();
     ResultSet rs = st.executeQuery("select NAME from emp911");
 
       List<String> li = new ArrayList<String>();
 
       while(rs.next())
       {
           li.add(rs.getString(1));
           System.out.println("ggggg");
       }
 
       String[] str = new String[li.size()];
       Iterator<String> it = li.iterator();
       System.out.println("fffffffff");
       
       int i = 0;
       while(it.hasNext())
       {
           String p = (String)it.next();
           str[i] = p;
           i++;
       }
 
    //jQuery related start
       String query = (String)request.getParameter("q");
 
       int cnt=1;
       for(int j=0;j<str.length;j++)
       {
           if(str[j].toUpperCase().startsWith(query.toUpperCase()))
           {
              out.print(str[j]+"\n");
              if(cnt>=5)// 5=How many results have to show while we are typing(auto suggestions)
              break;
              cnt++;
            }
       }
    //jQuery related end
 
rs.close();
st.close();
con.close();
 
}
catch(Exception e){
e.printStackTrace();
}
 

%>