package com.timetracker.dao;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.timetracker.model.Employee;
import com.timetracker.model.EmployeeHours;

public class EmployeeReportDAO {
    private static final String JDBC_URL = "jdbc:mysql://localhost:3306/time_tracker";
    private static final String JDBC_USER = "root";
    private static final String JDBC_PASS = "75830102";

    public List<Employee> getAllEmployees() {
        List<Employee> employees = new ArrayList<>();
        try (Connection conn = DriverManager.getConnection(JDBC_URL, JDBC_USER, JDBC_PASS);
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery("SELECT employeeId, username FROM employeeinfo")) {
            
            while (rs.next()) {
                Employee employee = new Employee();
                employee.setEmployeeId(rs.getString("employeeId"));
                employee.setUsername(rs.getString("username"));
                employees.add(employee);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return employees;
    }

    public EmployeeHours getEmployeeHours(String employeeId) {
        EmployeeHours employeeHours = new EmployeeHours();
        try (Connection conn = DriverManager.getConnection(JDBC_URL, JDBC_USER, JDBC_PASS);
             PreparedStatement stmt = conn.prepareStatement(
                 "SELECT taskDate, hoursWorked FROM employeetasks WHERE employeeId = ?")) {
            
            stmt.setString(1, employeeId);
            try (ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    Date taskDate = rs.getDate("taskDate");
                    int hoursWorked = rs.getInt("hoursWorked");
                    employeeHours.addTaskHours(taskDate, hoursWorked);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return employeeHours;
    }
}
