package FinalProject.Servlets;

import FinalProject.Utils.JDBC_Connection;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.sql.*;
import java.util.ArrayList;

@WebServlet(name = "EconIndicatorSearchServlet", value = "/EconIndicatorSearchServlet")
public class EconIndicatorSearchServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String criteria = request.getParameter("criteria").toString();
        Integer col = Integer.parseInt( request.getParameter("colName1") );
        String tbl = request.getParameter("tableName").toString();
        String colName = "";
        System.out.println("COL IS: " + col);
        if(col==1){
            colName="date";
        } else {
            switch(tbl) {
                case "ahe":
                    colName= "rate";
                    break;
                case "infl":
                    colName= "percent";
                    break;
                case "gdp":
                    colName= "amount";
                    break;
                case "emp":
                    colName= "numPpl";
                    break;
                case "pce":
                    colName= "idk";
                    break;
                case "vix":
                    colName= "idx";
                    break;
                default:
                   return;
            }
        }

        String h = "Date, Metric";
        String statement = "EMPTY";

        if(!tbl.equals("")){
            statement = "select * from "+ tbl +" where " + colName +" LIKE \'%"+ criteria + "%\' ;" ;
        } else {
            System.out.println("DO POST() ECON SEARCH SERVLET DB ERROR");
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
        request.getSession().setAttribute("econResults", list);
        RequestDispatcher rd = request.getRequestDispatcher("/DB_Search_Functions/EcoIndicatorsSearch.jsp");
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
