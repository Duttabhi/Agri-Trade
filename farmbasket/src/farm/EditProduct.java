package farm;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import databaseconnection.JDBCMySQLConnection;

/**
 * Servlet implementation class EditProduct
 */
@WebServlet("/EditProduct")
public class EditProduct extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EditProduct() {
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
		Connection conn = null;
		
		String product_id = request.getParameter("product_id");
		String product_name = request.getParameter("product_name");
		String product_description = request.getParameter("product_description");
		String quantity = request.getParameter("quantity");
		Double unit_price = Double.parseDouble(request.getParameter("unit_price"));
		//String imgfile = request.getParameter("filebutton");
		
		int current_stock = 0;
		int new_stock =0;
		
		PrintWriter out = response.getWriter();
		JDBCMySQLConnection dbconn = new JDBCMySQLConnection();
		conn = dbconn.createConnection();
		
		PreparedStatement st = null;
		try {
			st = conn.prepareStatement("select Total_Stock from Product where Product_ID=?");
			st.setString(1,product_id);
			ResultSet rs=st.executeQuery();
			while (rs.next()){
				current_stock = rs.getInt("Total_Stock");
				new_stock = current_stock + Integer.parseInt(quantity);
				//quantity = String.valueOf(new_stock);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		try {
			boolean flag = false;
			flag = updateproduct(conn,product_id,product_name,product_description,new_stock ,unit_price,request);	
			if(flag == false){
				System.out.println("product update error");
				response.sendRedirect("jsp/edit_product.jsp?pid="+product_id);
				out.print("0");
				out.close();
			}
			else{
				System.out.println("product updated");
				response.sendRedirect("jsp/v_product_list.jsp");
			}
		}
		catch (Exception ex) {
			ex.printStackTrace();
		}finally{
			if(conn!=null)dbconn.closeLocalConnection(conn);
		}	
		
	}

	private boolean updateproduct(Connection conn, String product_id,String product_name, String product_description, int quantity,
			Double unit_price, HttpServletRequest request) {
		PreparedStatement st = null;
		int rs = 0;
		try
		{
			String query = "Update Product "
					+ "set Product_Name=?, Product_Desc=?, Total_Stock=?, Unit_Price=? where product_ID =?";
			st = conn.prepareStatement(query);
			st.setString(1,product_name);
			st.setString(2,product_description);
			st.setInt(3,quantity);
			st.setDouble(4,unit_price);
			st.setString(5,product_id);
			rs = st.executeUpdate();
			if(rs !=0){
				System.out.println("product updated successfully");
				return true;
			}
		}
		catch (Exception ex){
			System.out.println(ex);
		}
		return false;
	}

}
