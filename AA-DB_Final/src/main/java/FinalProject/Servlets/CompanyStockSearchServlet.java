package FinalProject.Servlets;

import FinalProject.Utils.JDBC_Connection;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.sql.*;
import java.util.ArrayList;

@WebServlet(name = "CompanyStockSearchServlet", value = "/CompanyStockSearchServlet")
public class CompanyStockSearchServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String criteria = request.getParameter("criteria").toString();
        String c1 = request.getParameter("colName1").toString();
        String tbl = request.getParameter("tableName").toString();
        String h = "Date, Open, High, Low, Close, AdjClose, Volume";
        String statement = "EMPTY";

        if(!tbl.equals("")){
            statement = "select * from "+ tbl +" where " + c1 +" LIKE \'%"+ criteria + "%\' ;" ;
        } else {
            System.out.println("DO POST() Company Info SEARCH SERVLET DB ERROR");
        }

        System.out.println(statement);
        ArrayList<String> list = null;
        try {
            list = searchDb(statement);
            list.add(0, h);
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }
        for(String s : list){
            System.out.println(s.toString());
        }
        request.getSession().setAttribute("stockResults", list);
        RequestDispatcher rd = request.getRequestDispatcher("/DB_Search_Functions/CompanyStocksSearch.jsp");
        rd.forward(request, response);
    }


    public ArrayList<String> searchDb(String s) throws ClassNotFoundException {
        ArrayList <String> ans = new ArrayList<>();
        Class.forName("com.mysql.cj.jdbc.Driver");
        try (Connection con = JDBC_Connection.connectToMysql();
             PreparedStatement ps = con.prepareStatement(s);) {
            ResultSet rs = ps.executeQuery();
            String sb = "";
            ResultSetMetaData metaData = rs.getMetaData();
            int cc = metaData.getColumnCount();
            while (rs.next()) {
                for (int i = 1; i <= cc; i++) {
                    sb += (rs.getString(i));
                    if (i < cc) {
                        sb += (", ");
                    }
                }
                sb += ("\n");
                ans.add(sb);
                sb="";
            }

            String resultString = sb.toString();
        } catch (SQLException exception) {
            exception.printStackTrace();
        }
        return ans;
    }
}
