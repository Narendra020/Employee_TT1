<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Manage Employees</title>
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

.container {
	background: #fff;
	padding: 30px;
	border-radius: 10px;
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
	width: 80%;
	max-width: 600px;
	text-align: center;
}

h1 {
	color: #4b6cb7;
	margin-bottom: 20px;
}

.button {
	display: inline-block;
	padding: 10px 20px;
	margin: 10px;
	font-size: 16px;
	color: #fff;
	background: linear-gradient(135deg, #4b6cb7, #182848);
	/* Blue gradient */
	border: none;
	border-radius: 5px;
	text-decoration: none;
	cursor: pointer;
	transition: background 0.3s ease;
}

.button:hover {
	background: #2a3d65; /* Darker blue gradient */
}

.button.details {
	background: linear-gradient(135deg, #28a745, #218838);
	/* Green gradient */
}

.button.details:hover {
	background: #1e7d32; /* Darker green gradient */
}

.button.status {
	background: linear-gradient(135deg, #17a2b8, #117a8b);
	/* Teal gradient */
}

.button.status:hover {
	background: #0e6d75; /* Darker teal gradient */
}

.back-link {
	display: block;
	margin-top: 20px;
	text-decoration: none;
	color: #4b6cb7;
}

.back-link:hover {
	text-decoration: underline;
}
</style>
</head>
<body>
	<div class="container">
		<h1>Manage Employees</h1>
		<a href="employeeDetails.jsp" class="button details">Employee
			Details</a> <a href="viewEmployeeReports.jsp" class="button status">View
			Employee Reports</a> <a href="associateDash.jsp" class="back-link">Go
			Back to Dashboard</a>
	</div>
</body>
</html>
