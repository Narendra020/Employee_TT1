import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.timetracker.model.Task;

@WebServlet("/EmployeeDetailsServlet")
public class EmployeeDetailsServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        EmployeeDetailsDAO dao = new EmployeeDetailsDAO();
        List<Task> tasks = dao.getAllTasks();

        req.setAttribute("tasks", tasks);
        req.getRequestDispatcher("employeeDetails.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        EmployeeDetailsDAO dao = new EmployeeDetailsDAO();
        for (String param : req.getParameterMap().keySet()) {
            if (param.startsWith("status_")) {
                String taskId = param.substring("status_".length());
                String status = req.getParameter(param);
                dao.updateTaskStatus(taskId, status);
            }
        }
        // Redirect to refresh the page after updates
        resp.sendRedirect("EmployeeDetailsServlet");
    }
}
