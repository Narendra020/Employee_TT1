import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/AdminAssociateLoginServlet")
public class AdminAssociateLoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
@Override
protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	// TODO Auto-generated method stub
	doPost(req, resp);
}
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String role = request.getParameter("role");
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        AdminAssociateDAO dao = new AdminAssociateDAO();
        boolean isValid = dao.validateUser(role, username, password);
        System.out.println(role);
        System.out.println(username);
        System.out.println(password);
        

        if (isValid) {
            HttpSession session = request.getSession();
            session.setAttribute("role", role);
            session.setAttribute("username", username);

            if ("admin".equals(role)) {
                response.sendRedirect("adminDash.jsp");
            } else if ("associate".equals(role)) {
                response.sendRedirect("associateDash.jsp");
            }
        } else {
            request.setAttribute("error", "Invalid username or password");
            request.getRequestDispatcher("adminAssociateLogin.jsp").forward(request, response);
        }
    }
}
