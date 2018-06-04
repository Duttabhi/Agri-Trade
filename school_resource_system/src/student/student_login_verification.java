package student;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;
import java.lang.*;





public class student_login_verification extends HttpServlet
{


	
	PrintWriter pw;
	public void doGet(HttpServletRequest rq, HttpServletResponse res) throws IOException, ServletException
	{
	try
	{
		Connection con;
		Statement stat;
		ResultSet rs;
		ResultSetMetaData md;

		Class.forName("com.mysql.jdbc.Driver");
		con=DriverManager.getConnection("jdbc:mysql://localhost:3306/school_resource_system", "root", "1234");
		stat=con.createStatement();	

		res.setContentType("text/html");
		pw=res.getWriter();
		HttpSession session=rq.getSession();  

		
		String u_nm=rq.getParameter("u_nm");
		String pass=rq.getParameter("pass");
		rs=stat.executeQuery(" select userid,user_name,password from user where user_name='" + u_nm + "' and password='" + pass + "' ");
		if(rs.next())
		{
			    Integer u_id=rs.getInt("userid");
				session.setAttribute("unm",u_nm);
				session.setAttribute("uid",u_id);
				res.sendRedirect("javaServerPages/student/student-home.jsp");
		}
		else
		{
				session.invalidate();
				pw.println(" <head><meta http-equiv=refresh content='3;URL=javaServerPages/student/login1.jsp?abc=inv' /></head> ");		
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
