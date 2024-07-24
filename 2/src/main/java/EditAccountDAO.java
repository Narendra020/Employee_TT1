import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class EditAccountDAO {

    private String jdbcURL = "jdbc:mysql://localhost:3306/time_tracker";
    private String jdbcUsername = "root";
    private String jdbcPassword = "75830102";

    private static final String SELECT_EMPLOYEE_BY_ID = "SELECT * FROM employeeinfo WHERE employeeId = ?";
    private static final String UPDATE_EMPLOYEE_SQL = "UPDATE employeeinfo SET username = ?, dob = ?, email = ?, address = ?, phonenumber = ?, gender = ?, dateofjoining = ? WHERE employeeId = ?";

    public Employee getEmployeeById(String employeeId) {
        Employee employee = null;
        try {
			Class.forName("com.mysql.cj.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
        try (Connection connection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_EMPLOYEE_BY_ID);) {
            preparedStatement.setString(1, employeeId);
            ResultSet rs = preparedStatement.executeQuery();

            if (rs.next()) {
                String username = rs.getString("username");
                String dob = rs.getString("dob");
                String email = rs.getString("email");
                String address = rs.getString("address");
                String phoneNumber = rs.getString("phonenumber");
                String gender = rs.getString("gender");
                String dateOfJoining = rs.getString("dateofjoining");
                employee = new Employee(employeeId, username, dob, email, address, phoneNumber, gender, dateOfJoining);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return employee;
    }

    public boolean updateEmployee(String employeeId, String username, String dob, String email, String address, String phoneNumber, String gender, String dateOfJoining) {
        boolean rowUpdated = false;
        try (Connection connection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
             PreparedStatement statement = connection.prepareStatement(UPDATE_EMPLOYEE_SQL);) {
            statement.setString(1, username);
            statement.setString(2, dob);
            statement.setString(3, email);
            statement.setString(4, address);
            statement.setString(5, phoneNumber);
            statement.setString(6, gender);
            statement.setString(7, dateOfJoining);
            statement.setString(8, employeeId);

            rowUpdated = statement.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return rowUpdated;
    }
}
