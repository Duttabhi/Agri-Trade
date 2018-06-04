package farm;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import databaseconnection.JDBCMySQLConnection;
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;
/**
 * Servlet implementation class Register
 */
@WebServlet("/Register")
public class Register extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Register() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		System.out.println("in servlet");
		Connection conn = null;
		String error = null;
		String customer_fname = request.getParameter("customer_fname");
		String customer_lname = request.getParameter("customer_lname");
		String customer_email = request.getParameter("customer_email");
		String customer_phone = request.getParameter("customer_phone");
		String customer_address = request.getParameter("customer_address");
		String password = request.getParameter("password");
		String retype_password = request.getParameter("retype_password");
		
		JDBCMySQLConnection dbconn = new JDBCMySQLConnection();
		conn = dbconn.createConnection();
		
		PreparedStatement st = null;
		ResultSet rs = null;
		try
		{
			st = conn.prepareStatement("select * from Registration where Registration_Email = ?");
			st.setString(1,customer_email);
			rs = st.executeQuery();
			if(rs.next()){
				error = "Email Id already registerd in the system";
				response.sendRedirect("jsp/register.jsp?error="+error);
			}
			else if(!password.equals( retype_password )){
				error = "Password does not match";
				response.sendRedirect("jsp/register.jsp?error="+error);
			}
			else
			{
				try {
					boolean flag = false;
					flag = addRegister(conn, customer_fname, customer_lname, customer_email, customer_phone, customer_address, password, request,response);	
					if(flag == false){
						System.out.println("registration error");
						response.sendRedirect("jsp/register.jsp");
					}
					else{
						System.out.println("Registerd successfully");
						
						response.sendRedirect("jsp/home.jsp");
					}
				}
				catch (Exception ex) {
					ex.printStackTrace();
				}finally{
					if(conn!=null)dbconn.closeLocalConnection(conn);
				}
			}
		}
		catch (Exception ex){
			System.out.println(ex);
		}
	}

	private boolean addRegister(Connection conn, String customer_fname, String customer_lname, String customer_email,
			String customer_phone, String customer_address, String password,
			HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession(true);
		PrintWriter pw=response.getWriter();
		
		
		PreparedStatement st, st2 = null;
		ResultSet rs = null;
		int regid = 0;
		try
		{
			st = conn.prepareStatement("INSERT INTO Registration (Registration_first_name, Registration_last_name, Registration_Email, Registration_Phone, Registration_Type,address) VALUES (?,?,?,?,?,?)",Statement.RETURN_GENERATED_KEYS );
			st.setString(1,customer_fname);
			st.setString(2,customer_lname);
			st.setString(3,customer_email);
			st.setString(4,customer_phone);
			st.setString(5,"C");
			st.setString(6,customer_address);
			
			st.executeUpdate();
			rs=st.getGeneratedKeys();
			if(rs.next()){
				regid = rs.getInt(1);
				
				st2 = conn.prepareStatement("INSERT INTO Login (regid, username, password) VALUES (?,?,?)",Statement.RETURN_GENERATED_KEYS );
				st2.setInt(1, regid);
				st2.setString(2, customer_email);
				st2.setString(3, password);
				st2.executeUpdate();
				
				session.setAttribute("custid",String.valueOf(regid));
				session.setAttribute("custname",customer_fname);
				session.invalidate();
				
				pw.println("<head><meta http-equiv=refresh content='3;URL=index.html' /></head> ");
				
				return true;
			}
		}
		catch (Exception ex){
			System.out.println(ex);
		}
		
		return false;
	}

}
