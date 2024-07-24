<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, javax.servlet.*, javax.servlet.http.*"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Edit Task</title>
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
	max-width: 800px;
	text-align: left;
}

.form-container h2 {
	text-align: center;
	margin-bottom: 20px;
	color: #4b6cb7;
}

table {
	width: 100%;
	border-collapse: collapse;
	margin-bottom: 20px;
}

table, th, td {
	border: 1px solid #ccc;
}

th, td {
	padding: 10px;
	text-align: left;
}

th {
	background-color: #4b6cb7;
	color: white;
}

.edit-button {
	padding: 5px 10px;
	background: #4b6cb7;
	color: #fff;
	border: none;
	border-radius: 5px;
	cursor: pointer;
	text-decoration: none;
}

.edit-button:hover {
	background: #182848;
}
</style>
</head>
<body>
	<div class="form-container">
		<h2>Edit Task</h2>
		<%
          

            String employeeId = (String) session.getAttribute("employeeId");
            if (employeeId == null) {
                response.sendRedirect("login.jsp");
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

                String query = "SELECT * FROM employeetasks WHERE employeeId = ?";
                ps = conn.prepareStatement(query);
                ps.setString(1, employeeId);
                rs = ps.executeQuery();
        %>

		<table>
			<thead>
				<tr>
					<th>Task ID</th>
					<th>Project</th>
					<th>Date</th>
					<th>Start Time</th>
					<th>End Time</th>
					<th>Time Duration</th>
					<th>Task</th>
					<th>Description</th>
					<th>Action</th>
				</tr>
			</thead>
			<tbody>
				<%
                    while (rs.next()) {
                        String taskId = rs.getString("taskId");
                        String project = rs.getString("project");
                        String date = rs.getString("date");
                        String startTime = rs.getString("startTime");
                        String endTime = rs.getString("endTime");
                        String timeDuration = rs.getString("timeDuration");
                        String task = rs.getString("task");
                        String description = rs.getString("description");
                %>
				<tr>
					<td><%= taskId %></td>
					<td><%= project %></td>
					<td><%= date %></td>
					<td><%= startTime %></td>
					<td><%= endTime %></td>
					<td><%= timeDuration %></td>
					<td><%= task %></td>
					<td><%= description %></td>
					<td><a class="edit-button"
						href="editTaskDetails.jsp?taskId=<%= taskId %>">Edit</a></td>
				</tr>
				<%
                    }
                %>
			</tbody>
		</table>

		<%
            } catch (Exception e) {
                e.printStackTrace();
                out.println("An error occurred while fetching tasks.");
            } finally {
                if (rs != null) try { rs.close(); } catch (SQLException e) { e.printStackTrace(); }
                if (ps != null) try { ps.close(); } catch (SQLException e) { e.printStackTrace(); }
                if (conn != null) try { conn.close(); } catch (SQLException e) { e.printStackTrace(); }
            }
        %>
	</div>
</body>
</html>
