package FinalProject.Servlets;

import FinalProject.Utils.JDBC_Connection;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.sql.*;
import java.util.ArrayList;

@WebServlet(name = "SearchBusinessDatabaseServlet", value = "/SearchBusinessDatabaseServlet")
public class SearchBusinessDatabaseServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String criteria = request.getParameter("criteria").toString();
        String c1 = request.getParameter("colName1").toString();
        String c2 = request.getParameter("colName2").toString();
        String c3 = request.getParameter("colName3").toString();
        String tbl = request.getParameter("tableName").toString();
        String t1 = request.getParameter("tableName1").toString();
        String t2 = request.getParameter("tableName2").toString();
        String t3 = request.getParameter("tableName3").toString();
        String[] res = {criteria, c1, c2, c3, tbl, t1, t2, t3};
        String h = "";
        String h1, h2, h3;
        h3= "Industry Name, Number of Firms, Total Taxable Income, Total Taxes Paid Accrual, Total Cash Taxes Paid, " +
                "Cash Taxes Accrual Ratio, Effective Tax Rate (All Companies), Effective Tax Rate (For-Profit Companies), " +
                "Effective Tax Rate (Aggregate), Cash Tax Rate (For-Profit Companies), Cash Tax Rate (Aggregate) \n" ;
        h1=" Industry Name, Number of Firms, Number of Employees, Market Capitalization, Revenues, Market Cap per Employee, " +
                "Revenues per Employee, Stock-based Compensation, Stock-based Compensation as Percentage of Revenue \n";
        h2="Year, S&P 500, 3-Month Treasury Bill, US Treasury Bond, Baa Corporate Bond, Real Estate, Gold \n";

        String statement = "EMPTY";
        if(tbl.equals("tax")){
            h=h1;
            statement = "select * from " + t1 + " where " + c1 +" LIKE \'%"+ criteria + "%\'" ;
        }else if(tbl.equals("returns")){
            h=h2;
            statement = "select * from " + t2 + " where " + c2 +" LIKE \'%"+ criteria + "%\'" ;
        }else if(tbl.equals("employment")){
            h=h3;
            statement = "select * from " + t3 + " where " + c3 +" LIKE \'%"+ criteria + "%\'" ;
        } else {
            System.out.println("DO POST() SEARCH SERVLET DB ERROR");
        }
        System.out.println(statement);
        ArrayList<String> list = null;
        try {
            list = searchDb(statement);
            list.add(0, h);
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }
        String r = "";
        for(String t : list){ r += t + "\n"; }
        System.out.println("RESULTS ->\n" + r);

        request.getSession().setAttribute("businessResults", list);
        RequestDispatcher rd = request.getRequestDispatcher("/DB_Search_Functions/BusinessSectionSearch.jsp");
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
