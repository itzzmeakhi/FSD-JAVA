<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Date"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title> Edit Action Page </title>
</head>
<body>

<% 

try {

	Class.forName("com.mysql.jdbc.Driver");
	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/flight", "root", "root");
	
	String updateQuery = "UPDATE air_flight_details SET flight_departure_date = ?, price = ?, available_seats = ? WHERE flight_id = ?";
	
	int flight_id = Integer.parseInt(request.getParameter("flight_id"));
	
	//Date date = new SimpleDateFormat("yyyy-MM-dd").parse(request.getParameter("flight_dep_date"));
	
	//dep_date = new Date(request.getParameter("flight_dep_date"));
	
	//String date = request.getParameter("flight_id");
	
	String flight_dep_date = request.getParameter("update_date");
	
	Date date = Date.valueOf(flight_dep_date);
	
	
	Float price = Float.parseFloat(request.getParameter("update_price"));
	
	int seats = Integer.parseInt(request.getParameter("update_seats"));
	
	PreparedStatement pstmt = con.prepareStatement(updateQuery);
	
	//out.println(flight_id);
	//out.println(date);
	//out.println(price);
	//out.println(seats);
	
	//pstmt.setInt(1, flight_id);
	pstmt.setDate(1, date);
	pstmt.setFloat(2, price);
	pstmt.setInt(3, seats);
	pstmt.setInt(4, flight_id);
	
	int updateStatus = 0;
	
	updateStatus = pstmt.executeUpdate();
	
	if(updateStatus == 0) {
		out.println("Error Occurred while Inserting into DB");
	} else {
		response.sendRedirect("read.jsp");
	}
	
	
	
} catch (Exception e) {
	out.println(e.getMessage());
}


























%>










</body>
</html>