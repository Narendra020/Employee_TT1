<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Create Account</title>
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
	padding: 40px;
	border-radius: 10px;
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
	width: 50%;
	max-width: 500px;
	text-align: center;
}

.form-container h2 {
	margin-bottom: 20px;
	color: #4b6cb7;
}

.form-container form {
	display: flex;
	flex-direction: column;
	gap: 15px;
}

.form-group {
	display: flex;
	flex-direction: column;
	align-items: flex-start;
}

.form-group label {
	margin-bottom: 5px;
	color: #4b6cb7;
	font-size: 14px;
	font-weight: bold;
}

.form-group input, .form-group select {
	padding: 10px;
	border-radius: 5px;
	border: 1px solid #ddd;
	font-size: 16px;
	width: 100%;
}

.form-container button {
	padding: 12px;
	background: #4b6cb7;
	color: #fff;
	border: none;
	border-radius: 5px;
	cursor: pointer;
	transition: background 0.3s ease;
	font-size: 16px;
}

.form-container button:hover {
	background: #182848;
}
</style>
</head>
<body>
	<div class="form-container">
		<h2>Create Account</h2>
		<form action="CreateAccountServlet" method="post">
			<div class="form-group">
				<label for="username">Employee Name</label> <input type="text"
					id="username" name="username" required>
			</div>
			<div class="form-group">
				<label for="dob">Employee Date of Birth</label> <input type="date"
					id="dob" name="dob" required>
			</div>
			<div class="form-group">
				<label for="email">Employee Email</label> <input type="email"
					id="email" name="email" required>
			</div>
			<div class="form-group">
				<label for="address">Employee Address</label> <input type="text"
					id="address" name="address" required>
			</div>
			<div class="form-group">
				<label for="phonenumber">Employee Phone Number</label> <input
					type="text" id="phonenumber" name="phonenumber" required>
			</div>
			<div class="form-group">
				<label for="gender">Select Gender</label> <select id="gender"
					name="gender" required>
					<option value="">Select Gender</option>
					<option value="Male">Male</option>
					<option value="Female">Female</option>
					<option value="Other">Other</option>
				</select>
			</div>
			<div class="form-group">
				<label for="dateofjoining">Employee Date of Joining</label> <input
					type="date" id="dateofjoining" name="dateofjoining" required>
			</div>
			<button type="submit">Create Account</button>
		</form>
	</div>
</body>
</html>
