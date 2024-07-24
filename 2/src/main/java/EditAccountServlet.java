import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/EditAccountServlet")
public class EditAccountServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    	// TODO Auto-generated method stub
    	doPost(req, resp);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String employeeId = request.getParameter("employeeId");

        EditAccountDAO dao = new EditAccountDAO();
        if (request.getParameter("username") == null) {
            // Fetch employee details
            Employee employee = dao.getEmployeeById(employeeId);
            if (employee != null) {
                request.setAttribute("employee", employee);
                request.setAttribute("employeeId", employeeId);
                request.setAttribute("username", employee.getUsername());
                request.setAttribute("dob", employee.getDob());
                request.setAttribute("email", employee.getEmail());
                request.setAttribute("address", employee.getAddress());
                request.setAttribute("phonenumber", employee.getPhoneNumber());
                request.setAttribute("gender", employee.getGender());
                request.setAttribute("dateofjoining", employee.getDateOfJoining());
                request.getRequestDispatcher("Edit.jsp").forward(request, response);
            } else {
                response.getWriter().println("<html><body><h2>No employee found with ID: " + employeeId + "</h2></body></html>");
            }
        } else {
            // Update employee details
            String username = request.getParameter("username");
            String dob = request.getParameter("dob");
            String email = request.getParameter("email");
            String address = request.getParameter("address");
            String phonenumber = request.getParameter("phonenumber");
            String gender = request.getParameter("gender");
            String dateofjoining = request.getParameter("dateofjoining");

            boolean success = dao.updateEmployee(employeeId, username, dob, email, address, phonenumber, gender, dateofjoining);

            response.setContentType("text/html");
            response.setCharacterEncoding("UTF-8");

            if (success) {
                response.getWriter().println(
                    "<html><head><style>" +
                    "body { font-family: Arial, sans-serif; background: linear-gradient(to right, #4b6cb7, #182848); display: flex; justify-content: center; align-items: center; height: 100vh; margin: 0; }" +
                    ".container { background: #fff; padding: 40px; border-radius: 10px; box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1); text-align: center; }" +
                    ".container h2 { color: #4b6cb7; margin-bottom: 20px; }" +
                    ".container a { padding: 12px 20px; background: #4b6cb7; color: #fff; text-decoration: none; border-radius: 5px; transition: background 0.3s ease; font-size: 16px; }" +
                    ".container a:hover { background: #182848; }" +
                    "</style></head><body>" +
                    "<div class='container'><h2>Updated successfully!</h2><a href='adminDash.jsp'>Go back to home</a></div>" +
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
                    "<div class='container'><h2>Failed to update employee details. Please try again.</h2><a href='adminDash.jsp'>Go back to home</a></div>" +
                    "</body></html>"
                );
            }
        }
    }
}
