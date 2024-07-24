import java.io.IOException;
import java.util.Random;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/CreateAccountServlet")
public class CreateAccountServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    	// TODO Auto-generated method stub
    	doPost(req, resp);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String dob = request.getParameter("dob");
        String email = request.getParameter("email");
        String address = request.getParameter("address");
        String phonenumber = request.getParameter("phonenumber");
        String gender = request.getParameter("gender");
        String dateofjoining = request.getParameter("dateofjoining");

        String generatedPassword = UUID.randomUUID().toString().substring(0, 8); // Generate a random password
        String employeeId = "EMP" + generateRandomNumber(10000, 99999); // Generate EMPxxxxx format

        CreateAccountDAO dao = new CreateAccountDAO();
        boolean success = dao.createAccount(username, dob, email, address, phonenumber, gender, dateofjoining, employeeId, generatedPassword);

        response.setContentType("text/html");
        response.setCharacterEncoding("UTF-8");

        if (success) {
            response.getWriter().println(
                "<html><head><style>" +
                "body { font-family: Arial, sans-serif; background: linear-gradient(to right, #4b6cb7, #182848); display: flex; justify-content: center; align-items: center; height: 100vh; margin: 0; }" +
                ".container { background: #fff; padding: 40px; border-radius: 10px; box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1); text-align: center; }" +
                ".container h2 { color: #4b6cb7; margin-bottom: 20px; }" +
                ".container p { color: #333; margin-bottom: 20px; font-size: 16px; }" +
                ".container a { padding: 12px 20px; background: #4b6cb7; color: #fff; text-decoration: none; border-radius: 5px; transition: background 0.3s ease; font-size: 16px; }" +
                ".container a:hover { background: #182848; }" +
                "</style></head><body>" +
                "<div class='container'><h2>Account created successfully!</h2>" +
                "<p>Employee ID: " + employeeId + "</p>" +
                "<p>Password: " + generatedPassword + "</p>" +
                "<a href='adminDash.jsp'>Go back to home</a></div>" +
                "</body></html>"
            );
        } else {
            response.getWriter().println(
                "<html><head><style>" +
                "body { font-family: Arial, sans-serif; background: linear-gradient(to right, #4b6cb7, #182848); display: flex; justify-content: center; align-items: center; height: 100vh; margin: 0; }" +
                ".container { background: #fff; padding: 40px; border-radius: 10px; box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1); text-align: center; }" +
                ".container h2 { color: #4b6cb7; margin-bottom: 20px; }" +
                ".container a { padding: 12px 20px; background: #4b6cb7; color: #fff; text-decoration: none; border-radius: 5px; transition: background 0.3s ease; font-size: 16px; }" +
                ".container a:hover { background: #182848; }" +
                "</style></head><body>" +
                "<div class='container'><h2>Error creating account. Please try again.</h2><a href='createAccount.jsp'>Go back</a></div>" +
                "</body></html>"
            );
        }
    }

    // Method to generate a random number within a range
    private int generateRandomNumber(int min, int max) {
        Random random = new Random();
        return random.nextInt(max - min + 1) + min;
    }
}
