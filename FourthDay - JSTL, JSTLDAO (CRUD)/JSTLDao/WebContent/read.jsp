<%@page import="com.cognizant.bean.Department"%>
<%@page import="com.cognizant.dao.DepartmentDao"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
       pageEncoding="ISO-8859-1"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@taglib prefix="core" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Read page</title>
<link rel="stylesheet"
       href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
       integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
       crossorigin="anonymous">
</head>
<body>



       <center>
              <h1>Department</h1>
              <table border='1' class="table table-hover table-dark">
                     <tr align="center">
                           <th>Sl.no</th>
                           <th>dept_id</th>
                           <th>dept_name</th>
                           <th>start_date</th>
                           <th>Actions</th>
                     </tr>
                     <%
                           int i = 0;
                           DepartmentDao deD = new DepartmentDao();
                           List<Department> deptList = new ArrayList<Department>();
                           deptList = deD.readAll();
                           request.setAttribute("deptDetails", deptList);
                     %>

                     <core:forEach items="${deptDetails}" var="dept">
                           <tr align="center">
                                  <td><core:out value="${i=i+1}"></core:out></td>
                                  <td><core:out value="${dept.getDept_id()}"></core:out></td>
                                  <td><core:out value="${dept.getDept_name()}"></core:out></td>
                                  <td><core:out value="${dept.getStart_date()}"></core:out></td>
                                  <td><a href="edit.jsp?dept_id=${dept.getDept_id()}">Edit</a>||<a
                                         href="delete.jsp?dept_id=${dept.getDept_id()}">Delete</a></td>
                           </tr>

                     </core:forEach>
              </table>
       </center>
       <center>
              <a href="index.jsp">Home_Page</a>
       </center>
</body>
</html>
