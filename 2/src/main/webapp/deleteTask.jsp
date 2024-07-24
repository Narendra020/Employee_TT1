<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Delete Task</title>
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
	padding: 20px;
	border-radius: 10px;
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
	width: 80%;
	max-width: 400px;
	text-align: center;
}

.form-container h2 {
	margin-bottom: 20px;
	color: #4b6cb7;
}

.form-container form {
	display: flex;
	flex-direction: column;
}

.form-container form label {
	margin-bottom: 5px;
	color: #333;
	font-weight: bold;
}

.form-container form input, .form-container form select {
	padding: 10px;
	margin-bottom: 15px;
	border: 1px solid #ccc;
	border-radius: 5px;
	font-size: 16px;
}

.form-container form button {
	padding: 10px;
	background: #4b6cb7;
	color: #fff;
	border: none;
	border-radius: 5px;
	font-size: 16px;
	cursor: pointer;
	transition: background 0.3s ease;
}

.form-container form button:hover {
	background: #182848;
}
</style>
</head>
<body>
	<div class="form-container">
		<h2>Delete Task</h2>
		<form action="DeleteTaskServlet" method="post">
			<label for="taskId">Task ID</label> <input type="text" id="taskId"
				name="taskId" required>

			<button type="submit">Delete Task</button>
		</form>
	</div>
</body>
</html>
