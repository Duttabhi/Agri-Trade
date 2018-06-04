import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;
import java.lang.*;





public class registered_data extends HttpServlet
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
			con=DriverManager.getConnection("jdbc:mysql://localhost:3306/reg1", "root", "1234");
			stat=con.createStatement();	

			res.setContentType("text/html");
			pw=res.getWriter();
		
			String nm=rq.getParameter("nm");
			String email=rq.getParameter("email");
			String gdr=rq.getParameter("gdr");
			String phn=rq.getParameter("phn");

			rs=stat.executeQuery(" select * from registered_students order by S_ID desc ");
			String sid="";
			if(!rs.next())
			{
				sid="S0001";
			}
			else
			{
				
				String sid1=rs.getString("S_ID");
				sid1=sid1.substring(1);//why 2 to 6 it took a lot of time to come to this result.!!!!!!!!!!!!!!!!!!!!!!!!
				int n=Integer.parseInt(sid1);
				n++;
				if(n>=0 && n<10)
					sid="S000" + n;
				else if(n>=10 && n<100)
					sid="S00" + n;
				else if(n>=100 && n<1000)
					sid="S0" + n;
				else if(n>=1000 && n<10000)
					sid="S" + n;
				else
				{
					HttpSession session=rq.getSession();
					pw.println("<center><b>Not registered!!</b>");
					session.invalidate();
					pw.println(" <head><meta http-equiv=refresh content='3;URL=index.html' /></head> ");
				}
			
			}
					


			String qry=" insert into registered_students values('"+ sid +"','" + nm + "','" + email + "','" + gdr + "','" + phn + "')";
        		stat.executeUpdate(qry);				

			HttpSession session=rq.getSession();
			pw.println("<center><b>Registered!!<br>Your id: "+ sid +"</b>");
			session.invalidate();
			pw.println(" <head><meta http-equiv=refresh content='3;URL=index.html' /></head> ");

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