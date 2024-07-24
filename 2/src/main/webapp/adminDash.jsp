<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Employee Time Tracker - Admin Dashboard</title>
<style>
body {
	font-family: Arial, sans-serif;
	background: linear-gradient(to right, #4b6cb7, #182848);
	display: flex;
	justify-content: center;
	align-items: center;
	height: 100vh;
	margin: 0;
}

.dashboard-container {
	background: #fff;
	padding: 40px;
	border-radius: 10px;
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
	width: 60%;
	max-width: 600px;
	text-align: center;
}

.dashboard-container h2 {
	margin-bottom: 40px;
	color: #4b6cb7;
}

.button-container {
	display: flex;
	flex-direction: column;
	gap: 15px;
}

.button-container a {
	padding: 15px 20px;
	background: #4b6cb7;
	color: #fff;
	text-decoration: none;
	border-radius: 5px;
	transition: background 0.3s ease;
	text-align: center;
	font-size: 16px;
}

.button-container a:hover {
	background: #182848;
}
</style>
</head>
<body>
	<div class="dashboard-container">
		<h2>Admin Dashboard</h2>

		<div class="button-container">
			<a href="createAccount.jsp">Create Account</a> <a href="Edit.jsp">Edit
				Account</a> <a href="DeleteEmployee.jsp">Delete Account</a> <a
				href="viewReports.jsp">View Reports</a> <a href="Logout.jsp">Logout</a>
		</div>
	</div>
</body>
</html>
