import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class AdminAssociateDAO {

    private static final String JDBC_URL = "jdbc:mysql://localhost:3306/time_tracker";
    private static final String JDBC_USER = "root";
    private static final String JDBC_PASSWORD = "75830102";

    public boolean validateUser(String role, String username, String password) {
        String query = null;

        if ("admin".equals(role) || "associate".equals(role)) {
            query = "SELECT * FROM users WHERE role = ? AND username = ? AND password = ?";
        }

        if (query == null) {
            return false;
        }
try {
	Class.forName("com.mysql.cj.jdbc.Driver");
} catch (ClassNotFoundException e) {
	// TODO Auto-generated catch block
	e.printStackTrace();
}
        try (Connection conn = DriverManager.getConnection(JDBC_URL, JDBC_USER, JDBC_PASSWORD);
             PreparedStatement stmt = conn.prepareStatement(query)) {

            stmt.setString(1, role);
            stmt.setString(2, username);
            stmt.setString(3, password);

            try (ResultSet rs = stmt.executeQuery()) {
                return rs.next();
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }
}
