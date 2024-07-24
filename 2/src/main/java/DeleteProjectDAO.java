import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class DeleteProjectDAO {

    // Database connection details
    private static final String JDBC_URL = "jdbc:mysql://localhost:3306/time_tracker";
    private static final String JDBC_USERNAME = "root";
    private static final String JDBC_PASSWORD = "75830102";

    // Method to establish a database connection
    private Connection getConnection() throws SQLException {
        return DriverManager.getConnection(JDBC_URL, JDBC_USERNAME, JDBC_PASSWORD);
    }

    // Method to delete a project based on project ID
    public boolean deleteProject(String projectId) {
        boolean isDeleted = false;
        String query = "DELETE FROM projects WHERE projectId = ?";

        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(query)) {

            preparedStatement.setString(1, projectId);

            int rowsAffected = preparedStatement.executeUpdate();
            isDeleted = (rowsAffected > 0);

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return isDeleted;
    }
}
