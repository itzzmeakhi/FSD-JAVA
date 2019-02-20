<%@page import="com.cognizant.UserBean"%>
<%@page import="com.cognizant.dao.UserDao"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title> Edit Page </title>
</head>
<body>




<h1> Update Details </h1>


<form action = "updatetAction.jsp">

<%

UserDao userDao = new UserDao();
UserBean user = userDao.read(Integer.parseInt(request.getParameter("user_id")));





%>

	<table class = "table table-dark">
	
	<thead>
		<tr>
			<th> Column Name </th>
			<th> Value </th>
		</tr>
	</thead>
	<tbody>
		<tr>
			<td> USER ID </td>
			<td><input type = "number" name = "userId" value = "<%=user.getUserId() %> readonly"></td>
		</tr>
		
		<tr>
			<td> USERNAME </td>
			<td><input type = "text" name = "userName" value = "<%= user.getUserName() %>"></td>
		</tr>
		
		<tr>
			<td> Email </td>
			<td><input type = "email" name = "email" value = "<%= user.getEmail() %>"></td>
		</tr>
		
		<tr>
			<td> MOBILE </td>
			<td><input type = "tel" name = "mobile" value = "<%=user.getMobile() %>"></td>
		</tr>
		
		
		<tr>
			<td><input type = "submit" value = "Submit"></td>
			<td><input type = "reset" value = "Reset"></td>
		</tr>
		
	</tbody>
	
	</table>
	
</form>





</body>
</html>