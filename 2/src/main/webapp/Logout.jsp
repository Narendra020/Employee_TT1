<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Employee Time Tracker - Logout</title>
<style>
body {
	font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
	background: linear-gradient(to right, #4b6cb7, #182848);
	/* Background gradient matching the theme */
	margin: 0;
	padding: 0;
	display: flex;
	flex-direction: column;
	align-items: center;
	justify-content: center;
	height: 100vh;
}

.container {
	text-align: center;
	border: 1px solid #ddd;
	padding: 20px;
	border-radius: 10px;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.2);
	background-color: #fff;
	width: 300px;
}

.button {
	padding: 10px 20px;
	font-size: 16px;
	background: linear-gradient(to right, #4b6cb7, #182848);
	/* Button gradient matching the theme */
	color: white;
	border: none;
	border-radius: 5px;
	cursor: pointer;
	transition: background 0.3s ease;
}

.button:hover {
	background: linear-gradient(to right, #182848, #4b6cb7);
}

.button-container {
	margin-top: 20px;
}
</style>
</head>
<body>
	<div class="container">
		<h2>Thank You! Visit Again</h2>
		<!-- Other content for customer home page -->

		<!-- Logout button -->
		<div class="button-container">
			<form action="LogoutServlet" method="post">
				<input type="submit" value="Logout" class="button">
			</form>
		</div>
	</div>
</body>
</html>
