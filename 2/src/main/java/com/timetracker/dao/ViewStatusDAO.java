package com.timetracker.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.timetracker.model.ViewStatusTask;

public class ViewStatusDAO {
    private static final String JDBC_URL = "jdbc:mysql://localhost:3306/time_tracker"; // Update with your database URL
    private static final String JDBC_USER = "root"; // Update with your database username
    private static final String JDBC_PASSWORD = "75830102"; // Update with your database password

    public List<ViewStatusTask> getTasksByEmployeeId(String employeeId) {
        List<ViewStatusTask> tasks = new ArrayList<>();
        String sql = "SELECT * FROM employeetasks WHERE employeeId = ?";
        
        try (Connection conn = DriverManager.getConnection(JDBC_URL, JDBC_USER, JDBC_PASSWORD);
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, employeeId);
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                ViewStatusTask task = new ViewStatusTask();
                task.setTaskId(rs.getInt("taskId"));
                task.setEmployeeId(rs.getString("employeeId"));
                task.setEmployeeName(rs.getString("employeeName"));
                task.setRole(rs.getString("role"));
                task.setProject(rs.getString("project"));
                task.setDate(rs.getDate("date"));
                task.setStartTime(rs.getTime("startTime"));
                task.setEndTime(rs.getTime("endTime"));
                task.setTimeDuration(rs.getString("timeDuration"));
                task.setTask(rs.getString("task"));
                task.setDescription(rs.getString("description"));
                task.setStatus(rs.getString("status"));
                tasks.add(task);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return tasks;
    }
}
