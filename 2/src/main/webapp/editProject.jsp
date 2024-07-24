<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Edit Project</title>
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

.edit-container {
	background: #fff;
	padding: 30px;
	border-radius: 10px;
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
	width: 40%;
	max-width: 400px;
	text-align: center;
}

.edit-container h2 {
	margin-bottom: 20px;
	color: #4b6cb7;
}

.edit-container form {
	display: flex;
	flex-direction: column;
}

.edit-container form label {
	text-align: left;
	margin-bottom: 5px;
	color: #4b6cb7;
}

.edit-container form input, .edit-container form textarea {
	margin-bottom: 15px;
	padding: 10px;
	border: 1px solid #ddd;
	border-radius: 5px;
}

.edit-container form textarea {
	resize: vertical;
}

.edit-container form button {
	padding: 10px 20px;
	background: #4b6cb7;
	color: #fff;
	border: none;
	border-radius: 5px;
	cursor: pointer;
	transition: background 0.3s ease;
}

.edit-container form button:hover {
	background: #182848;
}

.edit-container a {
	color: #4b6cb7;
	text-decoration: none;
	display: inline-block;
	margin-top: 15px;
}

.edit-container a:hover {
	text-decoration: underline;
}
</style>
</head>
<body>
	<div class="edit-container">
		<h2>Edit Project</h2>
		<c:choose>
			<c:when test="${empty project}">
				<form action="EditProjectServlet" method="get">
					<label for="projectId">Project ID</label> <input type="text"
						id="projectId" name="projectId" required>
					<button type="submit">Fetch Project</button>
				</form>
				<c:if test="${not empty message}">
					<p>${message}</p>
				</c:if>
			</c:when>
			<c:otherwise>
				<form action="EditProjectServlet" method="post">
					<label for="projectId">Project ID</label> <input type="text"
						id="projectId" name="projectId" value="${project.projectId}"
						readonly> <label for="projectName">Project Name</label> <input
						type="text" id="projectName" name="projectName"
						value="${project.projectName}" required> <label
						for="description">Description</label>
					<textarea id="description" name="description" rows="4" required>${project.description}</textarea>

					<button type="submit">Update Project</button>
				</form>
				<c:if test="${not empty message}">
					<p>${message}</p>
				</c:if>
			</c:otherwise>
		</c:choose>
		<a href="associateDash.jsp">Go Back to Dashboard</a>
	</div>
</body>
</html>
