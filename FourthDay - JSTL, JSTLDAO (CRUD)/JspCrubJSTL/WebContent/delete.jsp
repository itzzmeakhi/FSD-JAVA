<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
    <%@taglib prefix="core" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title> Delete Page </title>
</head>
<body>


	<sql:setDataSource var="mysqlds" driver="com.mysql.jdbc.Driver" url = "jdbc:mysql://localhost:3306/akhil" user = "root" password = "root"/>

		<sql:update dataSource="${mysqlds}" var="status" >DELETE FROM department WHERE dept_id=<%= request.getParameter("dept_id") %> </sql:update>
		
		<core:if test="(${status} == 0)">
			<core:out value="Error while Deleting..!"></core:out>
		</core:if>
		
		<jsp:forward page="read.jsp"></jsp:forward>
</body>
</html>