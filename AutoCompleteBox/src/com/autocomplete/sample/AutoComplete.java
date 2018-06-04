package com.autocomplete.sample;

import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;

import com.DataSource.mysql.DataSource;

/**
 * Servlet implementation class AutoComplete
 */

public class AutoComplete extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public AutoComplete() {
        super();

    }
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ArrayList<String> al=new ArrayList<String>();
		try{
	     Connection conn=DataSource.getConnection();
	     Statement stmt=conn.createStatement();
	     String sql="select topic_name from topics";
	     ResultSet rs = stmt.executeQuery(sql);
	     while(rs.next()){
	    	 al.add(rs.getString("topic_name"));
	     }
	     rs.close();
	     stmt.close();
	     conn.close();
		}catch(Exception e){
			e.printStackTrace();
		}
		 JSONArray json=new JSONArray(al);
		 response.setContentType("application/json");
	        response.getWriter().print(json);
	}   
}
