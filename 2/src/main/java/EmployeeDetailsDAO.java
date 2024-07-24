import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.timetracker.model.Task;

public class EmployeeDetailsDAO {

    private Connection getConnection() throws SQLException {
        String jdbcURL = "jdbc:mysql://localhost:3306/time_tracker";
        String jdbcUsername = "root";
        String jdbcPassword = "75830102";
        return DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
    }

    public List<Task> getAllTasks() {
        List<Task> tasks = new ArrayList<>();
        String query = "SELECT * FROM employeetasks";
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(query);
             ResultSet resultSet = preparedStatement.executeQuery()) {
            while (resultSet.next()) {
                Task task = new Task();
                task.setTaskId(resultSet.getString("taskId"));
                task.setEmployeeId(resultSet.getString("employeeId"));
                task.setEmployeeName(resultSet.getString("employeeName"));
                task.setRole(resultSet.getString("role"));
                task.setProject(resultSet.getString("project"));
                task.setDate(resultSet.getDate("date"));
                task.setStartTime(resultSet.getTime("startTime"));
                task.setEndTime(resultSet.getTime("endTime"));
                task.setTimeDuration(resultSet.getString("timeDuration"));
                task.setTask(resultSet.getString("task"));
                task.setDescription(resultSet.getString("description"));
                task.setStatus(resultSet.getString("status"));
                tasks.add(task);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return tasks;
    }

    public boolean updateTaskStatus(String taskId, String status) {
        String query = "UPDATE employeetasks SET status = ? WHERE taskId = ?";
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(query)) {
            preparedStatement.setString(1, status);
            preparedStatement.setString(2, taskId);
            int rowsUpdated = preparedStatement.executeUpdate();
            return rowsUpdated > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
}
