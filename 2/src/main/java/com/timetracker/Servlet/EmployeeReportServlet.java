package com.timetracker.Servlet;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.timetracker.model.EmployeeHours;

@WebServlet("/EmployeeReportServlet")
public class EmployeeReportServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String employeeId = request.getParameter("employeeId");
        com.timetracker.dao.EmployeeReportDAO dao = new com.timetracker.dao.EmployeeReportDAO();
        
        // Fetch data
        EmployeeHours employeeHours = dao.getEmployeeHours(employeeId);
        
        // Set data to request scope
        request.setAttribute("employeeHours", employeeHours);
        request.getRequestDispatcher("EmployeeReport.jsp").forward(request, response);
    }
}
