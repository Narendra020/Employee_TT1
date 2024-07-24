<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Associate Dashboard</title>
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
	margin-top: 30px;
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
}

.button:hover {
	transform: scale(1.05);
}

.button.manage-projects {
	background: linear-gradient(135deg, #4b6cb7, #182848);
	/* Blue gradient */
}

.button.manage-employees {
	background: linear-gradient(135deg, #28a745, #218838);
	/* Green gradient */
}

.button.manage-projects:hover {
	background: linear-gradient(135deg, #2a4a7a, #0f1d2f);
	/* Darker blue gradient */
}

.button.manage-employees:hover {
	background: linear-gradient(135deg, #1e7d32, #1c7430);
	/* Darker green gradient */
}
</style>
</head>
<body>
	<div class="container">
		<h1>Associate Dashboard</h1>
		<div class="button-container">
			<a href="manageProjects.jsp" class="button manage-projects">Manage
				Projects</a> <a href="manageEmployees.jsp"
				class="button manage-employees">Manage Employees</a>
		</div>
	</div>
</body>
</html>
