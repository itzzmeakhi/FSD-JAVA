package com.akhilreddy;

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
 * Servlet implementation class DisplayTable
 */
@WebServlet("/DisplayTable")
public class DisplayTable extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DisplayTable() {
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
			
			String name = request.getParameter("tname");
			
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/discussionforum", "root", "");
			
			Statement stmt = con.createStatement();
			
			out.println("<head><title> Table Data </title> <link rel=\"stylesheet\" href=\"https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css\" integrity=\"sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T\" crossorigin=\"anonymous\">");
			out.println("<script src=\"https://code.jquery.com/jquery-3.3.1.slim.min.js\" integrity=\"sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo\" crossorigin=\"anonymous\"></script>\n" + 
					"<script src=\"https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js\" integrity=\"sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1\" crossorigin=\"anonymous\"></script>\n" + 
					"<script src=\"https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js\" integrity=\"sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM\" crossorigin=\"anonymous\"></script>");
			
			out.println("<style>"
					+ "h4 { color: #000; text-align: center; background-color: #dcdde1; box-shadow: 10px 10px 14px 0px rgba(0,0,0,0.75);}"
					+ ".table-data { background-color: #dcdde1; padding: 5%;}"
					+ "a:hover {text-decoration: none;}"
					+ "h2 {color: #000;}"
					+ "tr {background-color: #95afc0;}"
					+ "table {box-shadow: 10px 10px 14px 0px rgba(0,0,0,0.75);}"
					+ "</style>");
			
			ResultSet rs = stmt.executeQuery("SELECT * FROM "+name);
			
		
			
			ResultSetMetaData rsmd = rs.getMetaData();
			
			//ResultSet rs1 = rs;
			//ResultSet rs2 = rs;
			
			int columnCount = rsmd.getColumnCount();
			
			out.println("<div class = 'container-fluid table-data'>");
			
			out.println("<h2>"+name.toUpperCase() +"'s Table Data </h2><hr></hr>");
			
			out.print("<table class = 'table'><thead><tr>");
			
			
			for(int iter = 1; iter <= columnCount; iter++) {
				out.print("<th scope = 'col'>"+rsmd.getColumnName(iter)+"</th>");
			}
			
			out.print("</tr></thead><br><tbody>");
			
			rs.first();
			
			while(rs.next()) {
				out.print("<tr>");
				for(int iter = 1; iter <= columnCount; iter++) {
					out.print("<td>"+rs.getString(iter)+"</td>");
				}
				out.print("</tr>");
			}
			out.print("</tbody></table>");
			
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
