<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
       pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert_Page</title>
</head>
<body>
       <h1 align="center">Insert_Page</h1>
       <link rel="stylesheet"
              href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
              integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
              crossorigin="anonymous">
       <center>
              <h1>Add a New record</h1>
       </center>
       <form action="insertaction.jsp">
              <table class="table table-striped" align="center">
                     <tr>
                           <th>Column name</th>
                           <th>value</th>
                     </tr>
                     <tr>
                           <td>dept_id:</td>
                           <td><input type="number" name="dept_id" required="required"></td>
                     </tr>
                     <tr>
                           <td>dept_name:</td>
                           <td><input type="text" name="dept_name" required="required"></td>
                     </tr>
                     <tr>
                           <td>start_date:</td>
                           <td><input type="date" name="start_date" required="required"></td>
                     </tr>
                     <tr>
                           <td><input type="reset" value="Clear"></td>
                           <td><input type="submit" value="Insert"></td>
              </table>
       </form>
       <center>
              <a href="index.jsp">Home_Page</a>
       </center>
</body>
</html>
