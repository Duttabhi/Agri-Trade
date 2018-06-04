package farm;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import databaseconnection.JDBCMySQLConnection;

/**
 * Servlet implementation class AddFarmer
 */
@WebServlet("/AddFarmer")
public class AddFarmer extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddFarmer() {
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
		String farmer_fname = request.getParameter("farmer_fname");
		String farmer_lname = request.getParameter("farmer_lname");
		String farmer_email = request.getParameter("farmer_email");
		String farmer_phone = request.getParameter("farmer_phone");
		String farmer_address = request.getParameter("farmer_address");
		System.out.println(farmer_address);
		if (farmer_address == null){
			farmer_address = "Not Available";
		}
		System.out.println(farmer_address);
		
		JDBCMySQLConnection dbconn = new JDBCMySQLConnection();
		conn = dbconn.createConnection();
		
		try {
			boolean flag = false;
			flag = addfarmer(conn, farmer_fname, farmer_lname, farmer_email, farmer_phone, farmer_address, request);	
			if(flag == false){
				System.out.println("farmer insert error");
				response.sendRedirect("jsp/v_add_farmer.jsp");
			}
			else{
				System.out.println("added new farmer");
				response.sendRedirect("jsp/v_home.jsp");
			}
		}
		catch (Exception ex) {
			ex.printStackTrace();
		}finally{
			if(conn!=null)dbconn.closeLocalConnection(conn);
		}	
		
		
	}

	private boolean addfarmer(Connection conn, String farmer_fname,	String farmer_lname, String farmer_email, String farmer_phone, String address,
			HttpServletRequest request) {
		// TODO Auto-generated method stub
		PreparedStatement st = null;
		int rs = 0;
		try
		{
			st = conn.prepareStatement("INSERT INTO Registration (Registration_first_name, Registration_last_name, Registration_Email, Registration_Phone, address, Registration_Type) VALUES (?,?,?,?,?,?)",Statement.RETURN_GENERATED_KEYS );
			st.setString(1,farmer_fname);
			st.setString(2,farmer_lname);
			st.setString(3,farmer_email);
			st.setString(4,farmer_phone);
			st.setString(5,address);
			st.setString(6,"F");
			
			rs = st.executeUpdate();
			if(rs !=0){
				System.out.println("farmer added successfully");
				return true;
			}
		}
		catch (Exception ex){
			System.out.println(ex);
		}
		
		
		return false;
	}

}
