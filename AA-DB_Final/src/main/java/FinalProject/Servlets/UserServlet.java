package FinalProject.Servlets;

import FinalProject.Model.User;
import FinalProject.Repo.User_Repo;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;


@WebServlet("/user/*")
public class UserServlet extends HttpServlet {
    private static final Integer id = 1 ;
    private User_Repo repo;

    public void init() {
        repo = new User_Repo();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String endUrl = request.getPathInfo();
        if(endUrl.contains("insert")) {
            register(request, response);
        }else if(endUrl.contains("alter")){
            try {
                updateUser(request, response);
            } catch (ClassNotFoundException e) {
                throw new RuntimeException(e);
            }
        } else {
            //do stuff
        }

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
            response.sendRedirect("View-JSP/RegisterUser.jsp");
    }

    private void register(HttpServletRequest request, HttpServletResponse response)
            throws IOException, ServletException {
        String firstName = request.getParameter("firstName");
        String lastName = request.getParameter("lastName");
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        User user = new User();
        user.setFirstName(firstName);
        user.setLastName(lastName);
        user.setUsername(username);
        user.setPassword(password);

        try {
            int result = repo.registerUser(user);
            if (result == 1) {
                request.setAttribute("NOTIFICATION", "User Registered");
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        response.sendRedirect(request.getContextPath() + "/index.jsp");
    }

    private void updateUser(HttpServletRequest request, HttpServletResponse response) throws IOException, ClassNotFoundException {

        String firstName = request.getParameter("firstName");
        String lastName = request.getParameter("lastName");
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String pwd2 = request.getParameter("new-password");
        Integer id = Integer.parseInt( request.getParameter("id") );
        String oldUn = request.getParameter("old-username");
        User user = new User();
        System.out.println("UPDATE USER() ") ;
//        if(password.equals(pwd2)){
            user.setFirstName(firstName);
            user.setLastName(lastName);
            user.setUsername(username);
            user.setPassword(password);
            user.setUsername(username);
            repo.updateUser(user, oldUn);
//        }
//        try {
//            int result = repo.registerUser(user);
//            if (result == 1) {
//                request.setAttribute("NOTIFICATION", "User Registered");
//            }
//
//        } catch (Exception e) {
//            e.printStackTrace();
//        }

        System.out.println("NEW USER-> " + user.toString());
        response.sendRedirect(request.getContextPath() + "/diaryEntries/listAll" );
    }
}