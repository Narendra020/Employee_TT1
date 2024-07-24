<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Admin/Associate Login</title>
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

.login-container {
	background: #fff;
	padding: 30px;
	border-radius: 10px;
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
	width: 350px;
	text-align: center;
}

.login-container h2 {
	margin-bottom: 20px;
	color: #4b6cb7;
}

.form-group {
	margin-bottom: 15px;
	text-align: left;
}

.form-group label {
	display: block;
	margin-bottom: 5px;
	color: #333;
}

.form-group input, .form-group select {
	width: 100%;
	padding: 10px;
	border: 1px solid #ddd;
	border-radius: 5px;
}

button {
	width: 100%;
	padding: 12px;
	background: #4b6cb7;
	color: #fff;
	border: none;
	border-radius: 5px;
	cursor: pointer;
	transition: background 0.3s ease;
}

button:hover {
	background: #182848;
}

.error {
	color: red;
	margin-top: 10px;
}
</style>
</head>
<body>
	<div class="login-container">
		<h2>Admin/Associate Login</h2>
		<form id="loginForm" action="AdminAssociateLoginServlet" method="POST">
			<div class="form-group">
				<label for="role">Role</label> <select id="role" name="role"
					required>
					<option value="">Select Role</option>
					<option value="admin">Admin</option>
					<option value="associate">Associate</option>
				</select>
			</div>
			<div class="form-group">
				<label for="username">Username</label> <input type="text"
					id="username" name="username" required>
			</div>
			<div class="form-group">
				<label for="password">Password</label> <input type="password"
					id="password" name="password" required>
			</div>
			<button type="submit">Login</button>
			<% 
                String error = (String) request.getAttribute("error");
                if (error != null) {
            %>
			<p class="error"><%= error %></p>
			<% } %>
		</form>
	</div>
	<script>
        document.getElementById('loginForm').addEventListener('submit', function(event) {
            const role = document.getElementById('role').value;
            const username = document.getElementById('username').value;
            const password = document.getElementById('password').value;

            if (!role || !username || !password) {
                alert('Please fill in all fields.');
                event.preventDefault();
            }
        });
    </script>
</body>
</html>
