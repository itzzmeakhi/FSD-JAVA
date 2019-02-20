<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSetMetaData"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title> Edit Page </title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">

<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>

</head>
<body>

<h1> Update Details </h1>
<% 

try {

	Class.forName("com.mysql.jdbc.Driver");
	
	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/flight", "root", "root");
	
	Statement stmt = con.createStatement();
	
	String flight_id = request.getParameter("flight_id");
	
	ResultSet rs = stmt.executeQuery("SELECT * FROM air_flight_details WHERE flight_id='"+flight_id+"'");
	
	ResultSetMetaData rsmd = rs.getMetaData();
	
	int columnCount = rsmd.getColumnCount();
	
	
	
	if(rs.next()) {
	
	
	%>

<form action = "editAction.jsp">

<label> FLIGHT ID </label>
<input type = "number" value = "<% out.println(rs.getInt(1)); %>" name = "flight_id" readonly><br>

<label> FLIGHT DEPARTURE DATE </label>
<input type = "date" value = "<% out.println(rs.getDate(2)); %>" name = "update_date"><br>

<label> FLIGHT PRICE </label>
<input type = "number" value = "<% out.println(rs.getInt(3)); %>" name = "update_price"><br>

<label> AVAILABLE SEATS </label>
<input type = "number" value = "<% out.println(rs.getInt(4)); %>" name = "update_seats"><br>

<input type = "submit" value = "Update">


<%  
	}
}catch(Exception e) {
	out.println(e.getMessage());
}


%>



</form>

</body>
</html>