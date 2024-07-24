<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add Project</title>
<style>
body {
	font-family: Arial, sans-serif;
	background: linear-gradient(to right, #4b6cb7, #182848);
	/* Gradient background */
	margin: 0;
	padding: 0;
}

.container {
	width: 80%;
	margin: 0 auto;
	padding: 20px;
	background-color: rgba(255, 255, 255, 0.9);
	/* Semi-transparent background */
	border-radius: 10px;
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
	text-align: center;
	margin-top: 50px;
}

h1 {
	color: #4b6cb7;
	margin-bottom: 30px;
}

form {
	display: flex;
	flex-direction: column;
	align-items: center;
}

.form-group {
	margin: 10px 0;
	width: 100%;
	max-width: 400px;
}

.form-group label {
	display: block;
	margin-bottom: 5px;
	font-weight: bold;
}

.form-group input {
	width: 100%;
	padding: 10px;
	border-radius: 5px;
	border: 1px solid #ddd;
}

.form-group input[type="submit"] {
	background: linear-gradient(135deg, #28a745, #218838);
	/* Green gradient */
	color: #fff;
	border: none;
	cursor: pointer;
}

.form-group input[type="submit"]:hover {
	background: linear-gradient(135deg, #1e7d32, #1c7430);
	/* Darker green gradient */
}

.message {
	margin-top: 20px;
	color: #28a745;
}
</style>
</head>
<body>
	<div class="container">
		<h1>Add New Project</h1>
		<form action="addProject" method="post">
			<div class="form-group">
				<label for="projectId">Project ID:</label> <input type="text"
					id="projectId" name="projectId" required>
			</div>
			<div class="form-group">
				<label for="projectName">Project Name:</label> <input type="text"
					id="projectName" name="projectName" required>
			</div>
			<div class="form-group">
				<label for="description">Description:</label> <input type="text"
					id="description" name="description" required>
			</div>
			<div class="form-group">
				<input type="submit" value="Add Project"> <a
					href="associateDash.jsp">Go Back to Home</a>
			</div>
		</form>
		<% if (request.getAttribute("message") != null) { %>
		<div class="message"><%= request.getAttribute("message") %></div>
		<% } %>
	</div>
</body>
</html>
