import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/addProject")
public class AddProjectServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String projectId = request.getParameter("projectId");
        String projectName = request.getParameter("projectName");
        String description = request.getParameter("description");

        ProjectDAO dao = new ProjectDAO();
        boolean isAdded = dao.addProject(projectId, projectName, description);

        if (isAdded) {
            request.setAttribute("message", "Project added successfully!");
        } else {
            request.setAttribute("message", "Failed to add project. Please try again.");
        }

        request.getRequestDispatcher("addProject.jsp").forward(request, response);
    }
}
