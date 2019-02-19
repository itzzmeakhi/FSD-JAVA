package com.cognizant;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class AddTable
 */
@WebServlet("/AddTable")
public class AddTable extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddTable() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		
		PrintWriter out = response.getWriter();
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
			
			String table = request.getParameter("tableName");
			
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/flight", "root", "root");
			
			Statement stmt = con.createStatement();
			

			/*if(stmt.execute("CREATE TABLE "+table +"(id int, name varchar)")) {
				out.println("<h1> Success..! Table is Created");
			} else {
				out.println("Failed to Create");
			}*/
			
			//stmt.execute("CREATE TABLE "+table+"(id int, name varchar)");
			
			stmt.execute("CREATE TABLE "+table+"(name varchar(25),id int(30))"); 
			
		
			
			
		} catch(Exception e) {
			out.println(e.getMessage());
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
