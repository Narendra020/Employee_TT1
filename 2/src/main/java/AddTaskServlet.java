
import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/AddTaskServlet")
public class AddTaskServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    	// TODO Auto-generated method stub
    	doPost(req, resp);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String employeeId = request.getParameter("employeeId");
        String employeeName = request.getParameter("employeeName");
        String role = request.getParameter("role");
        String project = request.getParameter("project");
        String date = request.getParameter("date");
        String startTime = request.getParameter("startTime");
        String endTime = request.getParameter("endTime");
        String timeDuration = request.getParameter("timeDuration");
        String task = request.getParameter("task");
        String description = request.getParameter("description");

        AddTaskDAO taskDAO = new AddTaskDAO();
        try {
            taskDAO.addTask(employeeId, employeeName, role, project, date, startTime, endTime, timeDuration, task, description);
            response.sendRedirect("taskAddedSuccess.jsp");
        } catch (SQLException e) {
            e.printStackTrace();
            response.sendRedirect("taskAddError.jsp");
        }
    }
}
