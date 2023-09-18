package FinalProject.Servlets;

import FinalProject.Utils.JDBC_Connection;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.sql.*;
import java.util.ArrayList;

@WebServlet(name = "CompanyInfoSearchServlet", value = "/CompanyInfoSearchServlet")
public class CompanyInfoSearchServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String criteria = request.getParameter("criteria").toString();
        String c1 = request.getParameter("colName1").toString();
        String c2 = request.getParameter("colName2").toString();
        String tbl = request.getParameter("tableName").toString();
        String h = "";
        String h1, h2 ;
        h1=" symbol, name, sector, price, price_earnings_ratio, dividend_yield, earnings_share, year_low, year_high, market_cap, " +
                "ebitda, price_sales_ratio, price_book_ratio, sec_filing_link \n";
        h2="symbol, name, sector \n";
        String statement = "EMPTY";

        if(tbl.equals("company")){
            h=h1;
            statement = "select * from companyInfo where " + c1 +" LIKE \'%"+ criteria + "%\' ;" ;
        }else if(tbl.equals("sector")){
            h=h2;
            statement = "select * from sectorInfo where " + c2 +" LIKE \'%"+ criteria + "%\' ;" ;
        } else {
            System.out.println("DO POST() Company Info SEARCH SERVLET DB ERROR");
        }

        ArrayList<String> list = null;
        try {
            list = searchDb(statement);
            list.add(0, h);
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }
        request.getSession().setAttribute("companyInfoResults", list);
        RequestDispatcher rd = request.getRequestDispatcher("/DB_Search_Functions/CompanyInfoSearch.jsp");
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
