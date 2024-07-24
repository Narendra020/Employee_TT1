<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Task Added Successfully</title>
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

.message-container {
	background: #fff;
	padding: 20px;
	border-radius: 10px;
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
	width: 80%;
	max-width: 400px;
	text-align: center;
}

.message-container h2 {
	margin-bottom: 20px;
	color: #4b6cb7;
}

.message-container p {
	margin-bottom: 20px;
	font-size: 16px;
	color: #333;
}

.message-container a {
	padding: 10px 20px;
	background: #4b6cb7;
	color: #fff;
	text-decoration: none;
	border-radius: 5px;
	transition: background 0.3s ease;
}

.message-container a:hover {
	background: #182848;
}
</style>
</head>
<body>
	<div class="message-container">
		<h2>Task Added Successfully!</h2>
		<p>Your task has been added successfully.</p>
		<a href="employeeDash.jsp">Go Back to Home</a>
	</div>
</body>
</html>
