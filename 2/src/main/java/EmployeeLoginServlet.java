import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/EmployeeLoginServlet")
public class EmployeeLoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
@Override
protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	// TODO Auto-generated method stub
	doPost(req, resp);
}
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String employeeId = request.getParameter("employeeId");
        String password = request.getParameter("password");

        EmployeeLoginDAO dao = new EmployeeLoginDAO();
        boolean isValid = dao.validateEmployee(employeeId, password);

        if (isValid) {
            HttpSession session = request.getSession();
            session.setAttribute("role", "employee");
            session.setAttribute("employeeId", employeeId);

            response.sendRedirect("employeeDash.jsp");
        } else {
            request.setAttribute("error", "Invalid Employee ID or password");
            request.getRequestDispatcher("employeeLogin.jsp").forward(request, response);
        }
    }
}
