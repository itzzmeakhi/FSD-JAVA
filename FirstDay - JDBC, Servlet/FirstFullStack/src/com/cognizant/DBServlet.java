package com.cognizant;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
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
 * Servlet implementation class DBServlet
 */
@WebServlet("/DBServlet")
public class DBServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DBServlet() {
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
			
			// Loading and Registering Driver - Step 1
			
			Class.forName("com.mysql.jdbc.Driver");
			
			
			//System.out.println("Enter the Schema");
			//BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
			//String schema = br.readLine();
			
			// Establishing Connection - Step 2
			
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/dhanush", "root", "root");
			
			// Executing Queries
			
			Statement stmt = con.createStatement();
			//stmt.executeUpdate("INSERT INTO user VALUES(22, 'akhi', 'akhil@yahoo.com')");
			//System.out.println("Enter the Database Name");
			//String db = br.readLine();
			
			ResultSet rs =  stmt.executeQuery("SELECT * FROM user");
			
			ResultSetMetaData rsmd = rs.getMetaData();
			
			int no = rsmd.getColumnCount();
			
			// Processing the result set
			
			out.println("<table border = '1 solid'>");
			out.print("<tr>");
			
			for(int iter = 1; iter <= no; iter++) {
			
				out.print("<th>"+rsmd.getColumnName(iter)+" </th>");
			}
			
			out.println("</tr><br>");
			
			while(rs.next()) {
				
				out.print("<tr>");
				
				for(int iter = 1; iter <= no; iter++) {
					out.print("<td>"+rs.getString(iter)+" </td>");
				}
				out.print("</tr><br>");
				//System.out.println(rs.getInt(1)+" "+rs.getString(2)+" "+rs.getString(3));
			}
			
			//Close the resources
			
			rs.close();
			stmt.close();
			con.close();
			
			
		} catch (Exception e) {
			out.println(e.getMessage());;
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
