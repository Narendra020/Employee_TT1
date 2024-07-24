<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Employee Time Tracker - Employee Dashboard</title>
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
	padding: 20px;
	border-radius: 10px;
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
	width: 80%;
	max-width: 400px;
	text-align: center;
}

.dashboard-container h2 {
	margin-bottom: 20px;
	color: #4b6cb7;
}

.button-container {
	display: flex;
	flex-direction: column;
	align-items: center;
	margin-top: 20px;
}

.button-container a {
	padding: 8px 16px;
	background: #4b6cb7;
	color: #fff;
	text-decoration: none;
	border-radius: 5px;
	transition: background 0.3s ease;
	margin-bottom: 15px;
	/* Increased margin for more space between buttons */
	width: 80%;
	text-align: center;
}

.button-container a:last-child {
	margin-bottom: 0;
}

.button-container a:hover {
	background: #182848;
}
</style>
</head>
<body>
	<div class="dashboard-container">
		<h2>Welcome to Employee Time Tracker - Employee Dashboard</h2>

		<div class="button-container">
			<a href="addTask.jsp">Add Task</a> <a href="editTask.jsp">Edit
				Task</a> <a href="deleteTask.jsp">Delete Task</a> <a
				href="viewStatus.jsp"> View Status</a> <a href="changePassword.jsp">Change
				Password</a> <a href="logout.jsp">Logout</a>
		</div>
	</div>
</body>
</html>
