<%@page import="java.sql.ResultSetMetaData"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title> Tables Information</title>
</head>
<body>


<%

	
	
	try {
		
		// Loading and Registering Driver 
		
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
































%>

















</body>
</html>