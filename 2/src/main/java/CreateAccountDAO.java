import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class CreateAccountDAO {
    private String jdbcURL = "jdbc:mysql://localhost:3306/time_tracker";
    private String jdbcUsername = "root";
    private String jdbcPassword = "75830102";

    private static final String INSERT_ACCOUNT_SQL = "INSERT INTO employeeinfo (username, dob, email, address, phoneNumber, gender, dateOfJoining, employeeId, password) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";

    public boolean createAccount(String username, String dob, String email, String address, String phoneNumber, String gender, String dateOfJoining, String employeeId, String password) {
        boolean rowInserted = false;
        try {
			Class.forName("com.mysql.cj.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
        try (Connection connection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
             PreparedStatement preparedStatement = connection.prepareStatement(INSERT_ACCOUNT_SQL)) {
            preparedStatement.setString(1, username);
            preparedStatement.setString(2, dob);
            preparedStatement.setString(3, email);
            preparedStatement.setString(4, address);
            preparedStatement.setString(5, phoneNumber);
            preparedStatement.setString(6, gender);
            preparedStatement.setString(7, dateOfJoining);
            preparedStatement.setString(8, employeeId);
            preparedStatement.setString(9, password);

            rowInserted = preparedStatement.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return rowInserted;
    }

	public boolean createAccount1(String username, String dob, String email, String address, String phonenumber,
			String gender, String dateofjoining, String employeeId, String generatedPassword) {
		// TODO Auto-generated method stub
		return false;
	}
}
