package FinalProject.Servlets;

import FinalProject.Model.DiaryEntry;
import FinalProject.Repo.DiaryRepository;
import FinalProject.Repo.Entry_Repo;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "SearchServlet", value = "/SearchServlet")
public class SearchServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("doGet() ");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String criteria = request.getParameter("criteria").toString();
        Boolean marked = Boolean.parseBoolean( request.getParameter("isBookmarked") );
        if (criteria.equals("") && !marked){
            RequestDispatcher rd = request.getRequestDispatcher(request.getContextPath() + "/searchEntries");
            rd.forward(request, response);
        } else {
            getSearchResults(request, response);
        }
    }

    public void getSearchResults(HttpServletRequest request, HttpServletResponse response) throws IOException {
        ArrayList<DiaryEntry> ans = new ArrayList<>();
        Boolean marked = Boolean.parseBoolean( request.getParameter("isBookmarked") );
        String criteria = request.getParameter("criteria").toString();
        String un = request.getParameter("username");
        Entry_Repo repo = new Entry_Repo();
        ArrayList<DiaryEntry> list = repo.selectUserEntries(un);
        for(DiaryEntry e : list){
            String t = e.toString();
            if(marked){
                if(e.getBookmarked() && t.contains(criteria)){
                    ans.add(e);
                }
            } else {
                if(t.contains(criteria)){
                    ans.add(e);
                }
            }
        }
        request.getSession().setAttribute("results", ans);
        String rt = request.getContextPath() + "/searchEntries" ;
        response.sendRedirect(rt);
    }
}
