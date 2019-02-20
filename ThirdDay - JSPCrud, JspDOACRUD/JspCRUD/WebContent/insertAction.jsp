
<%@page import="java.sql.Date"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert Action Page</title>
</head>
<body>

<%

try {

	Class.forName("com.mysql.jdbc.Driver");
	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/flight", "root", "root");
	
	String insertQuery = "INSERT INTO air_flight_details VALUES (?, ?, ?, ?)";
	
	int flight_id = Integer.parseInt(request.getParameter("flight_id"));
	
	//Date date = new SimpleDateFormat("yyyy-MM-dd").parse(request.getParameter("flight_dep_date"));
	
	//dep_date = new Date(request.getParameter("flight_dep_date"));
	
	//String date = request.getParameter("flight_id");
	
	String flight_dep_date = request.getParameter("flight_dep_date");
	
	Date date = Date.valueOf(flight_dep_date);
	
	
	Float price = Float.parseFloat(request.getParameter("flight_price"));
	
	int seats = Integer.parseInt(request.getParameter("flight_seats"));
	
	PreparedStatement pstmt = con.prepareStatement(insertQuery);
	
	//out.println(flight_id);
	//out.println(date);
	//out.println(price);
	//out.println(seats);
	
	pstmt.setInt(1, flight_id);
	pstmt.setDate(2, date);
	pstmt.setFloat(3, price);
	pstmt.setInt(4, seats);
	
	int insertStatus = 0;
	
	insertStatus = pstmt.executeUpdate();
	
	if(insertStatus == 0) {
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