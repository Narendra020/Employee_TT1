import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/DeleteProjectServlet")
public class DeleteProjectServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
 
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    	// TODO Auto-generated method stub
    	doPost(req, resp);
    }
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String projectId = req.getParameter("projectId");

        DeleteProjectDAO dao = new DeleteProjectDAO();
        boolean isDeleted = dao.deleteProject(projectId);

        if (isDeleted) {
            req.setAttribute("message", "Project deleted successfully!");
        } else {
            req.setAttribute("message", "Failed to delete project. Please try again.");
        }

        req.getRequestDispatcher("deleteProject.jsp").forward(req, resp);
    }
}
