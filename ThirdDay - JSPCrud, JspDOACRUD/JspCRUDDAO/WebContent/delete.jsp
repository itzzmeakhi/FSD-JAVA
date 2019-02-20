<%@page import="com.cognizant.dao.UserDao"%>
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
	UserDao userDao = new UserDao();
	int status = 0;
	
	status = userDao.delete(Integer.parseInt(request.getParameter("user_id")));
	
	if(status == 0) {
		out.println("Error While Deleting the Record");
	} else {
		response.sendRedirect("read.jsp");
	}








%>

</body>
</html>