import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/DeleteEmployeeServlet")
public class DeleteEmployeeServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
@Override
protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	// TODO Auto-generated method stub
	doPost(req, resp);
}
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String employeeId = request.getParameter("employeeId");

        DeleteEmployeeDAO dao = new DeleteEmployeeDAO();
        boolean success = dao.deleteEmployee(employeeId);

        response.setContentType("text/html");
        response.setCharacterEncoding("UTF-8");

        if (success) {
            response.getWriter().println(
                "<html><head><style>" +
                "body { font-family: Arial, sans-serif; background: linear-gradient(to right, #4b6cb7, #182848); display: flex; justify-content: center; align-items: center; height: 100vh; margin: 0; }" +
                ".container { background: #fff; padding: 40px; border-radius: 10px; box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1); text-align: center; }" +
                ".container h2 { color: #ff0000; margin-bottom: 20px; }" +
                ".container a { padding: 12px 20px; background: #4b6cb7; color: #fff; text-decoration: none; border-radius: 5px; transition: background 0.3s ease; font-size: 16px; }" +
                ".container a:hover { background: #182848; }" +
                "</style></head><body>" +
                "<div class='container'><h2>Employee account deleted successfully!</h2>" +
                "<a href='adminDash.jsp'>Go back to home</a></div>" +
                "</body></html>"
            );
        } else {
            response.getWriter().println(
                "<html><head><style>" +
                "body { font-family: Arial, sans-serif; background: linear-gradient(to right, #4b6cb7, #182848); display: flex; justify-content: center; align-items: center; height: 100vh; margin: 0; }" +
                ".container { background: #fff; padding: 40px; border-radius: 10px; box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1); text-align: center; }" +
                ".container h2 { color: #ff0000; margin-bottom: 20px; }" +
                ".container a { padding: 12px 20px; background: #4b6cb7; color: #fff; text-decoration: none; border-radius: 5px; transition: background 0.3s ease; font-size: 16px; }" +
                ".container a:hover { background: #182848; }" +
                "</style></head><body>" +
                "<div class='container'><h2>Failed to delete employee account. Please try again.</h2>" +
                "<a href='deleteEmployee.jsp'>Go back</a></div>" +
                "</body></html>"
            );
        }
    }
}
