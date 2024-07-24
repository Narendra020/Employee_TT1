<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Success</title>
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
	padding: 30px;
	border-radius: 10px;
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
	text-align: center;
}

.message-container h2 {
	margin-bottom: 20px;
	color: #4b6cb7;
}

.message-container a {
	color: #4b6cb7;
	text-decoration: none;
	display: inline-block;
	margin-top: 15px;
}

.message-container a:hover {
	text-decoration: underline;
}
</style>
</head>
<body>
	<div class="message-container">
		<h2>Project updated successfully!</h2>
		<a href="associateDash.jsp">Go Back to Dashboard</a>
	</div>
</body>
</html>
