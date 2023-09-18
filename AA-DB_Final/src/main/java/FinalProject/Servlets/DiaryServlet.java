package FinalProject.Servlets;

import FinalProject.Model.DiaryEntry;
import FinalProject.Repo.Entry_Repo;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import java.io.IOException;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.List;


@WebServlet(name = "DiaryServlet", value = "/diaryDo/*")
public class DiaryServlet extends HttpServlet {
    private Entry_Repo repo;

    public void init() {
        repo = new Entry_Repo();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String endUrl = request.getPathInfo();
        if (endUrl.contains("/delete"))
        try {
            String entryId = endUrl.substring(8, endUrl.length());
            request.setAttribute("entryId", entryId);
            try {
                deleteEntry(request, response);
            } catch (Exception e) {
                e.printStackTrace();
                throw new RuntimeException(e);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        else if(endUrl.contains("listEverything")){
            //do stuff
            try {
                listEverything(request, response);
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
        } else if(endUrl.contains("/diaryForm")){
            String entryId = endUrl.substring(11, endUrl.length());
            request.setAttribute("entryId", entryId);
            showForm(request, response, entryId);
        }else {
            //default stuff
        }
    }
    //Handle entry modification
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String endUrl = request.getPathInfo();
        String midUrl = request.getServletPath();
        String entryId = endUrl.substring(8, endUrl.length());
        try{
            if (endUrl.contains("/update")) {
                request.setAttribute("entryId", entryId);
                if(entryId.toString().equals("-1")){
                    createEntry(request, response);
                }
                else{
                    updateEntry(request, response);
                }
            }
        } catch (Exception e){
            e.printStackTrace();
        }
    }


    /***************************************** Process Requests ******************************************************/

    private void showForm(HttpServletRequest request, HttpServletResponse response, String entryId) throws ServletException, IOException {
        String rt =  "/editForm/" + entryId;
        RequestDispatcher dispatcher = request.getRequestDispatcher(rt);
        dispatcher.forward(request, response);

    }
    private void deleteEntry(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException, ServletException {
        String s = request.getAttribute("entryId").toString();
        Integer entryId = Integer.parseInt(s);
        repo.deleteEntry(entryId);
        String rt = request.getContextPath() + "/diaryEntries/listAll" ;
        response.sendRedirect(rt);
    }



        private void listEverything(HttpServletRequest request, HttpServletResponse response)
        throws SQLException, IOException, ServletException {
        List<DiaryEntry> list = repo.selectAllEntries();
            System.out.println(list.toString());
        }


    private void createEntry(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException {
        System.out.println("createEntry() ->");
        String title = request.getParameter("title");
        String username = request.getParameter("username");
        String description = request.getParameter("description");
        String contents = request.getParameter("contents");
        LocalDate entry_date = LocalDate.parse(request.getParameter("entry_date"));
        boolean isBookmarked = Boolean.valueOf(request.getParameter("isBookmarked"));

        DiaryEntry entry = new DiaryEntry(title, description,contents, entry_date, username,
                isBookmarked);

        repo.createEntry(entry);
        response.sendRedirect(request.getContextPath() + "/diaryEntries/listAll");
    }

    private void updateEntry(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException {
        Integer id = Integer.parseInt( request.getAttribute("entryId").toString() );
        String title = request.getParameter("title");
        String username = request.getParameter("username");
        String description = request.getParameter("description");
        String contents = request.getParameter("contents");
        LocalDate entry_date = LocalDate.parse(request.getParameter("entry_date"));
        boolean isBookmarked = Boolean.valueOf(request.getParameter("isBookmarked"));

        DiaryEntry entry = new DiaryEntry(id, title, description,contents, entry_date, isBookmarked,
                username);
        repo.updateEntry(entry);
        response.sendRedirect(request.getContextPath()+"/diaryEntries/listAll");
    }

}

