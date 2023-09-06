<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title>All Leads</title>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
	<style>
		*{
			margin: 15px 2px;
			padding:0;
		}

		body{
			background-color: black;
			color: white;
		}
		.main{
			width: 40%;
		}
		.primary{
			color: rgb(2, 117, 216);
		}
		.caution{
			color: red;
		}
		.modify{
			color: goldenrod;
		}
	</style>
</head>
<body>
	<h2>List of Users</h2>
	<table border = 1 class="table table-striped table-dark">
		<tr class="primary">
			<th>First Name</th>
			<th>Last Name</th>
			<th>E-mail</th>
			<th>Mobile</th>
			<th>Delete</th>
			<th>Update</th>
		</tr>
		<c:forEach var="lead" items="${leads}">
			<tr>
				<td>${lead.firstName}</td>
				<td>${lead.lastName}</td>
				<td>${lead.email}</td>
				<td>${lead.mobile}</td>
				<td><a class = "caution" href="delete?id=${lead.id}">delete</a></td>
				<td><a class = "modify" href="update?id=${lead.id}">update</a></td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>