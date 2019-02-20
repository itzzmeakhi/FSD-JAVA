<%@page import="com.cognizant.UserBean"%>
<%@page import="com.cognizant.dao.UserDao"%>
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

	UserDao userDao = new UserDao();
	UserBean user = new UserBean();
	
	user.setUserId(Integer.parseInt(request.getParameter("userId")));
	user.setUserName(request.getParameter("userName"));
	user.setEmail(request.getParameter("email"));
	user.setMobile(Long.parseLong(request.getParameter("mobile")));
	
	int insertStatus = 0;
	insertStatus = userDao.insert(user);
	
	if(insertStatus == 0) {
		out.println("Error While Inserting Data");
	} else {
		response.sendRedirect("read.jsp");
	}
} catch(Exception e) {
	out.println(e.getMessage());
}







%>

</body>
</html>