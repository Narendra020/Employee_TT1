import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class EditTaskDAO {
    private static final String JDBC_URL = "jdbc:mysql://localhost:3306/time_tracker";
    private static final String JDBC_USERNAME = "root";
    private static final String JDBC_PASSWORD = "75830102";

    public void updateTask(String taskId, String project, String date, String startTime, String endTime, String timeDuration, String task, String description) throws SQLException {
        String sql = "UPDATE employeetasks SET project = ?, date = ?, startTime = ?, endTime = ?, timeDuration = ?, task = ?, description = ? WHERE taskId = ?";
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        try (Connection connection = DriverManager.getConnection(JDBC_URL, JDBC_USERNAME, JDBC_PASSWORD);
             PreparedStatement statement = connection.prepareStatement(sql)) {

            statement.setString(1, project);
            statement.setString(2, date);
            statement.setString(3, startTime);
            statement.setString(4, endTime);
            statement.setString(5, timeDuration);
            statement.setString(6, task);
            statement.setString(7, description);
            statement.setString(8, taskId);

            statement.executeUpdate();
        }
    }
}
