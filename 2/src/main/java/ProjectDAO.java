import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class ProjectDAO {

    private static final String JDBC_URL = "jdbc:mysql://localhost:3306/time_tracker";
    private static final String JDBC_USER = "root";
    private static final String JDBC_PASSWORD = "75830102";

    public boolean addProject(String projectId, String projectName, String description) {
        String sql = "INSERT INTO projects (projectId, projectName, description) VALUES (?, ?, ?)";
        try {
			Class.forName("com.mysql.cj.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
        try (Connection conn = DriverManager.getConnection(JDBC_URL, JDBC_USER, JDBC_PASSWORD);
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setString(1, projectId);
            stmt.setString(2, projectName);
            stmt.setString(3, description);

            int rowsAffected = stmt.executeUpdate();
            return rowsAffected > 0;

        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
}
