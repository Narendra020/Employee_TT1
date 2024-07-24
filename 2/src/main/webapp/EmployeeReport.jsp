<%@ page import="java.util.*, com.timetracker.model.EmployeeHours"%>
<!DOCTYPE html>
<html>
<head>
<title>Employee Report</title>
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
</head>
<body>
	<h1>Employee Report</h1>
	<div>
		<h2>Daily Hours</h2>
		<canvas id="dailyChart"></canvas>
	</div>
	<div>
		<h2>Weekly Hours</h2>
		<canvas id="weeklyChart"></canvas>
	</div>
	<div>
		<h2>Monthly Hours</h2>
		<canvas id="monthlyChart"></canvas>
	</div>

	<script>
        const dailyData = <%= new com.google.gson.Gson().toJson(((EmployeeHours)request.getAttribute("employeeHours")).getDailyHours()) %>;
        const weeklyData = <%= new com.google.gson.Gson().toJson(((EmployeeHours)request.getAttribute("employeeHours")).getWeeklyHours()) %>;
        const monthlyData = <%= new com.google.gson.Gson().toJson(((EmployeeHours)request.getAttribute("employeeHours")).getMonthlyHours()) %>;

        new Chart(document.getElementById('dailyChart'), {
            type: 'pie',
            data: {
                labels: Object.keys(dailyData),
                datasets: [{
                    data: Object.values(dailyData),
                    backgroundColor: 'rgba(75, 192, 192, 0.2)',
                    borderColor: 'rgba(75, 192, 192, 1)',
                    borderWidth: 1
                }]
            }
        });

        new Chart(document.getElementById('weeklyChart'), {
            type: 'bar',
            data: {
                labels: Object.keys(weeklyData),
                datasets: [{
                    label: 'Weekly Hours',
                    data: Object.values(weeklyData),
                    backgroundColor: 'rgba(54, 162, 235, 0.2)',
                    borderColor: 'rgba(54, 162, 235, 1)',
                    borderWidth: 1
                }]
            }
        });

        new Chart(document.getElementById('monthlyChart'), {
            type: 'bar',
            data: {
                labels: Object.keys(monthlyData),
                datasets: [{
                    label: 'Monthly Hours',
                    data: Object.values(monthlyData),
                    backgroundColor: 'rgba(255, 159, 64, 0.2)',
                    borderColor: 'rgba(255, 159, 64, 1)',
                    borderWidth: 1
                }]
            }
        });
    </script>
</body>
</html>
