<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Employee Time Tracker - Logout Successful</title>
<style>
body {
	display: flex;
	justify-content: center;
	align-items: center;
	height: 100vh;
	margin: 0;
	font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
	background: linear-gradient(to right, #4b6cb7, #182848);
	/* Background gradient matching the theme */
	background-size: cover;
	background-repeat: no-repeat;
	background-attachment: fixed;
}

.container {
	text-align: center;
	border: 1px solid #ddd;
	padding: 20px;
	border-radius: 15px;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.2);
	background-color: rgba(255, 255, 255, 0.9);
	width: 90%;
	max-width: 600px;
}

.button {
	padding: 15px 30px;
	font-size: 18px;
	background: linear-gradient(to right, #4b6cb7, #182848);
	/* Button gradient matching the theme */
	color: white;
	border: none;
	border-radius: 5px;
	cursor: pointer;
	transition: background 0.3s ease;
	margin: 10px;
}

.button:hover {
	background: linear-gradient(to right, #182848, #4b6cb7);
}
</style>
</head>
<body>
	<div class="container">
		<h2>Logged Out Successfully!</h2>
		<p>You have been logged out. Please choose an option below:</p>
		<form action="login.jsp" method="get">
			<input type="submit" value="Login Again" class="button">
		</form>
		<form action="adminAssociateLogin.jsp" method="get">
			<input type="submit" value="Go Back to Home" class="button">
		</form>
	</div>
</body>
</html>
