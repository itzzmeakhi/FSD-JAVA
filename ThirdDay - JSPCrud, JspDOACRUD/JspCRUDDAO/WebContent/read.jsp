<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="com.cognizant.UserBean"%>
<%@page import="com.cognizant.dao.UserDao"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title> Read Page </title>
</head>
<body>

<%

try {

	UserDao userDao = new UserDao();
	//UserBean user = new UserBean();
	
	
	List<UserBean> userList = new ArrayList<UserBean>();
	
	userList = userDao.readAll();
	
	
	
	
	%>
	
	<table border = 1>
		<tr>
			<th> USER ID</th> 
			<th> USER NAME </th> 
			<th> EMAIL </th> 
			<th> MOBILE </th> 
			<th> ACTIONS </th>
		</tr>
	
	<%
	for (UserBean user : userList) {
	%>
	
		<tr>
			<td><%= user.getUserId() %></td> 
			<td> <%= user.getUserName() %> </td> 
			<td> <%= user.getEmail() %></td> 
			<td> <%= user.getMobile() %> </td> 
			<td> <a href = "edit.jsp?user_id=<%= user.getUserId()%>">EDIT</a> | <a href = "delete.jsp?user_id=<%= user.getUserId()%>">DELETE</a></td>
		</tr>
	<% 
	}
	%>
	</table>
	<% 
	
} catch(Exception e) {
	out.println(e.getMessage());
}







%>

</body>
</html>