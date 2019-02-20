<%@page import="java.sql.ResultSetMetaData"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" errorPage="error.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Read Page</title>

<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">

<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
<style>

a {
color: #fff;
text-decoration: none;
}

a: hover {
color: #fff;
text-decoration: none;
}



</style>
</head>
<body>

<h1 align = "center"> Table Contents </h1>


<!-- Connection -->

<%

try {

	Class.forName("com.mysql.jdbc.Driver");
	
	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/flight", "root", "root");
	
	Statement stmt = con.createStatement();
	
	ResultSet rs = stmt.executeQuery("SELECT * FROM air_flight_details");
	
	ResultSetMetaData rsmd = rs.getMetaData();
	
	int columnCount = rsmd.getColumnCount();
	
	
	%>
	
	<table class = "table table-dark">
	
		<thead>
			<tr>
				
	
	
	<%
	
	
	for(int iter = 1; iter <= columnCount; iter++) {
		out.println("<th>");
		
		out.println(rsmd.getColumnName(iter).toUpperCase());
		
		out.println("</th>");
	
	}
	
	out.println("<th> ACTIONS </th>");
	
	%>
	
			</tr>
		</thead>
		<tbody>
	
	<%
	
	
		
	while(rs.next()) {
	
		out.println("<tr>");
		
		for(int iter = 1; iter <= columnCount; iter++) {
		
			out.println("<td>");
			out.println(rs.getString(iter));
			out.println("</td>");
		
		
		}
		
		out.println("<td>");
	
	
	
	%>
	
	<a href = "edit.jsp?flight_id=<%= rs.getString(1) %>"> Edit </a> | 
	<a href = "delete.jsp?flight_id=<%= rs.getString(1) %>"> Delete </a> 
	
	<%
	
		out.println("</td>");
		out.println("</tr>");
	
	}
	
	out.println("</tbody> </table>");
	
	
	} catch(Exception e) {
		out.println(e.getMessage());
	}
	
	
	%>
	


	
	
	
	

</body>
</html>