<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Manage Projects</title>
<link rel="stylesheet" type="text/css" href="styles.css">
<!-- Link to your CSS file -->
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

.button-container {
	margin-top: 20px;
	display: flex;
	flex-direction: column;
	align-items: center;
}

.button {
	display: inline-block;
	padding: 12px 24px;
	margin: 10px;
	font-size: 16px;
	color: #fff;
	text-decoration: none;
	border-radius: 5px;
	transition: background 0.3s, transform 0.3s;
	width: 200px; /* Consistent button width */
	text-align: center;
}

.button:hover {
	transform: scale(1.05);
}

.button.add-project {
	background: linear-gradient(135deg, #28a745, #218838);
	/* Green gradient */
}

.button.edit-project {
	background: linear-gradient(135deg, #ffc107, #e0a800);
	/* Yellow gradient */
}

.button.delete-project {
	background: linear-gradient(135deg, #dc3545, #c82333);
	/* Red gradient */
}

.button.add-project:hover {
	background: linear-gradient(135deg, #1e7d32, #1c7430);
	/* Darker green gradient */
}

.button.edit-project:hover {
	background: linear-gradient(135deg, #e0a800, #d39e00);
	/* Darker yellow gradient */
}

.button.delete-project:hover {
	background: linear-gradient(135deg, #c82333, #bd2130);
	/* Darker red gradient */
}
</style>
</head>
<body>
	<div class="container">
		<h1>Manage Projects</h1>
		<div class="button-container">
			<a href="addProject.jsp" class="button add-project">Add Project</a> <a
				href="editProject.jsp" class="button edit-project">Edit Project</a>
			<a href="deleteProject.jsp" class="button delete-project">Delete
				Project</a>
		</div>
	</div>
</body>
</html>
