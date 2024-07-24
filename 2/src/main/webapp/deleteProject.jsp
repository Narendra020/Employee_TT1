<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Delete Project</title>
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

.delete-container {
	background: #fff;
	padding: 30px;
	border-radius: 10px;
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
	width: 40%;
	max-width: 400px;
	text-align: center;
}

.delete-container h2 {
	margin-bottom: 20px;
	color: #4b6cb7;
}

.delete-container form {
	display: flex;
	flex-direction: column;
}

.delete-container form label {
	text-align: left;
	margin-bottom: 5px;
	color: #4b6cb7;
}

.delete-container form input {
	margin-bottom: 15px;
	padding: 10px;
	border: 1px solid #ddd;
	border-radius: 5px;
}

.delete-container form button {
	padding: 10px 20px;
	background: #4b6cb7;
	color: #fff;
	border: none;
	border-radius: 5px;
	cursor: pointer;
	transition: background 0.3s ease;
}

.delete-container form button:hover {
	background: #182848;
}

.delete-container a {
	color: #4b6cb7;
	text-decoration: none;
	display: inline-block;
	margin-top: 15px;
}

.delete-container a:hover {
	text-decoration: underline;
}
</style>
</head>
<body>
	<div class="delete-container">
		<h2>Delete Project</h2>
		<form action="DeleteProjectServlet" method="post">
			<label for="projectId">Project ID</label> <input type="text"
				id="projectId" name="projectId" required>
			<button type="submit">Delete Project</button>
		</form>
		<a href="associateDash.jsp">Go Back to Dashboard</a>
		<c:if test="${not empty message}">
			<p>${message}</p>
		</c:if>
	</div>
</body>
</html>
