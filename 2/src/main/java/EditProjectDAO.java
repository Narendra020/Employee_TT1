import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class EditProjectDAO {

    private Connection getConnection() throws SQLException {
        // Implement your database connection here
        String jdbcURL = "jdbc:mysql://localhost:3306/time_tracker";
        String jdbcUsername = "root";
        String jdbcPassword = "75830102";
        return DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
    }

    public Project getProjectById(String projectId) {
        Project project = null;
        String query = "SELECT * FROM projects WHERE projectId = ?";
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(query)) {
            preparedStatement.setString(1, projectId);
            try (ResultSet resultSet = preparedStatement.executeQuery()) {
                if (resultSet.next()) {
                    project = new Project();
                    project.setProjectId(resultSet.getString("projectId"));
                    project.setProjectName(resultSet.getString("projectName"));
                    project.setDescription(resultSet.getString("description"));
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return project;
    }

    public boolean updateProject(Project project) {
        String query = "UPDATE projects SET projectName = ?, description = ? WHERE projectId = ?";
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(query)) {
            preparedStatement.setString(1, project.getProjectName());
            preparedStatement.setString(2, project.getDescription());
            preparedStatement.setString(3, project.getProjectId());
            int rowsAffected = preparedStatement.executeUpdate();
            return rowsAffected > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
}
