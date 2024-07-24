import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/EditProjectServlet")
public class EditProjectServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String projectId = req.getParameter("projectId");
        if (projectId != null && !projectId.isEmpty()) {
            EditProjectDAO dao = new EditProjectDAO();
            Project project = dao.getProjectById(projectId);

            if (project != null) {
                req.setAttribute("project", project);
            } else {
                req.setAttribute("message", "Project not found!");
            }
        } else {
            req.setAttribute("message", "Project ID is required!");
        }
        req.getRequestDispatcher("editProject.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String projectId = req.getParameter("projectId");
        String projectName = req.getParameter("projectName");
        String description = req.getParameter("description");

        Project project = new Project();
        project.setProjectId(projectId);
        project.setProjectName(projectName);
        project.setDescription(description);

        EditProjectDAO dao = new EditProjectDAO();
        boolean isUpdated = dao.updateProject(project);

        if (isUpdated) {
            req.setAttribute("message", "Project updated successfully!");
        } else {
            req.setAttribute("message", "Failed to update project. Please try again.");
        }
        req.getRequestDispatcher("editProject.jsp").forward(req, resp);
    }
}
