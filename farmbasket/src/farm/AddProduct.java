package farm;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Iterator;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/*import java.io.File;

import org.apache.commons.fileupload.*;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.io.output.*;*/


import databaseconnection.JDBCMySQLConnection;

/**
 * Servlet implementation class AddProduct
 */
@WebServlet("/AddProduct")
public class AddProduct extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private boolean addproduct(Connection conn, 
			String product_id,String product_name, String product_description,
			String product_categorie, String quantity,Double unit_price,
			String unit, String farmer,HttpServletRequest request) 
	{
		PreparedStatement st = null;
		int rs = 0;
		try
		{
			String query = "INSERT INTO Product "
					+ "(Product_ID, Registration_ID, Product_Name, Product_Desc, Total_Stock, Unit_Price, Unit, product_type) "
					+ "VALUES (?,?,?,?,?,?,?,?)";
			st = conn.prepareStatement(query);
			st.setString(1,product_id);
			st.setString(2,farmer);
			st.setString(3,product_name);
			st.setString(4,product_description);
			st.setString(5,quantity);
			st.setDouble(6,unit_price);
			st.setString(7,unit);
			st.setString(8,product_categorie);
			
			rs = st.executeUpdate();
			if(rs !=0){
				System.out.println("product added successfully");
				return true;
			}
		}
		catch (SQLException ex){
			System.out.println(ex);
		}
		
		
		return false;
	}
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddProduct() {
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
		PrintWriter out = response.getWriter();
		
		String product_id = request.getParameter("product_id");
		String product_name = request.getParameter("product_name");
		String product_description = request.getParameter("product_description");
		String product_categorie = request.getParameter("product_categorie");
		String quantity = request.getParameter("quantity");
		Double unit_price = Double.parseDouble(request.getParameter("unit_price"));
		String unit = request.getParameter("unit");
		String farmer = request.getParameter("farmer");
		//String imgfile = request.getParameter("filebutton");
		
		//file upload code start
		/*try
		{
		String ImageFile="";
		String itemName = "";
		boolean isMultipart = ServletFileUpload.isMultipartContent(request);
		if (!isMultipart)
		{
		}
		else
		{
		FileItemFactory factory = new DiskFileItemFactory();
		ServletFileUpload upload = new ServletFileUpload(factory);
		List items = null;
		try
		{
		items = upload.parseRequest(request);
		}
		catch (FileUploadException e)
		{
		e.getMessage();
		}
		 
		Iterator itr = items.iterator();
		while (itr.hasNext())
		{
		FileItem item = (FileItem) itr.next();
		if (item.isFormField())
		{
		String name = item.getFieldName();
		String value = item.getString();
		if(name.equals("ImageFile"))
		{
		ImageFile=value;
		}
		 
		}
		else
		{
		try
		{
		itemName = item.getName();
		String path = getServletContext().getRealPath("/")+"img/veg/";
		System.out.println(path);
		File savedFile = new File(path+itemName);
		System.out.println(path+itemName);
		item.write(savedFile);
		}
		catch (Exception e)
		{
		out.println("Error"+e.getMessage());
		}
		}
		}
		}
		}
		catch (Exception e){
		out.println(e.getMessage());
		}
		//file upload code ends*/
		
		JDBCMySQLConnection dbconn = new JDBCMySQLConnection();
		conn = dbconn.createConnection();
		
		try {
			boolean flag = false;
			flag = addproduct(conn,product_id,product_name,product_description,product_categorie,quantity,unit_price,unit,farmer,request);	
			if(flag == false){
				System.out.println("product insert error");
				response.sendRedirect("jsp/product_form.jsp");
			}
			else{
				System.out.println("added new product");
				response.sendRedirect("jsp/v_home.jsp");
			}
		}
		catch (Exception ex) {
			ex.printStackTrace();
		}finally{
			if(conn!=null)dbconn.closeLocalConnection(conn);
		}	
		
		
		
	}

}
