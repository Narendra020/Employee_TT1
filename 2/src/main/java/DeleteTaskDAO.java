import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class DeleteTaskDAO {
    private static final String JDBC_URL = "jdbc:mysql://localhost:3306/time_tracker";
    private static final String JDBC_USERNAME = "root";
    private static final String JDBC_PASSWORD = "75830102";

    public void deleteTask(String taskId) throws SQLException {
        String sql = "DELETE FROM employeetasks WHERE taskId = ?";

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }

        try (Connection connection = DriverManager.getConnection(JDBC_URL, JDBC_USERNAME, JDBC_PASSWORD);
             PreparedStatement statement = connection.prepareStatement(sql)) {

            statement.setString(1, taskId);
            statement.executeUpdate();
        }
    }
}
