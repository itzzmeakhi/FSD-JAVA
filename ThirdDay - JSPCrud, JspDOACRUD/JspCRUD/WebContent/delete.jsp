<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title> Delete Page </title>
</head>
<body>

<%

Class.forName("com.mysql.jdbc.Driver");

Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/flight", "root", "root");


Statement stmt = con.createStatement();

String flight_id = request.getParameter("flight_id");

int check = 0;

check = stmt.executeUpdate("DELETE FROM air_flight_details WHERE flight_id='"+flight_id+"'");


if(check == 0) {
	out.println("Error");
} else {
	response.sendRedirect("read.jsp");
}

















%>

</body>
</html>