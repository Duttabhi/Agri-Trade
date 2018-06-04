import java.io.*;

import javax.servlet.*;
import javax.servlet.http.*;

import java.sql.*;
import java.time.LocalDateTime;





public class registration extends HttpServlet
{
	
	private static final long serialVersionUID = 1L;
	PrintWriter pw;
	public void doGet(HttpServletRequest rq, HttpServletResponse res) throws IOException, ServletException
	{
		try
		{
			Connection con;
			Statement stat;
			ResultSet rs;
			Class.forName("com.mysql.jdbc.Driver");
			con=DriverManager.getConnection("jdbc:mysql://localhost:3306/school_resource_system", "root", "1234");
			stat=con.createStatement();	

			res.setContentType("text/html");
			pw=res.getWriter();
		
			String fnm=rq.getParameter("frst-nm");
			String lnm=rq.getParameter("lst-nm");
			String eml=rq.getParameter("email");
			String unm=rq.getParameter("usr-nm");
			String psw=rq.getParameter("psw");

		rs=stat.executeQuery(" select * from user where email='" + eml + "' or user_name='" + unm + "' ");
String qry="";
HttpSession session=rq.getSession();

if(rs.next())
{
	pw.println("<center><b>Email or user name already exist!! Refill");
	session.invalidate();
	pw.println("<head><meta http-equiv=refresh content='3;URL=javaServerPages/signup.jsp?s1="+fnm+"&s2="+lnm+" '/></head>");
}

			else{
				int actv=1;
				 LocalDateTime regDate = LocalDateTime.now(); 
qry="insert into user(first_name,last_name,email,user_name,password,active,creation_date) values('"+fnm+"','"+lnm+"','"+eml+"','"+unm+"','"+psw+"',"+actv+",'"+ regDate +"') ";
System.out.println("NNNNNNNNNNNNNNNNNNNNNNNN");        		
stat.executeUpdate(qry);				

			pw.println("<center><b>Registered!!");
			session.invalidate();
			
			pw.println(" <head><meta http-equiv=refresh content='3;URL=index.html' /></head> ");
			}

		}
		catch(Exception e)
		{
			System.out.println(e);
		}
	}

	public void doPost(HttpServletRequest rq, HttpServletResponse res) throws ServletException, IOException 
	{
   	   	doGet(rq,res);//inside doPost() we are again declaring doGet() with the parameters rq,rs.
   	}
}
