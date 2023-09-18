<%@ page import="java.util.ArrayList" %> ><%--
  Created by IntelliJ IDEA.
  User: pezol
  Date: 4/13/2023
  Time: 12:42 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Business Section</title>
    <%@ include file="../View-JSP/styles-header.jsp" %>
</head>

<body class="bg-dark">
<div id="page-container">
    <div class="row" >
        <div class="container w-75" id="content-wrap" >

            <h3 class="text-center m-3 noYoverflow text-light text-uppercase font-weight-bold">
                Search By Business Section </h3>
            <hr>
            <br>
            <div>


                <div class="container searchContainer">
                    <div class="search card card-body">

                        <form action="${pageContext.request.contextPath}/SearchBusinessDatabaseServlet"  method="post">

                            <fieldset class="form-group text-secondary">
                                <label>Search Parameters: </label> <input type="text"
                                                                          class="form-control"
                                                                          name="criteria" placeholder="Enter some text">
                            </fieldset>

                            <fieldset class="form-group d-flex justify-content-start" >
                            <label class="mx-3">1. Select a Business Section: </label>
                                <select name="tableName" class="mx-3">
                                    <option value="tax">Tax Info</option>
                                    <option value="returns">Historical Returns</option>
                                    <option value="employment">Employment Info</option>
                                </select>
                            </fieldset>
                            <hr>

                            <label class="mx-3">2. Select a Corresponding set of values: </label>
                            <br> <br>


                            <div class="form-group d-flex justify-content-start pl-5" >
                                <label> Tax Info Option: </label>
                                <fieldset>
                                    <select name="tableName1" class="mx-3" >
                                        <option value="IndustryEmpDataUS">IndustryEmpDataUS</option>
                                        <option value="IndustryEmpDataChina">IndustryEmpDataChina</option>
                                        <option value="IndustryEmpDataEurope">IndustryEmpDataEurope</option>
                                        <option value="IndustryEmpDataIndia">IndustryEmpDataIndia</option>
                                    </select>
                                </fieldset>

                                <fieldset>
                                    <select name="colName1" id="colName1" class="mx-3">
                                        <option value="IndustryName">Industry Name</option>
                                        <option value="NumberOfFirms">Number of Firms</option>
                                        <option value="NumberOfEmployees">Number of Employees</option>
                                        <option value="MarketCapitalization">Market Capitalization</option>
                                        <option value="Revenues">Revenues</option>
                                        <option value="MktCapPerEmployee">Market Cap per Employee</option>
                                        <option value="RevenuesPerEmployee">Revenues per Employee</option>
                                        <option value="StockBasedCompensation">Stock-based Compensation</option>
                                        <option value="StockBasedCompensationAsPercentageOfRevenue">
                                            Stock-based Compensation as % of Revenue</option>
                                    </select>
                                </fieldset>
                            </div>

<%-- ****************************************************************************************************--%>

                            <div class="form-group d-flex justify-content-start pl-5" >
                                <label> Historical Returns Option: </label>
                                <fieldset>
                                    <select name="tableName2" class="mx-3" >
                                        <option value="AnnualInvestmentReturns">AnnualInvestmentReturns</option>
                                        <option value="valHundo">Value of 100$ Invested in 1928</option>
                                        <option value="AnnualRealReturns">AnnualRealReturns</option>
                                        <option value="AnnualRiskPremium">AnnualRiskPremium</option>
                                    </select>
                                </fieldset>

                                <fieldset>
                                    <select name="colName2" id="colName2" class="mx-3">
                                        <option value="Year">Year</option>
                                        <option value="SP500">S&P 500</option>
                                        <option value="ThreeMonthTBill">3-Month Treasury Bill</option>
                                        <option value="USTBond">US Treasury Bond</option>
                                        <option value="BaaCorporateBond">Baa Corporate Bond</option>
                                        <option value="RealEstate">Real Estate</option>
                                        <option value="Gold">Gold</option>
                                    </select>
                                </fieldset>
                            </div>

<%-- ****************************************************************************************************--%>

                            <div class="form-group d-flex justify-content-start pl-5" >
                                <label> Employment Info Option: </label>
                                <fieldset>
                                    <select name="tableName3" class="mx-3" >
                                        <option value="US_Tax">US_Tax</option>
                                        <option value="Europe_Tax">Europe_Tax</option>
                                        <option value="China_Tax">China_Tax</option>
                                        <option value="India_Tax">India_Tax</option>
                                    </select>
                                </fieldset>

                                <fieldset>
                                    <select name="colName3" id="colName3" class="mx-3">
                                        <option value="industry_name">Industry Name</option>
                                        <option value="number_of_firms">Number of Firms</option>
                                        <option value="total_taxable_income">Total Taxable Income</option>
                                        <option value="total_taxes_paid_accrual">Total Taxes Paid Accrual</option>
                                        <option value="total_cash_taxes_paid">Total Cash Taxes Paid</option>
                                        <option value="cash_taxes_accrual_ratio">Cash Taxes Accrual Ratio</option>
                                        <option value="EFF_TAX_RATE_all_companies">Effective Tax Rate (All Companies)</option>
                                        <option value="EFF_TAX_RATE_forProfit_companies">Effective Tax Rate (For-Profit Companies)</option>
                                        <option value="EFF_TAX_RATE_aggregate">Effective Tax Rate (Aggregate)</option>
                                        <option value="CASH_TAX_RATE_forProfit_companies">Cash Tax Rate (For-Profit Companies)</option>
                                        <option value="CASH_TAX_RATE_aggregate">Cash Tax Rate (Aggregate)</option>
                                    </select>
                                </fieldset>
                            </div>


<%-- ****************************************************************************************************--%>


                            <div class="d-flex justify-content-between mx-5">
                                <input class="btn btn-info" type = "submit" value = "Search" />
                                <a class="text-info" href="<%=request.getContextPath()%>/index.jsp">Return to Home</a>
                            </div>

                        </form>
                        <br><br>
                        <label>Results:</label>
                        <hr>
                        <div class="results">

                        <% ArrayList<String> list = null; int i = 0;
                        if(session.getAttribute("businessResults") != null) {
                            list = (ArrayList<String>) session.getAttribute("businessResults");
                            list.add( 1, "Your search returned " + (list.size()-1) +" results. " );

                        } if(list != null) { %>
                            <h3 class="noYoverflow"><%= list.get(1) %></h3>
                            <table class="table table-bordered">
                            <thead>
                                <tr>
                                    <% String[] ar= list.get(0).split(",");  for(String f : ar){ %>
                                        <th>
                                             <%= f %>
                                        </th>
                                    <% } %>
                                </tr>
                            </thead>
                            <tbody>
                           <%  i=2; list.remove(0); list.remove(0);
                                for(String str : list){ %>
                                <tr>
                                    <% String[] arr= str.split(",");  for(String f : arr){ %>
                                        <td>
                                            <%= f %>
                                        </td>
                                    <% } %>
                                </tr>
                            <% ++i; } %>


                        <% } %>
                                </tbody>

                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <%@include file="../Components/footer.jsp" %>

</div>
</div>
</body>
</html>
