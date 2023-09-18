package FinalProject.Servlets;

import FinalProject.Model.Login;
import FinalProject.Repo.Entry_Repo;
import FinalProject.Repo.Login_Repo;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "LoginServlet", value = "/login")
public class LoginServlet extends HttpServlet {
      private static final Integer id = 1;
       private Login_Repo loginRepo;



    //All servlets also have init() and destroy() per docs as well as service methods
    public void init() {
       loginRepo = new Login_Repo();
    }

    //Service methods; correspond to an http request type get/put/post/delete
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.sendRedirect("user/login");
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            authenticate(request, response);
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }
    }

    private void authenticate(HttpServletRequest request, HttpServletResponse response) throws IOException,
            ServletException, ClassNotFoundException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        Login login = new Login();
        login.setUsername(username);
        login.setPassword(password);
        Class.forName("com.mysql.cj.jdbc.Driver");

        try {
            if (loginRepo.validate(login)) {
                HttpSession session=request.getSession();
                session.setAttribute("username", username);
                session.setAttribute("password", password);
                Entry_Repo er = new Entry_Repo();
                RequestDispatcher dispatcher = request.getRequestDispatcher("/diaryEntries/listAll");
                dispatcher.forward(request, response);
            } else {
                //CREATE A REDIRECT
                request.setAttribute("msg", "Username or password not found; Please try again.");
                RequestDispatcher dispatcher = request.getRequestDispatcher("View-JSP/Login.jsp");
                dispatcher.forward(request, response);

            }
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    }
}
