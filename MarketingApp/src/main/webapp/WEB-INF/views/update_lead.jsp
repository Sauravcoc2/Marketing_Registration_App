<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
	<title>Update</title>
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
	</style>
</head>
<body>
	<h2>Update User</h2>
	<div class="main d-flex justify-content">
		<form action="updateLead" method="post">
			<input type="hidden" name="id" value="${lead.id}"/>
			<div class="form-group">
				<div class="form-row">
					<div class="col">
					  <input type="text" class="form-control" placeholder="First name" name="firstName" value="${lead.firstName}"/>
					</div>
					<div class="col">
					  <input type="text" class="form-control" placeholder="Last name" name="lastName" value="${lead.lastName}"/>
					</div>
				</div>
				<div class="form-group">
					<label>Email-ID</label>
					<input type="email" class="form-control" name="email" value="${lead.email}"/>
				  </div>
				<div class="form-group">
					<label>Mobile Number</label>
					<input type="number" class="form-control" name="mobile" value="${lead.mobile}"/>
				</div>
				<div class="form-group">
					<br>
					<button type="submit" class="btn btn-primary" value = "update">Save Changes</button>
				</div>
			</div>
		</form>
	</div>

		${msg}
	
</body>
</html>