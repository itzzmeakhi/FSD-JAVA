<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title> Insert Page </title>
</head>
<body>


	<form action = "insertAction.jsp">
	
	
	<table border = "1">
	
		<tr>
			<th> Column Name </th>
			<th> Value </th>
			
		</tr>
		
		<tr>
		
			<td> DEPT_ID </td>
			<td> <input type = "number" name = "dept_id" placeholder = " AUTO INCREAMENT " readonly></td>
			
		</tr>
		
		<tr>
		
			<td> DEPT_NAME </td>
			<td> <input type = "text" name = "dept_name" placeholder = " Enter Dept Name " required></td>
			
		</tr>
		
		<tr>
		
			<td> DEPT_ID </td>
			<td> <input type = "date" name = "dept_start_date" placeholder = "Enter Dept Start Date " required></td>
			
		</tr>
		
		<tr>
		
			<td> <input type = "submit" value = "Insert"> </td>
			<td> <input type = "reset" value = "Reset"></td>
			
		</tr>
		
	</table>
	

	
	</form>

</body>
</html>