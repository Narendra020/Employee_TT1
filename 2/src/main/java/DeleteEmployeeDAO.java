import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class DeleteEmployeeDAO {
    private String jdbcURL = "jdbc:mysql://localhost:3306/time_tracker";
    private String jdbcUsername = "root";
    private String jdbcPassword = "75830102";

    private static final String DELETE_EMPLOYEE_SQL = "DELETE FROM employeeinfo WHERE employeeId = ?";

    public boolean deleteEmployee(String employeeId) {
        boolean rowDeleted = false;
        try {
			Class.forName("com.mysql.cj.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
        try (Connection connection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
             PreparedStatement preparedStatement = connection.prepareStatement(DELETE_EMPLOYEE_SQL)) {
            preparedStatement.setString(1, employeeId);

            rowDeleted = preparedStatement.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return rowDeleted;
    }
}
