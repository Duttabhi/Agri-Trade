package farm;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import databaseconnection.JDBCMySQLConnection;

/**
 * Servlet implementation class Login
 */
@WebServlet("/Login")
public class Login extends HttpServlet {
	public boolean checklogin(Connection conn, String username,String password, HttpServletRequest request) 
	{
		HttpSession session = request.getSession(true);
		String DBUsername, DBPassword , fname , lname , ctid , reg_type;
		int rid , uid;
		ResultSet rs;
		try
		{
			Statement stmt;
			stmt = conn.createStatement();
			rs = stmt.executeQuery("Select * from Login where username = '"+ username + "'");
			if (rs.next()) {
				DBUsername = rs.getString("username");
				DBPassword = rs.getString("password");
				rid = rs.getInt("regid");
				if (DBUsername.equals(username) && DBPassword.equals(password) && !password.equals("")) 
				{
					try
					{
					rs = stmt.executeQuery("Select * from Registration where Registration_Email = '"+ username + "' and Registration_ID =" +rid);
					if (rs.next()) 
					{
						uid = rs.getInt("Registration_ID");
						reg_type = rs.getString("Registration_Type");
						fname = rs.getString("Registration_first_name");
						lname = rs.getString("Registration_last_name");
						ctid=String.valueOf(uid);
						session.setAttribute("custid",ctid);
						session.setAttribute("custname",fname);
						
						System.out.println(reg_type);
						if (reg_type.equals("C")){
							session.setAttribute("user_type", "C");
							Customer c = new Customer();
							c.setcustomer(uid, fname, lname);
							System.out.println("hello "+c.getcfname());
						}
						else if(reg_type.equals("V")){
							session.setAttribute("user_type", "V");
						}
					}
					return true;
					}
					catch (Exception ex){
						System.out.println(ex);
					}
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}
		return false;	
	}
	
	
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Login() {
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
		HttpSession session = request.getSession(true);
		Connection conn = null;
		String username = request.getParameter("id_username");
		System.out.println("username is :"+username);
		String password = request.getParameter("id_password");
		System.out.println("password is :"+password);
		
		PrintWriter out = response.getWriter();
		JDBCMySQLConnection dbconn = new JDBCMySQLConnection();
		conn = dbconn.createConnection();	
		try {
			boolean flag = false;
			flag = checklogin(conn,username,password, request);	
			if(flag == false){
				System.out.println("invalid user");
				response.sendRedirect("jsp/login.jsp");
				out.print("0");
			}
			else{
				out.print("1");
				System.out.println("successfully logged in");
				String user=(String)session.getAttribute("user_type");
				if (user.equals("C"))
				{
					response.sendRedirect("jsp/home.jsp");
				}
				else if (user.equals("V")){
					response.sendRedirect("jsp/v_home.jsp");
				}
			}
		}
		catch (Exception ex) {
			ex.printStackTrace();
		}finally{
			if(conn!=null)dbconn.closeLocalConnection(conn);
		}	
			
		
	}

}
