import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class AddTaskDAO {
    private static final String JDBC_URL = "jdbc:mysql://localhost:3306/time_tracker";
    private static final String JDBC_USERNAME = "root";
    private static final String JDBC_PASSWORD = "75830102";

    public void addTask(String employeeId, String employeeName, String role, String project, String date, String startTime, String endTime, String timeDuration, String task, String description) throws SQLException {
        String sql = "INSERT INTO employeetasks (employeeId, employeeName, role, project, date, startTime, endTime, timeDuration, task, description) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
try {
	Class.forName("com.sql.cj.jdbc.Driver");
} catch (ClassNotFoundException e) {
	// TODO Auto-generated catch block
	e.printStackTrace();
}
        try (Connection connection = DriverManager.getConnection(JDBC_URL, JDBC_USERNAME, JDBC_PASSWORD);
             PreparedStatement statement = connection.prepareStatement(sql)) {

            statement.setString(1, employeeId);
            statement.setString(2, employeeName);
            statement.setString(3, role);
            statement.setString(4, project);
            statement.setString(5, date);
            statement.setString(6, startTime);
            statement.setString(7, endTime);
            statement.setString(8, timeDuration);
            statement.setString(9, task);
            statement.setString(10, description);

            statement.executeUpdate();
        }
    }
}
