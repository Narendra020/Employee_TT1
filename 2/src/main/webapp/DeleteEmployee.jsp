<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Delete Employee</title>
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

.form-container {
	background: #fff;
	padding: 40px;
	border-radius: 10px;
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
	width: 50%;
	max-width: 500px;
	text-align: center;
}

.form-container h2 {
	margin-bottom: 20px;
	color: #4b6cb7;
}

.form-container form {
	display: flex;
	flex-direction: column;
	gap: 15px;
}

.form-group {
	display: flex;
	flex-direction: column;
	align-items: flex-start;
}

.form-group label {
	margin-bottom: 5px;
	color: #4b6cb7;
	font-size: 14px;
	font-weight: bold;
}

.form-group input {
	padding: 10px;
	border-radius: 5px;
	border: 1px solid #ddd;
	font-size: 16px;
	width: 100%;
}

.form-container button {
	padding: 12px;
	background: #4b6cb7;
	color: #fff;
	border: none;
	border-radius: 5px;
	cursor: pointer;
	transition: background 0.3s ease;
	font-size: 16px;
}

.form-container button:hover {
	background: #182848;
}
</style>
</head>
<body>
	<div class="form-container">
		<h2>Delete Employee Account</h2>
		<form action="DeleteEmployeeServlet" method="post">
			<div class="form-group">
				<label for="employeeId">Employee ID</label> <input type="text"
					id="employeeId" name="employeeId" required>
			</div>
			<button type="submit">Delete Account</button>
		</form>
	</div>
</body>
</html>
