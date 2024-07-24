<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="com.timetracker.model.Task"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Employee Tasks</title>
<style>
body {
	font-family: Arial, sans-serif;
	background: linear-gradient(to right, #4b6cb7, #182848);
	color: #fff;
	display: flex;
	justify-content: center;
	align-items: center;
	height: 100vh;
	margin: 0;
}

.container {
	background: #fff;
	padding: 30px;
	border-radius: 10px;
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
	width: 90%;
	max-width: 1200px;
	color: #333;
}

table {
	width: 100%;
	border-collapse: collapse;
}

table, th, td {
	border: 1px solid #ddd;
}

th, td {
	padding: 10px;
	text-align: left;
}

th {
	background-color: #4b6cb7;
	color: #fff;
}

.status-select {
	width: 100%;
	padding: 5px;
}

.update-button {
	display: block;
	margin: 20px 0;
	padding: 10px 20px;
	font-size: 16px;
	color: #fff;
	background: linear-gradient(135deg, #4b6cb7, #182848);
	border: none;
	border-radius: 5px;
	cursor: pointer;
	transition: background 0.3s ease;
}

.update-button:hover {
	background: #2a3d65;
}

.back-link {
	display: block;
	margin-top: 20px;
	text-decoration: none;
	color: #4b6cb7;
}

.back-link:hover {
	text-decoration: underline;
}
</style>
</head>
<body>
	<div class="container">
		<h1>Employee Tasks</h1>
		<form method="post" action="EmployeeDetailsServlet">
			<table>
				<thead>
					<tr>
						<th>Task ID</th>
						<th>Employee ID</th>
						<th>Employee Name</th>
						<th>Role</th>
						<th>Project</th>
						<th>Date</th>
						<th>Start Time</th>
						<th>End Time</th>
						<th>Time Duration</th>
						<th>Task</th>
						<th>Description</th>
						<th>Status</th>
					</tr>
				</thead>
				<tbody>
					<%
                        List<Task> tasks = (List<Task>) request.getAttribute("tasks");
                        if (tasks != null) {
                            for (Task task : tasks) {
                    %>
					<tr>
						<td><%= task.getTaskId() %></td>
						<td><%= task.getEmployeeId() %></td>
						<td><%= task.getEmployeeName() %></td>
						<td><%= task.getRole() %></td>
						<td><%= task.getProject() %></td>
						<td><%= task.getDate() %></td>
						<td><%= task.getStartTime() %></td>
						<td><%= task.getEndTime() %></td>
						<td><%= task.getTimeDuration() %></td>
						<td><%= task.getTask() %></td>
						<td><%= task.getDescription() %></td>
						<td><select name="status_<%= task.getTaskId() %>"
							class="status-select">
								<option value="approved"
									<%= "approved".equals(task.getStatus()) ? "selected" : "" %>>Approved</option>
								<option value="pending"
									<%= "pending".equals(task.getStatus()) ? "selected" : "" %>>Pending</option>
								<option value="rejected"
									<%= "rejected".equals(task.getStatus()) ? "selected" : "" %>>Rejected</option>
						</select></td>
					</tr>
					<%
                            }
                        }
                    %>
				</tbody>
			</table>
			<button type="submit" class="update-button">Update Status</button>
		</form>
		<a href="associateDash.jsp" class="back-link">Go Back to Dashboard</a>
	</div>
</body>
</html>
