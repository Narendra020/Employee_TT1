import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/DeleteTaskServlet")
public class DeleteTaskServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override

    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    	// TODO Auto-generated method stub
    	doPost(req, resp);
    }
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String taskId = request.getParameter("taskId");

        DeleteTaskDAO taskDAO = new DeleteTaskDAO();
        try {
            taskDAO.deleteTask(taskId);
            response.sendRedirect("taskDeleteSuccess.jsp");
        } catch (SQLException e) {
            e.printStackTrace();
            response.sendRedirect("taskDeleteError.jsp");
        }
    }
}
