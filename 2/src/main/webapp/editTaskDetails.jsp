<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, javax.servlet.*, javax.servlet.http.*"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Edit Task Details</title>
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
	padding: 20px;
	border-radius: 10px;
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
	width: 80%;
	max-width: 600px;
}

.form-container h2 {
	text-align: center;
	color: #4b6cb7;
}

form {
	display: flex;
	flex-direction: column;
	gap: 15px;
}

input, select, textarea {
	padding: 10px;
	border: 1px solid #ccc;
	border-radius: 5px;
	width: 100%;
}

button {
	padding: 10px;
	background: #4b6cb7;
	color: #fff;
	border: none;
	border-radius: 5px;
	cursor: pointer;
	font-size: 16px;
}

button:hover {
	background: #182848;
}

.cancel-button {
	background: #ccc;
	margin-top: 10px;
}
</style>
</head>
<body>
	<div class="form-container">
		<h2>Edit Task Details</h2>
		<%
            
            String taskId = request.getParameter("taskId");
            if (taskId == null || taskId.isEmpty()) {
                out.println("Task ID is missing.");
                return;
            }

            Connection conn = null;
            PreparedStatement ps = null;
            ResultSet rs = null;
            String url = "jdbc:mysql://localhost:3306/time_tracker";
            String user = "root";
            String password = "75830102";

            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                conn = DriverManager.getConnection(url, user, password);

                String query = "SELECT * FROM employeetasks WHERE taskId = ?";
                ps = conn.prepareStatement(query);
                ps.setString(1, taskId);
                rs = ps.executeQuery();

                if (rs.next()) {
                    String project = rs.getString("project");
                    String date = rs.getString("date");
                    String startTime = rs.getString("startTime");
                    String endTime = rs.getString("endTime");
                    String timeDuration = rs.getString("timeDuration");
                    String task = rs.getString("task");
                    String description = rs.getString("description");
        %>

		<form action="EditTaskServlet" method="post">
			<input type="hidden" name="taskId" value="<%= taskId %>"> <label
				for="project">Project:</label> <input type="text" id="project"
				name="project" value="<%= project %>" required> <label
				for="date">Date:</label> <input type="date" id="date" name="date"
				value="<%= date %>" required> <label for="startTime">Start
				Time:</label> <input type="time" id="startTime" name="startTime"
				value="<%= startTime %>" required> <label for="endTime">End
				Time:</label> <input type="time" id="endTime" name="endTime"
				value="<%= endTime %>" required> <label for="timeDuration">Time
				Duration:</label> <input type="text" id="timeDuration" name="timeDuration"
				value="<%= timeDuration %>" required> <label for="task">Task:</label>
			<input type="text" id="task" name="task" value="<%= task %>" required>

			<label for="description">Description:</label>
			<textarea id="description" name="description" rows="4" required><%= description %></textarea>

			<button type="submit">Update Task</button>
			<button type="button" class="cancel-button"
				onclick="window.location.href='editTask.jsp'">Cancel</button>
		</form>

		<%
                } else {
                    out.println("No task found with ID: " + taskId);
                }
            } catch (Exception e) {
                e.printStackTrace();
                out.println("An error occurred while fetching task details.");
            } finally {
                if (rs != null) try { rs.close(); } catch (SQLException e) { e.printStackTrace(); }
                if (ps != null) try { ps.close(); } catch (SQLException e) { e.printStackTrace(); }
                if (conn != null) try { conn.close(); } catch (SQLException e) { e.printStackTrace(); }
            }
        %>
	</div>
</body>
</html>
