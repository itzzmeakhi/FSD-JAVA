
<%@page import="com.cognizant.dao.DepartmentDao"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
       pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="core" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Add Record</title>
</head>
<body>
       <jsp:useBean id="dept" class="com.cognizant.bean.Department"></jsp:useBean>
       <jsp:setProperty property="*" name="dept" />
       <%
              DepartmentDao deD = new DepartmentDao();
              int Istatus = 0;
              Istatus = deD.insert(dept);
              request.setAttribute("Istatus", Istatus);
       %>
       <core:if test="${Istatus==0}">
              <core:out value="Error while inserting !!! pls check"></core:out>
       </core:if>
       <core:redirect url="read.jsp"></core:redirect>


</body>
</html>
