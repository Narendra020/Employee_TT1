import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.timetracker.dao.ViewStatusDAO;
import com.timetracker.model.ViewStatusTask;

@WebServlet("/viewStatus")
public class ViewStatusServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("employeeId") == null) {
            response.sendRedirect("login.jsp"); // Redirect to login if session is not valid
            return;
        }

        String employeeId = (String) session.getAttribute("employeeId");
        ViewStatusDAO dao = new ViewStatusDAO();
        List<ViewStatusTask> tasks = dao.getTasksByEmployeeId(employeeId);

        request.setAttribute("tasks", tasks);
        request.getRequestDispatcher("viewStatus.jsp").forward(request, response);
    }
}
