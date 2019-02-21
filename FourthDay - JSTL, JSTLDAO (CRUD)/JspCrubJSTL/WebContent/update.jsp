<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
    <%@taglib prefix="core" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title> Update Table </title>
</head>
<body>

<h1> Update Here </h1>



<form action = "updateAction.jsp">

	<table border = 1>
			
			<tr>
				<th> ID </th>
				<th> Department Name </th>
				<th> Start Date </th>
			</tr>
	
	
	
			<sql:setDataSource var="mysqlds" driver="com.mysql.jdbc.Driver" url = "jdbc:mysql://localhost:3306/akhil" user = "root" password = "root"/>
			
			<sql:query var="rs" dataSource="${mysqlds}">SELECT * FROM department WHERE dept_id=<%= request.getParameter("dept_id")%></sql:query>
			
			
			<core:forEach items="${rs.rows}" var="dept">
				<tr>
					<td> <input type = "number" name = "dept_id" value = "<core:out value = "${dept.dept_id}"></core:out>" readonly></td>
					<td> <input type = "text" name = "dept_name" value = "<core:out value = "${dept.dept_name}"></core:out>"></td>
					<td> <input type = "date" name = "dept_start_date" value = "<core:out value = "${dept.dept_start_date}"></core:out>"></td>	
					<td> <input type = "submit" value = "Submit" ></td>
				</tr>
			</core:forEach>
			
			
	</table>
			
</form>

</body>
</html>