<%@ page
	import="java.util.*, com.timetracker.model.Employee, com.timetracker.dao.EmployeeReportDAO"%>

<%@ page import="com.timetracker.dao.EmployeeReportDAO"%>
<!DOCTYPE html>
<html>
<head>
<title>Employee Reports</title>
<link rel="stylesheet" type="text/css" href="styles.css">
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
</head>
<body>
	<h1>Employee Reports</h1>
	<table border="1">
		<thead>
			<tr>
				<th>Employee ID</th>
				<th>Employee Name</th>
				<th>Actions</th>
			</tr>
		</thead>
		<tbody>
			<% 
                EmployeeReportDAO dao = new EmployeeReportDAO();
                List<Employee> employees = dao.getAllEmployees();
                for (Employee employee : employees) {
            %>
			<tr>
				<td><%= employee.getEmployeeId() %></td>
				<td><%= employee.getUsername() %></td>
				<td><a
					href="EmployeeReportServlet?employeeId=<%= employee.getEmployeeId() %>">View
						Report</a></td>
			</tr>
			<% } %>
		</tbody>
	</table>
</body>
</html>
